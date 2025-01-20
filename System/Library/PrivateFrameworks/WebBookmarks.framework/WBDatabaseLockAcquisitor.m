@interface WBDatabaseLockAcquisitor
- (BOOL)_attemptToLockSyncAndNotifyDelegateOnFailure:(BOOL)a3;
- (WBDatabaseLockAcquisitor)initWithWebBookmarkCollectionClass:(Class)a3;
- (WBDatabaseLockAcquisitorDelegate)delegate;
- (void)_retryTimerFired:(id)a3;
- (void)_startTimerWithTimeout:(double)a3 retryInterval:(double)a4;
- (void)_stopTimer;
- (void)acquireLockWithTimeout:(double)a3;
- (void)acquireLockWithTimeout:(double)a3 retryInterval:(double)a4;
- (void)dealloc;
- (void)releaseLock;
- (void)setDelegate:(id)a3;
@end

@implementation WBDatabaseLockAcquisitor

- (void)setDelegate:(id)a3
{
}

- (WBDatabaseLockAcquisitor)initWithWebBookmarkCollectionClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WBDatabaseLockAcquisitor;
  v4 = [(WBDatabaseLockAcquisitor *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_webBookmarkCollectionClass = a3;
    v6 = v4;
  }

  return v5;
}

- (void)dealloc
{
  [(WBDatabaseLockAcquisitor *)self releaseLock];
  v3.receiver = self;
  v3.super_class = (Class)WBDatabaseLockAcquisitor;
  [(WBDatabaseLockAcquisitor *)&v3 dealloc];
}

- (void)acquireLockWithTimeout:(double)a3
{
}

- (void)acquireLockWithTimeout:(double)a3 retryInterval:(double)a4
{
  [(objc_class *)self->_webBookmarkCollectionClass holdLockSync:self];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WBDatabaseLockAcquisitor_acquireLockWithTimeout_retryInterval___block_invoke;
  block[3] = &unk_2643DC5B0;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __65__WBDatabaseLockAcquisitor_acquireLockWithTimeout_retryInterval___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 32) _attemptToLockSyncAndNotifyDelegateOnFailure:v2 < v3];
  if (v2 >= v3 && (result & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    double v6 = *(double *)(a1 + 40);
    double v7 = *(double *)(a1 + 48);
    return [v5 _startTimerWithTimeout:v6 retryInterval:v7];
  }
  return result;
}

- (void)releaseLock
{
  double v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "WBDatabaseLockAcquisitor: releasing database lock", buf, 2u);
  }
  [(WBDatabaseLockAcquisitor *)self _stopTimer];
  [(objc_class *)self->_webBookmarkCollectionClass unholdLockSync:self];
  if (self->_lockAcquired)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_DEFAULT, "Unlocking sync since lock was previously acquired", v5, 2u);
    }
    [(objc_class *)self->_webBookmarkCollectionClass unlockSync];
  }
}

- (BOOL)_attemptToLockSyncAndNotifyDelegateOnFailure:(BOOL)a3
{
  LODWORD(v3) = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();
  int v7 = [(objc_class *)self->_webBookmarkCollectionClass isLockedSync];
  if ((v7 & 1) == 0)
  {
    int v8 = [(objc_class *)self->_webBookmarkCollectionClass lockSync];
    self->_BOOL lockAcquired = v8;
    if (!v8)
    {
      if (!v3) {
        goto LABEL_10;
      }
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      BOOL v3 = 0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_DEFAULT, "WBDatabaseLockAcquisitor: failed to acquire database lock", (uint8_t *)v13, 2u);
        BOOL v3 = 0;
      }
      goto LABEL_6;
    }
  }
  v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL lockAcquired = self->_lockAcquired;
    v13[0] = 67109632;
    v13[1] = v7;
    __int16 v14 = 1024;
    BOOL v15 = lockAcquired;
    __int16 v16 = 1024;
    int v17 = v6 & 1;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_DEFAULT, "WBDatabaseLockAcquisitor: successfully acquired database lock (was locked: %d, lock acquired: %d, should notify: %d)", (uint8_t *)v13, 0x14u);
  }
  [(WBDatabaseLockAcquisitor *)self _stopTimer];
  BOOL v3 = 1;
  if (v6) {
LABEL_6:
  }
    [WeakRetained databaseLockAcquisitor:self acquiredLock:v3];
LABEL_10:

  return v3;
}

- (void)_stopTimer
{
  p_timer = &self->_timer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timer);
  int v4 = [WeakRetained isValid];

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_timer);
    [v5 invalidate];

    objc_storeWeak((id *)p_timer, 0);
  }
}

- (void)_startTimerWithTimeout:(double)a3 retryInterval:(double)a4
{
  [(WBDatabaseLockAcquisitor *)self _stopTimer];
  self->_maxRetryCount = llround(a3 / a4);
  id v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__retryTimerFired_ selector:0 userInfo:1 repeats:a4];
  objc_storeWeak((id *)&self->_timer, v7);
}

- (void)_retryTimerFired:(id)a3
{
  id v4 = a3;
  int64_t maxRetryCount = self->_maxRetryCount;
  int64_t v6 = self->_retryCount + 1;
  self->_retryCount = v6;
  if (v6 >= maxRetryCount)
  {
    id v7 = v4;
    if ([(WBDatabaseLockAcquisitor *)self _attemptToLockSyncAndNotifyDelegateOnFailure:1])
    {
      [(WBDatabaseLockAcquisitor *)self _stopTimer];
    }
    else
    {
      [(WBDatabaseLockAcquisitor *)self releaseLock];
    }
    id v4 = v7;
  }
}

- (WBDatabaseLockAcquisitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBDatabaseLockAcquisitorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_timer);
}

@end