@interface VUIMediaLibraryFetchController
+ (id)_logStringWithFetchControllers:(id)a3;
- (BOOL)_shouldFetchForMediaLibraryRevision:(unint64_t)a3;
- (BOOL)_updateMutableArray:(id)a3 withLatestObjects:(id)a4 changeSet:(id)a5 updateOnNoChanges:(BOOL)a6;
- (NSOperation)fetchOperation;
- (NSOperationQueue)serialFetchOperationQueue;
- (NSString)identifier;
- (NSString)logName;
- (NSString)logNameSuffix;
- (OS_dispatch_queue)serialProcessingDispatchQueue;
- (VUIMediaLibrary)mediaLibrary;
- (VUIMediaLibraryFetchController)init;
- (VUIMediaLibraryFetchController)initWithMediaLibrary:(id)a3;
- (id)_fetchOperationForFetchReason:(int64_t)a3;
- (int64_t)state;
- (unint64_t)mediaLibraryRevision;
- (unint64_t)pauseCount;
- (void)_cancelFetch;
- (void)_didCompleteFetchOperation:(id)a3;
- (void)_enqueueAsyncProcessingQueueBlock:(id)a3;
- (void)_enqueueFetchWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)_enqueueProcessingQueueBlock:(id)a3 synchronous:(BOOL)a4;
- (void)_enqueueSyncProcessingQueueBlock:(id)a3;
- (void)_fetchOperationCompleted:(id)a3 withCompletionHandler:(id)a4;
- (void)_moveToPausedState;
- (void)_startFetchIfNeededWithMediaLibraryRevision:(unint64_t)a3 completionHandler:(id)a4;
- (void)_startFetchWithCompletionHandler:(id)a3;
- (void)beginFetchWithMediaLibraryRevision:(unint64_t)a3 completionHandler:(id)a4 completionQueue:(id)a5;
- (void)cancelFetch;
- (void)pause;
- (void)resume;
- (void)setFetchOperation:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLogName:(id)a3;
- (void)setLogNameSuffix:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setMediaLibraryRevision:(unint64_t)a3;
- (void)setPauseCount:(unint64_t)a3;
- (void)setSerialFetchOperationQueue:(id)a3;
- (void)setSerialProcessingDispatchQueue:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation VUIMediaLibraryFetchController

- (VUIMediaLibraryFetchController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaLibraryFetchController)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIMediaLibraryFetchController;
  v6 = [(VUIMediaLibraryFetchController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    v7->_mediaLibraryRevision = 0;
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.VideosUI.VUIMediaLibraryFetchController.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v7->_serialProcessingDispatchQueue;
    v7->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    serialFetchOperationQueue = v7->_serialFetchOperationQueue;
    v7->_serialFetchOperationQueue = v13;

    [(NSOperationQueue *)v7->_serialFetchOperationQueue setMaxConcurrentOperationCount:1];
  }

  return v7;
}

- (NSString)logNameSuffix
{
  logNameSuffix = self->_logNameSuffix;
  if (!logNameSuffix)
  {
    self->_logNameSuffix = (NSString *)&stru_1F3E921E0;

    logNameSuffix = self->_logNameSuffix;
  }
  return logNameSuffix;
}

- (NSString)logName
{
  logName = self->_logName;
  if (!logName)
  {
    uint64_t v4 = NSString;
    id v5 = [(VUIMediaLibraryFetchController *)self mediaLibrary];
    v6 = [v5 title];
    v7 = [(VUIMediaLibraryFetchController *)self logNameSuffix];
    v8 = [v4 stringWithFormat:@"%p-%@-%@", self, v6, v7];
    uint64_t v9 = self->_logName;
    self->_logName = v8;

    logName = self->_logName;
  }
  return logName;
}

- (void)pause
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__VUIMediaLibraryFetchController_pause__block_invoke;
  v2[3] = &unk_1E6DF93D8;
  v2[4] = self;
  [(VUIMediaLibraryFetchController *)self _enqueueSyncProcessingQueueBlock:v2];
}

void __39__VUIMediaLibraryFetchController_pause__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if (!v4)
  {
LABEL_7:
    v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v3 logName];
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "[%@] - Received pause request while in the ready state. Will move to paused state", (uint8_t *)&v12, 0xCu);
    }
    [v3 _moveToPausedState];
    goto LABEL_13;
  }
  if (v4 != 2)
  {
    if (v4 != 1) {
      goto LABEL_13;
    }
    id v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [v3 logName];
      int v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "[%@] - Received pause request while fetching. Will cancel fetch and move to paused state", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) _cancelFetch];
    [*(id *)(a1 + 32) _moveToPausedState];
    goto LABEL_7;
  }
  uint64_t v9 = [v3 pauseCount] + 1;
  [v3 setPauseCount:v9];
  v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v11 = [v3 logName];
    int v12 = 138412546;
    v13 = v11;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "[%@] - Received pause request while already in the puased state. Incremented paused count [%lu]", (uint8_t *)&v12, 0x16u);
  }
LABEL_13:
}

- (void)resume
{
}

void __40__VUIMediaLibraryFetchController_resume__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 state];
  switch(v3)
  {
    case 0:
      v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v2 logName];
        int v12 = 138412290;
        v13 = v9;
        v10 = "[%@] - Ignoring resume request for fetch controller as it is in the ready state";
LABEL_12:
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
      }
LABEL_15:

      break;
    case 1:
      v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v2 logName];
        int v12 = 138412290;
        v13 = v9;
        v10 = "[%@] - Ignoring resume request for fetch controller as it is fetching";
        goto LABEL_12;
      }
      goto LABEL_15;
    case 2:
      uint64_t v4 = [v2 pauseCount];
      if (!v4)
      {
        v6 = VUIDefaultLogObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __40__VUIMediaLibraryFetchController_resume__block_invoke_cold_1(v2, v6);
        }
        goto LABEL_15;
      }
      uint64_t v5 = v4 - 1;
      [v2 setPauseCount:v4 - 1];
      v6 = VUIDefaultLogObject();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          v8 = [v2 logName];
          int v12 = 138412546;
          v13 = v8;
          __int16 v14 = 2048;
          uint64_t v15 = v5;
          _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Decremented pause count for fetch controller. Decremented Count [%lu]", (uint8_t *)&v12, 0x16u);
        }
        goto LABEL_15;
      }
      if (v7)
      {
        dispatch_queue_t v11 = [v2 logName];
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Returning fetch controller to the ready state", (uint8_t *)&v12, 0xCu);
      }
      [v2 setState:0];
      break;
  }
}

- (void)beginFetchWithMediaLibraryRevision:(unint64_t)a3 completionHandler:(id)a4 completionQueue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"completionHandler" format];
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"completionQueue" format];
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke;
  aBlock[3] = &unk_1E6DF9448;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a3;
  id v11 = v10;
  id v19 = v11;
  id v12 = v8;
  id v20 = v12;
  v13 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke_23;
  v15[3] = &unk_1E6DF9470;
  id v14 = v13;
  id v16 = v14;
  unint64_t v17 = a3;
  [(VUIMediaLibraryFetchController *)self _enqueueSyncProcessingQueueBlock:v15];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2) {
      [WeakRetained setMediaLibraryRevision:*(void *)(a1 + 56)];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke_2;
    v9[3] = &unk_1E6DF9420;
    v9[4] = v7;
    id v8 = *(NSObject **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = a2;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

uint64_t __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) logName];
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "[%@] - Calling completion handler", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if (v4)
  {
    if (v4 == 1)
    {
      int v5 = VUIDefaultLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v3 logName];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "[%@] - Received begin fetch request for a controller that is already fetching. Will ignore", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_12;
    }
    if (v4 == 2)
    {
      int v5 = VUIDefaultLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [v3 logName];
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "[%@] - Ignoring begin fetch request as the controller is paused", (uint8_t *)&v10, 0xCu);
      }
LABEL_12:

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    uint64_t v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 logName];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "[%@] - Received begin fetch request for a controller that is in the ready state. Will start new fetch if required", (uint8_t *)&v10, 0xCu);
    }
    [v3 _startFetchIfNeededWithMediaLibraryRevision:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 32)];
  }
}

- (void)cancelFetch
{
}

uint64_t __45__VUIMediaLibraryFetchController_cancelFetch__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _cancelFetch];
}

+ (id)_logStringWithFetchControllers:(id)a3
{
  id v3 = [a3 valueForKey:@"logName"];
  uint64_t v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

- (id)_fetchOperationForFetchReason:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  int v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ method needs to be override by a subclass.", v5 format];

  id v6 = objc_alloc_init(MEMORY[0x1E4F28F00]);
  return v6;
}

- (void)_didCompleteFetchOperation:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"The %@ method needs to be override by a subclass.", v5 format];
}

- (BOOL)_updateMutableArray:(id)a3 withLatestObjects:(id)a4 changeSet:(id)a5 updateOnNoChanges:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    objc_msgSend(v9, "vui_applyChangeSet:destinationObjects:", v11, v10);
LABEL_5:
    LOBYTE(v6) = 1;
    goto LABEL_6;
  }
  if (v6)
  {
    [v9 removeAllObjects];
    [v9 addObjectsFromArray:v10];
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (BOOL)_shouldFetchForMediaLibraryRevision:(unint64_t)a3
{
  return [(VUIMediaLibraryFetchController *)self mediaLibraryRevision] != a3;
}

- (void)_moveToPausedState
{
  [(VUIMediaLibraryFetchController *)self setState:2];
  [(VUIMediaLibraryFetchController *)self setPauseCount:1];
}

- (void)_cancelFetch
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(VUIMediaLibraryFetchController *)self logName];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "[%@] - Cancelling fetch", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(VUIMediaLibraryFetchController *)self fetchOperation];
  [(VUIMediaLibraryFetchController *)self setFetchOperation:0];
  [v5 cancel];
}

- (void)_startFetchIfNeededWithMediaLibraryRevision:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(VUIMediaLibraryFetchController *)self _shouldFetchForMediaLibraryRevision:a3];
  uint64_t v8 = VUIDefaultLogObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = [(VUIMediaLibraryFetchController *)self logName];
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "[%@] - Starting fetch", (uint8_t *)&v12, 0xCu);
    }
    [(VUIMediaLibraryFetchController *)self _startFetchWithCompletionHandler:v6];

    [(VUIMediaLibraryFetchController *)self setState:1];
  }
  else
  {
    if (v9)
    {
      id v11 = [(VUIMediaLibraryFetchController *)self logName];
      int v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "[%@] - New fetch not required as the library contents have not changed", (uint8_t *)&v12, 0xCu);
    }
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 2, 0);
  }
}

- (void)_startFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(VUIMediaLibraryFetchController *)self _enqueueFetchWithReason:[(VUIMediaLibraryFetchController *)self mediaLibraryRevision] != 0 completionHandler:v4];
}

- (void)_enqueueFetchWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(VUIMediaLibraryFetchController *)self _fetchOperationForFetchReason:a3];
  [(VUIMediaLibraryFetchController *)self setFetchOperation:v7];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28B48]);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __76__VUIMediaLibraryFetchController__enqueueFetchWithReason_completionHandler___block_invoke;
  uint64_t v15 = &unk_1E6DF9498;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  id v17 = v10;
  [v8 addExecutionBlock:&v12];
  objc_msgSend(v8, "addDependency:", v9, v12, v13, v14, v15);
  id v11 = [(VUIMediaLibraryFetchController *)self serialFetchOperationQueue];
  [v11 addOperation:v9];
  [v11 addOperation:v8];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __76__VUIMediaLibraryFetchController__enqueueFetchWithReason_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2) {
    [WeakRetained _fetchOperationCompleted:*(void *)(a1 + 32) withCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (void)_fetchOperationCompleted:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__VUIMediaLibraryFetchController__fetchOperationCompleted_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E6DF94C0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(VUIMediaLibraryFetchController *)self _enqueueSyncProcessingQueueBlock:v10];
}

void __81__VUIMediaLibraryFetchController__fetchOperationCompleted_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 fetchOperation];

  id v6 = VUIDefaultLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4 == v5)
  {
    if (v7)
    {
      id v10 = [v3 logName];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Fetch completed. Will process results and move to ready state", (uint8_t *)&v11, 0xCu);
    }
    [v3 _didCompleteFetchOperation:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [v3 setState:0];
  }
  else
  {
    if (v7)
    {
      id v8 = [v3 logName];
      id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "state"));
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Fetch completed but was cancelled. Will not process results but will remain in current state (%@) and call completion handler", (uint8_t *)&v11, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_enqueueProcessingQueueBlock:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = v6;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__VUIMediaLibraryFetchController__enqueueProcessingQueueBlock_synchronous___block_invoke;
    v11[3] = &unk_1E6DF94E8;
    id v8 = &v12;
    id v12 = v6;
    [(VUIMediaLibraryFetchController *)self _enqueueSyncProcessingQueueBlock:v11];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__VUIMediaLibraryFetchController__enqueueProcessingQueueBlock_synchronous___block_invoke_2;
    v9[3] = &unk_1E6DF94E8;
    id v8 = &v10;
    id v10 = v6;
    [(VUIMediaLibraryFetchController *)self _enqueueAsyncProcessingQueueBlock:v9];
  }
}

uint64_t __75__VUIMediaLibraryFetchController__enqueueProcessingQueueBlock_synchronous___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__VUIMediaLibraryFetchController__enqueueProcessingQueueBlock_synchronous___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_enqueueAsyncProcessingQueueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMediaLibraryFetchController *)self serialProcessingDispatchQueue];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VUIMediaLibraryFetchController__enqueueAsyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __68__VUIMediaLibraryFetchController__enqueueAsyncProcessingQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_enqueueSyncProcessingQueueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMediaLibraryFetchController *)self serialProcessingDispatchQueue];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VUIMediaLibraryFetchController__enqueueSyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__VUIMediaLibraryFetchController__enqueueSyncProcessingQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setLogName:(id)a3
{
}

- (void)setLogNameSuffix:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
}

- (NSOperationQueue)serialFetchOperationQueue
{
  return self->_serialFetchOperationQueue;
}

- (void)setSerialFetchOperationQueue:(id)a3
{
}

- (NSOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
}

- (unint64_t)mediaLibraryRevision
{
  return self->_mediaLibraryRevision;
}

- (void)setMediaLibraryRevision:(unint64_t)a3
{
  self->_mediaLibraryRevision = a3;
}

- (unint64_t)pauseCount
{
  return self->_pauseCount;
}

- (void)setPauseCount:(unint64_t)a3
{
  self->_pauseCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_serialFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_logNameSuffix, 0);
  objc_storeStrong((id *)&self->_logName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

void __40__VUIMediaLibraryFetchController_resume__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 logName];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "[%@] - Received resume request when we are in the paused state but we have a zero pause count! Ignoring", (uint8_t *)&v4, 0xCu);
}

@end