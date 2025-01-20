@interface SiriUIReusableFooterView
+ (double)defaultHeight;
+ (id)elementKind;
+ (id)reuseIdentifier;
- (UIEdgeInsets)edgeInsets;
@end

@implementation SiriUIReusableFooterView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

+ (double)defaultHeight
{
  return 0.0;
}

+ (id)elementKind
{
  return (id)*MEMORY[0x263F1D118];
}

- (UIEdgeInsets)edgeInsets
{
  double v2 = 0.0;
  double v3 = 8.0;
  double v4 = 0.0;
  double v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end