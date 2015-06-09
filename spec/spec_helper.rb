ENV['RACK_ENV'] = 'test'

require('spec_helper')
require('capybara/rspec')
require('./app')

require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Card.all().each() do |card|
      card.destroy()
    end
  end
end
