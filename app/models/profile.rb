class Profile < ApplicationRecord
  belongs_to :author

  def post_list
    byebug
  end
end
