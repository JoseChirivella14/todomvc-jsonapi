class API::V1::TodosController < ActionController::API
  before_filter :todo_params, only: [:new, :show, :update, :destroy]
  def index
    @todos = Todo.all
    render json: @todos
  end

  def new
    @todos = Todo.new
  end

  def show
    @todos = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo.as_json, status: :created, location: api_v1_todo_path(@todo)
    else
      render json: { errors: @todo.errors }, status: :bad_request
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo, status: :ok
    else
      render json: { errors: @voter.errors }, status: :bad_request
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: @vote, status: :destroy
  end

  private

  def todo_params
    params.permit(:title, :completed)
  end
end
