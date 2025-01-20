@interface UIFocusAnimationCoordinatorManager
@end

@implementation UIFocusAnimationCoordinatorManager

void __59___UIFocusAnimationCoordinatorManager_activeCoordinatorMap__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  v1 = (void *)_MergedGlobals_1037;
  _MergedGlobals_1037 = v0;
}

uint64_t __72___UIFocusAnimationCoordinatorManager_didUpdateFocusInContext_fromItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeFocusAnimation];
  [*(id *)(a1 + 32) _prepareForFocusAnimation:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained
    && (v4 = WeakRetained,
        v5 = *(void **)(a1 + 40),
        id v6 = objc_loadWeakRetained((id *)(a1 + 48)),
        LODWORD(v5) = [v5 containsObject:v6],
        v6,
        v4,
        v5))
  {
    [*(id *)(a1 + 32) _animateFocusAnimation:1];
    v7 = *(void **)(a1 + 40);
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    [v7 removeObject:v8];
  }
  else
  {
    [*(id *)(a1 + 32) _cancelFocusAnimation:1];
  }
  v9 = *(void **)(a1 + 32);
  return [v9 _prepareForFocusAnimation:v2];
}

@end