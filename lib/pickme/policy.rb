require 'base64'
require 'openssl'

module Pickme
  class Policy
    attr_accessor :expiry, :call, :handle, :maxsize, :minsize, :container, :path

    def initialize(options = {})
      [:expiry, :call, :handle, :maxsize, :minsize, :path].each do |input|
        send("#{input}=", options[input]) unless options[input].nil?
      end
    end

    def config
      {
        api_key: Pickme.config.api_key,
        path: path,
        container: container,
        maxsize: maxsize,
        policy: policy,
        signature: signature
      }
    end

    def policy
      @policy ||= Base64.urlsafe_encode64(json_policy)
    end

    def signature
      OpenSSL::HMAC.hexdigest('sha256', Pickme.config.secret_key, policy)
    end

    def apply(call = [:read, :convert], keys = ['policy', 'signature'])
      raise SecretKeyMissing if Pickme.config.secret_key.nil?
      self.call = call
      {
        keys[0] => policy,
        keys[1] => signature
      }
    end

    private

      def json_policy
        hash = { expiry: Pickme.config.expiry.call }

        [:expiry, :call, :handle, :maxsize, :minsize, :container, :path].each do |input|
          hash[input] = send(input) unless send(input).nil?
        end

        MultiJson.dump(hash)
      end
  end
end
