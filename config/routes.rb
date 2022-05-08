Rails.application.routes.draw do



  
# ユーザー用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
#管理者用
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

#共通トップページ
root 'homes#top'



#管理者
namespace :admin do
  resources :users, only: [:index, :show, :edit]
  resources :brands, only: [:index, :create]

  end

 namespace :public do
    get 'items/index'
    get 'items/show'
    get 'items/edit'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
