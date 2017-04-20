Rails.application.routes.draw do

  root 'sessions#new'

  # Sessions

  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'

  # User
  
  get 'users/index' => 'users#index', :as => 'user_index'

  get 'users/new' => 'users#new' , :as => 'user_new'

  post 'users/new' => 'users#create' , :as =>'user_create'

  get '/users/:id' => 'users#show', :as => 'user'

  get 'users/edit/:id' => 'users#edit', as: 'user_edit'

  patch 'users/update/:id', controller: 'users', action: 'update', as: 'user_update'

  get 'users/destroy/:id', controller: 'users', action: 'destroy', as: 'user_destroy'

  # Coordinator

  # Department Assistant

  # Administrative Assistant

  get 'administrative_assistants/registration_request' => 'administrative_assistants#registration_request', as: 'registration_request'

  get 'administrative_assistants/enable_registration/:id' => 'administrative_assistants#enable_registration', as: 'enable_registration'

  get 'administrative_assistants/decline_registration/:id' => 'administrative_assistants#decline_registration', as: 'decline_registration'

###

# Parsers
  post "/upload_buildings", controller: 'parsers', action: 'upload_buildings'
  post "/upload", controller: 'parsers', action: 'upload_rooms'
  post "/parsers", controller: 'parsers', action: 'index', :as => "index_parser"
  post "/upload_departament", controller: 'parsers', action: 'upload_departaments'
  post "/upload_courses", controller: 'parsers', action: 'upload_courses'
  post "/upload_disciplines", controller: 'parsers', action: 'upload_disciplines'
  resources :parsers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
