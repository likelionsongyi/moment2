class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /posts
  # GET /posts.json
  
  def index
    @info  = Info.find_by(user_id: current_user.id)
    @following_user_profile_id = Profile.where(user_id: current_user.following_users.pluck("id")).ids
    @boards = Board.all.reverse
    @info  = Info.find_by(user_id: current_user.id)
    
    #@boards = Board.where(profile: @following_user_profile_id)
    #@all_boards = Board.where(profile_id: @following_user_board_id + current_user.profiles.pluck["id"])
    # User.find(current_user.id).following_users.includes(:profiles).collect{|u| u.profiles}.flatten
    respond_to do |format|
      format.html
      format.json
      if params[:search]
        @search_user = User.search(params[:search]).order("created_at DESC")
        puts @search_user
          format.js
      else
        @search_user = User.all.order('created_at DESC')
          format.js
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
   
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice:"게시물이 성공적으로 작성되었습니다."}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors , status: :unprocessable_entity }
      end
    end
  end


  
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
    
end
