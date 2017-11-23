require 'open-uri'
require 'nokogiri'

class WebScrapper

	def get_url
		url = "https://bikroy.com/bn/ads/bangladesh/electronics?page=2"
	end

	def get_data
		document = open(get_url)
		content = document.read
		Nokogiri::HTML(content)
	end

	def listing
		get_data.css('.ui-panel-content').css('.row').css('.ui-item')
	end

	def items
		listing.each do |row|
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
	end

end
