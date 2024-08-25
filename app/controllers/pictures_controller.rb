class PicturesController < ApplicationController
  def index
  end

  def new
      @picture = Picture.new
  end
  
  def create
      @picture = Picture.new(picture_patams)
      if params[:back]
          render :new, status: :unprocessable_entity
      else
          if @picture.save
              redirect_to picture_path,notice: 'Pictureを登録しました'
          else
              render :new, status: :unprocessable_entity
          end
      end
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def confirm
  end
  
  
  private
  
  def picture_patams
      params.require(:picture).permit(:content,:image,:image_cache)
  end
end
