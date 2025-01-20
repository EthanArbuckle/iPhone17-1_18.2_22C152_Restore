@interface PUImportPPTDriver
+ (NSArray)importMediaURLs;
+ (id)sharedInstance;
- (NSDictionary)additionalResults;
- (NSDictionary)options;
- (NSDictionary)testOptions;
- (PUImportPPTDriver)init;
- (PXImportViewControllerProvider)importViewControllerProvider;
- (double)_contentLoadingCheckInterval;
- (id)importController;
- (id)importDestinationForActionCoordinator:(id)a3;
- (id)importViewController;
- (id)mediaProvider;
- (id)modelBatchesForOptions:(id)a3;
- (void)_removeCurrentImportSourceIfNecessary;
- (void)_updateLoadingContentState;
- (void)actionCoordinator:(id)a3 didCompleteWithImportSession:(id)a4 results:(id)a5;
- (void)actionCoordinatorDidBeginImport:(id)a3;
- (void)actionCoordinatorDidCancelImport:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)ppt_insertImportDataSourceWithOptions:(id)a3 completionHandler:(id)a4;
- (void)ppt_mediaProviderDidProcessAsset:(id)a3;
- (void)ppt_performDeleteWithOptions:(id)a3 completionHandler:(id)a4;
- (void)ppt_performImportToLibraryWithOptions:(id)a3 completionHandler:(id)a4;
- (void)ppt_performThumbnailWithOptions:(id)a3 completionHandler:(id)a4;
- (void)ppt_removeImportDataSourceWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setImportViewControllerProvider:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTestOptions:(id)a3;
- (void)signalImportToLibraryTestReply:(BOOL)a3;
- (void)signalInsertDatasourceReply:(BOOL)a3;
- (void)signalThumbnailTestReply:(BOOL)a3;
@end

@implementation PUImportPPTDriver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_testOptions, 0);
  objc_destroyWeak((id *)&self->_importViewControllerProvider);
  objc_storeStrong((id *)&self->_importSemaphore, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_destroyWeak((id *)&self->_mediaProvider);
  objc_destroyWeak((id *)&self->_currentImportSource);
  objc_destroyWeak((id *)&self->_importController);
  objc_destroyWeak((id *)&self->_dataSourceManager);
  objc_storeStrong((id *)&self->_extraResults, 0);
  objc_storeStrong(&self->_importToLibraryTestReply, 0);
  objc_storeStrong(&self->_thumbnailTestReply, 0);
  objc_storeStrong(&self->_insertDatasourceReply, 0);
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTestOptions:(id)a3
{
}

- (NSDictionary)testOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setImportViewControllerProvider:(id)a3
{
}

- (PXImportViewControllerProvider)importViewControllerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importViewControllerProvider);
  return (PXImportViewControllerProvider *)WeakRetained;
}

- (id)importDestinationForActionCoordinator:(id)a3
{
  return 0;
}

- (void)actionCoordinator:(id)a3 didCompleteWithImportSession:(id)a4 results:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  importSemaphore = self->_importSemaphore;
  if (importSemaphore) {
    dispatch_semaphore_signal(importSemaphore);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_endTime = v11;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v13 = v12 - self->_startTime;
  v14 = NSString;
  int64_t v15 = self->_iteration + 1;
  self->_iteration = v15;
  v16 = objc_msgSend(v14, "stringWithFormat:", @"Time to perform Import to Library %lu", v15);
  v17 = [NSNumber numberWithDouble:v13];
  [(NSMutableDictionary *)self->_extraResults setObject:v17 forKeyedSubscript:v16];

  if (self->_importComplete)
  {
    v18 = [(PUImportPPTDriver *)self options];
    v19 = [v18 objectForKeyedSubscript:@"PUImportPPTDriverBatchCountKey"];
    uint64_t v20 = [v19 integerValue];

    if (v20 >= 1)
    {
      v21 = [NSNumber numberWithInteger:v20];
      [(NSMutableDictionary *)self->_extraResults setObject:v21 forKeyedSubscript:@"Import batch size"];
    }
    [(PUImportPPTDriver *)self signalImportToLibraryTestReply:1];
  }
}

- (void)actionCoordinatorDidCancelImport:(id)a3
{
  importSemaphore = self->_importSemaphore;
  if (importSemaphore) {
    dispatch_semaphore_signal(importSemaphore);
  }
  [(PUImportPPTDriver *)self signalImportToLibraryTestReply:0];
}

- (void)actionCoordinatorDidBeginImport:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", a3);
  self->_startTime = v4;
}

- (void)ppt_mediaProviderDidProcessAsset:(id)a3
{
  id v27 = a3;
  double v4 = [v27 userInfo];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  double startTime = self->_startTime;
  id v8 = [(PUImportPPTDriver *)self options];
  id v9 = [v8 objectForKeyedSubscript:@"PUImportPPTDriverThumbnailToFirstKey"];
  int v10 = [v9 BOOLValue];

  double v11 = [(PUImportPPTDriver *)self options];
  double v12 = [v11 objectForKeyedSubscript:@"PUImportPPTDriverThumbnailToAllAbsoluteKey"];
  int v13 = [v12 BOOLValue];

  v14 = [(PUImportPPTDriver *)self options];
  int64_t v15 = [v14 objectForKeyedSubscript:@"PUImportPPTDriverThumbnailToAllScreenKey"];
  int v16 = [v15 BOOLValue];

  v17 = [v4 objectForKeyedSubscript:@"isLastDisplayItem"];
  int v18 = [v17 BOOLValue];

  v19 = [v4 objectForKeyedSubscript:@"isLastAbsoluteItem"];
  int v20 = [v19 BOOLValue];

  if (v20)
  {
    self->_hasSeenAbsolulteLastThumbnailMarker = 1;
    objc_sync_enter(self);
  }
  else
  {
    v21 = self;
    objc_sync_enter(v21);
    id v22 = [v4 objectForKeyedSubscript:@"duration"];
    extraResults = v21->_extraResults;
    v24 = [v4 objectForKeyedSubscript:@"filename"];
    [(NSMutableDictionary *)extraResults setObject:v22 forKeyedSubscript:v24];

    v25 = [NSNumber numberWithDouble:v6 - startTime];
    [(NSMutableDictionary *)v21->_extraResults setObject:v25 forKeyedSubscript:@"Image Processing Duration"];
  }
  objc_sync_exit(self);

  if (v13)
  {
    if (self->_hasSeenAbsolulteLastThumbnailMarker) {
      char v26 = 1;
    }
    else {
      char v26 = v10;
    }
    if ((v26 & 1) == 0 && (v16 & v18 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if ((v10 | v16 & v18) != 1)
  {
    goto LABEL_13;
  }
  [(PUImportPPTDriver *)self signalThumbnailTestReply:1];
LABEL_13:
}

- (void)signalImportToLibraryTestReply:(BOOL)a3
{
  if (self->_importToLibraryTestReply) {
    px_dispatch_on_main_queue_sync();
  }
}

void __52__PUImportPPTDriver_signalImportToLibraryTestReply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)signalThumbnailTestReply:(BOOL)a3
{
  if (self->_thumbnailTestReply) {
    px_dispatch_on_main_queue_sync();
  }
}

void __46__PUImportPPTDriver_signalThumbnailTestReply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void)signalInsertDatasourceReply:(BOOL)a3
{
  if (self->_insertDatasourceReply)
  {
    double v5 = [NSNumber numberWithDouble:self->_endTime - self->_startTime];
    [(NSMutableDictionary *)self->_extraResults setObject:v5 forKeyedSubscript:@"Import source content load time"];

    double v6 = (void *)[self->_insertDatasourceReply copy];
    id insertDatasourceReply = self->_insertDatasourceReply;
    self->_id insertDatasourceReply = 0;

    id v8 = [(PUImportPPTDriver *)self options];
    id v9 = [v8 objectForKeyedSubscript:@"PUImportPPTDriverReplyWhenMediaProviderReadyKey"];
    int v10 = [v9 BOOLValue];

    if (v10) {
      int64_t v11 = 1000000000;
    }
    else {
      int64_t v11 = 100000001;
    }
    dispatch_time_t v12 = dispatch_time(0, v11);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PUImportPPTDriver_signalInsertDatasourceReply___block_invoke;
    block[3] = &unk_1E5F2C610;
    block[4] = self;
    id v15 = v6;
    BOOL v16 = a3;
    id v13 = v6;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __49__PUImportPPTDriver_signalInsertDatasourceReply___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 104) = v2;
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (double)_contentLoadingCheckInterval
{
  uint64_t v2 = [(PUImportPPTDriver *)self options];
  v3 = [v2 objectForKeyedSubscript:@"PUImportPPTDriverReplyWhenAllContentIsReadyKey"];
  int v4 = [v3 BOOLValue];

  double result = 0.1;
  if (v4) {
    return 15.0;
  }
  return result;
}

- (void)_updateLoadingContentState
{
  v3 = [(PUImportPPTDriver *)self options];
  int v4 = [v3 objectForKeyedSubscript:@"PUImportPPTDriverReplyWhenAllContentIsReadyKey"];
  int v5 = [v4 BOOLValue];

  double v6 = [(PUImportPPTDriver *)self options];
  v7 = [v6 objectForKeyedSubscript:@"PUImportPPTDriverReplyWhenAnyContentIsReadyKey"];
  int v8 = [v7 BOOLValue];

  id v9 = [(PUImportPPTDriver *)self options];
  int v10 = [v9 objectForKeyedSubscript:@"PUImportPPTDriverReplyWhenMediaProviderReadyKey"];
  int v11 = [v10 BOOLValue];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceManager);
  id v17 = [WeakRetained dataSource];

  uint64_t v13 = [v17 numberOfItems];
  self->_loadingContentStarted = v13 != 0;
  if (v13)
  {
    v14 = [(PUImportPPTDriver *)self importController];
    int v15 = [v14 isLoadingContent];

    if ((v15 | v11 | v5 ^ 1) != 1) {
      goto LABEL_6;
    }
    int v16 = v8 ^ 1;
    if (!self->_loadingContentStarted) {
      int v16 = 1;
    }
    if (((v16 | v11) & 1) == 0) {
LABEL_6:
    }
      [(PUImportPPTDriver *)self signalInsertDatasourceReply:1];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  int v8 = [(PUImportPPTDriver *)self options];
  id v9 = [v8 objectForKeyedSubscript:@"PUImportPPTDriverReplyWhenAnyContentIsReadyKey"];
  int v10 = [v9 BOOLValue];

  if ((void *)PXImportControllerObserverContext_34940 == a5)
  {
    if (v6)
    {
      dispatch_time_t v12 = [(PUImportPPTDriver *)self importController];
      int v13 = [v12 isLoadingContent];

      if (v13) {
        self->_loadingContentStarted = 1;
      }
    }
  }
  else if ((v6 & 1) != 0 && (void *)PXImportAssetsDataSourceManagerObserverContext_34941 == a5)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_endTime = v11;
    if (v10)
    {
      [(PUImportPPTDriver *)self _updateLoadingContentState];
    }
    else
    {
      px_dispatch_on_main_queue_sync();
    }
  }
}

uint64_t __50__PUImportPPTDriver_observable_didChange_context___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__updateLoadingContentState object:0];
  uint64_t v2 = *(void **)(a1 + 32);
  [v2 _contentLoadingCheckInterval];
  return objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel__updateLoadingContentState, 0);
}

- (id)modelBatchesForOptions:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"PUImportPPTDriverAllModelKey"];
  int v6 = [v5 BOOLValue];

  v7 = [v4 objectForKeyedSubscript:@"PUImportPPTDriverBatchCountKey"];
  uint64_t v8 = [v7 integerValue];

  id v9 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceManager);
  double v11 = [WeakRetained unfilteredDataSource];
  dispatch_time_t v12 = [v11 allItems];

  if (v6)
  {
    id v13 = v12;
  }
  else
  {
    uint64_t v14 = [v12 count];
    if (v8 >= v14)
    {
      id v17 = 0;
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      int v16 = 0;
      do
      {
        id v17 = objc_msgSend(v12, "subarrayWithRange:", v15, v8);

        [v9 addObject:v17];
        v15 += v8;
        int v16 = v17;
      }
      while (v8 + v15 < v14);
    }
    objc_msgSend(v12, "subarrayWithRange:", v15, v14 - v15);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  [v9 addObject:v13];

  return v9;
}

- (id)mediaProvider
{
  uint64_t v2 = [(PUImportPPTDriver *)self importController];
  v3 = [v2 importMediaProvider];

  return v3;
}

- (id)importController
{
  uint64_t v2 = [(PUImportPPTDriver *)self importViewController];
  v3 = [v2 importController];

  return v3;
}

- (id)importViewController
{
  v3 = [(PUImportPPTDriver *)self importViewControllerProvider];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentImportSource);
  int v5 = [v3 importViewControllerForImportSource:WeakRetained];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)ppt_performImportToLibraryWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = _Block_copy(a4);
  id importToLibraryTestReply = self->_importToLibraryTestReply;
  self->_id importToLibraryTestReply = v7;

  id v9 = [v6 objectForKeyedSubscript:@"PUImportPPTDriverAllModelKey"];
  LOBYTE(a4) = [v9 BOOLValue];

  int v10 = [(PUImportPPTDriver *)self modelBatchesForOptions:v6];

  double v11 = [PUImportActionCoordinator alloc];
  dispatch_time_t v12 = [(PUImportPPTDriver *)self importViewController];
  id v13 = [(PUImportPPTDriver *)self importController];
  uint64_t v14 = [(PUImportActionCoordinator *)v11 initWithViewController:v12 importController:v13 loggingSource:0];
  actionCoordinator = self->_actionCoordinator;
  self->_actionCoordinator = v14;

  [(PUImportActionCoordinator *)self->_actionCoordinator setPresentsAdditionalDeleteAllConfirmation:0];
  [(PUImportActionCoordinator *)self->_actionCoordinator setPpt_alwaysImportDuplicatesNoPrompt:1];
  [(PUImportActionCoordinator *)self->_actionCoordinator setDelegate:self];
  int v16 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E5F2DCD0;
  char v20 = (char)a4;
  block[4] = self;
  id v19 = v10;
  id v17 = v10;
  dispatch_async(v16, block);
}

void __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_2;
    block[3] = &unk_1E5F2ED10;
    block[4] = *(void *)(a1 + 32);
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v19;
      id v6 = MEMORY[0x1E4F14428];
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_3;
          v16[3] = &unk_1E5F2E908;
          uint64_t v9 = *(void *)(a1 + 32);
          int v10 = *(void **)(a1 + 40);
          v16[4] = v8;
          v16[5] = v9;
          id v17 = v10;
          dispatch_sync(v6, v16);
          dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
          uint64_t v12 = *(void *)(a1 + 32);
          id v13 = *(void **)(v12 + 80);
          *(void *)(v12 + 80) = v11;

          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 80), 0xFFFFFFFFFFFFFFFFLL);
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v15 = *(void **)(v14 + 80);
          *(void *)(v14 + 80) = 0;

          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v4);
    }
  }
}

uint64_t __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "ppt_beginImportFromBarButtonItem");
}

void __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_4;
        v12[3] = &unk_1E5F25F30;
        v12[4] = *(void *)(a1 + 40);
        v12[5] = v7;
        [v7 performChanges:v12];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_5;
  block[3] = &unk_1E5F2E908;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  id v11 = *(id *)(a1 + 48);
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

void __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 setSelectable:1];
  id v3 = [*(id *)(a1 + 32) importController];
  [v3 selectItem:*(void *)(a1 + 40)];
}

uint64_t __77__PUImportPPTDriver_ppt_performImportToLibraryWithOptions_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) lastObject];
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = v2 == v3;

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 72);
  return objc_msgSend(v4, "ppt_beginImportFromBarButtonItem");
}

- (void)ppt_performThumbnailWithOptions:(id)a3 completionHandler:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importController);

  if (!WeakRetained)
  {
    _PFAssertFailHandler();
    goto LABEL_12;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_dataSourceManager);

  if (!v8)
  {
LABEL_12:
    _PFAssertFailHandler();
    goto LABEL_13;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_mediaProvider);

  if (!v9)
  {
LABEL_13:
    id v17 = (PUImportPPTDriver *)_PFAssertFailHandler();
    [(PUImportPPTDriver *)v17 ppt_performDeleteWithOptions:v19 completionHandler:v20];
    return;
  }
  int8x16_t v10 = _Block_copy(v6);
  id thumbnailTestReply = self->_thumbnailTestReply;
  self->_id thumbnailTestReply = v10;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_double startTime = v12;
  long long v13 = [(PUImportPPTDriver *)self options];
  long long v14 = [v13 objectForKeyedSubscript:@"PUImportPPTDriverThumbnailToFirstKey"];
  if ([v14 BOOLValue])
  {
    long long v15 = [(NSMutableDictionary *)self->_extraResults allValues];
    unint64_t v16 = [v15 count];

    if (v16 >= 2) {
      [(PUImportPPTDriver *)self signalThumbnailTestReply:1];
    }
  }
  else
  {
  }
}

- (void)ppt_performDeleteWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importController);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_dataSourceManager);

    if (v9)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      self->_double startTime = v10;
      id v11 = [(PUImportPPTDriver *)self modelBatchesForOptions:v6];
      double v12 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke;
      block[3] = &unk_1E5F2EBC8;
      id v17 = v11;
      SEL v18 = self;
      id v19 = v7;
      id v13 = v7;
      id v14 = v11;
      dispatch_async(v12, block);

      return;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  uint64_t v15 = _PFAssertFailHandler();
  __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke(v15);
}

void __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    id v6 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        id v9 = [*(id *)(a1 + 32) lastObject];
        BOOL v10 = v8 == v9;

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke_2;
        block[3] = &unk_1E5F2C3E8;
        void block[4] = *(void *)(a1 + 40);
        void block[5] = v8;
        id v11 = v2;
        id v14 = v11;
        BOOL v16 = v10;
        id v15 = *(id *)(a1 + 48);
        dispatch_async(v6, block);
        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

void __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5F25F08;
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 64);
  id v4 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v4;
  [WeakRetained deleteItems:v3 withCompletionHandler:v5];
}

void __68__PUImportPPTDriver_ppt_performDeleteWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (*(unsigned char *)(a1 + 56) && *(void *)(a1 + 48))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v3 = v2 - *(double *)(*(void *)(a1 + 40) + 104);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = [NSNumber numberWithDouble:v3];
    [v5 setObject:v4 forKeyedSubscript:@"Delete all total time"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_removeCurrentImportSourceIfNecessary
{
  p_importController = &self->_importController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importController);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_importController);
    [v5 unregisterChangeObserver:self context:PXImportControllerObserverContext_34940];

    objc_storeWeak((id *)p_importController, 0);
    self->_loadingContentStarted = 0;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_dataSourceManager);

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_dataSourceManager);
    [v7 unregisterChangeObserver:self context:PXImportAssetsDataSourceManagerObserverContext_34941];

    objc_storeWeak((id *)&self->_dataSourceManager, 0);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_mediaProvider);

  if (v8)
  {
    char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:self name:*MEMORY[0x1E4F90F10] object:0];

    objc_storeWeak((id *)&self->_mediaProvider, 0);
  }
  p_currentImportSource = &self->_currentImportSource;
  id v11 = objc_loadWeakRetained((id *)p_currentImportSource);

  if (v11)
  {
    id v14 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v12 = [MEMORY[0x1E4F390E8] sharedInstance];
    id v13 = objc_loadWeakRetained((id *)p_currentImportSource);
    [v14 importController:v12 removedImportSource:v13];

    objc_storeWeak((id *)p_currentImportSource, 0);
  }
}

- (void)ppt_removeImportDataSourceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  [(PUImportPPTDriver *)self _removeCurrentImportSourceIfNecessary];
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    id v5 = v6;
  }
}

- (void)ppt_insertImportDataSourceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v56 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_double startTime = v7;
  id v8 = _Block_copy(v6);
  id insertDatasourceReply = self->_insertDatasourceReply;
  self->_id insertDatasourceReply = v8;

  [(PUImportPPTDriver *)self setOptions:v56];
  [(PUImportPPTDriver *)self _removeCurrentImportSourceIfNecessary];
  BOOL v10 = [v56 objectForKeyedSubscript:@"simulateSource"];
  int v11 = [v10 BOOLValue];

  if (!v11)
  {
    double v12 = [(PUImportPPTDriver *)self importViewController];
    v37 = [v12 importDataSourceManager];
    objc_storeWeak((id *)&self->_dataSourceManager, v37);

    v38 = [(PUImportPPTDriver *)self importController];
    objc_storeWeak((id *)&self->_importController, v38);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceManager);
    if (WeakRetained)
    {
      id v40 = objc_loadWeakRetained((id *)&self->_importController);

      if (v40)
      {
        id v41 = objc_loadWeakRetained((id *)&self->_importController);
        self->_loadingContentStarted = [v41 isLoadingContent];

        id v42 = objc_loadWeakRetained((id *)&self->_importController);
        [v42 registerChangeObserver:self context:PXImportControllerObserverContext_34940];

        id v43 = objc_loadWeakRetained((id *)&self->_dataSourceManager);
        [v43 registerChangeObserver:self context:PXImportAssetsDataSourceManagerObserverContext_34941];

        id v44 = objc_loadWeakRetained((id *)&self->_mediaProvider);
        if (!v44)
        {
          v45 = [(PUImportPPTDriver *)self mediaProvider];
          objc_storeWeak((id *)&self->_mediaProvider, v45);

          id v46 = objc_loadWeakRetained((id *)&self->_mediaProvider);
          if (!v46)
          {
LABEL_29:
            v54 = (PUImportPPTDriver *)_PFAssertFailHandler();
            [(PUImportPPTDriver *)v54 additionalResults];
            return;
          }
          v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v47 addObserver:self selector:sel_ppt_mediaProviderDidProcessAsset_ name:*MEMORY[0x1E4F90F10] object:0];
        }
        v48 = [(PUImportPPTDriver *)self options];
        v49 = [v48 objectForKeyedSubscript:@"PUImportPPTDriverNavigateToImportTabKey"];
        [v49 BOOLValue];

        v50 = [(PUImportPPTDriver *)self options];
        v51 = [v50 objectForKeyedSubscript:@"PUImportPPTDriverReplyWhenMediaProviderReadyKey"];
        int v52 = [v51 BOOLValue];

        if (!v52) {
          goto LABEL_22;
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        self->_endTime = v53;
      }
      [(PUImportPPTDriver *)self signalInsertDatasourceReply:v40 != 0];
      goto LABEL_22;
    }
    _PFAssertFailHandler();
    goto LABEL_26;
  }
  double v12 = [(id)objc_opt_class() importMediaURLs];
  if (![v12 count]) {
    goto LABEL_5;
  }
  id v13 = [(PHImportUrlSource *)[PUImportPPTImportSource alloc] initWithURLs:v12];
  id v14 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v15 = [MEMORY[0x1E4F390E8] sharedInstance];
  [v14 importController:v15 addedImportSource:v13];

  id v16 = [MEMORY[0x1E4F902E0] sharedController];
  long long v17 = [MEMORY[0x1E4F390E8] sharedInstance];
  [v16 importController:v17 addedImportSource:v13];

  objc_storeWeak((id *)&self->_currentImportSource, v13);
  long long v18 = [(PUImportPPTDriver *)self importController];
  objc_storeWeak((id *)&self->_importController, v18);

  id v19 = objc_loadWeakRetained((id *)&self->_importController);
  if (!v19)
  {
LABEL_26:
    _PFAssertFailHandler();
LABEL_27:
    _PFAssertFailHandler();
LABEL_28:
    _PFAssertFailHandler();
    goto LABEL_29;
  }

LABEL_5:
  long long v20 = [(PUImportPPTDriver *)self importViewController];
  id v21 = [v20 importDataSourceManager];
  objc_storeWeak((id *)&self->_dataSourceManager, v21);

  id v22 = objc_loadWeakRetained((id *)&self->_importController);
  if (!v22)
  {
LABEL_12:
    [(PUImportPPTDriver *)self signalInsertDatasourceReply:v22 != 0];
    goto LABEL_13;
  }
  id v23 = objc_loadWeakRetained((id *)&self->_dataSourceManager);

  if (!v23) {
    goto LABEL_27;
  }
  id v24 = objc_loadWeakRetained((id *)&self->_importController);
  self->_loadingContentStarted = [v24 isLoadingContent];

  id v25 = objc_loadWeakRetained((id *)&self->_importController);
  [v25 registerChangeObserver:self context:PXImportControllerObserverContext_34940];

  id v26 = objc_loadWeakRetained((id *)&self->_dataSourceManager);
  [v26 registerChangeObserver:self context:PXImportAssetsDataSourceManagerObserverContext_34941];

  id v27 = objc_loadWeakRetained((id *)&self->_mediaProvider);
  if (v27) {
    goto LABEL_10;
  }
  v28 = [(PUImportPPTDriver *)self mediaProvider];
  objc_storeWeak((id *)&self->_mediaProvider, v28);

  id v29 = objc_loadWeakRetained((id *)&self->_mediaProvider);
  if (!v29) {
    goto LABEL_28;
  }
  v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 addObserver:self selector:sel_ppt_mediaProviderDidProcessAsset_ name:*MEMORY[0x1E4F90F10] object:0];

LABEL_10:
  v31 = [(PUImportPPTDriver *)self options];
  v32 = [v31 objectForKeyedSubscript:@"PUImportPPTDriverNavigateToImportTabKey"];
  [v32 BOOLValue];

  v33 = [(PUImportPPTDriver *)self options];
  v34 = [v33 objectForKeyedSubscript:@"PUImportPPTDriverReplyWhenMediaProviderReadyKey"];
  int v35 = [v34 BOOLValue];

  if (v35)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_endTime = v36;
    goto LABEL_12;
  }
LABEL_13:

LABEL_22:
}

- (NSDictionary)additionalResults
{
  return (NSDictionary *)self->_extraResults;
}

- (PUImportPPTDriver)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUImportPPTDriver;
  double v2 = [(PUImportPPTDriver *)&v6 init];
  if (v2)
  {
    double v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    extraResults = v2->_extraResults;
    v2->_extraResults = v3;
  }
  return v2;
}

+ (NSArray)importMediaURLs
{
  double v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"/Developer/PhotosImport/DCIM"];
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v5 userInterfaceIdiom] == 1) {
    objc_super v6 = @"/Library/Wallpaper/Stills/iPad";
  }
  else {
    objc_super v6 = @"/Library/Wallpaper/Stills/iPhone";
  }
  double v7 = [v4 URLWithString:v6];

  id v8 = [v3 path];
  char v9 = [v2 fileExistsAtPath:v8];

  BOOL v10 = v3;
  if (((v9 & 1) != 0
     || ([v7 path],
         int v11 = objc_claimAutoreleasedReturnValue(),
         int v12 = [v2 fileExistsAtPath:v11],
         v11,
         BOOL v10 = v7,
         v12))
    && (id v13 = v10) != 0)
  {
    id v14 = v13;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    AddFileURLsFromDirectoryWithDepthToArray(v14, 2, v15);

    return (NSArray *)v15;
  }
  else
  {
    long long v17 = (void *)_PFAssertFailHandler();
    AddFileURLsFromDirectoryWithDepthToArray(v17, v18, v19);
  }
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PUImportPPTDriver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_onceToken_35002 != -1) {
    dispatch_once(&sharedInstance_onceToken_35002, block);
  }
  double v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

void __35__PUImportPPTDriver_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;
}

@end