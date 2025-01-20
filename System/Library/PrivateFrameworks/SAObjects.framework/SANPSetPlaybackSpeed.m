@interface SANPSetPlaybackSpeed
+ (id)setPlaybackSpeed;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (double)scalingFactor;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setScalingFactor:(double)a3;
@end

@implementation SANPSetPlaybackSpeed

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"SetPlaybackSpeed";
}

+ (id)setPlaybackSpeed
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

- (double)scalingFactor
{
  return AceObjectDoubleForProperty(self, @"scalingFactor");
}

- (void)setScalingFactor:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end