@interface PABasicAssetIdentifierPool
- (PABasicAssetIdentifierPool)initWithMaxPoolSize:(unint64_t)a3 autoDrainInterval:(double)a4 onQueue:(id)a5 delegate:(id)a6;
- (int64_t)visibilityState;
- (void)addAssetIdentifiers:(id)a3;
- (void)addAssetIdentifiers:(id)a3 accessEventCount:(unint64_t)a4;
- (void)dealloc;
- (void)drainPool;
- (void)invalidate;
- (void)setVisibilityState:(int64_t)a3;
@end

@implementation PABasicAssetIdentifierPool

- (PABasicAssetIdentifierPool)initWithMaxPoolSize:(unint64_t)a3 autoDrainInterval:(double)a4 onQueue:(id)a5 delegate:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PABasicAssetIdentifierPool;
  v13 = [(PABasicAssetIdentifierPool *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    v14->_maxPoolSize = a3;
    v14->_autoDrainInterval = a4;
    objc_storeStrong((id *)&v14->_queue, a5);
    v15 = v14;
  }

  return v14;
}

- (void)dealloc
{
  [(PABasicAssetIdentifierPool *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PABasicAssetIdentifierPool;
  [(PABasicAssetIdentifierPool *)&v3 dealloc];
}

- (void)invalidate
{
  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    dispatch_source_cancel(drainTimer);
    v4 = self->_drainTimer;
    self->_drainTimer = 0;
  }
  assetIdentifiers = self->_assetIdentifiers;
  self->_assetIdentifiers = 0;
}

- (void)addAssetIdentifiers:(id)a3
{
}

- (void)addAssetIdentifiers:(id)a3 accessEventCount:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self->_eventCount += a4;
  if ([v6 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          self->_assetIdentifierPoolSize += [*(id *)(*((void *)&v24 + 1) + 8 * v11++) length];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    assetIdentifiers = self->_assetIdentifiers;
    if (assetIdentifiers)
    {
      [(NSMutableSet *)assetIdentifiers unionSet:v7];
    }
    else
    {
      v13 = (NSMutableSet *)[v7 mutableCopy];
      v14 = self->_assetIdentifiers;
      self->_assetIdentifiers = v13;
    }
    if (self->_assetIdentifierPoolSize <= self->_maxPoolSize)
    {
      if (!self->_drainTimer)
      {
        double autoDrainInterval = self->_autoDrainInterval;
        if (fabs(autoDrainInterval) != INFINITY)
        {
          objc_initWeak(&location, self);
          v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
          drainTimer = self->_drainTimer;
          self->_drainTimer = v16;

          v18 = self->_drainTimer;
          dispatch_time_t v19 = dispatch_time(0, (unint64_t)(autoDrainInterval * 1000000000.0));
          dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(autoDrainInterval * 1000000000.0) >> 2);
          v20 = self->_drainTimer;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __67__PABasicAssetIdentifierPool_addAssetIdentifiers_accessEventCount___block_invoke;
          v21[3] = &unk_1E5D70E00;
          objc_copyWeak(&v22, &location);
          dispatch_source_set_event_handler(v20, v21);
          dispatch_activate((dispatch_object_t)self->_drainTimer);
          objc_destroyWeak(&v22);
          objc_destroyWeak(&location);
        }
      }
    }
    else
    {
      [(PABasicAssetIdentifierPool *)self drainPool];
    }
  }
}

void __67__PABasicAssetIdentifierPool_addAssetIdentifiers_accessEventCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained drainPool];
}

- (void)drainPool
{
  if ([(NSMutableSet *)self->_assetIdentifiers count] || self->_eventCount)
  {
    objc_super v3 = (void *)[(NSMutableSet *)self->_assetIdentifiers copy];
    v4 = v3;
    if (v3) {
      id v5 = v3;
    }
    else {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    id v6 = v5;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained recordAccessToAssetIdentifiers:v6 withVisibilityState:self->_visibilityState accessEventCount:self->_eventCount];
  }
  assetIdentifiers = self->_assetIdentifiers;
  self->_assetIdentifiers = 0;

  self->_assetIdentifierPoolSize = 0;
  self->_eventCount = 0;
  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    dispatch_source_cancel(drainTimer);
    drainTimer = self->_drainTimer;
  }
  self->_drainTimer = 0;
}

- (void)setVisibilityState:(int64_t)a3
{
  if (self->_stateMonitoringEstablished) {
    [(PABasicAssetIdentifierPool *)self drainPool];
  }
  else {
    self->_stateMonitoringEstablished = 1;
  }
  self->_visibilityState = a3;
}

- (int64_t)visibilityState
{
  return self->_visibilityState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_drainTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end