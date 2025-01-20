@interface SBStatusBarWindowRootViewController
@end

@implementation SBStatusBarWindowRootViewController

uint64_t __91___SBStatusBarWindowRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _statusBarWillAnimateRotation];
  [*(id *)(a1 + 40) _setStatusBarWindowOrientation:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setOrientation:v3];
}

uint64_t __91___SBStatusBarWindowRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _statusBarDidAnimateRotation];
}

@end