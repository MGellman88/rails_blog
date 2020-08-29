class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
        @articles = Article.all 
    end

    def show
        @articles = Article.find(params[:id]) 
    end

    def new
        @articles = Article.new 
    end

    def create
        @articles = Article.new(article_params)
        @articles.save

        redirect_to articles_path(@articles)
    end

    def destroy
        @articles = Article.find(params[:id]) 
        @articles.destroy
        
        redirect_to articles_path
    end

end
