class CartsController < ApplicationController
  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_outlines = Outline.find(cart_ids)
    @total_price = current_user.cart_total_price
  end

  def add
    $redis.sadd current_user_cart, params[:outline_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:outline_id]
    render json: current_user.cart_count, status: 200
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end
end
