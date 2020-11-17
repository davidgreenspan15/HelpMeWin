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
  driver.get(keys[:product_url])
  
  sleep(0.5)
  # add to cart
  driver.find_element(xpath:'/html/body/div/div[1]/div/div[2]/div/div[1]/div[1]/div[1]/div/div/div/div/div[3]/div[5]/div/div[3]/div/div[2]/div[2]/div[1]/section/div[1]/div[3]/button').click()
  sleep(1.0)
  # checkout
  driver.find_element(xpath:'/html/body/div/div/div/div/div/div/div[1]/div/div[1]/div/div[2]/div/div/div/div/div[3]/div/div/div[2]/div[1]/div[2]/div/button[1]').click()
  sleep(1.0)
  # continue without account
  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[1]/div/div/div/div/div[3]/div/div[1]/div/section/section/div/button').click()
  sleep(1.3)
  #continue
  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div[3]/div/div/div[3]/button').click()
  
  sleep(2.0)

  # fill out checkout personall info screen fields
  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[1]/div[2]/input').send_keys(keys[:first_name])
  
  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[1]/div[3]/input').send_keys(keys[:last_name])

  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[2]/div[1]/input').send_keys(keys[:street_address])
  
  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[2]/div[3]/input').clear()

  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[2]/div[3]/input').send_keys(keys[:city])

  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[2]/div[4]/div[1]/div/select/option[31]').click()
  
  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[2]/div[4]/div[2]/div/input').clear()

  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[2]/div[4]/div[2]/div/input').send_keys(keys[:zip_code])

  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[1]/div[5]/div/input').send_keys(keys[:email])
  
  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[1]/div/div[1]/div[1]/div[4]/input').send_keys(keys[:phone_number])
  #continue to payment method
  driver.find_element(xpath:'/html/body/div/div/div[1]/div/div[1]/div[3]/div/div/div/div[3]/div[1]/div[2]/div/div/div/div[3]/div/div/div/div/div/form/div[2]/div[2]/button').click()
  sleep(2.0)
  driver.find_element(xpath:'/html/body/div[1]/div/div[1]/div/div[1]/div[3]/div/div/div/div[4]/div[1]/div[2]/div/div/div/div[3]/div[2]/div/div/div/div[2]/div/div/div/form/div[2]/div[1]/div/div[3]/input').send_keys(keys[:card_number])
  driver.find_element(xpath:'/html/body/div[1]/div/div[1]/div/div[1]/div[3]/div/div/div/div[4]/div[1]/div[2]/div/div/div/div[3]/div[2]/div/div/div/div[2]/div/div/div/form/div[2]/div[1]/div/div[4]/div[1]/div/div/div/div[1]/span/div/select/option[10]').click()
  driver.find_element(xpath:'/html/body/div[1]/div/div[1]/div/div[1]/div[3]/div/div/div/div[4]/div[1]/div[2]/div/div/div/div[3]/div[2]/div/div/div/div[2]/div/div/div/form/div[2]/div[1]/div/div[4]/div[1]/div/div/div/div[2]/span/div/select/option[5]').click()
  driver.find_element(xpath:'/html/body/div[1]/div/div[1]/div/div[1]/div[3]/div/div/div/div[4]/div[1]/div[2]/div/div/div/div[3]/div[2]/div/div/div/div[2]/div/div/div/form/div[2]/div[1]/div/div[4]/div[2]/div/div/div/input').send_keys(keys[:card_cvv])
  sleep(0.5)
  # review order
  driver.find_element(xpath:'/html/body/div[1]/div/div[1]/div/div[1]/div[3]/div/div/div/div[4]/div[1]/div[2]/div/div/div/div[3]/div[2]/div/div/div/div[2]/div/div/div/form/div[3]/div/button').click()


  
  #process payment
  sleep(1.5)
  ### Leave commented until purchase
  # driver.find_element(xpath:'/html/body/div[1]/div/div[1]/div/div[1]/div[3]/div/div/div[2]/div[1]/div[2]/div/div/div[2]/div/form/div/button').click()
  t2 = Time.now
  delta = t2 - t1
  print delta
  #byebug needed so it wont close before purchase complete
  byebug
end


order(keys)

