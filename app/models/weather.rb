class Weather
	include HTTParty
	base_uri 'api.openweathermap.org'

	def initialize(city,key)
	    	@options = { query: { q: city, appid: key} }
	  end

	  def cityWeather
	    self.class.get("/data/2.5/weather", @options)
	  end

end