@interface TVCarouselView
@end

@implementation TVCarouselView

uint64_t __69___TVCarouselView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v3 = [*(id *)(a1 + 32) collectionToDatasourceIndexMap];
  v4 = [v3 allValues];
  v5 = [v2 setWithArray:v4];

  v6 = (void *)MEMORY[0x263EFFA08];
  v7 = [*(id *)(*(void *)(a1 + 32) + 480) allValues];
  v8 = [v6 setWithArray:v7];

  [v5 minusSet:v8];
  v9 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  uint64_t v10 = [v5 containsObject:v9];

  return v10;
}

uint64_t __74___TVCarouselView_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v3 = [*(id *)(*(void *)(a1 + 32) + 480) allValues];
  v4 = [v2 setWithArray:v3];

  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [*(id *)(a1 + 32) collectionToDatasourceIndexMap];
  v7 = [v6 allValues];
  v8 = [v5 setWithArray:v7];

  [v4 minusSet:v8];
  v9 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  uint64_t v10 = [v4 containsObject:v9];

  return v10;
}

void __68___TVCarouselView__setContentOffsetForCollectionViewIndex_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _collectionView];
  [v2 contentOffset];
  double v4 = v3;

  [*(id *)(a1 + 32) _contentOffsetXForCollectionViewIndex:*(void *)(a1 + 40)];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) _collectionView];
  objc_msgSend(v7, "setContentOffset:animated:", *(unsigned __int8 *)(a1 + 48), v6, v4);
}

void __94___TVCarouselView__updateCarouselWithDataSource_indicesToRemove_indicesToAdd_indicesToReload___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _collectionView];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __94___TVCarouselView__updateCarouselWithDataSource_indicesToRemove_indicesToAdd_indicesToReload___block_invoke_2;
  v4[3] = &unk_26504DED0;
  double v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v2 performBatchUpdates:v4 completion:0];
}

void __94___TVCarouselView__updateCarouselWithDataSource_indicesToRemove_indicesToAdd_indicesToReload___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 480), *(id *)(*(void *)(a1 + 32) + 568));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 568), *(id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) _collectionView];
  [v2 deleteItemsAtIndexPaths:*(void *)(a1 + 48)];

  double v3 = [*(id *)(a1 + 32) _collectionView];
  [v3 insertItemsAtIndexPaths:*(void *)(a1 + 56)];

  id v4 = [*(id *)(a1 + 32) _collectionView];
  [v4 reloadItemsAtIndexPaths:*(void *)(a1 + 64)];
}

uint64_t __64___TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _contentOffsetXForCollectionViewIndex:*(void *)(a1 + 40)];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) _collectionView];
  id v5 = [*(id *)(a1 + 32) _collectionView];
  [v5 contentOffset];
  [v4 setContentOffset:0 animated:v3];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  return [v6 _updateContentForNewCenterIndex:v7];
}

uint64_t __64___TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 40) inSection:0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 440);
  *(void *)(v3 + 440) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

void __40___TVCarouselView__startAutoScrollTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = [MEMORY[0x263EFF9F0] currentRunLoop];
    uint64_t v3 = [v2 currentMode];
    char v4 = [v3 isEqualToString:*MEMORY[0x263F1D798]];

    id WeakRetained = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "_updateContentOffsetForFocusedIndex:animated:", objc_msgSend(v5, "_centerCollectionViewCellIndex") + 1, 1);
      id WeakRetained = v5;
    }
  }
}

void __39___TVCarouselView__stopAutoScrollTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

@end