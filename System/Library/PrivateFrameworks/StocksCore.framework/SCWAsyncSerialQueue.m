@interface SCWAsyncSerialQueue
- (BOOL)isSuspended;
- (NSOperationQueue)serialOperationQueue;
- (SCWAsyncSerialQueue)initWithQualityOfService:(int64_t)a3;
- (void)enqueueBlock:(id)a3;
- (void)setSerialOperationQueue:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)waitUntilEmpty;
@end

@implementation SCWAsyncSerialQueue

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SCWAsyncSerialQueue *)self serialOperationQueue];
  [v4 setSuspended:v3];
}

- (void)enqueueBlock:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v6 = [[SCWAsyncBlockOperation alloc] initWithBlock:v4];

    v5 = [(SCWAsyncSerialQueue *)self serialOperationQueue];
    [v5 addOperation:v6];
  }
}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (SCWAsyncSerialQueue)initWithQualityOfService:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCWAsyncSerialQueue;
  id v4 = [(SCWAsyncSerialQueue *)&v8 init];
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    serialOperationQueue = v4->_serialOperationQueue;
    v4->_serialOperationQueue = v5;

    [(NSOperationQueue *)v4->_serialOperationQueue setName:@"SCWAsyncSerialQueue.operationQueue"];
    [(NSOperationQueue *)v4->_serialOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v4->_serialOperationQueue setQualityOfService:a3];
  }
  return v4;
}

- (void)waitUntilEmpty
{
  id v2 = [(SCWAsyncSerialQueue *)self serialOperationQueue];
  [v2 waitUntilAllOperationsAreFinished];
}

- (BOOL)isSuspended
{
  id v2 = [(SCWAsyncSerialQueue *)self serialOperationQueue];
  char v3 = [v2 isSuspended];

  return v3;
}

- (void)setSerialOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end