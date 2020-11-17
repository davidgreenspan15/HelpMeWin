require "selenium-webdriver"
require 'byebug'

 keys = {
  "product_url": "",
  'first_name': "",
  "last_name": "",
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
  # Sends Chrome to Url
  driver.get(keys[:product_url])
  
  sleep(0.5)
  # Adds to Cart
  driver.find_element(class:'fulfillment-add-to-cart-button').click()
  sleep(4.0)
  # Goes to Cart
  driver.find_element(class:'go-to-cart-button').click()
  sleep(3.0)
  # Select Deliver
  driver.find_element(xpath:'/html/body/div[1]/main/div/div[2]/div[1]/div/div/span/div/div[2]/div[1]/section[1]/div[4]/ul/li[1]/section/div[2]/div[2]/form/div[2]/fieldset/div[2]/div[1]/div/div/div/input').click()
  sleep(1.0)
  # Continue to Checkout
  driver.find_element(class:'checkout-buttons__checkout').click()
  # Checkout as guest
  sleep(4.0)
  driver.find_element(xpath:'/html/body/div[1]/div/section/main/div[4]/div/div[2]/button').click()
  sleep(5.0)
  # Fill out checkout screen fields
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[1]/div/div/section/div[2]/div[1]/section/section/div[1]/label/div/input').send_keys(keys[:first_name])
  
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[1]/div/div/section/div[2]/div[1]/section/section/div[2]/label/div/input').send_keys(keys[:last_name])

  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[1]/div/div/section/div[2]/div[1]/section/section/div[3]/label/div[2]/div/div/input').send_keys(keys[:street_address])
  
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[1]/div/div/section/div[2]/div[1]/section/section/div[5]/div/div[1]/label/div/input').send_keys(keys[:city])

  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[1]/div/div/section/div[2]/div[1]/section/section/div[5]/div/div[2]/label/div/div/select/option[36]').click()
  
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[1]/div/div/section/div[2]/div[1]/section/section/div[6]/div/div[1]/label/div/input').send_keys(keys[:zip_code])

  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[2]/div/section/div[2]/label/div/input').send_keys(keys[:email])
  
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[2]/div/section/div[3]/label/div/input').send_keys(keys[:phone_number])
  # Continue to payement section
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[2]/form/section/div/div[2]/div/div/button').click()
  
  sleep(3.0)
  # Fill out payment info
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[3]/div/section/div[1]/div/section/div[1]/div/input').send_keys(keys[:card_number])
  driver.find_element(xpath:'//html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[3]/div/section/div[1]/div/section/div[2]/div[1]/div/div[1]/label/div/div/select/option[10]').click()
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[3]/div/section/div[1]/div/section/div[2]/div[1]/div/div[2]/label/div/div/select/option[4]').click()
  driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[3]/div/section/div[1]/div/section/div[2]/div[2]/div/div[2]/div/input').send_keys(keys[:card_cvv])
  sleep(0.5)
  

  
  #COMPLETE PAYMENT BELOW
  sleep(1.5)
  ### Leave Commented until purchase
  ## Will confirm purchase
  # driver.find_element(xpath:'/html/body/div[1]/div[2]/div/div[2]/div[1]/div[1]/main/div[2]/div[3]/div/section/div[4]/button').click()
  t2 = Time.now
  delta = t2 - t1
  # prints how long it took to run
  print delta
  # byebug is here so that program doesnt close before purchase is completed. After purchase completed, either continue through byebug or exit terminal.
  byebug
end


order(keys)

