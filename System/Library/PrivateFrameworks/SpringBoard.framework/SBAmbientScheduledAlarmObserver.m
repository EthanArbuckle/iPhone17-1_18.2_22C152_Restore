@interface SBAmbientScheduledAlarmObserver
- (BOOL)observationEnabled;
- (MTAlarmManager)alarmManager;
- (NSMutableDictionary)scheduledTimers;
- (OS_dispatch_queue)scheduledTimerQueue;
- (SBAmbientScheduledAlarmObserver)init;
- (SBAmbientScheduledAlarmObserverDelegate)delegate;
- (id)_newScheduledTimerForFireDate:(id)a3;
- (id)_timeIntervalsWithReasons;
- (void)_firingAlarmUpdated:(id)a3;
- (void)_invalidateAllScheduledTimers;
- (void)_nextAlarmChanged:(id)a3;
- (void)_publishTimerFired:(id)a3;
- (void)_registerForAlarmNotifications;
- (void)_scheduleTimersForAlarm:(id)a3;
- (void)_timerFired:(id)a3;
- (void)_unregisterForAlarmNotifications;
- (void)_updateAlarmObservation;
- (void)_updateScheduledTimersForNextAlarm;
- (void)dealloc;
- (void)setAlarmManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObservationEnabled:(BOOL)a3;
- (void)setScheduledTimerQueue:(id)a3;
- (void)setScheduledTimers:(id)a3;
@end

@implementation SBAmbientScheduledAlarmObserver

- (SBAmbientScheduledAlarmObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBAmbientScheduledAlarmObserver;
  v2 = [(SBAmbientScheduledAlarmObserver *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.springboard.AmbientScheduledAlarmObserverQueue", v3);
    scheduledTimerQueue = v2->_scheduledTimerQueue;
    v2->_scheduledTimerQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scheduledTimers = v2->_scheduledTimers;
    v2->_scheduledTimers = v6;
  }
  return v2;
}

- (void)dealloc
{
  [(SBAmbientScheduledAlarmObserver *)self _unregisterForAlarmNotifications];
  [(SBAmbientScheduledAlarmObserver *)self _invalidateAllScheduledTimers];
  alarmManager = self->_alarmManager;
  self->_alarmManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBAmbientScheduledAlarmObserver;
  [(SBAmbientScheduledAlarmObserver *)&v4 dealloc];
}

- (void)setObservationEnabled:(BOOL)a3
{
  if (self->_observationEnabled != a3)
  {
    self->_observationEnabled = a3;
    [(SBAmbientScheduledAlarmObserver *)self _updateAlarmObservation];
  }
}

- (void)_updateAlarmObservation
{
  BOOL v3 = [(SBAmbientScheduledAlarmObserver *)self observationEnabled];
  alarmManager = self->_alarmManager;
  if (v3)
  {
    if (!alarmManager)
    {
      v5 = (MTAlarmManager *)objc_alloc_init(MEMORY[0x1E4F78B50]);
      v6 = self->_alarmManager;
      self->_alarmManager = v5;

      [(SBAmbientScheduledAlarmObserver *)self _registerForAlarmNotifications];
      [(SBAmbientScheduledAlarmObserver *)self _updateScheduledTimersForNextAlarm];
    }
  }
  else if (alarmManager)
  {
    [(SBAmbientScheduledAlarmObserver *)self _unregisterForAlarmNotifications];
    [(SBAmbientScheduledAlarmObserver *)self _invalidateAllScheduledTimers];
    v7 = self->_alarmManager;
    self->_alarmManager = 0;
  }
}

- (void)_invalidateAllScheduledTimers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_scheduledTimers count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v3 = [(NSMutableDictionary *)self->_scheduledTimers allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidate];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(NSMutableDictionary *)self->_scheduledTimers removeAllObjects];
  }
}

- (void)_registerForAlarmNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__nextAlarmChanged_ name:*MEMORY[0x1E4F78A80] object:self->_alarmManager];
  [v3 addObserver:self selector:sel__nextAlarmChanged_ name:*MEMORY[0x1E4F78A90] object:self->_alarmManager];
  [v3 addObserver:self selector:sel__firingAlarmUpdated_ name:*MEMORY[0x1E4F78A78] object:self->_alarmManager];
  [v3 addObserver:self selector:sel__firingAlarmUpdated_ name:*MEMORY[0x1E4F78A70] object:self->_alarmManager];
}

- (void)_unregisterForAlarmNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F78A80] object:self->_alarmManager];
  [v3 removeObserver:self name:*MEMORY[0x1E4F78A90] object:self->_alarmManager];
  [v3 removeObserver:self name:*MEMORY[0x1E4F78A78] object:self->_alarmManager];
  [v3 removeObserver:self name:*MEMORY[0x1E4F78A70] object:self->_alarmManager];
}

- (void)_nextAlarmChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F78A88]];
  long long v8 = SBSafeCast(v5, v7);

  long long v9 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = [v4 name];
    long long v11 = [v8 alarmID];
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Ambient Scheduled Alarm Observer recieved %{public}@ notification containing alarmID: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  [(SBAmbientScheduledAlarmObserver *)self _updateScheduledTimersForNextAlarm];
}

- (void)_firingAlarmUpdated:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    int v8 = 138543362;
    long long v9 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Ambient Scheduled Alarm Observer recieved %{public}@ notification for firing alarm update", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(SBAmbientScheduledAlarmObserver *)self delegate];
  [v7 alarmDidResetForAmbientScheduledAlarmObserver:self];

  [(SBAmbientScheduledAlarmObserver *)self _updateScheduledTimersForNextAlarm];
}

- (void)_updateScheduledTimersForNextAlarm
{
  id v3 = [(MTAlarmManager *)self->_alarmManager nextAlarm];
  if (v3)
  {
    objc_initWeak(location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__SBAmbientScheduledAlarmObserver__updateScheduledTimersForNextAlarm__block_invoke;
    v7[3] = &unk_1E6B02500;
    objc_copyWeak(&v8, location);
    id v4 = (id)[v3 addCompletionBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v5 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "No sleep alarm for ambient scheduled alarm observer!", (uint8_t *)location, 2u);
    }

    uint64_t v6 = [(SBAmbientScheduledAlarmObserver *)self delegate];
    [v6 alarmDidResetForAmbientScheduledAlarmObserver:self];
  }
}

void __69__SBAmbientScheduledAlarmObserver__updateScheduledTimersForNextAlarm__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = SBSafeCast(v4, v3);

  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__SBAmbientScheduledAlarmObserver__updateScheduledTimersForNextAlarm__block_invoke_2;
    block[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v12, (id *)(a1 + 32));
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v12);
  }
  else
  {
    uint64_t v6 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "No sleep alarm for ambient scheduled alarm observer!", v9, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = [WeakRetained delegate];
    [v8 alarmDidResetForAmbientScheduledAlarmObserver:WeakRetained];
  }
}

void __69__SBAmbientScheduledAlarmObserver__updateScheduledTimersForNextAlarm__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _scheduleTimersForAlarm:*(void *)(a1 + 32)];
}

- (void)_scheduleTimersForAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 nextFireDate];
  if (v5 && [(SBAmbientScheduledAlarmObserver *)self observationEnabled])
  {
    uint64_t v6 = [(SBAmbientScheduledAlarmObserver *)self _timeIntervalsWithReasons];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__SBAmbientScheduledAlarmObserver__scheduleTimersForAlarm___block_invoke;
    v7[3] = &unk_1E6B02528;
    id v8 = v5;
    long long v9 = self;
    id v10 = v4;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __59__SBAmbientScheduledAlarmObserver__scheduleTimersForAlarm___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [a3 doubleValue];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:*(void *)(a1 + 32) sinceDate:-v6];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [v8 compare:v7];

  if (v9 == -1)
  {
    id v11 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v5];
    id v10 = v11;
    if (v11) {
      [v11 invalidate];
    }
    id v12 = (void *)[*(id *)(a1 + 40) _newScheduledTimerForFireDate:v7];
    [*(id *)(*(void *)(a1 + 40) + 40) setValue:v12 forKey:v5];
    uint64_t v13 = SBLogAmbientPresentation();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [*(id *)(a1 + 48) alarmID];
      int v15 = 138544130;
      id v16 = v5;
      __int16 v17 = 2114;
      v18 = v14;
      __int16 v19 = 2114;
      v20 = v7;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Ambient Scheduled Alarm Observer scheduled new timer for %{public}@ for alarmID: %{public}@ with fire date %{public}@ [ timer = %{public}@ ]", (uint8_t *)&v15, 0x2Au);
    }
    goto LABEL_9;
  }
  if ([v7 compare:*(void *)(a1 + 32)] == -1)
  {
    id v10 = [*(id *)(a1 + 40) delegate];
    [v10 scheduledAlarmObserver:*(void *)(a1 + 40) timerFiredForReason:v5];
LABEL_9:
  }
}

- (id)_newScheduledTimerForFireDate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F89D38];
  id v5 = a3;
  double v6 = (void *)[[v4 alloc] initWithFireDate:v5 serviceIdentifier:@"com.apple.springboard.AmbientScheduledAlarmObserver" target:self selector:sel__timerFired_ userInfo:0];

  [v6 setMinimumEarlyFireProportion:1.0];
  [v6 setUserVisible:1];
  [v6 scheduleInQueue:self->_scheduledTimerQueue];
  return v6;
}

- (void)_timerFired:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Ambient Scheduled Alarm Observer scheduled timer fired! [ timer = %{public}@ ]", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SBAmbientScheduledAlarmObserver__timerFired___block_invoke;
  v7[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __47__SBAmbientScheduledAlarmObserver__timerFired___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _publishTimerFired:*(void *)(a1 + 32)];
}

- (void)_publishTimerFired:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_scheduledTimers allKeysForObject:a3];
  id v6 = [v4 firstObject];

  if (v6)
  {
    [(NSMutableDictionary *)self->_scheduledTimers removeObjectForKey:v6];
    id v5 = [(SBAmbientScheduledAlarmObserver *)self delegate];
    [v5 scheduledAlarmObserver:self timerFiredForReason:v6];
  }
}

- (id)_timeIntervalsWithReasons
{
  id v3 = [(SBAmbientScheduledAlarmObserver *)self delegate];
  id v4 = [v3 timeIntervalsWithReasonsForScheduledTimersForAmbientScheduledAlarmObserver:self];

  return v4;
}

- (SBAmbientScheduledAlarmObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAmbientScheduledAlarmObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)observationEnabled
{
  return self->_observationEnabled;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (OS_dispatch_queue)scheduledTimerQueue
{
  return self->_scheduledTimerQueue;
}

- (void)setScheduledTimerQueue:(id)a3
{
}

- (NSMutableDictionary)scheduledTimers
{
  return self->_scheduledTimers;
}

- (void)setScheduledTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledTimers, 0);
  objc_storeStrong((id *)&self->_scheduledTimerQueue, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end