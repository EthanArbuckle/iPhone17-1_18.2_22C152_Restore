@interface ISOperationQueue
+ (id)mainQueue;
- (BOOL)adjustsMaxConcurrentOperationCount;
- (ISOperationQueue)init;
- (id)name;
- (id)operations;
- (int64_t)maxConcurrentOperationCount;
- (int64_t)operationCount;
- (void)addOperation:(id)a3;
- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAdjustsMaxConcurrentOperationCount:(BOOL)a3;
- (void)setMaxConcurrentOperationCount:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation ISOperationQueue

- (ISOperationQueue)init
{
  __ISRecordSPIClassUsage(self);
  v7.receiver = self;
  v7.super_class = (Class)ISOperationQueue;
  v3 = [(ISOperationQueue *)&v7 init];
  if (v3)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queue = v3->_queue;
    v3->_queue = v4;

    [(NSOperationQueue *)v3->_queue setMaxConcurrentOperationCount:3];
    [(NSOperationQueue *)v3->_queue addObserver:v3 forKeyPath:@"operationCount" options:0 context:0];
  }
  return v3;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_queue removeObserver:self forKeyPath:@"operationCount" context:0];
  [(NSOperationQueue *)self->_queue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)ISOperationQueue;
  [(ISOperationQueue *)&v3 dealloc];
}

+ (id)mainQueue
{
  pthread_once(&mainQueue_sInstanceGuard, (void (*)(void))__CreateMainQueue);
  v2 = (void *)__MainQueue;

  return v2;
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  v4 = +[ISUniqueOperationManager sharedInstance];
  [v4 checkInOperation:v5];

  [(NSOperationQueue *)self->_queue addOperation:v5];
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = +[ISUniqueOperationManager sharedInstance];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "checkInOperation:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(NSOperationQueue *)self->_queue addOperations:v8 waitUntilFinished:v4];
}

- (BOOL)adjustsMaxConcurrentOperationCount
{
  return ISUniqueOperationQueueAdjustsConcurrentOperationCount(self->_queue);
}

- (void)cancelAllOperations
{
}

- (int64_t)operationCount
{
  return [(NSOperationQueue *)self->_queue operationCount];
}

- (int64_t)maxConcurrentOperationCount
{
  return [(NSOperationQueue *)self->_queue maxConcurrentOperationCount];
}

- (id)name
{
  return [(NSOperationQueue *)self->_queue name];
}

- (id)operations
{
  return [(NSOperationQueue *)self->_queue operations];
}

- (void)setAdjustsMaxConcurrentOperationCount:(BOOL)a3
{
}

- (void)setMaxConcurrentOperationCount:(int64_t)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setSuspended:(BOOL)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4, a5, a6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 postNotificationName:@"ISOperationQueueOperationCountChangedNotification" object:self];
}

- (void).cxx_destruct
{
}

@end