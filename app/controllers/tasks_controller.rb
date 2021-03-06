class TasksController < ApplicationController
  protect_from_forgery :except => [:destroy]
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url, notice: "タスク 「#{task.title}」 を登録しました "
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク 「#{task.title}」を更新しました"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク 「#{task.title}」を削除しました。"
  end

  private
    
    def task_params
      params.require(:task).permit(:title, :description)
    end
end