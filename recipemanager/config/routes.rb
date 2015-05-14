Rails.application.routes.draw do
  root 'pages#index' 

  get '/home', to: 'pages#index'

  resources :recipes do 
    member do 
      post 'like' 
    end 
  end   


end
