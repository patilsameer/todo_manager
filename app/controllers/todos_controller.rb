class TodosController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        #render plain: "Hello, this is /todos!"
        #render plain: Todo.order(:due_date).map{ |todo| todo.to_pleasant_string }.join("\n")
        render "index"
    end
   
    def show
        id=params[:id]
        #render plain: "The id you wanted to render was #{id}"
        todo=Todo.find(id)
        render plain: todo.to_pleasant_string
    end

    def create
        todo_text=params[:todo_text]
        due_date=DateTime.parse(params[:due_date])
        new_todo=Todo.create!(
            todo_text:  todo_text,
            due_date:  due_date,
            completed:  false,
        )
        response_text = "created new todo with id=#{new_todo.id}"
        render plain: response_text
    end

    def update
        id=params[:id]
        completed=params[:completed]
        todo=Todo.find(id)
        todo.completed=completed
        todo.save!

        render plain: "Updated todo completed status of #{id} to #{completed}"
    end
end