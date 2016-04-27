class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  before_filter :require_login, except: [:index, :show]

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash.notice = "Tag '#{@tag.name}' Deleted!"
    redirect_to tags_path
  end

end
