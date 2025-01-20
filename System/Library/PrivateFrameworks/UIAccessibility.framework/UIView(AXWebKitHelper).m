@interface UIView(AXWebKitHelper)
- (double)accessibilityConvertPointFromSceneReferenceCoordinates:()AXWebKitHelper;
- (uint64_t)accessibilityConvertRectToSceneReferenceCoordinates:()AXWebKitHelper;
@end

@implementation UIView(AXWebKitHelper)

- (double)accessibilityConvertPointFromSceneReferenceCoordinates:()AXWebKitHelper
{
  v6 = [a1 window];
  double v7 = AXConvertFromDisplayPointToWindowPoint(v6, a2, a3);
  double v9 = v8;

  v10 = [a1 window];
  objc_msgSend(a1, "convertPoint:fromView:", v10, v7, v9);
  double v12 = v11;

  return v12;
}

- (uint64_t)accessibilityConvertRectToSceneReferenceCoordinates:()AXWebKitHelper
{
  CGRect v8 = UIAccessibilityConvertFrameToScreenCoordinates(*(CGRect *)&a2, a1);

  return -[UIView _accessibilityConvertSystemBoundedScreenRectToContextSpace:](a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
}

@end