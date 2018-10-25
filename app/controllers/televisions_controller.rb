class TelevisionsController < ApplicationController
  before_action :set_television, only: [:show, :edit, :update, :destroy]

  # GET /televisions
  # GET /televisions.json
  def index
    args = {}
    args[:year] = params[:year] if params[:year].present?
    args[:display] = params[:display] if params[:display].present?
    args[:brand] = params[:brand] if params[:brand].present?
    args[:size] = params[:size] if params[:size].present?

    args[:price] = {}
    args[:price][:gte] = params[:price_from] if params[:price_from].present?
    args[:price][:lte] = params[:price_to] if params[:price_to].present?

    price_ranges = [{to: 500}, {from: 500, to: 1000}, {from: 1000, to: 2000}, {from: 2000}]
    @televisions = Television.search "*", where: args, aggs: {brand: {}, year: {}, size: {}, display: {}, price: { ranges: price_ranges }}
  end

  # GET /televisions/1
  # GET /televisions/1.json
  def show
  end

  # GET /televisions/new
  def new
    @television = Television.new
  end

  # GET /televisions/1/edit
  def edit
  end

  # POST /televisions
  # POST /televisions.json
  def create
    @television = Television.new(television_params)

    respond_to do |format|
      if @television.save
        format.html { redirect_to @television, notice: 'Television was successfully created.' }
        format.json { render :show, status: :created, location: @television }
      else
        format.html { render :new }
        format.json { render json: @television.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /televisions/1
  # PATCH/PUT /televisions/1.json
  def update
    respond_to do |format|
      if @television.update(television_params)
        format.html { redirect_to @television, notice: 'Television was successfully updated.' }
        format.json { render :show, status: :ok, location: @television }
      else
        format.html { render :edit }
        format.json { render json: @television.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /televisions/1
  # DELETE /televisions/1.json
  def destroy
    @television.destroy
    respond_to do |format|
      format.html { redirect_to televisions_url, notice: 'Television was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_television
      @television = Television.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def television_params
      params.require(:television).permit(:brand, :name, :display, :price, :size, :year)
    end
end
