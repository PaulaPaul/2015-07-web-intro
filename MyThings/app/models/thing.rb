class Thing < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
end
