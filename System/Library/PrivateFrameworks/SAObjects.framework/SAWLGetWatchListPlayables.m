@interface SAWLGetWatchListPlayables
+ (id)getWatchListPlayables;
- (BOOL)requiresResponse;
- (NSString)statsId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStatsId:(id)a3;
@end

@implementation SAWLGetWatchListPlayables

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"GetWatchListPlayables";
}

+ (id)getWatchListPlayables
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)statsId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"statsId"];
}

- (void)setStatsId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end