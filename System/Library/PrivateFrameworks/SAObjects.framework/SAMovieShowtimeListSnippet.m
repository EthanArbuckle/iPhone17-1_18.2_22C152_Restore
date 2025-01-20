@interface SAMovieShowtimeListSnippet
+ (id)showtimeListSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMovieShowtimeListSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"ShowtimeListSnippet";
}

+ (id)showtimeListSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end