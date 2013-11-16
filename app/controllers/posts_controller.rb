class PostsController < ApplicationController
	respond_to :html

	def new
	  @post = Post.new
	end

	def create
	  @post = Post.create(params[:post])
	  respond_with @post
	end

	def show
		@post = Post.find(params[:id])
	end
end