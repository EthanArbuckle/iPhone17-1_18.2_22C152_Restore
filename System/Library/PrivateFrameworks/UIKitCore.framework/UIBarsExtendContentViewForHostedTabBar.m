@interface UIBarsExtendContentViewForHostedTabBar
@end

@implementation UIBarsExtendContentViewForHostedTabBar

void ___UIBarsExtendContentViewForHostedTabBar_block_invoke()
{
  _UIMainBundleIdentifier();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"ExtendContentViewForHostedTabBar"];

  if (v1
    || (_UIKitPreferencesOnce(),
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 objectForKey:@"ExtendContentViewForHostedTabBar"],
        v1 = objc_claimAutoreleasedReturnValue(),
        v2,
        v1))
  {
    _UIBarsExtendContentViewForHostedTabBar_extendContentViewForHostedTabBar = [v1 BOOLValue];
  }
}

@end