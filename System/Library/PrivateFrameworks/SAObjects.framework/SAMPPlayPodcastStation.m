@interface SAMPPlayPodcastStation
+ (id)playPodcastStation;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)startPlaying;
- (NSArray)hashedRouteUIDs;
- (NSString)requesterSharedUserId;
- (NSString)sharedUserIdFromPlayableITunesAccount;
- (SAMPPodcastStation)station;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setRequesterSharedUserId:(id)a3;
- (void)setSharedUserIdFromPlayableITunesAccount:(id)a3;
- (void)setStartPlaying:(BOOL)a3;
- (void)setStation:(id)a3;
@end

@implementation SAMPPlayPodcastStation

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"PlayPodcastStation";
}

+ (id)playPodcastStation
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

- (NSString)requesterSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requesterSharedUserId"];
}

- (void)setRequesterSharedUserId:(id)a3
{
}

- (NSString)sharedUserIdFromPlayableITunesAccount
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sharedUserIdFromPlayableITunesAccount"];
}

- (void)setSharedUserIdFromPlayableITunesAccount:(id)a3
{
}

- (BOOL)startPlaying
{
  return AceObjectBoolForProperty(self, @"startPlaying");
}

- (void)setStartPlaying:(BOOL)a3
{
}

- (SAMPPodcastStation)station
{
  return (SAMPPodcastStation *)AceObjectAceObjectForProperty(self, @"station");
}

- (void)setStation:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end