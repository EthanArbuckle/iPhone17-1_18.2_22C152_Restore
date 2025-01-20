@interface MTTimerScheduler
+ (id)_intervalToCheckForTimersToFireBeforeDate:(id)a3;
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (MTNotificationCenter)notificationCenter;
- (MTPersistence)defaults;
- (MTScheduledList)scheduledTimers;
- (MTSchedulingDelegate)schedulingDelegate;
- (MTTaskScheduler)taskScheduler;
- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4;
- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6;
- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6 schedulingDelegate:(id)a7 taskScheduler:(id)a8 currentDateProvider:(id)a9;
- (MTTimerSchedulerDelegate)delegate;
- (MTTimerStorage)storage;
- (NAScheduler)serializer;
- (id)_queue_lastTimerTriggerDate;
- (id)_queue_nextScheduledTimer;
- (id)_queue_nextTimer;
- (id)currentDateProvider;
- (id)gatherDiagnostics;
- (id)nextTimer;
- (id)nextTriggerDate;
- (id)sourceIdentifier;
- (void)_fireScheduledTimer:(id)a3 firedDate:(id)a4 completionBlock:(id)a5;
- (void)_queue_fireTriggeredTimersWithCompletionBlock:(id)a3;
- (void)_queue_rescheduleTimersWithCompletion:(id)a3;
- (void)_queue_scheduleTimers:(id)a3 withCompletion:(id)a4;
- (void)_queue_setLastTimerTriggerDate:(id)a3;
- (void)_queue_triggerDidFireForTimerWithCompletionBlock:(id)a3;
- (void)_queue_unregisterTimer;
- (void)_queue_unscheduleTimers:(id)a3;
- (void)_queue_updatePersistentTimerForNextTimerWithCompletion:(id)a3;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)printDiagnostics;
- (void)rescheduleTimers;
- (void)rescheduleTimersWithCompletion:(id)a3;
- (void)scheduleTimers:(id)a3;
- (void)scheduledListDidChange:(id)a3 withCompletion:(id)a4;
- (void)setDefaults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setStorage:(id)a3;
- (void)source:(id)a3 didAddTimers:(id)a4;
- (void)source:(id)a3 didDismissTimer:(id)a4;
- (void)source:(id)a3 didRemoveTimers:(id)a4;
- (void)source:(id)a3 didUpdateTimers:(id)a4;
- (void)unscheduleTimers:(id)a3;
@end

@implementation MTTimerScheduler

intptr_t __29__MTTimerScheduler_nextTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_nextTimer");
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v5);
}

- (id)_queue_nextTimer
{
  uint64_t v2 = [(MTTimerScheduler *)self _queue_nextScheduledTimer];
  uint64_t v3 = [v2 scheduleable];

  return v3;
}

- (id)_queue_nextScheduledTimer
{
  return [(MTScheduledList *)self->_scheduledTimers nextScheduledAlert];
}

- (id)nextTimer
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [(MTTimerScheduler *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__MTTimerScheduler_nextTimer__block_invoke;
  v8[3] = &unk_1E59150F8;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTTimerScheduler.access-queue", +[MTScheduler defaultPriority]);
  v9 = +[MTUserDefaults sharedUserDefaults];
  v10 = [(MTTimerScheduler *)self initWithStorage:v7 notificationCenter:v6 scheduler:v8 defaults:v9];

  return v10;
}

- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[MTXPCScheduler xpcSchedulerWithEvent:@"com.apple.MTTimerScheduler.timer-event"];
  v15 = objc_opt_new();
  id v16 = MTCurrentDateProvider();
  v17 = [(MTTimerScheduler *)self initWithStorage:v13 notificationCenter:v12 scheduler:v11 defaults:v10 schedulingDelegate:v14 taskScheduler:v15 currentDateProvider:v16];

  return v17;
}

- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6 schedulingDelegate:(id)a7 taskScheduler:(id)a8 currentDateProvider:(id)a9
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v16 = a8;
  id v17 = a9;
  v30.receiver = self;
  v30.super_class = (Class)MTTimerScheduler;
  v18 = [(MTTimerScheduler *)&v30 init];
  if (v18)
  {
    v19 = MTLogForCategory(4);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    uint64_t v20 = [v17 copy];
    id currentDateProvider = v18->_currentDateProvider;
    v18->_id currentDateProvider = (id)v20;

    objc_storeStrong((id *)&v18->_schedulingDelegate, a7);
    objc_storeStrong((id *)&v18->_taskScheduler, a8);
    objc_storeStrong((id *)&v18->_notificationCenter, a4);
    objc_storeStrong((id *)&v18->_defaults, a6);
    objc_storeStrong((id *)&v18->_storage, a3);
    [(MTTimerStorage *)v18->_storage registerObserver:v18];
    v22 = [[MTScheduledList alloc] initWithDelegate:v18];
    scheduledTimers = v18->_scheduledTimers;
    v18->_scheduledTimers = v22;

    objc_storeStrong((id *)&v18->_serializer, a5);
  }

  return v18;
}

- (id)nextTriggerDate
{
  uint64_t v2 = [(MTTimerScheduler *)self _queue_nextScheduledTimer];
  dispatch_semaphore_t v3 = [v2 trigger];
  v4 = [v3 triggerDate];

  return v4;
}

- (void)rescheduleTimers
{
}

- (void)rescheduleTimersWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MTTimerScheduler *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MTTimerScheduler_rescheduleTimersWithCompletion___block_invoke;
  v7[3] = &unk_1E59150D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __51__MTTimerScheduler_rescheduleTimersWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_rescheduleTimersWithCompletion:", *(void *)(a1 + 40));
}

- (void)_queue_rescheduleTimersWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  kdebug_trace();
  v5 = [(MTTimerScheduler *)self storage];
  id v6 = [v5 timers];

  id v7 = MTLogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = self;
    __int16 v13 = 2050;
    uint64_t v14 = [v6 count];
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ rescheduling %{public}ld timers", buf, 0x16u);
  }

  [(MTScheduledList *)self->_scheduledTimers reset];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__MTTimerScheduler__queue_rescheduleTimersWithCompletion___block_invoke;
  v9[3] = &unk_1E5915B68;
  id v10 = v4;
  id v8 = v4;
  [(MTTimerScheduler *)self _queue_scheduleTimers:v6 withCompletion:v9];
}

uint64_t __58__MTTimerScheduler__queue_rescheduleTimersWithCompletion___block_invoke(uint64_t a1)
{
  kdebug_trace();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    dispatch_semaphore_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)scheduleTimers:(id)a3
{
  id v4 = a3;
  v5 = [(MTTimerScheduler *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MTTimerScheduler_scheduleTimers___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __35__MTTimerScheduler_scheduleTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleTimers:withCompletion:", *(void *)(a1 + 40), 0);
}

- (void)unscheduleTimers:(id)a3
{
  id v4 = a3;
  v5 = [(MTTimerScheduler *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__MTTimerScheduler_unscheduleTimers___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __37__MTTimerScheduler_unscheduleTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleTimers:", *(void *)(a1 + 40));
}

- (void)_queue_scheduleTimers:(id)a3 withCompletion:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v41 = a4;
  id v7 = (*((void (**)(void))self->_currentDateProvider + 2))();
  v46 = self;
  id v8 = [(MTTimerScheduler *)self _queue_lastTimerTriggerDate];
  v9 = [v7 dateByAddingTimeInterval:-900.0];
  v42 = v9;
  if ([v8 mtIsBeforeOrSameAsDate:v9])
  {
    id v10 = MTLogForCategory(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v57 = self;
      __int16 v58 = 1024;
      *(_DWORD *)v59 = 15;
      *(_WORD *)&v59[4] = 2114;
      *(void *)&v59[6] = v9;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ fired last timer more than %d minutes ago.  Seeing if we have to fire any timers we missed since %{public}@", buf, 0x1Cu);
    }

    id v11 = v9;
LABEL_12:
    id v15 = v11;
    goto LABEL_13;
  }
  int v12 = [v8 mtIsAfterDate:v7];
  __int16 v13 = MTLogForCategory(4);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543874;
      v57 = v46;
      __int16 v58 = 1024;
      *(_DWORD *)v59 = 15;
      *(_WORD *)&v59[4] = 2114;
      *(void *)&v59[6] = v8;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ fired last timer less than %d minutes ago.  Seeing if we have to fire any timers we missed since %{public}@", buf, 0x1Cu);
    }

    id v11 = v8;
    goto LABEL_12;
  }
  if (v14)
  {
    *(_DWORD *)buf = 138543362;
    v57 = v46;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ the last timer fire date is ahead of the current date (probably because we went back in time).", buf, 0xCu);
  }

  id v15 = v7;
  [(MTTimerScheduler *)v46 _queue_setLastTimerTriggerDate:v15];
LABEL_13:
  v43 = v8;
  v44 = v7;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v52;
    unint64_t v20 = 0x1E5914000uLL;
    do
    {
      uint64_t v21 = 0;
      uint64_t v45 = v18;
      do
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v51 + 1) + 8 * v21);
        if ([v22 state] == 3)
        {
          uint64_t v23 = objc_opt_class();
          id v24 = [v22 fireTime];
          if (v24)
          {
            if (objc_opt_isKindOfClass()) {
              id v25 = v24;
            }
            else {
              id v25 = 0;
            }
            id v26 = v25;
            if (!v26)
            {
              v40 = [MEMORY[0x1E4F28B00] currentHandler];
              v39 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
              [v40 handleFailureInFunction:v39, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v23, objc_opt_class() file lineNumber description];
            }
          }
          else
          {
            id v26 = 0;
          }

          id v27 = [v26 date];
          if (([v27 mtIsBeforeDate:v15] & 1) == 0)
          {

            goto LABEL_32;
          }
          id v28 = (void *)[v22 mutableCopy];
          id v29 = MTLogForCategory(4);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            [v28 timerID];
            uint64_t v30 = v19;
            id v31 = v16;
            id v32 = v15;
            v34 = unint64_t v33 = v20;
            *(_DWORD *)buf = 138543618;
            v57 = v46;
            __int16 v58 = 2114;
            *(void *)v59 = v34;
            _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting really old running timer %{public}@ to stopped", buf, 0x16u);

            unint64_t v20 = v33;
            id v15 = v32;
            id v16 = v31;
            uint64_t v19 = v30;
            uint64_t v18 = v45;
          }

          [v28 setState:1];
          if (v28)
          {
            -[MTTimerStorage updateTimer:withCompletion:source:](v46->_storage, "updateTimer:withCompletion:source:", v28, 0);
            id v26 = v28;
LABEL_32:
          }
        }
        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v18);
  }

  v35 = MTNewChildActivityForName(17);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MTTimerScheduler__queue_scheduleTimers_withCompletion___block_invoke;
  block[3] = &unk_1E5916300;
  block[4] = v46;
  id v48 = v16;
  id v49 = v15;
  id v50 = v41;
  id v36 = v16;
  id v37 = v15;
  id v38 = v41;
  os_activity_apply(v35, block);
}

void __57__MTTimerScheduler__queue_scheduleTimers_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2050;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}lu timers", (uint8_t *)&v9, 0x16u);
  }

  v5 = [*(id *)(a1 + 32) scheduledTimers];
  [v5 schedule:*(void *)(a1 + 40) afterDate:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 56)];

  id v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 32);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled timers: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_queue_unscheduleTimers:(id)a3
{
  id v4 = a3;
  v5 = MTNewChildActivityForName(17);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MTTimerScheduler__queue_unscheduleTimers___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __44__MTTimerScheduler__queue_unscheduleTimers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2050;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ unscheduling %{public}lu timers", (uint8_t *)&v9, 0x16u);
  }

  v5 = [*(id *)(a1 + 32) scheduledTimers];
  [v5 unschedule:*(void *)(a1 + 40)];

  id v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 32);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled timers: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)scheduledListDidChange:(id)a3 withCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__MTTimerScheduler_scheduledListDidChange_withCompletion___block_invoke;
  v15[3] = &unk_1E5915B68;
  id v16 = v5;
  id v6 = v5;
  [(MTTimerScheduler *)self _queue_updatePersistentTimerForNextTimerWithCompletion:v15];
  uint64_t v7 = [(MTTimerScheduler *)self scheduledTimers];
  uint64_t v8 = [v7 nextScheduledAlertOrNotification];

  int v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 scheduleable];
    __int16 v11 = [v10 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    unint64_t v20 = v11;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ next timer changed: %{public}@", buf, 0x16u);
  }
  uint64_t v12 = MTLogForCategory(9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_INFO, "MTTimerScheduler - Changing Next Timer", buf, 2u);
  }

  uint64_t v13 = [(MTTimerScheduler *)self delegate];
  BOOL v14 = [v8 scheduleable];
  [v13 scheduler:self didChangeNextTimer:v14];
}

uint64_t __58__MTTimerScheduler_scheduledListDidChange_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_queue_updatePersistentTimerForNextTimerWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  id v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MTTimerScheduler *)self scheduledTimers];
    *(_DWORD *)buf = 138543618;
    unint64_t v20 = self;
    __int16 v21 = 2050;
    double v22 = COERCE_DOUBLE([v6 numberOfScheduledAlertsAndNotifications]);
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistent timer for %{public}ld scheduled timers", buf, 0x16u);
  }
  uint64_t v7 = [(MTTimerScheduler *)self nextTriggerDate];
  double v8 = [v7 dateByAddingTimeInterval:-10.0];

  if (v8 == 0.0)
  {
    [(MTTimerScheduler *)self _queue_unregisterTimer];
    if (!v4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  int v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unint64_t v20 = self;
    __int16 v21 = 2114;
    double v22 = v8;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling persistent timer for next timer at %{public}@", buf, 0x16u);
  }

  uint64_t v10 = (*((void (**)(void))self->_currentDateProvider + 2))();
  [*(id *)&v8 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 <= 0.0)
  {
    id v16 = MTLogForCategory(4);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v20 = self;
      _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer should have fired. Triggering it now", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__MTTimerScheduler__queue_updatePersistentTimerForNextTimerWithCompletion___block_invoke;
    v17[3] = &unk_1E5915B68;
    uint64_t v18 = v4;
    [(MTTimerScheduler *)self _queue_fireTriggeredTimersWithCompletionBlock:v17];

    goto LABEL_20;
  }
  uint64_t v13 = MTLogForCategory(4);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12 <= 60.0)
  {
    if (!v14) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543618;
    unint64_t v20 = self;
    __int16 v21 = 2048;
    double v22 = v12;
    id v15 = "%{public}@ Timer will fire %f seconds from now";
  }
  else
  {
    if (!v14) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543618;
    unint64_t v20 = self;
    __int16 v21 = 2048;
    double v22 = v12 / 60.0;
    id v15 = "%{public}@ Timer will fire %f minutes from now";
  }
  _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
LABEL_18:

  kdebug_trace();
  [(MTSchedulingDelegate *)self->_schedulingDelegate scheduleTimerForSeconds:v12];
  kdebug_trace();
  if (v4) {
LABEL_19:
  }
    v4[2](v4);
LABEL_20:
}

uint64_t __75__MTTimerScheduler__queue_updatePersistentTimerForNextTimerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_queue_unregisterTimer
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Unscheduling persistent timer.", (uint8_t *)&v4, 0xCu);
  }

  [(MTSchedulingDelegate *)self->_schedulingDelegate unscheduleTimer];
}

+ (id)_intervalToCheckForTimersToFireBeforeDate:(id)a3
{
  id v3 = a3;
  int v4 = [v3 dateByAddingTimeInterval:10.0];
  id v5 = [v3 dateByAddingTimeInterval:-900.0];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v4];
  return v6;
}

- (void)_queue_triggerDidFireForTimerWithCompletionBlock:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer timer fired", (uint8_t *)&v6, 0xCu);
  }

  [(MTTimerScheduler *)self _queue_unregisterTimer];
  [(MTTimerScheduler *)self _queue_fireTriggeredTimersWithCompletionBlock:v4];
}

- (void)_fireScheduledTimer:(id)a3 firedDate:(id)a4 completionBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  scheduledTimers = self->_scheduledTimers;
  double v11 = (void (**)(void))a5;
  if ([(MTScheduledList *)scheduledTimers isScheduled:v8])
  {
    double v12 = MTLogForCategory(9);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_INFO, "MTTimerScheduler - Firing Timer", buf, 2u);
    }

    [(MTScheduledList *)self->_scheduledTimers _unscheduleObject:v8];
    [(MTNotificationCenter *)self->_notificationCenter postNotificationForScheduledTimer:v8 completionBlock:v11];

    [(MTTimerScheduler *)self _queue_setLastTimerTriggerDate:v9];
    uint64_t v13 = [v8 scheduleable];
    BOOL v14 = [v13 timerByUpdatingWithState:1];
    id v15 = (void *)[v14 mutableCopy];

    [v15 setFiredDate:v9];
    id v16 = [(MTTimerScheduler *)self storage];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__MTTimerScheduler__fireScheduledTimer_firedDate_completionBlock___block_invoke;
    v20[3] = &unk_1E5916328;
    id v21 = v15;
    id v22 = v8;
    uint64_t v23 = self;
    double v11 = v15;
    [v16 updateTimer:v11 withCompletion:v20 source:self];
  }
  else
  {
    uint64_t v17 = MTLogForCategory(4);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v8 scheduleable];
      __int16 v19 = [v18 identifier];
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v19;
      _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer %{public}@ was supposed to fire but is no longer scheduled", buf, 0x16u);
    }
    v11[2](v11);
  }
}

void __66__MTTimerScheduler__fireScheduledTimer_firedDate_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) trigger];
  id v4 = +[MTScheduledObject scheduledObjectForScheduleable:v2 trigger:v3];

  id v5 = [*(id *)(a1 + 48) delegate];
  [v5 scheduler:*(void *)(a1 + 48) didFireTimer:v4];

  int v6 = [*(id *)(a1 + 48) serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MTTimerScheduler__fireScheduledTimer_firedDate_completionBlock___block_invoke_2;
  v7[3] = &unk_1E59150A8;
  v7[4] = *(void *)(a1 + 48);
  [v6 performBlock:v7];
}

void __66__MTTimerScheduler__fireScheduledTimer_firedDate_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) scheduledTimers];
  id v3 = [v2 nextScheduledAlertOrNotification];

  if (!v3)
  {
    id v4 = MTLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no next timer", (uint8_t *)&v7, 0xCu);
    }

    int v6 = [*(id *)(a1 + 32) delegate];
    [v6 scheduler:*(void *)(a1 + 32) didChangeNextTimer:0];
  }
}

- (void)_queue_fireTriggeredTimersWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTNewChildActivityForName(18);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E59150D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serializer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E59150D0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performBlock:v4];
}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v3;
    __int16 v45 = 2114;
    uint64_t v46 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduled timers: %{public}@", buf, 0x16u);
  }

  id v5 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
  uint64_t v6 = [(id)objc_opt_class() _intervalToCheckForTimersToFireBeforeDate:v5];
  int v7 = MTLogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v8;
    __int16 v45 = 2114;
    uint64_t v46 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Find notifications with current trigger date in range %{public}@", buf, 0x16u);
  }

  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 32) scheduledObjectsToFireInInterval:v6];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v34 = [v10 countByEnumeratingWithState:&v39 objects:v49 count:16];
  id v31 = (void *)v6;
  if (v34)
  {
    uint64_t v11 = *(void *)v40;
    uint64_t v32 = a1;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v5;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v10);
        }
        BOOL v14 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
        id v15 = [v14 trigger];
        id v16 = [v15 triggerDate];

        id v5 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();

        double v17 = 0.0;
        if ([v5 mtIsBeforeDate:v16])
        {
          [v16 timeIntervalSinceDate:v5];
          double v17 = v18;
          __int16 v19 = MTLogForCategory(4);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v33 = v5;
            uint64_t v20 = v11;
            id v21 = v10;
            id v22 = v9;
            uint64_t v23 = *(void *)(a1 + 32);
            id v24 = [v14 scheduleable];
            id v25 = [v24 identifier];
            *(_DWORD *)buf = 138543874;
            uint64_t v44 = v23;
            uint64_t v9 = v22;
            uint64_t v10 = v21;
            uint64_t v11 = v20;
            id v5 = v33;
            __int16 v45 = 2114;
            uint64_t v46 = (uint64_t)v25;
            __int16 v47 = 2048;
            double v48 = v17;
            _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer %{public}@ should actually fire in %f seconds", buf, 0x20u);

            a1 = v32;
          }
        }
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_24;
        v37[3] = &unk_1E5916350;
        v37[4] = *(void *)(a1 + 32);
        v37[5] = v14;
        id v38 = v16;
        id v26 = v16;
        id v27 = +[MTTask taskWithIdentifier:@"com.apple.MTTimerTask.fire" delay:v37 completableBlock:v17];
        [v9 addObject:v27];

        ++v12;
        uint64_t v13 = v5;
      }
      while (v34 != v12);
      uint64_t v34 = [v10 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v34);
  }
  kdebug_trace();
  uint64_t v28 = *(void *)(a1 + 32);
  id v29 = *(void **)(v28 + 64);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_3;
  v35[3] = &unk_1E59150D0;
  v35[4] = v28;
  id v36 = *(id *)(a1 + 40);
  uint64_t v30 = +[MTTaskGroup taskGroupWithTasks:v9 completionBlock:v35];
  [v29 scheduleTaskGroup:v30];
}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  uint64_t v4 = [*(id *)(a1 + 32) serializer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_2_25;
  v6[3] = &unk_1E5916300;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  [v4 performBlock:v6];
}

uint64_t __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_2_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireScheduledTimer:*(void *)(a1 + 40) firedDate:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_4;
  long long v7 = &unk_1E59163A0;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v2;
  id v3 = +[MTTask taskWithIdentifier:@"com.apple.MTTimerTask.reschedule" completableBlock:&v4];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "scheduleTask:", v3, v4, v5, v6, v7, v8);
}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fired all timers.  Rescheduling.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_28;
  v8[3] = &unk_1E5916378;
  uint64_t v6 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v6 rescheduleTimersWithCompletion:v8];
}

uint64_t __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_28(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)_queue_lastTimerTriggerDate
{
  defaults = self->_defaults;
  id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v4 = [(MTPersistence *)defaults objectForKey:@"MTTimerLastTriggerDate" defaultValue:v3];

  return v4;
}

- (void)_queue_setLastTimerTriggerDate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting last timer trigger date to %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(MTPersistence *)self->_defaults setObject:v4 forKey:@"MTTimerLastTriggerDate"];
}

- (void)printDiagnostics
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTTimerScheduler-----", (uint8_t *)&v6, 2u);
  }

  id v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(MTTimerScheduler *)self scheduledTimers];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Scheduled Timers: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)gatherDiagnostics
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"Scheduled timers";
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  id v3 = [(MTTimerScheduler *)self scheduledTimers];
  id v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfScheduledAlerts"));
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  if (a4 == 2) {
    return [a3 isEqualToString:@"com.apple.MTTimerScheduler.timer-event"];
  }
  else {
    return 0;
  }
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v6 = a5;
  kdebug_trace();
  id v7 = [(MTTimerScheduler *)self serializer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__MTTimerScheduler_handleNotification_ofType_completion___block_invoke;
  v9[3] = &unk_1E59150D0;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlock:v9];
}

void __57__MTTimerScheduler_handleNotification_ofType_completion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__MTTimerScheduler_handleNotification_ofType_completion___block_invoke_2;
  v2[3] = &unk_1E5915B68;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_queue_triggerDidFireForTimerWithCompletionBlock:", v2);
}

uint64_t __57__MTTimerScheduler_handleNotification_ofType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
}

- (void)source:(id)a3 didUpdateTimers:(id)a4
{
}

- (void)source:(id)a3 didRemoveTimers:(id)a4
{
}

- (void)source:(id)a3 didDismissTimer:(id)a4
{
  id v5 = a4;
  id v6 = [(MTTimerScheduler *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __43__MTTimerScheduler_source_didDismissTimer___block_invoke;
  v8[3] = &unk_1E5915000;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [v6 performBlock:v8];
}

uint64_t __43__MTTimerScheduler_source_didDismissTimer___block_invoke(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v2 = MTLogForCategory(4);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(v1 + 32);
        uint64_t v3 = *(void *)(v1 + 40);
        int v5 = 138543618;
        uint64_t v6 = v3;
        __int16 v7 = 2114;
        uint64_t v8 = v4;
        _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Dismissing notifications for timer: %{public}@", (uint8_t *)&v5, 0x16u);
      }

      return [*(id *)(*(void *)(v1 + 40) + 24) dismissNotificationsForTimer:*(void *)(v1 + 32)];
    }
  }
  return result;
}

- (id)sourceIdentifier
{
  return @"MTTimerScheduler";
}

- (MTTimerSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTTimerSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTTimerStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (MTNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (MTScheduledList)scheduledTimers
{
  return self->_scheduledTimers;
}

- (void)setSerializer:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (MTSchedulingDelegate)schedulingDelegate
{
  return self->_schedulingDelegate;
}

- (MTTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (MTPersistence)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_schedulingDelegate, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_scheduledTimers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end