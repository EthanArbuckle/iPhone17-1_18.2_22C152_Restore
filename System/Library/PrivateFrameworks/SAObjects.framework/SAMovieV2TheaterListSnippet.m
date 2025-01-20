@interface SAMovieV2TheaterListSnippet
+ (id)theaterListSnippet;
- (NSArray)theaterListCells;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTheaterListCells:(id)a3;
@end

@implementation SAMovieV2TheaterListSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"TheaterListSnippet";
}

+ (id)theaterListSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)theaterListCells
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"theaterListCells", v3);
}

- (void)setTheaterListCells:(id)a3
{
}

@end