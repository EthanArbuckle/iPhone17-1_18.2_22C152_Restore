@interface SAMPSetQueue
+ (id)setQueue;
- (BOOL)dryRun;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)shouldOverrideManuallyCuratedUpNext;
- (BOOL)shouldReloadQueue;
- (BOOL)shouldShuffle;
- (NSArray)filters;
- (NSArray)hashedRouteUIDs;
- (NSArray)sort;
- (NSNumber)startPlaying;
- (NSString)assetInfo;
- (NSString)recommendationId;
- (NSString)requesterSharedUserId;
- (NSString)sharedUserIdFromPlayableMusicAccount;
- (SAMPCollection)mediaItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssetInfo:(id)a3;
- (void)setDryRun:(BOOL)a3;
- (void)setFilters:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setRecommendationId:(id)a3;
- (void)setRequesterSharedUserId:(id)a3;
- (void)setSharedUserIdFromPlayableMusicAccount:(id)a3;
- (void)setShouldOverrideManuallyCuratedUpNext:(BOOL)a3;
- (void)setShouldReloadQueue:(BOOL)a3;
- (void)setShouldShuffle:(BOOL)a3;
- (void)setSort:(id)a3;
- (void)setStartPlaying:(id)a3;
@end

@implementation SAMPSetQueue

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SetQueue";
}

+ (id)setQueue
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

- (BOOL)dryRun
{
  return AceObjectBoolForProperty(self, @"dryRun");
}

- (void)setDryRun:(BOOL)a3
{
}

- (NSArray)filters
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"filters", v3);
}

- (void)setFilters:(id)a3
{
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (SAMPCollection)mediaItems
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, @"mediaItems");
}

- (void)setMediaItems:(id)a3
{
}

- (NSString)recommendationId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"recommendationId"];
}

- (void)setRecommendationId:(id)a3
{
}

- (NSString)requesterSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requesterSharedUserId"];
}

- (void)setRequesterSharedUserId:(id)a3
{
}

- (NSString)sharedUserIdFromPlayableMusicAccount
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sharedUserIdFromPlayableMusicAccount"];
}

- (void)setSharedUserIdFromPlayableMusicAccount:(id)a3
{
}

- (BOOL)shouldOverrideManuallyCuratedUpNext
{
  return AceObjectBoolForProperty(self, @"shouldOverrideManuallyCuratedUpNext");
}

- (void)setShouldOverrideManuallyCuratedUpNext:(BOOL)a3
{
}

- (BOOL)shouldReloadQueue
{
  return AceObjectBoolForProperty(self, @"shouldReloadQueue");
}

- (void)setShouldReloadQueue:(BOOL)a3
{
}

- (BOOL)shouldShuffle
{
  return AceObjectBoolForProperty(self, @"shouldShuffle");
}

- (void)setShouldShuffle:(BOOL)a3
{
}

- (NSArray)sort
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"sort", v3);
}

- (void)setSort:(id)a3
{
}

- (NSNumber)startPlaying
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"startPlaying"];
}

- (void)setStartPlaying:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end