@interface SAMovieReviewsSnippet
+ (id)reviewsSnippet;
- (SAMovieMovie)movie;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovie:(id)a3;
@end

@implementation SAMovieReviewsSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"ReviewsSnippet";
}

+ (id)reviewsSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMovieMovie)movie
{
  return (SAMovieMovie *)AceObjectAceObjectForProperty(self, @"movie");
}

- (void)setMovie:(id)a3
{
}

@end