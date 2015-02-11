require "sinatra"

# Tried to move the Ruby here, and the program didn't recognize the 'local variable' params

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

###NOT WORKING: Does not redirect; leads to /result and shows @result as NaN###
# before "/result" do
#   if params[:amount] == nil # || params[:gallons] == nil
#     redirect to "/calc"
#   end
# end

get "/result" do
  @result = calculate(params[:amount], params[:gallons])
  
  # @amount = params[:amount].to_f
  # @gallons = params[:gallons].to_f
  
  erb :result
end


