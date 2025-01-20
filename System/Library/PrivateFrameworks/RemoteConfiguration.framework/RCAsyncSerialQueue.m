@interface RCAsyncSerialQueue
- (BOOL)suspended;
- (NSOperationQueue)serialOperationQueue;
- (RCAsyncSerialQueue)init;
- (RCAsyncSerialQueue)initWithQualityOfService:(int64_t)a3;
- (void)cancelAllBlocks;
- (void)enqueueBlock:(id)a3;
- (void)enqueueBlockForMainThread:(id)a3;
- (void)enqueueOperation:(id)a3;
- (void)setSerialOperationQueue:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)withQualityOfService:(int64_t)a3 enqueueBlockForMainThread:(id)a4;
@end

@implementation RCAsyncSerialQueue

- (RCAsyncSerialQueue)initWithQualityOfService:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCAsyncSerialQueue;
  v4 = [(RCAsyncSerialQueue *)&v8 init];
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    serialOperationQueue = v4->_serialOperationQueue;
    v4->_serialOperationQueue = v5;

    [(NSOperationQueue *)v4->_serialOperationQueue setQualityOfService:a3];
    [(NSOperationQueue *)v4->_serialOperationQueue setMaxConcurrentOperationCount:1];
  }
  return v4;
}

- (RCAsyncSerialQueue)init
{
  return [(RCAsyncSerialQueue *)self initWithQualityOfService:9];
}

- (void)enqueueBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(RCAsyncSerialQueue *)self serialOperationQueue];
    objc_msgSend(v5, "rc_addAsyncOperationWithBlock:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCAsyncSerialQueue enqueueBlock:]();
  }
}

- (void)enqueueBlockForMainThread:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__RCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke;
    v6[3] = &unk_1E5B76980;
    id v7 = v4;
    [(RCAsyncSerialQueue *)self enqueueBlock:v6];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCAsyncSerialQueue enqueueBlockForMainThread:]();
  }
}

void __48__RCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__RCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke_2;
  v5[3] = &unk_1E5B765F0;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __48__RCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)withQualityOfService:(int64_t)a3 enqueueBlockForMainThread:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = +[RCAsyncBlockOperation asyncBlockOperationWithMainThreadBlock:v6];
    [v7 setQualityOfService:a3];
    objc_super v8 = [(RCAsyncSerialQueue *)self serialOperationQueue];
    [v8 addOperation:v7];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCAsyncSerialQueue withQualityOfService:enqueueBlockForMainThread:]();
  }
}

- (void)enqueueOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(RCAsyncSerialQueue *)self serialOperationQueue];
  [v5 addOperation:v4];
}

- (void)cancelAllBlocks
{
  id v2 = [(RCAsyncSerialQueue *)self serialOperationQueue];
  [v2 cancelAllOperations];
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCAsyncSerialQueue *)self serialOperationQueue];
  [v4 setSuspended:v3];
}

- (BOOL)suspended
{
  id v2 = [(RCAsyncSerialQueue *)self serialOperationQueue];
  char v3 = [v2 isSuspended];

  return v3;
}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (void)setSerialOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)enqueueBlock:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block != nil", v6, 2u);
}

- (void)enqueueBlockForMainThread:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block != nil", v6, 2u);
}

- (void)withQualityOfService:enqueueBlockForMainThread:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block != nil", v6, 2u);
}

@end