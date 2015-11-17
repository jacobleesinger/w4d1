class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, :user_id, presence: true
  validates :user_id, uniqueness: true
  validates :email, uniqueness: {scope: :user_id}

  belongs_to(
    :owner,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )
end
