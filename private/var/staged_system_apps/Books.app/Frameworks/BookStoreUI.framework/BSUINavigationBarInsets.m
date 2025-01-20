@interface BSUINavigationBarInsets
+ (UIEdgeInsets)compact;
+ (UIEdgeInsets)extraCompact;
+ (UIEdgeInsets)regular;
+ (UIEdgeInsets)sidebar;
- (BSUINavigationBarInsets)init;
@end

@implementation BSUINavigationBarInsets

+ (UIEdgeInsets)extraCompact
{
  double v2 = 0.0;
  double v3 = 16.0;
  double v4 = 0.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (UIEdgeInsets)compact
{
  double v2 = 32.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 32.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

+ (UIEdgeInsets)regular
{
  double v2 = 40.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 40.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

+ (UIEdgeInsets)sidebar
{
  double v2 = 0.0;
  double v3 = 24.0;
  double v4 = 0.0;
  double v5 = 24.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BSUINavigationBarInsets)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NavigationBarInsets();
  return [(BSUINavigationBarInsets *)&v3 init];
}

@end