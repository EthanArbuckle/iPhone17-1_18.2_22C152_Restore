@interface NTKAdjustableTapTargetButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NTKAdjustableTapTargetButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)touchEdgeInsets;
- (void)setTouchEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation NTKAdjustableTapTargetButton

- (NTKAdjustableTapTargetButton)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAdjustableTapTargetButton;
  result = -[NTKAdjustableTapTargetButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&result->_touchEdgeInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&result->_touchEdgeInsets.bottom = v4;
  }
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(NTKAdjustableTapTargetButton *)self bounds];
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchEdgeInsets.right);
  double v16 = v15 - (top + self->_touchEdgeInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;
  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double bottom = self->_touchEdgeInsets.bottom;
  double right = self->_touchEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

@end