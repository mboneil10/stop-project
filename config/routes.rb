Rails.application.routes.draw do
  root 'bus_stops#index'

  devise_for :users
  as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    put 'users', to: 'devise/registrations#update', as: :user_registration           
  end
  scope :admin do
    resources :users, except: :show
  end

  resources :bus_stops, except: :show do
    collection do
      post :autocomplete
      get  :by_route
      post :id_search
      post :name_search
    end
  end
end
