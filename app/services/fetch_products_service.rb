require 'net/http'
require 'json'

class FetchProductsService 
    API_URL = "https://fakestoreapi.com/products"

    def self.call
        uri = URI(API_URL)
        response = Net::HTTP.get(uri)
        products = JSON.parse(response)

        products.each do |product_data|
            Product.create(
                title: product_data['title'],
                price: product_data['price'],
                description: product_data['description'],
                category: product_data['category'],
                image: product_data['image'],
                rating: product_data.dig('rating', 'rate'),
                count: product_data.dig('rating', 'count'),
            )
        end
    end
end