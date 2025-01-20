@interface SAWLWatchListSearchResults
+ (id)watchListSearchResults;
- (BOOL)requiresResponse;
- (NSArray)matchedResults;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMatchedResults:(id)a3;
@end

@implementation SAWLWatchListSearchResults

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"WatchListSearchResults";
}

+ (id)watchListSearchResults
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)matchedResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"matchedResults", v3);
}

- (void)setMatchedResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end