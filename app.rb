require 'bundler'
require 'open-uri'
require 'nokogiri'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #routes
    get '/' do
      @download = open("http://allyourcodesarebelongtous.tumblr.com/api/read").read
      @xml = Nokogiri::XML(@download)
      @last_post = @xml.search("post regular-body")[0].children[0].text
      @last_post_title = @xml.search("post regular-title")[0].children.text
      erb :index
    end
  end
end
