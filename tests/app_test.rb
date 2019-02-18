#!/usr/bin/env ruby
ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'test/unit'
require 'rack/test'

set :environment, :test

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    # retreive class name containing Sinatra app
    Rack::Builder.parse_file("config.ru").first
  end

  def test_it_says_hello_world_root
    get '/'
    assert last_response.ok?
    assert_equal "Hello, world!\n", last_response.body
  end

  def test_it_says_hello_world_w_hello
    get '/hello'
    assert last_response.ok?
    assert_equal "Hello, world!\n", last_response.body
  end

  def test_it_says_hello_to_a_person
    name = "Simon"
    get "hello/#{name}"
    assert last_response.ok?
    assert last_response.body.include?(name)
  end
end