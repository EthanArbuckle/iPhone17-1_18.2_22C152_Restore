@interface UILabel
- (double)firstBaselineFromTop;
- (double)lastBaselineFromBottom;
@end

@implementation UILabel

- (double)firstBaselineFromTop
{
  [(UILabel *)self _firstBaselineOffsetFromTop];
  return result;
}

- (double)lastBaselineFromBottom
{
  [(UILabel *)self _baselineOffsetFromBottom];
  return result;
}

@end