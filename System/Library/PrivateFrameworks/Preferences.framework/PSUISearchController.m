@interface PSUISearchController
- (int64_t)preferredStatusBarStyle;
@end

@implementation PSUISearchController

- (int64_t)preferredStatusBarStyle
{
  v2 = +[PSListController appearance];
  int64_t v3 = [v2 usesDarkTheme];

  return v3;
}

@end