# /dice.rb
# https://checkins.firstdraft.com/lessons/103-our-first-sinatra-app

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

# What happened BTS?
# GET / HTTP/1.1
# Host: raghubetina-curly-computing-machine-www7pwj47h59gw-4567.preview.app.github.dev

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  @rolls = []

  2.times do
    die = rand(1..6)
  
    @rolls.push(die)
end

erb(:two_six)
end

get("/dice/2/10") do
    @rolls = []
  
  2.times do
    die = rand(1..10)
  
    @rolls.push(die)
  end

  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = []
  
  1.times do
    die = rand(1..20)
  
    @rolls.push(die)
end

erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []
  
  5.times do
    die = rand(1..4)
  
    @rolls.push(die)
end

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)
    
    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
