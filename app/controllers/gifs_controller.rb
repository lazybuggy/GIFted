class GifsController < ApplicationController

	def index
		#if the search bar isn't empty
		if !params[:search].empty?
			@searched = params[:search]

			#create a new GIFobj using the search , limit to 30
   			gifs = GIF.new(@searched,"dc6zaTOxFJmzC",30)

   			#get the data Array from the GIF
			gifArray  =  gifs.search['data']
			@results = Array.new
			
			#for each element in the array, add the URL to results array
			gifArray.each do |gif|
				@results.insert(0, gif['images']['original']['url'])
			end
		 #if user didn't search anything
		 else 
    			redirect_to "/trending"
		  end
	end
	
	def trending
		#create a new GIFobj, limit to 30
		gifs = GIF.new("dc6zaTOxFJmzC",30)

		#get the 'data' array from json
		gifArray  =  gifs.trending['data']
		@trendingURLsArray = Array.new
		
		#for each element in the array add the URL
		gifArray.each do |gif|
			@trendingURLsArray.insert(0, gif['images']['original']['url'])
		end
		
		render ("trending")
	end

	def weather
		#if the search bar isn't empty
		if !params[:city].empty?
			@city = params[:city].capitalize

			#create a new WeatherObj with the given city
		  	weather = Weather.new(@city,"befa1991d12788749a4a80c81c37bbba")
		  	
		  	#get the 1st weather object returned, store the main weather and description
		  	weatherObj = weather.cityWeather['weather'][0]
		  	@main = weatherObj['main']
		  	@description = weatherObj['description']
		  	
		  	#get the weather in Kelvin & convert to C
		  	weatherKelvin = weather.cityWeather['main']['temp'].to_i
		  	@weatherCelsius = (weatherKelvin - 273.15).round;

		  	#create a new GIFobj that uses the main weather
		  	gifs = GIF.new(@main,"dc6zaTOxFJmzC",30)

		  	#get array stored in 'data'
			gifArray  =  gifs.search['data']
			@results = Array.new
			
			gifArray.each do |gif|
				@results.insert(0, gif['images']['original']['url'])
			end
		#if the search bar is empty
		else
    			redirect_to "/trending"
		 end
	end

	def random
 			#create a new GIF based on 'harry potter' tag
		  	gifs = GIF.new("harry potter","pg-13","dc6zaTOxFJmzC",1)

		  	#get the random GIF
		  	@result= gifs.random['data']['image_url']
	end
end