require 'sinatra'
require 'CSV'

# Takes in CSV, returns hash
def process_movie_data
  unprocessed = CSV.read("movies.csv")
  processed = {}
  unprocessed.each do |movie_string|
    processed[movie_string[0]] = movie_string[1..-1]
  end

  processed
end

# Takes in hash, returns sorted array of key:value pairs
def sort_by_title(movie_hash)
  movie_hash.sort_by{|id, data| data[0]}
end

# Redirect homepage to /movies page
get '/' do
  redirect '/movies?:page=1'
end

# Display list of movies
get '/movies' do
  if params[:query]
    @query = params[:query]
    @searching = true
  else
    @query = ''
    @searching = false
  end
  if params[:page]
    @page = params[:page].to_i
  else
    @page = 1
  end
  @movies_array = sort_by_title(process_movie_data)

  if @searching
    @query = @query.downcase
    @movies_array = @movies_array.select do |x|
      x[1][0].downcase.include?(@query) || x[1][1].downcase.include?(@query)
    end
  end

  @num_pages = (@movies_array.length / 20.0).ceil

  erb :index
end

# Display individual movie
get '/movies/:id' do
  @movie_id = params[:id]
  @movie_data = process_movie_data[@movie_id]

  erb :movie_page
end
