class ProductsController < ApplicationController
  	before_action :private_access, execpt: [:index, :show]

  	def index
  		@products = Product.all
  	end

    def new
  		@product = Product.new
    end

    def create
	  	@products = Product.new(product_params)
	  	if @products.save
	  		redirect_to products_path, notice: "Producto bien publicado"
	  	else
	  		render :new
	  	end
 	end

 	def show
 		@product = Product.find(params[:id])
 	end

 	def edit
 		@product = Product.find(params[:id])
 	end

 	def update
 		@product = Product.find(params[:id])
 		if @product.update(product_params)
 			redirect_to products_path, notice: "Producto modificado"
 		else
 			render :edit
 		end
 	end

 	def destroy
		product = Product.find(params[:id])
		product.destroy
		redirect_to products_path, notice: "Producto Eliminado"		
 	end

	private
	  	def product_params
	  		params.require(:product).permit(:name, :url, :description)
	  	end
end
