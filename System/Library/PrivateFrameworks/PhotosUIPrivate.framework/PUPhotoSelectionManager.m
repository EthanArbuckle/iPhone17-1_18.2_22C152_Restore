@interface PUPhotoSelectionManager
- (BOOL)_shouldUniqueAssets;
- (BOOL)areAllAssetsSelectedInAssetCollection:(id)a3;
- (BOOL)areAllAssetsSelectedInAssetCollections:(id)a3;
- (BOOL)isAnyAssetSelected;
- (BOOL)isAnyAssetSelectedInAssetCollection:(id)a3;
- (BOOL)isAnyAssetSelectedInAssetCollections:(id)a3;
- (BOOL)isAssetAtIndexSelected:(unint64_t)a3 inAssetCollection:(id)a4;
- (NSArray)selectedAssetCollections;
- (NSDictionary)selectedAssetsByAssetCollection;
- (NSOrderedSet)orderedSelectedAssets;
- (NSSet)selectedAssets;
- (PHAssetCollectionDataSource)dataSource;
- (PUPhotoSelectionManager)init;
- (PUPhotoSelectionManager)initWithOptions:(int64_t)a3;
- (PXAssetMediaTypeCount)requestAssetsMediaTypeCount;
- (PXSelectionSnapshot)selectionSnapshot;
- (id)_selectionEntryForAssetCollection:(id)a3 createIfNeeded:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedSelectionString;
- (id)selectedAssetIndexesWithAssetCollectionOrdering:(id)a3;
- (id)selectedAssetsWithAssetCollectionOrdering:(id)a3;
- (int64_t)options;
- (void)_beginSelectionChange;
- (void)_endSelectionChange;
- (void)_selectFirstAssetInAssetCollections:(id)a3;
- (void)deselectAllAssets;
- (void)deselectAllAssetsInAssetCollections:(id)a3;
- (void)deselectAssetAtIndex:(unint64_t)a3 inAssetCollection:(id)a4;
- (void)deselectAssetsAtIndexes:(id)a3 inAssetCollection:(id)a4;
- (void)enumerateSelectedAssetsWithAssetCollectionOrdering:(id)a3 block:(id)a4;
- (void)handlePhotoLibraryChange:(id)a3;
- (void)invalidateAllAssetIndexes;
- (void)registerChangeObserver:(id)a3;
- (void)selectAllAssetsInAssetCollections:(id)a3;
- (void)selectAssetAtIndex:(unint64_t)a3 inAssetCollection:(id)a4;
- (void)selectAssetsAtIndexes:(id)a3 inAssetCollection:(id)a4;
- (void)selectInitialAssetsInAssetCollections:(id)a3;
- (void)setDataSource:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation PUPhotoSelectionManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_uniqueAssetSelection, 0);
  objc_storeStrong((id *)&self->_selectionEntriesByAssetCollection, 0);

  objc_storeStrong((id *)&self->_changeObservers, 0);
}

- (void)setDataSource:(id)a3
{
}

- (PHAssetCollectionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (PHAssetCollectionDataSource *)WeakRetained;
}

- (int64_t)options
{
  return self->_options;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v18 = [+[PUPhotoSelectionManager allocWithZone:](PUPhotoSelectionManager, "allocWithZone:") initWithOptions:self->_options];
  v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_selectionEntriesByAssetCollection;
  uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v12 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectForKey:v11];
        v13 = (void *)[v12 copyWithZone:a3];
        [v5 setObject:v13 forKey:v11];
      }
      uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  objc_storeStrong((id *)&v18->_selectionEntriesByAssetCollection, v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_storeWeak((id *)&v18->_dataSource, WeakRetained);

  if ([(PUPhotoSelectionManager *)v18 _shouldUniqueAssets])
  {
    uint64_t v15 = [(NSMutableSet *)self->_uniqueAssetSelection copy];
    uniqueAssetSelection = v18->_uniqueAssetSelection;
    v18->_uniqueAssetSelection = (NSMutableSet *)v15;
  }
  return v18;
}

- (BOOL)_shouldUniqueAssets
{
  return [(PUPhotoSelectionManager *)self options] & 1;
}

- (void)_endSelectionChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v2 = self->_selectionChangeCount - 1;
  self->_selectionChangeCount = v2;
  if (!v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = [(NSHashTable *)self->_changeObservers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) photoSelectionManagerSelectionDidChange:self];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_beginSelectionChange
{
}

- (void)invalidateAllAssetIndexes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_selectionEntriesByAssetCollection;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(void *)(*((void *)&v9 + 1) + 8 * v7), 0, (void)v9);
        [v8 invalidateAllAssetIndexes];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)handlePhotoLibraryChange:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = self->_selectionEntriesByAssetCollection;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v12 = [v4 changeDetailsForObject:v11];
        if ([v12 objectWasDeleted])
        {
          if (!v8)
          {
            uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
          }
          [v8 addObject:v11];
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        [(NSMapTable *)self->_selectionEntriesByAssetCollection removeObjectForKey:*(void *)(*((void *)&v28 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v15);
  }

  if ([(PUPhotoSelectionManager *)self _shouldUniqueAssets]) {
    [(PUPhotoSelectionManager *)self invalidateAllAssetIndexes];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v18 = self->_selectionEntriesByAssetCollection;
  uint64_t v19 = [(NSMapTable *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(void *)(*((void *)&v24 + 1) + 8 * k), 0, (void)v24);
        [v23 handlePhotoLibraryChange:v4];
      }
      uint64_t v20 = [(NSMapTable *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }
}

- (PXAssetMediaTypeCount)requestAssetsMediaTypeCount
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [(PUPhotoSelectionManager *)self selectedAssets];
  uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  if (v26)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        unint64_t v27 = v3;
        unint64_t v28 = v7;
        unint64_t v29 = v6;
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = [v11 playbackStyle];
        id v13 = [v11 location];

        if (v13) {
          unint64_t v14 = v5 + 1;
        }
        else {
          unint64_t v14 = v5;
        }
        uint64_t v15 = [v11 descriptionProperties];
        uint64_t v16 = [v15 assetDescription];
        uint64_t v17 = [v16 length];

        BOOL v18 = v17 == 0;
        unint64_t v6 = v29;
        if (!v18) {
          unint64_t v6 = v29 + 1;
        }
        uint64_t v19 = [v11 descriptionProperties];
        uint64_t v20 = [v19 accessibilityDescription];
        uint64_t v21 = [v20 length];

        BOOL v18 = v21 == 0;
        unint64_t v5 = v14;
        unint64_t v3 = v27;
        unint64_t v7 = v28;
        if (!v18) {
          unint64_t v7 = v28 + 1;
        }
        if ((unint64_t)(v12 - 1) < 3) {
          ++v9;
        }
        if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 4) {
          ++v8;
        }
        if (v12 == 5) {
          unint64_t v3 = v27 + 1;
        }
        if (v12 == 3) {
          ++v4;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v26);
  }

  retstr->var0 = v9;
  retstr->var1 = v8;
  retstr->var2 = v3;
  retstr->var3 = v4;
  retstr->var4 = 0;
  retstr->var5 = v5;
  retstr->var6 = 0;
  retstr->var7 = v6;
  retstr->var8 = v7;
  return result;
}

- (id)localizedSelectionString
{
  int64_t v2 = [(PUPhotoSelectionManager *)self selectedAssets];
  unint64_t v3 = [v2 allObjects];

  unint64_t v4 = PLLocalizedSelectionMessageForItems();

  return v4;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PUPhotoSelectionManager *)self dataSource];
  uint64_t v4 = [v3 assetCollectionsFetchResult];

  unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unint64_t v6 = [(NSMapTable *)self->_selectionEntriesByAssetCollection keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        uint64_t v12 = [v11 fetchResult];
        id v13 = [v11 assetCollection];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v8);
  }

  long long v30 = (void *)v4;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithCollectionListFetchResult:v4 options:4];
  unint64_t v29 = v5;
  [v14 setExistingAssetCollectionFetchResults:v5];
  unint64_t v28 = v14;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v14];
  unint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F90460]) initWithImmutablePhotosDataSource:v15 withChange:0];
  uint64_t v31 = [v27 identifier];
  id v32 = objc_alloc_init(MEMORY[0x1E4F912A0]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [(NSMapTable *)self->_selectionEntriesByAssetCollection keyEnumerator];
  uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        uint64_t v21 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectForKey:v20];
        uint64_t v22 = [v15 sectionForAssetCollection:v20];
        v23 = [v21 selectedIndexes];

        if (v23) {
          BOOL v24 = v22 == 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v24 = 1;
        }
        if (!v24)
        {
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __44__PUPhotoSelectionManager_selectionSnapshot__block_invoke;
          v34[3] = &unk_1E5F2A028;
          id v35 = v21;
          [v32 modifyItemIndexSetForDataSourceIdentifier:v31 section:v22 usingBlock:v34];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v17);
  }

  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F912E0]) initWithDataSource:v27 selectedIndexPaths:v32];

  return (PXSelectionSnapshot *)v25;
}

void __44__PUPhotoSelectionManager_selectionSnapshot__block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedIndexes];
  [v3 addIndexes:v4];
}

- (NSArray)selectedAssetCollections
{
  selectionEntriesByAssetCollection = self->_selectionEntriesByAssetCollection;
  if (selectionEntriesByAssetCollection)
  {
    selectionEntriesByAssetCollection = (void *)[selectionEntriesByAssetCollection count];
    if (selectionEntriesByAssetCollection)
    {
      selectionEntriesByAssetCollection = NSAllMapTableKeys(self->_selectionEntriesByAssetCollection);
    }
  }

  return (NSArray *)selectionEntriesByAssetCollection;
}

- (NSDictionary)selectedAssetsByAssetCollection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  selectionEntriesByAssetCollection = self->_selectionEntriesByAssetCollection;
  if (selectionEntriesByAssetCollection && [(NSMapTable *)selectionEntriesByAssetCollection count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMapTable count](self->_selectionEntriesByAssetCollection, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unint64_t v5 = [(NSMapTable *)self->_selectionEntriesByAssetCollection keyEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectForKey:v10];
          uint64_t v12 = [v11 selectedAssets];
          id v13 = (void *)[v12 copy];
          [v4 setObject:v13 forKeyedSubscript:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSOrderedSet)orderedSelectedAssets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) selectedAssets];
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSOrderedSet *)v3;
}

- (NSSet)selectedAssets
{
  if ([(PUPhotoSelectionManager *)self _shouldUniqueAssets])
  {
    id v3 = (void *)[(NSMutableSet *)self->_uniqueAssetSelection copy];
  }
  else
  {
    id v4 = [(PUPhotoSelectionManager *)self orderedSelectedAssets];
    id v3 = [v4 set];
  }

  return (NSSet *)v3;
}

- (id)selectedAssetsWithAssetCollectionOrdering:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(void *)(*((void *)&v14 + 1) + 8 * i), 0, (void)v14);
        long long v12 = [v11 selectedAssets];
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)enumerateSelectedAssetsWithAssetCollectionOrdering:(id)a3 block:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = [(PUPhotoSelectionManager *)self _selectionEntryForAssetCollection:*(void *)(*((void *)&v17 + 1) + 8 * i) createIfNeeded:0];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __84__PUPhotoSelectionManager_enumerateSelectedAssetsWithAssetCollectionOrdering_block___block_invoke;
        v13[3] = &unk_1E5F2A000;
        id v14 = v7;
        long long v15 = &v21;
        long long v16 = &v25;
        [v11 enumerateSelectedAssetsWithBlock:v13];
        if (*((unsigned char *)v26 + 24))
        {

          goto LABEL_11;
        }
        ++*((_DWORD *)v22 + 6);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

uint64_t __84__PUPhotoSelectionManager_enumerateSelectedAssetsWithAssetCollectionOrdering_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)selectedAssetIndexesWithAssetCollectionOrdering:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(void *)(*((void *)&v17 + 1) + 8 * i), 0, (void)v17);
        long long v12 = [v11 selectedIndexes];
        long long v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [MEMORY[0x1E4F28D60] indexSet];
        }
        long long v15 = v14;

        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)areAllAssetsSelectedInAssetCollections:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!-[PUPhotoSelectionManager areAllAssetsSelectedInAssetCollection:](self, "areAllAssetsSelectedInAssetCollection:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11))break; {
      if (v6 == ++v8)
      }
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        BOOL v9 = 1;
        goto LABEL_11;
      }
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)areAllAssetsSelectedInAssetCollection:(id)a3
{
  id v3 = [(PUPhotoSelectionManager *)self _selectionEntryForAssetCollection:a3 createIfNeeded:0];
  id v4 = [v3 selectedIndexes];
  uint64_t v5 = [v4 count];

  if (v5 < 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v6 = [v3 fetchResult];
    uint64_t v7 = [v6 count];

    BOOL v8 = v7 == v5;
  }

  return v8;
}

- (BOOL)isAnyAssetSelectedInAssetCollections:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[PUPhotoSelectionManager isAnyAssetSelectedInAssetCollection:](self, "isAnyAssetSelectedInAssetCollection:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isAnyAssetSelectedInAssetCollection:(id)a3
{
  id v3 = [(PUPhotoSelectionManager *)self _selectionEntryForAssetCollection:a3 createIfNeeded:0];
  id v4 = [v3 selectedIndexes];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)isAssetAtIndexSelected:(unint64_t)a3 inAssetCollection:(id)a4
{
  BOOL v5 = [(PUPhotoSelectionManager *)self _selectionEntryForAssetCollection:a4 createIfNeeded:0];
  LOBYTE(a3) = [v5 isIndexSelected:a3];

  return a3;
}

- (BOOL)isAnyAssetSelected
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(PUPhotoSelectionManager *)self _shouldUniqueAssets])
  {
    LOBYTE(v3) = [(NSMutableSet *)self->_uniqueAssetSelection count] != 0;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectEnumerator];
    uint64_t v3 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v4);
          }
          uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) selectedIndexes];
          uint64_t v8 = [v7 count];

          if (v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (void)deselectAllAssets
{
  [(PUPhotoSelectionManager *)self _beginSelectionChange];
  [(NSMapTable *)self->_selectionEntriesByAssetCollection removeAllObjects];
  [(NSMutableSet *)self->_uniqueAssetSelection removeAllObjects];

  [(PUPhotoSelectionManager *)self _endSelectionChange];
}

- (void)deselectAllAssetsInAssetCollections:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PUPhotoSelectionManager *)self _beginSelectionChange];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", v10, 0, (void)v15);
        long long v12 = (void *)MEMORY[0x1E4F28D60];
        long long v13 = [v11 fetchResult];
        long long v14 = objc_msgSend(v12, "indexSetWithIndexesInRange:", 0, objc_msgSend(v13, "count"));

        [(PUPhotoSelectionManager *)self deselectAssetsAtIndexes:v14 inAssetCollection:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(PUPhotoSelectionManager *)self _endSelectionChange];
}

- (void)deselectAssetsAtIndexes:(id)a3 inAssetCollection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PUPhotoSelectionManager *)self _beginSelectionChange];
  uint64_t v8 = [(PUPhotoSelectionManager *)self _selectionEntryForAssetCollection:v7 createIfNeeded:0];
  [v8 deselectAssetsAtIndexes:v6];
  if ([(PUPhotoSelectionManager *)self _shouldUniqueAssets])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v9 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (v14 != v8) {
            [v14 invalidateAllAssetIndexes];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  [(PUPhotoSelectionManager *)self _endSelectionChange];
}

- (void)deselectAssetAtIndex:(unint64_t)a3 inAssetCollection:(id)a4
{
  id v6 = a4;
  [(PUPhotoSelectionManager *)self _beginSelectionChange];
  id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  [(PUPhotoSelectionManager *)self deselectAssetsAtIndexes:v7 inAssetCollection:v6];

  [(PUPhotoSelectionManager *)self _endSelectionChange];
}

- (void)_selectFirstAssetInAssetCollections:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PUPhotoSelectionManager *)self _beginSelectionChange];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", v10, 1, (void)v15);
        uint64_t v12 = [v11 fetchResult];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          long long v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
          [(PUPhotoSelectionManager *)self selectAssetsAtIndexes:v14 inAssetCollection:v10];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(PUPhotoSelectionManager *)self _endSelectionChange];
}

- (void)selectInitialAssetsInAssetCollections:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v5, 0, sizeof(v5));
  if ([v4 countByEnumeratingWithState:v5 objects:v6 count:16]
    && !PXDisplayAssetCollectionSharingShouldStartWithAllAssetsSelected())
  {
    [(PUPhotoSelectionManager *)self _selectFirstAssetInAssetCollections:v4];
  }
  else
  {
    [(PUPhotoSelectionManager *)self selectAllAssetsInAssetCollections:v4];
  }
}

- (void)selectAllAssetsInAssetCollections:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PUPhotoSelectionManager *)self _beginSelectionChange];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", v10, 1, (void)v15);
        uint64_t v12 = (void *)MEMORY[0x1E4F28D60];
        uint64_t v13 = [v11 fetchResult];
        long long v14 = objc_msgSend(v12, "indexSetWithIndexesInRange:", 0, objc_msgSend(v13, "count"));

        [(PUPhotoSelectionManager *)self selectAssetsAtIndexes:v14 inAssetCollection:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(PUPhotoSelectionManager *)self _endSelectionChange];
}

- (void)selectAssetsAtIndexes:(id)a3 inAssetCollection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PUPhotoSelectionManager *)self _beginSelectionChange];
  uint64_t v8 = [(PUPhotoSelectionManager *)self _selectionEntryForAssetCollection:v7 createIfNeeded:1];
  [v8 selectAssetsAtIndexes:v6];
  if ([(PUPhotoSelectionManager *)self _shouldUniqueAssets])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v9 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (v14 != v8) {
            [v14 invalidateAllAssetIndexes];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  [(PUPhotoSelectionManager *)self _endSelectionChange];
}

- (void)selectAssetAtIndex:(unint64_t)a3 inAssetCollection:(id)a4
{
  id v6 = a4;
  [(PUPhotoSelectionManager *)self _beginSelectionChange];
  id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  [(PUPhotoSelectionManager *)self selectAssetsAtIndexes:v7 inAssetCollection:v6];

  [(PUPhotoSelectionManager *)self _endSelectionChange];
}

- (id)_selectionEntryForAssetCollection:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMapTable *)self->_selectionEntriesByAssetCollection objectForKey:v6];
  BOOL v8 = [(PUPhotoSelectionManager *)self _shouldUniqueAssets];
  if (!v7)
  {
    if (v4 || v8)
    {
      if (v8) {
        uniqueAssetSelection = self->_uniqueAssetSelection;
      }
      else {
        uniqueAssetSelection = 0;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F390A0];
      uint64_t v11 = uniqueAssetSelection;
      uint64_t v12 = [v10 fetchOptionsWithPhotoLibrary:0 orObject:v6];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      if (WeakRetained)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_dataSource);
        long long v15 = [v14 assetsInAssetCollection:v6];
      }
      else
      {
        long long v15 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v12];
      }

      id v7 = [[PUPhotoSelectionEntry alloc] initWithAssetCollection:v6 fetchResult:v15 uniqueSelectedAssets:v11];
      [(NSMapTable *)self->_selectionEntriesByAssetCollection setObject:v7 forKey:v6];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)unregisterChangeObserver:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPhotoSelectionManager.m", 94, @"%s must be called on the main thread", "-[PUPhotoSelectionManager unregisterChangeObserver:]");
  }
  [(NSHashTable *)self->_changeObservers removeObject:v6];
}

- (void)registerChangeObserver:(id)a3
{
  id v10 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPhotoSelectionManager.m", 85, @"%s must be called on the main thread", "-[PUPhotoSelectionManager registerChangeObserver:]");
  }
  changeObservers = self->_changeObservers;
  if (!changeObservers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_changeObservers;
    self->_changeObservers = v6;

    changeObservers = self->_changeObservers;
  }
  if ([(NSHashTable *)changeObservers containsObject:v10])
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUPhotoSelectionManager.m", 89, @"can't register an observer instance more than once: %@", v10 object file lineNumber description];
  }
  [(NSHashTable *)self->_changeObservers addObject:v10];
}

- (PUPhotoSelectionManager)initWithOptions:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoSelectionManager;
  BOOL v4 = [(PUPhotoSelectionManager *)&v11 init];
  id v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    selectionEntriesByAssetCollection = v5->_selectionEntriesByAssetCollection;
    v5->_selectionEntriesByAssetCollection = (NSMapTable *)v6;

    if ([(PUPhotoSelectionManager *)v5 _shouldUniqueAssets])
    {
      BOOL v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uniqueAssetSelection = v5->_uniqueAssetSelection;
      v5->_uniqueAssetSelection = v8;
    }
  }
  return v5;
}

- (PUPhotoSelectionManager)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PUPhotoSelectionManager.m", 66, @"Do not use this initializer, use the designated one instead." object file lineNumber description];

  return 0;
}

@end