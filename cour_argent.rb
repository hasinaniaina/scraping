require 'open-uri'
require 'nokogiri'
def cour
	price_tab = []
	name_tab = []
	compteur_price = 0
	compteur_name = 0
	cour = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	cour.css('a.price').each do |price|
		price_tab[compteur_price] = price.text
		compteur_price += 1
	end
	
	cour.css('td.no-wrap.currency-name a.currency-name-container.link-secondary').each do |names|
		name_tab[compteur_name] = names.text
		compteur_name += 1
	end

	money = name_tab.zip(price_tab).to_h
	puts money
end
cour