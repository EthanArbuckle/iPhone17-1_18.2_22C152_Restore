@interface MTAlarmScheduler
+ (id)_intervalToCheckForAlarmsToFireBeforeDate:(id)a3;
- (BOOL)_shouldPostNotificationForScheduledAlarm:(id)a3;
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (MTAlarmScheduleDelegate)delegate;
- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4;
- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6;
- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6 schedulingDelegate:(id)a7 taskScheduler:(id)a8 currentDateProvider:(id)a9;
- (MTAlarmStorage)storage;
- (MTNotificationCenter)notificationCenter;
- (MTPersistence)defaults;
- (MTScheduledList)scheduledAlarms;
- (MTSchedulingDelegate)schedulingDelegate;
- (MTTaskScheduler)taskScheduler;
- (NAScheduler)serializer;
- (id)_additionalAlarmsToScheduleForAlarms:(id)a3;
- (id)_lastAlarmTriggerDate;
- (id)_nextScheduledAlertIncludingBedtimeNotification:(BOOL)a3;
- (id)_nextTriggerDateForScheduling;
- (id)currentDateProvider;
- (id)gatherDiagnostics;
- (id)nextAlarm;
- (id)nextAlarmIncludingBedtimeNotification:(BOOL)a3;
- (id)nextScheduledAlarmIncludingBedtimeNotification:(BOOL)a3;
- (id)nextTriggerDate;
- (id)nextTriggerDateIncludingBedtimeNotification:(BOOL)a3;
- (id)sourceIdentifier;
- (void)_fireScheduledAlarm:(id)a3 firedDate:(id)a4 completionBlock:(id)a5;
- (void)_queue_fireTriggeredAlarmsWithCompletionBlock:(id)a3;
- (void)_queue_triggerDidFireForAlarmWithCompletionBlock:(id)a3;
- (void)_queue_unregisterTimer;
- (void)_queue_updateNextAlarmTimerWithCompletion:(id)a3;
- (void)_rescheduleAlarmsWithCompletion:(id)a3;
- (void)_scheduleAlarms:(id)a3 withCompletion:(id)a4;
- (void)_setLastAlarmTriggerDate:(id)a3;
- (void)_unscheduleAlarms:(id)a3;
- (void)cleanDeliveredNotifications;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)printDiagnostics;
- (void)rescheduleAlarmsWithCompletion:(id)a3;
- (void)scheduleAlarms:(id)a3;
- (void)scheduledListDidChange:(id)a3 withCompletion:(id)a4;
- (void)setDefaults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)source:(id)a3 didAddAlarms:(id)a4;
- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)source:(id)a3 didRemoveAlarms:(id)a4;
- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5;
- (void)source:(id)a3 didUpdateAlarms:(id)a4;
- (void)unscheduleAlarms:(id)a3;
@end

@implementation MTAlarmScheduler

intptr_t __67__MTAlarmScheduler_nextScheduledAlarmIncludingBedtimeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nextScheduledAlertIncludingBedtimeNotification:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v5);
}

- (id)_nextScheduledAlertIncludingBedtimeNotification:(BOOL)a3
{
  scheduledAlarms = self->_scheduledAlarms;
  if (a3) {
    [(MTScheduledList *)scheduledAlarms nextScheduledAlertOrNotification];
  }
  else {
  v4 = [(MTScheduledList *)scheduledAlarms nextScheduledAlert];
  }
  return v4;
}

- (id)nextAlarm
{
  return [(MTAlarmScheduler *)self nextAlarmIncludingBedtimeNotification:0];
}

- (id)nextAlarmIncludingBedtimeNotification:(BOOL)a3
{
  uint64_t v3 = [(MTAlarmScheduler *)self nextScheduledAlarmIncludingBedtimeNotification:a3];
  v4 = [v3 scheduleable];

  return v4;
}

- (id)nextScheduledAlarmIncludingBedtimeNotification:(BOOL)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = [(MTAlarmScheduler *)self serializer];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__MTAlarmScheduler_nextScheduledAlarmIncludingBedtimeNotification___block_invoke;
  v10[3] = &unk_1E59163C8;
  v12 = &v14;
  v10[4] = self;
  BOOL v13 = a3;
  v7 = v5;
  v11 = v7;
  [v6 performBlock:v10];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTAlarmScheduler.access-queue", +[MTScheduler defaultPriority]);
  v9 = +[MTUserDefaults sharedUserDefaults];
  v10 = [(MTAlarmScheduler *)self initWithStorage:v7 notificationCenter:v6 scheduler:v8 defaults:v9];

  return v10;
}

- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = +[MTXPCScheduler xpcSchedulerWithEvent:@"com.apple.MTAlarmScheduler.alarm-event"];
  v15 = objc_opt_new();
  uint64_t v16 = MTCurrentDateProvider();
  v17 = [(MTAlarmScheduler *)self initWithStorage:v13 notificationCenter:v12 scheduler:v11 defaults:v10 schedulingDelegate:v14 taskScheduler:v15 currentDateProvider:v16];

  return v17;
}

- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6 schedulingDelegate:(id)a7 taskScheduler:(id)a8 currentDateProvider:(id)a9
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v18 = a9;
  v31.receiver = self;
  v31.super_class = (Class)MTAlarmScheduler;
  id v19 = [(MTAlarmScheduler *)&v31 init];
  if (v19)
  {
    id v26 = v17;
    v20 = MTLogForCategory(3);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    uint64_t v21 = [v18 copy];
    id currentDateProvider = v19->_currentDateProvider;
    v19->_id currentDateProvider = (id)v21;

    objc_storeStrong((id *)&v19->_schedulingDelegate, a7);
    objc_storeStrong((id *)&v19->_taskScheduler, a8);
    objc_storeStrong((id *)&v19->_notificationCenter, a4);
    objc_storeStrong((id *)&v19->_defaults, a6);
    objc_storeStrong((id *)&v19->_storage, a3);
    [v16 registerObserver:v19];
    v23 = [[MTScheduledList alloc] initWithDelegate:v19];
    scheduledAlarms = v19->_scheduledAlarms;
    v19->_scheduledAlarms = v23;

    objc_storeStrong((id *)&v19->_serializer, a5);
    id v17 = v26;
  }

  return v19;
}

- (void)rescheduleAlarmsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(MTAlarmScheduler *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MTAlarmScheduler_rescheduleAlarmsWithCompletion___block_invoke;
  v7[3] = &unk_1E59150D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __51__MTAlarmScheduler_rescheduleAlarmsWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleAlarmsWithCompletion:*(void *)(a1 + 40)];
}

- (void)cleanDeliveredNotifications
{
  uint64_t v3 = [(MTAlarmScheduler *)self notificationCenter];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MTAlarmScheduler *)self notificationCenter];
    [v5 removeAllDeliveredNotifications];
  }
}

- (void)_rescheduleAlarmsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MTAlarmScheduler *)self storage];
  id v6 = [v5 allAlarms];

  id v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    v9 = self;
    __int16 v10 = 2050;
    uint64_t v11 = [v6 count];
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ rescheduling %{public}ld alarms", (uint8_t *)&v8, 0x16u);
  }

  [(MTScheduledList *)self->_scheduledAlarms reset];
  [(MTAlarmScheduler *)self _scheduleAlarms:v6 withCompletion:v4];
}

- (void)scheduleAlarms:(id)a3
{
  id v4 = a3;
  id v5 = [(MTAlarmScheduler *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MTAlarmScheduler_scheduleAlarms___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __35__MTAlarmScheduler_scheduleAlarms___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MTLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    int v11 = 138543618;
    uint64_t v12 = v3;
    __int16 v13 = 2050;
    uint64_t v14 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}ld alarms", (uint8_t *)&v11, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) _additionalAlarmsToScheduleForAlarms:*(void *)(a1 + 40)];
  id v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v5 count];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2050;
    uint64_t v14 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}ld additional alarms", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(void **)(a1 + 32);
  __int16 v10 = [*(id *)(a1 + 40) arrayByAddingObjectsFromArray:v5];
  [v9 _scheduleAlarms:v10 withCompletion:0];
}

- (id)_additionalAlarmsToScheduleForAlarms:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MTAlarmScheduler__additionalAlarmsToScheduleForAlarms___block_invoke;
  v10[3] = &unk_1E59162B0;
  v10[4] = &v11;
  void v10[5] = &v15;
  objc_msgSend(v4, "na_each:", v10);
  if (*((unsigned __int8 *)v16 + 24) == *((unsigned __int8 *)v12 + 24))
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v6 = [(MTAlarmScheduler *)self storage];
    uint64_t v7 = [v6 sleepAlarms];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__MTAlarmScheduler__additionalAlarmsToScheduleForAlarms___block_invoke_2;
    v9[3] = &unk_1E59162D8;
    v9[4] = &v15;
    id v5 = objc_msgSend(v7, "na_filter:", v9);
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

uint64_t __57__MTAlarmScheduler__additionalAlarmsToScheduleForAlarms___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 isSleepAlarm];
  id v4 = v7;
  if (v3)
  {
    uint64_t v3 = [v7 isSingleTimeAlarm];
    if (v3) {
      uint64_t v5 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v5 = *(void *)(a1 + 40);
    }
    *(unsigned char *)(*(void *)(v5 + 8) + 24) = 1;
    id v4 = v7;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __57__MTAlarmScheduler__additionalAlarmsToScheduleForAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
  return [a2 isSingleTimeAlarm] ^ v2;
}

- (void)_scheduleAlarms:(id)a3 withCompletion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  kdebug_trace();
  id v7 = (*((void (**)(void))self->_currentDateProvider + 2))();
  uint64_t v8 = [(MTAlarmScheduler *)self _lastAlarmTriggerDate];
  v9 = [v7 dateByAddingTimeInterval:-900.0];
  v40 = v9;
  if ([v8 mtIsBeforeOrSameAsDate:v9])
  {
    __int16 v10 = MTLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v52 = self;
      __int16 v53 = 1024;
      *(_DWORD *)v54 = 15;
      *(_WORD *)&v54[4] = 2114;
      *(void *)&v54[6] = v9;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ fired last alarm more than %d minutes ago.  Seeing if we have to fire any alarms we missed since %{public}@", buf, 0x1Cu);
    }

    id v11 = v9;
  }
  else
  {
    int v12 = [v8 mtIsAfterDate:v7];
    uint64_t v13 = MTLogForCategory(3);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v52 = self;
        _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ the last alarm fire date is ahead of the current date (probably because we went back in time).", buf, 0xCu);
      }

      id v15 = v7;
      [(MTAlarmScheduler *)self _setLastAlarmTriggerDate:v15];
      goto LABEL_13;
    }
    if (v14)
    {
      *(_DWORD *)buf = 138543874;
      v52 = self;
      __int16 v53 = 1024;
      *(_DWORD *)v54 = 15;
      *(_WORD *)&v54[4] = 2114;
      *(void *)&v54[6] = v8;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ fired last alarm less than %d minutes ago.  Seeing if we have to fire any alarms we missed since %{public}@", buf, 0x1Cu);
    }

    id v11 = v8;
  }
  id v15 = v11;
LABEL_13:
  v41 = v8;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v17) {
    goto LABEL_39;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v47;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v47 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void **)(*((void *)&v46 + 1) + 8 * v20);
      if ([v21 isSnoozed]
        && ([v21 snoozeFireDate],
            v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = [v22 mtIsBeforeDate:v15],
            v22,
            v23))
      {
        v24 = (void *)[v21 mutableCopy];
        if ([v21 repeats] & 1) != 0 || (objc_msgSend(v21, "isSleepAlarm"))
        {
          v25 = MTLogForCategory(3);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = [v24 alarmID];
            *(_DWORD *)buf = 138543618;
            v52 = self;
            __int16 v53 = 2114;
            *(void *)v54 = v26;
            _os_log_impl(&dword_19CC95000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing fire date for really old snoozed alarm %{public}@", buf, 0x16u);
          }
          [v24 setSnoozeFireDate:0];
          if (v24) {
            goto LABEL_31;
          }
        }
        else
        {
          v32 = MTLogForCategory(3);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = [v24 alarmID];
            *(_DWORD *)buf = 138543618;
            v52 = self;
            __int16 v53 = 2114;
            *(void *)v54 = v33;
            _os_log_impl(&dword_19CC95000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting really old snoozed alarm %{public}@ to disabled", buf, 0x16u);
          }
          [v24 setEnabled:0];
          if (v24) {
            goto LABEL_31;
          }
        }
      }
      else if ([v21 isFiring])
      {
        id v27 = [v21 firedDate];
        [v7 timeIntervalSinceDate:v27];
        double v29 = v28;

        if (v29 > 172800.0)
        {
          v24 = (void *)[v21 mutableCopy];
          id v30 = MTLogForCategory(3);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v31 = [v24 alarmID];
            *(_DWORD *)buf = 138543618;
            v52 = self;
            __int16 v53 = 2114;
            *(void *)v54 = v31;
            _os_log_impl(&dword_19CC95000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing fire date for really old firing alarm %{public}@", buf, 0x16u);
          }
          [v24 setFiredDate:0];
          if (v24)
          {
LABEL_31:
            [(MTAlarmStorage *)self->_storage updateAlarm:v24 withCompletion:0 source:self];
          }
        }
      }
      ++v20;
    }
    while (v18 != v20);
    uint64_t v34 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
    uint64_t v18 = v34;
  }
  while (v34);
LABEL_39:

  v35 = MTNewChildActivityForName(11);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MTAlarmScheduler__scheduleAlarms_withCompletion___block_invoke;
  block[3] = &unk_1E5916300;
  block[4] = self;
  id v43 = v16;
  id v44 = v15;
  id v45 = v39;
  id v36 = v39;
  id v37 = v15;
  id v38 = v16;
  os_activity_apply(v35, block);
}

void __51__MTAlarmScheduler__scheduleAlarms_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v2 = MTLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v3;
    __int16 v15 = 2050;
    uint64_t v16 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}lu alarms", buf, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) scheduledAlarms];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MTAlarmScheduler__scheduleAlarms_withCompletion___block_invoke_22;
  v11[3] = &unk_1E5915B68;
  id v12 = *(id *)(a1 + 56);
  [v5 schedule:v6 afterDate:v7 withCompletion:v11];

  uint64_t v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v9 + 24);
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled alarms: %{public}@", buf, 0x16u);
  }
}

uint64_t __51__MTAlarmScheduler__scheduleAlarms_withCompletion___block_invoke_22(uint64_t a1)
{
  kdebug_trace();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)unscheduleAlarms:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTAlarmScheduler *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__MTAlarmScheduler_unscheduleAlarms___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __37__MTAlarmScheduler_unscheduleAlarms___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _unscheduleAlarms:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) _additionalAlarmsToScheduleForAlarms:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _scheduleAlarms:v2 withCompletion:0];
}

- (void)_unscheduleAlarms:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTNewChildActivityForName(11);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MTAlarmScheduler__unscheduleAlarms___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __38__MTAlarmScheduler__unscheduleAlarms___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2050;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ unscheduling %{public}lu alarms", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) scheduledAlarms];
  [v5 unschedule:*(void *)(a1 + 40)];

  id v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 24);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled alarms: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)scheduledListDidChange:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MTAlarmScheduler *)self _queue_updateNextAlarmTimerWithCompletion:a4];
  uint64_t v5 = [(MTAlarmScheduler *)self scheduledAlarms];
  id v6 = [v5 nextScheduledAlertOrNotification];

  uint64_t v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 scheduleable];
    int v9 = [v8 identifier];
    int v12 = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = v9;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ next alarm changed: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = MTLogForCategory(9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_INFO, "MTAlarmScheduler - Changing Next Alarm", (uint8_t *)&v12, 2u);
  }

  __int16 v11 = [(MTAlarmScheduler *)self delegate];
  [v11 scheduler:self didChangeNextAlarm:v6];
}

- (void)_queue_updateNextAlarmTimerWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)&unint64_t v6 = COERCE_DOUBLE([(MTScheduledList *)self->_scheduledAlarms numberOfScheduledAlertsAndNotifications]);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2050;
    double v22 = *(double *)&v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ has %{public}ld scheduled alerts and notifications", buf, 0x16u);
  }

  uint64_t v7 = [(MTAlarmScheduler *)self _nextTriggerDateForScheduling];
  double v8 = [v7 dateByAddingTimeInterval:-10.0];

  if (v8 == 0.0)
  {
    [(MTAlarmScheduler *)self _queue_unregisterTimer];
    if (!v4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  int v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    double v22 = v8;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling persistent timer for next alert at %{public}@", buf, 0x16u);
  }

  uint64_t v10 = (*((void (**)(void))self->_currentDateProvider + 2))();
  [*(id *)&v8 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 <= 0.0)
  {
    uint64_t v16 = MTLogForCategory(3);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = self;
      _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer should have fired.  Triggering it now", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__MTAlarmScheduler__queue_updateNextAlarmTimerWithCompletion___block_invoke;
    v17[3] = &unk_1E5915B68;
    uint64_t v18 = v4;
    [(MTAlarmScheduler *)self _queue_fireTriggeredAlarmsWithCompletionBlock:v17];

    goto LABEL_20;
  }
  uint64_t v13 = MTLogForCategory(3);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12 <= 60.0)
  {
    if (!v14) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    double v22 = v12;
    __int16 v15 = "%{public}@ Timer will fire %f seconds from now";
  }
  else
  {
    if (!v14) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    double v22 = v12 / 60.0;
    __int16 v15 = "%{public}@ Timer will fire %f minutes from now";
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

uint64_t __62__MTAlarmScheduler__queue_updateNextAlarmTimerWithCompletion___block_invoke(uint64_t a1)
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
  uint64_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Unscheduling persistent timer.", (uint8_t *)&v4, 0xCu);
  }

  [(MTSchedulingDelegate *)self->_schedulingDelegate unscheduleTimer];
}

+ (id)_intervalToCheckForAlarmsToFireBeforeDate:(id)a3
{
  id v3 = a3;
  int v4 = [v3 dateByAddingTimeInterval:10.0];
  uint64_t v5 = [v3 dateByAddingTimeInterval:-900.0];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v4];
  return v6;
}

- (void)_queue_triggerDidFireForAlarmWithCompletionBlock:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm timer fired", (uint8_t *)&v6, 0xCu);
  }

  [(MTAlarmScheduler *)self _queue_unregisterTimer];
  [(MTAlarmScheduler *)self _queue_fireTriggeredAlarmsWithCompletionBlock:v4];
}

- (BOOL)_shouldPostNotificationForScheduledAlarm:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 isVisible];
  if ((v5 & 1) == 0)
  {
    int v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 scheduleable];
      uint64_t v8 = [v7 identifier];
      int v9 = [v4 trigger];
      int v11 = 138543874;
      double v12 = self;
      __int16 v13 = 2114;
      BOOL v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ is for non-visible event %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }

  return v5;
}

- (void)_fireScheduledAlarm:(id)a3 firedDate:(id)a4 completionBlock:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  if ([(MTScheduledList *)self->_scheduledAlarms isScheduled:v8])
  {
    int v11 = MTLogForCategory(9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_INFO, "MTAlarmScheduler - Firing Alarm", buf, 2u);
    }

    double v12 = MTLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [v8 scheduleable];
      BOOL v14 = [v13 alarmID];
      *(_DWORD *)buf = 138543874;
      id v38 = self;
      __int16 v39 = 2114;
      id v40 = v14;
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ fired (scheduled fire date: %{public}@)", buf, 0x20u);
    }
    [(MTScheduledList *)self->_scheduledAlarms _unscheduleObject:v8];
    if (objc_opt_respondsToSelector())
    {
      __int16 v15 = MTLogForCategory(3);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v38 = self;
        __int16 v39 = 2114;
        id v40 = v8;
        _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ first dismissing related notifications for %{public}@", buf, 0x16u);
      }

      [(MTNotificationCenter *)self->_notificationCenter dismissRelatedNotificationsForScheduledAlarm:v8];
    }
    BOOL v16 = [(MTAlarmScheduler *)self _shouldPostNotificationForScheduledAlarm:v8];
    uint64_t v17 = MTLogForCategory(3);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543618;
        id v38 = self;
        __int16 v39 = 2114;
        id v40 = v8;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ post notification for %{public}@", buf, 0x16u);
      }

      [(MTNotificationCenter *)self->_notificationCenter postNotificationForScheduledAlarm:v8 completionBlock:v10];
    }
    else
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543618;
        id v38 = self;
        __int16 v39 = 2114;
        id v40 = v8;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ not posting notification for %{public}@", buf, 0x16u);
      }

      v10[2](v10);
    }
    [(MTAlarmScheduler *)self _setLastAlarmTriggerDate:v9];
    double v22 = [v8 scheduleable];
    uint64_t v23 = (void *)[v22 mutableCopy];

    v24 = [v8 trigger];
    int v25 = [v24 isBedtimeRelated];

    if (v25) {
      [v23 setBedtimeFiredDate:v9];
    }
    else {
      [v23 setFiredDate:v9];
    }
    id v26 = [v8 trigger];
    int v27 = [v26 isForSnooze];

    if (v27)
    {
      double v28 = [v8 trigger];
      int v29 = [v28 isForGoToBed];

      if (v29) {
        [v23 setBedtimeSnoozeFireDate:0];
      }
      else {
        [v23 setSnoozeFireDate:0];
      }
    }
    if (([v23 repeats] & 1) == 0 && (objc_msgSend(v23, "isSleepAlarm") & 1) == 0)
    {
      id v30 = MTLogForCategory(3);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v31 = [v23 alarmID];
        *(_DWORD *)buf = 138543618;
        id v38 = self;
        __int16 v39 = 2114;
        id v40 = v31;
        _os_log_impl(&dword_19CC95000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting non-repeating alarm %{public}@ to disabled", buf, 0x16u);
      }
      [v23 setEnabled:0];
    }
    storage = self->_storage;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke;
    v34[3] = &unk_1E5916328;
    v34[4] = self;
    id v35 = v23;
    id v36 = v8;
    id v33 = v23;
    [(MTAlarmStorage *)storage updateAlarm:v33 withCompletion:v34 source:self];
  }
  else
  {
    uint64_t v19 = MTLogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v8 scheduleable];
      __int16 v21 = [v20 identifier];
      *(_DWORD *)buf = 138543618;
      id v38 = self;
      __int16 v39 = 2114;
      id v40 = v21;
      _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ was supposed to fire but is no longer scheduled", buf, 0x16u);
    }
    v10[2](v10);
  }
}

void __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = [*(id *)(a1 + 40) alarmIDString];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke_2;
  v6[3] = &unk_1E5916228;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 alarmWithIdentifier:v3 withCompletion:v6];
}

void __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 trigger];
  int v6 = +[MTScheduledObject scheduledObjectForScheduleable:v4 trigger:v5];

  id v7 = [*(id *)(a1 + 40) delegate];
  [v7 scheduler:*(void *)(a1 + 40) didFireAlarm:v6];

  uint64_t v8 = [*(id *)(a1 + 40) serializer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke_3;
  v9[3] = &unk_1E59150A8;
  v9[4] = *(void *)(a1 + 40);
  [v8 performBlock:v9];
}

void __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) scheduledAlarms];
  id v3 = [v2 nextScheduledAlertOrNotification];

  if (!v3)
  {
    id v4 = MTLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no next alarm", (uint8_t *)&v7, 0xCu);
    }

    int v6 = [*(id *)(a1 + 32) delegate];
    [v6 scheduler:*(void *)(a1 + 32) didChangeNextAlarm:0];
  }
}

- (void)_queue_fireTriggeredAlarmsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTNewChildActivityForName(10);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E59150D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serializer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E59150D0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performBlock:v4];
}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 24);
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v3;
    __int16 v45 = 2114;
    uint64_t v46 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduled alarms: %{public}@", buf, 0x16u);
  }

  id v5 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
  uint64_t v6 = [(id)objc_opt_class() _intervalToCheckForAlarmsToFireBeforeDate:v5];
  int v7 = MTLogForCategory(3);
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
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 24) scheduledObjectsToFireInInterval:v6];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v34 = [v10 countByEnumeratingWithState:&v39 objects:v49 count:16];
  objc_super v31 = (void *)v6;
  if (v34)
  {
    uint64_t v11 = *(void *)v40;
    uint64_t v32 = a1;
    do
    {
      uint64_t v12 = 0;
      __int16 v13 = v5;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v10);
        }
        BOOL v14 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
        __int16 v15 = [v14 trigger];
        BOOL v16 = [v15 triggerDate];

        id v5 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();

        double v17 = 0.0;
        if ([v5 mtIsBeforeDate:v16])
        {
          [v16 timeIntervalSinceDate:v5];
          double v17 = v18;
          uint64_t v19 = MTLogForCategory(4);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = v5;
            uint64_t v20 = v11;
            __int16 v21 = v10;
            double v22 = v9;
            uint64_t v23 = *(void *)(a1 + 32);
            v24 = [v14 scheduleable];
            int v25 = [v24 identifier];
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
            _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ should actually fire in %f seconds", buf, 0x20u);

            a1 = v32;
          }
        }
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_30;
        v37[3] = &unk_1E5916350;
        v37[4] = *(void *)(a1 + 32);
        v37[5] = v14;
        id v38 = v16;
        id v26 = v16;
        int v27 = +[MTTask taskWithIdentifier:@"com.apple.MTAlarmTask.fire" delay:v37 completableBlock:v17];
        [v9 addObject:v27];

        ++v12;
        __int16 v13 = v5;
      }
      while (v34 != v12);
      uint64_t v34 = [v10 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v34);
  }
  kdebug_trace();
  uint64_t v28 = *(void *)(a1 + 32);
  int v29 = *(void **)(v28 + 64);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_3;
  v35[3] = &unk_1E59150D0;
  v35[4] = v28;
  id v36 = *(id *)(a1 + 40);
  id v30 = +[MTTaskGroup taskGroupWithTasks:v9 completionBlock:v35];
  [v29 scheduleTaskGroup:v30];
}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) serializer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_2_31;
  v6[3] = &unk_1E5916300;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  [v4 performBlock:v6];
}

uint64_t __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_2_31(void *a1)
{
  kdebug_trace();
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  return [v2 _fireScheduledAlarm:v3 firedDate:v4 completionBlock:v5];
}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_4;
  long long v7 = &unk_1E59163A0;
  id v2 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v2;
  uint64_t v3 = +[MTTask taskWithIdentifier:@"com.apple.MTAlarmTask.reschedule" completableBlock:&v4];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "scheduleTask:", v3, v4, v5, v6, v7, v8);
}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fired all alarms.  Rescheduling.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_34;
  v8[3] = &unk_1E5916378;
  uint64_t v6 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v6 rescheduleAlarmsWithCompletion:v8];
}

uint64_t __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_34(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)_lastAlarmTriggerDate
{
  defaults = self->_defaults;
  id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v4 = [(MTPersistence *)defaults objectForKey:@"MTAlarmLastTriggerDate" defaultValue:v3];

  return v4;
}

- (void)_setLastAlarmTriggerDate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting last alarm trigger date to %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(MTPersistence *)self->_defaults setObject:v4 forKey:@"MTAlarmLastTriggerDate"];
}

- (id)nextTriggerDate
{
  return [(MTAlarmScheduler *)self nextTriggerDateIncludingBedtimeNotification:0];
}

- (id)nextTriggerDateIncludingBedtimeNotification:(BOOL)a3
{
  id v3 = [(MTAlarmScheduler *)self nextScheduledAlarmIncludingBedtimeNotification:a3];
  id v4 = [v3 trigger];
  uint64_t v5 = [v4 triggerDate];

  return v5;
}

- (id)_nextTriggerDateForScheduling
{
  id v2 = [(MTScheduledList *)self->_scheduledAlarms nextScheduledObject];
  id v3 = [v2 trigger];
  id v4 = [v3 triggerDate];

  return v4;
}

- (id)sourceIdentifier
{
  return @"MTAlarmScheduler";
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 != self)
  {
    id v7 = MTLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = self;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received update of alarms %{public}@.  Rescheduling them.", buf, 0x16u);
    }

    [(MTAlarmScheduler *)self scheduleAlarms:v6];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__MTAlarmScheduler_source_didUpdateAlarms___block_invoke;
  v8[3] = &unk_1E5915CB0;
  void v8[4] = self;
  objc_msgSend(v6, "na_each:", v8);
}

void __43__MTAlarmScheduler_source_didUpdateAlarms___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 snoozeFireDate];

  if (!v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) notificationCenter];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) notificationCenter];
      __int16 v8 = [v3 alarmIDString];
      id v9 = +[MTUserNotificationCenter _snoozeCountdownIdentifier:v8];
      v11[0] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v7 dismissNotificationsWithIdentifiers:v10];
    }
  }
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5 = a4;
  [(MTAlarmScheduler *)self unscheduleAlarms:v5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MTAlarmScheduler_source_didRemoveAlarms___block_invoke;
  v6[3] = &unk_1E5915CB0;
  void v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);
}

void __43__MTAlarmScheduler_source_didRemoveAlarms___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 notificationCenter];
  [v4 dismissNotificationsForAlarm:v3];
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    v24[0] = v9;
    __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [(MTAlarmScheduler *)self scheduleAlarms:v11];

    if (a5 != 1)
    {
      id v12 = [(MTAlarmScheduler *)self notificationCenter];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        BOOL v14 = [(MTAlarmScheduler *)self notificationCenter];
        [v14 dismissNotificationsForAlarm:v10 includeSnooze:0];
      }
      __int16 v15 = MTLogForCategory(3);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        __int16 v21 = self;
        __int16 v22 = 2114;
        uint64_t v23 = v10;
        _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ posting snooze countdown notification for snoozed alarm %{public}@", (uint8_t *)&v20, 0x16u);
      }

      BOOL v16 = [v10 snoozeFireDate];
      double v17 = +[MTTrigger triggerWithDate:v16 triggerType:6];
      double v18 = +[MTScheduledObject scheduledObjectForScheduleable:v10 trigger:v17];

      uint64_t v19 = [(MTAlarmScheduler *)self notificationCenter];
      [v19 postNotificationForScheduledAlarm:v18 completionBlock:&__block_literal_global_16];
    }
  }
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(MTAlarmScheduler *)self serializer];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MTAlarmScheduler_source_didDismissAlarm_dismissAction___block_invoke;
  v10[3] = &unk_1E5915258;
  id v11 = v7;
  id v12 = self;
  unint64_t v13 = a5;
  id v9 = v7;
  [v8 performBlock:v10];
}

void __57__MTAlarmScheduler_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) notificationCenter];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [*(id *)(a1 + 40) notificationCenter];
      [v4 dismissNotificationsForAlarm:*(void *)(a1 + 32) dismissAction:*(void *)(a1 + 48)];
    }
  }
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  if (a4 == 2) {
    return [a3 isEqualToString:@"com.apple.MTAlarmScheduler.alarm-event"];
  }
  else {
    return 0;
  }
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  kdebug_trace();
  id v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v15 = self;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ handling notification %{public}@", buf, 0x16u);
  }

  uint64_t v10 = [(MTAlarmScheduler *)self serializer];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__MTAlarmScheduler_handleNotification_ofType_completion___block_invoke;
  v12[3] = &unk_1E59150D0;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 performBlock:v12];
}

void __57__MTAlarmScheduler_handleNotification_ofType_completion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__MTAlarmScheduler_handleNotification_ofType_completion___block_invoke_2;
  v2[3] = &unk_1E5915B68;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_queue_triggerDidFireForAlarmWithCompletionBlock:", v2);
}

uint64_t __57__MTAlarmScheduler_handleNotification_ofType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)printDiagnostics
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTAlarmScheduler-----", (uint8_t *)&v6, 2u);
  }

  id v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MTAlarmScheduler *)self scheduledAlarms];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Scheduled Alarms: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)gatherDiagnostics
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"Scheduled alarms";
  id v2 = (void *)MEMORY[0x1E4F28ED0];
  id v3 = [(MTAlarmScheduler *)self scheduledAlarms];
  id v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfScheduledAlerts"));
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (MTAlarmScheduleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTAlarmScheduleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTAlarmStorage)storage
{
  return self->_storage;
}

- (MTScheduledList)scheduledAlarms
{
  return self->_scheduledAlarms;
}

- (MTNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
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
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_scheduledAlarms, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end