class GIF
	include HTTParty
	base_uri 'api.giphy.com'

	def initialize(*args)
		case args.size 
		when 2
	    		@options = { query: { api_key: args[0], limit: args[1] } }
	   	when 3
	   		 @options = { query: { q: args[0],api_key: args[1], limit: args[2]} }
	  	 when 4
	   		 @options = { query: { tag: args[0], rating: args[1],api_key: args[2], limit: args[3]} }
	  	end
	  end

	  def trending
	    self.class.get("/v1/gifs/trending", @options)
	  end

	  def search
	    self.class.get("/v1/gifs/search", @options)
	  end

	  def random
	  	self.class.get("/v1/gifs/random", @options)
	  end

end