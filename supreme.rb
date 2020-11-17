require "selenium-webdriver"
require 'byebug'

 keys = {
  "product_url": "",
  "name": "",
  "email": "",
  "phone_number": "",
  "street_address": "",
  "zip_code": "",
  "city": "",
  "card_cvv": "",
  "card_number": ""
}


def order(keys)
  t1 = Time.now
  driver = Selenium::WebDriver.for :chrome
  driver.get(keys[:product_url])
  
  # driver.find_element_by_name('commit').click()
  driver.find_element(xpath:'//*[@id="add-remove-buttons"]/input').click()
 
  sleep(0.5)

  checkout_element = driver.find_element(class:'checkout')
  checkout_element.click()

  # fill out checkout screen fields
  driver.find_element(xpath:'//*[@id="order_billing_name"]').send_keys(keys[:name])
  
  driver.find_element(xpath:'//*[@id="order_email"]').send_keys(keys[:email])
  
  driver.find_element(xpath:'//*[@id="order_tel"]').send_keys(keys[:phone_number])
  
  driver.find_element(xpath:'//*[@id="bo"]').send_keys(keys[:street_address])
  
  driver.find_element(xpath:'//*[@id="order_billing_zip"]').send_keys(keys[:zip_code])
  
  # driver.find_element(xpath:'//*[@id="order_billing_city"]').send_keys(keys[:city])
  
  # date for credit card
  driver.find_element(xpath:'//*[@id="credit_card_month"]/option[9]').click()
  driver.find_element(xpath:'//*[@id="credit_card_year"]/option[4]').click()
  
  driver.find_element(xpath:'//*[@id="orcer"]').send_keys(keys[:card_cvv])
  driver.find_element(xpath:'//*[@id="rnsnckrn"]').send_keys(keys[:card_number])

  
  #terms and conditions
  driver.find_element(xpath:'//*[@id="cart-cc"]/fieldset/p/label/div/ins').click()
  #process payment
  sleep(0.5)
  driver.find_element(xpath:'//*[@id="pay"]/input').click()
  t2 = Time.now
  delta = t2 - t1
  # prints how long it took to run
  print delta
  #byebug needed so it wont close and you can do captha
  byebug
end


order(keys)

