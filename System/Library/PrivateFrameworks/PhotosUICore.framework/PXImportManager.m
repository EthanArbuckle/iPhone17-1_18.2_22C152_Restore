@interface PXImportManager
+ (NSArray)supportedTypeIdentifiers;
+ (NSArray)supportedTypes;
+ (PXImportManager)defaultManager;
- (NSProgress)progress;
- (PXImportManager)init;
- (id)_assetsForImportedItemProviders:(id)a3;
- (id)_sourcesForItemProviders:(id)a3;
- (id)importDragItems:(id)a3 completionHandler:(id)a4;
- (id)importItemProviders:(id)a3 completionHandler:(id)a4;
- (id)importSharedSourcesForDragItems:(id)a3 completionHandler:(id)a4;
- (void)_addProgress:(id)a3 forItemProviders:(id)a4;
- (void)_addProgress:(id)a3 forItemProviders:(id)a4 assetCreationCompletionHandler:(id)a5;
- (void)_addProgress:(id)a3 forItemProviders:(id)a4 sharedSourceCompletionHandler:(id)a5;
- (void)_handleCompletionOfImportForItemProvider:(id)a3 resultObject:(id)a4 progress:(id)a5 error:(id)a6;
- (void)_removeObserverFromProgress:(id)a3;
- (void)fetchAssetsFromDrop:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation PXImportManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_providersToImportedResultObjectMapping, 0);
  objc_storeStrong((id *)&self->_progressToErrorsMapping, 0);
  objc_storeStrong((id *)&self->_progressToSharedSourcesCompletionHandlerMapping, 0);
  objc_storeStrong((id *)&self->_progressToCompletionHandlerMapping, 0);
  objc_storeStrong((id *)&self->_progressToProvidersMapping, 0);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (id)_sourcesForItemProviders:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        v11 = -[NSMapTable objectForKey:](self->_providersToImportedResultObjectMapping, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_assetsForImportedItemProviders:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        v11 = -[NSMapTable objectForKey:](self->_providersToImportedResultObjectMapping, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v12 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    long long v13 = [v12 librarySpecificFetchOptions];

    long long v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
    v23[0] = v14;
    long long v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:1];
    v23[1] = v15;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v13 setInternalSortDescriptors:v16];

    v17 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v5 options:v13];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)PXProgressObserverContext == a6)
  {
    id v13 = v11;
    uint64_t v14 = [v13 completedUnitCount];
    if (v14 >= [v13 totalUnitCount] || objc_msgSend(v13, "isCancelled"))
    {
      v27 = [(NSMapTable *)self->_progressToErrorsMapping objectForKey:v13];
      long long v15 = [(NSMapTable *)self->_progressToProvidersMapping objectForKey:v13];
      uint64_t v25 = [(NSMapTable *)self->_progressToCompletionHandlerMapping objectForKey:v13];
      if (v25)
      {
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__PXImportManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        aBlock[3] = &unk_1E5DAEC40;
        objc_copyWeak(&v35, &location);
        id v34 = v15;
        long long v16 = _Block_copy(aBlock);
        if (v27) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = [v13 isCancelled] ^ 1;
        }
        (*(void (**)(uint64_t, uint64_t, void *, void *))(v25 + 16))(v25, v17, v27, v16);
        [(NSMapTable *)self->_progressToCompletionHandlerMapping removeObjectForKey:v13];

        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
      }
      -[NSMapTable objectForKey:](self->_progressToSharedSourcesCompletionHandlerMapping, "objectForKey:", v13, v25);
      uint64_t v18 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        long long v19 = [(PXImportManager *)self _sourcesForItemProviders:v15];
        if (v27) {
          uint64_t v20 = 0;
        }
        else {
          uint64_t v20 = [v13 isCancelled] ^ 1;
        }
        ((void (**)(void, uint64_t, void *, void *))v18)[2](v18, v20, v27, v19);
        [(NSMapTable *)self->_progressToSharedSourcesCompletionHandlerMapping removeObjectForKey:v13];
      }
      [(PXImportManager *)self _removeObserverFromProgress:v13];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v21 = v15;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v30;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v21);
            }
            [(NSMapTable *)self->_providersToImportedResultObjectMapping removeObjectForKey:*(void *)(*((void *)&v29 + 1) + 8 * v24++)];
          }
          while (v22 != v24);
          uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v22);
      }

      [(NSMapTable *)self->_progressToProvidersMapping removeObjectForKey:v13];
      [(NSMapTable *)self->_progressToErrorsMapping removeObjectForKey:v13];
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)PXImportManager;
    [(PXImportManager *)&v28 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

id __66__PXImportManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained _assetsForImportedItemProviders:*(void *)(a1 + 32)];

  return v3;
}

- (void)_removeObserverFromProgress:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_completedUnitCount);
  [v4 removeObserver:self forKeyPath:v5 context:PXProgressObserverContext];

  NSStringFromSelector(sel_isCancelled);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:self forKeyPath:v6 context:PXProgressObserverContext];
}

- (void)_addProgress:(id)a3 forItemProviders:(id)a4
{
  progressToProvidersMapping = self->_progressToProvidersMapping;
  id v7 = a3;
  [(NSMapTable *)progressToProvidersMapping setObject:a4 forKey:v7];
  uint64_t v8 = NSStringFromSelector(sel_completedUnitCount);
  [v7 addObserver:self forKeyPath:v8 options:4 context:PXProgressObserverContext];

  uint64_t v9 = NSStringFromSelector(sel_isCancelled);
  [v7 addObserver:self forKeyPath:v9 options:4 context:PXProgressObserverContext];

  id v10 = [(PXImportManager *)self progress];
  objc_msgSend(v10, "addChild:withPendingUnitCount:", v7, objc_msgSend(v7, "totalUnitCount"));
}

- (void)_addProgress:(id)a3 forItemProviders:(id)a4 assetCreationCompletionHandler:(id)a5
{
  progressToCompletionHandlerMapping = self->_progressToCompletionHandlerMapping;
  id v9 = a4;
  id v11 = a3;
  id v10 = _Block_copy(a5);
  [(NSMapTable *)progressToCompletionHandlerMapping setObject:v10 forKey:v11];

  [(PXImportManager *)self _addProgress:v11 forItemProviders:v9];
}

- (void)_addProgress:(id)a3 forItemProviders:(id)a4 sharedSourceCompletionHandler:(id)a5
{
  progressToSharedSourcesCompletionHandlerMapping = self->_progressToSharedSourcesCompletionHandlerMapping;
  id v9 = a4;
  id v11 = a3;
  id v10 = _Block_copy(a5);
  [(NSMapTable *)progressToSharedSourcesCompletionHandlerMapping setObject:v10 forKey:v11];

  [(PXImportManager *)self _addProgress:v11 forItemProviders:v9];
}

- (void)_handleCompletionOfImportForItemProvider:(id)a3 resultObject:(id)a4 progress:(id)a5 error:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138413058;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Error importing item provider: %@ resultObject: %@ progress: %@ error: %@", (uint8_t *)&v18, 0x2Au);
    }

    progressToErrorsMapping = self->_progressToErrorsMapping;
    id v16 = v13;
    id v17 = v12;
  }
  else
  {
    progressToErrorsMapping = self->_providersToImportedResultObjectMapping;
    id v16 = v11;
    id v17 = v10;
  }
  [(NSMapTable *)progressToErrorsMapping setObject:v16 forKey:v17];
  objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);
}

- (id)importItemProviders:(id)a3 completionHandler:(id)a4
{
  val = self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  uint64_t v6 = [v5 count];
  id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v6];
  [v7 setCancellable:1];
  [v7 setPausable:0];
  id v25 = +[PXImportManager supportedTypeIdentifiers];
  __int16 v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  id v23 = [MEMORY[0x1E4F8BA08] UUIDString];
  objc_initWeak(&location, val);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v12 = v25;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v40 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v12);
              }
              if (objc_msgSend(v11, "hasRepresentationConformingToTypeIdentifier:fileOptions:", *(void *)(*((void *)&v29 + 1) + 8 * j), 0, val))
              {
                [v24 addObject:v11];
                v26[0] = MEMORY[0x1E4F143A8];
                v26[1] = 3221225472;
                v26[2] = __57__PXImportManager_importItemProviders_completionHandler___block_invoke;
                v26[3] = &unk_1E5DAEC18;
                objc_copyWeak(&v28, &location);
                v26[4] = v11;
                id v27 = v7;
                objc_msgSend(v11, "px_createAssetWithImportSessionID:completionBlock:", v23, v26);

                objc_destroyWeak(&v28);
                goto LABEL_18;
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v40 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        id v16 = PLDragAndDropGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v11;
          _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "No supported representation found for itemProvider: %@", buf, 0xCu);
        }

        objc_msgSend(v7, "setTotalUnitCount:", objc_msgSend(v7, "totalUnitCount") - 1);
LABEL_18:
        ;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v8);
  }

  if ([v7 totalUnitCount] < 1)
  {
    id v17 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = obj;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "No supported representations found for itemProviders: %@", buf, 0xCu);
    }

    int v18 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"No supported representation.");
    (*((void (**)(id, void, void *, void))v21 + 2))(v21, 0, v18, 0);
  }
  else
  {
    [(PXImportManager *)val _addProgress:v7 forItemProviders:v24 assetCreationCompletionHandler:v21];
  }
  objc_destroyWeak(&location);

  return v7;
}

void __57__PXImportManager_importItemProviders_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v5;
  *(id *)(a1 + 40);
  v6;
  px_dispatch_on_main_queue();
}

void __57__PXImportManager_importItemProviders_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleCompletionOfImportForItemProvider:*(void *)(a1 + 32) resultObject:*(void *)(a1 + 40) progress:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (PXImportManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)PXImportManager;
  v2 = [(PXImportManager *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    progressToProvidersMapping = v2->_progressToProvidersMapping;
    v2->_progressToProvidersMapping = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    progressToCompletionHandlerMapping = v2->_progressToCompletionHandlerMapping;
    v2->_progressToCompletionHandlerMapping = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    progressToSharedSourcesCompletionHandlerMapping = v2->_progressToSharedSourcesCompletionHandlerMapping;
    v2->_progressToSharedSourcesCompletionHandlerMapping = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    progressToErrorsMapping = v2->_progressToErrorsMapping;
    v2->_progressToErrorsMapping = (NSMapTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    providersToImportedResultObjectMapping = v2->_providersToImportedResultObjectMapping;
    v2->_providersToImportedResultObjectMapping = (NSMapTable *)v11;
  }
  return v2;
}

+ (NSArray)supportedTypeIdentifiers
{
}

uint64_t __43__PXImportManager_supportedTypeIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (NSArray)supportedTypes
{
  if (supportedTypes_onceToken != -1) {
    dispatch_once(&supportedTypes_onceToken, &__block_literal_global_3688);
  }
  v2 = (void *)supportedTypes_supportedTypes;
  return (NSArray *)v2;
}

void __33__PXImportManager_supportedTypes__block_invoke()
{
}

id __33__PXImportManager_supportedTypes__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
  if ([v2 conformsToType:*MEMORY[0x1E4F44448]]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __33__PXImportManager_supportedTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
}

+ (PXImportManager)defaultManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXImportManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, block);
  }
  v2 = (void *)defaultManager_defaultManager;
  return (PXImportManager *)v2;
}

void __33__PXImportManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v1;
}

- (void)fetchAssetsFromDrop:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    uint64_t v11 = _Block_copy(v8);
    *(_DWORD *)buf = 138412802;
    uint64_t v57 = (uint64_t)v7;
    __int16 v58 = 2112;
    uint64_t v59 = (uint64_t)v10;
    __int16 v60 = 2112;
    v61 = v11;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "_fetchAssetsFromDrop: %@ importIfNeeded: %@ completion: %@", buf, 0x20u);
  }
  if (!v7)
  {
    uint64_t v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PXImportManager.m", 305, @"Invalid parameter not satisfying: %@", @"dropSession" object file lineNumber description];
  }
  BOOL v43 = v6;
  v44 = (void (**)(void, void))v8;
  if (!v8)
  {
    id v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PXImportManager.m", 306, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA48] array];
  v46 = v45 = v7;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v13 = [v7 items];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v55 count:16];
  v47 = v12;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v19 = [v18 localObject];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_22;
        }
        __int16 v20 = [v19 assetReference];
        id v21 = [v20 asset];

        if (!v21)
        {
          id v23 = [MEMORY[0x1E4F28B00] currentHandler];
          __int16 v24 = (objc_class *)objc_opt_class();
          id v25 = NSStringFromClass(v24);
          [v23 handleFailureInMethod:a2, self, @"PXImportManager.m", 318, @"%@ should be an instance inheriting from %@, but it is nil", @"pxLocalObject.assetReference.asset", v25 object file lineNumber description];

LABEL_22:
          id v21 = 0;
          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v40 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v26 = (objc_class *)objc_opt_class();
          id v27 = NSStringFromClass(v26);
          id v28 = objc_msgSend(v21, "px_descriptionForAssertionMessage");
          [v40 handleFailureInMethod:a2, self, @"PXImportManager.m", 318, @"%@ should be an instance inheriting from %@, but it is %@", @"pxLocalObject.assetReference.asset", v27, v28 object file lineNumber description];

          id v12 = v47;
        }
        if ([v21 sourceType] != 2)
        {
          __int16 v22 = [v21 objectID];
          [v46 addObject:v22];

          id v12 = v47;
          goto LABEL_24;
        }
LABEL_23:
        [v12 addObject:v18];
LABEL_24:
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v15);
  }

  long long v29 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = [v46 count];
    uint64_t v31 = [v47 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v57 = v30;
    id v12 = v47;
    __int16 v58 = 2048;
    uint64_t v59 = v31;
    _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_DEBUG, "Found %ld local drag assets and %ld drag items needing import", buf, 0x16u);
  }

  if (v43 && [v12 count])
  {
    long long v32 = +[PXImportManager defaultManager];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __70__PXImportManager_iOS__fetchAssetsFromDrop_importIfNeeded_completion___block_invoke;
    v48[3] = &unk_1E5DAECB0;
    id v49 = v46;
    v50 = v44;
    id v33 = (id)[v32 importDragItems:v47 completionHandler:v48];

    id v12 = v47;
  }
  else if ([v46 count])
  {
    long long v34 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v35 = objc_alloc(MEMORY[0x1E4F39150]);
    long long v36 = [MEMORY[0x1E4F38EB8] fetchType];
    v37 = (void *)[v35 initWithOids:v46 photoLibrary:v34 fetchType:v36 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

    ((void (**)(void, void *))v44)[2](v44, v37);
    id v12 = v47;
  }
  else
  {
    v44[2](v44, 0);
  }
}

void __70__PXImportManager_iOS__fetchAssetsFromDrop_importIfNeeded_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = @"NO";
    if (a2) {
      id v10 = @"YES";
    }
    int v22 = 138412546;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "Import completed: success %@ error %@", (uint8_t *)&v22, 0x16u);
  }

  if (!v8)
  {
    uint64_t v13 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      id v23 = v7;
      id v19 = "importDragItems failed to return importedAssets with error: %@";
      __int16 v20 = v13;
      uint32_t v21 = 12;
LABEL_12:
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v22, v21);
    }
LABEL_13:
    id v12 = 0;
    int v18 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = v8[2](v8);
  if (!v11)
  {
    uint64_t v13 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      id v19 = "importedAssets returned a nil result";
      __int16 v20 = v13;
      uint32_t v21 = 2;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v12 = (void *)v11;
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [v12 fetchedObjectIDs];
  [v13 addObjectsFromArray:v14];

  [v13 addObjectsFromArray:*(void *)(a1 + 32)];
  id v15 = objc_alloc(MEMORY[0x1E4F39150]);
  uint64_t v16 = [v12 photoLibrary];
  id v17 = [MEMORY[0x1E4F38EB8] fetchType];
  int v18 = (void *)[v15 initWithOids:v13 photoLibrary:v16 fetchType:v17 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)importSharedSourcesForDragItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v19 = a4;
  uint64_t v6 = [v5 count];
  id v24 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v6];
  [v24 setCancellable:1];
  [v24 setPausable:0];
  id v23 = +[PXImportManager supportedTypeIdentifiers];
  int v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  objc_initWeak(&location, self);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = [v10 itemProvider];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v12 = v23;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v42 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v12);
              }
              if ([v11 hasRepresentationConformingToTypeIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * j) fileOptions:0])
              {
                [v22 addObject:v11];
                v25[0] = MEMORY[0x1E4F143A8];
                v25[1] = 3221225472;
                v25[2] = __74__PXImportManager_iOS__importSharedSourcesForDragItems_completionHandler___block_invoke;
                v25[3] = &unk_1E5DAEC88;
                objc_copyWeak(&v28, &location);
                id v17 = v11;
                id v26 = v17;
                id v27 = v24;
                objc_msgSend(v17, "px_createStreamShareSourceWithCompletionBlock:", v25);

                objc_destroyWeak(&v28);
                goto LABEL_18;
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v42 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v16 = PLDragAndDropGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v39 = v10;
          __int16 v40 = 2112;
          v41 = v11;
          _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "No supported representation found for dragItem: %@ dragItem.itemProvider: %@", buf, 0x16u);
        }

        objc_msgSend(v24, "setTotalUnitCount:", objc_msgSend(v24, "totalUnitCount") - 1);
LABEL_18:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v7);
  }

  [(PXImportManager *)self _addProgress:v24 forItemProviders:v22 sharedSourceCompletionHandler:v19];
  objc_destroyWeak(&location);

  return v24;
}

void __74__PXImportManager_iOS__importSharedSourcesForDragItems_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleCompletionOfImportForItemProvider:*(void *)(a1 + 32) resultObject:v7 progress:*(void *)(a1 + 40) error:v6];
}

- (id)importDragItems:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  PXMap();
}

uint64_t __58__PXImportManager_iOS__importDragItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemProvider];
}

@end