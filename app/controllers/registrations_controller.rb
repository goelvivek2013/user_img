class RegistrationsController < Devise::RegistrationsController
	
	def edit
		@images = resource.images
		super
	end
	def update
		@images = resource.images
		super
	end
	protected
	def after_update_path_for(resource)
		edit_registration_path(resource)
	end

		def sign_up_params
			params.require(:user).permit(:email, :password, :password_confirmation,
			 images_attributes: [:avatar, :id])
		end

	def account_update_params
		params.require(:user).permit(:email, :password, :password_confirmation, :current_password,
								  images_attributes: [:id, :avatar])
	end
end
