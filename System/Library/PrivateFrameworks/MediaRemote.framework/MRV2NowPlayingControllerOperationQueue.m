@interface MRV2NowPlayingControllerOperationQueue
- (MRV2NowPlayingControllerOperationQueue)initWithQueue:(id)a3;
- (void)addOperationWithBlock:(id)a3;
- (void)invalidate;
@end

@implementation MRV2NowPlayingControllerOperationQueue

- (MRV2NowPlayingControllerOperationQueue)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRV2NowPlayingControllerOperationQueue;
  v5 = [(MRV2NowPlayingControllerOperationQueue *)&v9 init];
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v5->_queue;
    v5->_queue = v6;

    [(NSOperationQueue *)v5->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_queue setUnderlyingQueue:v4];
  }

  return v5;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  obj->_invalidated = 1;
  [(NSOperationQueue *)obj->_queue cancelAllOperations];
  objc_sync_exit(obj);
}

- (void)addOperationWithBlock:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (!v4->_invalidated) {
    [(NSOperationQueue *)v4->_queue addOperationWithBlock:v5];
  }
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

@end