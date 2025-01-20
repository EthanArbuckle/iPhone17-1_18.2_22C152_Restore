@interface HDMHSOMNotificationManager
- (BOOL)_shouldEndOfDayBeShiftedToMidnightForDate:(id)a3;
- (HDMHSOMNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 restorableAlarm:(id)a5 typicalDayProvider:(id)a6 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a7;
- (HDMHSOMNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 typicalDayProvider:(id)a5;
- (HDMHTypicalDayProviding)typicalDayProvider;
- (HDRestorableAlarm)restorableAlarm;
- (id)_currentDate;
- (id)_endOfCalendarDayForDate:(id)a3;
- (id)_eventsToSchedule;
- (id)_notificationDateComponentsByCategory;
- (id)_requestFromAlarmEvent:(id)a3;
- (id)_timeOfDayBasedNotifications;
- (id)scheduledNotificationsWithError:(id *)a3;
- (id)unitTest_didEvaluateIfMaintenanceWorkIsNeeded;
- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4;
- (void)_queue_enqueueMaintenanceRemovalIfNeeded;
- (void)_queue_registerForSignificantTimeChanges;
- (void)_queue_removeAllScheduledNotifications;
- (void)_queue_removeAllScheduledNotificationsIfNotEnabled;
- (void)_queue_rescheduleNotifications;
- (void)_queue_runMaintenanceRemoval;
- (void)_queue_start;
- (void)_removeRelatedDeliveredHDMHNotificationsForEvent:(id)a3;
- (void)_rescheduleNotifications;
- (void)_setCurrentDate:(id)a3;
- (void)_significantTimeChangeOccurred;
- (void)_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:(BOOL)a3;
- (void)didReceiveDayChangeNotification:(id)a3;
- (void)invalidate;
- (void)profileDidBecomeReady:(id)a3;
- (void)setTypicalDayProvider:(id)a3;
- (void)setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a3;
- (void)settingsManagerDidUpdateNotificationSettings:(id)a3;
- (void)typicalDayDidUpdate:(id)a3;
@end

@implementation HDMHSOMNotificationManager

- (HDMHSOMNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 typicalDayProvider:(id)a5
{
  return [(HDMHSOMNotificationManager *)self initWithProfile:a3 settingsManager:a4 restorableAlarm:0 typicalDayProvider:a5 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:0];
}

- (HDMHSOMNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 restorableAlarm:(id)a5 typicalDayProvider:(id)a6 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HDMHSOMNotificationManager;
  v17 = [(HDMHSOMNotificationManager *)&v29 init];
  v18 = v17;
  if (v17)
  {
    id v28 = v13;
    objc_storeWeak((id *)&v17->_profile, v12);
    v19 = [v14 eventHandlerQueue];
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      HKCreateSerialDispatchQueue();
      v21 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    queue = v18->_queue;
    v18->_queue = v21;

    v23 = [MEMORY[0x263F0A980] sharedBehavior];
    char v24 = [v23 isAppleWatch];

    if (!v14 && (v24 & 1) == 0)
    {
      id v25 = objc_alloc(MEMORY[0x263F43308]);
      id WeakRetained = objc_loadWeakRetained((id *)&v18->_profile);
      id v14 = (id)[v25 initWithProfile:WeakRetained clientIdentifier:@"HDMHSOMNotificationManager" eventHandlerQueue:v18->_queue];
    }
    if (v16) {
      [(HDMHSOMNotificationManager *)v18 setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:v16];
    }
    v18->_queue_hasEnqueuedMaintenanceWork = 0;
    objc_storeStrong((id *)&v18->_restorableAlarm, v14);
    objc_storeStrong((id *)&v18->_settingsManager, a4);
    objc_storeStrong((id *)&v18->_typicalDayProvider, a6);
    [v12 registerProfileReadyObserver:v18 queue:v18->_queue];
    id v13 = v28;
  }

  return v18;
}

- (void)_queue_start
{
  OUTLINED_FUNCTION_2((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_255F2E000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Midday logging reminder enabled: %{public}@", v4, 0x16u);
}

void __42__HDMHSOMNotificationManager__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);
}

- (void)_queue_registerForSignificantTimeChanges
{
  objc_initWeak(&location, self);
  v3 = (const char *)[@"SignificantTimeChangeNotification" UTF8String];
  queue = self->_queue;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __70__HDMHSOMNotificationManager__queue_registerForSignificantTimeChanges__block_invoke;
  v9 = &unk_2653F0558;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v3, &self->_significantTimeChangeToken, queue, &v6);
  id v5 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v6, v7, v8, v9);
  [v5 addObserver:self selector:sel_didReceiveDayChangeNotification_ name:*MEMORY[0x263EFF3C8] object:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __70__HDMHSOMNotificationManager__queue_registerForSignificantTimeChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _significantTimeChangeOccurred];
}

- (void)didReceiveDayChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HDMHSOMNotificationManager_didReceiveDayChangeNotification___block_invoke;
  block[3] = &unk_2653F03B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__HDMHSOMNotificationManager_didReceiveDayChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _significantTimeChangeOccurred];
}

- (void)_significantTimeChangeOccurred
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HKMHSettingsManager *)self->_settingsManager hasAnyStateOfMindReminderEnabled])
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)uint64_t v6 = 138543362;
      *(void *)&v6[4] = objc_opt_class();
      id v5 = *(id *)&v6[4];
      _os_log_impl(&dword_255F2E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rescheduling notifications for Calendar Day change", v6, 0xCu);
    }
    [(HDMHTypicalDayProviding *)self->_typicalDayProvider rebuildTypicalDayProviderForCurrentDate];
    [(HDMHSOMNotificationManager *)self _queue_rescheduleNotifications];
  }
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)uint64_t v7 = 138543362;
    *(void *)&v7[4] = objc_opt_class();
    id v5 = *(id *)&v7[4];
    _os_log_impl(&dword_255F2E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating notification manager", v7, 0xCu);
  }
  [(HDRestorableAlarm *)self->_restorableAlarm invalidate];
  [(HKMHSettingsManager *)self->_settingsManager removeObserver:self];
  [(HDMHTypicalDayProviding *)self->_typicalDayProvider removeObserver:self];
  if (notify_is_valid_token(self->_significantTimeChangeToken))
  {
    notify_cancel(self->_significantTimeChangeToken);
    self->_significantTimeChangeToken = -1;
  }
  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263EFF3C8] object:0];
}

- (id)scheduledNotificationsWithError:(id *)a3
{
  v3 = [(HDRestorableAlarm *)self->_restorableAlarm allScheduledEventsWithError:a3];
  v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_0);

  return v4;
}

id __62__HDMHSOMNotificationManager_scheduledNotificationsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F55030];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 eventIdentifier];

  uint64_t v6 = (void *)[v4 initWithCategory:v5];
  return v6;
}

- (void)_setCurrentDate:(id)a3
{
}

- (id)_currentDate
{
  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
  {
    id v3 = currentDateOverride;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v4 = [(HKMHSettingsManager *)self->_settingsManager hasAnyStateOfMindReminderEnabled];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09938];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = v5;
      *(_DWORD *)v11 = 138543362;
      *(void *)&v11[4] = objc_opt_class();
      id v8 = *(id *)&v11[4];
      _os_log_impl(&dword_255F2E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification settings changed: rescheduling notifications", v11, 0xCu);
    }
    [(HDMHSOMNotificationManager *)self _rescheduleNotifications];
  }
  else
  {
    if (v6)
    {
      v9 = v5;
      *(_DWORD *)v11 = 138543362;
      *(void *)&v11[4] = objc_opt_class();
      id v10 = *(id *)&v11[4];
      _os_log_impl(&dword_255F2E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications not enabled", v11, 0xCu);
    }
    [(HDMHSOMNotificationManager *)self _queue_removeAllScheduledNotifications];
  }
}

- (id)_requestFromAlarmEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 eventIdentifier];
  uint64_t v6 = *MEMORY[0x263F54FB0];
  char v7 = [v5 containsString:*MEMORY[0x263F54FB0]];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 eventIdentifier];
    uint64_t v6 = *MEMORY[0x263F54FC0];
    char v9 = [v8 containsString:*MEMORY[0x263F54FC0]];

    if ((v9 & 1) == 0)
    {
      id v10 = [v4 eventIdentifier];
      uint64_t v6 = *MEMORY[0x263F54FB8];
      int v11 = [v10 containsString:*MEMORY[0x263F54FB8]];

      if (!v11) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x263F1DF48], "hkmh_requestForCategoryIdentifier:", v6);
  if (!v12)
  {
LABEL_5:
    _HKInitializeLogging();
    id v13 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      [(HDMHSOMNotificationManager *)v13 _requestFromAlarmEvent:v4];
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  uint64_t v6 = (os_log_t *)MEMORY[0x263F09938];
  char v7 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    char v9 = objc_opt_class();
    id v10 = NSNumber;
    id v11 = v9;
    uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    *(_DWORD *)buf = 138543874;
    v36 = v9;
    __int16 v37 = 2114;
    v38 = v12;
    __int16 v39 = 2112;
    id v40 = v5;
    _os_log_impl(&dword_255F2E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %{public}@ due events: %@", buf, 0x20u);
  }
  id v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-86400.0];
  id v14 = [v5 firstObject];
  id v15 = [MEMORY[0x263F0A980] sharedBehavior];
  id v16 = [v15 features];
  char v17 = [v16 chamomile];

  if (v17)
  {
    if ([(HKMHSettingsManager *)self->_settingsManager hasAnyStateOfMindReminderEnabled])
    {
      v18 = [v14 currentDueDate];
      int v19 = objc_msgSend(v18, "hk_isBeforeDate:", v13);

      if (!v19)
      {
        [(HDMHSOMNotificationManager *)self _removeRelatedDeliveredHDMHNotificationsForEvent:v14];
        objc_super v29 = [(HDMHSOMNotificationManager *)self _requestFromAlarmEvent:v14];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        v31 = [WeakRetained notificationManager];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke;
        v33[3] = &unk_2653F05A0;
        v33[4] = self;
        id v34 = v29;
        id v32 = v29;
        [v31 postNotificationWithRequest:v32 completion:v33];

        goto LABEL_14;
      }
      _HKInitializeLogging();
      os_log_t v20 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v36 = v22;
        __int16 v37 = 2112;
        v38 = v14;
        id v23 = v22;
        char v24 = "[%{public}@] Skipping sending notification for event due more than one day ago: %@";
LABEL_12:
        _os_log_impl(&dword_255F2E000, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v27 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v27;
        id v28 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        __int16 v37 = 2112;
        v38 = v14;
        id v23 = v28;
        char v24 = "[%{public}@] Skipping sending notification for event; SOM notifications are not enabled and supported: %@";
        goto LABEL_12;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v25;
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v36 = v26;
      __int16 v37 = 2112;
      v38 = v14;
      id v23 = v26;
      char v24 = "[%{public}@] Skipping sending notification for event; feature flag is not enabled: %@";
      goto LABEL_12;
    }
  }
LABEL_14:
}

void __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    char v7 = *(NSObject **)(v6 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_305;
    block[3] = &unk_2653F03B0;
    block[4] = v6;
    dispatch_async(v7, block);
  }
  else
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(a1, v8, (uint64_t)v5);
    }
  }
}

uint64_t __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_305(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleNotifications];
}

- (void)_removeRelatedDeliveredHDMHNotificationsForEvent:(id)a3
{
  objc_msgSend(MEMORY[0x263F55030], "stateOfMindNotificationCategories", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained notificationManager];
  [v5 removeDeliveredNotificationsWithIdentifiers:v6];
}

- (void)_queue_rescheduleNotifications
{
  restorableAlarm = self->_restorableAlarm;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke;
  v3[3] = &unk_2653F05C8;
  v3[4] = self;
  [(HDRestorableAlarm *)restorableAlarm checkForDueEventsWithCompletion:v3];
}

void __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6 = a4;
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    char v7 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke_cold_1(a1, v7);
    }
  }
  [*(id *)(a1 + 32) _rescheduleNotifications];
}

- (void)_rescheduleNotifications
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Error scheduling new events: %{public}@", v7, v8, v9, v10, v11);
}

- (id)_eventsToSchedule
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [MEMORY[0x263F0A980] sharedBehavior];
  id v4 = [v3 features];
  int v5 = [v4 chamomile];

  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    uint64_t v7 = [(HDMHSOMNotificationManager *)self _currentDate];
    id v32 = [(HDMHSOMNotificationManager *)self _notificationDateComponentsByCategory];
    int v8 = 0;
    *(void *)&long long v9 = 138543618;
    long long v31 = v9;
    do
    {
      int v33 = v8;
      __int16 v37 = v7;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v10 = v32;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v36 = *(void *)v39;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v39 != v36) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * v13);
            uint64_t v15 = objc_msgSend(v6, "nextDateAfterDate:matchingComponents:options:", v37, v14, 1024, v31);
            if (!v15)
            {
              _HKInitializeLogging();
              os_log_t v25 = (void *)*MEMORY[0x263F09938];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR))
              {
                os_log_t v27 = v25;
                id v28 = objc_opt_class();
                *(_DWORD *)buf = v31;
                v43 = v28;
                __int16 v44 = 2112;
                uint64_t v45 = v14;
                id v29 = v28;
                _os_log_error_impl(&dword_255F2E000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Next Date nil for scheduleTime: %@", buf, 0x16u);
              }
              goto LABEL_16;
            }
            id v16 = (void *)v15;
            char v17 = v10;
            v18 = [v10 objectForKeyedSubscript:v14];
            int v19 = v6;
            os_log_t v20 = -[HDMHNotification initWithFireOnDayIndex:dateComponents:category:]([HDMHNotification alloc], "initWithFireOnDayIndex:dateComponents:category:", objc_msgSend(v16, "hk_dayIndexWithCalendar:", v6), v14, v18);
            v21 = self;
            restorableAlarm = self->_restorableAlarm;
            id v23 = [(HDMHNotification *)v20 eventIdentifier];
            char v24 = [(HDRestorableAlarm *)restorableAlarm eventWithIdentifier:v23 dueDate:v16 eventOptions:0];

            if (v24)
            {
              [v35 addObject:v24];
              [v34 addObject:v16];
            }

            ++v13;
            self = v21;
            id v10 = v17;
            uint64_t v6 = v19;
          }
          while (v12 != v13);
          uint64_t v12 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      id v26 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v26 setDay:1];
      uint64_t v7 = [v6 dateByAddingComponents:v26 toDate:v37 options:0];

      int v8 = v33 + 1;
    }
    while (v33 != 6);
  }
  return v35;
}

- (id)_notificationDateComponentsByCategory
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  if (([(HKMHSettingsManager *)self->_settingsManager middayNotificationsEnabled] & 1) != 0
    || [(HKMHSettingsManager *)self->_settingsManager endOfDayNotificationsEnabled])
  {
    id v4 = [(HDMHSOMNotificationManager *)self _timeOfDayBasedNotifications];
    [v3 addEntriesFromDictionary:v4];
  }
  int v5 = [(HKMHSettingsManager *)self->_settingsManager customReminderSchedule];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = *MEMORY[0x263F54FB0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v11 isEnabled])
        {
          uint64_t v12 = [v11 dateComponents];
          uint64_t v13 = [v3 objectForKeyedSubscript:v12];

          if (!v13)
          {
            uint64_t v14 = [v11 dateComponents];
            [v3 setObject:v9 forKey:v14];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }
  _HKInitializeLogging();
  uint64_t v15 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    char v17 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    os_log_t v27 = v17;
    id v18 = v17;
    _os_log_impl(&dword_255F2E000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calculated all notification date components.", buf, 0xCu);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __67__HDMHSOMNotificationManager__notificationDateComponentsByCategory__block_invoke;
  v21[3] = &unk_2653F05F0;
  v21[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v21];
  int v19 = (void *)[v3 copy];

  return v19;
}

void __67__HDMHSOMNotificationManager__notificationDateComponentsByCategory__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    int v10 = 138544130;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 hour];
    __int16 v16 = 2048;
    uint64_t v17 = [v4 minute];
    _os_log_impl(&dword_255F2E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Type: %@, Time: %ld:%ld", (uint8_t *)&v10, 0x2Au);
  }
}

- (id)_timeOfDayBasedNotifications
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = [(HDMHTypicalDayProviding *)self->_typicalDayProvider userStartOfDay];
  uint64_t v6 = [(HDMHTypicalDayProviding *)self->_typicalDayProvider userEndOfDay];
  if (objc_msgSend(v6, "hk_isBeforeDate:", v5))
  {
    id v7 = [MEMORY[0x263F08790] localizedStringFromDate:v5 dateStyle:1 timeStyle:1];
    uint64_t v8 = [MEMORY[0x263F08790] localizedStringFromDate:v5 dateStyle:1 timeStyle:1];
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_FAULT))
    {
      uint64_t v18 = v9;
      int v20 = 138543874;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      long long v25 = v8;
      id v19 = v21;
      _os_log_fault_impl(&dword_255F2E000, v18, OS_LOG_TYPE_FAULT, "[%{public}@] inferredStartOfDay is later than inferredEndOfDay. \n StartOfDay:%@ \n EndOfDay:%@", (uint8_t *)&v20, 0x20u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if ([(HKMHSettingsManager *)self->_settingsManager middayNotificationsEnabled])
  {
    int v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v5 endDate:v6];
    [v10 duration];
    __int16 v12 = [v5 dateByAddingTimeInterval:v11 * 0.5];
    id v13 = [v4 components:96 fromDate:v12];
    [v3 setObject:*MEMORY[0x263F54FC0] forKey:v13];
  }
  if ([(HKMHSettingsManager *)self->_settingsManager endOfDayNotificationsEnabled])
  {
    id v7 = v6;
    if ([(HDMHSOMNotificationManager *)self _shouldEndOfDayBeShiftedToMidnightForDate:v7])
    {
      uint64_t v14 = [(HDMHSOMNotificationManager *)self _endOfCalendarDayForDate:v5];

      id v7 = (id)v14;
    }
    uint64_t v15 = [v7 dateByAddingTimeInterval:-1200.0];
    __int16 v16 = [v4 components:96 fromDate:v15];
    [v3 setObject:*MEMORY[0x263F54FB8] forKey:v16];

    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (BOOL)_shouldEndOfDayBeShiftedToMidnightForDate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hk_gregorianCalendar");
  uint64_t v6 = [v5 startOfDayForDate:v4];
  id v7 = [v6 dateByAddingTimeInterval:10800.0];
  char v8 = objc_msgSend(v4, "hk_isBeforeDate:", v7);

  return v8;
}

- (id)_endOfCalendarDayForDate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hk_gregorianCalendar");
  uint64_t v6 = [v5 startOfDayForDate:v4];

  id v7 = [v5 dateByAddingUnit:16 value:1 toDate:v6 options:0];

  return v7;
}

- (void)_queue_removeAllScheduledNotificationsIfNotEnabled
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HKMHSettingsManager *)self->_settingsManager hasAnyStateOfMindReminderEnabled])
  {
    _HKInitializeLogging();
    id v3 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_impl(&dword_255F2E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Aborting maintenance removal of notifications because notifications are enabled", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    [(HDMHSOMNotificationManager *)self _queue_removeAllScheduledNotifications];
  }
}

- (void)_queue_removeAllScheduledNotifications
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Error removing all scheduled notifications: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDMHSOMNotificationManager *)self unitTest_didEvaluateIfMaintenanceWorkIsNeeded];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x263F09948];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09948], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      int v10 = 138543874;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2048;
      id v13 = self;
      __int16 v14 = 1024;
      BOOL v15 = v3;
      id v9 = v11;
      _os_log_impl(&dword_255F2E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Did evaluate for maintenance work: %d", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)typicalDayDidUpdate:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(HDMHSOMNotificationManager *)self _rescheduleNotifications];
}

- (void)profileDidBecomeReady:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(HDMHSOMNotificationManager *)self _queue_start];
  uint64_t v6 = [v5 database];

  LODWORD(v5) = [v6 isProtectedDataAvailable];
  if (v5)
  {
    [(HDMHSOMNotificationManager *)self _queue_enqueueMaintenanceRemovalIfNeeded];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v8 = [WeakRetained database];
    id v9 = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__HDMHSOMNotificationManager_profileDidBecomeReady___block_invoke;
    v10[3] = &unk_2653F03B0;
    v10[4] = self;
    [v8 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:v9 block:v10];
  }
}

uint64_t __52__HDMHSOMNotificationManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueMaintenanceRemovalIfNeeded");
}

- (void)_queue_enqueueMaintenanceRemovalIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_queue_hasEnqueuedMaintenanceWork
    || ([(HKMHSettingsManager *)self->_settingsManager hasAnyStateOfMindReminderEnabled] & 1) != 0)
  {
    [(HDMHSOMNotificationManager *)self _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:0];
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x263F43248];
    id v4 = [(HDMHSOMNotificationManager *)self maintenanceOperationName];
    queue = self->_queue;
    v10[4] = self;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke;
    v11[3] = &unk_2653F03B0;
    v11[4] = self;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2;
    v10[3] = &unk_2653F03B0;
    uint64_t v6 = [v3 maintenanceOperationWithName:v4 queue:queue synchronousBlock:v11 canceledBlock:v10];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v8 = [WeakRetained daemon];
    id v9 = [v8 maintenanceWorkCoordinator];
    [v9 enqueueMaintenanceOperation:v6];

    self->_queue_hasEnqueuedMaintenanceWork = 1;
    [(HDMHSOMNotificationManager *)self _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:1];
  }
}

uint64_t __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_runMaintenanceRemoval");
}

void __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  id v2 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
    __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2_cold_1(a1, v2);
  }
}

- (void)_queue_runMaintenanceRemoval
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)uint64_t v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_255F2E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing maintenance work: notifications not enabled and supported", v6, 0xCu);
  }
  [(HDMHSOMNotificationManager *)self _queue_removeAllScheduledNotificationsIfNotEnabled];
  self->_queue_hasEnqueuedMaintenanceWork = 0;
}

- (id)unitTest_didEvaluateIfMaintenanceWorkIsNeeded
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a3
{
}

- (HDRestorableAlarm)restorableAlarm
{
  return self->_restorableAlarm;
}

- (HDMHTypicalDayProviding)typicalDayProvider
{
  return self->_typicalDayProvider;
}

- (void)setTypicalDayProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typicalDayProvider, 0);
  objc_storeStrong((id *)&self->_restorableAlarm, 0);
  objc_storeStrong(&self->unitTest_didEvaluateIfMaintenanceWorkIsNeeded, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_requestFromAlarmEvent:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = (id)OUTLINED_FUNCTION_3();
  id v13 = [a3 eventIdentifier];
  OUTLINED_FUNCTION_0(&dword_255F2E000, v7, v8, "[%{public}@] Could not create notification request from event identifier: %@", v9, v10, v11, v12, 2u);
}

void __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  id v8 = v6;
  _os_log_error_impl(&dword_255F2E000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error posting user notification for request %@: %{public}@", (uint8_t *)&v9, 0x20u);
}

void __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_1(v4);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v6, v7, "[%{public}@] Error checking for due events before rescheduling: %{public}@", v8, v9, v10, v11, v12);
}

void __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_255F2E000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Maintenance work canceled", (uint8_t *)&v4, 0xCu);
}

@end