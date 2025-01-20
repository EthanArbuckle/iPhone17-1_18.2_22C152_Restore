@interface NRFMonitor
+ (id)sharedInstance;
- (NRFMonitor)init;
- (void)addInstance;
- (void)releaseAllNRFSingletons;
- (void)removeInstance;
@end

@implementation NRFMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_singleton;

  return v2;
}

uint64_t __28__NRFMonitor_sharedInstance__block_invoke()
{
  sharedInstance_singleton = objc_alloc_init(NRFMonitor);

  return MEMORY[0x270F9A758]();
}

- (NRFMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)NRFMonitor;
  v2 = [(NRFMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_instanceCount = 0;
    uint64_t TargetingPThreadRootQueueWithPriority = FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority();
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)TargetingPThreadRootQueueWithPriority;

    +[NRFMonitorStatus setActive];
  }
  return v3;
}

- (void)addInstance
{
  p_instanceCountlock = &self->_instanceCountlock;
  os_unfair_lock_lock(&self->_instanceCountlock);
  ++self->_instanceCount;
  id currentBlock = self->_currentBlock;
  if (currentBlock)
  {
    dispatch_block_cancel(currentBlock);
    id v5 = self->_currentBlock;
    self->_id currentBlock = 0;
  }
  if (!self->_NRFSingletonsAllocated)
  {
    getpid();
    v6 = (OS_os_transaction *)FigOSTransactionCreate();
    NRFSingletonsOSTransaction = self->_NRFSingletonsOSTransaction;
    self->_NRFSingletonsOSTransaction = v6;

    self->_NRFSingletonsAllocated = 1;
  }

  os_unfair_lock_unlock(p_instanceCountlock);
}

- (void)removeInstance
{
  p_instanceCountlock = &self->_instanceCountlock;
  os_unfair_lock_lock(&self->_instanceCountlock);
  unsigned int instanceCount = self->_instanceCount;
  if (instanceCount)
  {
    unsigned int v5 = instanceCount - 1;
    self->_unsigned int instanceCount = v5;
    if (!v5)
    {
      id currentBlock = self->_currentBlock;
      if (currentBlock)
      {
        dispatch_block_cancel(currentBlock);
        id v7 = self->_currentBlock;
        self->_id currentBlock = 0;
      }
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __28__NRFMonitor_removeInstance__block_invoke;
      v11[3] = &unk_2655C7FE8;
      objc_copyWeak(&v12, &location);
      dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v11);
      id v9 = self->_currentBlock;
      self->_id currentBlock = v8;

      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      dispatch_after(v10, (dispatch_queue_t)self->_workerQueue, self->_currentBlock);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  os_unfair_lock_unlock(p_instanceCountlock);
}

void __28__NRFMonitor_removeInstance__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained releaseAllNRFSingletons];
}

- (void)releaseAllNRFSingletons
{
  p_instanceCountlock = &self->_instanceCountlock;
  os_unfair_lock_lock(&self->_instanceCountlock);
  id currentBlock = self->_currentBlock;
  self->_id currentBlock = 0;

  if (!self->_instanceCount)
  {
    NRFSingletonsReleaseAll();
    flushIOUnifiedAddressTranslatorWithDummyBuffer();
    NRFSingletonsOSTransaction = self->_NRFSingletonsOSTransaction;
    self->_NRFSingletonsOSTransaction = 0;

    self->_NRFSingletonsAllocated = 0;
  }

  os_unfair_lock_unlock(p_instanceCountlock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_NRFSingletonsOSTransaction, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);

  objc_storeStrong(&self->_currentBlock, 0);
}

@end