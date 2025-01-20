@interface WLEasyToHitCustomView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)margins;
- (void)setMargins:(UIEdgeInsets)a3;
@end

@implementation WLEasyToHitCustomView

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(WLEasyToHitCustomView *)self bounds];
  [(WLEasyToHitCustomView *)self margins];
  UIRectInset();
  CGFloat v11 = x;
  CGFloat v12 = y;

  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v11);
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end