class ProductsController < ApplicationController
  def index
    @products = Product.all

    @products = @products.where('LOWER(title) LIKE ?', "%#{params[:name].downcase}%") if params[:name].present?
    @products = @products.where(category: params[:category]) if params[:category].present?
    if params[:sort_option] == 'low_to_high'
      @products = @products.order(price: :asc)
    end
    if params[:sort_option] == 'high_to_low'
      @products = @products.order(price: :desc)
    end

    if params[:min_price].present? && params[:max_price].present?
      @products = @products.where(price: params[:min_price].to_f..params[:max_price].to_f)
    elsif params[:min_price].present?
      @products = @products.where("price >= ?", params[:min_price].to_f)
    elsif params[:max_price].present?
      @products = @products.where("price <= ?", params[:max_price].to_f)
    end

    if params[:min_rating].present?
      @products = @products.where("rating >= ?", params[:min_rating].to_f)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
