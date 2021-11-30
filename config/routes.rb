Rails.application.routes.draw do
  # route is going to be the http request (how the browser communicates)
    # and do crud actions in the browser 
  #will lead somewhere in the controller 
  # combo of url and http request

  # root 'controller#action' - changes home page to what you put inside the url pattern
    # root 'static#home' - shows default home page to specified one
  # resources :controller name - generate all the necessary actions and routes we need for particular conroller 
    # resources :contacts do
    
    # - with relationships with models you are going to embed two levels deep
        # resources :contacts do
        #resources :notes
        #end
  # bad
  # resources :contacts do  
  #   resources :notes do
  #     resources :comments
  #   end
  # end

  #best practice - two levels deep
   # resources :contacts do
        #resources :notes
        #end

  # resources :notes do 
  #   resources :comments 
  # end

  # custom routes - doing the routes by hand 
  # hhtpverb 'pattern', to 'controller#action'
  # get           Read 
  # post          Create
  # put / patch   Update
  # delete        Destroy
# get '/taco'
# get '/contacts', to: 'contacts#index'
# /subs/:id
# /subs/:parent_id
# pass in an id for the route to work
# subs/2

root 'subs#index'

resources :subs do 
  resources :topics
end

# bad 
# resources :subs do 
#   resources :topics do
#     resources :comments
#   end
# end
# resources :topics, only: [:index, :new] do
#   resources :comments
# end
resources :topics, except: [:index, :new, :create, :edit, :show, :update, :destroy] do
  resources :comments
end
end