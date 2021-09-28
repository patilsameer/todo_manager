Rails.application.routes.draw do
  get "todos", to: "todos#index"
  get "todos/create", to: "todos#create"
  get "todos/:id", to: "todos#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
