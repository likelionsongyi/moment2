Rails.application.routes.draw do

  root "posts#index"
  get 'posts/explore' => 'posts#explore' 
  get 'posts/intro'  => 'posts#intro'
  get 'posts/search' => 'posts#search'
  resources :posts, defaults: { format: 'js' }
  
  get 'profile/:user_id' => 'profile#index', as: 'profile_index'
  get 'profile/mypage/:user_id' => 'profile#mypage', as: 'mypage'
  get 'profile/:user_id/new' => 'profile#new'
  get 'profile/:user_id/album' => 'profile#album'
  get 'profile/:user_id/archive' => 'profile#archive'
  post 'profile/:user_id/create' => 'profile#create', as: 'create_profile'
  get 'profile/edit2/:id' =>  'profile#edit2', as: 'edit2_profile'
  post 'profile/update/:id' => 'profile#update'
  get 'profile/show/:id' => 'profile#show'
  post 'profile/delete/:id' => 'profile#delete', as: 'delete_profile'
  post 'profile/follow/:user_id' => 'profile#follow'
  post 'profile/unfollow/:user_id' => 'profile#unfollow'
  get 'profile/:user_id/ingame' => 'profile#ingame'
  get 'profile/:user_id/list' => 'profile#list'
  resources :profile
  
  get 'board/:id' => 'board#index'
  get 'board/:profile_id/new' => 'board#new'
  post 'board/:profile_id/create' => 'board#create', as: 'create_board'
  get 'board/edit/:id' => 'board#edit'
  post 'board/update/:id' => 'board#update'
  post 'board/:board_id/like', to: "likes#like_toggle", as: 'like_board'
  post 'board/comments/:id' => 'board#comments'
  post 'board/:board_id/comments_destroy/:comments_id' => 'board#comments_destroy'
  resources :board
  
  resources :categories, only: [:show]
  
  get 'info/new/:user_id' => 'info#new', as: 'new_info'
  post 'info/create' => 'info#create', as: 'create_info'
  get 'info/edit/:id' => 'info#edit', as: 'edit_info'
  post 'info/update/:id' => 'info#update', as: 'update_info'
  post 'info/follow/:category_id' => 'info#follow', as: 'follow_info'
  post 'info/unfollow/:category_id' => 'info#unfollow', as: 'unfollow_info'
  
  post 'plays/create/:user_id' => 'plays#create'
  
  resources :images
  # omniauth : for SNS(facebook) login
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
  
end