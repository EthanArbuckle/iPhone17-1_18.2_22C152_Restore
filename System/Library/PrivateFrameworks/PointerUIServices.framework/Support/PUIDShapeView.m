@interface PUIDShapeView
+ (Class)layerClass;
- (UIBezierPath)path;
- (UIColor)fillColor;
- (void)setPath:(id)a3;
@end

@implementation PUIDShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UIColor)fillColor
{
  v2 = [(PUIDShapeView *)self shapeLayer];
  id v3 = [v2 fillColor];

  if (v3)
  {
    v4 = +[UIColor colorWithCGColor:v3];
  }
  else
  {
    v4 = 0;
  }
  return (UIColor *)v4;
}

- (UIBezierPath)path
{
  v2 = [(PUIDShapeView *)self shapeLayer];
  id v3 = [v2 path];
  if (v3)
  {
    v4 = +[UIBezierPath bezierPathWithCGPath:v3];
    v5 = [v2 fillRule];
    if ([v5 isEqualToString:kCAFillRuleEvenOdd]) {
      [v4 setUsesEvenOddFillRule:1];
    }
  }
  else
  {
    v4 = 0;
  }

  return (UIBezierPath *)v4;
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  id v7 = [(PUIDShapeView *)self shapeLayer];
  id v5 = v4;
  objc_msgSend(v7, "setPath:", objc_msgSend(v5, "CGPath"));
  LODWORD(v4) = [v5 usesEvenOddFillRule];

  v6 = &kCAFillRuleEvenOdd;
  if (!v4) {
    v6 = &kCAFillRuleNonZero;
  }
  [v7 setFillRule:*v6];
}

@end