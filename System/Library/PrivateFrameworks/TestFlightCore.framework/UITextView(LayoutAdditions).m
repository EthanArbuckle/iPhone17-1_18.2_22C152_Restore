@interface UITextView(LayoutAdditions)
- (double)tf_estimatedFirstBaseline;
@end

@implementation UITextView(LayoutAdditions)

- (double)tf_estimatedFirstBaseline
{
  v2 = [a1 font];
  if (v2)
  {
    v3 = [a1 font];
    objc_msgSend(v3, "tf_estimatedFirstBaseline");
    double v5 = v4;
    [a1 textContainerInset];
    double v7 = v5 + v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

@end