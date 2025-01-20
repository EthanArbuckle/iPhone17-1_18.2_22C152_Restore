@interface SUIKSearchResultsUpdateOperation
@end

@implementation SUIKSearchResultsUpdateOperation

__CFString *__41___SUIKSearchResultsUpdateOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    v4 = &stru_1EFB51FD0;
  }
  else
  {
    SUIKCategoryFromSearchableItem(v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t __41___SUIKSearchResultsUpdateOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v7 = 0;
  }
  else
  {
    v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v7 = [v8 searchResultsCollectionViewController:0 sortCategory1:v5 sortCategory2:v6];
  }
  return v7;
}

uint64_t __41___SUIKSearchResultsUpdateOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 uniqueIdentifier];
  if ([v4 containsObject:v5]) {
    goto LABEL_6;
  }
  id v6 = [v3 attributeSet];
  uint64_t v7 = [v6 rankingHint];
  if (!v7)
  {

LABEL_6:
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  v8 = (void *)v7;
  v9 = [v3 attributeSet];
  v10 = [v9 subject];

  if (!v10)
  {
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  v11 = *(void **)(a1 + 32);
  id v5 = [v3 uniqueIdentifier];
  [v11 addObject:v5];
  uint64_t v12 = 1;
LABEL_7:

LABEL_8:
  return v12;
}

uint64_t __41___SUIKSearchResultsUpdateOperation_main__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v8 = [v6 attributeSet];
    v9 = [v8 rankingHint];
    v10 = [v5 attributeSet];
    v11 = [v10 rankingHint];
    uint64_t v7 = [v9 compare:v11];

    if (v7) {
      goto LABEL_6;
    }
    if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
    {
      uint64_t v12 = [v5 attributeSet];
      v13 = [v12 subject];
      v14 = [v6 attributeSet];
      v15 = [v14 subject];
      uint64_t v7 = [v13 compare:v15];

      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

void __41___SUIKSearchResultsUpdateOperation_main__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) diffableDataSource];
  [v2 applySnapshot:*(void *)(a1 + 40) animatingDifferences:1];
}

@end