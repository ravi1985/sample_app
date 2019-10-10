Rails.application.routes.draw do
  resources :users
  get 'users/new'
  root 'static_pages#home'
  match '/signup', to: 'users#new', via: 'get'
  # get 'static_pages/home'
  get 'static_pages/help'
  get "static_pages/about"
  get "static_pages/contact"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
