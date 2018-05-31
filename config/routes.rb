Rails.application.routes.draw do
  root 'departments#index'

  resources :departments do
    resources :items
  end

  scope 'items/:item_id', as: 'item' do
    resources :comments
  end
end
