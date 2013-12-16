require 'bundler'
require 'open-uri'
require 'nokogiri'
require 'debugger'
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
      erb :index
    end

    # helpers do
    #   def last_tumblr_post
    #     debugger
    #     @download = open("http://allyourcodesarebelongtous.tumblr.com/api/read").read
    #     @xml = Nokogiri::XML(@download)
    #     @last_post = @xml.search("post regular-body")[0].children[0].text
    #     return @last_post
    #   end
    # end

  end
end
