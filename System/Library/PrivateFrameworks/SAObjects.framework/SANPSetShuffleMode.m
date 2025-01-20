@interface SANPSetShuffleMode
+ (id)setShuffleMode;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSString)shuffleMode;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setShuffleMode:(id)a3;
@end

@implementation SANPSetShuffleMode

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"SetShuffleMode";
}

+ (id)setShuffleMode
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

- (NSString)shuffleMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"shuffleMode"];
}

- (void)setShuffleMode:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end