@interface SAMPAddMediaItemsToPlaylist
+ (id)addMediaItemsToPlaylist;
- (BOOL)requiresResponse;
- (NSArray)mediaItems;
- (NSString)influencedUserSharedUserId;
- (NSString)insertLocation;
- (SAMPPlaylist)playlist;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInfluencedUserSharedUserId:(id)a3;
- (void)setInsertLocation:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setPlaylist:(id)a3;
@end

@implementation SAMPAddMediaItemsToPlaylist

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"AddMediaItemsToPlaylist";
}

+ (id)addMediaItemsToPlaylist
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)influencedUserSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"influencedUserSharedUserId"];
}

- (void)setInfluencedUserSharedUserId:(id)a3
{
}

- (NSString)insertLocation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"insertLocation"];
}

- (void)setInsertLocation:(id)a3
{
}

- (NSArray)mediaItems
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"mediaItems", v3);
}

- (void)setMediaItems:(id)a3
{
}

- (SAMPPlaylist)playlist
{
  return (SAMPPlaylist *)AceObjectAceObjectForProperty(self, @"playlist");
}

- (void)setPlaylist:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end