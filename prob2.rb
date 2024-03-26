require 'httparty'
require 'json'

quote = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
crypto_currencies = JSON.parse(quote.body)

data = crypto_currencies.sort_by { |crypto| -crypto['market_cap'] }

data.first(5).each do |crypto|
    puts "Name: #{crypto['name']}, Price: $#{crypto['current_price']}, Market Cap: $#{crypto['market_cap']}"
end

