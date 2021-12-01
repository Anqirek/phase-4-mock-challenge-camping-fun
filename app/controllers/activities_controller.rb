class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        activities = Activity.all
        render json: activities, status: :ok
        end
    
        # def show
        # activity = Camper.find(activity_params)
        # render json: activity, status: :ok
        # end
    
        def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
        end
    
        private

        def render_not_found
            render json: {error: "Activity not found"}, status: :not_found
        end
    
        def find_activity
            Activity.find(params[:id])
        end

        def activity_params
            params.permit(:name, :difficulty)
        end
end
