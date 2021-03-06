class TrainersController < ApplicationController

    def index
        trainers = Trainer.all
        render json: trainers, only: [:id, :name], :include => {
            :pokemons => {:only => [:nickname, :species, :trainer_id, :id]}
    }
    end

    def show
        trainer = Trainer.find(params[:id])
        render json: trainer, only: [:id, :name, :species], :include => {
            :pokemons => {:only => [:nickname, :species, :trainer_id, :id]}
    }
    end

end
