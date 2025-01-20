@interface UINavigationContentAdjustments
- (UIEdgeInsets)insetAdjustment;
- (UIScrollView)adjustedScrollView;
- (void)setAdjustedScrollView:(id)a3;
- (void)setInsetAdjustment:(UIEdgeInsets)a3;
@end

@implementation UINavigationContentAdjustments

- (UIEdgeInsets)insetAdjustment
{
  double top = self->_insetAdjustment.top;
  double left = self->_insetAdjustment.left;
  double bottom = self->_insetAdjustment.bottom;
  double right = self->_insetAdjustment.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

- (void)setInsetAdjustment:(UIEdgeInsets)a3
{
  self->_insetAdjustment = a3;
}

- (UIScrollView)adjustedScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustedScrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setAdjustedScrollView:(id)a3
{
}

@end