$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'byebug'
require 'kaminari_route_prefix'

require 'database_cleaner'

require 'active_record'
# Simulate a gem providing a subclass of ActiveRecord::Base before the Railtie is loaded.
require 'fake_gem'

require 'fake_app/rails_app'
require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end

DatabaseCleaner[:active_record].strategy = :transaction if defined? ActiveRecord
DatabaseCleaner[:mongoid].strategy = :truncation if defined? Mongoid

RSpec.configure do |config|
  config.before :suite do
    DatabaseCleaner.clean_with :truncation if defined? ActiveRecord
    DatabaseCleaner.clean_with :truncation if defined? Mongoid
  end
  config.before :each do
    DatabaseCleaner.start
  end
  config.after :each do
    DatabaseCleaner.clean
  end
end