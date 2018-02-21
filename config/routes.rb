Rails.application.routes.draw do
  # GET "restaurants"

  # GET "restaurants/new"
  # POST "restaurants"

  # GET "restaurants/38"

  # GET "restaurants/38/reviews/new"
  # POST "restaurants/38/reviews"
  resources :restaurants, only: [:index, :new, :create, :show] do

    resources :reviews, only: [:new, :create] do
    end
  end
end
