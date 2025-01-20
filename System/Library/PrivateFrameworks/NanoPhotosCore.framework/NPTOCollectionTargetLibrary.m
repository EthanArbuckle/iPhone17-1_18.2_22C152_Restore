@interface NPTOCollectionTargetLibrary
- (BOOL)isSyncNeeded;
- (NPTOCollectionTargetLibrary)initWithCollectionTarget:(int64_t)a3 device:(id)a4;
- (NRDevice)device;
- (NSDate)lastUpdatedDate;
- (id)assetCollections;
- (id)fetchAssetsInAssetCollection:(id)a3 options:(id)a4;
- (id)fetchAssetsWithOptions:(id)a3;
- (id)fetchKeyAssetsInAssetCollection:(id)a3 options:(id)a4;
- (id)metadataForAssetCollection:(id)a3;
- (int64_t)collectionTarget;
- (unint64_t)countOfAssetsInAssetCollection:(id)a3 options:(id)a4;
- (unint64_t)countOfAssetsWithOptions:(id)a3;
- (unint64_t)expectedCountOfAssets;
- (unint64_t)expectedCountOfAssetsInAssetCollection:(id)a3;
- (void)_createLibraryCollectionTargetMapChangeObserverIfNeeded;
- (void)_createSyncNeededChangeObserverIfNeeded;
- (void)_createSyncingChangeObserverIfNeeded;
- (void)_isSyncing;
- (void)_libraryAssetCollections;
- (void)_libraryAssetUUIDs;
- (void)_libraryInfo;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NPTOCollectionTargetLibrary

- (NPTOCollectionTargetLibrary)initWithCollectionTarget:(int64_t)a3 device:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NPTOCollectionTargetLibrary;
  v8 = [(NPTOCollectionTargetLibrary *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_collectionTarget = a3;
    objc_storeStrong((id *)&v8->_device, a4);
  }

  return v9;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
  -[NPTOCollectionTargetLibrary _createLibraryCollectionTargetMapChangeObserverIfNeeded](self);
  -[NPTOCollectionTargetLibrary _createSyncingChangeObserverIfNeeded](self);
  -[NPTOCollectionTargetLibrary _createSyncNeededChangeObserverIfNeeded](self);
}

- (void)_createLibraryCollectionTargetMapChangeObserverIfNeeded
{
  if (val)
  {
    if (!val[3])
    {
      objc_initWeak(&location, val);
      v2 = -[NPTOCollectionTargetLibrary _libraryInfo](val);
      v3 = [MEMORY[0x263F08A48] mainQueue];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __86__NPTOCollectionTargetLibrary__createLibraryCollectionTargetMapChangeObserverIfNeeded__block_invoke;
      v6[3] = &unk_2644EBFD8;
      objc_copyWeak(&v7, &location);
      uint64_t v4 = [v2 collectionTargetMapChangeObserverWithQueue:v3 block:v6];
      v5 = (void *)val[3];
      val[3] = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_createSyncingChangeObserverIfNeeded
{
  if (val)
  {
    if (!val[4])
    {
      objc_initWeak(&location, val);
      v2 = -[NPTOCollectionTargetLibrary _libraryInfo](val);
      v3 = [MEMORY[0x263F08A48] mainQueue];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __67__NPTOCollectionTargetLibrary__createSyncingChangeObserverIfNeeded__block_invoke;
      v6[3] = &unk_2644EBFD8;
      objc_copyWeak(&v7, &location);
      uint64_t v4 = [v2 syncingChangeObserverWithQueue:v3 block:v6];
      v5 = (void *)val[4];
      val[4] = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_createSyncNeededChangeObserverIfNeeded
{
  if (val)
  {
    if (!val[5])
    {
      objc_initWeak(&location, val);
      v2 = -[NPTOCollectionTargetLibrary _libraryInfo](val);
      v3 = [MEMORY[0x263F08A48] mainQueue];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __70__NPTOCollectionTargetLibrary__createSyncNeededChangeObserverIfNeeded__block_invoke;
      v6[3] = &unk_2644EBFD8;
      objc_copyWeak(&v7, &location);
      uint64_t v4 = [v2 syncNeededChangeObserverWithQueue:v3 block:v6];
      v5 = (void *)val[5];
      val[5] = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (id)assetCollections
{
  v3 = [MEMORY[0x263EFF9C0] set];
  uint64_t v4 = -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __47__NPTOCollectionTargetLibrary_assetCollections__block_invoke;
  objc_super v11 = &unk_2644EBF88;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (void)_libraryAssetCollections
{
  if (a1)
  {
    v2 = a1;
    -[NPTOCollectionTargetLibrary _createLibraryCollectionTargetMapChangeObserverIfNeeded](a1);
    v3 = (void *)v2[6];
    if (!v3)
    {
      uint64_t v4 = -[NPTOCollectionTargetLibrary _libraryInfo](v2);
      id v5 = [v4 collectionTargetMap];
      v6 = [NSNumber numberWithInteger:v2[7]];
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      uint64_t v8 = (void *)v2[6];
      v2[6] = v7;

      v3 = (void *)v2[6];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __47__NPTOCollectionTargetLibrary_assetCollections__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a3;
  id v5 = (void *)MEMORY[0x263F14D28];
  v6 = (objc_class *)MEMORY[0x263F14E20];
  id v7 = a2;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = [v20 objectForKeyedSubscript:@"type"];
  uint64_t v11 = [v10 intValue] - 1;
  if (v11 <= 2) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v9) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = [v20 objectForKeyedSubscript:@"subtype"];
  int v16 = [v15 intValue];
  if (v14)
  {
    if (v16 > 100)
    {
      if (v16 == 101)
      {
        uint64_t v14 = 101;
        goto LABEL_18;
      }
      if (v16 == 203)
      {
        uint64_t v14 = 203;
        goto LABEL_18;
      }
    }
    else
    {
      if (v16 == 2)
      {
        uint64_t v14 = 2;
        goto LABEL_18;
      }
      if (v16 == 100)
      {
        uint64_t v14 = 100;
        goto LABEL_18;
      }
    }
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_18:
  v17 = [v20 objectForKeyedSubscript:@"title"];
  v18 = [v20 objectForKeyedSubscript:@"subtitle"];
  v19 = [v5 transientAssetCollectionWithAssetFetchResult:v8 type:v13 subtype:v14 title:v17 subtitle:v18 titleFontName:&stru_26D052838];

  objc_msgSend(v19, "npto_setUUID:", v7);
  [*(id *)(a1 + 40) addObject:v19];
}

- (id)metadataForAssetCollection:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "npto_uuid");
  id v5 = -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 objectForKeyedSubscript:@"metadata"];

  return v7;
}

- (id)fetchAssetsWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = -[NPTOCollectionTargetLibrary _libraryAssetUUIDs](self);
  v6 = (void *)MEMORY[0x263F14D18];
  id v7 = objc_msgSend(MEMORY[0x263F14D18], "npto_localIdentifiersWithUUIDs:", v5);
  id v8 = [v6 fetchAssetsWithLocalIdentifiers:v7 options:v4];

  return v8;
}

- (void)_libraryAssetUUIDs
{
  uint64_t v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x263EFF9C0] set];
    v3 = -[NPTOCollectionTargetLibrary _libraryAssetCollections](v1);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__NPTOCollectionTargetLibrary__libraryAssetUUIDs__block_invoke;
    v6[3] = &unk_2644EBFB0;
    id v7 = v2;
    id v4 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];

    uint64_t v1 = (void *)[v4 copy];
  }
  return v1;
}

- (id)fetchAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  uint64_t v9 = objc_msgSend(v7, "npto_uuid");

  v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"assetUUIDs"];

  uint64_t v12 = (void *)MEMORY[0x263F14D18];
  uint64_t v13 = objc_msgSend(MEMORY[0x263F14D18], "npto_localIdentifiersWithUUIDs:", v11);
  uint64_t v14 = [v12 fetchAssetsWithLocalIdentifiers:v13 options:v6];

  return v14;
}

- (id)fetchKeyAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  uint64_t v9 = objc_msgSend(v7, "npto_uuid");

  v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"keyAssetUUIDs"];

  uint64_t v12 = (void *)MEMORY[0x263F14D18];
  uint64_t v13 = objc_msgSend(MEMORY[0x263F14D18], "npto_localIdentifiersWithUUIDs:", v11);
  uint64_t v14 = [v12 fetchAssetsWithLocalIdentifiers:v13 options:v6];

  return v14;
}

- (unint64_t)countOfAssetsWithOptions:(id)a3
{
  v3 = [(NPTOCollectionTargetLibrary *)self fetchAssetsWithOptions:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)countOfAssetsInAssetCollection:(id)a3 options:(id)a4
{
  unint64_t v4 = [(NPTOCollectionTargetLibrary *)self fetchAssetsInAssetCollection:a3 options:a4];
  unint64_t v5 = [v4 count];

  return v5;
}

- (unint64_t)expectedCountOfAssets
{
  v2 = -[NPTOCollectionTargetLibrary _libraryAssetUUIDs](self);
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)expectedCountOfAssetsInAssetCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  id v6 = objc_msgSend(v4, "npto_uuid");

  id v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 objectForKeyedSubscript:@"assetUUIDs"];

  unint64_t v9 = [v8 count];
  return v9;
}

- (NSDate)lastUpdatedDate
{
  v2 = -[NPTOCollectionTargetLibrary _libraryInfo](self);
  unint64_t v3 = [v2 lastUpdatedDate];

  return (NSDate *)v3;
}

- (void)_libraryInfo
{
  if (a1)
  {
    v2 = a1;
    unint64_t v3 = (void *)a1[2];
    if (!v3)
    {
      id v4 = [[NPTOLibraryInfo alloc] initWithDevice:a1[8]];
      unint64_t v5 = (void *)v2[2];
      v2[2] = v4;

      unint64_t v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_isSyncing
{
  if (result)
  {
    uint64_t v1 = result;
    -[NPTOCollectionTargetLibrary _createSyncingChangeObserverIfNeeded](result);
    v2 = -[NPTOCollectionTargetLibrary _libraryInfo](v1);
    uint64_t v3 = [v2 isSyncing];

    return (void *)v3;
  }
  return result;
}

- (BOOL)isSyncNeeded
{
  if (self)
  {
    v2 = self;
    -[NPTOCollectionTargetLibrary _createSyncNeededChangeObserverIfNeeded](self);
    uint64_t v3 = -[NPTOCollectionTargetLibrary _libraryInfo](v2);
    char v4 = [v3 isSyncNeeded];

    LOBYTE(self) = v4;
  }
  return (char)self;
}

void __49__NPTOCollectionTargetLibrary__libraryAssetUUIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a3 objectForKeyedSubscript:@"assetUUIDs"];
  [v3 addObjectsFromArray:v4];
}

void __86__NPTOCollectionTargetLibrary__createLibraryCollectionTargetMapChangeObserverIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = 0;

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *((id *)WeakRetained + 1);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v7 collectionTargetLibraryDidUpdate:WeakRetained];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
}

void __67__NPTOCollectionTargetLibrary__createSyncingChangeObserverIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v1 = WeakRetained[1];
    uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v1);
          }
          id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v6 collectionTargetLibrarySyncingDidChange:WeakRetained];
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v3);
    }
  }
}

void __70__NPTOCollectionTargetLibrary__createSyncNeededChangeObserverIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v1 = WeakRetained[1];
    uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v1);
          }
          id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v6 collectionTargetLibrarySyncNeeded:WeakRetained];
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v3);
    }
  }
}

- (int64_t)collectionTarget
{
  return self->_collectionTarget;
}

- (NRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_libraryAssetCollections, 0);
  objc_storeStrong(&self->_syncNeededChangeObserver, 0);
  objc_storeStrong(&self->_syncingChangeObserver, 0);
  objc_storeStrong(&self->_libraryCollectionTargetMapChangeObserver, 0);
  objc_storeStrong((id *)&self->_libraryInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end