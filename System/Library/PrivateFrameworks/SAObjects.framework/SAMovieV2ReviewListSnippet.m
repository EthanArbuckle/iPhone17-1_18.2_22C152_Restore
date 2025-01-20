@interface SAMovieV2ReviewListSnippet
+ (id)reviewListSnippet;
- (NSString)movieName;
- (SALocalSearchReviewList)reviewList;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovieName:(id)a3;
- (void)setReviewList:(id)a3;
@end

@implementation SAMovieV2ReviewListSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"ReviewListSnippet";
}

+ (id)reviewListSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)movieName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"movieName"];
}

- (void)setMovieName:(id)a3
{
}

- (SALocalSearchReviewList)reviewList
{
  return (SALocalSearchReviewList *)AceObjectAceObjectForProperty(self, @"reviewList");
}

- (void)setReviewList:(id)a3
{
}

@end