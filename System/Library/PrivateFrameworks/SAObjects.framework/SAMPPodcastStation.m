@interface SAMPPodcastStation
+ (id)podcastStation;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPPodcastStation

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"PodcastStation";
}

+ (id)podcastStation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end