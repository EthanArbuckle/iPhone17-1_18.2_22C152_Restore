@interface SAMovieMovieListSnippet
+ (id)movieListSnippet;
- (BOOL)shouldShowRottenTomatoesRating;
- (NSArray)movies;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovies:(id)a3;
- (void)setShouldShowRottenTomatoesRating:(BOOL)a3;
@end

@implementation SAMovieMovieListSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"MovieListSnippet";
}

+ (id)movieListSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)movies
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"movies", v3);
}

- (void)setMovies:(id)a3
{
}

- (BOOL)shouldShowRottenTomatoesRating
{
  return AceObjectBoolForProperty(self, @"shouldShowRottenTomatoesRating");
}

- (void)setShouldShowRottenTomatoesRating:(BOOL)a3
{
}

@end