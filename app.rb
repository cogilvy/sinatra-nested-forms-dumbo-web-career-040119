require './environment'

module FormsLab
  class App < Sinatra::Base

    get ('/') {
      erb :root
    }

    get ('/new') {
      erb :'pirates/new'
    }

    post ('/pirates') {
      @name = params[:pirate][:name]
      @height = params[:pirate][:height]
      @weight = params[:pirate][:weight]

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      Ship.all
      erb :'pirates/show'
    }

  end
end
