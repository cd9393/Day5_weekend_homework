def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,value)
  pet_shop[:admin][:total_cash] += value
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets_sold)
  pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  breed_array = []
  pets_array = pet_shop[:pets]
  for pet in pets_array
    if pet[:breed] == breed
      breed_array << pet
    end
  end
  return breed_array
end

def find_pet_by_name(pet_shop, name)
  # pets_array = pet_shop[:pets]
  # breed_array= []
  for pet in pet_shop[:pets]
    if name == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  pets_array = pet_shop[:pets]
  for pet in pets_array
    if pet[:name] == name
      pets_array.delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, value)
  customer[:cash] -= value
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] < new_pet[:price]
    return false
  end
  return true
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet == nil
    return
  elsif customer_can_afford_pet(customer,pet) == false
    return
  end

  increase_pets_sold(pet_shop, 1)
  add_pet_to_customer(customer, pet)
  remove_customer_cash(customer, pet[:price])
  add_or_remove_cash(pet_shop, pet[:price])
end
