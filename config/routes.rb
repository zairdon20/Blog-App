Rails.application.routes.draw do
  devise_for :models
  devise_for :views
  root 'pages#home'
  devise_for :users
  root "home#index"
  root 'pages#home'
  resources :likes
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create]
  end

  root "users#index"
  root to: "home#index" 



  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
end
