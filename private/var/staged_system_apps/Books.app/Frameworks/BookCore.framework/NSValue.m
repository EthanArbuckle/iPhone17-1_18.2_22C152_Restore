@interface NSValue
+ (NSValue)valueWithUIEdgeInsets:(UIEdgeInsets)insets;
- (UIEdgeInsets)uiEdgeInsetsValue;
@end

@implementation NSValue

+ (NSValue)valueWithUIEdgeInsets:(UIEdgeInsets)insets
{
  UIEdgeInsets v5 = insets;
  v3 = +[NSValue valueWithBytes:&v5 objCType:"{UIEdgeInsets=dddd}"];

  return (NSValue *)v3;
}

- (UIEdgeInsets)uiEdgeInsetsValue
{
  long long v6 = 0u;
  long long v7 = 0u;
  [(NSValue *)self getValue:&v6];
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = *((double *)&v7 + 1);
  double v4 = *(double *)&v7;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end