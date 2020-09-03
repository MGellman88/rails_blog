class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
        @articles = Article.all 
    end

    def show
        
        if Article.exists?(params[:id]) # this was originally only passing an integer as an argument, rather than the actual ID params we want, so I updated to pass params
            puts "this article exists"
            @articles = Article.find(params[:id])   #this was originally outside of the conditional, so the app was looking for the article before actually check if it existed or not
        else
            flash.notice = "That article does not exist"

            redirect_to articles_path(@articles)
        end
            
    end

    def new
        @articles = Article.new 
    end

    def create
        @articles = Article.new(article_params)
        @articles.save

        flash.notice = "Article '#{@articles.title}' Created!"

        redirect_to articles_path(@articles)
    end

    def destroy
        @articles = Article.find(params[:id]) 
        @articles.destroy

        flash.notice = "Article '#{@articles.title}' Deleted!"
        
        redirect_to articles_path
    end

    def edit
        @articles = Article.find(params[:id])
    end

    def update
        @articles = Article.find(params[:id])
        @articles.update(article_params)

        flash.notice = "Article '#{@articles.title}' Updated!"
      
        redirect_to articles_path(@articles)
    end

end
