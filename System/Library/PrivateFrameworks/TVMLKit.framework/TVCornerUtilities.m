@interface TVCornerUtilities
+ (BOOL)radiiIsZero:(TVCornerRadii)a3;
+ (CGPath)createPathForRadii:(TVCornerRadii)a3 inRect:(CGRect)a4;
+ (CGPath)createPathForRadii:(TVCornerRadii)a3 inRect:(CGRect)a4 isContinuous:(BOOL)a5;
+ (TVCornerRadii)flipCGOriginRadii:(TVCornerRadii)a3;
+ (TVCornerRadii)radiiFromRadius:(double)a3;
+ (double)radiusFromCornerRadii:(TVCornerRadii)a3;
@end

@implementation TVCornerUtilities

+ (BOOL)radiiIsZero:(TVCornerRadii)a3
{
  return a3.topLeft < 2.22044605e-16
      && a3.topRight < 2.22044605e-16
      && a3.bottomLeft < 2.22044605e-16
      && a3.bottomRight < 2.22044605e-16;
}

+ (TVCornerRadii)radiiFromRadius:(double)a3
{
  result.bottomRight = a3;
  result.bottomLeft = a3;
  result.topRight = a3;
  result.topLeft = a3;
  return result;
}

+ (TVCornerRadii)flipCGOriginRadii:(TVCornerRadii)a3
{
  double topRight = a3.topRight;
  double topLeft = a3.topLeft;
  double bottomLeft = a3.bottomLeft;
  double bottomRight = a3.bottomRight;
  double v7 = topLeft;
  double v8 = topRight;
  result.double bottomRight = v8;
  result.double bottomLeft = v7;
  result.double topRight = bottomRight;
  result.double topLeft = bottomLeft;
  return result;
}

+ (double)radiusFromCornerRadii:(TVCornerRadii)a3
{
  return fmax(fmax(a3.topLeft, a3.topRight), fmax(a3.bottomLeft, a3.bottomRight));
}

+ (CGPath)createPathForRadii:(TVCornerRadii)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double bottomRight = a3.bottomRight;
  double bottomLeft = a3.bottomLeft;
  double topRight = a3.topRight;
  double topLeft = a3.topLeft;
  v12 = objc_opt_class();
  return (CGPath *)objc_msgSend(v12, "createPathForRadii:inRect:isContinuous:", 0, topLeft, topRight, bottomLeft, bottomRight, x, y, width, height);
}

+ (CGPath)createPathForRadii:(TVCornerRadii)a3 inRect:(CGRect)a4 isContinuous:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double bottomRight = a3.bottomRight;
  double bottomLeft = a3.bottomLeft;
  double radius = a3.topRight;
  double topLeft = a3.topLeft;
  double MinX = CGRectGetMinX(a4);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v26);
  if (v5)
  {
    objc_msgSend(a1, "radiusFromCornerRadii:", topLeft, radius, bottomLeft, bottomRight);
    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", MinX, MinY, MaxX - MinX, MaxY - MinY, v16);
    id v17 = objc_claimAutoreleasedReturnValue();
    v18 = (CGPath *)MEMORY[0x230FC94F0]([v17 CGPath]);

    return v18;
  }
  else
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, topLeft + MinX, MinY);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, radius + MinY, radius);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MaxX - bottomRight, MaxY, bottomRight);
    CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MaxY - bottomLeft, bottomLeft);
    CGPathAddArcToPoint(Mutable, 0, MinX, MinY, topLeft + MinX, MinY, topLeft);
    return Mutable;
  }
}

@end