Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # Gets resourceful routes (which map between HTTP verbs and URLs and controller actions)
  # By convention, each action also maps to particular CRUD operations in a database
  resources :artpieces

  # Routes for login/logout
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
