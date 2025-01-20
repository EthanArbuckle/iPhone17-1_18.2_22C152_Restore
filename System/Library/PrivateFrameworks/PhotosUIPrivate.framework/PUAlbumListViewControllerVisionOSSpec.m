@interface PUAlbumListViewControllerVisionOSSpec
- (CGSize)imageSize;
- (CGSize)stackSize;
- (double)cellBackgroundCornerRadius;
- (double)posterSquareCornerRadius;
- (double)posterSubitemCornerRadius;
@end

@implementation PUAlbumListViewControllerVisionOSSpec

- (double)cellBackgroundCornerRadius
{
  return 16.0;
}

- (double)posterSubitemCornerRadius
{
  return 8.0;
}

- (double)posterSquareCornerRadius
{
  return 8.0;
}

- (CGSize)stackSize
{
  double v2 = 224.0;
  double v3 = 224.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)imageSize
{
  double v2 = PUPixelSizeFromPointSize(224.0);
  result.height = v3;
  result.width = v2;
  return result;
}

@end