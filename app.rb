require 'rubygems'
require 'sinatra'
require 'active_record'
require "sinatra/reloader"

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "",
  :database => "development"
)

class Job < ActiveRecord::Base
  self.table_name = 'delayed_jobs'
end

class App < Sinatra::Application
end

get '/' do
  erb :index
end

get '/handler/:id' do
	@job = Job.find(params[:id])
	erb :handler
end
