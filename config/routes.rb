Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  get 'restaurants', to: 'restaurants#index', as: :restaurants
  get 'restaurants/:id', to: 'restaurants#show'
  get 'restaurants/new', to: 'restaurants#new', as: :restaurant_new
  post 'restaurants', to: 'restaurants#create'

  # crée des acces à reviews depuis restaurant/:id/...
  # rails comprend qu'au vu de la relation one to many entre restaurant et reviews, il doit
  # créer une url restaurant/:id/reviews/...
  Rails.application.routes.draw do
    resources :restaurants, only: [:index, :new, :create, :show] do
      resources :reviews, only: [:new, :create, :show]
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
