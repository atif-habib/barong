# frozen_string_literal: true

Rails.application.routes.draw do

  use_doorkeeper
  devise_for :accounts
  root to: 'web/index#index', as: :index

  resources :documents
  resources :profiles

  scope module: :web do
    resources :customers do
      member do
        resources :documents
      end
    end
    # Define public routes here.
  end

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :accounts
  end

  namespace :api do
    resources :account, to: 'accounts#show'
  end
end
