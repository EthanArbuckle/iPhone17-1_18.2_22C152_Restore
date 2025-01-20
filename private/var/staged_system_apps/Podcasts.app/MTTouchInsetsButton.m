@interface MTTouchInsetsButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)touchInsets;
- (void)setTouchInsets:(UIEdgeInsets)a3;
@end

@implementation MTTouchInsetsButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MTTouchInsetsButton *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(MTTouchInsetsButton *)self touchInsets];
  double v16 = v10 + v15;
  double v19 = v12 - (v17 + v18);
  double v21 = v14 - (v15 + v20);
  double v22 = v8 + v17;
  double v23 = v16;
  double v24 = v19;
  CGFloat v25 = x;
  CGFloat v26 = y;

  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v25);
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

@end