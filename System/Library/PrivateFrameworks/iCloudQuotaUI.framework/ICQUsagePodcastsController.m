@interface ICQUsagePodcastsController
+ (id)mediaGroups;
@end

@implementation ICQUsagePodcastsController

+ (id)mediaGroups
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"audiopodcasts";
  v4[1] = @"videopodcasts";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end