@interface MPModelSong
- (NSString)shortDescription;
- (double)preferredArtworkAspectRatio;
@end

@implementation MPModelSong

- (NSString)shortDescription
{
  return (NSString *)sub_100A9CD80(self, (uint64_t)a2, (void (*)(void))sub_100A9C270);
}

- (double)preferredArtworkAspectRatio
{
  v2 = self;
  double v3 = sub_100AE1240();

  return v3;
}

@end