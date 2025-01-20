@interface SAMovieV2MovieListCell
+ (id)movieListCell;
- (NSArray)displayableShowtimes;
- (NSArray)posterImages;
- (NSDate)theatricalReleaseDate;
- (NSNumber)qualityRating;
- (NSString)movieName;
- (NSString)rating;
- (SAMovieV2MovieDetailSnippet)movieDetailSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDisplayableShowtimes:(id)a3;
- (void)setMovieDetailSnippet:(id)a3;
- (void)setMovieName:(id)a3;
- (void)setPosterImages:(id)a3;
- (void)setQualityRating:(id)a3;
- (void)setRating:(id)a3;
- (void)setTheatricalReleaseDate:(id)a3;
@end

@implementation SAMovieV2MovieListCell

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"MovieListCell";
}

+ (id)movieListCell
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)displayableShowtimes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"displayableShowtimes", v3);
}

- (void)setDisplayableShowtimes:(id)a3
{
}

- (SAMovieV2MovieDetailSnippet)movieDetailSnippet
{
  return (SAMovieV2MovieDetailSnippet *)AceObjectAceObjectForProperty(self, @"movieDetailSnippet");
}

- (void)setMovieDetailSnippet:(id)a3
{
}

- (NSString)movieName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"movieName"];
}

- (void)setMovieName:(id)a3
{
}

- (NSArray)posterImages
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"posterImages", v3);
}

- (void)setPosterImages:(id)a3
{
}

- (NSNumber)qualityRating
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"qualityRating"];
}

- (void)setQualityRating:(id)a3
{
}

- (NSString)rating
{
  return (NSString *)[(AceObject *)self propertyForKey:@"rating"];
}

- (void)setRating:(id)a3
{
}

- (NSDate)theatricalReleaseDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"theatricalReleaseDate"];
}

- (void)setTheatricalReleaseDate:(id)a3
{
}

@end