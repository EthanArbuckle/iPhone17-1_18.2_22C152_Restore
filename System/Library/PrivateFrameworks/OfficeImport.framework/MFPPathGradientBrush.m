@interface MFPPathGradientBrush
- (id)endColor;
- (id)startColor;
- (void)createShading;
- (void)setCenterColor:(id)a3;
- (void)setCenterPoint:(CGPoint)a3;
- (void)setPath:(id)a3;
- (void)setSurroundColors:(id)a3;
@end

@implementation MFPPathGradientBrush

- (void)setCenterColor:(id)a3
{
}

- (void)setCenterPoint:(CGPoint)a3
{
  self->mCenterPoint = a3;
}

- (void)setSurroundColors:(id)a3
{
}

- (void)setPath:(id)a3
{
}

- (void)createShading
{
  [(OITSUBezierPath *)self->mPath bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  long double width = v12.size.width;
  long double height = v12.size.height;
  CGFloat MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.long double width = width;
  v13.size.long double height = height;
  CGFloat MidY = CGRectGetMidY(v13);
  *(float *)&CGFloat y = hypot(width, height) * 0.5;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11.CGFloat x = MidX;
  v11.CGFloat y = MidY;
  self->super.mShading = CGShadingCreateRadial(DeviceRGB, self->mCenterPoint, 0.0, v11, *(float *)&y, self->super.mShadingFunction, 1, 1);
  CGColorSpaceRelease(DeviceRGB);
}

- (id)startColor
{
  return self->mCenterColor;
}

- (id)endColor
{
  return [(NSArray *)self->mSurroundColors objectAtIndex:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPath, 0);
  objc_storeStrong((id *)&self->mSurroundColors, 0);
  objc_storeStrong((id *)&self->mCenterColor, 0);
}

@end