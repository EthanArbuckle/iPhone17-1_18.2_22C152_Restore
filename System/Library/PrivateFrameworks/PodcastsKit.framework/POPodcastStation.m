@interface POPodcastStation
+ (Class)SAMPClass;
+ (id)uriScheme;
@end

@implementation POPodcastStation

+ (Class)SAMPClass
{
  return (Class)objc_opt_class();
}

+ (id)uriScheme
{
  return @"x-sampcollection-podcaststation";
}

@end