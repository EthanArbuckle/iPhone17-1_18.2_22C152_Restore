@interface UIViewController(PKUIUtilities)
- (id)pkui_frontMostViewController;
- (uint64_t)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (uint64_t)pkui_userInterfaceIdiomSupportsLargeLayouts;
@end

@implementation UIViewController(PKUIUtilities)

- (id)pkui_frontMostViewController
{
  v2 = (void *)MEMORY[0x1A6224460]();
  uint64_t v3 = [a1 presentedViewController];
  v4 = (void *)v3;
  if (!v3 || (void *)v3 == a1)
  {
    id v7 = a1;
  }
  else
  {
    while (1)
    {
      v5 = [v4 presentedViewController];
      if (!v5 || v4 == v5) {
        break;
      }
      v6 = v4;
      v4 = v5;
    }
    id v7 = v4;
    v4 = v7;
  }
  v8 = v7;

  return v8;
}

- (uint64_t)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 0;
}

- (uint64_t)pkui_userInterfaceIdiomSupportsLargeLayouts
{
  v1 = [a1 traitCollection];
  unint64_t v2 = [v1 userInterfaceIdiom];
  uint64_t v3 = (v2 < 7) & (0x62u >> v2);

  return v3;
}

@end