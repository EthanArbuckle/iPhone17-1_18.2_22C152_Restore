@interface VSMaximumWidthMultilineButton
- (CGSize)intrinsicContentSize;
@end

@implementation VSMaximumWidthMultilineButton

- (CGSize)intrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)VSMaximumWidthMultilineButton;
  [(VSMultilineButton *)&v4 intrinsicContentSize];
  double v3 = 1.79769313e308;
  result.height = v2;
  result.width = v3;
  return result;
}

@end