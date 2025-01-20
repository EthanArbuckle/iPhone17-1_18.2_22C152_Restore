@interface UISheetPresentationInteraction
@end

@implementation UISheetPresentationInteraction

void __46___UISheetPresentationInteraction__handlePan___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 _sheetPresentationInteractionDidStartPresentationTransition:WeakRetained];
  }
}

uint64_t __46___UISheetPresentationInteraction__handlePan___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _sheetInteraction];
  [v2 unregisterPanGestureRecognizer:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) addTarget:*(void *)(a1 + 48) action:sel__handlePan_];
  [*(id *)(a1 + 40) setEnabled:1];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    v4 = *(void **)(a1 + 56);
    return [v4 _sheetPresentationInteractionDidFinishPresentationTransition:v5];
  }
  return result;
}

@end