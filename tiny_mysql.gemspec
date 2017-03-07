# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiny_mysql/version'

Gem::Specification.new do |spec|
  spec.name          = "tiny_mysql"
  spec.version       = TinyMysql::VERSION
  spec.authors       = ["Genki Sugawara"]
  spec.email         = ["sugawara@cookpad.com"]

  spec.summary       = %q{Tiny MySQL clinet dependent on mysql command.}
  spec.description   = %q{Tiny MySQL clinet dependent on mysql command.}
  spec.homepage      = "https://github.com/winebarrel/tiny_mysql"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
