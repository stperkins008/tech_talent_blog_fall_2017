class CommentsController < ApplicationController

	before_action :set_comment, only: [:edit, :update, :destroy]

  def edit
  end

  def create
  	@comment = Comment.new(comment_params)
  	respond_to do |x|
  		if @comment.save
  			x.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment was created successfully"}
  		else
  			x.html {render :back, notice: "Comment failed to post"}
  		end
  	end
  end

  def update
  		respond_to do |x|
  			if @comment.update(comment_params)
  				x.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment was updated successfully"}
  			else
  				x.html { render :edit }
  			end
  		end

  end

  def destroy
  	@comment.destroy
  	respond_to do |x|
  		format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Your comment was destroyed!"}
  	end
  end

  private

  def set_comment
  	@comment = Comment.find(params[:id])
  end

  def comment_params 
  	params.require(:comment).permit(:author, :comment_entry, :blog_post_id)
  end

end
