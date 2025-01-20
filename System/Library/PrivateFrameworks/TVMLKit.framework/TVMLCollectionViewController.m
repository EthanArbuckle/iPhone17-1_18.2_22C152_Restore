@interface TVMLCollectionViewController
@end

@implementation TVMLCollectionViewController

void __54___TVMLCollectionViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[124] evaluateForState:1];
    WeakRetained = v2;
  }
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = [v9 autoHighlightIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      uint64_t v6 = [MEMORY[0x263F088C8] indexPathForRow:v5 inSection:a3];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    [v9 resetProperty:3];
  }
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 numberOfItems];
  uint64_t v7 = [v5 indexTitles];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_3;
  v8[3] = &unk_264BA8A68;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = v6;
  uint64_t v11 = a3;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    if ([v7 integerValue] >= *(void *)(a1 + 40)) {
      goto LABEL_5;
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v7, "integerValue"), *(void *)(a1 + 48));
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }

LABEL_5:
}

uint64_t __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 indexPathsByIndexTitle];
  id v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [*(id *)(a1 + 32) indexPathsByIndexTitle];
  uint64_t v11 = [v10 objectForKeyedSubscript:v6];

  uint64_t v12 = [v9 compare:v11];
  return v12;
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_30(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v15 = v5;
  if (v6 && (uint64_t v7 = [v6 indexOfObject:v5], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v8 = v7;
    [*(id *)(a1 + 48) removeIndex:v7];
    id v9 = *(void **)(a1 + 56);
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v11 = [NSNumber numberWithInteger:v8];
    [v9 setObject:v10 forKey:v11];

    if (v8 != a3)
    {
      uint64_t v12 = *(void **)(a1 + 64);
      v13 = [NSNumber numberWithInteger:v8];
      v14 = [NSNumber numberWithUnsignedInteger:a3];
      [v12 setObject:v13 forKey:v14];
    }
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_2_33(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v8, "integerValue"));
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v7, "integerValue"));
  uint64_t v11 = [v9 elementID];
  uint64_t v12 = [v11 viewElement];

  v13 = [v10 elementID];
  v14 = [v13 viewElement];

  id v15 = [v14 itemsChangeSet];
  v16 = v15;
  if (v15)
  {
    v38 = v12;
    v39 = v10;
    v17 = [v15 removedIndexes];
    if (v17)
    {
      v18 = [v16 removedIndexes];
      uint64_t v19 = [v18 firstIndex];

      while (v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = *(void **)(a1 + 48);
        v21 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", v19, objc_msgSend(v8, "integerValue"));
        [v20 addObject:v21];

        v22 = [v16 removedIndexes];
        uint64_t v19 = [v22 indexGreaterThanIndex:v19];
      }
    }
    else
    {
    }
    v23 = [v16 updatedIndexesByNewIndex];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_3_34;
    v41[3] = &unk_264BA8B08;
    id v42 = v7;
    id v24 = v8;
    uint64_t v25 = *(void *)(a1 + 56);
    id v43 = v24;
    uint64_t v44 = v25;
    id v45 = v14;
    id v26 = *(id *)(a1 + 64);
    uint64_t v27 = *(void *)(a1 + 88);
    id v46 = v26;
    uint64_t v48 = v27;
    id v28 = *(id *)(a1 + 72);
    uint64_t v29 = *(void *)(a1 + 96);
    id v47 = v28;
    uint64_t v49 = v29;
    [v23 enumerateKeysAndObjectsUsingBlock:v41];

    v30 = [v16 removedIndexes];
    if (v30 || ([v16 addedIndexes], (v30 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      uint64_t v12 = v38;
    }
    else
    {
      v37 = [v16 movedIndexesByNewIndex];

      uint64_t v12 = v38;
      if (!v37) {
        goto LABEL_13;
      }
    }
    [*(id *)(a1 + 80) setObject:v16 forKey:v24];
LABEL_13:

    uint64_t v10 = v39;
    goto LABEL_14;
  }
  if ([v14 updateType]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
  }
LABEL_14:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    goto LABEL_16;
  }
  v40 = *(void **)(a1 + 56);
  v31 = a4;
  v32 = v14;
  v33 = v12;
  uint64_t v34 = [v8 integerValue];
  uint64_t v35 = [v7 integerValue];
  uint64_t v36 = v34;
  uint64_t v12 = v33;
  v14 = v32;
  a4 = v31;
  [v40 updateSupplementaryViewsForSectionAtOldIndex:v36 oldElement:v12 withNewIndex:v35 newElement:v14 requiresReload:*(void *)(*(void *)(a1 + 96) + 8) + 24 requiresRelayout:*(void *)(*(void *)(a1 + 88) + 8) + 24];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
LABEL_16:
  }
    *a4 = 1;
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_3_34(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = (void *)MEMORY[0x263F088C8];
  id v8 = a3;
  id v9 = a2;
  objc_msgSend(v7, "indexPathForItem:inSection:", objc_msgSend(v9, "integerValue"), objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (void *)MEMORY[0x263F088C8];
  uint64_t v11 = [v8 integerValue];

  uint64_t v12 = objc_msgSend(v10, "indexPathForItem:inSection:", v11, objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  v13 = *(void **)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  uint64_t v15 = [v9 integerValue];

  v16 = [v14 prototypeForItemAtIndex:v15];
  [v13 expectedCellSizeForElement:v16 atIndexPath:v27];
  double v18 = v17;
  double v20 = v19;

  v21 = [*(id *)(a1 + 64) layoutAttributesForItemAtIndexPath:v12];
  [v21 frame];
  double v23 = v22;
  double v25 = v24;

  BOOL v26 = v18 == v23 && v20 == v25;
  if (v26
    || (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1, [*(id *)(a1 + 56) updateType] == 2))
  {
    [*(id *)(a1 + 72) addObject:v27];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_4_36(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteSections:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) insertSections:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_5;
  v7[3] = &unk_264BA8B58;
  id v8 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v7];
  v3 = *(void **)(a1 + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_7;
  v4[3] = &unk_264BA8BC8;
  id v5 = *(id *)(a1 + 32);
  id v6 = &__block_literal_global_41;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [v5 integerValue];

  return [v4 moveSection:v6 toSection:v7];
}

id __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v6 = [v4 firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v4 indexGreaterThanIndex:i])
    {
      id v8 = [MEMORY[0x263F088C8] indexPathForItem:i inSection:a2];
      [v5 addObject:v8];
    }
  }
  id v9 = (void *)[v5 copy];

  return v9;
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [v5 removedIndexes];

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [v5 removedIndexes];
    uint64_t v11 = (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, v6, v10);
    [v8 deleteItemsAtIndexPaths:v11];
  }
  uint64_t v12 = [v5 addedIndexes];

  if (v12)
  {
    v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [v5 addedIndexes];
    v16 = (*(void (**)(uint64_t, uint64_t, void *))(v14 + 16))(v14, v6, v15);
    [v13 insertItemsAtIndexPaths:v16];
  }
  double v17 = [v5 movedIndexesByNewIndex];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_8;
  v18[3] = &unk_264BA8BA0;
  uint64_t v20 = v6;
  id v19 = *(id *)(a1 + 32);
  [v17 enumerateKeysAndObjectsUsingBlock:v18];
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F088C8];
  id v6 = a2;
  objc_msgSend(v5, "indexPathForItem:inSection:", objc_msgSend(a3, "integerValue"), *(void *)(a1 + 40));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)MEMORY[0x263F088C8];
  uint64_t v8 = [v6 integerValue];

  uint64_t v9 = [v7 indexPathForItem:v8 inSection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) moveItemAtIndexPath:v10 toIndexPath:v9];
}

uint64_t __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) _doUpdateViewLayoutAnimated:0 relayout:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) _updateHeaderView];
  uint64_t result = [*(id *)(a1 + 32) _updateFooterView];
  *(unsigned char *)(*(void *)(a1 + 32) + 978) = 0;
  return result;
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_10(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_11;
  v5[3] = &unk_264BA8C18;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 performBatchUpdates:v5 completion:0];
}

uint64_t __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_11(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __73___TVMLCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __73___TVMLCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v2[3] = &unk_264BA64A0;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __73___TVMLCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:1];
}

@end