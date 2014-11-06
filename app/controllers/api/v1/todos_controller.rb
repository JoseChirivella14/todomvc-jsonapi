class API::V1::TodosController < ActionController::API
  before_filter :todo_params, only: [:new, :show, :update, :destroy]
  def index
    render json: Todo.all
  end

  def new
    @todos = Todo.new
  end

  def create
    @todo = Todo.create!(todo_params)
    render json: [@todos], status: 201, location: api_v1_todo_url(@todo)
  end

  def update
    @todo = Todo.find(params[:id])
    render json: @todo, status: 201
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: @vote, status: :destroy
  end

  private

  def todo_params
    params.permit(:title, :completed, :order)
  end
end
