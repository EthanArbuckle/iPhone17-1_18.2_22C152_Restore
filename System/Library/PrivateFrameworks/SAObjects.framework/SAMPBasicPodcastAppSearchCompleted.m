@interface SAMPBasicPodcastAppSearchCompleted
+ (id)basicPodcastAppSearchCompleted;
- (BOOL)requiresResponse;
- (NSArray)podcastCollections;
- (NSArray)podcastStations;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPodcastCollections:(id)a3;
- (void)setPodcastStations:(id)a3;
@end

@implementation SAMPBasicPodcastAppSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"BasicPodcastAppSearchCompleted";
}

+ (id)basicPodcastAppSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)podcastCollections
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"podcastCollections", v3);
}

- (void)setPodcastCollections:(id)a3
{
}

- (NSArray)podcastStations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"podcastStations", v3);
}

- (void)setPodcastStations:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end