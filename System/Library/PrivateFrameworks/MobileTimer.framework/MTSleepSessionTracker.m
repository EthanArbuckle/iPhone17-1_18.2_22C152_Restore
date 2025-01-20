@interface MTSleepSessionTracker
+ (BOOL)_trackingEnabledForSleepAlarm:(id)a3;
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (BOOL)trackingEnabled;
- (Class)sessionClass;
- (MTAlarm)cachedAlarm;
- (MTAlarmStorage)alarmStorage;
- (MTSleepSessionTracker)initWithAlarmStorage:(id)a3;
- (MTSleepSessionTrackerDelegate)sleepSessionTrackerDelegate;
- (os_unfair_lock_s)alarmLock;
- (void)_withLock:(id)a3;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)prepare;
- (void)setAlarmLock:(os_unfair_lock_s)a3;
- (void)setAlarmStorage:(id)a3;
- (void)setCachedAlarm:(id)a3;
- (void)setSleepSessionTrackerDelegate:(id)a3;
- (void)sleepCoordinator:(id)a3 bedtimeReminderWasConfirmed:(id)a4 sleepAlarm:(id)a5;
- (void)sleepCoordinator:(id)a3 sleepAlarmDidChange:(id)a4;
- (void)sleepCoordinator:(id)a3 wakeUpAlarmWasDismissed:(id)a4 dismissAction:(unint64_t)a5 sleepAlarm:(id)a6;
@end

@implementation MTSleepSessionTracker

- (MTSleepSessionTracker)initWithAlarmStorage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTSleepSessionTracker;
  v6 = [(MTSleepSessionTracker *)&v11 init];
  if (v6)
  {
    v7 = MTLogForCategory(7);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_alarmStorage, a3);
    uint64_t v8 = [(MTAlarmStorage *)v6->_alarmStorage sleepAlarm];
    cachedAlarm = v6->_cachedAlarm;
    v6->_cachedAlarm = (MTAlarm *)v8;

    v6->_alarmLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  p_alarmLock = &self->_alarmLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_alarmLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_alarmLock);
}

- (void)prepare
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__MTSleepSessionTracker_prepare__block_invoke;
  v2[3] = &unk_1E59150A8;
  v2[4] = self;
  [(MTSleepSessionTracker *)self _withLock:v2];
}

uint64_t __32__MTSleepSessionTracker_prepare__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) sleepAlarm];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)trackingEnabled
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__MTSleepSessionTracker_trackingEnabled__block_invoke;
  v4[3] = &unk_1E5915B40;
  v4[4] = self;
  v4[5] = &v5;
  [(MTSleepSessionTracker *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__MTSleepSessionTracker_trackingEnabled__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    if ([(id)objc_opt_class() _trackingEnabledForSleepAlarm:*(void *)(*(void *)(a1 + 32) + 24)]) {
      return;
    }
    char v2 = MTLogForCategory(7);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v3;
      uint64_t v4 = "%{public}@ feature not enabled";
LABEL_7:
      _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    char v2 = MTLogForCategory(7);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      uint64_t v4 = "%{public}@ no alarm, disabling";
      goto LABEL_7;
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

+ (BOOL)_trackingEnabledForSleepAlarm:(id)a3
{
  return 0;
}

- (MTAlarm)cachedAlarm
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__MTSleepSessionTracker_cachedAlarm__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  v4[5] = &v5;
  [(MTSleepSessionTracker *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (MTAlarm *)v2;
}

void __36__MTSleepSessionTracker_cachedAlarm__block_invoke(uint64_t a1)
{
}

- (void)setCachedAlarm:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MTSleepSessionTracker_setCachedAlarm___block_invoke;
  v6[3] = &unk_1E5915000;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MTSleepSessionTracker *)self _withLock:v6];
}

void __40__MTSleepSessionTracker_setCachedAlarm___block_invoke(uint64_t a1)
{
}

- (void)sleepCoordinator:(id)a3 sleepAlarmDidChange:(id)a4
{
}

- (void)sleepCoordinator:(id)a3 bedtimeReminderWasConfirmed:(id)a4 sleepAlarm:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(MTSleepSessionTracker *)self trackingEnabled])
  {
    id v7 = MTLogForCategory(7);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      v9 = self;
      __int16 v10 = 2114;
      id v11 = v6;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ user confirmed bedtime reminder (%{public}@).  Starting session.", (uint8_t *)&v8, 0x16u);
    }

    [(MTSleepSessionTracker *)self startSession];
  }
}

- (void)sleepCoordinator:(id)a3 wakeUpAlarmWasDismissed:(id)a4 dismissAction:(unint64_t)a5 sleepAlarm:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ([(MTSleepSessionTracker *)self trackingEnabled])
  {
    v9 = MTLogForCategory(7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = MTDismissAlarmActionDescription(a5);
      int v11 = 138543874;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ user woke up at %@ (%{public}@)", (uint8_t *)&v11, 0x20u);
    }
    [(MTSleepSessionTracker *)self endSessionWithDate:v8 reason:0];
  }
}

- (Class)sessionClass
{
  return 0;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return 0;
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (MTSleepSessionTrackerDelegate)sleepSessionTrackerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sleepSessionTrackerDelegate);
  return (MTSleepSessionTrackerDelegate *)WeakRetained;
}

- (void)setSleepSessionTrackerDelegate:(id)a3
{
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
}

- (os_unfair_lock_s)alarmLock
{
  return self->_alarmLock;
}

- (void)setAlarmLock:(os_unfair_lock_s)a3
{
  self->_alarmLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_cachedAlarm, 0);
  objc_destroyWeak((id *)&self->_sleepSessionTrackerDelegate);
}

@end