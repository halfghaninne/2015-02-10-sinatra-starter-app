require "sinatra"

module Calculation
  def calculate(amount, gallons)
    (amount.to_f / gallons.to_f).round(2)
  end
end

helpers Calculation

get "/" do
  erb :homepage
end

get "/calc" do
  erb :calculator
end

before "/result" do
  if @amount == nil
    redirect to "/calc"
  elsif params[:gallons] == nil
    redirect to "/calc"
  end
end

get "/result" do
  @result = calculate(params[:amount], params[:gallons])
  
  # @amount = params[:amount].to_f
  # @gallons = params[:gallons].to_f
  
  erb :result
end


