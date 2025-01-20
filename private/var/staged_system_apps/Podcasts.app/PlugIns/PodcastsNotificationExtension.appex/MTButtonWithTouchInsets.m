@interface MTButtonWithTouchInsets
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_boundsRelativeHitRect;
- (MTButtonWithTouchInsets)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)touchInsets;
- (void)layoutSubviews;
- (void)setTouchInsets:(UIEdgeInsets)a3;
@end

@implementation MTButtonWithTouchInsets

- (MTButtonWithTouchInsets)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTButtonWithTouchInsets;
  result = -[MTButtonWithTouchInsets initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    long long v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&result->_touchInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&result->_touchInsets.bottom = v4;
  }
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  if (self->_touchInsets.left != a3.left
    || self->_touchInsets.top != a3.top
    || self->_touchInsets.right != a3.right
    || self->_touchInsets.bottom != a3.bottom)
  {
    self->_touchInsets = a3;
    [(MTButtonWithTouchInsets *)self updateDebugUI];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTButtonWithTouchInsets;
  [(MTButtonWithTouchInsets *)&v3 layoutSubviews];
  [(MTButtonWithTouchInsets *)self updateDebugUI];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MTButtonWithTouchInsets *)self _boundsRelativeHitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)_boundsRelativeHitRect
{
  [(MTButtonWithTouchInsets *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MTButtonWithTouchInsets *)self touchInsets];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end