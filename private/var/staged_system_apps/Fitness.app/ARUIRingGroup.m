@interface ARUIRingGroup
- (CGPoint)center;
- (void)setCenter:(CGPoint)a3;
@end

@implementation ARUIRingGroup

- (CGPoint)center
{
  v2 = self;
  [(ARUIRingGroup *)v2 translation];
  double v4 = v3;
  [(ARUIRingGroup *)v2 translation];
  float v8 = v5;

  double v6 = v8;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y = a3.y;
  [(ARUIRingGroup *)self setTranslation:COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)a3))];
}

@end