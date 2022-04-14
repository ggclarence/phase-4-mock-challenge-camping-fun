class ActivitiesController < ApplicationController


    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity =  Activity.find_by(id:params[:id])
        if activity
        activity.destroy
        head :no_content
        else
            render json: {error: "Activity not found"}, status:404
        end
        
    end

end
