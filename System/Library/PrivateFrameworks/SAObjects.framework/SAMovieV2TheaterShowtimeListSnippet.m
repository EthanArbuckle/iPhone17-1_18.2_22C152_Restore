@interface SAMovieV2TheaterShowtimeListSnippet
+ (id)theaterShowtimeListSnippet;
- (NSArray)theaterShowtimeListCells;
- (SAMovieV2MovieDetailSnippet)movieDetailSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovieDetailSnippet:(id)a3;
- (void)setTheaterShowtimeListCells:(id)a3;
@end

@implementation SAMovieV2TheaterShowtimeListSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"TheaterShowtimeListSnippet";
}

+ (id)theaterShowtimeListSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMovieV2MovieDetailSnippet)movieDetailSnippet
{
  return (SAMovieV2MovieDetailSnippet *)AceObjectAceObjectForProperty(self, @"movieDetailSnippet");
}

- (void)setMovieDetailSnippet:(id)a3
{
}

- (NSArray)theaterShowtimeListCells
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"theaterShowtimeListCells", v3);
}

- (void)setTheaterShowtimeListCells:(id)a3
{
}

@end