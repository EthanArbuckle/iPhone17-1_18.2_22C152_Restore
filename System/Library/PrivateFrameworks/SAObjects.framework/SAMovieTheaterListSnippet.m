@interface SAMovieTheaterListSnippet
+ (id)theaterListSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMovieTheaterListSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
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

@end