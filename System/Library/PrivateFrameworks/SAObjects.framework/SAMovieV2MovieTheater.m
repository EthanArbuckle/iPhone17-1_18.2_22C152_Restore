@interface SAMovieV2MovieTheater
+ (id)movieTheater;
- (NSArray)movies;
- (SALocalSearchBusiness2)business;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBusiness:(id)a3;
- (void)setMovies:(id)a3;
@end

@implementation SAMovieV2MovieTheater

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"MovieTheater";
}

+ (id)movieTheater
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocalSearchBusiness2)business
{
  return (SALocalSearchBusiness2 *)AceObjectAceObjectForProperty(self, @"business");
}

- (void)setBusiness:(id)a3
{
}

- (NSArray)movies
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"movies", v3);
}

- (void)setMovies:(id)a3
{
}

@end