class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  #new CREATE/ loads new form
  get '/recipes/new' do
    erb :new
  end

  #index/ loads ALL recipes/ READ
  get '/recipes' do
  @recipes = Recipe.all
    erb :index
  end

  #show/loads the show page/READ
  get'/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #edit/loads the edit/UPDATE
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch'/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  #belogs to new POST/ CREATE/ creates a recipe
  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect '/recipes'

  end

end
