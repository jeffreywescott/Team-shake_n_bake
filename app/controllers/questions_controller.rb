class QuestionsController < ApplicationController
  def index
  	@questions = Question.all
  end

  def new
 		if logged_in?
  		@question = Question.new
  	else
  		redirect_to sessions_path
  	end
  end

  def create
  	question = Question.new(params[:question])
  	if question.save
  		redirect_to question_path(question)
  	else
  		redirect_to new_question_path
  	end
  end

  def show
  	@question = Question.find(params[:id])
  end
end
