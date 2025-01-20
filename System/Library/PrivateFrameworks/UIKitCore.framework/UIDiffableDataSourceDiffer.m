@interface UIDiffableDataSourceDiffer
@end

@implementation UIDiffableDataSourceDiffer

void __112___UIDiffableDataSourceDiffer__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) indexPathForGlobalIndex:a2];
  id v6 = v3;
  if (!v3)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"_UIDiffableDataSourceDiffer.m" lineNumber:182 description:@"Failed to convert global index to indexPath."];

    v3 = 0;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "containsIndex:", objc_msgSend(v3, "section")) & 1) == 0)
  {
    v4 = [[UICollectionViewUpdateItem alloc] initWithAction:0 forIndexPath:v6];
    [*(id *)(a1 + 56) addObject:v4];
  }
}

void __94___UIDiffableDataSourceDiffer__sectionUpdatesForDiffResults_deletedSections_insertedSections___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:a2];
  v4 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v5 finalIndexPath:0 updateAction:1];
  [*(id *)(a1 + 32) addObject:v4];
  [*(id *)(a1 + 40) addIndex:a2];
}

void __94___UIDiffableDataSourceDiffer__sectionUpdatesForDiffResults_deletedSections_insertedSections___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:a2];
  v4 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:0 finalIndexPath:v5 updateAction:0];
  [*(id *)(a1 + 32) addObject:v4];
  [*(id *)(a1 + 40) addIndex:a2];
}

void __112___UIDiffableDataSourceDiffer__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) indexPathForGlobalIndex:a2];
  id v6 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"_UIDiffableDataSourceDiffer.m" lineNumber:191 description:@"Failed to convert global index to indexPath."];

    v3 = 0;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "containsIndex:", objc_msgSend(v3, "section")) & 1) == 0)
  {
    v4 = [[UICollectionViewUpdateItem alloc] initWithAction:1 forIndexPath:v6];
    [*(id *)(a1 + 56) addObject:v4];
  }
}

id __42___UIDiffableDataSourceDiffer_description__block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"section %@ contents:[", v9];
  unint64_t v11 = [v7 rangeForSection:a3];
  if (v11 < v11 + v12)
  {
    unint64_t v13 = v11;
    uint64_t v14 = v12;
    unint64_t v15 = v11;
    do
    {
      v16 = [v8 objectAtIndexedSubscript:v15];
      if (v15 > v13) {
        [v10 appendString:@","];
      }
      [v10 appendFormat:@"%@", v16];

      ++v15;
      --v14;
    }
    while (v14);
  }
  [v10 appendString:@"]\n"];

  return v10;
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    id v9 = [v7 indexPathBeforeUpdate];
    [v8 indexPathBeforeUpdate];
  }
  else
  {
    id v9 = [v7 indexPathAfterUpdate];
    [v8 indexPathAfterUpdate];
  v10 = };
  uint64_t v11 = [v9 section];
  if (v11 == [v10 section])
  {
    if (v7)
    {
      uint64_t v12 = v7[6];
      if (v8 && v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v8[6] != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_11:
          uint64_t v14 = -1;
          goto LABEL_15;
        }
        unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UIDiffableDataSourceDiffer.m" lineNumber:384 description:@"Deleting the same section. Invalidate updates."];

        uint64_t v12 = v7[6];
      }
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_11;
      }
    }
    if (v8 && v8[6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v7)
      {
        if (v7[6] == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v14 = -1;
        }
        else {
          uint64_t v14 = 1;
        }
        goto LABEL_15;
      }
LABEL_23:
      uint64_t v14 = 1;
      goto LABEL_15;
    }
    uint64_t v17 = [v9 item];
    if (v17 > [v10 item]) {
      goto LABEL_23;
    }
    uint64_t v18 = [v9 item];
    if (v18 >= [v10 item]) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = -1;
    }
  }
  else
  {
    uint64_t v15 = [v9 section];
    if (v15 > [v10 section]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = -1;
    }
  }
LABEL_15:

  return v14;
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_52(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3[6];
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v6 = v3[1];

    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return [v5 _deleteSection:v6];
    }
  }
  else
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v6 = 0;
  }
  return [v5 _decrementSectionCount:v6];
}

uint64_t __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_2_54(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3[3];
    if (v3[6] == 0x7FFFFFFFFFFFFFFFLL)
    {

      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        uint64_t v6 = *(void **)(v5 + 24);
      }
      else {
        uint64_t v6 = 0;
      }
      id v7 = [v6 dataSourceSnapshot];
      uint64_t v8 = [v7 numberOfItemsInSection:v4];

      id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      return [v9 _insertSection:v4 withInitialCount:v8];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v11 _incrementSectionCount:v4];
}

@end