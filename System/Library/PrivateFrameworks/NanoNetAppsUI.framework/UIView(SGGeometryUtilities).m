@interface UIView(SGGeometryUtilities)
- (uint64_t)SG_setBoundsAndPositionFromFrame:()SGGeometryUtilities;
@end

@implementation UIView(SGGeometryUtilities)

- (uint64_t)SG_setBoundsAndPositionFromFrame:()SGGeometryUtilities
{
  [a1 bounds];
  objc_msgSend(a1, "setBounds:");
  v10 = [a1 layer];
  [v10 anchorPoint];
  double v12 = v11;
  double v14 = v13;

  return objc_msgSend(a1, "setCenter:", a2 + v12 * a4, a3 + v14 * a5);
}

@end