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
first_die = rand(1..6)
second_die = rand(1..6)
sum = first_die + second_die

@outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten)
end

get("/dice/1/20") do
  @die = rand(1..20)
  @outcome = "You rolled a #{@die}."

erb(:one_twenty)

end

get("/dice/5/4") do
  a = rand(1..4)
  b = rand(1..4)
  c = rand(1..4)
  d = rand(1..4)
  e = rand(1..4)
  sum = a + b + c + d + e

  @outcome = "You rolled a #{a}, #{b}, #{c}, #{d}, and #{e} for a total of #{sum}."

  erb(:five_four)

end
