@interface SliderLargerHitArea
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SliderLargerHitArea

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SliderLargerHitArea *)self bounds];
  double v7 = v6 + -22.0;
  double v9 = v8 + -22.0;
  double v11 = v10 + 44.0;
  double v13 = v12 + 22.0;
  CGFloat v14 = x;
  CGFloat v15 = y;

  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v14);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[SliderLargerHitArea pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    double v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SliderLargerHitArea;
    -[SliderLargerHitArea hitTest:withEvent:](&v11, "hitTest:withEvent:", v7, x, y);
    double v8 = (SliderLargerHitArea *)objc_claimAutoreleasedReturnValue();
  }
  double v9 = v8;

  return v9;
}

@end