### Instructions

Build a web application that lists movies and their details.

The list of movies to display is contained in the `movies.csv` file. Each row represents a single movie and includes the movie ID, title, year released, synopsis, critic's rating, genre, and producing studio. The title, year, and genre are required for each movie, the other fields are optional.

### Requirements

When visiting the `/movies` path it should list all of the movies sorted by title. Each title should be a clickable link that takes you to `/movies/:movie_id`, where `:movie_id` is replaced by the numeric ID for that movie (e.g. `/movies/2` will take you to the page for Troll 2).

When visiting the `/movies/:movie_id` path, it should list the details for the movie identified by `:movie_id`. The details should include the title, the year released, the synopsis, the rating, the genre, and the studio that produced it (leave blank if any fields are not available).

### Extra Challenge

To deal with the large number of entries you can include pagination and search to manage the amount of information to show by implementing the following features:

* Limit the number of movies displayed at `/movies` to 20 with links to the next page of movies. To go to the second page, the URL should change to `/movies?page=2` (the page number can be accessed in the `params` hash).

* Include a way to filter movies using a search bar. When visiting the index path with a query parameter (i.e. `/movies?query=Troll+2`) it should only show movies that include the search term in the movie title or synopsis. To allow the user to enter arbitrary search terms you'll need to include a form that sends a GET request with the following snippet:

```HTML
<form action="/movies" method="get">
  <label for="query">Search: </label>
  <input type="text" name="query" id="query" />

  <input type="submit" value="Search" />
</form>
```
