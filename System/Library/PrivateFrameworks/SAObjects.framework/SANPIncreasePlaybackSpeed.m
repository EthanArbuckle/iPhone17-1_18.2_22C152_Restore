@interface SANPIncreasePlaybackSpeed
+ (id)increasePlaybackSpeed;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
@end

@implementation SANPIncreasePlaybackSpeed

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"IncreasePlaybackSpeed";
}

+ (id)increasePlaybackSpeed
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end