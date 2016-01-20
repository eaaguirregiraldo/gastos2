# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  category_id :integer
#  date        :date
#  concept     :string
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ExpensesController < ApplicationController
  def index
    if params[:concept]
      @expenses = Expense.where(concept: params[:concept]).order("date DESC")      
    else
      @expenses = Expense.order("date DESC")
    end     
  end
end
