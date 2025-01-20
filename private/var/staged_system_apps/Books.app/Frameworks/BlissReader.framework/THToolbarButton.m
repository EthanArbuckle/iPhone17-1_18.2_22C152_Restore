@interface THToolbarButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)touchPadding;
- (void)setTouchPadding:(UIEdgeInsets)a3;
@end

@implementation THToolbarButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(THToolbarButton *)self touchPadding];
  double v8 = v7;
  double v10 = v9;
  double v12 = -v11;
  double v14 = -v13;
  [(THToolbarButton *)self bounds];
  double v16 = v15 - v10;
  double v18 = v17 - v8;
  double v20 = v19 - (v14 - v10);
  double v22 = v21 - (v12 - v8);
  CGFloat v23 = x;
  CGFloat v24 = y;

  return CGRectContainsPoint(*(CGRect *)&v16, *(CGPoint *)&v23);
}

- (UIEdgeInsets)touchPadding
{
  double top = self->_touchPadding.top;
  double left = self->_touchPadding.left;
  double bottom = self->_touchPadding.bottom;
  double right = self->_touchPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchPadding:(UIEdgeInsets)a3
{
  self->_touchPadding = a3;
}

@end