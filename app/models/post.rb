class Post < ApplicationRecord
  #validate title to be atleast 5 letters and maximum 100
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  #validate body to be atleast 10 letters and maximum 300
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }
  #title must not have numbers only letter a-z allowed 
  validates :title, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  # title must be in all caps
  before_validation :make_title_uppercase

  #body and titel must be unique and not same as previous post
  validates :title, uniqueness: true
  validates :body, uniqueness: true

  private
  def make_title_uppercase
    self.title = self.title.upcase
  end
end
