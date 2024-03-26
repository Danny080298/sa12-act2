require 'httparty'
require 'json'

area = 'Europe' 
location = 'London'

local = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")

if local.code == 200
    data = JSON.parse(local.body)
    if data['datetime']
        datetime = Time.parse(data['datetime'])
        puts "The current time in #{area}/#{location} is #{datetime}"
    end
else
    puts "Failed to fetch time data for #{area}/#{location}. Please ensure the timezone is correct."
end
