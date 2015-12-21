require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

#save the brands available in the store 
brands = Hash.new

# For each product in the data set:
    products_hash["items"].each do |toy|
    
      if(!brands.has_key?(toy["brand"].to_sym))
      #store the brands
      brands.store(toy["brand"].to_sym,1)
      end

      # Print the name of the toy
      puts "Name: #{toy["title"]}"
      # Print the retail price of the toy
      puts "Retail Price: #{toy["full-price"]}"
      count=0
      sales=0
        toy["purchases"].each do |purchase|
            count+=1
            sales+=purchase["price"]
        end
      # Calculate and print the total number of purchases
      puts "Number of item sold: #{count}"
      # Calcalate and print the total amount of sales
      puts "Sum of sales: #{sales}"
      # Calculate and print the average price the toy sold for
      average_price=sales/count
      puts "Average price: #{average_price}"
      # Calculate and print the average discount based off the average sales price
      average_discount=toy["full-price"].to_f - average_price
      puts "Average Discount: #{average_discount}"
      puts
    end


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts


# For each brand in the data set:
  brands.each_key do |brand| 
  # Print the name of the brand
  puts "Brand: #{brand}"
  stock = 0
  brand_count = 0
  price = 0
  revenue = 0
    products_hash["items"].each do |toy|
        
        if((toy["brand"].to_sym)==brand)
            stock+=toy["stock"]      #calculate the stock
            brand_count+=1           #keep track of toys of same brand to calculate average
            price+=toy["full-price"].to_i

            toy["purchases"].each do |purchase|
                revenue+=purchase["price"]
            end
        end
    end
  #print the stock
  puts "Stock: #{stock}"
  # Calculate and print the average price of the brand's toys
  puts "Average price: #{(price/brand_count).round(2)}"
  # Calculate and print the total revenue of all the brand's toy sales combined
  puts "Revenue: #{revenue.round(2)}"
  puts
  end
