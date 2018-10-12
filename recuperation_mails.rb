require 'open-uri'
require 'nokogiri'
def get_the_email_of_a_townhal_from_its_webpage(url,nom)
	ville_name = ['name']
	ville_email = ['email']
	compteur = 0
	tab_email = []
	url.each{|x|
		doc2 = Nokogiri::HTML(open(x))
		tab_email[compteur] = doc2.css('table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)')
		compteur += 1
	}
	puts tab_email
	# names = ville_name.zip(nom).to_h
	# emails = ville_email.zip(tab_email).to_h  
	# ville_name_email = names.merge!(emails) 
	# puts ville_name_email
end

def get_all_the_urls_of_val_doise_townhalls
	links = []
	compteur = 0
	nom = []
	doc2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc2.css('a.lientxt').each do |link|
		link = link['href'].gsub('./','')
		links[compteur] = "http://annuaire-des-mairies.com/#{link}"
		compteur += 1
	end
	doc2.css('a').each do |link|
		nom[compteur] = link.text
		compteur += 1
	end
	get_the_email_of_a_townhal_from_its_webpage(links,nom)
end
get_all_the_urls_of_val_doise_townhalls