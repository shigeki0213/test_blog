class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = Post.find(params[:post_id]).comments.new(params[:comment])
		if @comment.save
			redirect_to post_path(@post)
		else
			render :template => 'posts/show'
		end
	end
	
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to posts_path
	end
end
