class ImagesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]

	def create
		@user = current_user
		@image = current_user.images.create(image_params)
		redirect_to :back
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to :back
	end
	private

		def image_params
			params.require(:image).permit(:avatar)
		end
end
