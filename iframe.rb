#!/usr/bin/env ruby

require 'sinatra'


set :bind, '0.0.0.0'
set :port, 12345

def iframe
  <<-heredoc
    <iframe src="http://nycvotes.dev:3000/campaigns/1/contributions/iframe/new" width='800px' height='600px' frameborder="0"></iframe>
  heredoc
end


get '/' do
iframe
end

