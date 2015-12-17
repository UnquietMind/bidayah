# == Schema Information
#
# Table name: rewards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reward < ActiveRecord::Base
    belongs_to :project
    
    validates :description, :value, :estimated_delivery, presence: true
    validates :value, numericality: { greater_than_or_equal_to: 0 }
    validates :number_available, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
    validates :estimated_delivery, date: { after: Proc.new { Date.today } }
end
