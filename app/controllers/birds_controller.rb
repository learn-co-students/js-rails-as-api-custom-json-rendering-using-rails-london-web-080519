class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species, ]
  end

  def show 
    bird = Bird.find(params[:id])
    render json: bird, only: [:id, :name, :species ]
    end

end