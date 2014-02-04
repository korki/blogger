class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :load_sidebar

  # def load_sidebar
  #   @sidebar_options = []
  #   @sidebar_options << (link_to 'new author', new_author_path)
  # end

end
