@interface EmptyApertureView
- (CGSize)intrinsicContentSize;
- (id)accessibilityIdentifier;
@end

@implementation EmptyApertureView

- (CGSize)intrinsicContentSize
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)accessibilityIdentifier
{
  double v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end