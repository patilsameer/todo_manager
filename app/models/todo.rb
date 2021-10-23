class Todo < ActiveRecord::Base
    def to_pleasant_string
        is_completed = completed ? "[X]" : "[ ]"
        "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
    end

    def self.due_tomorrow
        Todo.all.where("due_date = ?",Date.tomorrow)
    end

    def self.overdue
        Todo.all.where("due_date < ?",Date.today)
    end 
end