@interface PXPhotosChromeSpec
+ (CGSize)secondaryToolbarSize;
+ (UIEdgeInsets)secondaryToolbarPaddingForSizeClass:(int64_t)a3 safeAreaInsets:(UIEdgeInsets)a4;
+ (double)maximumAccessoryViewPadding;
- (PXPhotosChromeSpec)init;
@end

@implementation PXPhotosChromeSpec

+ (double)maximumAccessoryViewPadding
{
  return 40.0;
}

+ (UIEdgeInsets)secondaryToolbarPaddingForSizeClass:(int64_t)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4 = sub_1A9BA9168(a3, a4.bottom);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (CGSize)secondaryToolbarSize
{
  double v2 = 216.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PXPhotosChromeSpec)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosChromeSpec();
  return [(PXPhotosChromeSpec *)&v3 init];
}

@end