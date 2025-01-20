@interface NTKRichComplicationLineView
- (BOOL)_shouldReverseGradient;
- (CGPath)_generatePath;
- (CGPoint)_pointAtProgress:(float)a3;
- (double)_shapeLineWidth;
- (id)_normalizeGradientLocations:(id)a3;
- (void)_setupGradientLayer:(id)a3;
@end

@implementation NTKRichComplicationLineView

- (void)_setupGradientLayer:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F3A390];
  id v4 = a3;
  [v4 setType:v3];
  CGAffineTransformMakeRotation(&v6, -1.57079633);
  CGAffineTransform v5 = v6;
  [v4 setAffineTransform:&v5];
}

- (double)_shapeLineWidth
{
  [(NTKRichComplicationLineView *)self bounds];
  return v2;
}

- (CGPoint)_pointAtProgress:(float)a3
{
  [(NTKRichComplicationLineView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  v9 = [(CDRichComplicationShapeView *)self device];
  double v10 = _LayoutConstants_40(v9);

  double v11 = v10 + (v6 + v10 * -2.0) * a3;
  double v12 = v8 * 0.5;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)_normalizeGradientLocations:(id)a3
{
  id v3 = a3;
  return v3;
}

- (CGPath)_generatePath
{
  [(NTKRichComplicationLineView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CDRichComplicationShapeView *)self device];
  double v8 = _LayoutConstants_40(v7);

  v9 = [MEMORY[0x1E4FB14C0] bezierPath];
  double v10 = v6 * 0.5;
  objc_msgSend(v9, "moveToPoint:", v8, v10);
  objc_msgSend(v9, "addLineToPoint:", v4 - v8, v10);
  id v11 = v9;
  double v12 = (CGPath *)[v11 CGPath];

  return v12;
}

- (BOOL)_shouldReverseGradient
{
  return 0;
}

@end