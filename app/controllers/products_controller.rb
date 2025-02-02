class ProductsController < ApplicationController
    
    # def initialize (description, inventory)
    #     @description = description
    #     @inventory = inventory 
    # end

    def index
        @products = Product.all

    end
  
    def description
        product = Product.find(params[:id])
        render plain: product.description
    end

    def inventory
        product = Product.find(params[:id])
        if product.inventory != 0 
            render plain: "true"
        else
            render plain: "false"
        end  
    end

    def new
       @product = Product.new 
    end

    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to products_path
    end


    private

    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
