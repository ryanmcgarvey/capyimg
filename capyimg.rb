#!/usr/bin/env ruby

require 'sinatra'


set :bind, '0.0.0.0'
set :port, 1234
set :public_folder, '/tmp/capybara'

def formatted_time(time)
  time.strftime("%A, %m/%d/%Y %I:%M%p")
end
def image
  file = `ls /tmp/capybara/*.png | tail -n1`.chomp
  time = file.match(/screenshot_(.*)\.\d*\.png/)[1]
  time = Time.new(*time.split("-").map(&:to_i), "-04:00")

  "<h1>TAKEN: #{formatted_time(time)}</h1>" +
    "<h1> NOW:  #{formatted_time(Time.now.localtime("-04:00"))}</h1>" +
    "<img src='/#{file.split("/").last}'>"
rescue Exception => e
  "<p>#{e.message}</p>"
end

get '/' do
  image
end

