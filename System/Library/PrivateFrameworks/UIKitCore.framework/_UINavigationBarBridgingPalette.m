@interface _UINavigationBarBridgingPalette
- (BOOL)_paletteOverridesPinningBar;
- (BOOL)_shouldUpdateBackground;
- (BOOL)isAttached;
- (BOOL)isVisibleWhenPinningBarIsHidden;
- (BOOL)paletteIsHidden;
- (BOOL)paletteShadowIsHidden;
- (BOOL)pinningBarShadowIsHidden;
- (BOOL)pinningBarShadowWasHidden;
- (UIEdgeInsets)preferredContentInsets;
- (UINavigationController)navController;
- (UIView)_backgroundView;
- (id)_attachedPinningTopBar;
- (unint64_t)boundaryEdge;
- (void)_setSize:(CGSize)a3;
- (void)setFrame:(CGRect)a3 isAnimating:(BOOL)a4;
@end

@implementation _UINavigationBarBridgingPalette

- (void)_setSize:(CGSize)a3
{
}

- (void)setFrame:(CGRect)a3 isAnimating:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIView *)self setFrame:a4];
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v11);
  [(_UINavigationBarPalette *)self setPreferredHeight:v9];
}

- (UIView)_backgroundView
{
  temporaryBackgroundView = self->_temporaryBackgroundView;
  if (!temporaryBackgroundView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_temporaryBackgroundView;
    self->_temporaryBackgroundView = v4;

    temporaryBackgroundView = self->_temporaryBackgroundView;
  }
  return temporaryBackgroundView;
}

- (BOOL)_paletteOverridesPinningBar
{
  return 0;
}

- (UINavigationController)navController
{
  return 0;
}

- (unint64_t)boundaryEdge
{
  return 0;
}

- (BOOL)pinningBarShadowWasHidden
{
  return 0;
}

- (BOOL)pinningBarShadowIsHidden
{
  return 0;
}

- (BOOL)paletteShadowIsHidden
{
  return 0;
}

- (BOOL)isVisibleWhenPinningBarIsHidden
{
  return 0;
}

- (UIEdgeInsets)preferredContentInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isAttached
{
  double v2 = [(UIView *)self window];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)paletteIsHidden
{
  double v2 = [(UIView *)self window];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)_attachedPinningTopBar
{
  return 0;
}

- (BOOL)_shouldUpdateBackground
{
  return 0;
}

- (void).cxx_destruct
{
}

@end