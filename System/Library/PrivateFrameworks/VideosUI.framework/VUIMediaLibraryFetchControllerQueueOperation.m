@interface VUIMediaLibraryFetchControllerQueueOperation
- (NSArray)fetchControllers;
- (VUIMediaLibraryFetchControllerQueueOperation)init;
- (VUIMediaLibraryFetchControllerQueueOperation)initWithFetchControllers:(id)a3 mediaLibraryRevision:(unint64_t)a4;
- (unint64_t)mediaLibraryRevision;
- (void)executionDidBegin;
- (void)setFetchControllers:(id)a3;
- (void)setMediaLibraryRevision:(unint64_t)a3;
@end

@implementation VUIMediaLibraryFetchControllerQueueOperation

- (VUIMediaLibraryFetchControllerQueueOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaLibraryFetchControllerQueueOperation)initWithFetchControllers:(id)a3 mediaLibraryRevision:(unint64_t)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"fetchControllers" format];
  }
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaLibraryFetchControllerQueueOperation;
  v7 = [(VUIMediaLibraryFetchControllerQueueOperation *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    fetchControllers = v7->_fetchControllers;
    v7->_fetchControllers = (NSArray *)v8;

    v7->_mediaLibraryRevision = a4;
  }

  return v7;
}

- (void)executionDidBegin
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(VUIMediaLibraryFetchControllerQueueOperation *)self fetchControllers];
  uint64_t v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = +[VUIMediaLibraryFetchController _logStringWithFetchControllers:v3];
    *(_DWORD *)buf = 134218242;
    v27 = self;
    __int16 v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "[%p] - Begining VUIMediaLibraryFetchControllerQueueOperation for controllers: %@", buf, 0x16u);
  }
  unint64_t v6 = [(VUIMediaLibraryFetchControllerQueueOperation *)self mediaLibraryRevision];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        objc_super v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
        v13 = VUIDefaultLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = [v11 logName];
          *(_DWORD *)buf = 134218242;
          v27 = self;
          __int16 v28 = 2112;
          v29 = v14;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_INFO, "[%p] - Starting fetch controller %@", buf, 0x16u);
        }
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __65__VUIMediaLibraryFetchControllerQueueOperation_executionDidBegin__block_invoke;
        v19[3] = &unk_1E6DFC410;
        v19[4] = self;
        v19[5] = v11;
        dispatch_semaphore_t v20 = v12;
        v15 = dispatch_get_global_queue(0, 0);
        v16 = v12;
        [v11 beginFetchWithMediaLibraryRevision:v6 completionHandler:v19 completionQueue:v15];

        dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  v17 = VUIDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v27 = self;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_INFO, "[%p] - All fetches finished. Finishing VUIMediaLibraryFetchControllerQueueOperation operation", buf, 0xCu);
  }

  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

intptr_t __65__VUIMediaLibraryFetchControllerQueueOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) logName];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "[%p] - Finished fetch controller %@", (uint8_t *)&v6, 0x16u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (NSArray)fetchControllers
{
  return self->_fetchControllers;
}

- (void)setFetchControllers:(id)a3
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

- (void).cxx_destruct
{
}

@end