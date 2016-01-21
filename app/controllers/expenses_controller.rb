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
    if params[:concept].present? && params[:category_id].present?
      @expenses = Expense.where("concept LIKE ? AND category_id = ?", "%#{params[:concept]}%",params[:category_id]).order("date DESC")
    elsif params[:concept].present? && !params[:category_id].present?
      @expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%").order("date DESC")
    elsif !params[:concept].present? && params[:category_id].present?
      @expenses = Expense.where("category_id = ?", params[:category_id]).order("date DESC")
    else
      @expenses = Expense.order("date DESC")
    end     
  end
end
