class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
    campers = Camper.all
    render json: campers, each_serializer: nil, status: :ok
    end

    def show
    camper = Camper.find(params[:id])
    render json: camper, status: :ok
    end

    # def index
        
    # end

    private

    def render_not_found
        render json: {error: "Camper not found"}
    end

    def camper_params
        params.permit(:name, :age)
    end
end
