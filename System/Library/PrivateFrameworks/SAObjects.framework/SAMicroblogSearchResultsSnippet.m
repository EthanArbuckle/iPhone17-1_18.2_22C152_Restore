@interface SAMicroblogSearchResultsSnippet
+ (id)searchResultsSnippet;
- (NSArray)searches;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSearches:(id)a3;
@end

@implementation SAMicroblogSearchResultsSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"SearchResultsSnippet";
}

+ (id)searchResultsSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)searches
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"searches", v3);
}

- (void)setSearches:(id)a3
{
}

@end