# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    tasks = Task.all
    render status: :ok, json: { tasks: }
  end

  def create
    task = Task.new(task_params)
    task.save!
    render_notice(t("task.successfully_created"))
  end

  def task_params
    params.require(:task).permit(:title)
  end

  def show
    task = Task.find_by!(slug: params[:slug])
    render_json({ task: task })
  end
end
