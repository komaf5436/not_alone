Rails.application.routes.draw do
  
  # ユーザー用
  # URL/users/sign_in...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: "homes#top"
    get 'about' => "homes#about", as: 'about'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts
  end

  # 管理者用
  # URL/admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :users, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
