@interface SAMPPlayPodcastEpisode
+ (id)playPodcastEpisode;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)startPlaying;
- (NSArray)hashedRouteUIDs;
- (NSString)assetInfo;
- (NSString)requesterSharedUserId;
- (NSString)sharedUserIdFromPlayableITunesAccount;
- (SAMPPodcast)podcastEpisode;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssetInfo:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setPodcastEpisode:(id)a3;
- (void)setRequesterSharedUserId:(id)a3;
- (void)setSharedUserIdFromPlayableITunesAccount:(id)a3;
- (void)setStartPlaying:(BOOL)a3;
@end

@implementation SAMPPlayPodcastEpisode

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"PlayPodcastEpisode";
}

+ (id)playPodcastEpisode
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

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (SAMPPodcast)podcastEpisode
{
  return (SAMPPodcast *)AceObjectAceObjectForProperty(self, @"podcastEpisode");
}

- (void)setPodcastEpisode:(id)a3
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