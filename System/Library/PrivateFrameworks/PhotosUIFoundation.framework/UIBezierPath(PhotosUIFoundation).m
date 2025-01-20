@interface UIBezierPath(PhotosUIFoundation)
+ (id)px_bezierPathWithRoundedRect:()PhotosUIFoundation cornerRadius:continuousCorners:;
+ (id)px_bezierPathWithRoundedRect:()PhotosUIFoundation topLeftCornerRadius:topRightCornerRadius:bottomLeftCornerRadius:bottomRightCornerRadius:;
@end

@implementation UIBezierPath(PhotosUIFoundation)

+ (id)px_bezierPathWithRoundedRect:()PhotosUIFoundation cornerRadius:continuousCorners:
{
  if (a3) {
    objc_msgSend(a1, "_bezierPathWithPillRect:cornerRadius:");
  }
  else {
  v3 = objc_msgSend(a1, "_bezierPathWithArcRoundedRect:cornerRadius:");
  }

  return v3;
}

+ (id)px_bezierPathWithRoundedRect:()PhotosUIFoundation topLeftCornerRadius:topRightCornerRadius:bottomLeftCornerRadius:bottomRightCornerRadius:
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a2);
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = a4;
  v28.size.height = a5;
  double MaxY = CGRectGetMaxY(v28);
  double v19 = MaxY - a9;
  double v20 = MaxX - a9;
  double v26 = a8;
  double v21 = MaxY - a8;
  double v22 = a6;
  v23 = [a1 bezierPath];
  objc_msgSend(v23, "moveToPoint:", a6, 0.0);
  objc_msgSend(v23, "addLineToPoint:", MaxX - a7, 0.0);
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", MaxX, a7, MaxX, 0.0);
  if (v19 != a7) {
    objc_msgSend(v23, "addLineToPoint:", MaxX, v19);
  }
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", v20, MaxY, MaxX, MaxY, *(void *)&a6);
  objc_msgSend(v23, "addLineToPoint:", v26, MaxY);
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", 0.0, v21, 0.0, MaxY);
  if (v21 != v22) {
    objc_msgSend(v23, "addLineToPoint:", 0.0, v22);
  }
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", v22, 0.0, 0.0, 0.0);
  [v23 setLineJoinStyle:1];

  return v23;
}

@end