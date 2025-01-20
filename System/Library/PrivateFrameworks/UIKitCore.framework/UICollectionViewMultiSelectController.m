@interface UICollectionViewMultiSelectController
@end

@implementation UICollectionViewMultiSelectController

uint64_t __77___UICollectionViewMultiSelectController_collectionViewDidUpdateVisibleCells__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContentMasksForVisibleCells];
}

void __60___UICollectionViewMultiSelectController__selectIndexPaths___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        v8 = objc_msgSend(*(id *)(a1 + 40), "collectionView", (void)v12);
        [v8 _multiSelectInteractionSelectItemAtIndexPath:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  v9 = [*(id *)(a1 + 40) collectionView];
  v10 = [v9 indexPathsForSelectedItems];
  v11 = [*(id *)(a1 + 40) selectionState];
  [v11 setAllSelectedIndexPaths:v10];
}

void __62___UICollectionViewMultiSelectController__deselectIndexPaths___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        v8 = objc_msgSend(*(id *)(a1 + 40), "collectionView", (void)v12);
        [v8 _deselectItemAtIndexPath:v7 animated:0 notifyDelegate:1];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  v9 = [*(id *)(a1 + 40) collectionView];
  v10 = [v9 indexPathsForSelectedItems];
  v11 = [*(id *)(a1 + 40) selectionState];
  [v11 setAllSelectedIndexPaths:v10];
}

void __104___UICollectionViewMultiSelectController_shouldBeginMultiSelectInteraction_ofType_atPoint_withVelocity___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_indexPathsWithinRect:", round(*(double *)(a1 + 48) + -0.5), round(*(double *)(a1 + 56) + -0.5), 1.0, 1.0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] == 0;
}

@end