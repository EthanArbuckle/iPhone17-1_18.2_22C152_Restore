@interface _SBFluidSwitcherSheetMetricsView
- (UIEdgeInsets)_safeAreaInsetsForFrame:(CGRect)a3 inSuperview:(id)a4;
- (UIEdgeInsets)overrideSafeAreaInsets;
- (void)setOverrideSafeAreaInsets:(UIEdgeInsets)a3;
@end

@implementation _SBFluidSwitcherSheetMetricsView

- (UIEdgeInsets)_safeAreaInsetsForFrame:(CGRect)a3 inSuperview:(id)a4
{
  double top = self->_overrideSafeAreaInsets.top;
  double left = self->_overrideSafeAreaInsets.left;
  double bottom = self->_overrideSafeAreaInsets.bottom;
  double right = self->_overrideSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)overrideSafeAreaInsets
{
  double top = self->_overrideSafeAreaInsets.top;
  double left = self->_overrideSafeAreaInsets.left;
  double bottom = self->_overrideSafeAreaInsets.bottom;
  double right = self->_overrideSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOverrideSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_overrideSafeAreaInsets = a3;
}

@end