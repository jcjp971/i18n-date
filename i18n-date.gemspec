# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "i18n/date/version"

Gem::Specification.new do |spec|
  spec.name          = "i18n-date"
  spec.version       = I18n::Date::VERSION
  spec.authors       = ["Tobias Haagen Michaelsen"]
  spec.email         = ["tobias.michaelsen@karnovgroup.com"]

  spec.summary       = "I18n aware date parsing"
  spec.description   = <<-EOS.strip
    Parse local date formats using I18n info that Rails prescribes
  EOS
  spec.homepage      = "https://github.com/karnov/i18n-date"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] + %w(LICENSE.txt README.md)
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rails-i18n"
  spec.add_development_dependency "rubocop"
end
