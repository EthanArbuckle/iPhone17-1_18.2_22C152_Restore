@interface UIView(CACZoomExtras)
- (double)zw_boundsCenter;
- (double)zw_convertPointFromScreenCoordinates:()CACZoomExtras;
- (double)zw_convertPointToScreenCoordinates:()CACZoomExtras;
- (double)zw_convertRectFromScreenCoordinates:()CACZoomExtras;
- (double)zw_convertRectToScreenCoordinates:()CACZoomExtras;
- (uint64_t)zw_convertBoundsToScreenCoordinates;
@end

@implementation UIView(CACZoomExtras)

- (double)zw_boundsCenter
{
  [a1 bounds];
  double MidX = CGRectGetMidX(v4);
  [a1 bounds];
  CGRectGetMidY(v5);
  return MidX;
}

- (double)zw_convertRectToScreenCoordinates:()CACZoomExtras
{
  v10 = [a1 window];
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "convertRect:fromView:", a1, a2, a3, a4, a5);
    objc_msgSend(v11, "_convertRectToSceneReferenceSpace:");
    a2 = v12;
  }

  return a2;
}

- (double)zw_convertRectFromScreenCoordinates:()CACZoomExtras
{
  v10 = [a1 window];
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_convertRectFromSceneReferenceSpace:", a2, a3, a4, a5);
    objc_msgSend(v11, "convertRect:toView:", a1);
    a2 = v12;
  }

  return a2;
}

- (double)zw_convertPointToScreenCoordinates:()CACZoomExtras
{
  v6 = [a1 window];
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "convertPoint:fromView:", a1, a2, a3);
    objc_msgSend(v7, "_convertPointToSceneReferenceSpace:");
    a2 = v8;
  }

  return a2;
}

- (double)zw_convertPointFromScreenCoordinates:()CACZoomExtras
{
  v6 = [a1 window];
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_convertPointFromSceneReferenceSpace:", a2, a3);
    objc_msgSend(v7, "convertPoint:toView:", a1);
    a2 = v8;
  }

  return a2;
}

- (uint64_t)zw_convertBoundsToScreenCoordinates
{
  [a1 bounds];
  return objc_msgSend(a1, "zw_convertRectToScreenCoordinates:");
}

@end