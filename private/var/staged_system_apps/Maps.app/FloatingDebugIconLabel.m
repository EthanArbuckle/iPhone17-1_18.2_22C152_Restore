@interface FloatingDebugIconLabel
- (CGSize)intrinsicContentSize;
@end

@implementation FloatingDebugIconLabel

- (CGSize)intrinsicContentSize
{
  v5.receiver = self;
  v5.super_class = (Class)FloatingDebugIconLabel;
  [(FloatingDebugIconLabel *)&v5 intrinsicContentSize];
  double v4 = v3 + 8.0;
  result.height = v2;
  result.width = v4;
  return result;
}

@end