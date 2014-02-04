require 'time'

class ArticlesController < ApplicationController

  include ArticlesHelper

  before_filter :require_login, except: [:index, :show, :popular]

  def index
    @articles = Article.all

    @month = @articles.map  do | article|
      article.created_at.strftime('%m')
    end.uniq 

    @list_name = "All Articles"

  end

  def show
    @article = Article.find(params[:id])
    @article.visit_article
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save!
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end  

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def show_by_month
    @month_articles = Article.where("strftime('%m', created_at) = ?", params[:month_name])
    render 'months/index.html.erb'
  end

  def popular
    @articles = Article.limit(3).order('view_count desc')
    @list_name = "Most popular Articles"
    render 'articles/index.html.erb'
  end

end
