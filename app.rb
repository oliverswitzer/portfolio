require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #routes
    get '/' do
      erb :index
    end

    #helpers
    # helpers do
    #   def partial(file_name)
    #     erb file_name, :layout => false
    #   end
    # end

  end
end
