@interface SAMPPlayPodcastCollection
+ (id)playPodcastCollection;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)startPlaying;
- (NSArray)hashedRouteUIDs;
- (NSString)assetInfo;
- (NSString)episodePlaybackOrder;
- (NSString)requesterSharedUserId;
- (NSString)sharedUserIdFromPlayableITunesAccount;
- (SAMPPodcastCollection)podcastCollection;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssetInfo:(id)a3;
- (void)setEpisodePlaybackOrder:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setPodcastCollection:(id)a3;
- (void)setRequesterSharedUserId:(id)a3;
- (void)setSharedUserIdFromPlayableITunesAccount:(id)a3;
- (void)setStartPlaying:(BOOL)a3;
@end

@implementation SAMPPlayPodcastCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"PlayPodcastCollection";
}

+ (id)playPodcastCollection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)assetInfo
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assetInfo"];
}

- (void)setAssetInfo:(id)a3
{
}

- (NSString)episodePlaybackOrder
{
  return (NSString *)[(AceObject *)self propertyForKey:@"episodePlaybackOrder"];
}

- (void)setEpisodePlaybackOrder:(id)a3
{
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (SAMPPodcastCollection)podcastCollection
{
  return (SAMPPodcastCollection *)AceObjectAceObjectForProperty(self, @"podcastCollection");
}

- (void)setPodcastCollection:(id)a3
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

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end