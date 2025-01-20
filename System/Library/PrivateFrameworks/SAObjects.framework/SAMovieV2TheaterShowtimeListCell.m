@interface SAMovieV2TheaterShowtimeListCell
+ (id)theaterShowtimeListCell;
- (BOOL)bookable;
- (NSString)theaterName;
- (SADistance)relativeDistance;
- (SAMovieV2ShowtimeSnippet)showtimeSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBookable:(BOOL)a3;
- (void)setRelativeDistance:(id)a3;
- (void)setShowtimeSnippet:(id)a3;
- (void)setTheaterName:(id)a3;
@end

@implementation SAMovieV2TheaterShowtimeListCell

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"TheaterShowtimeListCell";
}

+ (id)theaterShowtimeListCell
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)bookable
{
  return AceObjectBoolForProperty(self, @"bookable");
}

- (void)setBookable:(BOOL)a3
{
}

- (SADistance)relativeDistance
{
  return (SADistance *)AceObjectAceObjectForProperty(self, @"relativeDistance");
}

- (void)setRelativeDistance:(id)a3
{
}

- (SAMovieV2ShowtimeSnippet)showtimeSnippet
{
  return (SAMovieV2ShowtimeSnippet *)AceObjectAceObjectForProperty(self, @"showtimeSnippet");
}

- (void)setShowtimeSnippet:(id)a3
{
}

- (NSString)theaterName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"theaterName"];
}

- (void)setTheaterName:(id)a3
{
}

@end