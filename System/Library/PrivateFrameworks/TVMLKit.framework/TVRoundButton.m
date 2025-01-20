@interface TVRoundButton
@end

@implementation TVRoundButton

void __59___TVRoundButton__updateFloaingViewFocusState_coordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v3 = [WeakRetained floatingView];
    [v3 setControlState:8 * *(unsigned __int8 *)(a1 + 48) withAnimationCoordinator:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

@end