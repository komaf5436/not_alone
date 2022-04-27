class Tag < ApplicationRecord
  
  has_many :post_tags, foreign_key: 'tag_id', dependent: :destroy 
  # タグは複数の投稿を持つそれは、post_tagsを通じて参照できる
  has_many :posts, through: :post_tags
  
  validates :name, presence: true, uniqueness: true
  
end
