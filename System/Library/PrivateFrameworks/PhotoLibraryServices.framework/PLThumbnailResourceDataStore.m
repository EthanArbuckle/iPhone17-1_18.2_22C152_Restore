@interface PLThumbnailResourceDataStore
+ (BOOL)resourceIsSquare:(id)a3;
+ (id)_tableFormatsByTableTypeFromFormats:(id)a3;
+ (id)supportedRecipes;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
+ (unsigned)storeClassID;
- (BOOL)canStoreExternalResource:(id)a3;
- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7;
- (BOOL)thumbnailForKey:(id)a3 matchesAssetID:(id)a4;
- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4;
- (CGImage)newTableThumbImageForKey:(id)a3;
- (NSArray)thumbnailFormats;
- (PLImageTableEntryFooter_s)_tableFooterForKey:(id)a3;
- (PLThumbnailIndexes)thumbnailIndexes;
- (PLThumbnailManager)thumbnailManager;
- (PLThumbnailResourceDataStore)initWithPathManager:(id)a3;
- (id)_makeThumbnailManager;
- (id)descriptionForSubtype:(int64_t)a3;
- (id)expectedFileURLForResource:(id)a3 asset:(id)a4;
- (id)keyFromKeyStruct:(const void *)a3;
- (id)name;
- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6;
- (id)resourceDataForKey:(id)a3 assetID:(id)a4;
- (id)resourceURLForKey:(id)a3;
- (id)thumbnailFormatsByTableType;
- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4;
- (id)virtualResourcesForAsset:(id)a3;
- (void)_installBackgroundWatcher;
- (void)_startWatchingThumbnailConfigFile;
- (void)_stopWatchingThumbnailConfigFile;
- (void)dealloc;
- (void)invalidateThumbnailManager;
- (void)overrideThumbnailFormatsWithFormatIDs:(id)a3;
@end

@implementation PLThumbnailResourceDataStore

+ (unsigned)storeClassID
{
  return 1;
}

- (CGImage)newTableThumbImageForKey:(id)a3
{
  int v11 = -1;
  unsigned int v12 = 0;
  [a3 tableType:&v12 index:&v11];
  v4 = [(PLThumbnailResourceDataStore *)self thumbnailFormatsByTableType];
  v5 = [NSNumber numberWithUnsignedInt:v12];
  v6 = [v4 objectForKeyedSubscript:v5];

  v7 = [(PLThumbnailResourceDataStore *)self thumbnailManager];
  v8 = objc_msgSend(v7, "thumbManagerForFormatID:", objc_msgSend(v6, "formatID"));

  v9 = (CGImage *)[v8 createImageWithIdentifier:0 orIndex:v11];
  return v9;
}

- (PLThumbnailManager)thumbnailManager
{
  return (PLThumbnailManager *)[(PLLazyObject *)self->_lazyThumbnailManager objectValue];
}

- (id)thumbnailFormatsByTableType
{
  return (id)[(PLLazyObject *)self->_lazyThumbnailFormatsByTableType objectValue];
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return 5;
}

- (PLThumbnailResourceDataStore)initWithPathManager:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PLThumbnailResourceDataStore;
  v6 = [(PLResourceDataStore *)&v33 initWithPathManager:v5];
  v7 = v6;
  if (v6)
  {
    v8 = [(PLResourceDataStore *)v6 pathManager];

    if (!v8)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v7, @"PLThumbnailResourceDataStore.m", 208, @"Invalid parameter not satisfying: %@", @"self.pathManager" object file lineNumber description];
    }
    id v9 = objc_initWeak(&location, v7);

    id v10 = objc_alloc(MEMORY[0x1E4F8B948]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke;
    v30[3] = &unk_1E5874070;
    objc_copyWeak(&v31, &location);
    uint64_t v11 = [v10 initWithRetriableBlock:v30];
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
    lazyThumbnailManager = v7->_lazyThumbnailManager;
    v7->_lazyThumbnailManager = (PLLazyObject *)v11;

    id v13 = objc_initWeak(&location, v7);
    id v14 = objc_alloc(MEMORY[0x1E4F8B948]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke_2;
    v27[3] = &unk_1E5870860;
    objc_copyWeak(&v29, &location);
    id v28 = v5;
    uint64_t v15 = [v14 initWithRetriableBlock:v27];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    lazyThumbnailFormats = v7->_lazyThumbnailFormats;
    v7->_lazyThumbnailFormats = (PLLazyObject *)v15;

    id v17 = objc_initWeak(&location, v7);
    id v18 = objc_alloc(MEMORY[0x1E4F8B948]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke_3;
    v25[3] = &unk_1E5874070;
    objc_copyWeak(&v26, &location);
    uint64_t v19 = [v18 initWithRetriableBlock:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    lazyThumbnailFormatsByTableType = v7->_lazyThumbnailFormatsByTableType;
    v7->_lazyThumbnailFormatsByTableType = (PLLazyObject *)v19;

    v7->_observersLock._os_unfair_lock_opaque = 0;
    if (PLIsAssetsd())
    {
      v21 = objc_alloc_init(PLThumbnailIndexes);
      thumbnailIndexes = v7->_thumbnailIndexes;
      v7->_thumbnailIndexes = v21;
    }
  }

  return v7;
}

id __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = +[PLThumbnailManagerCore thumbnailFormatsForConfigPhase:1 withPathManager:*(void *)(a1 + 32)];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_opt_class();
    v3 = [WeakRetained thumbnailFormats];
    v4 = [v2 _tableFormatsByTableTypeFromFormats:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)thumbnailFormats
{
  overridenThumbnailFormats = self->_overridenThumbnailFormats;
  if (overridenThumbnailFormats)
  {
    v3 = overridenThumbnailFormats;
  }
  else
  {
    v3 = [(PLLazyObject *)self->_lazyThumbnailFormats objectValue];
  }
  return v3;
}

+ (id)_tableFormatsByTableTypeFromFormats:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dimension" ascending:1];
  v26[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v20 = v3;
  v7 = [v3 sortedArrayUsingDescriptors:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v13 isTable])
        {
          if ([v13 isSquare])
          {
            id v14 = [v4 objectForKeyedSubscript:&unk_1EEBED488];

            if (v14)
            {
              uint64_t v15 = [v4 objectForKeyedSubscript:&unk_1EEBED4A0];

              if (v15) {
                continue;
              }
              v16 = &unk_1EEBED4A0;
            }
            else
            {
              v16 = &unk_1EEBED488;
            }
          }
          else
          {
            id v17 = [v4 objectForKeyedSubscript:&unk_1EEBED4B8];

            if (v17)
            {
              id v18 = [v4 objectForKeyedSubscript:&unk_1EEBED4D0];

              if (v18) {
                continue;
              }
              v16 = &unk_1EEBED4D0;
            }
            else
            {
              v16 = &unk_1EEBED4B8;
            }
          }
          [v4 setObject:v13 forKeyedSubscript:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v4;
}

id __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained _makeThumbnailManager];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_makeThumbnailManager
{
  id v3 = [PLThumbnailManager alloc];
  id v4 = [(PLResourceDataStore *)self pathManager];
  id v5 = [(PLThumbnailManager *)v3 initWithPhotoLibraryPathManager:v4 storeFromMigration:0];

  v6 = [(PLResourceDataStore *)self pathManager];
  LODWORD(v4) = +[PLThumbnailManagerCore isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:v6];

  if (v4) {
    [(PLThumbnailResourceDataStore *)self _startWatchingThumbnailConfigFile];
  }
  if ((PLIsForegroundApplication() & 1) != 0 || MEMORY[0x19F38C0C0]())
  {
    v7 = [(PLResourceDataStore *)self pathManager];
    BOOL v8 = +[PLThumbnailManagerCore isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:v7];

    if (v8) {
      [(PLThumbnailResourceDataStore *)self _installBackgroundWatcher];
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBackgroundTransitionObserverToken, 0);
  objc_storeStrong((id *)&self->_configWatcherSource, 0);
  objc_storeStrong((id *)&self->_overridenThumbnailFormats, 0);
  objc_storeStrong((id *)&self->_lazyThumbnailFormatsByTableType, 0);
  objc_storeStrong((id *)&self->_lazyThumbnailFormats, 0);
  objc_storeStrong((id *)&self->_lazyThumbnailManager, 0);
  objc_storeStrong((id *)&self->_thumbnailIndexes, 0);
}

- (PLThumbnailIndexes)thumbnailIndexes
{
  return (PLThumbnailIndexes *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)thumbnailForKey:(id)a3 matchesAssetID:(id)a4
{
  id v6 = a4;
  v7 = [(PLThumbnailResourceDataStore *)self _tableFooterForKey:a3];
  if (v7)
  {
    BOOL v8 = v7;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8BA08]), "initWithCFUUIDBytes:", *(void *)&v8->var0.var0, *(void *)&v8->var0.var8);
    uint64_t v10 = [v6 uuid];
    char v11 = [v9 isEqualToString:v10];

    free(v8);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  return 0;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  id v7 = a6;
  [a4 localAvailability];
  BOOL v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PLThumbnailResourceDataStore" code:0 userInfo:0];
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v8, 0, 0);

  return 0;
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  return 0;
}

- (BOOL)canStoreExternalResource:(id)a3
{
  return 0;
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3, *(void *)&a4);
}

- (id)virtualResourcesForAsset:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 hasTableThumbs] || (objc_msgSend(v4, "isDeleted") & 1) != 0)
  {
    id v34 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(&unk_1EEBF1670, "count"));
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [&unk_1EEBF1670 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(&unk_1EEBF1670);
        }
        uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        char v11 = [(PLThumbnailResourceDataStore *)self thumbnailFormatsByTableType];
        unsigned int v12 = [v11 objectForKeyedSubscript:v10];

        if (v12 && [v12 isTable])
        {
          unsigned int v13 = [v10 longValue];
          id v14 = +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", (2 * [v12 formatID]) | 0x30001);
          uint64_t v15 = [(PLVirtualResource *)[PLTableThumbnailVirtualResource alloc] initWithRecipe:v14 forAsset:v4];
          if ([v12 isSquare])
          {
            [v12 dimension];
            [(PLVirtualResource *)v15 setUnorientedWidth:(uint64_t)v16];
            [v12 dimension];
            goto LABEL_21;
          }
          if ([v12 formatMode] == 2)
          {
            uint64_t v18 = [v4 width];
            uint64_t v19 = [v4 height];
            if (v18 <= v19) {
              uint64_t v20 = v19;
            }
            else {
              uint64_t v20 = v18;
            }
            double v21 = (double)v20;
            [v12 dimension];
            double v23 = v22 / v21;
            -[PLVirtualResource setUnorientedWidth:](v15, "setUnorientedWidth:", (uint64_t)(v23 * (double)[v4 width]));
            double v17 = v23 * (double)[v4 height];
LABEL_21:
            [(PLVirtualResource *)v15 setUnorientedHeight:(uint64_t)v17];
          }
          uint64_t v24 = [v4 width];
          if ([v4 height] * v24 < 1)
          {
            double v28 = 0.0;
          }
          else
          {
            uint64_t v25 = [(PLVirtualResource *)v15 unorientedWidth];
            float v26 = (float)([(PLVirtualResource *)v15 unorientedHeight] * v25);
            uint64_t v27 = [v4 width];
            *(float *)&double v28 = v26 / (float)([v4 height] * v27);
          }
          [(PLVirtualResource *)v15 setScale:v28];
          id v29 = [v14 codecFourCharCodeName];
          [(PLVirtualResource *)v15 setCodecFourCharCodeName:v29];

          v30 = [v14 uti];
          [(PLVirtualResource *)v15 setUniformTypeIdentifier:v30];

          [(PLVirtualResource *)v15 setDataStore:self];
          [(PLVirtualResource *)v15 setDataStoreSubtype:v13];
          unsigned __int8 v36 = 0;
          int v35 = 4 * (v13 & 7);
          int v31 = [v4 effectiveThumbnailIndex];
          unint64_t v32 = ((unint64_t)(v31 & 0x7FFFFFF) << 6) | v35 & 0x3F | ((unint64_t)v36 << 32) & 0xFFFFFFFE0000003FLL;
          int v35 = (v31 << 6) | v35 & 0x3F;
          unsigned __int8 v36 = BYTE4(v32);
          objc_super v33 = [[PLThumbnailResourceDataStoreKey alloc] initWithKeyStruct:&v35];
          [(PLVirtualResource *)v15 setDataStoreKey:v33];
          [v34 addObject:v15];
        }
      }
      uint64_t v7 = [&unk_1EEBF1670 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v7);
  }
LABEL_4:

  return v34;
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  return 0;
}

- (id)resourceURLForKey:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PLThumbnailResourceDataStore.m" lineNumber:258 description:@"resourceURLForKey is not supported for PLThumbnailResourceDataStore."];

  return 0;
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PLThumbnailResourceDataStore.m" lineNumber:252 description:@"resourceDataForKey is not supported for PLThumbnailResourceDataStore."];

  return 0;
}

- (id)keyFromKeyStruct:(const void *)a3
{
  id v3 = [[PLThumbnailResourceDataStoreKey alloc] initWithKeyStruct:a3];
  return v3;
}

- (id)descriptionForSubtype:(int64_t)a3
{
  return &stru_1EEB2EB80;
}

- (id)name
{
  return @"Thumbnail";
}

- (void)dealloc
{
  clientBackgroundTransitionObserverToken = self->_clientBackgroundTransitionObserverToken;
  if (clientBackgroundTransitionObserverToken)
  {
    id v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = clientBackgroundTransitionObserverToken;
    uint64_t v6 = [v4 defaultCenter];
    [v6 removeObserver:v5];
  }
  v7.receiver = self;
  v7.super_class = (Class)PLThumbnailResourceDataStore;
  [(PLThumbnailResourceDataStore *)&v7 dealloc];
}

- (void)overrideThumbnailFormatsWithFormatIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = objc_msgSend(MEMORY[0x1E4F8B938], "formatWithID:", (unsigned __int16)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "intValue", (void)v14));
        [(NSArray *)v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  overridenThumbnailFormats = self->_overridenThumbnailFormats;
  self->_overridenThumbnailFormats = v5;
  unsigned int v13 = v5;

  [(PLLazyObject *)self->_lazyThumbnailFormats resetObject];
  [(PLLazyObject *)self->_lazyThumbnailFormatsByTableType resetObject];
}

- (void)invalidateThumbnailManager
{
  [(PLThumbnailResourceDataStore *)self _stopWatchingThumbnailConfigFile];
  [(PLLazyObject *)self->_lazyThumbnailManager resetObject];
  [(PLLazyObject *)self->_lazyThumbnailFormats resetObject];
  lazyThumbnailFormatsByTableType = self->_lazyThumbnailFormatsByTableType;
  [(PLLazyObject *)lazyThumbnailFormatsByTableType resetObject];
}

- (void)_installBackgroundWatcher
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  if (!self->_clientBackgroundTransitionObserverToken)
  {
    objc_initWeak(&location, self);
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = DCIM_applicationBackgroundedNotificationName();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PLThumbnailResourceDataStore__installBackgroundWatcher__block_invoke;
    v8[3] = &unk_1E5864720;
    objc_copyWeak(&v9, &location);
    id v6 = [v4 addObserverForName:v5 object:0 queue:0 usingBlock:v8];
    clientBackgroundTransitionObserverToken = self->_clientBackgroundTransitionObserverToken;
    self->_clientBackgroundTransitionObserverToken = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_observersLock);
}

void __57__PLThumbnailResourceDataStore__installBackgroundWatcher__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateThumbnailManager];
}

- (void)_stopWatchingThumbnailConfigFile
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  configWatcherSource = self->_configWatcherSource;
  if (configWatcherSource)
  {
    dispatch_source_cancel(configWatcherSource);
    id v5 = self->_configWatcherSource;
    self->_configWatcherSource = 0;
  }
  os_unfair_lock_unlock(p_observersLock);
}

- (void)_startWatchingThumbnailConfigFile
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  if (!self->_configWatcherSource)
  {
    id v4 = [(PLResourceDataStore *)self pathManager];
    id v5 = +[PLThumbnailManagerCore thumbnailConfigurationPathWithPathManager:v4];

    id v6 = v5;
    int v7 = open((const char *)[v6 fileSystemRepresentation], 0x8000);
    if (v7 < 0)
    {
      uint64_t v10 = PLImageManagerGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v6;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to watch thumbnail config, cannot open file at path: %@", (uint8_t *)location, 0xCu);
      }
    }
    else
    {
      unsigned int v8 = v7;
      id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);

      char v11 = dispatch_queue_create("com.apple.photos.thumbconfigwatcher", v10);
      unsigned int v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], v8, 1uLL, v11);
      configWatcherSource = self->_configWatcherSource;
      self->_configWatcherSource = v12;

      objc_initWeak(location, self);
      long long v14 = self->_configWatcherSource;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __65__PLThumbnailResourceDataStore__startWatchingThumbnailConfigFile__block_invoke;
      handler[3] = &unk_1E5875F08;
      objc_copyWeak(&v19, location);
      dispatch_source_set_event_handler(v14, handler);
      long long v15 = self->_configWatcherSource;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__PLThumbnailResourceDataStore__startWatchingThumbnailConfigFile__block_invoke_2;
      v16[3] = &__block_descriptor_36_e5_v8__0l;
      unsigned int v17 = v8;
      dispatch_source_set_cancel_handler(v15, v16);
      dispatch_resume((dispatch_object_t)self->_configWatcherSource);
      objc_destroyWeak(&v19);
      objc_destroyWeak(location);
    }
  }
  os_unfair_lock_unlock(p_observersLock);
}

void __65__PLThumbnailResourceDataStore__startWatchingThumbnailConfigFile__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained invalidateThumbnailManager];
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"PLThumbnailResourceDataStoreThumbnailManagerConfigDidChange" object:v3];

    id WeakRetained = v3;
  }
}

uint64_t __65__PLThumbnailResourceDataStore__startWatchingThumbnailConfigFile__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (PLImageTableEntryFooter_s)_tableFooterForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  int v11 = -1;
  unsigned int v12 = 0;
  [a3 tableType:&v12 index:&v11];
  id v4 = [(PLThumbnailResourceDataStore *)self thumbnailFormatsByTableType];
  id v5 = [NSNumber numberWithUnsignedInt:v12];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    int v7 = [(PLThumbnailResourceDataStore *)self thumbnailManager];
    unsigned int v8 = objc_msgSend(v7, "thumbManagerForFormatID:", objc_msgSend(v6, "formatID"));

    if (v8) {
      id v9 = (PLImageTableEntryFooter_s *)[v8 tableFooterForIndex:v11];
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)resourceIsSquare:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 dataStoreSubtype] == 1 || objc_msgSend(v3, "dataStoreSubtype") == 0;

  return v4;
}

+ (id)supportedRecipes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end