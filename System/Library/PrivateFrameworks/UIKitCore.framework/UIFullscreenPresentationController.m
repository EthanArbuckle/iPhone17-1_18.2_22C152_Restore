@interface UIFullscreenPresentationController
@end

@implementation UIFullscreenPresentationController

uint64_t __120___UIFullscreenPresentationController__adjustOrientationIfNecessaryInWindow_forViewController_preservingViewController___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __120___UIFullscreenPresentationController__adjustOrientationIfNecessaryInWindow_forViewController_preservingViewController___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 40)
  }
                                                                                            + 8)
                                                                                + 24);
  return result;
}

void __118___UIFullscreenPresentationController__placeCounterRotationViewWithView_inWindow_fromOrientation_toOrientation_force___block_invoke(uint64_t a1)
{
  -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:](*(id **)(a1 + 32), *(void *)(a1 + 40), 0, 1, 0.0);
  v2 = *(id **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:](v2, v3, 1, v4, 0.0);
}

void __69___UIFullscreenPresentationController__transitionDidEnd_isDismissal___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    [WeakRetained _removeCounterRotationIfApplied];
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v3 = [v5 presentedViewController];
      [v3 _setFreezeLayoutForOrientationChangeOnDismissal:0];
    }
    uint64_t v4 = (void *)v5[53];
    v5[53] = 0;

    WeakRetained = v5;
  }
}

@end