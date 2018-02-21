require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/film.rb'
require './lib/customer.rb'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'blockbuster'})
