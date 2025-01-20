@interface SBAppSwitcherScrollView
- (CGPoint)contentOffsetVelocity;
- (CGPoint)contentOffsetVelocityConsideringNextContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3;
@end

@implementation SBAppSwitcherScrollView

- (void)setContentOffset:(CGPoint)a3
{
  double v4 = fabs(a3.x);
  if (v4 >= INFINITY) {
    double x = 0.0;
  }
  else {
    double x = a3.x;
  }
  if (v4 <= INFINITY) {
    double v6 = x;
  }
  else {
    double v6 = a3.x;
  }
  double v7 = fabs(a3.y);
  BOOL v8 = v7 <= INFINITY;
  if (v7 >= INFINITY) {
    double y = 0.0;
  }
  else {
    double y = a3.y;
  }
  if (v8) {
    double v10 = y;
  }
  else {
    double v10 = a3.y;
  }
  [(SBAppSwitcherScrollView *)self contentOffset];
  double v12 = v11;
  double v14 = v13;
  v21.receiver = self;
  v21.super_class = (Class)SBAppSwitcherScrollView;
  -[BSUIScrollView setContentOffset:](&v21, sel_setContentOffset_, v6, v10);
  if (v6 != v12 || v10 != v14)
  {
    CFTimeInterval v16 = CACurrentMediaTime();
    double v17 = v16 - self->_previousScrollTime;
    if (v17 > 0.009)
    {
      double v18 = v17 * 1000.0;
      CGFloat v19 = (v6 - self->_previousContentOffset.x) / v18;
      CGFloat v20 = (v10 - self->_previousContentOffset.y) / v18;
      self->_rawContentOffsetVelocity.double x = v19;
      self->_rawContentOffsetVelocity.double y = v20;
      self->_previousContentOffset.double x = v6;
      self->_previousContentOffset.double y = v10;
      self->_previousScrollTime = v16;
    }
  }
}

- (CGPoint)contentOffsetVelocity
{
  if (1.0 / (CACurrentMediaTime() - self->_previousScrollTime) >= 5.0) {
    p_rawContentOffsetVelocitdouble y = &self->_rawContentOffsetVelocity;
  }
  else {
    p_rawContentOffsetVelocitdouble y = (CGPoint *)MEMORY[0x1E4F1DAD8];
  }
  double x = p_rawContentOffsetVelocity->x;
  double y = p_rawContentOffsetVelocity->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)contentOffsetVelocityConsideringNextContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SBAppSwitcherScrollView *)self contentOffsetVelocity];
  double v7 = v6;
  double v9 = v8;
  double v10 = CACurrentMediaTime() - self->_previousScrollTime;
  if (v10 > 0.009 && v10 < 5.0)
  {
    double v12 = v10 * 1000.0;
    double v7 = (x - self->_previousContentOffset.x) / v12;
    double v9 = (y - self->_previousContentOffset.y) / v12;
  }
  double v13 = v7;
  double v14 = v9;
  result.double y = v14;
  result.double x = v13;
  return result;
}

@end