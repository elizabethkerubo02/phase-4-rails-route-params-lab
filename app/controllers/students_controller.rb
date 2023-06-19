class StudentsController < ApplicationController

  def index
    
    query = params[:query]
    if query.present?
      @students = Student.where("first_name LIKE ? OR last_name LIKE ?", "%#{query}%", "%#{query}%")
    else
      @students = Student.all
    end

    render json: @students
    
  end

  def show
    student_by_id = Student.find(params[:id])
    render json: student_by_id

  end

end
