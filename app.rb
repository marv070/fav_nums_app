require 'sinatra'
require_relative "coin_converter.rb"
get '/' do 
	erb :whats_your_name
end

post '/name' do
	name = params[:input_name]
	redirect '/age?input_name=' + name

end

get '/age' do
	name = params[:input_name].capitalize
	 erb :get_age, :locals => {:name => name}

end

post '/age' do
	age = params[:age]
	name = params[:input_name]

	redirect '/fav_nums?input_name=' + name + '&age=' + age
end

get '/fav_nums' do
	age = params[:age]
	name = params[:input_name]

	erb :fav_nums, :locals => {:name => name, :age => age}

end

post '/fav_nums' do
	age = params[:age]
	name = params[:input_name]
	favnum1 = params[:num1]
	favnum2 = params[:num2]
	favnum3 = params[:num3]

	 redirect '/change?input_name=' + name + '&age=' + age + '&num1=' + favnum1 + '&num2=' + favnum2 + '&num3=' + favnum3
	#{}"fav nums are #{favnum1} and #{favnum2} and #{favnum3}"
end


get '/change' do
	age = params[:age]
	name = params[:input_name]
	favnum1 = params[:num1].to_i
	favnum2 = params[:num2].to_i
	favnum3 = params[:num3].to_i
	sum = favnum3 + favnum1 + favnum2

	erb :change, :locals => {:name => name, :age => age, :favnum1 => favnum1,
							 :favnum2 => favnum2, 
							 :favnum3 => favnum3, :sum => sum }

end


post '/change' do
	name = params[:input_name]
	input_amount_to_be_reduced = params[:jingle].to_i
	coins = change(input_amount_to_be_reduced )
	stuff = hashconverter(coins)
	
	# "Thank you #{name}, you have deposited #{stuff}"
	erb :change_returned, :locals => {:name => name, :stuff => stuff, :input_amount_to_be_reduced => input_amount_to_be_reduced }
end






