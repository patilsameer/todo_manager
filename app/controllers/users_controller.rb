class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        #render plain: "Hello, this is /todos!"
        render plain: User.order(:name).map{ |user| user.to_pleasant_string }.join("\n")
    end
   
    def show
        id=params[:id]
        #render plain: "The id you wanted to render was #{id}"
        user=User.find(id)
        render plain: user.to_pleasant_string
    end

    def create
        name=params[:name]
        email=params[:email]
        password=params[:password]
        new_user=User.create!(
            name: name,
            email: email,
            password: password,
        )
        response_text = "created new user with id=#{new_user.id}"
        render plain: response_text
    end

    def login
        email=params[:email]
        password=params[:password]
        #if User.find_by_name(email).
        if User.exists?(email: email,password: password)
             render plain: "true"
        else
            render plain: "false"
        end
        #if user.password=password
        #    render plain: "true" 
        #else
        #    render plain: "false"        
        #end
    end
    #def update
    #    id=params[:id]
    #    completed=params[:completed]
    #    todo=Todo.find(id)
    #    todo.completed=completed
    #    todo.save!

    #    render plain: "Updated todo completed status of #{id} to #{completed}"
    #end
end