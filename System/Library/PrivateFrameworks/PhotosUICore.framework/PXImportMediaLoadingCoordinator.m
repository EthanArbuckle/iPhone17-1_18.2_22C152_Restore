@interface PXImportMediaLoadingCoordinator
- (BOOL)paused;
- (NSMutableArray)thumbnailWorkItemUuids;
- (PXImportAssetsDataSource)dataSource;
- (PXImportAssetsDataSourceManager)dataSourceManager;
- (PXImportController)importController;
- (PXImportMediaLoadingCoordinator)initWithImportController:(id)a3;
- (id)dequeueNextThumbnailWorkItem;
- (int64_t)completedDataSourceIdentifier;
- (void)_processItemIfPossible;
- (void)handleNewDataSource:(id)a3;
- (void)mediaProviderThumbnailingBecameIdle:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCompletedDataSourceIdentifier:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setThumbnailWorkItemUuids:(id)a3;
- (void)shutdown;
@end

@implementation PXImportMediaLoadingCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_thumbnailWorkItemUuids, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_destroyWeak((id *)&self->_importController);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_modelQueue, 0);
}

- (void)setCompletedDataSourceIdentifier:(int64_t)a3
{
  self->_completedDataSourceIdentifier = a3;
}

- (int64_t)completedDataSourceIdentifier
{
  return self->_completedDataSourceIdentifier;
}

- (void)setDataSource:(id)a3
{
}

- (PXImportAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setThumbnailWorkItemUuids:(id)a3
{
}

- (NSMutableArray)thumbnailWorkItemUuids
{
  return self->_thumbnailWorkItemUuids;
}

- (PXImportAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXImportController)importController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importController);
  return (PXImportController *)WeakRetained;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)mediaProviderThumbnailingBecameIdle:(id)a3
{
  if ([(PXImportMediaLoadingCoordinator *)self paused])
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v4 = "skipping: paused";
LABEL_10:
      _os_log_debug_impl(&dword_1A9AE7000, 0, OS_LOG_TYPE_DEBUG, v4, buf, 2u);
    }
  }
  else
  {
    int64_t v5 = [(PXImportMediaLoadingCoordinator *)self completedDataSourceIdentifier];
    v6 = [(PXImportMediaLoadingCoordinator *)self dataSource];
    uint64_t v7 = [v6 identifier];

    if (v5 == v7)
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v4 = "skipping: current datasource completed";
        goto LABEL_10;
      }
    }
    else
    {
      workerQueue = self->_workerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__PXImportMediaLoadingCoordinator_mediaProviderThumbnailingBecameIdle___block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_async(workerQueue, block);
    }
  }
}

void __71__PXImportMediaLoadingCoordinator_mediaProviderThumbnailingBecameIdle___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) dequeueNextThumbnailWorkItem];
  if (v2 && ([*(id *)(a1 + 32) paused] & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v2;
      _os_log_debug_impl(&dword_1A9AE7000, 0, OS_LOG_TYPE_DEBUG, "firing lazy loading image request for %@", buf, 0xCu);
    }
    v8 = [*(id *)(a1 + 32) importController];
    v9 = [v8 importMediaProvider];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__PXImportMediaLoadingCoordinator_mediaProviderThumbnailingBecameIdle___block_invoke_20;
    v10[3] = &unk_1E5DCFBF0;
    v10[4] = *(void *)(a1 + 32);
    [v9 requestImageForImportItem:v2 ofSize:0 completion:v10];
  }
  else
  {
    v3 = [*(id *)(a1 + 32) thumbnailWorkItemUuids];
    uint64_t v4 = [v3 count];

    if (!v4)
    {
      int64_t v5 = [*(id *)(a1 + 32) dataSource];
      objc_msgSend(*(id *)(a1 + 32), "setCompletedDataSourceIdentifier:", objc_msgSend(v5, "identifier"));

      v6 = [*(id *)(a1 + 32) importController];
      uint64_t v7 = [v6 importMediaProvider];
      objc_msgSend(v7, "ppt_sendMediaProviderDidProcessAsset:", &unk_1F02DB8D8);

      if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1A9AE7000, 0, OS_LOG_TYPE_DEBUG, "nothing left to lazy loading", buf, 2u);
      }
    }
  }
}

void __71__PXImportMediaLoadingCoordinator_mediaProviderThumbnailingBecameIdle___block_invoke_20(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) importController];
  [v1 restartTimedAssetsLoadingPowerAssertion];
}

- (void)_processItemIfPossible
{
  id v3 = [(PXImportMediaLoadingCoordinator *)self importController];
  v2 = [v3 importMediaProvider];
  [v2 sendMediaProviderThumbnailingBecameIdle];
}

- (id)dequeueNextThumbnailWorkItem
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__276274;
  v11 = __Block_byref_object_dispose__276275;
  id v12 = 0;
  modelQueue = self->_modelQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PXImportMediaLoadingCoordinator_dequeueNextThumbnailWorkItem__block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(modelQueue, v6);
  if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = v8[5];
    *(_DWORD *)buf = 136315394;
    v14 = "-[PXImportMediaLoadingCoordinator dequeueNextThumbnailWorkItem]";
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_debug_impl(&dword_1A9AE7000, 0, OS_LOG_TYPE_DEBUG, "%s: Lazy loader candidate %@", buf, 0x16u);
  }
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __63__PXImportMediaLoadingCoordinator_dequeueNextThumbnailWorkItem__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) thumbnailWorkItemUuids];
  id v3 = (void *)[v2 copy];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PXImportMediaLoadingCoordinator_dequeueNextThumbnailWorkItem__block_invoke_2;
  v4[3] = &unk_1E5DCFBC8;
  long long v5 = *(_OWORD *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __63__PXImportMediaLoadingCoordinator_dequeueNextThumbnailWorkItem__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  v6 = [*(id *)(a1 + 32) dataSource];
  uint64_t v7 = [v6 itemForImportAssetUuid:v15];

  uint64_t v8 = [v7 thumbnailError];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [v7 thumbnailError];
    uint64_t v11 = [v10 code];

    if (![v7 isMediaAsset] || v11 != 252) {
      goto LABEL_8;
    }
  }
  else if (![v7 isMediaAsset])
  {
    goto LABEL_8;
  }
  id v12 = [v7 imageRepresentations];
  uint64_t v13 = [v12 objectForKeyedSubscript:&unk_1F02D9FA0];

  if (!v13)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
    *a4 = 1;
  }
LABEL_8:
  v14 = [*(id *)(a1 + 32) thumbnailWorkItemUuids];
  [v14 removeObject:v15];
}

- (void)handleNewDataSource:(id)a3
{
  modelQueue = self->_modelQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(modelQueue);
  if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1A9AE7000, 0, OS_LOG_TYPE_DEBUG, "new datasource", v10, 2u);
  }
  [(PXImportMediaLoadingCoordinator *)self setDataSource:v5];

  v6 = [(PXImportMediaLoadingCoordinator *)self dataSource];
  uint64_t v7 = [v6 allItems];
  uint64_t v8 = [v7 valueForKeyPath:@"importAsset.uuid"];
  uint64_t v9 = (void *)[v8 mutableCopy];
  [(PXImportMediaLoadingCoordinator *)self setThumbnailWorkItemUuids:v9];

  [(PXImportMediaLoadingCoordinator *)self _processItemIfPossible];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXImportAssetsDataSourceManagerObserverContext == a5)
  {
    v6 = [(PXImportMediaLoadingCoordinator *)self dataSourceManager];
    uint64_t v7 = [v6 dataSource];

    modelQueue = self->_modelQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__PXImportMediaLoadingCoordinator_observable_didChange_context___block_invoke;
    v10[3] = &unk_1E5DD32A8;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_async(modelQueue, v10);
  }
}

uint64_t __64__PXImportMediaLoadingCoordinator_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNewDataSource:*(void *)(a1 + 40)];
}

- (void)setPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_debug_impl(&dword_1A9AE7000, 0, OS_LOG_TYPE_DEBUG, "paused state changed %d", (uint8_t *)v5, 8u);
    }
    self->_paused = v3;
    if (!v3) {
      [(PXImportMediaLoadingCoordinator *)self _processItemIfPossible];
    }
  }
}

- (void)shutdown
{
  dataSourceManager = self->_dataSourceManager;
  if (dataSourceManager)
  {
    [(PXImportAssetsDataSourceManager *)dataSourceManager unregisterChangeObserver:self context:PXImportAssetsDataSourceManagerObserverContext];
    uint64_t v4 = self->_dataSourceManager;
    self->_dataSourceManager = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importController);

  if (WeakRetained)
  {
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"PXImportMediaProviderThumbnailingBecameIdleNotification" object:0];

    objc_storeWeak((id *)&self->_importController, 0);
  }
  dataSource = self->_dataSource;
  self->_dataSource = 0;
}

- (PXImportMediaLoadingCoordinator)initWithImportController:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXImportMediaLoadingCoordinator;
  id v5 = [(PXImportMediaLoadingCoordinator *)&v25 init];
  if (v5)
  {
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);

    uint64_t v8 = NSString;
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = [v8 stringWithFormat:@"%@-modelQueue", v10];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], v7);
    modelQueue = v5->_modelQueue;
    v5->_modelQueue = (OS_dispatch_queue *)v12;

    v14 = NSString;
    id v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    id v17 = [v14 stringWithFormat:@"%@-workerQueue", v16];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], v7);
    workerQueue = v5->_workerQueue;
    v5->_workerQueue = (OS_dispatch_queue *)v18;

    v5->_paused = 1;
    objc_storeWeak((id *)&v5->_importController, v4);
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v5 selector:sel_mediaProviderThumbnailingBecameIdle_ name:@"PXImportMediaProviderThumbnailingBecameIdleNotification" object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_importController);
    if (!WeakRetained) {
      _PFAssertContinueHandler();
    }

    uint64_t v22 = [v4 dataSourceManager];
    dataSourceManager = v5->_dataSourceManager;
    v5->_dataSourceManager = (PXImportAssetsDataSourceManager *)v22;

    [(PXImportAssetsDataSourceManager *)v5->_dataSourceManager registerChangeObserver:v5 context:PXImportAssetsDataSourceManagerObserverContext];
    if (!v5->_dataSourceManager) {
      _PFAssertContinueHandler();
    }
  }
  return v5;
}

@end