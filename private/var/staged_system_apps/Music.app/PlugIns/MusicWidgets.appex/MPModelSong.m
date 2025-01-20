@interface MPModelSong
- (NSString)shortDescription;
- (double)preferredArtworkAspectRatio;
@end

@implementation MPModelSong

- (NSString)shortDescription
{
  return (NSString *)sub_10036AD70(self, (uint64_t)a2, (void (*)(void))sub_10036A260);
}

- (double)preferredArtworkAspectRatio
{
  v2 = self;
  double v3 = sub_1003B975C();

  return v3;
}

@end