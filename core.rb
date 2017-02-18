load 'setlistfm.rb'
require 'net/https'
require 'uri'
#...


#read a resource from a REST url
def main
	puts 'try it'
	apiKey = 'APIKEY'
	url = URI.parse("https://api.setlist.fm/rest/0.1/artist/65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab.json?key="+apiKey)

	request = Net::HTTP::Get.new(url.request_uri)

	http = Net::HTTP.new(url.host, url.port)
	http.use_ssl = true if url.scheme == 'https'
	#set up additional http stuff...
	res = http.start do |ht|
	  ht.request(request)
	end

	#result = Setlist.from_json(JSON.parse(res.body)
	result = JSON.parse(res.body)

	puts result

end

main

#handle the result as needed...
