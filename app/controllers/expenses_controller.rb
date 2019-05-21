class ExpensesController < ApplicationController
  def index
    @expense = Expense.order(created_at: :desc)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new()
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(params[:expense])
    if @expense.save
      redirect_to @expense, notice: '記録できました'
    else
      render 'new'
    end
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.assign_attributes(params[:expense])
      if @expense.save
        redirect_to @expense, notice: '更新しました'
      else
        render 'new'
      end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to :expenses, notice: '削除しました'
  end
end
