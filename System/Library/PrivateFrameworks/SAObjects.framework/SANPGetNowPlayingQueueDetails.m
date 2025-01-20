@interface SANPGetNowPlayingQueueDetails
+ (id)getNowPlayingQueueDetails;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSNumber)preemptiveNowPlayingQueueDetailsTimeOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)nextItemCount;
- (int64_t)previousItemCount;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setNextItemCount:(int64_t)a3;
- (void)setPreemptiveNowPlayingQueueDetailsTimeOut:(id)a3;
- (void)setPreviousItemCount:(int64_t)a3;
@end

@implementation SANPGetNowPlayingQueueDetails

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"GetNowPlayingQueueDetails";
}

+ (id)getNowPlayingQueueDetails
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

- (int64_t)nextItemCount
{
  return AceObjectIntegerForProperty(self, @"nextItemCount");
}

- (void)setNextItemCount:(int64_t)a3
{
}

- (NSNumber)preemptiveNowPlayingQueueDetailsTimeOut
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"preemptiveNowPlayingQueueDetailsTimeOut"];
}

- (void)setPreemptiveNowPlayingQueueDetailsTimeOut:(id)a3
{
}

- (int64_t)previousItemCount
{
  return AceObjectIntegerForProperty(self, @"previousItemCount");
}

- (void)setPreviousItemCount:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end