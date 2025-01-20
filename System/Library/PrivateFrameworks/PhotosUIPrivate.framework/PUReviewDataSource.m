@interface PUReviewDataSource
- (NSHashTable)_observers;
- (NSMutableArray)_assetIdentifiers;
- (NSMutableDictionary)_assetsByIdentifier;
- (NSMutableDictionary)_enqueuedBurstAssetIdentifiersByBurstIdentifier;
- (NSMutableDictionary)_enqueuedBurstAssetsByAssetIdentifier;
- (NSMutableDictionary)_representativeAssetsByBurstIdentifier;
- (NSMutableSet)_updatedAssetIdentifiers;
- (PUReviewDataSource)init;
- (id)assetsByIdentifier;
- (id)description;
- (id)existingAssetForIdentifier:(id)a3;
- (id)existingRepresentativeAssetForBurstIdentifier:(id)a3;
- (id)orderedIdentifiers;
- (int64_t)_nestedPerformChanges;
- (void)_setNestedPerformChanges:(int64_t)a3;
- (void)enqueuePendingBurstAsset:(id)a3;
- (void)insertAsset:(id)a3;
- (void)insertAsset:(id)a3 atIndex:(unint64_t)a4;
- (void)insertAssets:(id)a3;
- (void)performChanges:(id)a3;
- (void)processPendingBurstAssets;
- (void)registerChangeObserver:(id)a3;
- (void)removeAllAssets;
- (void)removeAssetWithIdentifier:(id)a3;
- (void)removeRepresentativeAssetForBurstIdentifier:(id)a3;
- (void)replaceAsset:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation PUReviewDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__updatedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->__enqueuedBurstAssetsByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->__enqueuedBurstAssetIdentifiersByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__representativeAssetsByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__assetsByIdentifier, 0);
  objc_storeStrong((id *)&self->__assetIdentifiers, 0);
  objc_storeStrong((id *)&self->__observers, 0);
}

- (NSMutableSet)_updatedAssetIdentifiers
{
  return self->__updatedAssetIdentifiers;
}

- (void)_setNestedPerformChanges:(int64_t)a3
{
  self->__nestedPerformChanges = a3;
}

- (int64_t)_nestedPerformChanges
{
  return self->__nestedPerformChanges;
}

- (NSMutableDictionary)_enqueuedBurstAssetsByAssetIdentifier
{
  return self->__enqueuedBurstAssetsByAssetIdentifier;
}

- (NSMutableDictionary)_enqueuedBurstAssetIdentifiersByBurstIdentifier
{
  return self->__enqueuedBurstAssetIdentifiersByBurstIdentifier;
}

- (NSMutableDictionary)_representativeAssetsByBurstIdentifier
{
  return self->__representativeAssetsByBurstIdentifier;
}

- (NSMutableDictionary)_assetsByIdentifier
{
  return self->__assetsByIdentifier;
}

- (NSMutableArray)_assetIdentifiers
{
  return self->__assetIdentifiers;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PUReviewDataSource *)self _assetIdentifiers];
  v6 = [(PUReviewDataSource *)self _assetsByIdentifier];
  v7 = [(PUReviewDataSource *)self _representativeAssetsByBurstIdentifier];
  v8 = [(PUReviewDataSource *)self _enqueuedBurstAssetIdentifiersByBurstIdentifier];
  v9 = [(PUReviewDataSource *)self _enqueuedBurstAssetsByAssetIdentifier];
  v10 = [v3 stringWithFormat:@"<%@ assetIdentifiers:%@, assetsByIdentifier:%@, representativeAssetsByBurstIDs:%@, enquedBurstAssetIdentifierByBurstID:%@, enqueuedBurstConvertiblesByAssetIdentifier:%@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)orderedIdentifiers
{
  v2 = [(PUReviewDataSource *)self _assetIdentifiers];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)assetsByIdentifier
{
  v2 = [(PUReviewDataSource *)self _assetsByIdentifier];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)unregisterChangeObserver:(id)a3
{
}

- (void)registerChangeObserver:(id)a3
{
}

- (void)performChanges:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(void))a3;
  int64_t v6 = [(PUReviewDataSource *)self _nestedPerformChanges];
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = [(PUReviewDataSource *)self _assetIdentifiers];
    v7 = (void *)[v8 copy];

    v9 = [(PUReviewDataSource *)self _updatedAssetIdentifiers];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"PUReviewDataSource.m", 312, @"Invalid parameter not satisfying: %@", @"[[self _updatedAssetIdentifiers] count] == 0" object file lineNumber description];
    }
  }
  [(PUReviewDataSource *)self _setNestedPerformChanges:[(PUReviewDataSource *)self _nestedPerformChanges] + 1];
  v5[2](v5);
  [(PUReviewDataSource *)self _setNestedPerformChanges:[(PUReviewDataSource *)self _nestedPerformChanges] - 1];
  if (!v6)
  {
    v11 = [(PUReviewDataSource *)self _updatedAssetIdentifiers];
    if ([v11 count])
    {
    }
    else
    {
      v12 = [(PUReviewDataSource *)self _assetIdentifiers];
      char v13 = [v7 isEqualToArray:v12];

      if (v13) {
        goto LABEL_17;
      }
    }
    v14 = [(PUReviewDataSource *)self _assetIdentifiers];
    v15 = (void *)[v14 copy];

    v16 = [(PUReviewDataSource *)self _updatedAssetIdentifiers];
    v17 = [v16 allObjects];

    v18 = [(PUReviewDataSource *)self _updatedAssetIdentifiers];
    [v18 removeAllObjects];

    v19 = [MEMORY[0x1E4F91218] changeDetailsFromArray:v7 toArray:v15 changedObjects:v17];
    v20 = [(PUReviewDataSource *)self _observers];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) reviewDataSourceDidChange:self changeDetails:v19];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v22);
    }
  }
LABEL_17:
}

- (void)processPendingBurstAssets
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(PUReviewDataSource *)self _enqueuedBurstAssetIdentifiersByBurstIdentifier];
  uint64_t v22 = [(PUReviewDataSource *)self _enqueuedBurstAssetsByAssetIdentifier];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v21 = *(void *)v28;
    *(void *)&long long v6 = 138543618;
    long long v20 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v4, "objectForKey:", v9, v20);
        v11 = [v22 objectForKey:v10];
        v12 = PLCameraGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v20;
          v33 = v10;
          __int16 v34 = 2114;
          uint64_t v35 = v9;
          _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEBUG, "Processing %{public}@ for burst %{public}@", buf, 0x16u);
        }

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          char v16 = 0;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v13);
              }
              uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * j);
              if (v16) {
                [(PUReviewDataSource *)self replaceAsset:v19];
              }
              else {
                [(PUReviewDataSource *)self insertAsset:v19];
              }
              char v16 = 1;
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v15);
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v7);
  }

  [v4 removeAllObjects];
  [v22 removeAllObjects];
}

- (void)enqueuePendingBurstAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  long long v6 = [v4 burstIdentifier];
  if (v6)
  {
    uint64_t v7 = [(PUReviewDataSource *)self _enqueuedBurstAssetsByAssetIdentifier];
    v8 = [(PUReviewDataSource *)self _enqueuedBurstAssetIdentifiersByBurstIdentifier];
    uint64_t v9 = [v8 objectForKey:v6];
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 isEqualToString:v5])
      {
LABEL_11:
        id v12 = [v7 objectForKey:v5];
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v7 setObject:v12 forKey:v5];
        }
        [v12 addObject:v4];

        goto LABEL_14;
      }
      [v8 setObject:v5 forKey:v6];
      [v7 removeObjectForKey:v10];
    }
    else
    {
      [v8 setObject:v5 forKey:v6];
    }
    v11 = PLCameraGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138543618;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      char v16 = v5;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEBUG, "Pending asset for %{public}@ is now %{public}@", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_11;
  }
  uint64_t v7 = PLCameraGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Unable to enqueue a pending burst asset because this asset does not have a burst identifier!", (uint8_t *)&v13, 2u);
  }
LABEL_14:
}

- (void)removeRepresentativeAssetForBurstIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PUReviewDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUReviewDataSource *)self performChanges:v6];
}

void __66__PUReviewDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) existingRepresentativeAssetForBurstIdentifier:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 identifier];
    [*(id *)(a1 + 32) removeAssetWithIdentifier:v4];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _enqueuedBurstAssetsByAssetIdentifier];
    uint64_t v15 = 0;
    char v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__76537;
    uint64_t v19 = __Block_byref_object_dispose__76538;
    id v20 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __66__PUReviewDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke_38;
    id v12 = &unk_1E5F2B4E8;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = &v15;
    [v5 enumerateKeysAndObjectsUsingBlock:&v9];
    long long v6 = objc_msgSend(v5, "objectForKey:", v16[5], v9, v10, v11, v12);

    if (v6)
    {
      [v5 removeObjectForKey:v16[5]];
      id v7 = PLCameraGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = v16[5];
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = v8;
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "Removed enqueued assets with no processed representative asset for identifier %{public}@", buf, 0xCu);
      }
    }
    _Block_object_dispose(&v15, 8);
  }
}

void __66__PUReviewDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke_38(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v8 = [a3 firstObject];
  uint64_t v9 = [v8 burstIdentifier];
  uint64_t v10 = v9;
  if (v8 && [v9 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)removeAllAssets
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__PUReviewDataSource_removeAllAssets__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUReviewDataSource *)self performChanges:v2];
}

void __37__PUReviewDataSource_removeAllAssets__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _assetsByIdentifier];
  v3 = [v2 allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) removeAssetWithIdentifier:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)removeAssetWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PUReviewDataSource_removeAssetWithIdentifier___block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUReviewDataSource *)self performChanges:v6];
}

void __48__PUReviewDataSource_removeAssetWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) existingAssetForIdentifier:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 burstIdentifier];
    id v5 = [*(id *)(a1 + 32) _assetIdentifiers];
    uint64_t v6 = [*(id *)(a1 + 32) _assetsByIdentifier];
    id v7 = [*(id *)(a1 + 32) _enqueuedBurstAssetsByAssetIdentifier];
    [v5 removeObject:*(void *)(a1 + 40)];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
    [v7 removeObjectForKey:*(void *)(a1 + 40)];
    if (v4)
    {
      long long v8 = [*(id *)(a1 + 32) _representativeAssetsByBurstIdentifier];
      [v8 removeObjectForKey:v4];
      long long v9 = [*(id *)(a1 + 32) _enqueuedBurstAssetIdentifiersByBurstIdentifier];
      [v9 removeObjectForKey:v4];
    }
    long long v10 = PLCameraGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v14 = 138543362;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEBUG, "Removed review asset for %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _enqueuedBurstAssetsByAssetIdentifier];
    id v12 = [v4 objectForKey:*(void *)(a1 + 40)];

    if (!v12) {
      goto LABEL_8;
    }
    [v4 removeObjectForKey:*(void *)(a1 + 40)];
    id v5 = PLCameraGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "Removed enqueued assets with no processed asset for identifier %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }

LABEL_8:
}

- (void)replaceAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  uint64_t v6 = [v4 burstIdentifier];
  uint64_t v7 = [(PUReviewDataSource *)self existingAssetForIdentifier:v5];
  uint64_t v8 = [(PUReviewDataSource *)self existingRepresentativeAssetForBurstIdentifier:v6];
  long long v9 = [(id)v8 identifier];
  if (v7 | v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__PUReviewDataSource_replaceAsset___block_invoke;
    v11[3] = &unk_1E5F2C960;
    id v12 = (id)v8;
    id v13 = v9;
    id v14 = v5;
    id v15 = v4;
    uint64_t v16 = self;
    [(PUReviewDataSource *)self performChanges:v11];

    long long v10 = v12;
  }
  else
  {
    long long v10 = PLCameraGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEBUG, "Ignoring update for review asset because we can't actually update anything", buf, 2u);
    }
  }
}

void __35__PUReviewDataSource_replaceAsset___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && ([*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 48)] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) creationDate];
    v3 = [*(id *)(a1 + 56) creationDate];
    [v2 timeIntervalSinceDate:v3];
    if (v9 >= 0.0)
    {
      long long v10 = PLCameraGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(__CFString **)(a1 + 48);
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEBUG, "Ignoring update for review asset due to creation date of convertible %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 64) removeAssetWithIdentifier:*(void *)(a1 + 40)];
      [*(id *)(a1 + 64) insertAsset:*(void *)(a1 + 56)];
    }
  }
  else
  {
    v2 = [*(id *)(a1 + 56) identifier];
    v3 = [*(id *)(a1 + 64) _assetsByIdentifier];
    [v3 setObject:*(void *)(a1 + 56) forKey:v2];
    id v4 = [*(id *)(a1 + 64) _updatedAssetIdentifiers];
    [v4 addObject:v2];

    if ([*(id *)(a1 + 56) mediaType] == 1)
    {
      id v5 = @"still image";
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 56) mediaType];
      id v5 = @"unknown";
      if (v6 == 2) {
        id v5 = @"video";
      }
    }
    uint64_t v7 = v5;
    uint64_t v8 = PLCameraGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      id v15 = v2;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "Updated review asset for %{public}@ %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)insertAssets:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PUReviewDataSource_insertAssets___block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(PUReviewDataSource *)self performChanges:v6];
}

void __35__PUReviewDataSource_insertAssets___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "insertAsset:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)insertAsset:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PUReviewDataSource_insertAsset_atIndex___block_invoke;
  v8[3] = &unk_1E5F2D2C8;
  id v9 = v6;
  long long v10 = self;
  unint64_t v11 = a4;
  id v7 = v6;
  [(PUReviewDataSource *)self performChanges:v8];
}

void __42__PUReviewDataSource_insertAsset_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [*(id *)(a1 + 32) burstIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) _assetIdentifiers];
  uint64_t v5 = [*(id *)(a1 + 40) _assetsByIdentifier];
  unint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 > [v4 count]) {
    [v4 addObject:v2];
  }
  else {
    [v4 insertObject:v2 atIndex:*(void *)(a1 + 48)];
  }
  [v5 setObject:*(void *)(a1 + 32) forKey:v2];
  if (v3)
  {
    id v7 = [*(id *)(a1 + 40) _representativeAssetsByBurstIdentifier];
    [v7 setObject:*(void *)(a1 + 32) forKey:v3];
  }
  if ([*(id *)(a1 + 32) mediaType] == 1)
  {
    long long v8 = @"still image";
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) mediaType];
    long long v8 = @"unknown";
    if (v9 == 2) {
      long long v8 = @"video";
    }
  }
  long long v10 = v8;
  unint64_t v11 = PLCameraGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2114;
    id v15 = v2;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEBUG, "Inserted review asset for %{public}@ %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)insertAsset:(id)a3
{
}

- (id)existingRepresentativeAssetForBurstIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUReviewDataSource *)self _representativeAssetsByBurstIdentifier];
  unint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)existingAssetForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUReviewDataSource *)self _assetsByIdentifier];
  unint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (PUReviewDataSource)init
{
  v19.receiver = self;
  v19.super_class = (Class)PUReviewDataSource;
  id v2 = [(PUReviewDataSource *)&v19 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->__observers;
    v2->__observers = (NSHashTable *)v3;

    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetIdentifiers = v2->__assetIdentifiers;
    v2->__assetIdentifiers = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetsByIdentifier = v2->__assetsByIdentifier;
    v2->__assetsByIdentifier = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    representativeAssetsByBurstIdentifier = v2->__representativeAssetsByBurstIdentifier;
    v2->__representativeAssetsByBurstIdentifier = v9;

    unint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    enqueuedBurstAssetIdentifiersByBurstIdentifier = v2->__enqueuedBurstAssetIdentifiersByBurstIdentifier;
    v2->__enqueuedBurstAssetIdentifiersByBurstIdentifier = v11;

    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    enqueuedBurstAssetsByAssetIdentifier = v2->__enqueuedBurstAssetsByAssetIdentifier;
    v2->__enqueuedBurstAssetsByAssetIdentifier = v13;

    id v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    updatedAssetIdentifiers = v2->__updatedAssetIdentifiers;
    v2->__updatedAssetIdentifiers = v15;

    uint64_t v17 = v2;
  }

  return v2;
}

@end