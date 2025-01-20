@interface UIImage(SBFImageTiling)
- (uint64_t)sbf_imageByTilingCenterPixel;
@end

@implementation UIImage(SBFImageTiling)

- (uint64_t)sbf_imageByTilingCenterPixel
{
  [a1 size];
  [a1 scale];
  UIFloorToScale();
  double v3 = v2;
  UIFloorToScale();
  return objc_msgSend(a1, "resizableImageWithCapInsets:", v4, v3, v4, v3);
}

@end