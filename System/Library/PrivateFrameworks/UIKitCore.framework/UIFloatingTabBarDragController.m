@interface UIFloatingTabBarDragController
@end

@implementation UIFloatingTabBarDragController

void __87___UIFloatingTabBarDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    location[5] = v2;
    location[6] = v3;
    v5 = [*(id *)(a1 + 32) delegate];
    v6 = *(void **)(a1 + 32);
    v7 = [v6 currentDragTab];
    [v5 tabDragController:v6 hideDraggedTab:v7];

    v8 = [*(id *)(a1 + 32) currentDragTab];
    v9 = [v8 identifier];

    v10 = [*(id *)(a1 + 32) pendingFavoriteOrder];
    [v10 removeObject:v9];

    v11 = [*(id *)(a1 + 32) pendingExcludedItems];
    [v11 addObject:v9];

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    objc_initWeak(location, *(id *)(a1 + 32));
    dispatch_time_t v12 = dispatch_time(0, 300000000);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87___UIFloatingTabBarDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
    v13[3] = &unk_1E52DC308;
    objc_copyWeak(&v14, location);
    dispatch_after(v12, MEMORY[0x1E4F14428], v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

void __87___UIFloatingTabBarDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[8])
  {
    v2 = WeakRetained;
    [WeakRetained _updateFavoriteOrderAnimated:1];
    WeakRetained = v2;
  }
}

void __84___UIFloatingTabBarDragController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_storeWeak(WeakRetained + 4, 0);
    WeakRetained = v2;
  }
}

@end