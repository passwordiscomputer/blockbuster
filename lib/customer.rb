class Customer
 attr_accessor(:name, :rental_id, :phone)
 attr_reader(:customer_id)

 def initialize(attributes)
   @name = attributes.fetch(:name)
   @phone = attributes.fetch(:phone)
   @rental_id = attributes.fetch(:rental_id)
   @customer_id = attributes.fetch(:customer_id)
 end

  def self.all
    returned_customers = DB.exec("SELECT * FROM customer;")
    customers = []
    returned_customers.each() do |customer|
      customer_id = customer.fetch("customer_id").to_i()
      rental_id = customer.fetch("rental_id").to_i()
      name = list.fetch("name")
      phone = list.fetch("phone")
      customers.push(Customer.new({:customer_id => customer_id, :name => name, :rental_id => rental_id, :phone => phone}))
      end
    customers
  end

 def save
   DB.exec("INSERT INTO customer (name, rental_id) VALUES ('#{@name}', '#{@rental_id}');")
   result = DB.exec("SELECT customer_id FROM customer WHERE name = '#{@name}' AND phone = '#{@phone}';")
   @customer_id = result[0].fetch('customer_id').to_i
 end

 def ==(another_customer)
   self.customer_id.==(another_customer.customer_id).&(self.name.==(another_customer.name)).&(self.phone.==(another_customer.phone))
 end

 def self.find(id)
   Customer.all.each do |customer|
     if customer.customer_id.==(id)
       return customer
     end
   end
 end
end
