class API::V1::TodosController < ActionController::API

  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    @todos = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @voter.as_json, status: :created, location: api_v1_todo_path(@todo)
    else
      render json: { errors: @todo.errors }, status: :bad_request
    end
  end

  def updated
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
