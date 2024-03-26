require 'httparty'
require 'json'

username = 'Danny080298'

response = HTTParty.get("https://api.github.com/users/#{username}/repos")


repositories = JSON.parse(response.body)

current_starred = repositories.max_by { |repo| repo['stargazers_count'] }

if current_starred
  puts "Most Starred Repository:"
  puts "Name: #{current_starred['name']}"
  puts "Description: #{current_starred['description']}"
  puts "Stars: #{current_starred['stargazers_count']}"
  puts "URL: #{current_starred['html_url']}"
else
  puts "No repositories found for user: #{username}"
end
