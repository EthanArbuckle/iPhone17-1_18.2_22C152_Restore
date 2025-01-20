@interface PHAsset(ShareBack)
- (double)horizontalAccuracy;
- (uint64_t)timeZone;
@end

@implementation PHAsset(ShareBack)

- (double)horizontalAccuracy
{
  v1 = [a1 coarseLocationProperties];
  [v1 gpsHorizontalAccuracy];
  double v3 = v2;

  return v3;
}

- (uint64_t)timeZone
{
  return 0;
}

@end