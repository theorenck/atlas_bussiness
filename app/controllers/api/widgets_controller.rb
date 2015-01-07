class API::WidgetsController < ApplicationController
   
  before_action :set_widget, only: [:show, :update, :destroy]

  # GET /widgets
  def index
    @widgets = Widget.all
    render json: @widgets
  end

  # GET /widgets/1
  def show
    render json: @widget
  end

  # POST /widgets
  def create
    @widget = Widget.new(widget_params)

    if @widget.save
      render json: @widget
    else
      render json: @widget.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /widgets/1
  def update
    if @widget.update(widget_params)
      render json: @widget
    else
      render json: @widget.errors, status: :unprocessable_entity
    end
  end

  # DELETE /widgets/1
  def destroy
    @widget.destroy
    head :no_content
  end

  private
    def set_widget
      @widget = Widget.find(params[:id])
    end

    def widget_params
      params.require(:widget).permit(
        :color, 
        :position,
        :size,
        :name,
        :description,
        :customized,
        :dashboard_id,
        :indicator_id,
        :widget_type_id
      )
    end
end