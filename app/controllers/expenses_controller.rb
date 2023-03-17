class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def show
    @expense = Expense.find(params[:id])
    render json: @expense
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      render json: @expense, status: :created
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end

