@interface IMThemeBlissClassic
- (id)backgroundColorForNavigationBar:(id)a3;
- (id)p_tintAndTitleColor;
- (int64_t)chromeStatusBarStyle;
- (int64_t)contentStatusBarStyle;
@end

@implementation IMThemeBlissClassic

- (id)p_tintAndTitleColor
{
  return +[UIColor whiteColor];
}

- (id)backgroundColorForNavigationBar:(id)a3
{
  id v3 = [a3 traitCollection];

  return +[UIColor bc_darkSystemBackgroundForTraitCollection:v3];
}

- (int64_t)contentStatusBarStyle
{
  return 1;
}

- (int64_t)chromeStatusBarStyle
{
  return 0;
}

@end