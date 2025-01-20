@interface UICollectionViewDragAndDropController
@end

@implementation UICollectionViewDragAndDropController

void __81___UICollectionViewDragAndDropController_beginReorderingForItemAtIndexPath_cell___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 _updateRowsAtIndexPaths:v2 updateAction:0];
}

uint64_t __65___UICollectionViewDragAndDropController_cancelReorderingForced___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

void __65___UICollectionViewDragAndDropController_cancelReorderingForced___block_invoke_3(uint64_t a1)
{
}

uint64_t __55___UICollectionViewDragAndDropController_endReordering__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __83___UICollectionViewDragAndDropController__cleanupAfterOutstandingSessionCompletion__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _setDragAppearance:0];
}

void __79___UICollectionViewDragAndDropController_rebaseCellAppearanceStatesForUpdates___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v11) {
    -[_UICollectionViewSubviewCollection setView:ofKind:inCategory:atIndexPath:](*(void *)(a1 + 32), (uint64_t)v10, (uint64_t)v9, a2, (uint64_t)v12);
  }
}

void __71___UICollectionViewDragAndDropController__rollbackCurrentDropInsertion__block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 _updateRowsAtIndexPaths:v2 updateAction:1];
}

uint64_t __59___UICollectionViewDragAndDropController_rebaseForUpdates___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finalIndexPathForInitialIndexPath:a2];
}

uint64_t __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCellAppearancesForItemsAtIndexPaths:*(void *)(a1 + 40)];
}

uint64_t __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCellAppearancesForItemsAtIndexPaths:*(void *)(a1 + 40)];
}

uint64_t __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = objc_msgSend(*(id *)(a1 + 40), "_cellAppearanceStateForIndexPath:", *(void *)(*((void *)&v10 + 1) + 8 * v6), (void)v10);
        v8 = v7;
        if (v7) {
          [v7 setDragState:7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _updateCellAppearancesForItemsAtIndexPaths:*(void *)(a1 + 32)];
}

void __124___UICollectionViewDragAndDropController_insertPlaceholderForItemAtIndexPath_forDragItem_reuseIdentifier_cellUpdateHandler___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 _updateRowsAtIndexPaths:v2 updateAction:0];
}

void __71___UICollectionViewDragAndDropController_placeholderContextDidDismiss___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 _updateRowsAtIndexPaths:v2 updateAction:1];
}

void __101___UICollectionViewDragAndDropController_placeholderContext_didCommitInsertionWithDataSourceUpdates___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __101___UICollectionViewDragAndDropController_placeholderContext_didCommitInsertionWithDataSourceUpdates___block_invoke_2;
  v3[3] = &unk_1E52E65E0;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v4 performBatchUpdates:v3 completion:0];
}

void __101___UICollectionViewDragAndDropController_placeholderContext_didCommitInsertionWithDataSourceUpdates___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isConnectedToDiffableDataSource])
  {
    id v2 = [[UICollectionViewUpdateItem alloc] initWithAction:0 forIndexPath:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setExpectedDiffableUpdateItem:v2];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) setExpectedDiffableUpdateItem:0];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = *(void *)(a1 + 48);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 _updateWithUpdates:v4 updateAction:0];
}

@end