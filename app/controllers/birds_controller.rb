class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
    ## behind the above easy syntax is below
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # render json: bird.slice(:id, :name, :species)
    ## render with custom error message
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end