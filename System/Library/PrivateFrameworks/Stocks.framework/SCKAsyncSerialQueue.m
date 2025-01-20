@interface SCKAsyncSerialQueue
- (BOOL)isSuspended;
- (NSOperationQueue)serialOperationQueue;
- (SCKAsyncSerialQueue)init;
- (void)enqueueBlock:(id)a3;
- (void)setSerialOperationQueue:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)waitUntilEmpty;
@end

@implementation SCKAsyncSerialQueue

- (SCKAsyncSerialQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCKAsyncSerialQueue;
  v2 = [(SCKAsyncSerialQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    serialOperationQueue = v2->_serialOperationQueue;
    v2->_serialOperationQueue = v3;

    [(NSOperationQueue *)v2->_serialOperationQueue setName:@"SCKAsyncSerialQueue.operationQueue"];
    [(NSOperationQueue *)v2->_serialOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_serialOperationQueue setQualityOfService:17];
  }
  return v2;
}

- (void)enqueueBlock:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_super v6 = [[SCKAsyncBlockOperation alloc] initWithBlock:v4];

    v5 = [(SCKAsyncSerialQueue *)self serialOperationQueue];
    [v5 addOperation:v6];
  }
}

- (void)waitUntilEmpty
{
  id v2 = [(SCKAsyncSerialQueue *)self serialOperationQueue];
  [v2 waitUntilAllOperationsAreFinished];
}

- (BOOL)isSuspended
{
  id v2 = [(SCKAsyncSerialQueue *)self serialOperationQueue];
  char v3 = [v2 isSuspended];

  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SCKAsyncSerialQueue *)self serialOperationQueue];
  [v4 setSuspended:v3];
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

@end