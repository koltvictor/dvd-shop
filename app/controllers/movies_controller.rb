class MoviesController < ApplicationController

    def index
        render json: Movie.all, status: :ok
    end

    def show
        movie = Movie.find_by(id: params[:id])
        if movie
            render json: movie, status: :ok
        else
            render json: {error: "Movie not found"}, status: :not_found
        end
    end

    def create
        render json: Movie.create(movie_params), status: :created
    end

    def update
        movie = Movie.find_by(id: params[:id])
        if movie
            movie.update(movie_params)
            render json: movie, status: :updated
        else
            render json: {error: "Movie not found"}, status: :not_found
        end
    end

    def destroy
        movie = Movie.find_by(id: params[:id])
        if movie
            movie.destroy
            head :no_content
        else
            render json: {error: "Movie not found"}, status: :not_found
        end
    end




    private

    def movie_params
        params.permit(:title, :year, :length, :description, :poster_url, :category, :director)
    end

end
