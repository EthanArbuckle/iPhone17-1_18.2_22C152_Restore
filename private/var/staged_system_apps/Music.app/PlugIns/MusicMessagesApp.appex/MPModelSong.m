@interface MPModelSong
- (NSString)shortDescription;
- (double)preferredArtworkAspectRatio;
@end

@implementation MPModelSong

- (NSString)shortDescription
{
  return (NSString *)sub_1002BA39C(self, (uint64_t)a2, (void (*)(void))sub_1002B988C);
}

- (double)preferredArtworkAspectRatio
{
  v2 = self;
  double v3 = sub_100308C64();

  return v3;
}

@end