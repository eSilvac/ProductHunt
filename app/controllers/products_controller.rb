class ProductsController < ApplicationController
  	def index
  		@products = Product.all
  	end
    def new
  		@products = Product.new
    end
    def create
	  	@products = Product.new(product_params)
	  	if @products.save
	  		redirect_to products_path, notice: "Producto bien publicado"
	  	else
	  		render :new
	  	end
 	end

	private
	  	def product_params
	  		params.require(:product).permit(:name, :url, :description)
	  	end
end
