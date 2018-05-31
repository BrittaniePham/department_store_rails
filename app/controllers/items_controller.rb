class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index #is this necessary?
    @items = @department.items
  end

  def show #is this necessary?
  end

  def new
    @item = Item.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @item = @department.items.create(item_params)

    if @item.save
      redirect_to department_items_path(@department)
    else
      render :form
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [@department, @item]
    else
      render :form
    end
  end

  def destroy
    @item.destroy
    redirect_to department_items_path(@department)
  end

  private
    def set_item #is this necessary?
      @item = Item.find(params[:id])
    end

    def set_department
      @department = Department.find(params[:department_id])
    end

    def item_params
      params.require(:item).permit(:name, :price)
    end
end
