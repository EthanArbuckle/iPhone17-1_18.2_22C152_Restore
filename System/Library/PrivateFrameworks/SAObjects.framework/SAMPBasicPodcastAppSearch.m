@interface SAMPBasicPodcastAppSearch
+ (id)basicPodcastAppSearch;
- (BOOL)acceptPodcastCollections;
- (BOOL)acceptPodcastStations;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)query;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)maxResults;
- (void)setAcceptPodcastCollections:(BOOL)a3;
- (void)setAcceptPodcastStations:(BOOL)a3;
- (void)setMaxResults:(int64_t)a3;
- (void)setQuery:(id)a3;
@end

@implementation SAMPBasicPodcastAppSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"BasicPodcastAppSearch";
}

+ (id)basicPodcastAppSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)acceptPodcastCollections
{
  return AceObjectBoolForProperty(self, @"acceptPodcastCollections");
}

- (void)setAcceptPodcastCollections:(BOOL)a3
{
}

- (BOOL)acceptPodcastStations
{
  return AceObjectBoolForProperty(self, @"acceptPodcastStations");
}

- (void)setAcceptPodcastStations:(BOOL)a3
{
}

- (int64_t)maxResults
{
  return AceObjectIntegerForProperty(self, @"maxResults");
}

- (void)setMaxResults:(int64_t)a3
{
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
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