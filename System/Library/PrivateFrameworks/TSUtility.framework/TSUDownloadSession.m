@interface TSUDownloadSession
- (BOOL)hasActiveTaskWithDescription:(id)a3;
- (BOOL)isActive;
- (BOOL)isCancelled;
- (NSString)sessionDescription;
- (TSUDownloadSession)init;
- (TSUDownloadSession)initWithManager:(id)a3 downloadItems:(id)a4 description:(id)a5 willRequestDownload:(BOOL)a6 delegate:(id)a7;
- (TSUProgress)progress;
- (id)description;
- (id)waitUntilTimeout:(unint64_t)a3;
- (int64_t)totalBytesDownloaded;
- (int64_t)totalBytesExpectedToBeDownloaded;
- (void)cancel;
- (void)cancelRemainingTasksNotifyingDelegate:(BOOL)a3;
- (void)dealloc;
- (void)didFinishInitialization;
- (void)headRequestForDownloadItem:(id)a3 taskProgress:(id)a4;
- (void)notifyCompletionWithQueue:(id)a3 completionHandler:(id)a4;
- (void)taskWithDescription:(id)a3 didCompleteWithError:(id)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)taskWithDescription:(id)a3 didWriteData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)updateProgressAndNotifyDelegate;
- (void)updateTaskProgress:(id)a3 withTotalBytesWritten:(int64_t)a4 totalBytesExpectedToWrite:(int64_t)a5;
@end

@implementation TSUDownloadSession

- (TSUDownloadSession)init
{
  v2 = +[TSUAssertionHandler currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSUDownloadSession init]"];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDownloadSession.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:49 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSUDownloadSession init]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)dealloc
{
  if (!self->_didFinishInitialization)
  {
    v3 = +[TSUAssertionHandler currentHandler];
    v4 = [NSString stringWithUTF8String:"-[TSUDownloadSession dealloc]"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDownloadSession.m"];
    uint64_t v6 = NSStringFromSelector(sel_didFinishInitialization);
    [v3 handleFailureInFunction:v4, v5, 57, @"%@ was not called.", v6 file lineNumber description];

    dispatch_group_leave((dispatch_group_t)self->_initializationGroup);
  }
  [(TSUDownloadSession *)self cancelRemainingTasksNotifyingDelegate:0];
  v7.receiver = self;
  v7.super_class = (Class)TSUDownloadSession;
  [(TSUDownloadSession *)&v7 dealloc];
}

- (BOOL)isActive
{
  dispatch_group_wait((dispatch_group_t)self->_initializationGroup, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v3 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (!self->_isCancelled)
  {
    accessQueue = self->_accessQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __30__TSUDownloadSession_isActive__block_invoke;
    v6[3] = &unk_26462A848;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(accessQueue, v6);
    BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __30__TSUDownloadSession_isActive__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)notifyCompletionWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke;
    aBlock[3] = &unk_26462A870;
    aBlock[4] = self;
    id v14 = v6;
    id v15 = v7;
    id v8 = _Block_copy(aBlock);
    if (dispatch_group_wait((dispatch_group_t)self->_initializationGroup, 0))
    {
      initializationGroup = self->_initializationGroup;
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke_3;
      block[3] = &unk_26462A898;
      block[4] = self;
      id v12 = v8;
      dispatch_group_notify(initializationGroup, accessQueue, block);
    }
    else
    {
      dispatch_group_notify((dispatch_group_t)self->_completionGroup, (dispatch_queue_t)self->_accessQueue, v8);
    }
  }
}

void __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_26462A6E0;
  BOOL v3 = *(NSObject **)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  if (dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 88), 0))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v2 = *(void **)(a1 + 40);
    id v4 = *(NSObject **)(v3 + 88);
    id v5 = *(NSObject **)(v3 + 48);
    dispatch_group_notify(v4, v5, v2);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

- (id)waitUntilTimeout:(unint64_t)a3
{
  if (dispatch_group_wait((dispatch_group_t)self->_initializationGroup, a3)
    || dispatch_group_wait((dispatch_group_t)self->_completionGroup, a3))
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1001 userInfo:0];
  }
  else
  {
    uint64_t v9 = 0;
    char v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__4;
    v13 = __Block_byref_object_dispose__4;
    id v14 = 0;
    accessQueue = self->_accessQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__TSUDownloadSession_waitUntilTimeout___block_invoke;
    v8[3] = &unk_26462A848;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(accessQueue, v8);
    id v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  return v5;
}

void __39__TSUDownloadSession_waitUntilTimeout___block_invoke(uint64_t a1)
{
}

- (void)cancel
{
  self->_isCancelled = 1;
  [(NSMutableDictionary *)self->_taskProgress enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7];
  initializationGroup = self->_initializationGroup;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__TSUDownloadSession_cancel__block_invoke_2;
  block[3] = &unk_26462A8E0;
  block[4] = self;
  dispatch_group_async(initializationGroup, accessQueue, block);
}

uint64_t __28__TSUDownloadSession_cancel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setIsActive:0];
}

void __28__TSUDownloadSession_cancel__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    id v3 = (id)[*(id *)(*(void *)(a1 + 32) + 64) copy];
    [*(id *)(a1 + 32) cancelRemainingTasksNotifyingDelegate:1];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [WeakRetained cancelTasksWithDescriptions:v3 forDownloadSession:*(void *)(a1 + 32)];
  }
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)TSUDownloadSession;
  id v4 = [(TSUDownloadSession *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ \"%@\"", v4, self->_sessionDescription];

  return v5;
}

- (TSUDownloadSession)initWithManager:(id)a3 downloadItems:(id)a4 description:(id)a5 willRequestDownload:(BOOL)a6 delegate:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v61.receiver = self;
  v61.super_class = (Class)TSUDownloadSession;
  v16 = [(TSUDownloadSession *)&v61 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_manager, v12);
    objc_storeWeak((id *)&v17->_delegate, v15);
    uint64_t v18 = [v14 copy];
    sessionDescription = v17->_sessionDescription;
    v17->_sessionDescription = (NSString *)v18;

    dispatch_group_t v20 = dispatch_group_create();
    initializationGroup = v17->_initializationGroup;
    v17->_initializationGroup = (OS_dispatch_group *)v20;

    dispatch_group_enter((dispatch_group_t)v17->_initializationGroup);
    dispatch_queue_t v22 = dispatch_queue_create("TSUDownloadManager.Access", 0);
    accessQueue = v17->_accessQueue;
    v17->_accessQueue = (OS_dispatch_queue *)v22;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v24 = [v15 delegateQueueForDownloadSession:v17];
      p_delegateQueue = (id *)&v17->_delegateQueue;
      delegateQueue = v17->_delegateQueue;
      v17->_delegateQueue = (OS_dispatch_queue *)v24;
    }
    else
    {
      p_delegateQueue = (id *)&v17->_delegateQueue;
      delegateQueue = v17->_delegateQueue;
      v17->_delegateQueue = 0;
    }

    if (!*p_delegateQueue) {
      objc_storeStrong(p_delegateQueue, MEMORY[0x263EF83A0]);
    }
    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    remainingTasks = v17->_remainingTasks;
    v17->_remainingTasks = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    taskProgress = v17->_taskProgress;
    v17->_taskProgress = v29;

    dispatch_group_t v31 = dispatch_group_create();
    completionGroup = v17->_completionGroup;
    v17->_completionGroup = (OS_dispatch_group *)v31;

    v33 = [[TSUBasicProgress alloc] initWithMaxValue:1.0];
    progress = v17->_progress;
    v17->_progress = v33;

    id v54 = v12;
    id v51 = v15;
    id v52 = v14;
    if (v8)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = [v15 downloadSessionShouldSendHeadRequestForEstimatedTotalBytes:v17];
      }
      else {
        uint64_t v8 = 0;
      }
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v53 = v13;
    id obj = v13;
    uint64_t v35 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      unint64_t v37 = 0x264629000uLL;
      uint64_t v38 = *(void *)v58;
      v55 = v17;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v58 != v38) {
            objc_enumerationMutation(obj);
          }
          v40 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          id v41 = objc_alloc_init(*(Class *)(v37 + 3216));
          [v41 setIsActive:1];
          objc_msgSend(v41, "setTotalBytesExpectedToBeDownloaded:", objc_msgSend(v40, "totalBytesExpectedToBeDownloaded"));
          if (v8 && ![v41 totalBytesExpectedToBeDownloaded]) {
            [(TSUDownloadSession *)v17 headRequestForDownloadItem:v40 taskProgress:v41];
          }
          v17->_totalBytesExpectedToBeDownloaded += [v41 totalBytesExpectedToBeDownloaded];
          v42 = [v40 downloadTaskDescription];
          if (!v42)
          {
            +[TSUAssertionHandler currentHandler];
            uint64_t v43 = v36;
            uint64_t v44 = v38;
            uint64_t v45 = v8;
            v47 = unint64_t v46 = v37;
            v48 = [NSString stringWithUTF8String:"-[TSUDownloadSession initWithManager:downloadItems:description:willRequestDownload:delegate:]"];
            v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDownloadSession.m"];
            objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, v49, 208, @"invalid nil value for '%s'", "taskDescription");

            unint64_t v37 = v46;
            uint64_t v8 = v45;
            uint64_t v38 = v44;
            uint64_t v36 = v43;
            v17 = v55;
          }
          [(NSMutableSet *)v17->_remainingTasks addObject:v42];
          [(NSMutableDictionary *)v17->_taskProgress setObject:v41 forKeyedSubscript:v42];
          dispatch_group_enter((dispatch_group_t)v17->_completionGroup);
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v36);
    }

    id v13 = v53;
    id v12 = v54;
    id v15 = v51;
    id v14 = v52;
  }

  return v17;
}

- (void)headRequestForDownloadItem:(id)a3 taskProgress:(id)a4
{
  id v5 = a4;
  id v6 = [a3 downloadURL];
  objc_super v7 = v6;
  if (v6 && ([v6 isFileURL] & 1) == 0)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v7];
    [v8 setHTTPMethod:@"HEAD"];
    [v8 setValue:@"close" forHTTPHeaderField:@"Connection"];
    uint64_t v9 = [MEMORY[0x263F08BF8] sharedSession];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__TSUDownloadSession_headRequestForDownloadItem_taskProgress___block_invoke;
    v11[3] = &unk_26462A908;
    id v12 = v5;
    id v10 = (id)[v9 dataTaskWithRequest:v8 completionHandler:v11];
  }
}

uint64_t __62__TSUDownloadSession_headRequestForDownloadItem_taskProgress___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    uint64_t v9 = v6;
    id v6 = (id)[v6 expectedContentLength];
    id v7 = v9;
    if (v6)
    {
      id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "setTotalBytesExpectedToBeDownloaded:", objc_msgSend(v9, "expectedContentLength"));
      id v7 = v9;
    }
  }
  return MEMORY[0x270F9A758](v6, v7);
}

- (void)didFinishInitialization
{
  if (self->_didFinishInitialization)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    id v5 = [NSString stringWithUTF8String:"-[TSUDownloadSession didFinishInitialization]"];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDownloadSession.m"];
    id v7 = NSStringFromSelector(a2);
    [v4 handleFailureInFunction:v5, v6, 238, @"%@ was invoked more than once.", v7 file lineNumber description];
  }
  self->_didFinishInitialization = 1;
  initializationGroup = self->_initializationGroup;
  dispatch_group_leave(initializationGroup);
}

- (BOOL)hasActiveTaskWithDescription:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_taskProgress objectForKeyedSubscript:a3];
  char v4 = [v3 isActive];

  return v4;
}

- (void)taskWithDescription:(id)a3 didCompleteWithError:(id)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    id v12 = [(NSMutableDictionary *)self->_taskProgress objectForKeyedSubscript:v10];
    if (v12)
    {
      [(TSUDownloadSession *)self updateTaskProgress:v12 withTotalBytesWritten:a5 totalBytesExpectedToWrite:a6];
      [v12 setIsActive:0];
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __107__TSUDownloadSession_taskWithDescription_didCompleteWithError_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
      block[3] = &unk_26462A958;
      block[4] = self;
      id v15 = v10;
      id v16 = v11;
      dispatch_async(accessQueue, block);
    }
  }
}

void __107__TSUDownloadSession_taskWithDescription_didCompleteWithError_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 64) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (!*(void *)(v2 + 104))
    {
      objc_storeStrong((id *)(v2 + 104), *(id *)(a1 + 48));
      uint64_t v2 = *(void *)(a1 + 32);
    }
    [*(id *)(v2 + 64) removeObject:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 64) count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v5 = *(id *)(*(void *)(a1 + 32) + 104);
        uint64_t v6 = *(void *)(a1 + 32);
        id v7 = *(NSObject **)(v6 + 88);
        uint64_t v8 = *(NSObject **)(v6 + 56);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __107__TSUDownloadSession_taskWithDescription_didCompleteWithError_totalBytesWritten_totalBytesExpectedToWrite___block_invoke_2;
        v10[3] = &unk_26462A930;
        v10[4] = v6;
        id v11 = v5;
        id v9 = v5;
        dispatch_group_async(v7, v8, v10);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 88));
  }
}

void __107__TSUDownloadSession_taskWithDescription_didCompleteWithError_totalBytesWritten_totalBytesExpectedToWrite___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained downloadSession:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
}

- (void)taskWithDescription:(id)a3 didWriteData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_taskProgress, "objectForKeyedSubscript:", a3, a4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(TSUDownloadSession *)self updateTaskProgress:v9 withTotalBytesWritten:a5 totalBytesExpectedToWrite:a6];
  }
}

- (void)updateTaskProgress:(id)a3 withTotalBytesWritten:(int64_t)a4 totalBytesExpectedToWrite:(int64_t)a5
{
  id v9 = a3;
  if ([v9 isActive])
  {
    if (a4 == a5)
    {
      a5 = a4;
      if ([v9 totalBytesExpectedToBeDownloaded] >= a4)
      {
        a4 = [v9 totalBytesExpectedToBeDownloaded];
        a5 = a4;
      }
    }
    else
    {
      uint64_t v8 = v9;
      if (!a4)
      {
LABEL_7:
        [v8 setTotalBytesExpectedToBeDownloaded:a5];
        [(TSUDownloadSession *)self updateProgressAndNotifyDelegate];
        goto LABEL_8;
      }
    }
    [v9 setTotalBytesDownloaded:a4];
    uint64_t v8 = v9;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateProgressAndNotifyDelegate
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  taskProgress = self->_taskProgress;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__TSUDownloadSession_updateProgressAndNotifyDelegate__block_invoke;
  v12[3] = &unk_26462A980;
  v12[4] = &v17;
  v12[5] = &v13;
  [(NSMutableDictionary *)taskProgress enumerateKeysAndObjectsUsingBlock:v12];
  char v4 = v18;
  self->_totalBytesDownloaded = v18[3];
  id v5 = v14;
  self->_totalBytesExpectedToBeDownloaded = v14[3];
  uint64_t v6 = v5[3];
  if (v6 < 1) {
    double v7 = 0.0;
  }
  else {
    double v7 = (double)v4[3] / (double)v6;
  }
  if (self->_lastProgressValue < v7)
  {
    self->_lastProgressValue = v7;
    -[TSUBasicProgress setValue:](self->_progress, "setValue:");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__TSUDownloadSession_updateProgressAndNotifyDelegate__block_invoke_2;
    block[3] = &unk_26462A9A8;
    block[4] = self;
    void block[5] = &v17;
    block[6] = &v13;
    dispatch_async(delegateQueue, block);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void __53__TSUDownloadSession_updateProgressAndNotifyDelegate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v4 totalBytesDownloaded];
  uint64_t v5 = [v4 totalBytesExpectedToBeDownloaded];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

void __53__TSUDownloadSession_updateProgressAndNotifyDelegate__block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  [WeakRetained downloadSession:a1[4] didDownloadData:*(void *)(*(void *)(a1[5] + 8) + 24) totalBytesExpectedToBeDownloaded:*(void *)(*(void *)(a1[6] + 8) + 24)];
}

- (void)cancelRemainingTasksNotifyingDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NSMutableSet *)self->_remainingTasks count];
  if (v5)
  {
    uint64_t v6 = v5;
    if (self->_error)
    {
      if (v3)
      {
LABEL_6:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          id v11 = self->_error;
          completionGroup = self->_completionGroup;
          delegateQueue = self->_delegateQueue;
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __60__TSUDownloadSession_cancelRemainingTasksNotifyingDelegate___block_invoke;
          v16[3] = &unk_26462A930;
          v16[4] = self;
          uint64_t v17 = v11;
          id v14 = v11;
          dispatch_group_async(completionGroup, delegateQueue, v16);
        }
        goto LABEL_8;
      }
    }
    else
    {
      double v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-999 userInfo:0];
      error = self->_error;
      self->_error = v7;

      if (v3) {
        goto LABEL_6;
      }
    }
    do
    {
LABEL_8:
      dispatch_group_leave((dispatch_group_t)self->_completionGroup);
      --v6;
    }
    while (v6);
  }
  remainingTasks = self->_remainingTasks;
  self->_remainingTasks = 0;
}

void __60__TSUDownloadSession_cancelRemainingTasksNotifyingDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained downloadSession:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
}

- (NSString)sessionDescription
{
  return self->_sessionDescription;
}

- (TSUProgress)progress
{
  return &self->_progress->super;
}

- (int64_t)totalBytesDownloaded
{
  return self->_totalBytesDownloaded;
}

- (int64_t)totalBytesExpectedToBeDownloaded
{
  return self->_totalBytesExpectedToBeDownloaded;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_taskProgress, 0);
  objc_storeStrong((id *)&self->_remainingTasks, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_initializationGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_manager);
}

@end