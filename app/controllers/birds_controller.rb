class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    #note the above has only added so you only have to display details you want to show
  
    #render json: birds, except: [:created_at, :updated_at]
    # the adverse of the above - all EXCEPT
  end

  def show
    bird = Bird.find_by(id: params[:id])
    #render everything that is attached to bird
    #render json: bird

    #create a new hash of specific attributes you want to render
    #render json: {id: bird.id, name: bird.name, species: bird.species }
    
    #another way to write the above - returns a NEW hash with only keys that are passed in 
    #render json: bird.slice(:id, :name, :species)

    #the below to give a message if not found
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else 
      render json: { message: 'Bird not found' }
    end

  end

end