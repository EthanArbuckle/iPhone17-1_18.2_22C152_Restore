@interface MTPodcastEpisodeLimitHelper
+ (BOOL)limitAllowsAutomaticDownloads:(int64_t)a3;
+ (NSSet)allGlobalLimits;
- (MTPodcastEpisodeLimitHelper)init;
@end

@implementation MTPodcastEpisodeLimitHelper

+ (NSSet)allGlobalLimits
{
  id v2 = _s18PodcastsFoundation25PodcastEpisodeLimitHelperC15allGlobalLimitsSo5NSSetCvgZ_0();
  return (NSSet *)v2;
}

+ (BOOL)limitAllowsAutomaticDownloads:(int64_t)a3
{
  return MTPodcastEpisodeLimit.allowsAutomaticDownloads.getter((void *)a3) & 1;
}

- (MTPodcastEpisodeLimitHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PodcastEpisodeLimitHelper();
  return [(MTPodcastEpisodeLimitHelper *)&v3 init];
}

@end