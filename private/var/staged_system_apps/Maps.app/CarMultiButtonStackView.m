@interface CarMultiButtonStackView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CarMultiButtonStackView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CarMultiButtonStackView *)self bounds];
  CGRect v11 = CGRectInset(v10, -8.5, -8.5);
  CGFloat v6 = x;
  CGFloat v7 = y;

  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

@end