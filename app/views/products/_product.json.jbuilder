json.extract! product, :id, :brand, :hair_type, :description, :item, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
