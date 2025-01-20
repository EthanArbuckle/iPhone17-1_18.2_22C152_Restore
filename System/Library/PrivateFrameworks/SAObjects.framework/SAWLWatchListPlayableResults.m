@interface SAWLWatchListPlayableResults
+ (id)watchListPlayableResults;
- (NSArray)playables;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPlayables:(id)a3;
@end

@implementation SAWLWatchListPlayableResults

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"WatchListPlayableResults";
}

+ (id)watchListPlayableResults
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)playables
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"playables", v3);
}

- (void)setPlayables:(id)a3
{
}

@end