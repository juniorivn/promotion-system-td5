Rails.application.routes.draw do
  root 'home#index' 
  resources :promotions, only: %i[index show new create edit update] do
    post 'generate_coupons', on: :member
  end

  resources :coupons, only: [] do
    post 'inactivate', on: :member
  end
  # post '/promotions/:id/generate', to 'promotions#generate_coupons'
end