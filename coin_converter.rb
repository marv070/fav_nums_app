def change(cents_received)
	coins = {penny: 0, nickle: 0, dime: 0, quarter: 0, half_dollar: 0, silver_dollar: 0}
	coin_value = {silver_dollar: 100, half_dollar: 50, quarter: 25, dime: 10, nickle: 5, penny: 1}
	

	coin_value.each do | coin, value|
      while
      	value <= cents_received
      	coins[coin] += 1
      	cents_received = cents_received - value
      end
    end
 coins
end




def hashconverter(coins)
	change = ""
	coins.each do |key, value|
		if value > 0
		change << " " + value.to_s + " " + key.to_s+ "'s"
	    end
		
	end
	change
end
