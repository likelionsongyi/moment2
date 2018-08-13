class BoardController < ApplicationController
    
    def index
        @bo = Board.find(params[:id])
        @pro = @bo.profile_id
    end
    
    def comments
        @bo = Board.find(params[:id])
        @bo.comments.create(body:params[:body])
        redirect_to :back
    end
    
    def new
        @board = Board.new
        @temp = params[:profile_id]
    end
 
    def create
        @board = Board.new
        @board.profile_id = params[:profile_id]
        @board.title = params[:board][:title]
        @board.content = params[:board][:content]
        @board.save
        @pro = @board.profile_id
        redirect_to "/profile/#{@pro}"
    end
    
    def edit
        @board = Board.find(params[:id])
    end
    
    def update
        @board = Board.find(params[:id])
        @board.title = params[:board][:title]
        @board.content = params[:board][:content]
        @board.save
        @pro = @board.profile_id
        redirect_to "/profile/#{@pro}"
    end

    def destroy
        @board = Board.find(params[:id])
        @board.destroy
        redirect_to(:back)
    end

# ---------------

    def lol
        #모든 롤 카테고리의 포스트를 보여주는 뷰
    end
    

    def maple
        #모든 메이플 카테고리의 포스트를 보여주는 뷰
    end
    
end
