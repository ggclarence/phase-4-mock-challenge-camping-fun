class CampersController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def index
        campers = Camper.all
        render json: campers
    end

    def show
        campers = Camper.find_by(id: params[:id])
        if campers
            render json: campers, serializer: CamperShowSerializer
        else
            render json: {error:"Camper not found"}, status:404
        end
    end


    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, status: 201
        else
            render json: { "errors": camper.errors.full_messages }, status:422
        end
    end


    # def create 
    #     camper = Camper.create(params.permit(:name, :age))
    # if camper.valid?
    #     render json: camper, status: :created
    # else
    #     render json: { "errors": camper.errors.full_messages }, status: 422
    # end
    # end





    private

    def camper_params
        params.permit(:name,:age)
    end

    def render_unprocessable_entity_response(exception)
        render json: {errors:exception}, status: 422
    end
end
