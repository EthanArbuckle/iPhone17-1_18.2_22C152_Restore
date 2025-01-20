@interface SANPSkipTimeInterval
+ (id)skipTimeInterval;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSNumber)adjustmentInMilliseconds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAdjustmentInMilliseconds:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
@end

@implementation SANPSkipTimeInterval

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"SkipTimeInterval";
}

+ (id)skipTimeInterval
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)adjustmentInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"adjustmentInMilliseconds"];
}

- (void)setAdjustmentInMilliseconds:(id)a3
{
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