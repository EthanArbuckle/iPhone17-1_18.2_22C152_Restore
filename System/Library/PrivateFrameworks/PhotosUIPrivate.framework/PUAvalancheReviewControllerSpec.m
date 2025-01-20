@interface PUAvalancheReviewControllerSpec
- (BOOL)allowsInterfaceRotation;
- (CGSize)selectionBadgeSize;
- (UIOffset)selectionBadgeOffset;
- (double)interItemSpacing;
- (unint64_t)selectionBadgeCorner;
@end

@implementation PUAvalancheReviewControllerSpec

- (double)interItemSpacing
{
  int v2 = PLIsTallScreen();
  double result = 15.0;
  if (v2) {
    return 10.0;
  }
  return result;
}

- (BOOL)allowsInterfaceRotation
{
  return 0;
}

- (unint64_t)selectionBadgeCorner
{
  return 8;
}

- (UIOffset)selectionBadgeOffset
{
  double v2 = 5.0;
  double v3 = 5.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (CGSize)selectionBadgeSize
{
  double v2 = 31.0;
  double v3 = 31.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end