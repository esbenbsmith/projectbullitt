Rails.application.routes.draw do

  root 'welcome#index'

  get '/about', to: 'welcome#show'

  resources :users, except: [:new, :show, :index]
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show', as: 'profile'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :npos do 
    resources :tasks
    resources :projects, only: [:index]
  end
  get '/npoform', to: 'npos#new'
  get '/npoindex', to: 'npos#index'

  resources :tasks, only: [:index]

  resources :projects, only: [:create, :show, :edit, :update]
end


#        Prefix Verb   URI Pattern                            Controller#Action
#          root GET    /                                      welcome#index
#         about GET    /about(.:format)                       welcome#show
#         users POST   /users(.:format)                       users#create
#     edit_user GET    /users/:id/edit(.:format)              users#edit
#          user PATCH  /users/:id(.:format)                   users#update
#               PUT    /users/:id(.:format)                   users#update
#               DELETE /users/:id(.:format)                   users#destroy
#        signup GET    /signup(.:format)                      users#new
#       profile GET    /users/:id(.:format)                   users#show
#      sessions POST   /sessions(.:format)                    sessions#create
#         login GET    /login(.:format)                       sessions#new
#        logout GET    /logout(.:format)                      sessions#destroy
#     npo_tasks GET    /npos/:npo_id/tasks(.:format)          tasks#index
#               POST   /npos/:npo_id/tasks(.:format)          tasks#create
#  new_npo_task GET    /npos/:npo_id/tasks/new(.:format)      tasks#new
# edit_npo_task GET    /npos/:npo_id/tasks/:id/edit(.:format) tasks#edit
#      npo_task GET    /npos/:npo_id/tasks/:id(.:format)      tasks#show
#               PATCH  /npos/:npo_id/tasks/:id(.:format)      tasks#update
#               PUT    /npos/:npo_id/tasks/:id(.:format)      tasks#update
#               DELETE /npos/:npo_id/tasks/:id(.:format)      tasks#destroy
#  npo_projects GET    /npos/:npo_id/projects(.:format)       projects#index
#          npos GET    /npos(.:format)                        npos#index
#               POST   /npos(.:format)                        npos#create
#       new_npo GET    /npos/new(.:format)                    npos#new
#      edit_npo GET    /npos/:id/edit(.:format)               npos#edit
#           npo GET    /npos/:id(.:format)                    npos#show
#               PATCH  /npos/:id(.:format)                    npos#update
#               PUT    /npos/:id(.:format)                    npos#update
#               DELETE /npos/:id(.:format)                    npos#destroy
#       npoform GET    /npoform(.:format)                     npos#new
#      npoindex GET    /npoindex(.:format)                    npos#index
#         tasks GET    /tasks(.:format)                       tasks#index
#      projects POST   /projects(.:format)                    projects#create
#  edit_project GET    /projects/:id/edit(.:format)           projects#edit
#       project GET    /projects/:id(.:format)                projects#show
#               PATCH  /projects/:id(.:format)                projects#update
#               PUT    /projects/:id(.:format)                projects#update