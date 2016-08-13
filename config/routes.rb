Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get    'update', to: 'users#update'
  get    'edit'  , to: 'user#edit'
  resources :users
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :users do
   member do
     get 'followings'
     get 'followers'
   end
 end
end