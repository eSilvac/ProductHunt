Rails.application.routes.draw do
	root 'products#index'

	get 'login' => 'session#new'
	post 'login' => 'session#create'
	delete 'logout' => 'session#destroy'

  	resources :users, only: [:new, :create]
	resources :products do
		resource :vote, only: [:create, :destroy]
		resources :comments, only: [:create]
	end


end
