require 'bundler'
require 'open-uri'
require 'nokogiri'
Bundler.require
require 'debugger'

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    
    #routes
    get '/' do
      @download = open("http://allyourcodesarebelongtous.tumblr.com/api/read").read
      @xml = Nokogiri::XML(@download)
      @last_post = @xml.search("post regular-body")[0].children[0].text.gsub("<p>", "").gsub("</p>", "")[0..1000] << "..."
      @last_post_url = @xml.search('post')[0].attributes["url"].value
      @last_post_title = @xml.search("post regular-title")[0].children.text  
      erb :index
    end
  end
end
