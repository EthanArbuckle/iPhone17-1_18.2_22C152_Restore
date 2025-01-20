@interface MPModelSong
- (NSString)shortDescription;
- (double)preferredArtworkAspectRatio;
@end

@implementation MPModelSong

- (NSString)shortDescription
{
  return (NSString *)sub_100296F58(self, (uint64_t)a2, (void (*)(void))sub_100296448);
}

- (double)preferredArtworkAspectRatio
{
  v2 = self;
  double v3 = sub_1002E59A8();

  return v3;
}

@end