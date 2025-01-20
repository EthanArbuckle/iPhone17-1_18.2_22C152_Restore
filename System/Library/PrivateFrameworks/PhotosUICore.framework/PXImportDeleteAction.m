@interface PXImportDeleteAction
+ (id)new;
- (BOOL)canDeleteAssets;
- (BOOL)didSucceed;
- (NSError)error;
- (NSProgress)progress;
- (NSString)sessionUuid;
- (PXImportController)importController;
- (PXImportDeleteAction)init;
- (PXImportDeleteAction)initWithAssets:(id)a3;
- (id)performAction;
- (void)_handleDeletionFinished:(id)a3;
- (void)_performMockAction;
- (void)_performRealAction;
- (void)_preAction;
- (void)_startObservingDeleteProgress;
- (void)_stopObservingDeleteProgress;
- (void)cancel;
- (void)dealloc;
- (void)didRemoveAssets:(id)a3;
- (void)finish;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendActionProgress:(double)a3;
- (void)setDidSucceed:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setImportController:(id)a3;
- (void)setProgress:(id)a3;
- (void)start;
@end

@implementation PXImportDeleteAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_importController);
  objc_storeStrong((id *)&self->_sessionUuid, 0);
  objc_storeStrong((id *)&self->_removedAssets, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setImportController:(id)a3
{
}

- (PXImportController)importController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importController);
  return (PXImportController *)WeakRetained;
}

- (NSString)sessionUuid
{
  return self->_sessionUuid;
}

- (void)sendActionProgress:(double)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v15[0] = @"PXImportControllerFractionCompleted";
  v4 = [NSNumber numberWithDouble:a3];
  v16[0] = v4;
  v15[1] = @"PXImportControllerCompletedItemCount";
  v5 = NSNumber;
  progress = self->_progress;
  if (progress) {
    uint64_t v7 = [(NSProgress *)progress completedUnitCount];
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [v5 numberWithLongLong:v7];
  v16[1] = v8;
  v15[2] = @"PXImportControllerTotalItemCount";
  v9 = NSNumber;
  v10 = self->_progress;
  if (v10) {
    uint64_t v11 = [(NSProgress *)v10 totalUnitCount];
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = [v9 numberWithLongLong:v11];
  v16[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"PXImportControllerProgressNotification" object:self userInfo:v13];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  id v12 = v8;
  px_dispatch_on_main_queue_sync();
}

id __71__PXImportDeleteAction_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(_UNKNOWN ***)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  if (v2 == &PXImportDeleteObserverFractionCompletedContext)
  {
    id v8 = [v3 progress];
    [v8 fractionCompleted];
    double v10 = v9;

    id v11 = _importDataLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = v10 * 100.0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Delete action: Progress %.1f%%", buf, 0xCu);
    }

    return (id)[*(id *)(a1 + 32) sendActionProgress:v10];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    v12.receiver = v3;
    v12.super_class = (Class)PXImportDeleteAction;
    return objc_msgSendSuper2(&v12, sel_observeValueForKeyPath_ofObject_change_context_, v4, v5, v6);
  }
}

- (void)_stopObservingDeleteProgress
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  progress = self->_progress;
  if (progress)
  {
    [(NSProgress *)progress removeObserver:self forKeyPath:@"fractionCompleted" context:&PXImportDeleteObserverFractionCompletedContext];
    [(PXImportDeleteAction *)self sendActionProgress:0.0];
  }
}

- (void)_startObservingDeleteProgress
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSProgress *)self->_progress fractionCompleted];
  -[PXImportDeleteAction sendActionProgress:](self, "sendActionProgress:");
  progress = self->_progress;
  [(NSProgress *)progress addObserver:self forKeyPath:@"fractionCompleted" options:0 context:&PXImportDeleteObserverFractionCompletedContext];
}

- (void)didRemoveAssets:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  removedAssets = self->_removedAssets;
  if (!removedAssets)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_removedAssets;
    self->_removedAssets = v6;

    removedAssets = self->_removedAssets;
  }
  [(NSMutableArray *)removedAssets addObjectsFromArray:v4];
  NSUInteger v8 = [(NSArray *)self->_assets count];
  if (v8 == [(NSMutableArray *)self->_removedAssets count])
  {
    double v9 = _importDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v10 = [(NSArray *)self->_assets count];
      int v11 = 136446466;
      objc_super v12 = "-[PXImportDeleteAction didRemoveAssets:]";
      __int16 v13 = 2048;
      NSUInteger v14 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}s] All %tu assets removed. Finishing delete action.", (uint8_t *)&v11, 0x16u);
    }

    [(PXImportDeleteAction *)self finish];
  }
}

- (void)_performMockAction
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v4 = [(NSArray *)self->_assets count];
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[PXImportDeleteAction _performMockAction]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s] will (mock) delete %lu", buf, 0x16u);
  }

  uint64_t v5 = [(PXImportDeleteAction *)self importController];
  if (!v5) {
    _PFAssertContinueHandler();
  }

  uint64_t v6 = [(PXImportDeleteAction *)self importController];
  v26 = [v6 importSource];

  if (!v26) {
    _PFAssertContinueHandler();
  }
  uint64_t v7 = [(PXImportDeleteAction *)self importController];
  if (([v7 conformsToProtocol:&unk_1F038C4A8] & 1) == 0) {
    _PFAssertContinueHandler();
  }

  v25 = [(PXImportDeleteAction *)self importController];
  NSUInteger v8 = [(NSArray *)self->_assets count];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v36 = 0;
  double v9 = [(PXImportDeleteAction *)self progress];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", -[NSArray count](self->_assets, "count"));
    [(PXImportDeleteAction *)self setProgress:v11];
  }
  objc_super v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  unint64_t v15 = (uint64_t)fmin((double)(v8 / 5), 50.0);
  unint64_t v24 = v15;
  do
  {
    if (!v12) {
      objc_super v12 = objc_opt_new();
    }
    v16 = [(NSArray *)self->_assets objectAtIndex:v14];
    [v12 addObject:v16];
    v17 = [(NSArray *)self->_assets lastObject];

    if ([v12 count] >= v15 || v16 == v17)
    {
      if ([v12 count])
      {
        v18 = (void *)[v12 copy];
        uint64_t v27 = v13 + 1;
        dispatch_time_t v19 = dispatch_time(0, 1000000000 * (v13 + 1));
        v20 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __42__PXImportDeleteAction__performMockAction__block_invoke;
        block[3] = &unk_1E5DAF660;
        id v29 = v18;
        BOOL v34 = v16 == v17;
        id v30 = v25;
        id v21 = v26;
        v32 = self;
        v33 = buf;
        id v31 = v21;
        id v22 = v18;
        dispatch_time_t v23 = v19;
        uint64_t v13 = v27;
        dispatch_after(v23, v20, block);

        unint64_t v15 = v24;
        objc_super v12 = 0;
      }
    }

    ++v14;
  }
  while (v16 != v17);

  _Block_object_dispose(buf, 8);
}

void __42__PXImportDeleteAction__performMockAction__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _importDataLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v4 = *(unsigned __int8 *)(a1 + 72);
    *(_DWORD *)buf = 134218240;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Fake delete of %lu items (done=%d)", buf, 0x12u);
  }

  [*(id *)(a1 + 40) importSource:*(void *)(a1 + 48) didRemoveAssets:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [*(id *)(a1 + 32) count];
  px_dispatch_on_main_queue_sync();
}

void __42__PXImportDeleteAction__performMockAction__block_invoke_43(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v2 = [*(id *)(a1 + 32) progress];
  [v2 setCompletedUnitCount:v1];
}

- (void)_handleDeletionFinished:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _importDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    __int16 v7 = "-[PXImportDeleteAction _handleDeletionFinished:]";
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[%s] did delete completed", (uint8_t *)&v6, 0xCu);
  }

  [(PXImportDeleteAction *)self setProgress:0];
  [(PXImportDeleteAction *)self setDidSucceed:v4 == 0];
  [(PXImportDeleteAction *)self setError:v4];
}

- (void)_performRealAction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v4 = [(NSArray *)self->_assets count];
    *(_DWORD *)buf = 136446466;
    objc_super v12 = "-[PXImportDeleteAction _performRealAction]";
    __int16 v13 = 2048;
    NSUInteger v14 = v4;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s] will delete %lu", buf, 0x16u);
  }

  if ([(NSArray *)self->_assets count])
  {
    uint64_t v5 = [(PXImportDeleteAction *)self importController];
    int v6 = [v5 importSource];

    if (!v6) {
      _PFAssertContinueHandler();
    }
    objc_initWeak((id *)buf, self);
    assets = self->_assets;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__PXImportDeleteAction__performRealAction__block_invoke;
    v9[3] = &unk_1E5DD0DB8;
    objc_copyWeak(&v10, (id *)buf);
    uint64_t v8 = [v6 deleteImportAssets:assets isConfirmed:1 atEnd:v9];
    [(PXImportDeleteAction *)self setProgress:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __42__PXImportDeleteAction__performRealAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleDeletionFinished:v3];
}

- (void)_preAction
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXImportDeleteAction *)self sessionUuid];
  NSUInteger v4 = [(PXImportDeleteAction *)self importController];
  uint64_t v5 = [v4 dataSourceManager];
  int v6 = [v5 dataSource];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_assets;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = [*(id *)(*((void *)&v16 + 1) + 8 * v10) uuid];
        objc_super v12 = [v6 itemForImportAssetUuid:v11];

        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __34__PXImportDeleteAction__preAction__block_invoke;
        v14[3] = &unk_1E5DC6688;
        id v15 = v3;
        [v12 performChanges:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

uint64_t __34__PXImportDeleteAction__preAction__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeleteSession:*(void *)(a1 + 32)];
}

- (BOOL)canDeleteAssets
{
  id v2 = +[PXImportSettings sharedInstance];
  char v3 = [v2 disableAssetDeletion] ^ 1;

  return v3;
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "-[PXImportDeleteAction cancel]";
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[%s] Cancel delete action", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PXImportDeleteAction;
  [(PXImportDeleteAction *)&v4 cancel];
}

- (id)performAction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = _importDataLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = "-[PXImportDeleteAction performAction]";
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "[%s] Performing delete action", buf, 0xCu);
  }

  px_dispatch_on_main_queue_sync();
}

uint64_t __37__PXImportDeleteAction_performAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preAction];
}

- (void)finish
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[PXImportDeleteAction finish]";
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[%s] Finish delete action", buf, 0xCu);
  }

  [(PXImportDeleteAction *)self setProgress:0];
  v4.receiver = self;
  v4.super_class = (Class)PXImportDeleteAction;
  [(PXImportConcurrentAction *)&v4 finish];
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v4 = [(NSArray *)self->_assets count];
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[PXImportDeleteAction start]";
    __int16 v8 = 2048;
    NSUInteger v9 = v4;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[%s] Starting delete action with %tu assets", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)PXImportDeleteAction;
  [(PXImportConcurrentAction *)&v5 start];
}

- (void)setProgress:(id)a3
{
  id v3 = a3;
  px_dispatch_on_main_queue_sync();
}

void *__36__PXImportDeleteAction_setProgress___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[38] != *(void *)(a1 + 40))
  {
    [result _stopObservingDeleteProgress];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 304), *(id *)(a1 + 40));
    id v3 = *(void **)(a1 + 32);
    return (void *)[v3 _startObservingDeleteProgress];
  }
  return result;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[PXImportDeleteAction dealloc]";
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "[%s]", buf, 0xCu);
  }

  [(PXImportDeleteAction *)self setProgress:0];
  v4.receiver = self;
  v4.super_class = (Class)PXImportDeleteAction;
  [(PXImportDeleteAction *)&v4 dealloc];
}

- (PXImportDeleteAction)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportDeleteAction.m", 45, @"%s is not available as initializer", "-[PXImportDeleteAction init]");

  abort();
}

- (PXImportDeleteAction)initWithAssets:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXImportDeleteAction;
  objc_super v5 = [(PXImportDeleteAction *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;

    __int16 v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    sessionUuid = v5->_sessionUuid;
    v5->_sessionUuid = (NSString *)v9;
  }
  return v5;
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXImportDeleteAction.m", 49, @"%s is not available as initializer", "+[PXImportDeleteAction new]");

  abort();
}

@end