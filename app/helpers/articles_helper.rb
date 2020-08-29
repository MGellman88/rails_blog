module ArticlesHelper
    
    def article_params
        params.require(:article).permit(:id, :title, :body)
    end

end
