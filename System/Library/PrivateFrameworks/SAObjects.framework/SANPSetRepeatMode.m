@interface SANPSetRepeatMode
+ (id)setRepeatMode;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSString)repeatMode;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setRepeatMode:(id)a3;
@end

@implementation SANPSetRepeatMode

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"SetRepeatMode";
}

+ (id)setRepeatMode
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

- (NSString)repeatMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"repeatMode"];
}

- (void)setRepeatMode:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end