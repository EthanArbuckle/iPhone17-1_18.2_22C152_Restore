@interface UICollectionViewDragSourceController
@end

@implementation UICollectionViewDragSourceController

void __82___UICollectionViewDragSourceController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) indexPathsForSelectedItems];
  uint64_t v2 = [v5 sortedArrayUsingSelector:sel_compare_];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __93___UICollectionViewDragSourceController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 3);
    -[_UICollectionViewDragAndDropController dragSourceController:willBeginLiftForItemsAtIndexPaths:](v3, (uint64_t)v4, *(void **)(a1 + 32));

    WeakRetained = v4;
  }
}

void __93___UICollectionViewDragSourceController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2 == 1)
    {
      v8 = WeakRetained;
      id v6 = objc_loadWeakRetained(WeakRetained + 3);
      -[_UICollectionViewDragAndDropController dragSourceController:didCancelLiftForItemsAtIndexPaths:](v6, (uint64_t)v8, *(void **)(a1 + 32));

      id v7 = v8[4];
      v8[4] = 0;

      id v5 = v8[5];
      v8[5] = 0;
    }
    else
    {
      if (a2) {
        goto LABEL_7;
      }
      v8 = WeakRetained;
      id v5 = objc_loadWeakRetained(WeakRetained + 3);
      -[_UICollectionViewDragAndDropController dragSourceController:didCompleteLiftForItemsAtIndexPaths:](v5, (uint64_t)v8, *(void **)(a1 + 32));
    }

    WeakRetained = v8;
  }
LABEL_7:
}

void __92___UICollectionViewDragSourceController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  v5[0] = *(void *)(a1 + 40);
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  if (WeakRetained) {
    [WeakRetained _decrementSessionRefCount];
  }
}

void __95___UICollectionViewDragSourceController__addDragItemsToExistingSession_forDataSourceIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = -[_UICollectionViewDragSourceController dragState](*(void **)(a1 + 32));
  v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id WeakRetained = 0;
  if (v3)
  {
LABEL_3:
    id v8 = WeakRetained;
    id v9 = v14;
    id v10 = v6;
    v11 = [[_UICollectionViewSourcePrivateLocalObject alloc] initWithIndexPath:v10 collectionView:v8];

    [v9 _setPrivateLocalContext:v11];
    v12 = [v4 dragItemsWithRebasableIndexPaths];
    [v12 compact];

    v13 = [v4 dragItemsWithRebasableIndexPaths];
    [v13 addPointer:v9];
  }
LABEL_4:
}

@end