class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    posts = Post.all
    render json: posts, include: ['author', 'author.name']
  end

  def show
    post = Post.find(params[:id])
    render json: post, include: ['author', 'author.name']
  end

  def summary
    post = Post.find(params[:id])
    render json: post, serializer: PostSummarySerializer
  end

  def summaries
    posts = Post.all
    render json: posts, each_serializer: PostSummarySerializer
  end

  private

  def render_not_found_response
    render json: { error: "Post not found" }, status: :not_found
  end

end
