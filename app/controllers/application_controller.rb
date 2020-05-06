
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
  
  post '/posts' do
    Post.create(parms)
    redirect '/posts'
  end
  
  get '/posts' do
    @posts = Post.all 
    erb :index
  end
  
  get '/articles/:id' do
    @article = Post.find(params["id"])
    erb :show 
  end
end
