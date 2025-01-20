@interface SAAnswerSearchResults
+ (id)searchResults;
- (BOOL)requiresResponse;
- (NSArray)results;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResults:(id)a3;
@end

@implementation SAAnswerSearchResults

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"SearchResults";
}

+ (id)searchResults
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)results
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"results", v3);
}

- (void)setResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end