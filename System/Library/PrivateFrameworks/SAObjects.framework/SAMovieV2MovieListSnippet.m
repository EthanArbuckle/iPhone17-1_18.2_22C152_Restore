@interface SAMovieV2MovieListSnippet
+ (id)movieListSnippet;
- (NSArray)movieListCells;
- (SALocalSearchBusiness2)theater;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovieListCells:(id)a3;
- (void)setTheater:(id)a3;
@end

@implementation SAMovieV2MovieListSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
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

- (NSArray)movieListCells
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"movieListCells", v3);
}

- (void)setMovieListCells:(id)a3
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