# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kaminari_route_prefix/version'

Gem::Specification.new do |spec|
  spec.name          = "kaminari_route_prefix"
  spec.version       = KaminariRoutePrefix::VERSION
  spec.authors       = ["Chris Beer"]
  spec.email         = ["cabeer@stanford.edu"]

  spec.summary       = %q{Monkey-patch kaminari to work well with Rails engines}
  spec.description   = %q{Upstream pull request: https://github.com/amatsuda/kaminari/pull/636}
  spec.homepage      = "https://github.com/cbeer/kaminari_route_prefix"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'kaminari', '~> 1.0'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails", "~> 3.0"
  spec.add_development_dependency "railties"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "database_cleaner"
end
