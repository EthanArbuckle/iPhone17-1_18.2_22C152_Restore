@interface SAMPEpisode
+ (id)episode;
- (NSString)showName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)episodeNumber;
- (int64_t)seasonNumber;
- (int64_t)showEpisodesCount;
- (void)setEpisodeNumber:(int64_t)a3;
- (void)setSeasonNumber:(int64_t)a3;
- (void)setShowEpisodesCount:(int64_t)a3;
- (void)setShowName:(id)a3;
@end

@implementation SAMPEpisode

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Episode";
}

+ (id)episode
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)episodeNumber
{
  return AceObjectIntegerForProperty(self, @"episodeNumber");
}

- (void)setEpisodeNumber:(int64_t)a3
{
}

- (int64_t)seasonNumber
{
  return AceObjectIntegerForProperty(self, @"seasonNumber");
}

- (void)setSeasonNumber:(int64_t)a3
{
}

- (int64_t)showEpisodesCount
{
  return AceObjectIntegerForProperty(self, @"showEpisodesCount");
}

- (void)setShowEpisodesCount:(int64_t)a3
{
}

- (NSString)showName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"showName"];
}

- (void)setShowName:(id)a3
{
}

@end