class Admin::UsersController < Admin::ApplicationController
	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update_attributes(update_params)
				format.html { redirect_to edit_admin_user_path(@user), notice: 'User was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def update_params
		params.require(:user).permit(
			:email,
			:is_admin,
			user_permission_attributes: [
				:id,
				:user_vk_contacts_files_create,
				:user_vk_contacts_files_read,
				:user_vk_contacts_files_update,
				:user_vk_contacts_files_delete
			],
			user_profile_attributes: [
				:first_name,
				:last_name,
				:about,
				:country,
				:city,
				:skype,
				:contact_phone,
				:contact_email,
				:vkontakte_id,
				:facebook_id,
				:twitter_id
			]
		)
	end
end