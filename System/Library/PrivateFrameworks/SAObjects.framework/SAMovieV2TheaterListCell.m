@interface SAMovieV2TheaterListCell
+ (id)theaterListCell;
- (NSString)theaterAddress;
- (NSString)theaterName;
- (SADistance)relativeDistance;
- (SAMovieV2MovieListSnippet)theaterShowtimeListSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRelativeDistance:(id)a3;
- (void)setTheaterAddress:(id)a3;
- (void)setTheaterName:(id)a3;
- (void)setTheaterShowtimeListSnippet:(id)a3;
@end

@implementation SAMovieV2TheaterListCell

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"TheaterListCell";
}

+ (id)theaterListCell
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADistance)relativeDistance
{
  return (SADistance *)AceObjectAceObjectForProperty(self, @"relativeDistance");
}

- (void)setRelativeDistance:(id)a3
{
}

- (NSString)theaterAddress
{
  return (NSString *)[(AceObject *)self propertyForKey:@"theaterAddress"];
}

- (void)setTheaterAddress:(id)a3
{
}

- (NSString)theaterName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"theaterName"];
}

- (void)setTheaterName:(id)a3
{
}

- (SAMovieV2MovieListSnippet)theaterShowtimeListSnippet
{
  return (SAMovieV2MovieListSnippet *)AceObjectAceObjectForProperty(self, @"theaterShowtimeListSnippet");
}

- (void)setTheaterShowtimeListSnippet:(id)a3
{
}

@end