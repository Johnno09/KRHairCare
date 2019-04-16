class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    serialize :image, JSON
    belongs_to :user, optional: true
    
    validates :item, :brand, :price, :hair_type, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed. "}
  validates :item, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed. "}
  validates :price, length: { maximum: 7 }

  BRAND = %w{ Kerastase Kevin_Murphy Alfaparf }
end
