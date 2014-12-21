# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pickme/version'

Gem::Specification.new do |spec|
  spec.name          = "pickme"
  spec.version       = Pickme::VERSION
  spec.authors       = ["Wayne Robinson"]
  spec.email         = ["wayne.robinson@gmail.com"]
  spec.summary       = %q{Helper for interacting with FilePicker.io's service.}
  spec.description   = %q{Goal to be as plain-ruby as possible and to work independently of Rails.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
