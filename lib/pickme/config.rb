module Pickme
  class Config

    DEFAULT_EXPIRY_PERIOD = 10 * 60 # 10 minutes

    attr_accessor :api_key, :secret_key, :expiry

    def initialize
      @expiry = -> { (Time.now.utc + DEFAULT_EXPIRY_PERIOD).to_i }
    end

  end
end
