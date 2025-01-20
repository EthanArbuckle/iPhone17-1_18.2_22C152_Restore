@interface UIRootPresentationController
@end

@implementation UIRootPresentationController

void __91___UIRootPresentationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentedViewController];
  [v1 setNeedsStatusBarAppearanceUpdate];
}

@end