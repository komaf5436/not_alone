Rails.application.routes.draw do

  # namespace :public do
    # get 'users/index'
    # get 'users/show'
    # get 'users/edit'
  # end
  
  # ユーザー用
  # URL/users/sign_in...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: "homes#top"
    get 'about' => "homes#about", as: 'about'
    resources :users, only: [:index, :show, :edit]
  end

  # 管理者用
  # URL/admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
