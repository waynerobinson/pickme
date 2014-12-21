require "pickme/version"
require "pickme/config"
require "pickme/policy"

module Pickme
  SecretKeyMissing = Class.new(StandardError)

  def self.config
    @config ||= Config.new
  end

end
