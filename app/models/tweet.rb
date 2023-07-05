class Tweet < ApplicationRecord
  validates :title, presence: true
  validates :text,  presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション

  # imageも空で投稿できないように追記
  validates :text, :image, presence: true

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Tweet.all
    end
  end
end
