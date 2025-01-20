@interface IMTouchInsetsButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)titleDoesNotFollowTintColor;
- (UIEdgeInsets)touchInsets;
- (void)setTitleDoesNotFollowTintColor:(BOOL)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)tintColorDidChange;
@end

@implementation IMTouchInsetsButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(IMTouchInsetsButton *)self bounds];
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchInsets.right);
  double v16 = v15 - (top + self->_touchInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;

  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)IMTouchInsetsButton;
  [(IMTouchInsetsButton *)&v4 tintColorDidChange];
  if (!self->_titleDoesNotFollowTintColor)
  {
    v3 = [(IMTouchInsetsButton *)self tintColor];
    [(IMTouchInsetsButton *)self setTitleColor:v3 forState:0];
  }
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

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (BOOL)titleDoesNotFollowTintColor
{
  return self->_titleDoesNotFollowTintColor;
}

- (void)setTitleDoesNotFollowTintColor:(BOOL)a3
{
  self->_titleDoesNotFollowTintColor = a3;
}

@end