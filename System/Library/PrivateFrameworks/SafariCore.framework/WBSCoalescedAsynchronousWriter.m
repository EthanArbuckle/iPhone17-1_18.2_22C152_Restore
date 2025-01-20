@interface WBSCoalescedAsynchronousWriter
- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceBlock:(id)a5;
- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceBlock:(id)a5 writeDelayInterval:(double)a6;
- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6;
- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6 fileResourceValues:(id)a7;
- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 plistFormat:(unint64_t)a6 plistDictionarySourceBlock:(id)a7;
- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceBlock:(id)a5;
- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6;
- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceQueue:(id)a5 plistFormat:(unint64_t)a6 plistDictionarySourceBlock:(id)a7;
- (WBSCoalescedAsynchronousWriterDelegate)delegate;
- (id).cxx_construct;
- (id)_dataForPlistDictionary:(id)a3;
- (id)_dataFromDataSourceOnDataSourceQueue;
- (id)_initWithName:(id)a3 fileURL:(id)a4 writerBlock:(id)a5 dataSourceQueue:(id)a6 dataSourceBlock:(id)a7 plistDictionarySourceBlock:(id)a8 plistFormat:(unint64_t)a9 writeDelayInterval:(double)a10 fileResourceValues:(id)a11;
- (id)_initWithName:(id)a3 fileURL:(id)a4 writerBlock:(id)a5 dataSourceQueue:(id)a6 dataSourceBlock:(id)a7 writeDelayInterval:(double)a8 fileResourceValues:(id)a9;
- (id)_plistDictionaryFromDataSourceOnDataSourceQueue;
- (id)_synchronousDataOnDataSourceQueue;
- (void)_asynchronouslyWriteData:(id)a3 orPlistDictionary:(id)a4 completionHandler:(id)a5;
- (void)_cancelPendingWriteSynchronouslyLeavingSuddenTerminationIntact;
- (void)_invalidateTimer;
- (void)_scheduleTimer;
- (void)_timerFired;
- (void)_waitForWriteCompletion;
- (void)_writeData:(id)a3;
- (void)cancelPendingWriteSynchronously;
- (void)completePendingWriteSynchronously;
- (void)dealloc;
- (void)performScheduledWriteSynchronously;
- (void)scheduleWrite;
- (void)setDelegate:(id)a3;
- (void)startScheduledWriteNow;
- (void)startScheduledWriteNowWithCompletionHandler:(id)a3;
@end

@implementation WBSCoalescedAsynchronousWriter

- (id)_initWithName:(id)a3 fileURL:(id)a4 writerBlock:(id)a5 dataSourceQueue:(id)a6 dataSourceBlock:(id)a7 plistDictionarySourceBlock:(id)a8 plistFormat:(unint64_t)a9 writeDelayInterval:(double)a10 fileResourceValues:(id)a11
{
  id v18 = a3;
  id v45 = a4;
  id v19 = a5;
  id v44 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a11;
  v46.receiver = self;
  v46.super_class = (Class)WBSCoalescedAsynchronousWriter;
  v23 = [(WBSCoalescedAsynchronousWriter *)&v46 init];
  v24 = v23;
  if (v23)
  {
    uint64_t v25 = [v18 copy];
    name = v23->_name;
    v23->_name = (NSString *)v25;

    id v27 = [NSString stringWithFormat:@"com.apple.Safari.CoalescedAsynchronousWriter.%p.%@.DiskAccessQueue", v23, v18, v44, v45];
    dispatch_queue_t v28 = dispatch_queue_create((const char *)[v27 UTF8String], 0);
    diskAccessQueue = v23->_diskAccessQueue;
    v23->_diskAccessQueue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v23->_fileURL, a4);
    uint64_t v30 = [v20 copy];
    id dataSourceBlock = v23->_dataSourceBlock;
    v23->_id dataSourceBlock = (id)v30;

    uint64_t v32 = [v21 copy];
    id plistDictionarySourceBlock = v23->_plistDictionarySourceBlock;
    v23->_id plistDictionarySourceBlock = (id)v32;

    v23->_plistFormat = a9;
    p_dataSourceQueue = (id *)&v23->_dataSourceQueue;
    objc_storeStrong(p_dataSourceQueue, a6);
    if (!v24->_dataSourceQueue) {
      objc_storeStrong(p_dataSourceQueue, MEMORY[0x1E4F14428]);
    }
    uint64_t v35 = [v19 copy];
    id writerBlock = v24->_writerBlock;
    v24->_id writerBlock = (id)v35;

    id v37 = [NSString stringWithFormat:@"com.apple.Safari.CoalescedAsynchronousWriter.%p.%@.InternalQueue", v24, v18];
    dispatch_queue_t v38 = dispatch_queue_create((const char *)[v37 UTF8String], 0);
    internalQueue = v24->_internalQueue;
    v24->_internalQueue = (OS_dispatch_queue *)v38;

    v24->_writeDelayInterval = a10;
    uint64_t v40 = [v22 copy];
    fileResourceValues = v24->_fileResourceValues;
    v24->_fileResourceValues = (NSDictionary *)v40;

    v42 = v24;
  }

  return v24;
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  return self;
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6
{
  return (WBSCoalescedAsynchronousWriter *)[(WBSCoalescedAsynchronousWriter *)self _initWithName:a3 fileURL:a4 writerBlock:0 dataSourceQueue:a5 dataSourceBlock:a6 writeDelayInterval:0 fileResourceValues:10.0];
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 plistFormat:(unint64_t)a6 plistDictionarySourceBlock:(id)a7
{
  return (WBSCoalescedAsynchronousWriter *)[(WBSCoalescedAsynchronousWriter *)self _initWithName:a3 fileURL:a4 writerBlock:0 dataSourceQueue:a5 dataSourceBlock:0 plistDictionarySourceBlock:a7 plistFormat:10.0 writeDelayInterval:a6 fileResourceValues:0];
}

- (id)_initWithName:(id)a3 fileURL:(id)a4 writerBlock:(id)a5 dataSourceQueue:(id)a6 dataSourceBlock:(id)a7 writeDelayInterval:(double)a8 fileResourceValues:(id)a9
{
  return [(WBSCoalescedAsynchronousWriter *)self _initWithName:a3 fileURL:a4 writerBlock:a5 dataSourceQueue:a6 dataSourceBlock:a7 plistDictionarySourceBlock:0 plistFormat:a8 writeDelayInterval:200 fileResourceValues:a9];
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6 fileResourceValues:(id)a7
{
  return (WBSCoalescedAsynchronousWriter *)[(WBSCoalescedAsynchronousWriter *)self _initWithName:a3 fileURL:a4 writerBlock:0 dataSourceQueue:a5 dataSourceBlock:a6 writeDelayInterval:a7 fileResourceValues:10.0];
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceBlock:(id)a5
{
  return [(WBSCoalescedAsynchronousWriter *)self initWithName:a3 fileURL:a4 dataSourceQueue:MEMORY[0x1E4F14428] dataSourceBlock:a5];
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceBlock:(id)a5 writeDelayInterval:(double)a6
{
  return (WBSCoalescedAsynchronousWriter *)[(WBSCoalescedAsynchronousWriter *)self _initWithName:a3 fileURL:a4 writerBlock:0 dataSourceQueue:MEMORY[0x1E4F14428] dataSourceBlock:a5 writeDelayInterval:0 fileResourceValues:a6];
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceBlock:(id)a5
{
  return [(WBSCoalescedAsynchronousWriter *)self initWithName:a3 writerBlock:a4 dataSourceQueue:MEMORY[0x1E4F14428] dataSourceBlock:a5];
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6
{
  return (WBSCoalescedAsynchronousWriter *)[(WBSCoalescedAsynchronousWriter *)self _initWithName:a3 fileURL:0 writerBlock:a4 dataSourceQueue:a5 dataSourceBlock:a6 writeDelayInterval:0 fileResourceValues:10.0];
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceQueue:(id)a5 plistFormat:(unint64_t)a6 plistDictionarySourceBlock:(id)a7
{
  return (WBSCoalescedAsynchronousWriter *)[(WBSCoalescedAsynchronousWriter *)self _initWithName:a3 fileURL:0 writerBlock:a4 dataSourceQueue:a5 dataSourceBlock:0 plistDictionarySourceBlock:a7 plistFormat:10.0 writeDelayInterval:a6 fileResourceValues:0];
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1B728F000, v0, OS_LOG_TYPE_ERROR, "WBSCoalescedAsynchronousWriter <%{public}@, %p>: Writer is not properly cleaned up before deallocation", v1, 0x16u);
}

- (void)_invalidateTimer
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)_timerFired
{
  [(WBSCoalescedAsynchronousWriter *)self _invalidateTimer];
  if (self->_writeGroup)
  {
    [(WBSCoalescedAsynchronousWriter *)self _scheduleTimer];
  }
  else
  {
    dataSourceQueue = self->_dataSourceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__WBSCoalescedAsynchronousWriter__timerFired__block_invoke;
    block[3] = &unk_1E6159820;
    block[4] = self;
    dispatch_async(dataSourceQueue, block);
  }
}

void __45__WBSCoalescedAsynchronousWriter__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _dataFromDataSourceOnDataSourceQueue];
  v3 = [*(id *)(a1 + 32) _plistDictionaryFromDataSourceOnDataSourceQueue];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__WBSCoalescedAsynchronousWriter__timerFired__block_invoke_2;
  block[3] = &unk_1E6159A30;
  block[4] = v4;
  id v9 = v2;
  id v10 = v3;
  id v6 = v3;
  id v7 = v2;
  dispatch_async(v5, block);
}

uint64_t __45__WBSCoalescedAsynchronousWriter__timerFired__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _asynchronouslyWriteData:*(void *)(a1 + 40) orPlistDictionary:*(void *)(a1 + 48) completionHandler:0];
}

- (void)_scheduleTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_internalQueue);
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  dispatch_time_t v6 = dispatch_walltime(0, (uint64_t)(self->_writeDelayInterval * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_writeDelayInterval * 0.1 * 1000000000.0));
  objc_initWeak(&location, self);
  id v7 = self->_timer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__WBSCoalescedAsynchronousWriter__scheduleTimer__block_invoke;
  v8[3] = &unk_1E615AA60;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_timer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__WBSCoalescedAsynchronousWriter__scheduleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

- (id)_dataFromDataSourceOnDataSourceQueue
{
  id dataSourceBlock = (void (**)(void, void))self->_dataSourceBlock;
  if (dataSourceBlock)
  {
    ((void (**)(void, SEL))dataSourceBlock)[2](dataSourceBlock, a2);
    id dataSourceBlock = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return dataSourceBlock;
}

- (id)_plistDictionaryFromDataSourceOnDataSourceQueue
{
  id plistDictionarySourceBlock = (void (**)(void, void))self->_plistDictionarySourceBlock;
  if (plistDictionarySourceBlock)
  {
    ((void (**)(void, SEL))plistDictionarySourceBlock)[2](plistDictionarySourceBlock, a2);
    id plistDictionarySourceBlock = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return plistDictionarySourceBlock;
}

- (id)_dataForPlistDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    unint64_t plistFormat = self->_plistFormat;
    id v12 = 0;
    dispatch_time_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:plistFormat options:0 error:&v12];
    id v7 = v12;
    if (!v6)
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        v11 = objc_msgSend(v7, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543874;
        v14 = name;
        __int16 v15 = 2048;
        v16 = self;
        __int16 v17 = 2114;
        id v18 = v11;
        _os_log_error_impl(&dword_1B728F000, v8, OS_LOG_TYPE_ERROR, "WBSCoalescedAsynchronousWriter <%{public}@, %p>: Unable to serialize dictionary to data with error: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    dispatch_time_t v6 = 0;
  }

  return v6;
}

- (id)_synchronousDataOnDataSourceQueue
{
  if (self->_dataSourceBlock)
  {
    v3 = [(WBSCoalescedAsynchronousWriter *)self _dataFromDataSourceOnDataSourceQueue];
  }
  else
  {
    id v4 = [(WBSCoalescedAsynchronousWriter *)self _plistDictionaryFromDataSourceOnDataSourceQueue];
    v3 = [(WBSCoalescedAsynchronousWriter *)self _dataForPlistDictionary:v4];
  }
  return v3;
}

- (void)_waitForWriteCompletion
{
  writeGroup = self->_writeGroup;
  if (writeGroup)
  {
    dispatch_group_wait(writeGroup, 0xFFFFFFFFFFFFFFFFLL);
    id v4 = self->_writeGroup;
    self->_writeGroup = 0;
  }
}

- (void)_writeData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id writerBlock = (void (**)(id, id))self->_writerBlock;
    if (writerBlock)
    {
      writerBlock[2](writerBlock, v4);
    }
    else
    {
      dispatch_time_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v7 = [(NSURL *)self->_fileURL URLByDeletingLastPathComponent];
      id v8 = (id)objc_msgSend(v6, "safari_ensureDirectoryExists:", v7);

      [v4 writeToURL:self->_fileURL atomically:1];
      if ([(NSString *)self->_name isEqualToString:@"SessionState"])
      {
        id v9 = WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_INFO, "Writing LastSession.plist file.", buf, 2u);
        }
      }
      if ([(NSDictionary *)self->_fileResourceValues count])
      {
        fileURL = self->_fileURL;
        fileResourceValues = self->_fileResourceValues;
        id v18 = 0;
        BOOL v12 = [(NSURL *)fileURL setResourceValues:fileResourceValues error:&v18];
        id v13 = v18;
        if (!v12)
        {
          v14 = (id)WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            name = self->_name;
            v16 = objc_msgSend(v13, "safari_privacyPreservingDescription");
            -[WBSCoalescedAsynchronousWriter _writeData:]((uint64_t)name, v16, buf, v14);
          }
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained coalescedAsynchronousWriter:self didFinishWritingData:v4];
    }
  }
}

- (void)_asynchronouslyWriteData:(id)a3 orPlistDictionary:(id)a4 completionHandler:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  v11 = v10;
  if (v8 | v9)
  {
    BOOL v12 = (OS_dispatch_group *)dispatch_group_create();
    writeGroup = self->_writeGroup;
    self->_writeGroup = v12;

    v14 = self->_writeGroup;
    diskAccessQueue = self->_diskAccessQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__WBSCoalescedAsynchronousWriter__asynchronouslyWriteData_orPlistDictionary_completionHandler___block_invoke;
    v16[3] = &unk_1E615AA88;
    id v17 = (id)v8;
    id v18 = self;
    id v19 = (id)v9;
    id v20 = v11;
    dispatch_group_async(v14, diskAccessQueue, v16);
  }
  else if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
  }
}

void __95__WBSCoalescedAsynchronousWriter__asynchronouslyWriteData_orPlistDictionary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
LABEL_4:
    [*(id *)(a1 + 40) _writeData:v3];
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = *(NSObject **)(v4 + 72);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __95__WBSCoalescedAsynchronousWriter__asynchronouslyWriteData_orPlistDictionary_completionHandler___block_invoke_2;
    v9[3] = &unk_1E61599E0;
    v9[4] = v4;
    id v10 = *(id *)(a1 + 56);
    dispatch_async(v5, v9);

    return;
  }
  id v3 = [*(id *)(a1 + 40) _dataForPlistDictionary:*(void *)(a1 + 48)];
  if (v3) {
    goto LABEL_4;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = 0;

  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

uint64_t __95__WBSCoalescedAsynchronousWriter__asynchronouslyWriteData_orPlistDictionary_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 112))
  {
    uint64_t v2 = result;
    if (!*(void *)(v1 + 80))
    {
      std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(v1 + 104), 0);
      uint64_t v1 = *(void *)(v2 + 32);
    }
    id v3 = *(void **)(v1 + 96);
    *(void *)(v1 + 96) = 0;

    result = *(void *)(v2 + 40);
    if (result)
    {
      uint64_t v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (void)_cancelPendingWriteSynchronouslyLeavingSuddenTerminationIntact
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_done)
  {
    self->_done = 1;
    [(WBSCoalescedAsynchronousWriter *)self _waitForWriteCompletion];
    [(WBSCoalescedAsynchronousWriter *)self _invalidateTimer];
    id v3 = WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      name = self->_name;
      int v5 = 138543618;
      uint64_t v6 = name;
      __int16 v7 = 2048;
      uint64_t v8 = self;
      _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_INFO, "WBSCoalescedAsynchronousWriter <%{public}@, %p>: Done with writer", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)scheduleWrite
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WBSCoalescedAsynchronousWriter_scheduleWrite__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

unsigned char *__47__WBSCoalescedAsynchronousWriter_scheduleWrite__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[112])
  {
    [result _invalidateTimer];
    operator new();
  }
  return result;
}

- (void)startScheduledWriteNow
{
}

- (void)startScheduledWriteNowWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSCoalescedAsynchronousWriter_startScheduledWriteNowWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E61599E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __78__WBSCoalescedAsynchronousWriter_startScheduledWriteNowWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 112) || !*(void *)(v2 + 80))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    [(id)v2 _invalidateTimer];
    [*(id *)(a1 + 32) _waitForWriteCompletion];
    int v5 = *(void **)(a1 + 32);
    id v7 = [v5 _dataFromDataSourceOnDataSourceQueue];
    id v6 = [*(id *)(a1 + 32) _plistDictionaryFromDataSourceOnDataSourceQueue];
    [v5 _asynchronouslyWriteData:v7 orPlistDictionary:v6 completionHandler:*(void *)(a1 + 40)];
  }
}

- (void)performScheduledWriteSynchronously
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSCoalescedAsynchronousWriter_performScheduledWriteSynchronously__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __68__WBSCoalescedAsynchronousWriter_performScheduledWriteSynchronously__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 112))
  {
    if (*(void *)(v2 + 80))
    {
      [(id)v2 _invalidateTimer];
      [*(id *)(a1 + 32) _waitForWriteCompletion];
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(NSObject **)(v3 + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__WBSCoalescedAsynchronousWriter_performScheduledWriteSynchronously__block_invoke_2;
      block[3] = &unk_1E6159820;
      block[4] = v3;
      dispatch_sync(v4, block);
    }
  }
}

void __68__WBSCoalescedAsynchronousWriter_performScheduledWriteSynchronously__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 _synchronousDataOnDataSourceQueue];
  objc_msgSend(v1, "_writeData:");
}

- (void)completePendingWriteSynchronously
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSCoalescedAsynchronousWriter_completePendingWriteSynchronously__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

id *__67__WBSCoalescedAsynchronousWriter_completePendingWriteSynchronously__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  [v2 _cancelPendingWriteSynchronouslyLeavingSuddenTerminationIntact];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3 && (*(void *)(v4 + 32) || *(void *)(v4 + 56)))
  {
    int v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__WBSCoalescedAsynchronousWriter_completePendingWriteSynchronously__block_invoke_2;
    block[3] = &unk_1E6159820;
    block[4] = v4;
    dispatch_sync(v5, block);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  return std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(v4 + 104), 0);
}

void __67__WBSCoalescedAsynchronousWriter_completePendingWriteSynchronously__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 _synchronousDataOnDataSourceQueue];
  objc_msgSend(v1, "_writeData:");
}

- (void)cancelPendingWriteSynchronously
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WBSCoalescedAsynchronousWriter_cancelPendingWriteSynchronously__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

id *__65__WBSCoalescedAsynchronousWriter_cancelPendingWriteSynchronously__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelPendingWriteSynchronouslyLeavingSuddenTerminationIntact];
  id v2 = (id **)(*(void *)(a1 + 32) + 104);
  return std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](v2, 0);
}

- (WBSCoalescedAsynchronousWriterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSCoalescedAsynchronousWriterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_suddenTerminationDisabler, 0);
  objc_storeStrong((id *)&self->_writeGroup, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_plistDictionarySourceBlock, 0);
  objc_storeStrong((id *)&self->_fileResourceValues, 0);
  objc_storeStrong((id *)&self->_dataSourceQueue, 0);
  objc_storeStrong(&self->_dataSourceBlock, 0);
  objc_storeStrong(&self->_writerBlock, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_diskAccessQueue, 0);
}

- (void)_writeData:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Error setting file resource values for %{public}@: %{public}@", buf, 0x16u);
}

@end