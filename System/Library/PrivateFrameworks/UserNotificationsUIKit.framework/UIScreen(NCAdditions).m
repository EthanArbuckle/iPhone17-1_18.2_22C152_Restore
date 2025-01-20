@interface UIScreen(NCAdditions)
+ (CGAffineTransform)nc_transformForScreenOriginRotation:()NCAdditions;
+ (uint64_t)nc_counterTransformForActiveInterfaceOrientation;
+ (uint64_t)nc_transformForInterfaceOrientation:()NCAdditions;
- (void)nc_bounds;
@end

@implementation UIScreen(NCAdditions)

+ (CGAffineTransform)nc_transformForScreenOriginRotation:()NCAdditions
{
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 _referenceBounds];
  double v6 = v5;
  double v8 = v7;

  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v11, v6 * 0.5, v8 * 0.5);
  CGAffineTransformRotate(&v12, &v11, a2);
  CGAffineTransform v10 = v12;
  return CGAffineTransformTranslate(a1, &v10, v6 * -0.5, v8 * -0.5);
}

+ (uint64_t)nc_transformForInterfaceOrientation:()NCAdditions
{
  switch(a3)
  {
    case 1:
      double v3 = 0.0;
      break;
    case 3:
      double v3 = 1.57079633;
      break;
    case 4:
      double v3 = -1.57079633;
      break;
    default:
      double v3 = 3.14159265;
      if (a3 != 2) {
        double v3 = 0.0;
      }
      break;
  }
  return objc_msgSend(a1, "nc_transformForScreenOriginRotation:", v3);
}

+ (uint64_t)nc_counterTransformForActiveInterfaceOrientation
{
  uint64_t v2 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation];
  uint64_t v3 = 3;
  if (v2 != 4) {
    uint64_t v3 = 4;
  }
  if ((unint64_t)(v2 - 3) >= 2) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v3;
  }

  return objc_msgSend(a1, "nc_transformForInterfaceOrientation:", v4);
}

- (void)nc_bounds
{
  [a1 _referenceBounds];
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  v9 = objc_opt_class();
  uint64_t v10 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation];
  if (v9) {
    objc_msgSend(v9, "nc_transformForInterfaceOrientation:", v10);
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  v12.origin.x = v2;
  v12.origin.y = v4;
  v12.size.width = v6;
  v12.size.height = v8;
  CGRectApplyAffineTransform(v12, &v11);
}

@end