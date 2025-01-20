@interface PSIGroupResult
- (BOOL)containsFilterSearchTokens;
- (BOOL)exclusivelyContainsOCRGroups;
- (BOOL)hasDateFilterFromImplicitToken;
- (BOOL)isContentStringTextSearchableAtIndex:(int64_t)a3;
- (BOOL)isDateFilterPartiallyFromFullSearchText;
- (BOOL)isMatchedByIdentifierAtIndex:(int64_t)a3;
- (BOOL)isMergedOCRResult;
- (BOOL)selectedForOCRCompletion;
- (NSArray)assetUUIDs;
- (NSArray)collectionResults;
- (NSArray)contentStrings;
- (NSArray)contentStringsOverride;
- (NSArray)groups;
- (NSArray)groupsMatchRanges;
- (NSArray)groupsSearchTokens;
- (NSArray)lookupIdentifiers;
- (NSMutableSet)sceneGroupsIds;
- (NSString)owningContentString;
- (NSString)transientToken;
- (PSIGroupResult)initWithQueue:(id)a3;
- (PSIGroupResultDelegate)delegate;
- (__CFArray)assetIds;
- (__CFArray)collectionIds;
- (float)score;
- (id)_prepareForFetchWithAssetCountLimit:(unint64_t)a3 collectionCountLimit:(unint64_t)a4 outAssetRange:(_NSRange *)a5 outCollectionRange:(_NSRange *)a6 outFetchOwningContentString:(BOOL *)a7;
- (id)contentStringAtIndex:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateFilterGroupSnapshot;
- (id)description;
- (id)firstSearchTextGroupSnapshot;
- (id)fullSearchTextGroupSnapshot;
- (id)groupRangesAtIndex:(int64_t)a3;
- (id)lookupIdentifiersForSearchIndexCategories:(id)a3;
- (id)matchRangesAtIndex:(int64_t)a3;
- (id)normalizedStringAtIndex:(int64_t)a3;
- (id)normalizedUnitTestDescription;
- (id)tokensAtIndex:(int64_t)a3;
- (id)unitTestDescription;
- (int64_t)categoryAtIndex:(int64_t)a3;
- (signed)dedupingSkippedCategory;
- (unint64_t)_calculateOCRGroupsCount;
- (unint64_t)assetMatchCount;
- (unint64_t)collectionMatchCount;
- (unint64_t)groupCount;
- (unint64_t)matchCount;
- (void)dealloc;
- (void)fetchNextAssetUUIDs:(BOOL)a3 collectionResults:(BOOL)a4 assetCountLimit:(unint64_t)a5 collectionCountLimit:(unint64_t)a6 completionHandler:(id)a7;
- (void)fetchNextAssetUUIDs:(BOOL)a3 collectionResults:(BOOL)a4 count:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchNextAssetUUIDs:(unint64_t)a3 completionHandler:(id)a4;
- (void)resolveObjectsWithAssetCache:(id)a3 collectionCache:(id)a4;
- (void)setAssetIds:(__CFArray *)a3;
- (void)setCollectionIds:(__CFArray *)a3;
- (void)setContentStringsOverride:(id)a3;
- (void)setDedupingSkippedCategory:(signed __int16)a3;
- (void)setDelegate:(id)a3;
- (void)setGroups:(id)a3;
- (void)setIsMergedOCRResult:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)setSelectedForOCRCompletion:(BOOL)a3;
- (void)setTransientToken:(id)a3;
@end

@implementation PSIGroupResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_contentStringsOverride, 0);
  objc_storeStrong((id *)&self->_transientToken, 0);
  objc_storeStrong((id *)&self->_sceneGroupsIds, 0);
  objc_storeStrong((id *)&self->_collectionResults, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_owningContentString, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSelectedForOCRCompletion:(BOOL)a3
{
  self->_selectedForOCRCompletion = a3;
}

- (BOOL)selectedForOCRCompletion
{
  return self->_selectedForOCRCompletion;
}

- (void)setIsMergedOCRResult:(BOOL)a3
{
  self->_isMergedOCRResult = a3;
}

- (BOOL)isMergedOCRResult
{
  return self->_isMergedOCRResult;
}

- (void)setDelegate:(id)a3
{
}

- (PSIGroupResultDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSIGroupResultDelegate *)WeakRetained;
}

- (void)setDedupingSkippedCategory:(signed __int16)a3
{
  self->_dedupingSkippedCategory = a3;
}

- (signed)dedupingSkippedCategory
{
  return self->_dedupingSkippedCategory;
}

- (void)setCollectionIds:(__CFArray *)a3
{
}

- (__CFArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setAssetIds:(__CFArray *)a3
{
}

- (__CFArray)assetIds
{
  return self->_assetIds;
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setContentStringsOverride:(id)a3
{
}

- (NSArray)contentStringsOverride
{
  return self->_contentStringsOverride;
}

- (void)setTransientToken:(id)a3
{
}

- (NSString)transientToken
{
  return self->_transientToken;
}

- (void)resolveObjectsWithAssetCache:(id)a3 collectionCache:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self->_assetIds;
  uint64_t v9 = [(__CFArray *)v8 count];
  v10 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  assetUUIDs = self->_assetUUIDs;
  self->_assetUUIDs = v10;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v12 = v8;
  uint64_t v13 = [(__CFArray *)v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [NSNumber numberWithLongLong:*(void *)(*((void *)&v34 + 1) + 8 * v16)];
        v18 = [v6 objectForKeyedSubscript:v17];

        if (v18) {
          [(NSMutableArray *)self->_assetUUIDs addObject:v18];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(__CFArray *)v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v14);
  }
  v29 = v12;

  v19 = self->_collectionIds;
  v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  collectionResults = self->_collectionResults;
  self->_collectionResults = v20;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v22 = v19;
  uint64_t v23 = [(__CFArray *)v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [NSNumber numberWithLongLong:*(void *)(*((void *)&v30 + 1) + 8 * v26)];
        v28 = [v7 objectForKeyedSubscript:v27];

        if (v28) {
          [(NSMutableArray *)self->_collectionResults addObject:v28];
        }

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(__CFArray *)v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v24);
  }
}

- (void)fetchNextAssetUUIDs:(BOOL)a3 collectionResults:(BOOL)a4 assetCountLimit:(unint64_t)a5 collectionCountLimit:(unint64_t)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  v12 = (void (**)(void))a7;
  char v23 = 0;
  long long v22 = 0uLL;
  if (v10) {
    uint64_t v13 = &v22;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v9) {
    uint64_t v14 = &v21;
  }
  else {
    uint64_t v14 = 0;
  }
  long long v21 = 0uLL;
  uint64_t v15 = [(PSIGroupResult *)self _prepareForFetchWithAssetCountLimit:a5 collectionCountLimit:a6 outAssetRange:v13 outCollectionRange:v14 outFetchOwningContentString:&v23];
  uint64_t v16 = (void *)v15;
  if (!v12 || v15)
  {
    if (v12 && v15)
    {
      v17 = dispatch_get_global_queue(0, 0);
      id v19 = v16;
      v20 = v12;
      id v18 = v17;
      pl_dispatch_async();
    }
  }
  else
  {
    v12[2](v12);
  }
}

void __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 96);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke_2;
  v5[3] = &unk_1E58751E8;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "group:fetchOwningContentString:assetIdRange:collectionIdRange:completionHandler:", v3, v4, *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), v5);
}

void __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v7 = v12;
  id v8 = v11;
  id v9 = v10;
  pl_dispatch_async();
}

void __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  if (v6)
  {
    id v7 = v6;
    id v8 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v7;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = *(void *)(a1 + 32);
    id v8 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v9;
  }

  [*(id *)(*(void *)(a1 + 32) + 32) addObjectsFromArray:*(void *)(a1 + 48)];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 40);
  if (v12)
  {
    id v13 = v12;
    id v14 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v13;
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = *(void *)(a1 + 32);
    id v14 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }

  [*(id *)(*(void *)(a1 + 32) + 40) addObjectsFromArray:*(void *)(a1 + 56)];
  id v17 = *(id *)(a1 + 72);
  pl_dispatch_async();
}

uint64_t __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchNextAssetUUIDs:(BOOL)a3 collectionResults:(BOOL)a4 count:(unint64_t)a5 completionHandler:(id)a6
{
}

- (void)fetchNextAssetUUIDs:(unint64_t)a3 completionHandler:(id)a4
{
}

- (id)_prepareForFetchWithAssetCountLimit:(unint64_t)a3 collectionCountLimit:(unint64_t)a4 outAssetRange:(_NSRange *)a5 outCollectionRange:(_NSRange *)a6 outFetchOwningContentString:(BOOL *)a7
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__112442;
  id v13 = __Block_byref_object_dispose__112443;
  id v14 = 0;
  pl_dispatch_sync();
  id v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

void __136__PSIGroupResult__prepareForFetchWithAssetCountLimit_collectionCountLimit_outAssetRange_outCollectionRange_outFetchOwningContentString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) assetMatchCount];
  unint64_t v3 = v2 - [*(id *)(*(void *)(a1 + 32) + 32) count];
  uint64_t v4 = [*(id *)(a1 + 32) collectionMatchCount];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 40) count];
  unint64_t v6 = *(void *)(a1 + 48);
  unint64_t v7 = *(void *)(a1 + 56);
  if (v3 >= v6) {
    unint64_t v8 = *(void *)(a1 + 48);
  }
  else {
    unint64_t v8 = v3;
  }
  if (v6) {
    unint64_t v3 = v8;
  }
  if (v4 - v5 >= v7) {
    uint64_t v9 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v9 = v4 - v5;
  }
  if (v7) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v4 - v5;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v11 + 48))
  {
    if (!(v10 | v3)) {
      return;
    }
    BOOL v12 = v10 != 0;
    if (!v3) {
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v12 = 1;
    *(unsigned char *)(v11 + 48) = 1;
    **(unsigned char **)(a1 + 64) = 1;
  }
  id v13 = *(void **)(a1 + 72);
  if (v13)
  {
    *id v13 = [*(id *)(*(void *)(a1 + 32) + 32) count];
    v13[1] = v3;
    if (v12) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
LABEL_20:
  if (v12)
  {
LABEL_21:
    id v14 = *(void **)(a1 + 80);
    if (v14)
    {
      *id v14 = [*(id *)(*(void *)(a1 + 32) + 40) count];
      v14[1] = v10;
    }
  }
LABEL_23:
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = WeakRetained;
}

- (NSArray)collectionResults
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unint64_t v7 = __Block_byref_object_copy__112442;
  unint64_t v8 = __Block_byref_object_dispose__112443;
  id v9 = 0;
  pl_dispatch_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

void __35__PSIGroupResult_collectionResults__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)assetUUIDs
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unint64_t v7 = __Block_byref_object_copy__112442;
  unint64_t v8 = __Block_byref_object_dispose__112443;
  id v9 = 0;
  pl_dispatch_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

void __28__PSIGroupResult_assetUUIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)owningContentString
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unint64_t v7 = __Block_byref_object_copy__112442;
  unint64_t v8 = __Block_byref_object_dispose__112443;
  id v9 = 0;
  pl_dispatch_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __37__PSIGroupResult_owningContentString__block_invoke(uint64_t a1)
{
}

- (unint64_t)_calculateOCRGroupsCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = self->_groups;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "category", (void)v10) == 1203
          || [v8 category] == 1204)
        {
          ++v5;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)exclusivelyContainsOCRGroups
{
  unint64_t v3 = [(PSIGroupResult *)self _calculateOCRGroupsCount];
  if (v3) {
    LOBYTE(v3) = v3 == [(NSArray *)self->_groups count];
  }
  return v3;
}

- (BOOL)hasDateFilterFromImplicitToken
{
  id v2 = [(PSIGroupResult *)self dateFilterGroupSnapshot];
  char v3 = [v2 isDateFilterFromImplicitToken];

  return v3;
}

- (BOOL)isDateFilterPartiallyFromFullSearchText
{
  id v2 = [(PSIGroupResult *)self dateFilterGroupSnapshot];
  char v3 = [v2 isDateFilterPartiallyFromFullSearchText];

  return v3;
}

- (id)dateFilterGroupSnapshot
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_groups;
  id v3 = (id)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        unint64_t v7 = objc_msgSend(v6, "dateFilter", (void)v9);

        if (v7)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)firstSearchTextGroupSnapshot
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = self->_groups;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        unint64_t v8 = objc_msgSend(v7, "tokens", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              if ([*(id *)(*((void *)&v15 + 1) + 8 * j) belongsToSearchText])
              {
                id v13 = v7;

                goto LABEL_19;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
      id v13 = 0;
    }
    while (v4);
  }
  else
  {
    id v13 = 0;
  }
LABEL_19:

  return v13;
}

- (id)fullSearchTextGroupSnapshot
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = self->_groups;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_34;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v29;
  uint64_t v22 = *(void *)v29;
  char v23 = v2;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v29 != v6) {
        objc_enumerationMutation(v2);
      }
      unint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v9 = objc_msgSend(v8, "datedTokens", v22);
      uint64_t v10 = [v9 count];

      if (v10)
      {
        if ([v8 isDateFilterFromFullSearchText])
        {
          id v20 = v8;
          goto LABEL_32;
        }
        if (([v8 isDateFilterFromImplicitToken] & 1) != 0
          || ([v8 isDateFilterPartiallyFromFullSearchText] & 1) != 0)
        {
          id v20 = 0;
LABEL_32:

          goto LABEL_35;
        }
      }
      if ([v8 category] == 1203 || objc_msgSend(v8, "category") == 1204)
      {
        uint64_t v11 = [v8 contentString];
        unint64_t v12 = [v11 length];

        if (v12 < 3) {
          continue;
        }
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = [v8 tokens];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (!v14) {
        goto LABEL_26;
      }
      uint64_t v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          if ([v19 isFullTextToken])
          {
            id v20 = v8;
LABEL_31:
            id v2 = v23;

            goto LABEL_32;
          }
          if ([v19 belongsToSearchText])
          {
            if ((v16 & 1) == 0)
            {
              if (v5)
              {
                id v20 = 0;
                goto LABEL_31;
              }
              id v5 = v8;
            }
            [v19 rangeInSearchText];
            char v16 = 1;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15) {
          continue;
        }
        break;
      }
LABEL_26:

      uint64_t v6 = v22;
      id v2 = v23;
    }
    uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v28 objects:v33 count:16];
  }
  while (v4);
LABEL_34:

  id v5 = v5;
  id v20 = v5;
LABEL_35:

  return v20;
}

- (id)lookupIdentifiersForSearchIndexCategories:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_groups;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsIndex:", (int)objc_msgSend(v11, "category", (void)v15)))
        {
          unint64_t v12 = [v11 lookupIdentifier];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = (void *)[v5 copy];
  return v13;
}

- (BOOL)isMatchedByIdentifierAtIndex:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_groups objectAtIndexedSubscript:a3];
  id v4 = [v3 tokens];
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 identifier];
  BOOL v7 = [v6 length] != 0;

  return v7;
}

- (BOOL)isContentStringTextSearchableAtIndex:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_groups objectAtIndexedSubscript:a3];
  id v4 = [v3 tokens];
  id v5 = [v4 firstObject];

  uint64_t v6 = [v5 text];
  BOOL v7 = [v6 length] != 0;

  return v7;
}

- (int64_t)categoryAtIndex:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_groups objectAtIndexedSubscript:a3];
  int64_t v4 = (int)[v3 category];

  return v4;
}

- (id)normalizedStringAtIndex:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_groups objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 normalizedString];

  return v4;
}

- (id)contentStringAtIndex:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_groups objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 contentString];

  return v4;
}

- (id)groupRangesAtIndex:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_groups objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 groupRanges];

  return v4;
}

- (id)matchRangesAtIndex:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_groups objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 matchRanges];

  return v4;
}

- (id)tokensAtIndex:(int64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_groups objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 tokens];

  return v4;
}

- (unint64_t)groupCount
{
  return [(NSArray *)self->_groups count];
}

- (NSArray)groupsMatchRanges
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_groups, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v4 = self->_groups;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "matchRanges", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)lookupIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_groups, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v4 = self->_groups;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "lookupIdentifier", (void)v11);
        if ([v9 length]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)contentStrings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PSIGroupResult *)self contentStringsOverride];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(PSIGroupResult *)self contentStringsOverride];
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_groups, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = self->_groups;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "contentString", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return (NSArray *)v5;
}

- (NSArray)groupsSearchTokens
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_groups, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_groups;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "tokens", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)matchCount
{
  unint64_t v3 = [(PSIGroupResult *)self assetMatchCount];
  return [(PSIGroupResult *)self collectionMatchCount] + v3;
}

- (BOOL)containsFilterSearchTokens
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = [(PSIGroupResult *)self groupsSearchTokens];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              if ([*(id *)(*((void *)&v15 + 1) + 8 * j) isFilterTypeToken])
              {

                BOOL v13 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
      BOOL v13 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_19:

  return v13;
}

- (unint64_t)collectionMatchCount
{
  unint64_t result = (unint64_t)self->_collectionIds;
  if (result) {
    return CFArrayGetCount((CFArrayRef)result);
  }
  return result;
}

- (unint64_t)assetMatchCount
{
  unint64_t result = (unint64_t)self->_assetIds;
  if (result) {
    return CFArrayGetCount((CFArrayRef)result);
  }
  return result;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
  id v6 = a3;
  sceneGroupsIds = self->_sceneGroupsIds;
  self->_sceneGroupsIds = 0;
}

- (NSMutableSet)sceneGroupsIds
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  sceneGroupsIds = self->_sceneGroupsIds;
  if (!sceneGroupsIds)
  {
    uint64_t v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = self->_sceneGroupsIds;
    self->_sceneGroupsIds = v4;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = self->_groups;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "category", (void)v17) == 1500)
        {
          long long v12 = self->_sceneGroupsIds;
          BOOL v13 = NSNumber;
          uint64_t v14 = [v11 groupId];
        }
        else
        {
          if ([v11 category] != 1501) {
            continue;
          }
          long long v12 = self->_sceneGroupsIds;
          BOOL v13 = NSNumber;
          uint64_t v14 = [v11 owningGroupId];
        }
        long long v15 = [v13 numberWithUnsignedLongLong:v14];
        [(NSMutableSet *)v12 addObject:v15];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v8)
      {
LABEL_14:

        sceneGroupsIds = self->_sceneGroupsIds;
        break;
      }
    }
  }
  return sceneGroupsIds;
}

- (id)normalizedUnitTestDescription
{
  id v24 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v3 = [(NSArray *)self->_groups count];
  uint64_t v22 = v3 - 1;
  uint64_t v23 = v3;
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    long long v21 = self;
    do
    {
      uint64_t v5 = [(NSArray *)self->_groups objectAtIndexedSubscript:v4];
      id v6 = [v5 normalizedString];
      uint64_t v7 = (void *)[v6 mutableCopy];

      uint64_t v8 = [(NSArray *)self->_groups objectAtIndexedSubscript:v4];
      uint64_t v9 = [v8 matchRanges];
      uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_96];

      uint64_t v11 = [v10 count] - 1;
      if (v11 >= 0)
      {
        do
        {
          long long v12 = [v10 objectAtIndex:v11];
          uint64_t v13 = [v12 rangeValue];
          uint64_t v15 = v14;

          long long v16 = objc_msgSend(v7, "substringWithRange:", v13, v15);
          long long v17 = [NSString stringWithFormat:@"(%@)", v16];
          objc_msgSend(v7, "replaceCharactersInRange:withString:", v13, v15, v17);

          --v11;
        }
        while (v11 != -1);
      }
      self = v21;
      long long v18 = [(NSArray *)v21->_groups objectAtIndexedSubscript:v4];
      int v19 = [v18 category];

      [v24 appendFormat:@"%d = %@", v19, v7];
      if (v4 < v22) {
        [v24 appendString:@", "];
      }

      ++v4;
    }
    while (v4 != v23);
  }
  return v24;
}

uint64_t __47__PSIGroupResult_normalizedUnitTestDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 rangeValue];
  uint64_t v7 = v5 + v6;
  uint64_t v8 = [v4 rangeValue];
  uint64_t v10 = v9;

  if (v7 < v8 + v10) {
    return -1;
  }
  else {
    return v7 != v8 + v10;
  }
}

- (id)unitTestDescription
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v40 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v45 = self;
  uint64_t v41 = [(NSArray *)self->_groups count];
  if (v41 >= 1)
  {
    for (uint64_t i = 0; i != v41; ++i)
    {
      v49 = [MEMORY[0x1E4F28E78] string];
      uint64_t v3 = [(NSArray *)v45->_groups objectAtIndexedSubscript:i];
      id v4 = [v3 contentString];

      uint64_t v5 = [(NSArray *)v45->_groups objectAtIndexedSubscript:i];
      v50 = [v5 normalizedString];

      uint64_t v6 = [(NSArray *)v45->_groups objectAtIndexedSubscript:i];
      uint64_t v7 = [v6 matchRanges];
      uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_112456];

      if ([v8 count])
      {
        v44 = [v4 lowercaseString];
        uint64_t v9 = [(NSArray *)v45->_groups objectAtIndexedSubscript:i];
        uint64_t v10 = [v9 groupRanges];

        uint64_t v11 = [v44 length];
        if (v11 == [v4 length] && objc_msgSend(v44, "isEqualToString:", v50))
        {
          id v12 = v10;
        }
        else
        {
          if (unitTestDescription_onceToken != -1) {
            dispatch_once(&unitTestDescription_onceToken, &__block_literal_global_82);
          }
          id v60 = 0;
          id v61 = 0;
          uint64_t v13 = (void *)[(id)unitTestDescription_tokenizer newTokensFromString:v4 withOptions:0 outCopyRanges:&v61 error:&v60];
          id v12 = v61;
          id v14 = v60;

          if (v14 || (uint64_t v15 = [v12 count], v15 != objc_msgSend(v10, "count")))
          {
            id v16 = v50;

            id v17 = v10;
            id v12 = v17;
            id v4 = v16;
          }
        }
        v59[0] = 0;
        v59[1] = v59;
        v59[2] = 0x2020000000;
        v59[3] = 0;
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __37__PSIGroupResult_unitTestDescription__block_invoke_3;
        v55[3] = &unk_1E5875148;
        v58 = v59;
        id v42 = v10;
        id v56 = v42;
        id v43 = v12;
        id v57 = v43;
        long long v18 = (uint64_t (**)(void, void))MEMORY[0x19F38D650](v55);
        [v50 length];
        uint64_t v19 = [v4 length];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        obuint64_t j = v8;
        uint64_t v20 = 0;
        uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
        if (v21)
        {
          uint64_t v48 = *(void *)v52;
          while (2)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v52 != v48) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = [*(id *)(*((void *)&v51 + 1) + 8 * j) rangeValue];
              uint64_t v25 = objc_msgSend(v50, "substringWithRange:", v23, v24);
              uint64_t v26 = v18[2](v18, v23);
              if (v26 == 0x7FFFFFFFFFFFFFFFLL
                || (uint64_t v27 = objc_msgSend(v4, "rangeOfString:options:range:", v25, 385, v26, objc_msgSend(v4, "length") - v26), (v29 = v28) == 0))
              {
                id v39 = [(PSIGroupResult *)v45 normalizedUnitTestDescription];

                int v37 = 0;
                goto LABEL_30;
              }
              uint64_t v30 = v27;
              long long v31 = objc_msgSend(v4, "substringWithRange:", v27, v28);
              long long v32 = objc_msgSend(v4, "substringWithRange:", v20, v30 - v20);
              [v49 appendString:v32];

              [v49 appendFormat:@"(%@)", v31];
              [v50 length];
              uint64_t v33 = [v4 length];

              uint64_t v20 = v30 + v29;
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          uint64_t v19 = v33 - v20;
        }

        if (v19)
        {
          uint64_t v34 = [v4 substringFromIndex:v20];
          [v49 appendString:v34];
        }
        long long v35 = [(NSArray *)v45->_groups objectAtIndexedSubscript:i];
        int v36 = [v35 category];

        [v40 appendFormat:@"%d = %@", v36, v49];
        if (i < v41 - 1) {
          [v40 appendString:@", "];
        }
        int v37 = 1;
LABEL_30:

        _Block_object_dispose(v59, 8);
        if (!v37) {
          goto LABEL_33;
        }
      }
      else
      {
      }
    }
  }
  id v39 = v40;
LABEL_33:

  return v39;
}

uint64_t __37__PSIGroupResult_unitTestDescription__block_invoke_3(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  for (uint64_t i = *(void **)(a1 + 32); v4 < [i count]; uint64_t i = *(void **)(a1 + 32))
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    unint64_t v7 = [v6 rangeValue];
    unint64_t v9 = v8;

    if (a2 >= v7 && a2 - v7 < v9)
    {
      uint64_t v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      uint64_t v12 = [v11 rangeValue];

      return v12;
    }
    unint64_t v4 = ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

void __37__PSIGroupResult_unitTestDescription__block_invoke_2()
{
  v0 = [PSITokenizer alloc];
  id v3 = +[PLSearchIndexConfiguration locale];
  uint64_t v1 = [(PSITokenizer *)v0 initWithLocale:v3 useCache:0];
  id v2 = (void *)unitTestDescription_tokenizer;
  unitTestDescription_tokenizer = v1;
}

uint64_t __37__PSIGroupResult_unitTestDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 rangeValue];
  uint64_t v7 = v5 + v6;
  uint64_t v8 = [v4 rangeValue];
  uint64_t v10 = v9;

  if (v7 < v8 + v10) {
    return -1;
  }
  else {
    return v7 != v8 + v10;
  }
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSIGroupResult;
  id v3 = [(PSIGroupResult *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(PSIGroupResult *)self normalizedUnitTestDescription];
  [v4 appendFormat:@" %@", v5];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v4[12] = CFArrayCreateCopy(0, self->_assetIds);
  v4[13] = CFArrayCreateCopy(0, self->_collectionIds);
  uint64_t v5 = [(NSArray *)self->_groups copy];
  uint64_t v6 = (void *)v4[11];
  v4[11] = v5;

  uint64_t v7 = [(NSString *)self->_owningContentString copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSMutableArray *)self->_assetUUIDs copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSMutableArray *)self->_collectionResults copy];
  uint64_t v12 = (void *)v4[5];
  v4[5] = v11;

  *((_DWORD *)v4 + 17) = LODWORD(self->_score);
  return v4;
}

- (void)dealloc
{
  assetIds = self->_assetIds;
  if (assetIds) {
    CFRelease(assetIds);
  }
  collectionIds = self->_collectionIds;
  if (collectionIds) {
    CFRelease(collectionIds);
  }
  v5.receiver = self;
  v5.super_class = (Class)PSIGroupResult;
  [(PSIGroupResult *)&v5 dealloc];
}

- (PSIGroupResult)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSIGroupResult;
  objc_super v5 = [(PSIGroupResult *)&v9 init];
  if (v5)
  {
    if (v4) {
      dispatch_queue_t v6 = (dispatch_queue_t)v4;
    }
    else {
      dispatch_queue_t v6 = dispatch_queue_create("PSIObject-description-get-rid-of-me", 0);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

@end