@interface UISegmentedControl(PhotosUICore)
+ (double)px_defaultMinimumSegmentWidth;
- (double)_pxswizzled_sizeThatFits:()PhotosUICore;
- (double)px_minimumSegmentWidth;
- (void)px_setMinimumSegmentWidth:()PhotosUICore;
@end

@implementation UISegmentedControl(PhotosUICore)

- (double)_pxswizzled_sizeThatFits:()PhotosUICore
{
  objc_msgSend(a1, "_pxswizzled_sizeThatFits:");
  double v3 = v2;
  objc_msgSend(a1, "px_minimumSegmentWidth");
  if (v4 > 0.0)
  {
    double v5 = v4;
    unint64_t v6 = [a1 numberOfSegments];
    if (v3 < v5 * (double)v6) {
      return v5 * (double)v6;
    }
  }
  return v3;
}

- (void)px_setMinimumSegmentWidth:()PhotosUICore
{
  if (px_setMinimumSegmentWidth__onceToken != -1) {
    dispatch_once(&px_setMinimumSegmentWidth__onceToken, &__block_literal_global_263780);
  }
  id v4 = [NSNumber numberWithDouble:a2];
  objc_setAssociatedObject(a1, sel_px_minimumSegmentWidth, v4, (void *)1);
}

- (double)px_minimumSegmentWidth
{
  v1 = objc_getAssociatedObject(a1, sel_px_minimumSegmentWidth);
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

+ (double)px_defaultMinimumSegmentWidth
{
  return 80.0;
}

@end