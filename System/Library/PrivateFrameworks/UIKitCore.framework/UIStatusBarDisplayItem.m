@interface UIStatusBarDisplayItem
@end

@implementation UIStatusBarDisplayItem

uint64_t __48___UIStatusBarDisplayItem_applyStyleAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyStyleAttributes:*(void *)(a1 + 40)];
}

void __39___UIStatusBarDisplayItem_setFloating___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    [WeakRetained setFloatingTimer:0];
    int v3 = [v4 floating];
    v2 = v4;
    if (v3)
    {
      [v4 _detectedErrorInFloatingState];
      v2 = v4;
    }
  }
}

@end