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
              redirect_to pictures_path,notice: 'Pictureを登録しました'
          else
              render :new, status: :unprocessable_entity
          end
      end
  end

  def show
      @pictute = Picture.params[:id]
  end

  def edit
      @pictute = Picture.params[:id]
  end
  
  def update
      @pictute = Picture.params[:id]
      if @picture.seave
          redirect_to pictures_path,notice: 'Pictureを編集しました'
      else
          render :edit, status: :unprocessable_entity
      end
  end
  
  def destroy
      @pictute = Picture.find(params[:id])
      @picture.destroy
      redirect_to pictures_path,notice: 'Pictureを削除しました'
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
