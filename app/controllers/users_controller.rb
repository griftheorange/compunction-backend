class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def login
        @user = User.find_by(id: params[:username])
        if @user
            if @user.password == params[:password]
                render json: @user
            else
                render json: {error: "Password Incorrect"}
            end
        else
            render json: {error: "No user matching that username"}
        end
    end

    def create
        @user = User.create(p)
        if @user.valid?
            render json: @user
        else
            render json: {error: @user.errors}
        end
    end

    private 

    def p
        params.permit(:username, :password)
    end
end
