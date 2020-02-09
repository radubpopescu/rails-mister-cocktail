Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :new, :create, :show] do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
  resources :reviews, only: [:destroy]
end
