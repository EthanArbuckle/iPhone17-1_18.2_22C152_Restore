@interface UISplitViewControllerTVSidebarSupported
@end

@implementation UISplitViewControllerTVSidebarSupported

void ___UISplitViewControllerTVSidebarSupported_block_invoke()
{
  _UIMainBundleIdentifier();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if (([v1 isEqualToString:@"com.apple.TVWatchList"] & 1) == 0)
  {
    v0 = _UIKitUserDefaults();
    [v0 BOOLForKey:@"ForceSupportTVSidebar"];
  }
}

@end