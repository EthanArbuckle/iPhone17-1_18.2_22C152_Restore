@interface SAMovieV2ShowtimeSnippet
+ (id)showtimeSnippet;
- (NSArray)showtimes;
- (NSString)movieName;
- (NSString)theaterName;
- (SALocalSearchBusiness2)theater;
- (SAUIImageResource)attributionLogo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributionLogo:(id)a3;
- (void)setMovieName:(id)a3;
- (void)setShowtimes:(id)a3;
- (void)setTheater:(id)a3;
- (void)setTheaterName:(id)a3;
@end

@implementation SAMovieV2ShowtimeSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"ShowtimeSnippet";
}

+ (id)showtimeSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIImageResource)attributionLogo
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"attributionLogo");
}

- (void)setAttributionLogo:(id)a3
{
}

- (NSString)movieName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"movieName"];
}

- (void)setMovieName:(id)a3
{
}

- (NSArray)showtimes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"showtimes", v3);
}

- (void)setShowtimes:(id)a3
{
}

- (SALocalSearchBusiness2)theater
{
  return (SALocalSearchBusiness2 *)AceObjectAceObjectForProperty(self, @"theater");
}

- (void)setTheater:(id)a3
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