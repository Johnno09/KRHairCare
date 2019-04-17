class Product < ApplicationRecord
    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true
    has_many :line_items
    
    mount_uploader :image, ImageUploader
    serialize :image, JSON
    
    validates :item, :brand, :price, :hair_type, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed. "}
  validates :item, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed. "}
  validates :price, length: { maximum: 7 }

  BRAND = %w{ Kerastase Kevin_Murphy Alfaparf }
  
  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
  
end
