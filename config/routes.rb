Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end

  get ':user_name', to: 'profiles#show', as: :profile

  root 'posts#index'

  # New route underneath
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile


end
