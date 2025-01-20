@interface UIView
- (double)firstBaselineFromTop;
- (double)lastBaselineFromBottom;
- (double)lastBaselineMaxY;
@end

@implementation UIView

- (double)firstBaselineFromTop
{
  v2 = self;
  [(UIView *)v2 frame];
  double MaxY = CGRectGetMaxY(v5);

  return MaxY;
}

- (double)lastBaselineFromBottom
{
  return 0.0;
}

- (double)lastBaselineMaxY
{
  v2 = self;
  [(UIView *)v2 frame];
  double MaxY = CGRectGetMaxY(v7);
  [(UIView *)v2 lastBaselineFromBottom];
  double v5 = v4;

  return MaxY - v5;
}

@end