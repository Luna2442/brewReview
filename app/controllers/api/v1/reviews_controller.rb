require 'pry'

class Api::V1::ReviewsController < ApplicationController

  #needs user authentication feature from devise
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    data = JSON.parse(request.body.read)
    if current_user
      new_review = Review.create(
        rating: data["rating"],
        header: data["header"],
        body: data["body"],
        brewpub_id: data["brewpub_id"],
        user_id: current_user.id, #needs user authentication feature from devise
        vote_count: 0
      )
      render json: new_review
    else
      render json: nil
    end
  end

end
