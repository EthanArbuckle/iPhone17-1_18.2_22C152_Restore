@interface PXPhotosDataSourceChange
- (BOOL)_shouldPerformFullReloadForCollectionListChangeNotifications:(id)a3 collectionChangeNotifications:(id)a4;
- (BOOL)affectsSectionsInRange:(_NSRange)a3;
- (BOOL)changesAreNoOp;
- (BOOL)hasIncrementalChanges;
- (NSArray)changedIndexPaths;
- (NSArray)contentChangedIndexPaths;
- (NSArray)deletedIndexPaths;
- (NSArray)favoriteChangedIndexPaths;
- (NSArray)insertedIndexPaths;
- (NSIndexSet)changedSections;
- (NSIndexSet)deletedSections;
- (NSIndexSet)insertedSections;
- (NSIndexSet)sectionsWithKeyAssetChanges;
- (PHChange)originatingPhotoLibraryChange;
- (PXPhotosDataSourceChange)initWithFromIdentifier:(int64_t)a3 toIdentifier:(int64_t)a4;
- (PXPhotosDataSourceChange)initWithIncrementalChanges:(id)a3 assetCollectionChangeDetails:(id)a4 sectionsWithKeyAssetChanges:(id)a5 previousCollectionsCount:(int64_t)a6 assetCollectionToSectionCache:(id)a7 originatingPhotoLibraryChange:(id)a8 fromIdentifier:(int64_t)a9 toIdentifier:(int64_t)a10;
- (PXSectionedDataSourceChangeDetails)sectionedDataSourceChangeDetails;
- (id)description;
- (id)indexPathAfterApplyingIncrementalChangesToIndexPath:(id)a3;
- (id)indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath:(id)a3;
- (void)_prepareIncrementalDetails;
- (void)prepareIfNeeded;
@end

@implementation PXPhotosDataSourceChange

- (PXPhotosDataSourceChange)initWithIncrementalChanges:(id)a3 assetCollectionChangeDetails:(id)a4 sectionsWithKeyAssetChanges:(id)a5 previousCollectionsCount:(int64_t)a6 assetCollectionToSectionCache:(id)a7 originatingPhotoLibraryChange:(id)a8 fromIdentifier:(int64_t)a9 toIdentifier:(int64_t)a10
{
  id v29 = a3;
  id v17 = a4;
  id v28 = a5;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)PXPhotosDataSourceChange;
  v20 = [(PXPhotosDataSourceChange *)&v34 init];
  v21 = v20;
  if (v20)
  {
    v20->_previousCollectionsCount = a6;
    objc_storeStrong((id *)&v20->_collectionListChangeDetails, a3);
    objc_storeStrong((id *)&v21->_assetCollectionChangeDetails, a4);
    objc_storeStrong((id *)&v21->_assetCollectionToSectionCache, a7);
    objc_storeWeak((id *)&v21->_originatingPhotoLibraryChange, v19);
    v22 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v29 originatingChange:v19];
    v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __225__PXPhotosDataSourceChange_initWithIncrementalChanges_assetCollectionChangeDetails_sectionsWithKeyAssetChanges_previousCollectionsCount_assetCollectionToSectionCache_originatingPhotoLibraryChange_fromIdentifier_toIdentifier___block_invoke;
    v30[3] = &unk_1E5DB7E10;
    id v31 = v18;
    id v32 = v23;
    id v33 = v19;
    id v24 = v23;
    [v17 enumerateKeysAndObjectsUsingBlock:v30];
    uint64_t v25 = [objc_alloc((Class)off_1E5DA8488) initWithFromDataSourceIdentifier:a9 toDataSourceIdentifier:a10 sectionChanges:v22 itemChangeDetailsBySection:v24 subitemChangeDetailsByItemBySection:0];
    sectionedDataSourceChangeDetails = v21->_sectionedDataSourceChangeDetails;
    v21->_sectionedDataSourceChangeDetails = (PXSectionedDataSourceChangeDetails *)v25;

    objc_storeStrong((id *)&v21->_sectionsWithKeyAssetChanges, a5);
  }

  return v21;
}

- (PXSectionedDataSourceChangeDetails)sectionedDataSourceChangeDetails
{
  return (PXSectionedDataSourceChangeDetails *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originatingPhotoLibraryChange);
  objc_storeStrong((id *)&self->_sectionsWithKeyAssetChanges, 0);
  objc_storeStrong((id *)&self->_sectionedDataSourceChangeDetails, 0);
  objc_storeStrong((id *)&self->_favoriteChangedIndexPaths, 0);
  objc_storeStrong((id *)&self->_contentChangedIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedSections, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_assetCollectionChangeDetails, 0);
  objc_storeStrong((id *)&self->_collectionListChangeDetails, 0);
  objc_storeStrong((id *)&self->_assetCollectionToSectionCache, 0);
}

void __225__PXPhotosDataSourceChange_initWithIncrementalChanges_assetCollectionChangeDetails_sectionsWithKeyAssetChanges_previousCollectionsCount_assetCollectionToSectionCache_originatingPhotoLibraryChange_fromIdentifier_toIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v5 objectForKeyedSubscript:a2];
  v7 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v6 originatingChange:*(void *)(a1 + 48)];

  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
}

- (PHChange)originatingPhotoLibraryChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatingPhotoLibraryChange);
  return (PHChange *)WeakRetained;
}

- (NSIndexSet)sectionsWithKeyAssetChanges
{
  return self->_sectionsWithKeyAssetChanges;
}

- (id)indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath:(id)a3
{
  id v6 = a3;
  if ([(PXPhotosDataSourceChange *)self hasIncrementalChanges])
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXPhotosDataSourceChange.m", 435, @"Invalid parameter not satisfying: %@", @"[self hasIncrementalChanges] == YES" object file lineNumber description];

    if (v6)
    {
LABEL_3:
      uint64_t v26 = 0;
      v27 = (id *)&v26;
      uint64_t v28 = 0x3032000000;
      id v29 = __Block_byref_object_copy__86056;
      v30 = __Block_byref_object_dispose__86057;
      id v31 = 0;
      v7 = [(PXPhotosDataSourceChange *)self insertedIndexPaths];
      if (([v7 containsObject:v6] & 1) == 0)
      {
        id v8 = [(PXPhotosDataSourceChange *)self insertedSections];
        char v9 = objc_msgSend(v8, "containsIndex:", objc_msgSend(v6, "px_section"));

        if (v9) {
          goto LABEL_10;
        }
        objc_storeStrong(v27 + 5, a3);
        v10 = [(PXPhotosDataSourceChange *)self insertedIndexPaths];

        if (v10)
        {
          id v11 = v27[5];
          v12 = [(PXPhotosDataSourceChange *)self insertedIndexPaths];
          uint64_t v13 = objc_msgSend(v11, "px_alteredIndexPathAfterDeletingItemsAtIndexPaths:", v12);
          id v14 = v27[5];
          v27[5] = (id)v13;
        }
        v15 = [(PXPhotosDataSourceChange *)self insertedSections];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __89__PXPhotosDataSourceChange_indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath___block_invoke;
        v25[3] = &unk_1E5DB7E88;
        v25[4] = &v26;
        [v15 enumerateIndexesWithOptions:2 usingBlock:v25];

        v16 = [(PXPhotosDataSourceChange *)self deletedSections];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __89__PXPhotosDataSourceChange_indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath___block_invoke_2;
        v24[3] = &unk_1E5DB7E88;
        v24[4] = &v26;
        [v16 enumerateIndexesUsingBlock:v24];

        id v17 = [(PXPhotosDataSourceChange *)self deletedIndexPaths];

        if (!v17) {
          goto LABEL_10;
        }
        id v18 = v27[5];
        v7 = [(PXPhotosDataSourceChange *)self deletedIndexPaths];
        uint64_t v19 = objc_msgSend(v18, "px_alteredIndexPathAfterInsertingItemsAtIndexPaths:", v7);
        id v20 = v27[5];
        v27[5] = (id)v19;
      }
LABEL_10:
      id v21 = v27[5];
      _Block_object_dispose(&v26, 8);

      goto LABEL_13;
    }
  }
  id v21 = 0;
LABEL_13:

  return v21;
}

void __89__PXPhotosDataSourceChange_indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath___block_invoke(uint64_t a1, unint64_t a2)
{
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_section") > a2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_item"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_section") - 1);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __89__PXPhotosDataSourceChange_indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_section") >= a2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_item"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_section") + 1);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)indexPathAfterApplyingIncrementalChangesToIndexPath:(id)a3
{
  id v6 = a3;
  if ([(PXPhotosDataSourceChange *)self hasIncrementalChanges])
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXPhotosDataSourceChange.m", 396, @"Invalid parameter not satisfying: %@", @"[self hasIncrementalChanges] == YES" object file lineNumber description];

    if (v6)
    {
LABEL_3:
      uint64_t v26 = 0;
      v27 = (id *)&v26;
      uint64_t v28 = 0x3032000000;
      id v29 = __Block_byref_object_copy__86056;
      v30 = __Block_byref_object_dispose__86057;
      id v31 = 0;
      v7 = [(PXPhotosDataSourceChange *)self deletedIndexPaths];
      if (([v7 containsObject:v6] & 1) == 0)
      {
        id v8 = [(PXPhotosDataSourceChange *)self deletedSections];
        char v9 = objc_msgSend(v8, "containsIndex:", objc_msgSend(v6, "px_section"));

        if (v9) {
          goto LABEL_10;
        }
        objc_storeStrong(v27 + 5, a3);
        v10 = [(PXPhotosDataSourceChange *)self deletedIndexPaths];

        if (v10)
        {
          id v11 = v27[5];
          v12 = [(PXPhotosDataSourceChange *)self deletedIndexPaths];
          uint64_t v13 = objc_msgSend(v11, "px_alteredIndexPathAfterDeletingItemsAtIndexPaths:", v12);
          id v14 = v27[5];
          v27[5] = (id)v13;
        }
        v15 = [(PXPhotosDataSourceChange *)self deletedSections];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __80__PXPhotosDataSourceChange_indexPathAfterApplyingIncrementalChangesToIndexPath___block_invoke;
        v25[3] = &unk_1E5DB7E88;
        v25[4] = &v26;
        [v15 enumerateIndexesWithOptions:2 usingBlock:v25];

        v16 = [(PXPhotosDataSourceChange *)self insertedSections];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __80__PXPhotosDataSourceChange_indexPathAfterApplyingIncrementalChangesToIndexPath___block_invoke_2;
        v24[3] = &unk_1E5DB7E88;
        v24[4] = &v26;
        [v16 enumerateIndexesUsingBlock:v24];

        id v17 = [(PXPhotosDataSourceChange *)self insertedIndexPaths];

        if (!v17) {
          goto LABEL_10;
        }
        id v18 = v27[5];
        v7 = [(PXPhotosDataSourceChange *)self insertedIndexPaths];
        uint64_t v19 = objc_msgSend(v18, "px_alteredIndexPathAfterInsertingItemsAtIndexPaths:", v7);
        id v20 = v27[5];
        v27[5] = (id)v19;
      }
LABEL_10:
      id v21 = v27[5];
      _Block_object_dispose(&v26, 8);

      goto LABEL_13;
    }
  }
  id v21 = 0;
LABEL_13:

  return v21;
}

void __80__PXPhotosDataSourceChange_indexPathAfterApplyingIncrementalChangesToIndexPath___block_invoke(uint64_t a1, unint64_t a2)
{
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_section") > a2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_item"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_section") - 1);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __80__PXPhotosDataSourceChange_indexPathAfterApplyingIncrementalChangesToIndexPath___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_section") >= a2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_item"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "px_section") + 1);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (BOOL)affectsSectionsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"PXPhotosDataSourceChange.m" lineNumber:333 description:@"Must have a valid location"];

    if (length) {
      goto LABEL_3;
    }
LABEL_28:
    LOBYTE(v36) = 0;
    return v36;
  }
  if (!a3.length) {
    goto LABEL_28;
  }
LABEL_3:
  if (length == 0x7FFFFFFFFFFFFFFFLL)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"PXPhotosDataSourceChange.m" lineNumber:334 description:@"Must have a valid length"];
  }
  v48 = [(PXPhotosDataSourceChange *)self deletedSections];
  v47 = [(PXPhotosDataSourceChange *)self insertedSections];
  v46 = [(PXPhotosDataSourceChange *)self changedSections];
  v7 = [MEMORY[0x1E4F28E60] indexSet];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v8 = [(PXPhotosDataSourceChange *)self deletedIndexPaths];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * i), "px_section"));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [MEMORY[0x1E4F28E60] indexSet];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v14 = [(PXPhotosDataSourceChange *)self insertedIndexPaths];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(v13, "addIndex:", objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * j), "px_section"));
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v16);
  }

  uint64_t v19 = [MEMORY[0x1E4F28E60] indexSet];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v20 = [(PXPhotosDataSourceChange *)self changedIndexPaths];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(v19, "addIndex:", objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * k), "px_section"));
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v22);
  }

  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", location, length);
  objc_msgSend(v25, "addIndex:", objc_msgSend(v25, "lastIndex") + 1);
  v45 = objc_msgSend(v25, "px_indexSetAdjustedForDeletions:", v48);
  v44 = objc_msgSend(v45, "px_indexSetAdjustedForInsertions:", v47);
  uint64_t v26 = objc_msgSend(v25, "px_coveringRange");
  uint64_t v28 = v27;
  uint64_t v29 = objc_msgSend(v45, "px_coveringRange");
  uint64_t v40 = v30;
  uint64_t v41 = v29;
  uint64_t v31 = objc_msgSend(v44, "px_coveringRange");
  uint64_t v33 = v32;
  int v43 = objc_msgSend(v48, "intersectsIndexesInRange:", v26, v28);
  int v42 = objc_msgSend(v7, "intersectsIndexesInRange:", v26, v28);
  int v34 = objc_msgSend(v47, "intersectsIndexesInRange:", v41, v40);
  int v35 = objc_msgSend(v19, "intersectsIndexesInRange:", v31, v33);
  LODWORD(v26) = objc_msgSend(v46, "intersectsIndexesInRange:", v31, v33);
  int v36 = v43 | v42 | v34 | v35 | v26 | objc_msgSend(v19, "intersectsIndexesInRange:", v31, v33);

  return v36;
}

- (BOOL)_shouldPerformFullReloadForCollectionListChangeNotifications:(id)a3 collectionChangeNotifications:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_5;
  }
  v7 = [v5 insertedIndexes];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [v5 removedIndexes];
  uint64_t v10 = [v9 count];

  if (![v5 hasIncrementalChanges])
  {
    BOOL v11 = 1;
    goto LABEL_20;
  }
  BOOL v11 = 1;
  if (([v5 hasMoves] & 1) == 0 && v10 + v8 <= 20)
  {
LABEL_5:
    id v25 = v6;
    id v26 = v5;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend(v18, "insertedIndexes", v25, v26, (void)v27);
          uint64_t v20 = [v19 count];
          uint64_t v21 = [v18 removedIndexes];
          uint64_t v22 = [v21 count];

          if (![v18 hasIncrementalChanges])
          {
            BOOL v11 = 1;
            goto LABEL_19;
          }
          char v23 = [v18 hasMoves];
          BOOL v11 = 1;
          if (v23) {
            goto LABEL_19;
          }
          v15 += v20 + v22;
          if (v15 > 100) {
            goto LABEL_19;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        BOOL v11 = 0;
        if (v14) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
LABEL_19:

    id v6 = v25;
    id v5 = v26;
  }
LABEL_20:

  return v11;
}

- (void)_prepareIncrementalDetails
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_collectionListChangeDetails = &self->_collectionListChangeDetails;
  uint64_t v4 = [(PHFetchResultChangeDetails *)self->_collectionListChangeDetails removedIndexes];
  id v5 = [(PHFetchResultChangeDetails *)*p_collectionListChangeDetails insertedIndexes];
  obuint64_t j = [(PHFetchResultChangeDetails *)*p_collectionListChangeDetails changedIndexes];
  int64_t previousCollectionsCount = self->_previousCollectionsCount;
  uint64_t v7 = [v5 count] + previousCollectionsCount;
  uint64_t v8 = v7 - [v4 count];
  NSUInteger v9 = [(NSDictionary *)self->_assetCollectionToSectionCache count];
  if (v8 == v9)
  {
    objc_storeStrong((id *)&self->_deletedSections, v4);
    objc_storeStrong((id *)&self->_insertedSections, v5);
    objc_storeStrong((id *)&self->_changedSections, obj);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__86056;
    *(void *)v46 = __Block_byref_object_dispose__86057;
    *(void *)&v46[8] = 0;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy__86056;
    int v42 = __Block_byref_object_dispose__86057;
    id v43 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    int v35 = __Block_byref_object_copy__86056;
    int v36 = __Block_byref_object_dispose__86057;
    id v37 = 0;
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x3032000000;
    long long v29 = __Block_byref_object_copy__86056;
    long long v30 = __Block_byref_object_dispose__86057;
    id v31 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    char v23 = __Block_byref_object_copy__86056;
    id v24 = __Block_byref_object_dispose__86057;
    id v25 = 0;
    assetCollectionChangeDetails = self->_assetCollectionChangeDetails;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__PXPhotosDataSourceChange__prepareIncrementalDetails__block_invoke;
    v19[3] = &unk_1E5DB7E60;
    v19[4] = self;
    v19[5] = buf;
    v19[6] = &v38;
    v19[7] = &v32;
    v19[8] = &v26;
    v19[9] = &v20;
    [(NSDictionary *)assetCollectionChangeDetails enumerateKeysAndObjectsUsingBlock:v19];
    objc_storeStrong((id *)&self->_deletedIndexPaths, *(id *)(*(void *)&buf[8] + 40));
    objc_storeStrong((id *)&self->_insertedIndexPaths, (id)v39[5]);
    objc_storeStrong((id *)&self->_changedIndexPaths, (id)v33[5]);
    objc_storeStrong((id *)&self->_contentChangedIndexPaths, (id)v27[5]);
    objc_storeStrong((id *)&self->_favoriteChangedIndexPaths, (id)v21[5]);
    BOOL v11 = ![(NSIndexSet *)self->_deletedSections count]
       && ![(NSIndexSet *)self->_insertedSections count]
       && ![(NSIndexSet *)self->_changedSections count]
       && ![(NSArray *)self->_deletedIndexPaths count]
       && ![(NSArray *)self->_insertedIndexPaths count]
       && ![(NSArray *)self->_changedIndexPaths count]
       && ![(NSArray *)self->_contentChangedIndexPaths count]
       && [(NSArray *)self->_favoriteChangedIndexPaths count] == 0;
    self->_changesAreNoOp = v11;
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    NSUInteger v12 = v9;
    uint64_t v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int64_t v14 = self->_previousCollectionsCount;
      uint64_t v15 = [v5 count];
      uint64_t v16 = [v4 count];
      uint64_t v17 = [(NSDictionary *)self->_assetCollectionToSectionCache allKeys];
      *(_DWORD *)buf = 134219010;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      v45 = (uint64_t (*)(uint64_t, uint64_t))v15;
      *(_WORD *)v46 = 2048;
      *(void *)&v46[2] = v16;
      *(_WORD *)&v46[10] = 2112;
      *(void *)&v46[12] = v17;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "The new collection count (%lu) doesn't match the expected count (%lu + %lu - %lu). Collection: %@", buf, 0x34u);
    }
  }
}

void __54__PXPhotosDataSourceChange__prepareIncrementalDetails__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 unsignedIntegerValue];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = v9;
      BOOL v11 = *(void **)(a1[4] + 24);
      uint64_t v12 = v10;
      if (v11)
      {
        uint64_t v13 = [v11 fetchResultBeforeChanges];
        uint64_t v12 = [v13 indexOfObject:v5];
      }
      int64_t v14 = [v6 removedIndexes];
      if ([v14 count])
      {
        uint64_t v15 = *(void *)(a1[5] + 8);
        uint64_t v16 = *(void **)(v15 + 40);
        if (v16)
        {
          id v17 = v16;
          id v18 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v17;
        }
        else
        {
          uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v20 = *(void *)(a1[5] + 8);
          id v18 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;
        }

        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v14, v12);
        [*(id *)(*(void *)(a1[5] + 8) + 40) addObjectsFromArray:v21];
      }
      uint64_t v22 = [v6 insertedIndexes];
      if ([v22 count])
      {
        uint64_t v23 = *(void *)(a1[6] + 8);
        id v24 = *(void **)(v23 + 40);
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = v25;
        }
        else
        {
          uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v28 = *(void *)(a1[6] + 8);
          uint64_t v26 = *(void **)(v28 + 40);
          *(void *)(v28 + 40) = v27;
        }

        long long v29 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v22, v10);
        [*(id *)(*(void *)(a1[6] + 8) + 40) addObjectsFromArray:v29];
      }
      long long v30 = [v6 changedIndexes];
      if ([v30 count])
      {
        uint64_t v31 = *(void *)(a1[7] + 8);
        uint64_t v32 = *(void **)(v31 + 40);
        v63 = v22;
        uint64_t v64 = v14;
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void **)(v31 + 40);
          *(void *)(v31 + 40) = v33;
        }
        else
        {
          uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v36 = *(void *)(a1[7] + 8);
          uint64_t v34 = *(void **)(v36 + 40);
          *(void *)(v36 + 40) = v35;
        }

        v62 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v30, v10);
        objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "addObjectsFromArray:");
        id v37 = [v6 fetchResultAfterChanges];
        uint64_t v38 = [MEMORY[0x1E4F28E60] indexSet];
        v39 = [MEMORY[0x1E4F28E60] indexSet];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __54__PXPhotosDataSourceChange__prepareIncrementalDetails__block_invoke_2;
        v65[3] = &unk_1E5DB7E38;
        id v40 = v37;
        uint64_t v41 = a1[4];
        id v60 = v40;
        id v66 = v40;
        uint64_t v67 = v41;
        id v42 = v38;
        id v68 = v42;
        id v43 = v39;
        id v69 = v43;
        [v30 enumerateIndexesUsingBlock:v65];
        if ([v42 count])
        {
          uint64_t v44 = *(void *)(a1[8] + 8);
          v45 = *(void **)(v44 + 40);
          if (v45)
          {
            id v46 = v45;
            uint64_t v47 = *(void **)(v44 + 40);
            *(void *)(v44 + 40) = v46;
          }
          else
          {
            uint64_t v48 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v60);
            uint64_t v49 = *(void *)(a1[8] + 8);
            uint64_t v47 = *(void **)(v49 + 40);
            *(void *)(v49 + 40) = v48;
          }

          long long v50 = *(void **)(*(void *)(a1[8] + 8) + 40);
          long long v51 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v42, v10);
          [v50 addObjectsFromArray:v51];
        }
        if (objc_msgSend(v43, "count", v60))
        {
          uint64_t v52 = *(void *)(a1[9] + 8);
          long long v53 = *(void **)(v52 + 40);
          if (v53)
          {
            id v54 = v53;
            long long v55 = *(void **)(v52 + 40);
            *(void *)(v52 + 40) = v54;
          }
          else
          {
            uint64_t v56 = [MEMORY[0x1E4F1CA48] array];
            uint64_t v57 = *(void *)(a1[9] + 8);
            long long v55 = *(void **)(v57 + 40);
            *(void *)(v57 + 40) = v56;
          }

          long long v58 = *(void **)(*(void *)(a1[9] + 8) + 40);
          long long v59 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v43, v10);
          [v58 addObjectsFromArray:v59];
        }
        uint64_t v22 = v63;
        int64_t v14 = v64;
      }
    }
  }
}

void __54__PXPhotosDataSourceChange__prepareIncrementalDetails__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) objectIDAtIndex:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 136));
  int v5 = [WeakRetained contentOrThumbnailChangedForPHAssetOID:v8];

  if (v5) {
    [*(id *)(a1 + 48) addIndex:a2];
  }
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 136));
  int v7 = [v6 favoriteStateChangedForPHAssetOID:v8];

  if (v7) {
    [*(id *)(a1 + 56) addIndex:a2];
  }
}

- (void)prepareIfNeeded
{
  if (self->_prepared) {
    return;
  }
  obuint64_t j = self;
  objc_sync_enter(obj);
  if (!self->_prepared)
  {
    uint64_t v3 = obj;
    collectionListChangeDetails = obj->_collectionListChangeDetails;
    if (!collectionListChangeDetails)
    {
      if (![(NSDictionary *)obj->_assetCollectionChangeDetails count])
      {
LABEL_8:
        self->_prepared = 1;
        goto LABEL_9;
      }
      uint64_t v3 = obj;
      collectionListChangeDetails = obj->_collectionListChangeDetails;
    }
    int v5 = [(NSDictionary *)v3->_assetCollectionChangeDetails allValues];
    BOOL v6 = [(PXPhotosDataSourceChange *)obj _shouldPerformFullReloadForCollectionListChangeNotifications:collectionListChangeDetails collectionChangeNotifications:v5];

    if (!v6) {
      [(PXPhotosDataSourceChange *)obj _prepareIncrementalDetails];
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_sync_exit(obj);
}

- (id)description
{
  v24.receiver = self;
  v24.super_class = (Class)PXPhotosDataSourceChange;
  uint64_t v23 = [(PXPhotosDataSourceChange *)&v24 description];
  uint64_t v21 = NSString;
  BOOL v3 = [(PXPhotosDataSourceChange *)self hasIncrementalChanges];
  uint64_t v4 = @"NO";
  if (v3) {
    uint64_t v4 = @"YES";
  }
  uint64_t v20 = v4;
  uint64_t v22 = [(PXPhotosDataSourceChange *)self deletedSections];
  uint64_t v19 = [v22 count];
  int v5 = [(PXPhotosDataSourceChange *)self insertedSections];
  uint64_t v18 = [v5 count];
  BOOL v6 = [(PXPhotosDataSourceChange *)self changedSections];
  uint64_t v7 = [v6 count];
  id v8 = [(PXPhotosDataSourceChange *)self deletedIndexPaths];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [(PXPhotosDataSourceChange *)self insertedIndexPaths];
  uint64_t v11 = [v10 count];
  uint64_t v12 = [(PXPhotosDataSourceChange *)self changedIndexPaths];
  uint64_t v13 = [v12 count];
  int64_t v14 = [(PXPhotosDataSourceChange *)self contentChangedIndexPaths];
  uint64_t v15 = [v21 stringWithFormat:@" hasIncremental:%@ sections:(%lu,%lu,%lu) indexPaths:(%lu,%lu,%lu,%lu) (del,ins,change,contentChange)", v20, v19, v18, v7, v9, v11, v13, objc_msgSend(v14, "count")];

  uint64_t v16 = [v23 stringByAppendingString:v15];

  return v16;
}

- (BOOL)changesAreNoOp
{
  return self->_changesAreNoOp;
}

- (NSArray)favoriteChangedIndexPaths
{
  [(PXPhotosDataSourceChange *)self prepareIfNeeded];
  favoriteChangedIndexPaths = self->_favoriteChangedIndexPaths;
  return favoriteChangedIndexPaths;
}

- (NSArray)contentChangedIndexPaths
{
  [(PXPhotosDataSourceChange *)self prepareIfNeeded];
  contentChangedIndexPaths = self->_contentChangedIndexPaths;
  return contentChangedIndexPaths;
}

- (NSArray)changedIndexPaths
{
  [(PXPhotosDataSourceChange *)self prepareIfNeeded];
  changedIndexPaths = self->_changedIndexPaths;
  return changedIndexPaths;
}

- (NSArray)insertedIndexPaths
{
  [(PXPhotosDataSourceChange *)self prepareIfNeeded];
  insertedIndexPaths = self->_insertedIndexPaths;
  return insertedIndexPaths;
}

- (NSArray)deletedIndexPaths
{
  [(PXPhotosDataSourceChange *)self prepareIfNeeded];
  deletedIndexPaths = self->_deletedIndexPaths;
  return deletedIndexPaths;
}

- (NSIndexSet)changedSections
{
  [(PXPhotosDataSourceChange *)self prepareIfNeeded];
  changedSections = self->_changedSections;
  return changedSections;
}

- (NSIndexSet)insertedSections
{
  [(PXPhotosDataSourceChange *)self prepareIfNeeded];
  insertedSections = self->_insertedSections;
  return insertedSections;
}

- (NSIndexSet)deletedSections
{
  [(PXPhotosDataSourceChange *)self prepareIfNeeded];
  deletedSections = self->_deletedSections;
  return deletedSections;
}

- (BOOL)hasIncrementalChanges
{
  return *(_OWORD *)&self->_deletedSections != 0
      || self->_changedSections
      || self->_deletedIndexPaths
      || self->_insertedIndexPaths
      || self->_changedIndexPaths
      || self->_changesAreNoOp;
}

- (PXPhotosDataSourceChange)initWithFromIdentifier:(int64_t)a3 toIdentifier:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosDataSourceChange;
  BOOL v6 = [(PXPhotosDataSourceChange *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_prepared = 1;
    id v8 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v9 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
    uint64_t v10 = [v8 initWithFromDataSourceIdentifier:a3 toDataSourceIdentifier:a4 sectionChanges:v9 itemChangeDetailsBySection:0 subitemChangeDetailsByItemBySection:0];
    sectionedDataSourceChangeDetails = v7->_sectionedDataSourceChangeDetails;
    v7->_sectionedDataSourceChangeDetails = (PXSectionedDataSourceChangeDetails *)v10;
  }
  return v7;
}

@end