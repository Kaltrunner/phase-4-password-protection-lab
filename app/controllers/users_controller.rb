class UsersController < ApplicationController

        def create
          user = User.create!(user_params)
          if user.valid?
            render json: user, status: :created
          else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def show
            user = User.find_by(id: seesion[:user_id])
            render json: user
        end
      
        private

        def authorize
            render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user.id
        end
      
        def user_params
          params.permit(:username, :password, :password_confirmation)
        end
      

end
