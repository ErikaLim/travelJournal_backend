class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_param)
    post.save
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json:post
  end

  private

  def post_param
    params.require(:post).permit(:name, :description, :photo)
  end
end
