@interface GQDConnectionPath
- (CGPath)createBezierPath;
- (CGPoint)point;
- (CGSize)size;
@end

@implementation GQDConnectionPath

- (CGPoint)point
{
  double x = self->mPoint.x;
  double y = self->mPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPath)createBezierPath
{
  Mutable = CGPathCreateMutable();
  double y = CGPointZero.y;
  double width = self->mSize.width;
  double height = self->mSize.height;
  double v34 = height;
  double x = self->mPoint.x;
  double v8 = self->mPoint.y;
  double v9 = sub_50528(CGPointZero.x, y, 0.25);
  double v10 = sub_5051C(x, v8, v9);
  double v12 = v11;
  double v13 = sub_50528(width, height, 0.25);
  double v14 = sub_5051C(v10, v12, v13);
  double v16 = sub_50528(v14, v15, 2.0);
  double v18 = v17;
  double v19 = sub_50528(CGPointZero.x, y, 0.33333);
  double v21 = v20;
  double v22 = sub_50528(v16, v18, 0.66667);
  double v23 = sub_4D9B8(v19, v21, v22);
  CGFloat v25 = v24;
  double v26 = sub_50528(v16, v18, 0.66667);
  double v28 = v27;
  double v29 = sub_50528(width, v34, 0.33333);
  double v30 = sub_4D9B8(v26, v28, v29);
  CGFloat v32 = v31;
  CGPathMoveToPoint(Mutable, 0, CGPointZero.x, y);
  CGPathAddCurveToPoint(Mutable, 0, v23, v25, v30, v32, width, v34);
  return Mutable;
}

@end