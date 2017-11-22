require 'open-uri'
require 'nokogiri'

url = "https://bikroy.com/bn/ads/bangladesh/electronics"

document = open(url)
content = document.read
parsed_content = Nokogiri::HTML(content)

parsed_content.css('.ui-panel-content').css('.row').css('.ui-item').each do |row|
	title = row.css('.item-title').inner_text
	location = row.css('.item-area').inner_text
	category = row.css('.item-cat').inner_text
	price = row.css('.item-info').inner_text
	puts title
	puts location
	puts category
	puts price
	puts '------------------------'
end