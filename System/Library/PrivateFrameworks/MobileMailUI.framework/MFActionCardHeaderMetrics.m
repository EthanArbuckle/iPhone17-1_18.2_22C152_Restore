@interface MFActionCardHeaderMetrics
- (double)avatarDiameterForCurrentContentSize;
- (double)minHorizontalSpacing;
@end

@implementation MFActionCardHeaderMetrics

- (double)minHorizontalSpacing
{
  return 12.0;
}

- (double)avatarDiameterForCurrentContentSize
{
  return 40.0;
}

@end