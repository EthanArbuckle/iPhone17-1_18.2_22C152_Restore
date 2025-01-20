@interface PUPXBarAppearanceImplementationDelegate
- (BOOL)barAppearanceIsStatusBarVisible:(id)a3;
@end

@implementation PUPXBarAppearanceImplementationDelegate

- (BOOL)barAppearanceIsStatusBarVisible:(id)a3
{
  v3 = [a3 viewController];
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v5 = [v4 isStatusBarHidden];

  v6 = [v3 navigationController];
  v7 = objc_msgSend(v6, "pu_currentNavigationTransition");

  if (v7) {
    char v5 = [v7 wasStatusBarHiddenBeforeTransition];
  }

  return v5 ^ 1;
}

@end