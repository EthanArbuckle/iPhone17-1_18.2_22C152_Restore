@interface PXPlacesPhotoAssetsStore
+ (id)_assetsImportQueue;
- (BOOL)didCompleteLoad;
- (BOOL)didInitiateLoad;
- (NSArray)fetchResults;
- (NSMutableArray)completions;
- (OS_dispatch_queue)serialQueue;
- (PHPhotoLibrary)photoLibrary;
- (PXPlacesPhotoAssetsStore)initWithFetchResults:(id)a3 photoLibrary:(id)a4;
- (PXPlacesStore)store;
- (void)_addItems:(id)a3 intoStore:(id)a4;
- (void)_handleAssetsImport;
- (void)dealloc;
- (void)loadWithCompletion:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)setCompletions:(id)a3;
- (void)setDidCompleteLoad:(BOOL)a3;
- (void)setDidInitiateLoad:(BOOL)a3;
- (void)setFetchResults:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation PXPlacesPhotoAssetsStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setCompletions:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setDidCompleteLoad:(BOOL)a3
{
  self->_didCompleteLoad = a3;
}

- (BOOL)didCompleteLoad
{
  return self->_didCompleteLoad;
}

- (void)setDidInitiateLoad:(BOOL)a3
{
  self->_didInitiateLoad = a3;
}

- (BOOL)didInitiateLoad
{
  return self->_didInitiateLoad;
}

- (void)setStore:(id)a3
{
}

- (PXPlacesStore)store
{
  return self->_store;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setFetchResults:(id)a3
{
}

- (NSArray)fetchResults
{
  return self->_fetchResults;
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v4 = [(PXPlacesPhotoAssetsStore *)self fetchResults];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v83;
    id v55 = v4;
    uint64_t v58 = *(void *)v83;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v59 = v6;
      do
      {
        if (*(void *)v83 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [v65 changeDetailsForFetchResult:*(void *)(*((void *)&v82 + 1) + 8 * v8)];
        v10 = v9;
        if (v9)
        {
          if (![v9 hasIncrementalChanges])
          {

            v47 = [(PXPlacesPhotoAssetsStore *)self store];
            v48 = [v47 allItems];

            v49 = [(PXPlacesPhotoAssetsStore *)self store];
            [v49 beginUpdates];

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v4 = v48;
            uint64_t v50 = [v4 countByEnumeratingWithState:&v66 objects:v86 count:16];
            if (v50)
            {
              uint64_t v51 = v50;
              uint64_t v52 = *(void *)v67;
              do
              {
                for (uint64_t i = 0; i != v51; ++i)
                {
                  if (*(void *)v67 != v52) {
                    objc_enumerationMutation(v4);
                  }
                  [(PXPlacesStore *)self->_store removeItem:*(void *)(*((void *)&v66 + 1) + 8 * i)];
                }
                uint64_t v51 = [v4 countByEnumeratingWithState:&v66 objects:v86 count:16];
              }
              while (v51);
            }

            v54 = [(PXPlacesPhotoAssetsStore *)self store];
            [v54 endUpdates];

            [(PXPlacesPhotoAssetsStore *)self setDidInitiateLoad:0];
            [(PXPlacesPhotoAssetsStore *)self setDidCompleteLoad:0];
            [(PXPlacesPhotoAssetsStore *)self loadWithCompletion:0];
            goto LABEL_57;
          }
          v11 = [v10 removedObjects];
          v61 = [v10 insertedObjects];
          v60 = v10;
          if ([v11 count] || objc_msgSend(v61, "count"))
          {
            v12 = [(PXPlacesPhotoAssetsStore *)self store];
            [v12 beginUpdates];

            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v13 = v11;
            id v14 = v11;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v78 objects:v89 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v79;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v79 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v78 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [(PXPlacesStore *)self->_store removeItem:v19];
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v78 objects:v89 count:16];
              }
              while (v16);
            }

            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id v20 = v61;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v74 objects:v88 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v75;
              do
              {
                for (uint64_t k = 0; k != v22; ++k)
                {
                  if (*(void *)v75 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void *)(*((void *)&v74 + 1) + 8 * k);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [(PXPlacesStore *)self->_store addItem:v25];
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v74 objects:v88 count:16];
              }
              while (v22);
            }

            v26 = [(PXPlacesPhotoAssetsStore *)self store];
            [v26 endUpdates];
            uint64_t v6 = v59;
            v10 = v60;
            v11 = v13;
            id v27 = v26;
            uint64_t v7 = v58;
          }
          else
          {
            uint64_t v28 = [v10 changedObjects];
            if (v28)
            {
              v29 = (void *)v28;
              v56 = v11;
              uint64_t v57 = v8;
              id v64 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              id v63 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v27 = v29;
              uint64_t v30 = [v27 countByEnumeratingWithState:&v70 objects:v87 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v71;
                obuint64_t j = v27;
                do
                {
                  for (uint64_t m = 0; m != v31; ++m)
                  {
                    if (*(void *)v71 != v32) {
                      objc_enumerationMutation(obj);
                    }
                    v34 = *(void **)(*((void *)&v70 + 1) + 8 * m);
                    v35 = [v65 changeDetailsForObject:v34];
                    v36 = [v35 objectBeforeChanges];
                    id v37 = v34;
                    v38 = [v36 location];
                    v39 = [v37 location];
                    [v38 coordinate];
                    double v41 = v40;
                    [v39 coordinate];
                    if (vabdd_f64(v41, v42) >= 2.22044605e-16
                      || ([v38 coordinate],
                          double v44 = v43,
                          [v39 coordinate],
                          vabdd_f64(v44, v45) >= 2.22044605e-16))
                    {
                      [v64 addObject:v36];
                      [v63 addObject:v37];
                    }
                  }
                  id v27 = obj;
                  uint64_t v31 = [obj countByEnumeratingWithState:&v70 objects:v87 count:16];
                }
                while (v31);
              }

              v11 = v56;
              uint64_t v8 = v57;
              if ([v64 count])
              {
                [(PXPlacesStore *)self->_store beginUpdates];
                [(PXPlacesStore *)self->_store removeItems:v64];
                [(PXPlacesStore *)self->_store addItems:v63];
                [(PXPlacesStore *)self->_store endUpdates];
              }

              id v4 = v55;
              uint64_t v7 = v58;
              uint64_t v6 = v59;
              v10 = v60;
            }
            else
            {
              id v27 = 0;
            }
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v46 = [v4 countByEnumeratingWithState:&v82 objects:v90 count:16];
      uint64_t v6 = v46;
      if (v46) {
        continue;
      }
      break;
    }
  }
LABEL_57:
}

- (void)_addItems:(id)a3 intoStore:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = PKPlacesKitGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  PKPlacesKitGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v14 = 138412290;
    uint64_t v15 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddItemsIntoStore", "%@", (uint8_t *)&v14, 0xCu);
  }
  [v6 beginUpdates];
  [v6 addItemsFromArray:v5];
  [v6 endUpdates];
  v12 = v10;
  v13 = v12;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_END, v8, "AddItemsIntoStore", "", (uint8_t *)&v14, 2u);
  }
}

- (void)_handleAssetsImport
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  [(PHPhotoLibrary *)self->_photoLibrary unregisterChangeObserver:self];
  v3 = PKPlacesKitGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  PKPlacesKitGetLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t spid = v4;
  unint64_t v27 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HandleAssetsImport", "", buf, 2u);
  }
  uint64_t v28 = v6;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_signpost_id_t v8 = [(PXPlacesPhotoAssetsStore *)self fetchResults];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v30 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v30) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v44 != v15) {
                objc_enumerationMutation(v13);
              }
              [v7 addObject:*(void *)(*((void *)&v43 + 1) + 8 * j)];
              if (v10 < 20000)
              {
                ++v10;
              }
              else
              {
                uint64_t v17 = [(PXPlacesPhotoAssetsStore *)self store];
                [(PXPlacesPhotoAssetsStore *)self _addItems:v7 intoStore:v17];

                [v7 removeAllObjects];
                uint64_t v10 = 0;
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v52 count:16];
          }
          while (v14);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v9);
  }

  if ([v7 count])
  {
    v18 = [(PXPlacesPhotoAssetsStore *)self store];
    [(PXPlacesPhotoAssetsStore *)self _addItems:v7 intoStore:v18];
  }
  *(void *)buf = 0;
  v38 = buf;
  uint64_t v39 = 0x3032000000;
  double v40 = __Block_byref_object_copy__44281;
  double v41 = __Block_byref_object_dispose__44282;
  id v42 = 0;
  uint64_t v19 = [(PXPlacesPhotoAssetsStore *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PXPlacesPhotoAssetsStore__handleAssetsImport__block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(v19, block);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = *((id *)v38 + 5);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v20);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v32 + 1) + 8 * k) + 16))();
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v51 count:16];
    }
    while (v21);
  }

  [(PXPlacesPhotoAssetsStore *)self setDidCompleteLoad:1];
  [(PHPhotoLibrary *)self->_photoLibrary registerChangeObserver:self];
  v24 = v28;
  uint64_t v25 = v24;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)uint64_t v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_INTERVAL_END, spid, "HandleAssetsImport", "", v31, 2u);
  }

  _Block_object_dispose(buf, 8);
}

void __47__PXPlacesPhotoAssetsStore__handleAssetsImport__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completions];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) completions];
  [v6 removeAllObjects];
}

- (void)loadWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if ([(PXPlacesPhotoAssetsStore *)self didCompleteLoad])
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    if (v4)
    {
      id v5 = [(PXPlacesPhotoAssetsStore *)self serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__PXPlacesPhotoAssetsStore_loadWithCompletion___block_invoke;
      block[3] = &unk_1E5DD3280;
      block[4] = self;
      v11 = v4;
      dispatch_sync(v5, block);
    }
    if (![(PXPlacesPhotoAssetsStore *)self didInitiateLoad])
    {
      [(PXPlacesPhotoAssetsStore *)self setDidInitiateLoad:1];
      objc_initWeak(&location, self);
      id v6 = [(id)objc_opt_class() _assetsImportQueue];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47__PXPlacesPhotoAssetsStore_loadWithCompletion___block_invoke_2;
      v7[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v8, &location);
      dispatch_async(v6, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __47__PXPlacesPhotoAssetsStore_loadWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) completions];
  v2 = (void *)[*(id *)(a1 + 40) copy];
  [v3 addObject:v2];
}

void __47__PXPlacesPhotoAssetsStore_loadWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAssetsImport];
}

- (void)dealloc
{
  [(PHPhotoLibrary *)self->_photoLibrary unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PXPlacesPhotoAssetsStore;
  [(PXPlacesPhotoAssetsStore *)&v3 dealloc];
}

- (PXPlacesPhotoAssetsStore)initWithFetchResults:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXPlacesPhotoAssetsStore;
  uint64_t v9 = [(PXPlacesPhotoAssetsStore *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchResults, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
    v11 = objc_alloc_init(PXPlacesStore);
    store = v10->_store;
    v10->_store = v11;

    *(_WORD *)&v10->_didInitiateLoad = 0;
    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completions = v10->_completions;
    v10->_completions = v13;

    dispatch_queue_t v15 = dispatch_queue_create("completions", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v15;
  }
  return v10;
}

+ (id)_assetsImportQueue
{
  if (_assetsImportQueue_onceToken != -1) {
    dispatch_once(&_assetsImportQueue_onceToken, &__block_literal_global_44294);
  }
  v2 = (void *)_assetsImportQueue_assetsImportQueue;
  return v2;
}

void __46__PXPlacesPhotoAssetsStore__assetsImportQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.places.assetsImport", v2);
  v1 = (void *)_assetsImportQueue_assetsImportQueue;
  _assetsImportQueue_assetsImportQueue = (uint64_t)v0;
}

@end