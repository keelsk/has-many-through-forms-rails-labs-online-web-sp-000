class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |index, category_attributes|
      category = Category.find_or_create_by_name(category_attributes[:name])
    end
  end
end
