#!/usr/bin/env ruby

require 'sinatra'


set :bind, '0.0.0.0'
set :port, 1234
set :public_folder, '/tmp/capybara'

get '/' do
  file = `ls /tmp/capybara/*.png | tail -n1`.chomp
  time = file.match(/screenshot_(.*)\.\d*\.png/)[1]
  "<h1>#{time}</h1>" +
  "<img src='/#{file.split("/").last}'>"
end

