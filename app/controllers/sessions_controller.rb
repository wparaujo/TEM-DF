class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.authenticate(params[:username], params[:password])

        if user && user.account_status == true
            session[:remember_token] = user.id
            session[:user_id] = user.id
            redirect_to root_path, :notice => "Bemvindo ao TEM-DF! :D"
        else
            flash.now.alert = "Usuario ou senha invalidos"
            render "new"
        end
    end

    def destroy
        session[:remember_token] = nil
        session[:user_id] = nil
        redirect_to root_path, :notice => "Tchau! Volte sempre!:)"
    end
end
