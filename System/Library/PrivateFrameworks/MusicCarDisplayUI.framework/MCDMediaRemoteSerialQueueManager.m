@interface MCDMediaRemoteSerialQueueManager
+ (MCDMediaRemoteSerialQueueManager)sharedInstance;
- (MCDMediaRemoteSerialQueueManager)init;
- (NSOperationQueue)mediaRemoteSerialQueue;
- (void)addOperation:(id)a3 cancelAllOperations:(BOOL)a4;
- (void)cancelAllOperations;
- (void)setMediaRemoteSerialQueue:(id)a3;
@end

@implementation MCDMediaRemoteSerialQueueManager

+ (MCDMediaRemoteSerialQueueManager)sharedInstance
{
  if (sharedInstance_isDispatched_0 != -1) {
    dispatch_once(&sharedInstance_isDispatched_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedMRInstance;
  return (MCDMediaRemoteSerialQueueManager *)v2;
}

uint64_t __50__MCDMediaRemoteSerialQueueManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedMRInstance = objc_alloc_init(MCDMediaRemoteSerialQueueManager);
  return MEMORY[0x270F9A758]();
}

- (MCDMediaRemoteSerialQueueManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MCDMediaRemoteSerialQueueManager;
  v2 = [(MCDMediaRemoteSerialQueueManager *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    mediaRemoteSerialQueue = v2->_mediaRemoteSerialQueue;
    v2->_mediaRemoteSerialQueue = v3;

    [(NSOperationQueue *)v2->_mediaRemoteSerialQueue setName:@"com.apple.MCDSerialProcessingQueue"];
    [(NSOperationQueue *)v2->_mediaRemoteSerialQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)cancelAllOperations
{
  v3 = MCDGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23F140000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all operations on MCDMediaRemoteSerialQueueManager", v5, 2u);
  }

  v4 = [(MCDMediaRemoteSerialQueueManager *)self mediaRemoteSerialQueue];
  [v4 cancelAllOperations];
}

- (void)addOperation:(id)a3 cancelAllOperations:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F086D0]);
  objc_initWeak(&location, v7);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__MCDMediaRemoteSerialQueueManager_addOperation_cancelAllOperations___block_invoke;
  v10[3] = &unk_26505C520;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a4;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  [v7 addExecutionBlock:v10];
  v9 = [(MCDMediaRemoteSerialQueueManager *)self mediaRemoteSerialQueue];
  [v9 addOperation:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __69__MCDMediaRemoteSerialQueueManager_addOperation_cancelAllOperations___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = [WeakRetained isCancelled];

  if (v3)
  {
    v4 = MCDGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Operation is cancelled, not executing", v6, 2u);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(a1 + 32) cancelAllOperations];
    }
    v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

- (NSOperationQueue)mediaRemoteSerialQueue
{
  return self->_mediaRemoteSerialQueue;
}

- (void)setMediaRemoteSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end