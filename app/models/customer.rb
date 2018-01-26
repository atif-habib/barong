class Customer < ApplicationRecord
  has_many :documents, dependent: :destroy
  accepts_nested_attributes_for :documents, allow_destroy: true
end

# == Schema Information
# Schema version: 20180124190951
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  dob        :date
#  address    :string(255)
#  postcode   :string(255)
#  city       :string(255)
#  country    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
