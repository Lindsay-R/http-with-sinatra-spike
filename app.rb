require "sinatra/base"


class MyApp < Sinatra::Application


  def initialize
    super
    @items = ["item1", "item2", "item3"]
  end

  get "/" do
    erb :root
  end

  get '/item' do
    erb :item, :locals => {:items => @items}
  end

  get '/item/item_new' do
    erb :item_new, :locals => {:items => @items}
  end

  get '/item/:identifier' do
    identifier = params[:identifier].to_i
    "You found: #{@items[identifier]}"
  end

  post '/form' do
    input = params[:name]
    puts input
  end

  run! if app_file == $0
end
