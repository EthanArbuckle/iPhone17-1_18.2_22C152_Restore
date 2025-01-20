@interface UINavigationController(PKCompactNavigationContainer)
- (id)pkui_compactNavigationContainer;
@end

@implementation UINavigationController(PKCompactNavigationContainer)

- (id)pkui_compactNavigationContainer
{
  v2 = [a1 parentViewController];
  v3 = [v2 parentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  v6 = [v5 containedNavigationController];
  if (v6 == a1) {
    v7 = v5;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

@end