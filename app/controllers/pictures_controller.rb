class PicturesController < ApplicationController
  def index
      @pictures = Picture.all
  end

  def new
      @picture = Picture.new
  end
  
  def create
      @picture = Picture.new(picture_params)
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
      @pictute = Picture.params[:id]
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def confirm
      @picture = Picture.new(picture_params)
      render :new if @picture.invalid?
  end
  
  
  private
  
  def picture_params
      params.require(:picture).permit(:content,:image,:image_cache)
  end
end
