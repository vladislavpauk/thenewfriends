CarrierWave.configure do |config|
	if Rails.env.test? || Rails.env.cucumber?
		config.storage = :file
		config.enable_processing = false
		config.root = "#{Rails.root}/tmp"
	else
		config.fog_credentials = {
			provider: 'AWS',
			aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
			aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
			region: ENV['AWS_REGION']
		}
		config.fog_directory = ENV['AWS_S3_BUCKET']
		config.storage = :fog
	end

	config.cache_dir = "#{Rails.root}/tmp/uploads"
end