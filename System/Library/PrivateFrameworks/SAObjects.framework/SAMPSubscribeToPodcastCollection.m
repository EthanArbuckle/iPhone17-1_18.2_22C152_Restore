@interface SAMPSubscribeToPodcastCollection
+ (id)subscribeToPodcastCollection;
- (BOOL)requiresResponse;
- (NSString)assetInfo;
- (NSString)hashedRouteUID;
- (SAMPPodcastCollection)podcastCollection;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssetInfo:(id)a3;
- (void)setHashedRouteUID:(id)a3;
- (void)setPodcastCollection:(id)a3;
@end

@implementation SAMPSubscribeToPodcastCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SubscribeToPodcastCollection";
}

+ (id)subscribeToPodcastCollection
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

- (NSString)hashedRouteUID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hashedRouteUID"];
}

- (void)setHashedRouteUID:(id)a3
{
}

- (SAMPPodcastCollection)podcastCollection
{
  return (SAMPPodcastCollection *)AceObjectAceObjectForProperty(self, @"podcastCollection");
}

- (void)setPodcastCollection:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end