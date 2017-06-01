Rails.application.routes.draw do

	#root page
	root "pages#home"

	get "/home" => "pages#home"
	get "/search-weather" => "pages#weather"

	get "/trending" => "gifs#trending"
	get "/random" => "gifs#random"

	get "/gifs" => "gifs#index", as: :gifs
	get  "/weather" => "gifs#weather", as: :gifs_weather
end

