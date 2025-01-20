@interface SANPSeekToPlaybackPosition
+ (id)seekToPlaybackPosition;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSNumber)positionInMilliseconds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setPositionInMilliseconds:(id)a3;
@end

@implementation SANPSeekToPlaybackPosition

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"SeekToPlaybackPosition";
}

+ (id)seekToPlaybackPosition
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

- (NSNumber)positionInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"positionInMilliseconds"];
}

- (void)setPositionInMilliseconds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end