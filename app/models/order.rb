class Order < ActiveRecord::Base
  has_many :products, class_name: 'OrderProduct'

  accepts_nested_attributes_for :products
  validates :email, presence: true, format: /@/
  validates :phone, presence: true, format: { with: /\+\d{12}/, message: 'Example: +380XXXXXXXXX' }
  validates :address, presence: true
  before_save :cal_total

  private

  def cal_total
    # TODO; Sum order_products*quantity
  end
end
