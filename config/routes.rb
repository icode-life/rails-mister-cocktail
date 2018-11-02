Rails.application.routes.draw do
  # get 'doses/index'
  # get 'doses/create'
  # get 'doses/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cocktails, except: [:destroy, :edit, :update] do
    resources :doses, only: [:new, :create, :destroy]
  end
end
