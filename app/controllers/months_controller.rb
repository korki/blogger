class MonthsController < ApplicationController
  before_filter :require_login, only: [:destroy]  
  
  def index
    @articles = Article.all

    @month = @articles.map  do | article|
          article.created_at.strftime('%B')
    end.uniq 
  end

  def show
    @tag = Tag.find(params[:id])
  end  

end
