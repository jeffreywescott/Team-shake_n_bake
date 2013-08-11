class VotesController < ApplicationController

  def create
    user = User.find(session[:id])
    vote_request = params[:vote]

    if params.has_key?('question_id')
      question = Question.find(params[:question_id])
      vote = Vote.create_vote(question, user, vote_request)
      vote_count_up = question.votes.where(vote: 'up').count
      if vote_count_up == 0
        render json: { vote: vote, count: (question.votes.where(vote: 'dwn').count) * -1 }
      else
        render json: { vote: vote, count: vote_count_up }
      end
    elsif params.has_key?('answer_id')
      answer = Answer.find(params[:answer_id])
      vote = Vote.create_vote(answer, user, vote_request)
      vote_count_up = answer.votes.where(vote: 'up').count
      if vote_count_up == 0
        render json: { vote: vote, count: (answer.votes.where(vote: 'dwn').count) * -1 }
      else
        render json: { vote: vote, count: vote_count_up }
      end
    else
      render json: { error: 'something went terribly wrong' }
    end
  end
end

