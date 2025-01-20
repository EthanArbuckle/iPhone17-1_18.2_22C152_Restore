@interface UIDiffableDataSourceSectionSnapshotRebaser
@end

@implementation UIDiffableDataSourceSectionSnapshotRebaser

id __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [NSString stringWithUTF8String:"-[_UIDiffableDataSourceSectionSnapshotRebaser _rebaseForInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:]_block_invoke"];
    [v7 handleFailureInFunction:v8, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 91, @"Invalid parameter not satisfying: %@", @"sectionIdentier" file lineNumber description];
  }
  v4 = [*(id *)(a1 + 32) objectForKey:v3];
  if (!v4)
  {
    v5 = [*(id *)(a1 + 40) objectForKey:v3];
    v4 = (void *)[v5 copy];

    if (v4) {
      [*(id *)(a1 + 32) setObject:v4 forKey:v3];
    }
  }

  return v4;
}

void __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a2 + a3) > *(void *)(a1 + 64))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 147, @"Invalid parameter not satisfying: %@", @"NSMaxRange(deleteRange) <= beforeIdentifiersCount" object file lineNumber description];
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "sectionIndexesForItemIndexRange:", a2, a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_3;
  v10[3] = &unk_1E52D9E08;
  id v7 = *(id *)(a1 + 40);
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  uint64_t v17 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v14 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 48);
  [v6 enumerateIndexesUsingBlock:v10];
}

void __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_3(uint64_t a1, unint64_t a2)
{
  v4 = [*(id *)(a1 + 32) dataSourceSnapshot];
  NSUInteger v5 = [v4 rangeForSection:a2];
  NSUInteger v7 = v6;

  v17.location = v5;
  v17.length = v7;
  NSRange v8 = NSIntersectionRange(*(NSRange *)(a1 + 64), v17);
  if (v8.length)
  {
    if ([*(id *)(a1 + 32) numberOfSections] <= a2)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 40), @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 157, @"Invalid parameter not satisfying: %@", @"sectionIndex < beforeState.numberOfSections" object file lineNumber description];
    }
    v9 = [*(id *)(a1 + 32) sectionIdentifiers];
    id v15 = [v9 objectAtIndexedSubscript:a2];

    v10 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v11 = v10;
    if (v10)
    {
      if (v5 == v8.location && v7 == v8.length)
      {
        [v10 deleteAllItems];
      }
      else
      {
        uint64_t v12 = [*(id *)(a1 + 48) array];
        id v13 = objc_msgSend(v12, "subarrayWithRange:", v8.location, v8.length);

        [v11 deleteItems:v13 orphanDisposition:1];
      }
    }
  }
}

void __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a2 + a3) > *(void *)(a1 + 72))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 185, @"Invalid parameter not satisfying: %@", @"NSMaxRange(insertRange) <= afterIdentifiersCount" object file lineNumber description];
  }
  NSUInteger v6 = objc_msgSend(*(id *)(a1 + 40), "sectionIndexesForItemIndexRange:", a2, a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_5;
  v10[3] = &unk_1E52D9E58;
  id v7 = *(id *)(a1 + 40);
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v15 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  [v6 enumerateIndexesUsingBlock:v10];
}

void __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_5(uint64_t a1, unint64_t a2)
{
  v4 = [*(id *)(a1 + 32) dataSourceSnapshot];
  NSUInteger v5 = [v4 rangeForSection:a2];
  NSUInteger v7 = v6;

  v19.location = v5;
  v19.length = v7;
  NSRange v8 = NSIntersectionRange(*(NSRange *)(a1 + 72), v19);
  if (!v8.length) {
    return;
  }
  if ([*(id *)(a1 + 32) numberOfSections] <= a2)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:*(void *)(a1 + 88), *(void *)(a1 + 40), @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 195, @"Invalid parameter not satisfying: %@", @"sectionIndex < afterState.numberOfSections" object file lineNumber description];
  }
  v9 = [*(id *)(a1 + 32) sections];
  id v17 = [v9 objectAtIndexedSubscript:a2];

  v10 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (v10)
  {
    id v11 = [*(id *)(a1 + 48) array];
    uint64_t v12 = objc_msgSend(v11, "subarrayWithRange:", v8.location, v8.length);

    id v13 = [v12 firstObject];
    id v14 = [*(id *)(a1 + 56) _identifierBeforeIdentifier:v13];
    if (([v10 containsItem:v14] & 1) == 0)
    {

      id v14 = 0;
    }
    id v15 = [*(id *)(a1 + 56) _identifierAfterIdentifier:v13];
    if ([v10 containsItem:v15])
    {
      if (v15)
      {
        [v10 insertItems:v12 beforeItem:v15];

LABEL_15:
        goto LABEL_16;
      }
    }
    else
    {
    }
    if (v14) {
      [v10 insertItems:v12 afterItem:v14 insertionMode:1];
    }
    else {
      [v10 appendItems:v12];
    }
    goto LABEL_15;
  }
LABEL_16:
}

@end