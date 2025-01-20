@interface SAMPLoadPredefinedQueue
+ (id)loadPredefinedQueue;
- (BOOL)dryRun;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)shouldShuffle;
- (NSArray)hashedRouteUIDs;
- (NSNumber)startPlaying;
- (NSString)requesterSharedUserId;
- (NSString)sharedUserIdFromPlayableMusicAccount;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)mediaItemType;
- (void)setDryRun:(BOOL)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setMediaItemType:(int)a3;
- (void)setRequesterSharedUserId:(id)a3;
- (void)setSharedUserIdFromPlayableMusicAccount:(id)a3;
- (void)setShouldShuffle:(BOOL)a3;
- (void)setStartPlaying:(id)a3;
@end

@implementation SAMPLoadPredefinedQueue

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"LoadPredefinedQueue";
}

+ (id)loadPredefinedQueue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)dryRun
{
  return AceObjectBoolForProperty(self, @"dryRun");
}

- (void)setDryRun:(BOOL)a3
{
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (int)mediaItemType
{
  id v2 = [(AceObject *)self propertyForKey:@"mediaItemType"];
  int v3 = SAMPTypeForString(v2);

  return v3;
}

- (void)setMediaItemType:(int)a3
{
  stringForSAMPType(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"mediaItemType", v4);
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

- (BOOL)shouldShuffle
{
  return AceObjectBoolForProperty(self, @"shouldShuffle");
}

- (void)setShouldShuffle:(BOOL)a3
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