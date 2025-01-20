@interface SAMovieMovieTheaterShowtimes
+ (id)movieTheaterShowtimes;
- (NSArray)movieShowtimes;
- (NSArray)showtimes;
- (SALocalSearchBusiness2)theater;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovieShowtimes:(id)a3;
- (void)setShowtimes:(id)a3;
- (void)setTheater:(id)a3;
@end

@implementation SAMovieMovieTheaterShowtimes

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"MovieTheaterShowtimes";
}

+ (id)movieTheaterShowtimes
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)movieShowtimes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"movieShowtimes", v3);
}

- (void)setMovieShowtimes:(id)a3
{
}

- (NSArray)showtimes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"showtimes"];
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

@end