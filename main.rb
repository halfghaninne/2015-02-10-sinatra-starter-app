require "sinatra"

get "/" do
  erb :homepage, :layout => :template
end

get "/calc" do
  erb :calculator, :layout => :template
end

get "/result" do
  @result = (params[:amount].to_f / params[:gallons].to_f).round(2)
  erb :result, :layout => :template
end


