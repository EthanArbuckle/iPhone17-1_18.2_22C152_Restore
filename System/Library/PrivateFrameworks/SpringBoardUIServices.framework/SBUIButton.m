@interface SBUIButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SBUIButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)hitAreaAdjustments;
- (void)setHitAreaAdjustments:(UIEdgeInsets)a3;
@end

@implementation SBUIButton

- (SBUIButton)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIButton;
  result = -[SBUIButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&result->_hitAreaAdjustments.top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&result->_hitAreaAdjustments.bottom = v4;
  }
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(SBUIButton *)self bounds];
  double top = self->_hitAreaAdjustments.top;
  double left = self->_hitAreaAdjustments.left;
  v18.origin.double x = v10 + left;
  v18.origin.double y = v11 + top;
  v18.size.width = v12 - (left + self->_hitAreaAdjustments.right);
  v18.size.height = v13 - (top + self->_hitAreaAdjustments.bottom);
  v17.double x = x;
  v17.double y = y;
  if (CGRectContainsPoint(v18, v17))
  {
    BOOL v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBUIButton;
    BOOL v14 = -[SBUIButton pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
  }

  return v14;
}

- (UIEdgeInsets)hitAreaAdjustments
{
  double top = self->_hitAreaAdjustments.top;
  double left = self->_hitAreaAdjustments.left;
  double bottom = self->_hitAreaAdjustments.bottom;
  double right = self->_hitAreaAdjustments.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitAreaAdjustments:(UIEdgeInsets)a3
{
  self->_hitAreaAdjustments = a3;
}

@end