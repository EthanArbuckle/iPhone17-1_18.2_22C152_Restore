@interface UICollectionView
@end

@implementation UICollectionView

uint64_t __68__UICollectionView_VideosUICore___preciseIndexPathsForVisibleItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __136__UICollectionView_VideosUI___vui_applyChangeSet_inSection_updateDataSourceBlock_applyChangeBlock_shouldWrapInUpdate_completionHandler___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4FB3C50]);
    v3 = [*(id *)(a1 + 32) insertChange];
    [v2 setInsertChange:v3];

    v4 = [*(id *)(a1 + 32) deleteChange];
    [v2 setDeleteChange:v4];

    v5 = [*(id *)(a1 + 32) moveChanges];
    [v2 setMoveChanges:v5];

    if (*(unsigned char *)(a1 + 72))
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB3C50]);
      id v7 = objc_alloc(MEMORY[0x1E4FB3C48]);
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:*(void *)(a1 + 64)];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:*(void *)(a1 + 64)];
      v10 = (void *)[v7 initWithChangeKind:4 sourceIndexes:v8 destinationIndexes:v9];

      v18[0] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v6 setUpdateChanges:v11];

      [v10 setUpdateChangeSet:v2];
      id v2 = v6;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  v12 = *(void **)(a1 + 40);
  v13 = [*(id *)(a1 + 32) deleteChange];
  objc_msgSend(v12, "_vui_applyDeleteChange:inSection:applyChangeBlock:", v13, *(void *)(a1 + 64), *(void *)(a1 + 56));

  v14 = *(void **)(a1 + 40);
  v15 = [*(id *)(a1 + 32) insertChange];
  objc_msgSend(v14, "_vui_applyInsertChange:inSection:applyChangeBlock:", v15, *(void *)(a1 + 64), *(void *)(a1 + 56));

  v16 = *(void **)(a1 + 40);
  v17 = [*(id *)(a1 + 32) moveChanges];
  objc_msgSend(v16, "_vui_applyMoveChanges:inSection:applyChangeBlock:", v17, *(void *)(a1 + 64), *(void *)(a1 + 56));
}

uint64_t __136__UICollectionView_VideosUI___vui_applyChangeSet_inSection_updateDataSourceBlock_applyChangeBlock_shouldWrapInUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 80))
  {
    id v2 = *(void **)(a1 + 32);
    v3 = [*(id *)(a1 + 40) updateChanges];
    objc_msgSend(v2, "_vui_applyUpdateChanges:inSection:applyChangeBlock:updateDataSourceBlock:", v3, *(void *)(a1 + 72), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __69__UICollectionView_VideosUI___vui_indexPathsWithIndexSet_andSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

@end