@interface UIViewController(StocksUI)
- (BOOL)su_isAppeared;
@end

@implementation UIViewController(StocksUI)

- (BOOL)su_isAppeared
{
  return [a1 _appearState] == 2;
}

@end