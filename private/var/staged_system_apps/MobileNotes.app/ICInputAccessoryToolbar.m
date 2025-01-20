@interface ICInputAccessoryToolbar
- (BOOL)isMinibar;
- (CGSize)intrinsicContentSize;
- (int64_t)barPosition;
@end

@implementation ICInputAccessoryToolbar

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isMinibar
{
  return 0;
}

- (int64_t)barPosition
{
  return 0;
}

@end