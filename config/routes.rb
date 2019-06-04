Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/health", to: "health#health"
  resources :post, only: [:index, :show]
end
