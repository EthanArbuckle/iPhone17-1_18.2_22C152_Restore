@interface UITableViewDragController
@end

@implementation UITableViewDragController

void __60___UITableViewDragController_canProvideItemsForDragAtPoint___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "indexPathForRowAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __60___UITableViewDragController_canProvideItemsForDragAtPoint___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __76___UITableViewDragController_dragInteraction_previewForLiftingItem_session___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __82___UITableViewDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateLiftOfRowsAtIndexPaths:*(void *)(a1 + 40)];
}

uint64_t __82___UITableViewDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearanceOfVisibleRowsForDragState];
}

void __83___UITableViewDragController_dragInteraction_previewForCancellingItem_withDefault___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __81___UITableViewDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateDragCancelForCell:*(void *)(a1 + 40)];
}

void __81___UITableViewDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [*(id *)(a1 + 32) _endAnimatingDropOfCell:*(void *)(a1 + 40)];
  uint64_t v2 = [WeakRetained cellsAnimatingCancel];
  [v2 removeObjectForKey:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) _updateAppearanceOfVisibleRowsForDragState];
}

@end