@interface NTKHeartRateQueryManager
+ (id)sharedInstance;
- (BOOL)_alreadyObserving;
- (BOOL)_haveObservers;
- (BOOL)canUseFutureSamples;
- (BOOL)hasCheckedDefaults;
- (HKHeartRateSummary)latestHeartRateSummary;
- (HKQuantitySample)latestHeartRateSample;
- (id)_init;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_findLatestHeartRateSample:(id)a3;
- (void)_handleDeviceLockChange;
- (void)_notifyObserversOfLatestSample;
- (void)_notifyObserversOfLatestSummary;
- (void)_queue_clearHeartRateSampleQueryWithError:(id)a3;
- (void)_queue_clearHeartRateSummaryQueryWithError:(id)a3;
- (void)_queue_retrieveLatestHeartRateOnce;
- (void)_queue_startObservingHeartRate;
- (void)_queue_startObservingHeartRateSummary;
- (void)_queue_stopObservingHeartRate;
- (void)_queue_stopObservingHeartRateSummary;
- (void)_startObserving;
- (void)_stopObserving;
- (void)_stopObservingIfNeeded;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setCheckedDefaults:(BOOL)a3;
- (void)setLatestHeartRateSample:(id)a3;
- (void)setLatestHeartRateSummary:(id)a3;
- (void)startObservingIfNeeded;
@end

@implementation NTKHeartRateQueryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_19 != -1) {
    dispatch_once(&sharedInstance_onceToken_19, &__block_literal_global_135);
  }
  v2 = (void *)sharedInstance___sharedInstance_6;

  return v2;
}

void __42__NTKHeartRateQueryManager_sharedInstance__block_invoke()
{
  id v0 = [[NTKHeartRateQueryManager alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_6;
  sharedInstance___sharedInstance_6 = (uint64_t)v0;
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)NTKHeartRateQueryManager;
  v2 = [(NTKHeartRateQueryManager *)&v15 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F19A30] currentDevice];
    v2->_deviceIsLocked = [v3 isLocked];

    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v4;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.nanotimekit.heart-rate.healthQueue", 0);
    healthQueue = v2->_healthQueue;
    v2->_healthQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.nanotimekit.heart-rate.sampleQueue", MEMORY[0x1E4F14430]);
    sampleQueue = v2->_sampleQueue;
    v2->_sampleQueue = (OS_dispatch_queue *)v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__handleDeviceLockChange name:*MEMORY[0x1E4F19660] object:0];

    v11 = v2->_healthQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__NTKHeartRateQueryManager__init__block_invoke;
    block[3] = &unk_1E62BFF20;
    v14 = v2;
    dispatch_async(v11, block);
  }
  return v2;
}

void __33__NTKHeartRateQueryManager__init__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F2B0B8], "fiui_sharedHealthStoreForCarousel");
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  os_unfair_lock_lock(&self->_observersLock);
  [(NSHashTable *)self->_observers removeAllObjects];
  os_unfair_lock_unlock(&self->_observersLock);
  if (self->_heartRateQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    heartRateQuery = self->_heartRateQuery;
    self->_heartRateQuery = 0;
  }
  if (self->_heartRateSummaryQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    heartRateSummaryQuery = self->_heartRateSummaryQuery;
    self->_heartRateSummaryQuery = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NTKHeartRateQueryManager;
  [(NTKHeartRateQueryManager *)&v6 dealloc];
}

- (void)_handleDeviceLockChange
{
  uint64_t v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: received CLKDeviceLockStateChangedNotification", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKHeartRateQueryManager__handleDeviceLockChange__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__NTKHeartRateQueryManager__handleDeviceLockChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F19A30] currentDevice];
  char v3 = [v2 isLocked];

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = v3;
  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) startObservingIfNeeded];
    [*(id *)(a1 + 32) _notifyObserversOfLatestSample];
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _notifyObserversOfLatestSummary];
  }
}

- (void)_queue_clearHeartRateSampleQueryWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthQueue);
  v5 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NTKHeartRateQueryManager _queue_clearHeartRateSampleQueryWithError:]((uint64_t)v4, v5);
  }

  heartRateQuery = self->_heartRateQuery;
  self->_heartRateQuery = 0;
}

- (void)_queue_clearHeartRateSummaryQueryWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthQueue);
  v5 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NTKHeartRateQueryManager _queue_clearHeartRateSummaryQueryWithError:]((uint64_t)v4, v5);
  }

  heartRateSummaryQuery = self->_heartRateSummaryQuery;
  self->_heartRateSummaryQuery = 0;
}

- (void)_queue_startObservingHeartRateSummary
{
}

void __65__NTKHeartRateQueryManager__queue_startObservingHeartRateSummary__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      v10 = WeakRetained[2];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__NTKHeartRateQueryManager__queue_startObservingHeartRateSummary__block_invoke_2;
      v17[3] = &unk_1E62C09C0;
      v17[4] = WeakRetained;
      id v18 = v7;
      dispatch_sync(v10, v17);
    }
    else
    {
      v11 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v12)
        {
          v13 = [v6 heartRateDateInterval];
          v14 = [v13 startDate];
          objc_super v15 = [v6 heartRateDateInterval];
          v16 = [v15 endDate];
          *(_DWORD *)buf = 138543618;
          v20 = v14;
          __int16 v21 = 2114;
          v22 = v16;
          _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: Updated with latest heart rate summary for %{public}@ to %{public}@", buf, 0x16u);
        }
        [v9 setLatestHeartRateSummary:v6];
        [v9 _notifyObserversOfLatestSummary];
      }
      else
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: Updated with nil heart rate summary.", buf, 2u);
        }
      }
    }
  }
}

uint64_t __65__NTKHeartRateQueryManager__queue_startObservingHeartRateSummary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearHeartRateSummaryQueryWithError:", *(void *)(a1 + 40));
}

- (void)_queue_stopObservingHeartRateSummary
{
}

- (void)_notifyObserversOfLatestSummary
{
  char v3 = [(NTKHeartRateQueryManager *)self latestHeartRateSummary];
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__NTKHeartRateQueryManager__notifyObserversOfLatestSummary__block_invoke;
    v5[3] = &unk_1E62C09C0;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __59__NTKHeartRateQueryManager__notifyObserversOfLatestSummary__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__NTKHeartRateQueryManager__notifyObserversOfLatestSummary__block_invoke_2;
  v2[3] = &unk_1E62C81A0;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateObserversUsingBlock:v2];
}

void __59__NTKHeartRateQueryManager__notifyObserversOfLatestSummary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 manager:*(void *)(a1 + 32) receivedLatestHeartRateSummary:*(void *)(a1 + 40)];
  }
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v6 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
      char v13 = 0;
      v4[2](v4, v12, &v13);
      if (v13) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)startObservingIfNeeded
{
  if ([(NTKHeartRateQueryManager *)self _alreadyObserving])
  {
    id v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      id v4 = "NTKHeartRateQueryManager: attempted to start observing but we're already observing";
      v5 = (uint8_t *)&v8;
LABEL_10:
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (![(NTKHeartRateQueryManager *)self _haveObservers])
  {
    id v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "NTKHeartRateQueryManager: attempted to start observing but don't have any observers to notify";
      v5 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (self->_deviceIsLocked)
  {
    id v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = 0;
      id v4 = "NTKHeartRateQueryManager: attempted to start observing but the device is locked— waiting for unlock";
      v5 = (uint8_t *)&v6;
      goto LABEL_10;
    }
LABEL_11:

    return;
  }

  [(NTKHeartRateQueryManager *)self _startObserving];
}

- (void)_stopObservingIfNeeded
{
  if ([(NTKHeartRateQueryManager *)self _alreadyObserving])
  {
    [(NTKHeartRateQueryManager *)self _stopObserving];
  }
  else
  {
    id v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: attempted to stop observing but we weren't observing", v4, 2u);
    }
  }
}

- (void)_startObserving
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__NTKHeartRateQueryManager__startObserving__block_invoke;
  v5[3] = &unk_1E62C81C8;
  v5[4] = v6;
  [(NTKHeartRateQueryManager *)self _enumerateObserversUsingBlock:v5];
  healthQueue = self->_healthQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NTKHeartRateQueryManager__startObserving__block_invoke_2;
  block[3] = &unk_1E62C81F0;
  void block[4] = self;
  void block[5] = v6;
  dispatch_async(healthQueue, block);
  _Block_object_dispose(v6, 8);
}

uint64_t __43__NTKHeartRateQueryManager__startObserving__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __43__NTKHeartRateQueryManager__startObserving__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[5])
  {
    objc_msgSend(v2, "_queue_startObservingHeartRate");
    uint64_t v2 = *(void **)(a1 + 32);
  }
  objc_msgSend(v2, "_queue_retrieveLatestHeartRateOnce");
  id v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: shouldStartQueryingSummary? %d", (uint8_t *)v6, 8u);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v5 = *(void **)(a1 + 32);
    if (!v5[6]) {
      objc_msgSend(v5, "_queue_startObservingHeartRateSummary");
    }
  }
}

- (void)_stopObserving
{
  healthQueue = self->_healthQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NTKHeartRateQueryManager__stopObserving__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(healthQueue, block);
}

void __42__NTKHeartRateQueryManager__stopObserving__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _haveObservers] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_queue_stopObservingHeartRate");
  }
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__NTKHeartRateQueryManager__stopObserving__block_invoke_2;
  v3[3] = &unk_1E62C81C8;
  v3[4] = &v4;
  [v2 _enumerateObserversUsingBlock:v3];
  if (*((unsigned char *)v5 + 24)) {
    objc_msgSend(*(id *)(a1 + 32), "_queue_stopObservingHeartRateSummary");
  }
  _Block_object_dispose(&v4, 8);
}

uint64_t __42__NTKHeartRateQueryManager__stopObserving__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)_alreadyObserving
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  healthQueue = self->_healthQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NTKHeartRateQueryManager__alreadyObserving__block_invoke;
  v5[3] = &unk_1E62C3040;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(healthQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __45__NTKHeartRateQueryManager__alreadyObserving__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 40) != 0;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NTKHeartRateQueryManager__alreadyObserving__block_invoke_2;
  v5[3] = &unk_1E62C81C8;
  v5[4] = &v6;
  [v2 _enumerateObserversUsingBlock:v5];
  if (*((unsigned char *)v7 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    char v4 = *(unsigned char *)(v3 + 24);
    if (v4) {
      char v4 = *(void *)(*(void *)(a1 + 32) + 48) != 0;
    }
    *(unsigned char *)(v3 + 24) = v4;
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __45__NTKHeartRateQueryManager__alreadyObserving__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)addObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    if ([(NSHashTable *)self->_observers containsObject:v4])
    {
      os_unfair_lock_unlock(&self->_observersLock);
    }
    else
    {
      v5 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v7 = 138543362;
        *(void *)&v7[4] = objc_opt_class();
        id v6 = *(id *)&v7[4];
        _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: Adding observer %{public}@", v7, 0xCu);
      }
      [(NSHashTable *)self->_observers addObject:v4];
      os_unfair_lock_unlock(&self->_observersLock);
      [(NTKHeartRateQueryManager *)self _notifyObserversOfLatestSample];
      [(NTKHeartRateQueryManager *)self _notifyObserversOfLatestSummary];
    }
    [(NTKHeartRateQueryManager *)self startObservingIfNeeded];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_observersLock);
    [(NTKHeartRateQueryManager *)self _stopObservingIfNeeded];
  }
}

- (BOOL)_haveObservers
{
  uint64_t v2 = self;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  LOBYTE(v2) = [(NSHashTable *)v2->_observers count] != 0;
  os_unfair_lock_unlock(p_observersLock);
  return (char)v2;
}

- (void)_notifyObserversOfLatestSample
{
  uint64_t v3 = [(NTKHeartRateQueryManager *)self latestHeartRateSample];
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__NTKHeartRateQueryManager__notifyObserversOfLatestSample__block_invoke;
    v5[3] = &unk_1E62C09C0;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __58__NTKHeartRateQueryManager__notifyObserversOfLatestSample__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__NTKHeartRateQueryManager__notifyObserversOfLatestSample__block_invoke_2;
  v2[3] = &unk_1E62C81A0;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateObserversUsingBlock:v2];
}

uint64_t __58__NTKHeartRateQueryManager__notifyObserversOfLatestSample__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 manager:*(void *)(a1 + 32) receivedLatestHeartRateSample:*(void *)(a1 + 40)];
}

- (void)_queue_startObservingHeartRate
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: start observing heart rate query", (uint8_t *)&buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthQueue);
  if (!self->_heartRateQuery)
  {
    objc_initWeak(&buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__NTKHeartRateQueryManager__queue_startObservingHeartRate__block_invoke;
    aBlock[3] = &unk_1E62C8218;
    objc_copyWeak(&v24, &buf);
    id v4 = _Block_copy(aBlock);
    id v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    char v7 = [v5 predicateWithFormat:@"%K >= %@", *MEMORY[0x1E4F2A390], v6];

    uint64_t v8 = [MEMORY[0x1E4F2B3C0] _predicateForObjectsFromAppleWatches];
    char v9 = (void *)MEMORY[0x1E4F2B3C0];
    uint64_t v10 = [MEMORY[0x1E4F2B560] _blePeripheralSource];
    uint64_t v11 = [v9 predicateForObjectsFromSource:v10];

    uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
    v27[0] = v8;
    v27[1] = v11;
    char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    long long v14 = [v12 orPredicateWithSubpredicates:v13];

    long long v15 = (void *)MEMORY[0x1E4F28BA0];
    v26[0] = v14;
    v26[1] = v7;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    long long v17 = [v15 andPredicateWithSubpredicates:v16];

    id v18 = objc_alloc(MEMORY[0x1E4F2ABF0]);
    uint64_t v19 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    v20 = [MEMORY[0x1E4F2B3C8] latestAnchor];
    __int16 v21 = (HKAnchoredObjectQuery *)[v18 initWithType:v19 predicate:v17 anchor:v20 limit:0 resultsHandler:v4];
    heartRateQuery = self->_heartRateQuery;
    self->_heartRateQuery = v21;

    [(HKAnchoredObjectQuery *)self->_heartRateQuery setShouldSuppressDataCollection:1];
    [(HKAnchoredObjectQuery *)self->_heartRateQuery setUpdateHandler:v4];
    [(HKHealthStore *)self->_healthStore executeQuery:self->_heartRateQuery];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&buf);
  }
}

void __58__NTKHeartRateQueryManager__queue_startObservingHeartRate__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      uint64_t v12 = WeakRetained[2];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __58__NTKHeartRateQueryManager__queue_startObservingHeartRate__block_invoke_2;
      v15[3] = &unk_1E62C09C0;
      v15[4] = WeakRetained;
      id v16 = v9;
      dispatch_sync(v12, v15);
    }
    else
    {
      uint64_t v13 = [v8 count];
      long long v14 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 134217984;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: received %lu sample objects", buf, 0xCu);
      }

      if (v13) {
        [v11 setHeartRateSamples:v8];
      }
    }
  }
}

uint64_t __58__NTKHeartRateQueryManager__queue_startObservingHeartRate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearHeartRateSampleQueryWithError:", *(void *)(a1 + 40));
}

- (void)_queue_stopObservingHeartRate
{
}

- (void)_queue_retrieveLatestHeartRateOnce
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: requesting latest heart rate", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = objc_alloc(MEMORY[0x1E4F2B440]);
  id v5 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  id v6 = [MEMORY[0x1E4F2B3C0] _predicateForObjectsFromAppleWatches];
  char v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9B8] ascending:0];
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__NTKHeartRateQueryManager__queue_retrieveLatestHeartRateOnce__block_invoke;
  v10[3] = &unk_1E62C8240;
  objc_copyWeak(&v11, buf);
  id v9 = (void *)[v4 initWithSampleType:v5 predicate:v6 limit:1 sortDescriptors:v8 resultsHandler:v10];

  [(HKHealthStore *)self->_healthStore executeQuery:v9];
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __62__NTKHeartRateQueryManager__queue_retrieveLatestHeartRateOnce__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  id v11 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __62__NTKHeartRateQueryManager__queue_retrieveLatestHeartRateOnce__block_invoke_cold_1(v9, v11);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = [v8 count];
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: retrieve once: received %lu sample objects", (uint8_t *)&v13, 0xCu);
  }

  if ([v8 count])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v11 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _findLatestHeartRateSample:v8];
    }
LABEL_9:
  }
}

- (void)_findLatestHeartRateSample:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: finding latest heart rate sample", buf, 2u);
  }

  id v6 = [(NTKHeartRateQueryManager *)self latestHeartRateSample];
  if ([(NTKHeartRateQueryManager *)self canUseFutureSamples])
  {
    uint64_t v7 = [v4 lastObject];

    id v6 = (void *)v7;
    goto LABEL_22;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (!v9)
  {

    goto LABEL_24;
  }
  uint64_t v10 = v9;
  v26 = self;
  id v27 = v4;
  char v28 = 0;
  uint64_t v11 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend(v13, "startDate", v26, v27);
      [v14 timeIntervalSinceNow];
      double v16 = v15;

      if (v16 > 60.0)
      {
        long long v17 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = [v13 startDate];
          uint64_t v19 = [v13 quantity];
          *(_DWORD *)id buf = 138543618;
          v34 = v18;
          __int16 v35 = 2112;
          v36 = v19;
          _os_log_error_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_ERROR, "NTKHeartRateQueryManager: ignoring heart rate with future date: %{public}@ (%@).", buf, 0x16u);
        }
LABEL_18:

        continue;
      }
      if (!v6) {
        goto LABEL_15;
      }
      v20 = [v13 startDate];
      __int16 v21 = [v6 startDate];
      [v20 timeIntervalSinceDate:v21];
      double v23 = v22;

      if (v23 > 2.22044605e-16)
      {
LABEL_15:
        id v24 = v13;

        long long v17 = _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [v24 startDate];
          *(_DWORD *)id buf = 138543362;
          v34 = v25;
          _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: updated latest heart rate sample: %{public}@", buf, 0xCu);
        }
        char v28 = 1;
        id v6 = v24;
        goto LABEL_18;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  }
  while (v10);

  self = v26;
  id v4 = v27;
  if (v28)
  {
LABEL_22:
    [(NTKHeartRateQueryManager *)self setLatestHeartRateSample:v6];
    [(NTKHeartRateQueryManager *)self _notifyObserversOfLatestSample];
  }
LABEL_24:
}

- (HKQuantitySample)latestHeartRateSample
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40;
  uint64_t v10 = __Block_byref_object_dispose__40;
  id v11 = 0;
  sampleQueue = self->_sampleQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__NTKHeartRateQueryManager_latestHeartRateSample__block_invoke;
  v5[3] = &unk_1E62C3040;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(sampleQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKQuantitySample *)v3;
}

void __49__NTKHeartRateQueryManager_latestHeartRateSample__block_invoke(uint64_t a1)
{
}

- (void)setLatestHeartRateSample:(id)a3
{
  id v4 = a3;
  sampleQueue = self->_sampleQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NTKHeartRateQueryManager_setLatestHeartRateSample___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(sampleQueue, v7);
}

void __53__NTKHeartRateQueryManager_setLatestHeartRateSample___block_invoke(uint64_t a1)
{
}

- (HKHeartRateSummary)latestHeartRateSummary
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40;
  uint64_t v10 = __Block_byref_object_dispose__40;
  id v11 = 0;
  sampleQueue = self->_sampleQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__NTKHeartRateQueryManager_latestHeartRateSummary__block_invoke;
  v5[3] = &unk_1E62C3040;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(sampleQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKHeartRateSummary *)v3;
}

void __50__NTKHeartRateQueryManager_latestHeartRateSummary__block_invoke(uint64_t a1)
{
}

- (void)setLatestHeartRateSummary:(id)a3
{
  id v4 = a3;
  sampleQueue = self->_sampleQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__NTKHeartRateQueryManager_setLatestHeartRateSummary___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(sampleQueue, v7);
}

void __54__NTKHeartRateQueryManager_setLatestHeartRateSummary___block_invoke(uint64_t a1)
{
}

- (BOOL)canUseFutureSamples
{
  int v3 = NTKInternalBuild(self, a2);
  if (v3)
  {
    if (![(NTKHeartRateQueryManager *)self hasCheckedDefaults])
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.NanoTimeKit"];
      self->_canUseFutureSamples = [v4 BOOLForKey:@"useFutureSamples"];
      [(NTKHeartRateQueryManager *)self setCheckedDefaults:1];
    }
    LOBYTE(v3) = self->_canUseFutureSamples;
  }
  return v3;
}

- (BOOL)hasCheckedDefaults
{
  return self->_checkedDefaults;
}

- (void)setCheckedDefaults:(BOOL)a3
{
  self->_checkedDefaults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestHeartRateSummary, 0);
  objc_storeStrong((id *)&self->_latestHeartRateSample, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_heartRateSummaryQuery, 0);
  objc_storeStrong((id *)&self->_heartRateQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sampleQueue, 0);

  objc_storeStrong((id *)&self->_healthQueue, 0);
}

- (void)_queue_clearHeartRateSampleQueryWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "NTKHeartRateQueryManager: HKAnchoredObjectQuery failed. %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_clearHeartRateSummaryQueryWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "NTKHeartRateQueryManager: Heart Rate Summary Query failed. %{public}@", (uint8_t *)&v2, 0xCu);
}

void __62__NTKHeartRateQueryManager__queue_retrieveLatestHeartRateOnce__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "NTKHeartRateQueryManager: Error when attempting to retrieve the latest heart rate sample. %@", (uint8_t *)&v4, 0xCu);
}

@end