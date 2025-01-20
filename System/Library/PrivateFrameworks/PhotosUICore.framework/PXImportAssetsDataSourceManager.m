@interface PXImportAssetsDataSourceManager
+ (BOOL)assetCollectionsArray:(id)a3 isEqualToAssetCollectionsArray:(id)a4;
+ (void)addModels:(id)a3 toAssetCollections:(id)a4 assetCollectionsById:(id)a5;
+ (void)copyFromAssetCollections:(id)a3 toAssetCollections:(id *)a4 assetCollectionsById:(id *)a5;
+ (void)removeModels:(id)a3 fromAssetCollections:(id)a4 assetCollectionsById:(id)a5;
+ (void)sortAssetCollectionsInArray:(id)a3;
- (BOOL)alreadyImportedItemsSelectable;
- (BOOL)dataSourcesStartAtEnd;
- (BOOL)dispatchesDataSourceUpdatesOnMainQueue;
- (BOOL)needsFilterUpdate;
- (BOOL)showAlreadyImportedItems;
- (BOOL)showNotYetImportedItems;
- (NSArray)filteredAssetCollections;
- (NSDictionary)filteredAssetCollectionsById;
- (NSMutableArray)allAssetCollections;
- (NSMutableDictionary)allAssetCollectionsById;
- (NSSet)visibleImportAssetIdentifiers;
- (NSString)logIdentifier;
- (OS_dispatch_queue)modelQueue;
- (PXImportAssetCollection)unfilteredAlreadyImportedAssetCollection;
- (PXImportAssetsDataSource)unfilteredDataSource;
- (PXImportAssetsDataSourceManager)initWithAssetsFromDataSourceManager:(id)a3 delegate:(id)a4 logIdentifier:(id)a5;
- (PXImportAssetsDataSourceManager)initWithDelegate:(id)a3 logIdentifier:(id)a4;
- (PXImportAssetsDataSourceManagerDelegate)delegate;
- (id)createInitialDataSource;
- (id)existingModelsFromModels:(id)a3 inAssetCollections:(id)a4 assetCollectionsById:(id)a5;
- (id)filteredModelsFromModels:(id)a3 inAssetCollections:(id)a4 assetCollectionsById:(id)a5;
- (int64_t)countOfAlreadyImportedAssetCollectionInCollectionsMap:(id)a3;
- (int64_t)countOfUnfilteredAlreadyImportedAssetCollection;
- (int64_t)forcedAlreadyImportedTruncationMode;
- (int64_t)maxAlreadyImportedItems;
- (void)addAssets:(id)a3;
- (void)modifyAssetCollectionsWithBlock:(id)a3;
- (void)pruneEmptyAssetCollectionsInCollections:(id)a3 collectionsById:(id)a4;
- (void)rebuildAlreadyImportedAssetCollectionInCollections:(id)a3 collectionsById:(id)a4;
- (void)registerChangeObserver:(id)a3 context:(void *)a4;
- (void)removeAssets:(id)a3;
- (void)setAllAssetCollections:(id)a3;
- (void)setAllAssetCollectionsById:(id)a3;
- (void)setAlreadyImportedItemsSelectable:(BOOL)a3;
- (void)setDataSourcesStartAtEnd:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchesDataSourceUpdatesOnMainQueue:(BOOL)a3;
- (void)setFilteredAssetCollections:(id)a3;
- (void)setFilteredAssetCollectionsById:(id)a3;
- (void)setForcedAlreadyImportedTruncationMode:(int64_t)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setMaxAlreadyImportedItems:(int64_t)a3;
- (void)setModelQueue:(id)a3;
- (void)setNeedsFilterUpdate;
- (void)setNeedsFilterUpdate:(BOOL)a3;
- (void)setShowAlreadyImportedItems:(BOOL)a3;
- (void)setShowNotYetImportedItems:(BOOL)a3;
- (void)setUnfilteredDataSource:(id)a3;
- (void)setVisibleImportAssetIdentifiers:(id)a3;
- (void)unregisterChangeObserver:(id)a3 context:(void *)a4;
- (void)updateAlreadyImportedSelectability;
- (void)updateFilteredAssetsIfNeeded;
@end

@implementation PXImportAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_modelQueue, 0);
  objc_storeStrong((id *)&self->_filteredAssetCollections, 0);
  objc_storeStrong((id *)&self->_allAssetCollections, 0);
  objc_storeStrong((id *)&self->_filteredAssetCollectionsById, 0);
  objc_storeStrong((id *)&self->_allAssetCollectionsById, 0);
  objc_storeStrong((id *)&self->_visibleImportAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_unfilteredDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLogIdentifier:(id)a3
{
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setForcedAlreadyImportedTruncationMode:(int64_t)a3
{
  self->_forcedAlreadyImportedTruncationMode = a3;
}

- (int64_t)forcedAlreadyImportedTruncationMode
{
  return self->_forcedAlreadyImportedTruncationMode;
}

- (int64_t)maxAlreadyImportedItems
{
  return self->_maxAlreadyImportedItems;
}

- (void)setNeedsFilterUpdate:(BOOL)a3
{
  self->_needsFilterUpdate = a3;
}

- (BOOL)needsFilterUpdate
{
  return self->_needsFilterUpdate;
}

- (void)setModelQueue:(id)a3
{
}

- (OS_dispatch_queue)modelQueue
{
  return self->_modelQueue;
}

- (void)setFilteredAssetCollections:(id)a3
{
}

- (NSArray)filteredAssetCollections
{
  return self->_filteredAssetCollections;
}

- (void)setAllAssetCollections:(id)a3
{
}

- (NSMutableArray)allAssetCollections
{
  return self->_allAssetCollections;
}

- (void)setFilteredAssetCollectionsById:(id)a3
{
}

- (NSDictionary)filteredAssetCollectionsById
{
  return self->_filteredAssetCollectionsById;
}

- (void)setAllAssetCollectionsById:(id)a3
{
}

- (NSMutableDictionary)allAssetCollectionsById
{
  return self->_allAssetCollectionsById;
}

- (void)setDataSourcesStartAtEnd:(BOOL)a3
{
  self->_dataSourcesStartAtEnd = a3;
}

- (BOOL)dataSourcesStartAtEnd
{
  return self->_dataSourcesStartAtEnd;
}

- (BOOL)alreadyImportedItemsSelectable
{
  return self->_alreadyImportedItemsSelectable;
}

- (BOOL)showNotYetImportedItems
{
  return self->_showNotYetImportedItems;
}

- (BOOL)showAlreadyImportedItems
{
  return self->_showAlreadyImportedItems;
}

- (NSSet)visibleImportAssetIdentifiers
{
  return self->_visibleImportAssetIdentifiers;
}

- (void)setDispatchesDataSourceUpdatesOnMainQueue:(BOOL)a3
{
  self->_dispatchesDataSourceUpdatesOnMainQueue = a3;
}

- (BOOL)dispatchesDataSourceUpdatesOnMainQueue
{
  return self->_dispatchesDataSourceUpdatesOnMainQueue;
}

- (PXImportAssetsDataSource)unfilteredDataSource
{
  return self->_unfilteredDataSource;
}

- (void)setDelegate:(id)a3
{
}

- (PXImportAssetsDataSourceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXImportAssetsDataSourceManagerDelegate *)WeakRetained;
}

- (void)setUnfilteredDataSource:(id)a3
{
  v5 = (PXImportAssetsDataSource *)a3;
  if (self->_unfilteredDataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_unfilteredDataSource, a3);
    [(PXImportAssetsDataSourceManager *)self updateAlreadyImportedSelectability];
    v5 = v6;
  }
}

- (int64_t)countOfAlreadyImportedAssetCollectionInCollectionsMap:(id)a3
{
  id v3 = a3;
  v4 = +[PXImportItemViewModel alreadyImportedGroupIdentifier];
  v5 = [v3 objectForKeyedSubscript:v4];

  int64_t v6 = [v5 numberOfItems];
  return v6;
}

- (int64_t)countOfUnfilteredAlreadyImportedAssetCollection
{
  v2 = [(PXImportAssetsDataSourceManager *)self unfilteredAlreadyImportedAssetCollection];
  int64_t v3 = [v2 numberOfItems];

  return v3;
}

- (PXImportAssetCollection)unfilteredAlreadyImportedAssetCollection
{
  int64_t v3 = +[PXImportItemViewModel alreadyImportedGroupIdentifier];
  v4 = [(PXImportAssetsDataSourceManager *)self allAssetCollectionsById];
  v5 = [v4 objectForKeyedSubscript:v3];

  return (PXImportAssetCollection *)v5;
}

- (void)updateAlreadyImportedSelectability
{
  int64_t v3 = [(PXImportAssetsDataSourceManager *)self unfilteredAlreadyImportedAssetCollection];
  if (v3)
  {
    BOOL v4 = [(PXImportAssetsDataSourceManager *)self alreadyImportedItemsSelectable];
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__43909;
    v8[4] = __Block_byref_object_dispose__43910;
    id v9 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke;
    v7[3] = &unk_1E5DB33D0;
    v7[4] = v8;
    [v3 arrangedObjects:v7];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke_2;
    v5[3] = &unk_1E5DCCB88;
    v5[4] = self;
    v5[5] = v8;
    BOOL v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
    _Block_object_dispose(v8, 8);
  }
}

void __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke(uint64_t a1, void *a2)
{
}

void __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        int v8 = [v7 isSelectable];
        if (v8 != [*(id *)(a1 + 32) alreadyImportedItemsSelectable])
        {
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke_3;
          v9[3] = &__block_descriptor_33_e40_v16__0___PXMutableImportItemViewModel__8l;
          char v10 = *(unsigned char *)(a1 + 48);
          [v7 performChanges:v9];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __69__PXImportAssetsDataSourceManager_updateAlreadyImportedSelectability__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setSelectable:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setAlreadyImportedItemsSelectable:(BOOL)a3
{
  if (self->_alreadyImportedItemsSelectable != a3)
  {
    self->_alreadyImportedItemsSelectable = a3;
    [(PXImportAssetsDataSourceManager *)self updateAlreadyImportedSelectability];
  }
}

- (void)setShowNotYetImportedItems:(BOOL)a3
{
  if (self->_showNotYetImportedItems != a3)
  {
    self->_showNotYetImportedItems = a3;
    [(PXImportAssetsDataSourceManager *)self setNeedsFilterUpdate];
  }
}

- (void)setShowAlreadyImportedItems:(BOOL)a3
{
  if (self->_showAlreadyImportedItems != a3)
  {
    self->_showAlreadyImportedItems = a3;
    [(PXImportAssetsDataSourceManager *)self setNeedsFilterUpdate];
  }
}

- (void)setMaxAlreadyImportedItems:(int64_t)a3
{
  if (self->_maxAlreadyImportedItems != a3)
  {
    self->_maxAlreadyImportedItems = a3;
    [(PXImportAssetsDataSourceManager *)self setNeedsFilterUpdate];
  }
}

- (void)setVisibleImportAssetIdentifiers:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  visibleImportAssetIdentifiers = self->_visibleImportAssetIdentifiers;
  if (v4 | (unint64_t)visibleImportAssetIdentifiers)
  {
    id v9 = (void *)v4;
    BOOL v6 = [(NSSet *)visibleImportAssetIdentifiers isEqualToSet:v4];
    unint64_t v4 = (unint64_t)v9;
    if (!v6)
    {
      v7 = (NSSet *)[v9 copy];
      int v8 = self->_visibleImportAssetIdentifiers;
      self->_visibleImportAssetIdentifiers = v7;

      [(PXImportAssetsDataSourceManager *)self setNeedsFilterUpdate];
      unint64_t v4 = (unint64_t)v9;
    }
  }
}

- (void)setNeedsFilterUpdate
{
}

- (void)pruneEmptyAssetCollectionsInCollections:(id)a3 collectionsById:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  int v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v14, "numberOfItems", (void)v16))
        {
          [v7 addObject:v14];
          v15 = [v14 identifier];
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v9 removeObjectsInArray:v7];
  [v6 removeObjectsForKeys:v8];
}

- (void)rebuildAlreadyImportedAssetCollectionInCollections:(id)a3 collectionsById:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXImportAssetsDataSourceManager *)self maxAlreadyImportedItems] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = +[PXImportItemViewModel alreadyImportedGroupIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      [v9 removeAllObjects];
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__43909;
      v33 = __Block_byref_object_dispose__43910;
      id v34 = 0;
      uint64_t v10 = [(PXImportAssetsDataSourceManager *)self unfilteredAlreadyImportedAssetCollection];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __102__PXImportAssetsDataSourceManager_rebuildAlreadyImportedAssetCollectionInCollections_collectionsById___block_invoke;
      v28[3] = &unk_1E5DB33D0;
      v28[4] = &v29;
      [v10 arrangedObjects:v28];

      uint64_t v11 = [(id)v30[5] count];
      uint64_t v12 = +[PXImportSettings sharedInstance];
      uint64_t v13 = [v12 alreadyImportedTruncationMode];

      int64_t v14 = [(PXImportAssetsDataSourceManager *)self forcedAlreadyImportedTruncationMode];
      if ((unint64_t)(v14 - 1) < 3) {
        uint64_t v13 = v14 - 1;
      }
      BOOL v16 = v11 > [(PXImportAssetsDataSourceManager *)self maxAlreadyImportedItems]
         && [(PXImportAssetsDataSourceManager *)self maxAlreadyImportedItems] > 0
         && v13 == 1;
      if (v13 != 1) {
        BOOL v16 = 1;
      }
      if (v13 && v16)
      {
        if (v13 == 2)
        {
          int64_t v17 = [(PXImportAssetsDataSourceManager *)self maxAlreadyImportedItems];
          if (v17 >= v11) {
            uint64_t v18 = v11;
          }
          else {
            uint64_t v18 = v17;
          }
          long long v19 = [(id)v30[5] subarrayWithRange:v11 - v18];
          [v9 addObjectsFromArray:v19];
        }
        else
        {
          uint64_t v22 = [(PXImportAssetsDataSourceManager *)self maxAlreadyImportedItems];
          if (v22 >= 0) {
            uint64_t v23 = v22;
          }
          else {
            uint64_t v23 = v22 + 1;
          }
          int64_t v24 = [(PXImportAssetsDataSourceManager *)self maxAlreadyImportedItems];
          long long v19 = objc_msgSend((id)v30[5], "subarrayWithRange:", 0, v24 + ~(v23 >> 1));
          v25 = objc_msgSend((id)v30[5], "subarrayWithRange:", v11 - (v23 >> 1), v23 >> 1);
          [v9 addObjectsFromArray:v19];
          v26 = +[PXImportExpansionPlaceholderViewModel sharedInstance];
          [v9 addObject:v26];

          [v9 addObjectsFromArray:v25];
        }
      }
      else
      {
        int64_t v20 = [(PXImportAssetsDataSourceManager *)self maxAlreadyImportedItems];
        if (v20 >= v11) {
          uint64_t v21 = v11;
        }
        else {
          uint64_t v21 = v20;
        }
        long long v19 = objc_msgSend((id)v30[5], "subarrayWithRange:", 0, v21);
        [v9 addObjectsFromArray:v19];
      }

      if (![v9 numberOfItems])
      {
        [v6 removeObject:v9];
        v27 = [v9 identifier];
        [v7 removeObjectForKey:v27];
      }
      _Block_object_dispose(&v29, 8);
    }
  }
}

void __102__PXImportAssetsDataSourceManager_rebuildAlreadyImportedAssetCollectionInCollections_collectionsById___block_invoke(uint64_t a1, void *a2)
{
}

- (id)existingModelsFromModels:(id)a3 inAssetCollections:(id)a4 assetCollectionsById:(id)a5
{
  id v6 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__PXImportAssetsDataSourceManager_existingModelsFromModels_inAssetCollections_assetCollectionsById___block_invoke;
  v12[3] = &unk_1E5DB3420;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [v8 indexesOfObjectsPassingTest:v12];
  uint64_t v10 = [v8 objectsAtIndexes:v9];

  return v10;
}

BOOL __100__PXImportAssetsDataSourceManager_existingModelsFromModels_inAssetCollections_assetCollectionsById___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 groupIdentifier];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  id v6 = v5;
  BOOL v7 = v5 && [v5 indexOfItem:v3] != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (id)filteredModelsFromModels:(id)a3 inAssetCollections:(id)a4 assetCollectionsById:(id)a5
{
  id v7 = a5;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __100__PXImportAssetsDataSourceManager_filteredModelsFromModels_inAssetCollections_assetCollectionsById___block_invoke;
  BOOL v16 = &unk_1E5DB33F8;
  int64_t v17 = self;
  id v18 = v7;
  id v8 = v7;
  id v9 = a3;
  uint64_t v10 = [v9 indexesOfObjectsPassingTest:&v13];
  uint64_t v11 = objc_msgSend(v9, "objectsAtIndexes:", v10, v13, v14, v15, v16, v17);

  return v11;
}

BOOL __100__PXImportAssetsDataSourceManager_filteredModelsFromModels_inAssetCollections_assetCollectionsById___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 groupIdentifier];
  id v5 = [*(id *)(a1 + 32) visibleImportAssetIdentifiers];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_3;
  }
  id v7 = [v3 uuid];
  id v8 = [*(id *)(a1 + 32) visibleImportAssetIdentifiers];
  id v9 = [v8 member:v7];

  if (!v9)
  {
    BOOL v12 = 0;
  }
  else
  {
LABEL_3:
    uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
    uint64_t v11 = v10;
    BOOL v12 = v10
       && (![v10 alreadyImportedGroup]
        || [*(id *)(a1 + 32) showAlreadyImportedItems])
       && (([v11 alreadyImportedGroup] & 1) != 0
        || [*(id *)(a1 + 32) showNotYetImportedItems]);
  }
  return v12;
}

- (void)modifyAssetCollectionsWithBlock:(id)a3
{
  id v4 = a3;
  modelQueue = self->_modelQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke;
  v7[3] = &unk_1E5DD3280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(modelQueue, v7);
}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke(uint64_t a1)
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) delegate];
  v33 = [v3 viewModelMapForImportAssetsDataSourceManager:*v2];

  id v4 = objc_opt_class();
  id v5 = [*v2 filteredAssetCollections];
  id v60 = 0;
  id v61 = 0;
  [v4 copyFromAssetCollections:v5 toAssetCollections:&v61 assetCollectionsById:&v60];
  id v37 = v61;
  id v38 = v60;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = objc_opt_class();
  id v7 = [*v2 filteredAssetCollections];
  LOBYTE(v6) = [(id)v6 assetCollectionsArray:v7 isEqualToAssetCollectionsArray:v37];

  if ((v6 & 1) == 0)
  {
    uint64_t v29 = [*(id *)(a1 + 32) dataSource];
    v32 = -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:]([PXImportAssetsDataSource alloc], "initWithAssetCollections:assetsMap:startsAtEnd:", v37, v33, [*(id *)(a1 + 32) dataSourcesStartAtEnd]);
    id v8 = (void *)MEMORY[0x1E4F1CA48];
    id v9 = [*(id *)(a1 + 32) filteredAssetCollections];
    uint64_t v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v37, "count"));
    BOOL v12 = [*(id *)(a1 + 32) filteredAssetCollections];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_2;
    v58[3] = &unk_1E5DB33A8;
    id v31 = (id)v10;
    id v59 = v31;
    [v12 enumerateObjectsUsingBlock:v58];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_3;
    v56[3] = &unk_1E5DB33A8;
    id v30 = v11;
    id v57 = v30;
    [v37 enumerateObjectsUsingBlock:v56];
    v35 = [off_1E5DA5568 changeDetailsFromArray:v31 toArray:v30 changedObjects:MEMORY[0x1E4F1CBF0]];
    uint64_t v13 = [v35 insertedIndexes];
    uint64_t v34 = [v13 count];

    v36 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v14 = [*(id *)(a1 + 32) filteredAssetCollections];
    LOBYTE(v10) = [v14 count] == 0;

    if ((v10 & 1) == 0)
    {
      unint64_t v15 = 0;
      do
      {
        BOOL v16 = objc_msgSend(*(id *)(a1 + 32), "filteredAssetCollections", v29);
        int64_t v17 = [v16 objectAtIndexedSubscript:v15];

        id v18 = [v17 identifier];
        long long v19 = [v38 objectForKeyedSubscript:v18];
        if (v19)
        {
          uint64_t v50 = 0;
          v51 = &v50;
          uint64_t v52 = 0x3032000000;
          v53 = __Block_byref_object_copy__43909;
          v54 = __Block_byref_object_dispose__43910;
          id v55 = 0;
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_19;
          v49[3] = &unk_1E5DB33D0;
          v49[4] = &v50;
          [v17 arrangedObjects:v49];
          uint64_t v43 = 0;
          v44 = &v43;
          uint64_t v45 = 0x3032000000;
          v46 = __Block_byref_object_copy__43909;
          v47 = __Block_byref_object_dispose__43910;
          id v48 = 0;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_2_21;
          v42[3] = &unk_1E5DB33D0;
          v42[4] = &v43;
          [v19 arrangedObjects:v42];
          int64_t v20 = [off_1E5DA5568 changeDetailsFromArray:v51[5] toArray:v44[5] changedObjects:MEMORY[0x1E4F1CBF0]];
          if ([v20 hasAnyChanges])
          {
            uint64_t v21 = v15;
            if (v34)
            {
              v62[0] = v35;
              uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
              uint64_t v21 = [off_1E5DA5568 indexAfterApplyingChanges:v22 toIndex:v15 objectChanged:0];
            }
            uint64_t v23 = [NSNumber numberWithUnsignedInteger:v21];
            [v36 setObject:v20 forKeyedSubscript:v23];
          }
          _Block_object_dispose(&v43, 8);

          _Block_object_dispose(&v50, 8);
        }

        int64_t v24 = [*(id *)(a1 + 32) filteredAssetCollections];
        unint64_t v25 = [v24 count];

        ++v15;
      }
      while (v15 < v25);
    }
    v26 = objc_msgSend(objc_alloc((Class)off_1E5DA8488), "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v29, "identifier"), -[PXImportAssetsDataSource identifier](v32, "identifier"), v35, v36, 0);
    v27 = (void *)[v38 copy];
    [*(id *)(a1 + 32) setFilteredAssetCollectionsById:v27];

    v28 = (void *)[v37 copy];
    [*(id *)(a1 + 32) setFilteredAssetCollections:v28];

    if ([*(id *)(a1 + 32) dispatchesDataSourceUpdatesOnMainQueue])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_3_24;
      block[3] = &unk_1E5DD0F30;
      block[4] = *(void *)(a1 + 32);
      v40 = v32;
      id v41 = v26;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      [*(id *)(a1 + 32) setDataSource:v32 changeDetails:v26];
    }
  }
}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_19(uint64_t a1, void *a2)
{
}

void __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_2_21(uint64_t a1, void *a2)
{
}

uint64_t __67__PXImportAssetsDataSourceManager_modifyAssetCollectionsWithBlock___block_invoke_3_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40) changeDetails:*(void *)(a1 + 48)];
}

- (void)updateFilteredAssetsIfNeeded
{
  if ([(PXImportAssetsDataSourceManager *)self needsFilterUpdate])
  {
    id v3 = [(PXImportAssetsDataSourceManager *)self delegate];
    id v4 = [v3 viewModelMapForImportAssetsDataSourceManager:self];

    id v5 = [v4 allValues];
    if ([v5 count])
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __63__PXImportAssetsDataSourceManager_updateFilteredAssetsIfNeeded__block_invoke;
      v6[3] = &unk_1E5DB3380;
      v6[4] = self;
      id v7 = v5;
      [(PXImportAssetsDataSourceManager *)self modifyAssetCollectionsWithBlock:v6];
    }
  }
}

void __63__PXImportAssetsDataSourceManager_updateFilteredAssetsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v7 allAssetCollections];
  uint64_t v10 = [*(id *)(a1 + 32) allAssetCollectionsById];
  uint64_t v11 = [v7 filteredModelsFromModels:v8 inAssetCollections:v9 assetCollectionsById:v10];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "removeAllObjects", (void)v19);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [*(id *)(a1 + 32) countOfAlreadyImportedAssetCollectionInCollectionsMap:v6];
  [(id)objc_opt_class() addModels:v11 toAssetCollections:v12 assetCollectionsById:v6];
  uint64_t v18 = [*(id *)(a1 + 32) countOfAlreadyImportedAssetCollectionInCollectionsMap:v6];
  if ([*(id *)(a1 + 32) maxAlreadyImportedItems] != 0x7FFFFFFFFFFFFFFFLL && v17 != v18) {
    [*(id *)(a1 + 32) rebuildAlreadyImportedAssetCollectionInCollections:v12 collectionsById:v6];
  }
  objc_msgSend(*(id *)(a1 + 32), "pruneEmptyAssetCollectionsInCollections:collectionsById:", v12, v6, (void)v19);
  [*(id *)(a1 + 32) setNeedsFilterUpdate:0];
}

- (void)removeAssets:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PXImportAssetsDataSourceManager_removeAssets___block_invoke;
  v6[3] = &unk_1E5DB3380;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXImportAssetsDataSourceManager *)self modifyAssetCollectionsWithBlock:v6];
}

void __48__PXImportAssetsDataSourceManager_removeAssets___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = _importDataSourceManagerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) logIdentifier];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Remove %ld assets", objc_msgSend(*(id *)(a1 + 40), "count"));
    *(_DWORD *)buf = 138543874;
    v36 = v10;
    __int16 v37 = 2080;
    id v38 = "-[PXImportAssetsDataSourceManager removeAssets:]_block_invoke";
    __int16 v39 = 2112;
    v40 = v11;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %s: %@", buf, 0x20u);
  }
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v30 + 1) + 8 * i) uuid];
        long long v19 = [v8 objectForKeyedSubscript:v18];

        if (v19) {
          [v12 addObject:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  long long v20 = objc_opt_class();
  long long v21 = [*(id *)(a1 + 32) allAssetCollections];
  long long v22 = [*(id *)(a1 + 32) allAssetCollectionsById];
  [v20 removeModels:v12 fromAssetCollections:v21 assetCollectionsById:v22];

  uint64_t v23 = [PXImportAssetsDataSource alloc];
  uint64_t v24 = [*(id *)(a1 + 32) allAssetCollections];
  unint64_t v25 = -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:](v23, "initWithAssetCollections:assetsMap:startsAtEnd:", v24, v8, [*(id *)(a1 + 32) dataSourcesStartAtEnd]);
  [*(id *)(a1 + 32) setUnfilteredDataSource:v25];

  v26 = [*(id *)(a1 + 32) existingModelsFromModels:v12 inAssetCollections:v29 assetCollectionsById:v7];
  uint64_t v27 = [*(id *)(a1 + 32) countOfAlreadyImportedAssetCollectionInCollectionsMap:v7];
  [(id)objc_opt_class() removeModels:v26 fromAssetCollections:v29 assetCollectionsById:v7];
  uint64_t v28 = [*(id *)(a1 + 32) countOfAlreadyImportedAssetCollectionInCollectionsMap:v7];
  if ([*(id *)(a1 + 32) maxAlreadyImportedItems] != 0x7FFFFFFFFFFFFFFFLL && v27 != v28) {
    [*(id *)(a1 + 32) rebuildAlreadyImportedAssetCollectionInCollections:v29 collectionsById:v7];
  }
}

- (void)addAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _importDataSourceManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PXImportAssetsDataSourceManager *)self logIdentifier];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Add %ld assets", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138543874;
    id v12 = v6;
    __int16 v13 = 2080;
    uint64_t v14 = "-[PXImportAssetsDataSourceManager addAssets:]";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %s: %@", buf, 0x20u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PXImportAssetsDataSourceManager_addAssets___block_invoke;
  v9[3] = &unk_1E5DB3380;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(PXImportAssetsDataSourceManager *)self modifyAssetCollectionsWithBlock:v9];
}

void __45__PXImportAssetsDataSourceManager_addAssets___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v29 = [*(id *)(a1 + 32) countOfUnfilteredAlreadyImportedAssetCollection];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = [*(id *)(*((void *)&v31 + 1) + 8 * i) uuid];
        uint64_t v16 = [v8 objectForKeyedSubscript:v15];

        if (v16) {
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  uint64_t v17 = objc_opt_class();
  uint64_t v18 = [*(id *)(a1 + 32) allAssetCollections];
  long long v19 = [*(id *)(a1 + 32) allAssetCollectionsById];
  [v17 addModels:v9 toAssetCollections:v18 assetCollectionsById:v19];

  if (v29 != [*(id *)(a1 + 32) countOfUnfilteredAlreadyImportedAssetCollection]) {
    [*(id *)(a1 + 32) updateAlreadyImportedSelectability];
  }
  long long v20 = [PXImportAssetsDataSource alloc];
  long long v21 = [*(id *)(a1 + 32) allAssetCollections];
  long long v22 = -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:](v20, "initWithAssetCollections:assetsMap:startsAtEnd:", v21, v8, [*(id *)(a1 + 32) dataSourcesStartAtEnd]);
  [*(id *)(a1 + 32) setUnfilteredDataSource:v22];

  uint64_t v23 = *(void **)(a1 + 32);
  uint64_t v24 = [v23 allAssetCollections];
  unint64_t v25 = [*(id *)(a1 + 32) allAssetCollectionsById];
  v26 = [v23 filteredModelsFromModels:v9 inAssetCollections:v24 assetCollectionsById:v25];

  uint64_t v27 = [*(id *)(a1 + 32) countOfAlreadyImportedAssetCollectionInCollectionsMap:v7];
  [(id)objc_opt_class() addModels:v26 toAssetCollections:v30 assetCollectionsById:v7];
  uint64_t v28 = [*(id *)(a1 + 32) countOfAlreadyImportedAssetCollectionInCollectionsMap:v7];
  if ([*(id *)(a1 + 32) maxAlreadyImportedItems] != 0x7FFFFFFFFFFFFFFFLL && v27 != v28) {
    [*(id *)(a1 + 32) rebuildAlreadyImportedAssetCollectionInCollections:v30 collectionsById:v7];
  }
}

- (id)createInitialDataSource
{
  id v3 = [PXImportAssetsDataSource alloc];
  BOOL v4 = [(PXImportAssetsDataSourceManager *)self dataSourcesStartAtEnd];
  id v5 = [(PXImportAssetsDataSource *)v3 initWithAssetCollections:MEMORY[0x1E4F1CBF0] assetsMap:MEMORY[0x1E4F1CC08] startsAtEnd:v4];
  return v5;
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXImportAssetsDataSourceManager;
  [(PXSectionedDataSourceManager *)&v4 unregisterChangeObserver:a3 context:a4];
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXImportAssetsDataSourceManager;
  [(PXSectionedDataSourceManager *)&v4 registerChangeObserver:a3 context:a4];
}

- (PXImportAssetsDataSourceManager)initWithAssetsFromDataSourceManager:(id)a3 delegate:(id)a4 logIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = [(PXImportAssetsDataSourceManager *)self initWithDelegate:a4 logIdentifier:a5];
  if (v9)
  {
    id v10 = objc_opt_class();
    uint64_t v11 = [v8 allAssetCollections];
    id v21 = 0;
    id v22 = 0;
    [v10 copyFromAssetCollections:v11 toAssetCollections:&v22 assetCollectionsById:&v21];
    id v12 = v22;
    id v13 = v21;

    [(NSMutableArray *)v9->_allAssetCollections addObjectsFromArray:v12];
    [(NSMutableDictionary *)v9->_allAssetCollectionsById addEntriesFromDictionary:v13];
    uint64_t v14 = [(PXImportAssetsDataSourceManager *)v9 delegate];
    __int16 v15 = [v14 viewModelMapForImportAssetsDataSourceManager:v9];

    uint64_t v16 = [PXImportAssetsDataSource alloc];
    uint64_t v17 = [(PXImportAssetsDataSourceManager *)v9 allAssetCollections];
    uint64_t v18 = [(PXImportAssetsDataSource *)v16 initWithAssetCollections:v17 assetsMap:v15 startsAtEnd:[(PXImportAssetsDataSourceManager *)v9 dataSourcesStartAtEnd]];
    unfilteredDataSource = v9->_unfilteredDataSource;
    v9->_unfilteredDataSource = (PXImportAssetsDataSource *)v18;

    v9->_needsFilterUpdate = 1;
    [(PXImportAssetsDataSourceManager *)v9 updateFilteredAssetsIfNeeded];
  }
  return v9;
}

- (PXImportAssetsDataSourceManager)initWithDelegate:(id)a3 logIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PXImportAssetsDataSourceManager;
  id v8 = [(PXSectionedDataSourceManager *)&v32 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    allAssetCollectionsById = v9->_allAssetCollectionsById;
    v9->_allAssetCollectionsById = v10;

    id v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    filteredAssetCollectionsById = v9->_filteredAssetCollectionsById;
    v9->_filteredAssetCollectionsById = v12;

    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allAssetCollections = v9->_allAssetCollections;
    v9->_allAssetCollections = v14;

    uint64_t v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    filteredAssetCollections = v9->_filteredAssetCollections;
    v9->_filteredAssetCollections = v16;

    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UTILITY, 0);

    long long v20 = NSString;
    id v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    id v23 = [v20 stringWithFormat:@"%@-modelQueue", v22];
    dispatch_queue_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], v19);
    modelQueue = v9->_modelQueue;
    v9->_modelQueue = (OS_dispatch_queue *)v24;

    v9->_maxAlreadyImportedItems = 0x7FFFFFFFFFFFFFFFLL;
    v9->_showAlreadyImportedItems = 1;
    v9->_showNotYetImportedItems = 1;
    *(_WORD *)&v9->_alreadyImportedItemsSelectable = 1;
    v26 = [PXImportAssetsDataSource alloc];
    uint64_t v27 = [(PXImportAssetsDataSource *)v26 initWithAssetCollections:MEMORY[0x1E4F1CBF0] assetsMap:MEMORY[0x1E4F1CC08] startsAtEnd:v9->_dataSourcesStartAtEnd];
    unfilteredDataSource = v9->_unfilteredDataSource;
    v9->_unfilteredDataSource = (PXImportAssetsDataSource *)v27;

    uint64_t v29 = [v7 copy];
    logIdentifier = v9->_logIdentifier;
    v9->_logIdentifier = (NSString *)v29;
  }
  return v9;
}

+ (void)sortAssetCollectionsInArray:(id)a3
{
}

uint64_t __63__PXImportAssetsDataSourceManager_sortAssetCollectionsInArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (void)removeModels:(id)a3 fromAssetCollections:(id)a4 assetCollectionsById:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v24;
    *(void *)&long long v11 = 138412290;
    long long v22 = v11;
    *(void *)&long long v11 = 138412546;
    long long v21 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v7);
        }
        __int16 v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "groupIdentifier", v21, v22);
        if (!v16) {
          PXAssertGetLog();
        }
        uint64_t v17 = [v9 objectForKeyedSubscript:v16];
        if (!v17) {
          PXAssertGetLog();
        }
        uint64_t v18 = v17;
        [v17 removeObject:v15];
        if (![v18 numberOfItems])
        {
          uint64_t v19 = [v8 indexOfObject:v18];
          long long v20 = _importDataSourceManagerLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v28 = v19;
            __int16 v29 = 2112;
            id v30 = v18;
            _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "Removing asset collection at index %tu: %@, because it no longer has assets", buf, 0x16u);
          }

          [v9 removeObjectForKey:v16];
          [v8 removeObject:v18];
        }
      }
      uint64_t v12 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v12);
  }
}

+ (void)addModels:(id)a3 toAssetCollections:(id)a4 assetCollectionsById:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v7);
        }
        __int16 v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = [v15 groupIdentifier];
        uint64_t v17 = [v9 objectForKeyedSubscript:v16];
        if (!v17)
        {
          uint64_t v17 = objc_alloc_init(PXImportAssetCollection);
          [(PXImportAssetCollection *)v17 setIdentifier:v16];
          -[PXImportAssetCollection setAlreadyImportedGroup:](v17, "setAlreadyImportedGroup:", [v15 isDuplicate]);
          [v9 setObject:v17 forKeyedSubscript:v16];
          [v8 addObject:v17];
          char v12 = 1;
        }
        [(PXImportAssetCollection *)v17 addObject:v15];
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
    if (v12) {
      [(id)objc_opt_class() sortAssetCollectionsInArray:v8];
    }
  }
}

+ (BOOL)assetCollectionsArray:(id)a3 isEqualToAssetCollectionsArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count])
  {
LABEL_10:
    BOOL v16 = 0;
    goto LABEL_11;
  }
  if ([v5 count])
  {
    uint64_t v8 = 0;
    long long v19 = &v24;
    long long v18 = &v25;
    while (1)
    {
      id v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", v8, v18, v19);
      uint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      uint64_t v11 = [v9 identifier];
      char v12 = [v10 identifier];
      int v13 = [v11 isEqualToString:v12];

      if (!v13) {
        break;
      }
      uint64_t v14 = [v9 numberOfItems];
      if (v14 != [v10 numberOfItems]) {
        break;
      }
      uint64_t v28 = 0;
      __int16 v29 = &v28;
      uint64_t v30 = 0x3032000000;
      long long v31 = __Block_byref_object_copy__43909;
      uint64_t v32 = __Block_byref_object_dispose__43910;
      id v33 = 0;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __88__PXImportAssetsDataSourceManager_assetCollectionsArray_isEqualToAssetCollectionsArray___block_invoke;
      v27[3] = &unk_1E5DB33D0;
      v27[4] = &v28;
      [v9 arrangedObjects:v27];
      uint64_t v21 = 0;
      long long v22 = &v21;
      uint64_t v23 = 0x3032000000;
      long long v24 = __Block_byref_object_copy__43909;
      long long v25 = __Block_byref_object_dispose__43910;
      id v26 = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __88__PXImportAssetsDataSourceManager_assetCollectionsArray_isEqualToAssetCollectionsArray___block_invoke_2;
      v20[3] = &unk_1E5DB33D0;
      v20[4] = &v21;
      [v10 arrangedObjects:v20];
      char v15 = [(id)v29[5] isEqualToArray:v22[5]];
      _Block_object_dispose(&v21, 8);

      _Block_object_dispose(&v28, 8);
      if ((v15 & 1) == 0) {
        break;
      }

      if (++v8 >= (unint64_t)[v5 count]) {
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_8:
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

void __88__PXImportAssetsDataSourceManager_assetCollectionsArray_isEqualToAssetCollectionsArray___block_invoke(uint64_t a1, void *a2)
{
}

void __88__PXImportAssetsDataSourceManager_assetCollectionsArray_isEqualToAssetCollectionsArray___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)copyFromAssetCollections:(id)a3 toAssetCollections:(id *)a4 assetCollectionsById:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copy];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  char v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        long long v22 = objc_msgSend(v21, "identifier", (void)v25);
        [v15 setObject:v21 forKeyedSubscript:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  id v23 = v16;
  *a4 = v23;
  id v24 = v15;
  *a5 = v24;
}

@end