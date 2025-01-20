@interface SAMPPodcastCollection
+ (id)podcastCollection;
- (NSArray)preferredPlayOrder;
- (NSNumber)subscribed;
- (NSString)artist;
- (NSString)sortArtist;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setArtist:(id)a3;
- (void)setPreferredPlayOrder:(id)a3;
- (void)setSortArtist:(id)a3;
- (void)setSubscribed:(id)a3;
@end

@implementation SAMPPodcastCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"PodcastCollection";
}

+ (id)podcastCollection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)artist
{
  return (NSString *)[(AceObject *)self propertyForKey:@"artist"];
}

- (void)setArtist:(id)a3
{
}

- (NSArray)preferredPlayOrder
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"preferredPlayOrder", v3);
}

- (void)setPreferredPlayOrder:(id)a3
{
}

- (NSString)sortArtist
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sortArtist"];
}

- (void)setSortArtist:(id)a3
{
}

- (NSNumber)subscribed
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"subscribed"];
}

- (void)setSubscribed:(id)a3
{
}

@end