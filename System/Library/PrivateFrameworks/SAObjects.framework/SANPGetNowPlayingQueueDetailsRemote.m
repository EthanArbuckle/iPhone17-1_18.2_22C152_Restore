@interface SANPGetNowPlayingQueueDetailsRemote
+ (id)getNowPlayingQueueDetailsRemote;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (SANPGetNowPlayingQueueDetails)queueDetails;
- (double)routeTimeout;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setQueueDetails:(id)a3;
- (void)setRouteTimeout:(double)a3;
@end

@implementation SANPGetNowPlayingQueueDetailsRemote

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"GetNowPlayingQueueDetailsRemote";
}

+ (id)getNowPlayingQueueDetailsRemote
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

- (SANPGetNowPlayingQueueDetails)queueDetails
{
  return (SANPGetNowPlayingQueueDetails *)AceObjectAceObjectForProperty(self, @"queueDetails");
}

- (void)setQueueDetails:(id)a3
{
}

- (double)routeTimeout
{
  return AceObjectDoubleForProperty(self, @"routeTimeout");
}

- (void)setRouteTimeout:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end