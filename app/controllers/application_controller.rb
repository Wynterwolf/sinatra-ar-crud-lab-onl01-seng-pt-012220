
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    Post.create(parms)
    redirect '/articles'
  end
  
  get '/articles' do
    @articles = articles.all 
    erb :index
  end
  
  get '/articles/:id' do
    @article = Articles.find(params["id"])
    erb :show 
  end
end
