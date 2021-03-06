class PicturesController < ApplicationController
 before_action :set_picture, only: [:show, :edit, :update, :destroy]
 before_action :signed_in_user, only: [:new, :edit, :update, :create, :destroy, :pictures_edit]
  # GET /pictures
  # GET /pictures.json
  def index
    @category = Category.find_by(params[:id])
    if @category != nil
      @pictures = Picture.all
    else
      @pictures = @category_id.Picture
    end
  end


  def pictures_edit
    @pictures = Picture.all
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to pictures_edit_path, notice: 'Picture was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to pictures_edit_path, notice: 'Picture was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_edit_path, notice: 'Picture was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :category_id, :description, :author_id, :photo)
    end
end
