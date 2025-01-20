@interface CAShapeLayer
- (void)setFillColor:(CGColor *)a3 animated:(BOOL)a4;
- (void)setOpacity:(float)a3 animated:(BOOL)a4;
- (void)setPath:(CGPath *)a3 animated:(BOOL)a4;
- (void)setPath:(CGPath *)a3 fromPath:(CGPath *)a4 animated:(BOOL)a5;
- (void)setStrokeColor:(CGColor *)a3 animated:(BOOL)a4;
@end

@implementation CAShapeLayer

- (void)setPath:(CGPath *)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (!CGPathEqualToPath([(CAShapeLayer *)self path], a3))
  {
    if (v4)
    {
      [(CAShapeLayer *)self animateProperty:@"path" toValue:a3 timing:kCAMediaTimingFunctionEaseOut];
    }
    else
    {
      [(CAShapeLayer *)self setPath:a3];
    }
  }
}

- (void)setPath:(CGPath *)a3 fromPath:(CGPath *)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (!CGPathEqualToPath([(CAShapeLayer *)self path], a3))
  {
    if (v5)
    {
      [(CAShapeLayer *)self animateProperty:@"path" toValue:a3 fromValue:a4 timing:kCAMediaTimingFunctionEaseOut];
    }
    else
    {
      [(CAShapeLayer *)self setPath:a3];
    }
  }
}

- (void)setFillColor:(CGColor *)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (!CGColorEqualToColor([(CAShapeLayer *)self fillColor], a3))
  {
    if (v4)
    {
      [(CAShapeLayer *)self animateProperty:@"fillColor" toValue:a3 timing:kCAMediaTimingFunctionLinear];
    }
    else
    {
      [(CAShapeLayer *)self setFillColor:a3];
    }
  }
}

- (void)setStrokeColor:(CGColor *)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (!CGColorEqualToColor([(CAShapeLayer *)self strokeColor], a3))
  {
    if (v4)
    {
      [(CAShapeLayer *)self animateProperty:@"strokeColor" toValue:a3 timing:kCAMediaTimingFunctionLinear];
    }
    else
    {
      [(CAShapeLayer *)self setStrokeColor:a3];
    }
  }
}

- (void)setOpacity:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CAShapeLayer *)self opacity];
  if (*(float *)&v7 != a3)
  {
    if (v4)
    {
      *(float *)&double v7 = a3;
      id v8 = +[NSNumber numberWithFloat:v7];
      [(CAShapeLayer *)self animateProperty:@"opacity" toValue:v8 timing:kCAMediaTimingFunctionLinear];
    }
    else
    {
      *(float *)&double v7 = a3;
      [(CAShapeLayer *)self setOpacity:v7];
    }
  }
}

@end