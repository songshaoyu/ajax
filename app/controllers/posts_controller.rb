class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :destroy]
  def index
    @posts = Post.all.order('id DESC')
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save

    redirect_to posts_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

  
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
