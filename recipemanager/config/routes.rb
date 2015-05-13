Rails.application.routes.draw do
  root 'pages#index' 

  get '/home', to: 'pages#index'
end
