@interface FCAsyncSerialQueue
- (BOOL)suspended;
- (FCAsyncSerialQueue)init;
- (FCAsyncSerialQueue)initWithQualityOfService:(int64_t)a3;
- (FCAsyncSerialQueue)initWithUnderlyingQueue:(id)a3 qualityOfService:(int64_t)a4;
- (NSOperationQueue)serialOperationQueue;
- (void)cancelAllBlocks;
- (void)enqueueBlock:(id)a3;
- (void)enqueueBlockForMainThread:(id)a3;
- (void)enqueueOperation:(id)a3;
- (void)setSerialOperationQueue:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)withQualityOfService:(int64_t)a3 enqueueBlock:(id)a4;
- (void)withQualityOfService:(int64_t)a3 enqueueBlockForMainThread:(id)a4;
@end

@implementation FCAsyncSerialQueue

- (FCAsyncSerialQueue)initWithUnderlyingQueue:(id)a3 qualityOfService:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCAsyncSerialQueue;
  v7 = [(FCAsyncSerialQueue *)&v11 init];
  if (v7)
  {
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    serialOperationQueue = v7->_serialOperationQueue;
    v7->_serialOperationQueue = v8;

    [(NSOperationQueue *)v7->_serialOperationQueue setQualityOfService:a4];
    [(NSOperationQueue *)v7->_serialOperationQueue setMaxConcurrentOperationCount:1];
    if (v6) {
      [(NSOperationQueue *)v7->_serialOperationQueue setUnderlyingQueue:v6];
    }
  }

  return v7;
}

- (FCAsyncSerialQueue)init
{
  return [(FCAsyncSerialQueue *)self initWithUnderlyingQueue:0 qualityOfService:9];
}

- (void).cxx_destruct
{
}

- (FCAsyncSerialQueue)initWithQualityOfService:(int64_t)a3
{
  return [(FCAsyncSerialQueue *)self initWithUnderlyingQueue:0 qualityOfService:a3];
}

- (void)enqueueBlock:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(FCAsyncSerialQueue *)self serialOperationQueue];
    objc_msgSend(v5, "fc_addAsyncOperationWithBlock:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCAsyncSerialQueue enqueueBlock:]";
    __int16 v8 = 2080;
    v9 = "FCAsyncSerialQueue.m";
    __int16 v10 = 1024;
    int v11 = 51;
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (void)withQualityOfService:(int64_t)a3 enqueueBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    v7 = +[FCAsyncBlockOperation asyncBlockOperationWithBlock:v6];
    [v7 setQualityOfService:a3];
    __int16 v8 = [(FCAsyncSerialQueue *)self serialOperationQueue];
    [v8 addOperation:v7];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)buf = 136315906;
    int v11 = "-[FCAsyncSerialQueue withQualityOfService:enqueueBlock:]";
    __int16 v12 = 2080;
    v13 = "FCAsyncSerialQueue.m";
    __int16 v14 = 1024;
    int v15 = 61;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (void)enqueueBlockForMainThread:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__FCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke;
    v7[3] = &unk_1E5B4F168;
    id v8 = v4;
    [(FCAsyncSerialQueue *)self enqueueBlock:v7];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCAsyncSerialQueue enqueueBlockForMainThread:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCAsyncSerialQueue.m";
    __int16 v13 = 1024;
    int v14 = 74;
    __int16 v15 = 2114;
    __int16 v16 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

void __48__FCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__FCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke_2;
  v5[3] = &unk_1E5B4E128;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __48__FCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)withQualityOfService:(int64_t)a3 enqueueBlockForMainThread:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = +[FCAsyncBlockOperation asyncBlockOperationWithMainThreadBlock:v6];
    [v7 setQualityOfService:a3];
    id v8 = [(FCAsyncSerialQueue *)self serialOperationQueue];
    [v8 addOperation:v7];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v11 = "-[FCAsyncSerialQueue withQualityOfService:enqueueBlockForMainThread:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCAsyncSerialQueue.m";
    __int16 v14 = 1024;
    int v15 = 88;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (void)enqueueOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(FCAsyncSerialQueue *)self serialOperationQueue];
  [v5 addOperation:v4];
}

- (void)cancelAllBlocks
{
  id v2 = [(FCAsyncSerialQueue *)self serialOperationQueue];
  [v2 cancelAllOperations];
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FCAsyncSerialQueue *)self serialOperationQueue];
  [v4 setSuspended:v3];
}

- (BOOL)suspended
{
  id v2 = [(FCAsyncSerialQueue *)self serialOperationQueue];
  char v3 = [v2 isSuspended];

  return v3;
}

- (void)setSerialOperationQueue:(id)a3
{
}

@end