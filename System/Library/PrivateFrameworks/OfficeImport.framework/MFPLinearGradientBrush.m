@interface MFPLinearGradientBrush
- (id)endColor;
- (id)startColor;
- (void)createShading;
- (void)setBounds:(CGRect)a3;
- (void)setEndColor:(id)a3;
- (void)setStartColor:(id)a3;
@end

@implementation MFPLinearGradientBrush

- (void)setBounds:(CGRect)a3
{
  self->mBounds = a3;
}

- (void)setStartColor:(id)a3
{
}

- (void)setEndColor:(id)a3
{
}

- (id)startColor
{
  return self->mStartColor;
}

- (id)endColor
{
  return self->mEndColor;
}

- (void)createShading
{
  p_mBounds = &self->mBounds;
  double MinX = CGRectGetMinX(self->mBounds);
  double MinY = CGRectGetMinY(*p_mBounds);
  double MaxX = CGRectGetMaxX(*p_mBounds);
  double v7 = CGRectGetMinY(*p_mBounds);
  p_mTransform = &self->super.mTransform;
  long long v9 = *(_OWORD *)&self->super.mTransform.c;
  *(_OWORD *)&v27.a = *(_OWORD *)&self->super.mTransform.a;
  *(_OWORD *)&v27.double c = v9;
  *(_OWORD *)&v27.double tx = *(_OWORD *)&self->super.mTransform.tx;
  if (!CGAffineTransformIsIdentity(&v27))
  {
    double MidX = CGRectGetMidX(*p_mBounds);
    double MidY = CGRectGetMidY(*p_mBounds);
    double v12 = CGRectGetMinX(*p_mBounds);
    double v13 = CGRectGetMinY(*p_mBounds);
    double v14 = CGRectGetMinX(*p_mBounds);
    CGFloat MaxY = CGRectGetMaxY(*p_mBounds);
    CGFloat b = self->super.mTransform.b;
    double c = self->super.mTransform.c;
    double d = self->super.mTransform.d;
    double tx = self->super.mTransform.tx;
    double ty = self->super.mTransform.ty;
    double v21 = tx + v13 * c + p_mTransform->a * v12;
    double v22 = ty + v13 * d + b * v12;
    float v23 = tx + MaxY * c + p_mTransform->a * v14 - v21;
    *(float *)&CGFloat MaxY = ty + MaxY * d + b * v14 - v22;
    *(float *)&CGFloat b = ((v22 - MidY) * (float)-v23 + *(float *)&MaxY * (v21 - MidX))
                 / ((float)-v23 * (float)-v23 + *(float *)&MaxY * *(float *)&MaxY);
    double v24 = (float)(*(float *)&MaxY * *(float *)&b);
    double MinX = MidX + v24;
    double v25 = (float)-(float)(v23 * *(float *)&b);
    double MinY = MidY + v25;
    double MaxX = MidX - v24;
    double v7 = MidY - v25;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v28.x = MinX;
  v28.y = MinY;
  v29.x = MaxX;
  v29.y = v7;
  self->super.mShading = CGShadingCreateAxial(DeviceRGB, v28, v29, self->super.mShadingFunction, 1, 1);
  CGColorSpaceRelease(DeviceRGB);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEndColor, 0);
  objc_storeStrong((id *)&self->mStartColor, 0);
}

@end