require "sinatra"

# Tried to move the Ruby here, and the program didn't recognize the 'local variable' params
#
# module Calculation
#   @result = (@amount / @gallons).round(2)
# end
#
# helpers Calculation

get "/" do
  erb :homepage
end

get "/calc" do
  erb :calculator
end

# before "/result" do
#   if params[:amount] == nil || params[:gallons] == nil
#     redirect to "/calc"
#   end
# end

get "/result" do
  @result = (params[:amount].to_f / params[:gallons].to_f).round(2)
  
  # @amount = params[:amount].to_f
  # @gallons = params[:gallons].to_f
  
  erb :result
end


