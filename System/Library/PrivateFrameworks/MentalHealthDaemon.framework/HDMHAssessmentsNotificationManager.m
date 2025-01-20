@interface HDMHAssessmentsNotificationManager
- (HDMHAssessmentsNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4;
- (HDMHAssessmentsNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 restorableAlarm:(id)a5 promptedAssessmentsManager:(id)a6 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a7;
- (HDMHPromptedAssessmentsManaging)promptedAssessmentsManager;
- (HDRestorableAlarm)restorableAlarm;
- (id)_currentDate;
- (id)_eventsToSchedule;
- (id)_nextBehaviorBasedDateWithError:(id *)a3;
- (id)_nextRegularlyScheduledDateWithError:(id *)a3;
- (id)_periodicAssessmentEvent;
- (id)_requestFromAlarmEvent:(id)a3;
- (id)scheduledNotificationsWithError:(id *)a3;
- (id)unitTest_didEvaluateIfMaintenanceWorkIsNeeded;
- (void)_periodicAssessmentEvent;
- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4;
- (void)_queue_enqueueMaintenanceRemovalIfNeeded;
- (void)_queue_removeAllScheduledNotifications;
- (void)_queue_removeAllScheduledNotificationsIfNotEnabled;
- (void)_queue_rescheduleNotifications;
- (void)_queue_runMaintenanceRemoval;
- (void)_queue_start;
- (void)_removeRelatedDeliveredHDMHNotificationsForEvent:(id)a3;
- (void)_rescheduleNotifications;
- (void)_setCurrentDate:(id)a3;
- (void)_triggerImmediateSyncWithReason:(id)a3;
- (void)_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:(BOOL)a3;
- (void)invalidate;
- (void)profileDidBecomeReady:(id)a3;
- (void)promptedAssessmentsManagerDidUpdatePromptedAssessments:(id)a3;
- (void)setPromptedAssessmentsManager:(id)a3;
- (void)setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a3;
- (void)settingsManagerDidUpdateNotificationSettings:(id)a3;
@end

@implementation HDMHAssessmentsNotificationManager

- (HDMHAssessmentsNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4
{
  return [(HDMHAssessmentsNotificationManager *)self initWithProfile:a3 settingsManager:a4 restorableAlarm:0 promptedAssessmentsManager:0 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:0];
}

- (HDMHAssessmentsNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 restorableAlarm:(id)a5 promptedAssessmentsManager:(id)a6 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)HDMHAssessmentsNotificationManager;
  v17 = [(HDMHAssessmentsNotificationManager *)&v33 init];
  v18 = v17;
  if (v17)
  {
    id v32 = v13;
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

    v23 = (void *)MEMORY[0x263F43218];
    id WeakRetained = objc_loadWeakRetained((id *)&v18->_profile);
    uint64_t v25 = objc_msgSend(v23, "hdmh_mentalHealthSyncedDefaultsDomainWithProfile:", WeakRetained);
    assessmentNotificationStateKeyValueDomain = v18->_assessmentNotificationStateKeyValueDomain;
    v18->_assessmentNotificationStateKeyValueDomain = (HDKeyValueDomain *)v25;

    v27 = [MEMORY[0x263F0A980] sharedBehavior];
    char v28 = [v27 isAppleWatch];

    if (!v14 && (v28 & 1) == 0)
    {
      id v29 = objc_alloc(MEMORY[0x263F43308]);
      id v30 = objc_loadWeakRetained((id *)&v18->_profile);
      id v14 = (id)[v29 initWithProfile:v30 clientIdentifier:@"HDMHAssessmentsNotificationManager" eventHandlerQueue:v18->_queue];
    }
    if (v16) {
      [(HDMHAssessmentsNotificationManager *)v18 setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:v16];
    }
    v18->_queue_hasEnqueuedMaintenanceWork = 0;
    objc_storeStrong((id *)&v18->_restorableAlarm, v14);
    objc_storeStrong((id *)&v18->_settingsManager, a4);
    objc_storeStrong((id *)&v18->_promptedAssessmentsManager, a6);
    [v12 registerProfileReadyObserver:v18 queue:v18->_queue];
    id v13 = v32;
  }

  return v18;
}

- (void)_queue_start
{
  v5 = @"NO";
  if (a2) {
    v5 = @"YES";
  }
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_255F2E000, log, OS_LOG_TYPE_DEBUG, "[%{public}@] Assessments notifications enabled: %{public}@", buf, 0x16u);
}

void __50__HDMHAssessmentsNotificationManager__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)id v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_255F2E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating notification manager", v6, 0xCu);
  }
  [(HDRestorableAlarm *)self->_restorableAlarm invalidate];
  [(HKMHSettingsManager *)self->_settingsManager removeObserver:self];
  [(HDMHPromptedAssessmentsManaging *)self->_promptedAssessmentsManager unregisterObserver:self];
}

- (id)scheduledNotificationsWithError:(id *)a3
{
  v3 = [(HDRestorableAlarm *)self->_restorableAlarm allScheduledEventsWithError:a3];
  v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_2);

  return v4;
}

id __70__HDMHAssessmentsNotificationManager_scheduledNotificationsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F55030];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 eventIdentifier];

  id v6 = (void *)[v4 initWithCategory:v5];
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
  char v4 = [(HKMHSettingsManager *)self->_settingsManager hasAnyAssessmentNotificationsEnabled];
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
    [(HDMHAssessmentsNotificationManager *)self _rescheduleNotifications];
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
    [(HDMHAssessmentsNotificationManager *)self _queue_removeAllScheduledNotifications];
  }
}

- (id)_requestFromAlarmEvent:(id)a3
{
  id v3 = a3;
  char v4 = [v3 eventIdentifier];
  uint64_t v5 = *MEMORY[0x263F54FC8];
  int v6 = [v4 containsString:*MEMORY[0x263F54FC8]];

  if (!v6
    || (objc_msgSend(MEMORY[0x263F1DF48], "hkmh_requestForCategoryIdentifier:", v5),
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      -[HDMHAssessmentsNotificationManager _requestFromAlarmEvent:]();
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  int v6 = (os_log_t *)MEMORY[0x263F09938];
  uint64_t v7 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = objc_opt_class();
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
    if ([(HKMHSettingsManager *)self->_settingsManager hasAnyAssessmentNotificationsEnabled])
    {
      v18 = [v14 currentDueDate];
      int v19 = objc_msgSend(v18, "hk_isBeforeDate:", v13);

      if (!v19)
      {
        [(HDMHAssessmentsNotificationManager *)self _removeRelatedDeliveredHDMHNotificationsForEvent:v14];
        id v29 = [(HDMHAssessmentsNotificationManager *)self _requestFromAlarmEvent:v14];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        v31 = [WeakRetained notificationManager];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke;
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
        v24 = "[%{public}@] Skipping sending notification for event due more than one day ago: %@";
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
        char v28 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        __int16 v37 = 2112;
        v38 = v14;
        id v23 = v28;
        v24 = "[%{public}@] Skipping sending notification for event; assessment notifications are not enabled and supported: %@";
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
      v24 = "[%{public}@] Skipping sending notification for event; feature flag is not enabled: %@";
      goto LABEL_12;
    }
  }
LABEL_14:
}

void __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    int v6 = [*(id *)(a1 + 40) content];
    uint64_t v7 = [v6 categoryIdentifier];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F54FC8]];

    if (v8)
    {
      v9 = [*(id *)(a1 + 32) _currentDate];
      id v10 = *(void **)(*(void *)(a1 + 32) + 32);
      id v23 = 0;
      char v11 = objc_msgSend(v10, "hdmh_setUpdatedPeriodicPromptedAssessmentNotificationFireDate:error:", v9, &v23);
      id v12 = v23;
      _HKInitializeLogging();
      id v13 = (void *)*MEMORY[0x263F09938];
      id v14 = *MEMORY[0x263F09938];
      if (v11)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v13;
          id v16 = objc_opt_class();
          id v17 = v16;
          v18 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543618;
          os_log_t v25 = v16;
          __int16 v26 = 2112;
          os_log_t v27 = v18;
          _os_log_impl(&dword_255F2E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully saved date fired for periodic prompted assessment notification in key value domain with date: %@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) _triggerImmediateSyncWithReason:@"hdmh_setUpdatedPeriodicPromptedAssessmentNotificationFireDate"];
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(a1 + 32, v13);
      }
    }
    uint64_t v20 = *(void *)(a1 + 32);
    v21 = *(NSObject **)(v20 + 24);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_301;
    v22[3] = &unk_2653F03B0;
    v22[4] = v20;
    dispatch_async(v21, v22);
  }
  else
  {
    _HKInitializeLogging();
    int v19 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_2(a1, v19);
    }
  }
}

uint64_t __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_301(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleNotifications];
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v6 = [WeakRetained cloudSyncManager];
  id v7 = objc_alloc(MEMORY[0x263F0A1C8]);
  int v8 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
  v9 = (void *)[v7 initWithChangesSyncRequest:v8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__HDMHAssessmentsNotificationManager__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_2653F05A0;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v6 syncWithRequest:v9 reason:v10 completion:v11];
}

void __70__HDMHAssessmentsNotificationManager__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  int v6 = (void *)*MEMORY[0x263F09938];
  id v7 = *MEMORY[0x263F09938];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = v6;
      v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      id v11 = v9;
      _os_log_impl(&dword_255F2E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __70__HDMHAssessmentsNotificationManager__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6);
  }
}

- (void)_removeRelatedDeliveredHDMHNotificationsForEvent:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v3 = [WeakRetained notificationManager];
  id v4 = [MEMORY[0x263F55030] assessmentsNotificationCategories];
  [v3 removeDeliveredNotificationsWithIdentifiers:v4];
}

- (void)_queue_rescheduleNotifications
{
  restorableAlarm = self->_restorableAlarm;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__HDMHAssessmentsNotificationManager__queue_rescheduleNotifications__block_invoke;
  v3[3] = &unk_2653F05C8;
  v3[4] = self;
  [(HDRestorableAlarm *)restorableAlarm checkForDueEventsWithCompletion:v3];
}

void __68__HDMHAssessmentsNotificationManager__queue_rescheduleNotifications__block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6 = a4;
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke_cold_1(a1, v7);
    }
  }
  [*(id *)(a1 + 32) _rescheduleNotifications];
}

- (void)_rescheduleNotifications
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Error scheduling new events: %{public}@", v7, v8, v9, v10, v11);
}

- (id)_eventsToSchedule
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(HKMHSettingsManager *)self->_settingsManager periodicPromptedAssessmentNotificationsEnabled])
  {
    id v4 = [(HDMHAssessmentsNotificationManager *)self _periodicAssessmentEvent];
    if (v4) {
      [v3 addObject:v4];
    }
  }
  return v3;
}

- (void)_queue_removeAllScheduledNotificationsIfNotEnabled
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HKMHSettingsManager *)self->_settingsManager hasAnyAssessmentNotificationsEnabled])
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
    [(HDMHAssessmentsNotificationManager *)self _queue_removeAllScheduledNotifications];
  }
}

- (void)_queue_removeAllScheduledNotifications
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Error removing all scheduled notifications: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDMHAssessmentsNotificationManager *)self unitTest_didEvaluateIfMaintenanceWorkIsNeeded];
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

- (void)profileDidBecomeReady:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(HDMHAssessmentsNotificationManager *)self _queue_start];
  uint64_t v6 = [v5 database];

  LODWORD(v5) = [v6 isProtectedDataAvailable];
  if (v5)
  {
    [(HDMHAssessmentsNotificationManager *)self _queue_enqueueMaintenanceRemovalIfNeeded];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v8 = [WeakRetained database];
    id v9 = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__HDMHAssessmentsNotificationManager_profileDidBecomeReady___block_invoke;
    v10[3] = &unk_2653F03B0;
    v10[4] = self;
    [v8 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:v9 block:v10];
  }
}

uint64_t __60__HDMHAssessmentsNotificationManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueMaintenanceRemovalIfNeeded");
}

- (void)_queue_enqueueMaintenanceRemovalIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_queue_hasEnqueuedMaintenanceWork
    || ([(HKMHSettingsManager *)self->_settingsManager hasAnyAssessmentNotificationsEnabled] & 1) != 0)
  {
    [(HDMHAssessmentsNotificationManager *)self _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:0];
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x263F43248];
    id v4 = [(HDMHAssessmentsNotificationManager *)self maintenanceOperationName];
    queue = self->_queue;
    v10[4] = self;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__HDMHAssessmentsNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke;
    v11[3] = &unk_2653F03B0;
    v11[4] = self;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __78__HDMHAssessmentsNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2;
    v10[3] = &unk_2653F03B0;
    uint64_t v6 = [v3 maintenanceOperationWithName:v4 queue:queue synchronousBlock:v11 canceledBlock:v10];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v8 = [WeakRetained daemon];
    id v9 = [v8 maintenanceWorkCoordinator];
    [v9 enqueueMaintenanceOperation:v6];

    self->_queue_hasEnqueuedMaintenanceWork = 1;
    [(HDMHAssessmentsNotificationManager *)self _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:1];
  }
}

uint64_t __78__HDMHAssessmentsNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_runMaintenanceRemoval");
}

void __78__HDMHAssessmentsNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2(uint64_t a1)
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
  [(HDMHAssessmentsNotificationManager *)self _queue_removeAllScheduledNotificationsIfNotEnabled];
  self->_queue_hasEnqueuedMaintenanceWork = 0;
}

- (void)promptedAssessmentsManagerDidUpdatePromptedAssessments:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_255F2E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Prompted assessments manager did update", (uint8_t *)&v7, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(HDMHAssessmentsNotificationManager *)self _rescheduleNotifications];
}

- (id)_nextBehaviorBasedDateWithError:(id *)a3
{
  promptedAssessmentsManager = self->_promptedAssessmentsManager;
  id v11 = 0;
  id v5 = [(HDMHPromptedAssessmentsManaging *)promptedAssessmentsManager promptedAssessmentsWithError:&v11];
  id v6 = v11;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      -[HDMHAssessmentsNotificationManager _nextBehaviorBasedDateWithError:]();
    }
    if (a3)
    {
      int v7 = 0;
      *a3 = v6;
    }
    else
    {
      _HKLogDroppedError();
      int v7 = 0;
    }
  }
  else
  {
    id v8 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_311);
    uint64_t v9 = [v8 firstObject];
    int v7 = [v9 eligibilityStartDate];
  }
  return v7;
}

BOOL __70__HDMHAssessmentsNotificationManager__nextBehaviorBasedDateWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reason] == 1;
}

- (id)_nextRegularlyScheduledDateWithError:(id *)a3
{
  assessmentNotificationStateKeyValueDomain = self->_assessmentNotificationStateKeyValueDomain;
  id v16 = 0;
  id v6 = [(HDKeyValueDomain *)assessmentNotificationStateKeyValueDomain hdmh_updatedPeriodicPromptedAssessmentNotificationFireDateWithError:&v16];
  id v7 = v16;
  id v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR))
    {
      -[HDMHAssessmentsNotificationManager _nextRegularlyScheduledDateWithError:]();
      if (a3) {
        goto LABEL_14;
      }
    }
    else if (a3)
    {
LABEL_14:
      id v8 = v8;
      id v13 = 0;
      *a3 = v8;
      goto LABEL_20;
    }
    _HKLogDroppedError();
    goto LABEL_19;
  }
  if (!v6)
  {
LABEL_19:
    id v13 = 0;
    goto LABEL_20;
  }

  promptedAssessmentsManager = self->_promptedAssessmentsManager;
  id v15 = 0;
  uint64_t v11 = [(HDMHPromptedAssessmentsManaging *)promptedAssessmentsManager periodicAssessmentPromptCadenceInDaysWithError:&v15];
  id v8 = v15;
  if (v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      -[HDMHAssessmentsNotificationManager _nextRegularlyScheduledDateWithError:]();
    }
    if (a3) {
      *a3 = v8;
    }
    else {
      _HKLogDroppedError();
    }
  }
  id v13 = [MEMORY[0x263EFF910] dateWithTimeInterval:v6 sinceDate:(double)v11 * 60.0 * 60.0 * 24.0];
LABEL_20:

  return v13;
}

- (id)_periodicAssessmentEvent
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v28 = 0;
  BOOL v3 = [(HDMHAssessmentsNotificationManager *)self _nextBehaviorBasedDateWithError:&v28];
  id v4 = v28;
  if (v4)
  {
    id v5 = v4;
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      -[HDMHAssessmentsNotificationManager _periodicAssessmentEvent]();
    }
    id v6 = 0;
  }
  else
  {
    id v27 = 0;
    id v7 = [(HDMHAssessmentsNotificationManager *)self _nextRegularlyScheduledDateWithError:&v27];
    id v5 = v27;
    if (v5)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
        -[HDMHAssessmentsNotificationManager _periodicAssessmentEvent]();
      }
      id v6 = 0;
    }
    else
    {
      id v8 = [v3 laterDate:v7];
      _HKInitializeLogging();
      BOOL v9 = (os_log_t *)MEMORY[0x263F09938];
      int v10 = (void *)*MEMORY[0x263F09938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v10;
        __int16 v12 = objc_opt_class();
        *(_DWORD *)buf = 138544130;
        id v30 = v12;
        __int16 v31 = 2112;
        id v32 = v3;
        __int16 v33 = 2112;
        id v34 = v7;
        __int16 v35 = 2112;
        v36 = v8;
        id v13 = v12;
        _os_log_impl(&dword_255F2E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Behavior Date: %@, Regular Date: %@, Selected Date: %@", buf, 0x2Au);
      }
      if (v8)
      {
        __int16 v14 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
        id v15 = [(HKMHSettingsManager *)self->_settingsManager periodicPromptedAssessmentNotificationTimeOfDay];
        id v16 = objc_msgSend(v14, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v15, "hour"), objc_msgSend(v15, "minute"), objc_msgSend(v15, "second"), v8, 0);
        id v17 = [HDMHNotification alloc];
        uint64_t v18 = objc_msgSend(v8, "hk_dayIndexWithCalendar:", v14);
        int v19 = [(HDMHNotification *)v17 initWithFireOnDayIndex:v18 dateComponents:v15 category:*MEMORY[0x263F54FC8]];
        restorableAlarm = self->_restorableAlarm;
        v21 = [(HDMHNotification *)v19 eventIdentifier];
        id v6 = [(HDRestorableAlarm *)restorableAlarm eventWithIdentifier:v21 dueDate:v16 eventOptions:0];
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v22 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = v22;
          v24 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v30 = v24;
          id v25 = v24;
          _os_log_impl(&dword_255F2E000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] No upcoming periodic prompted assessment.", buf, 0xCu);
        }
        id v6 = 0;
      }
    }
  }

  return v6;
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

- (HDMHPromptedAssessmentsManaging)promptedAssessmentsManager
{
  return self->_promptedAssessmentsManager;
}

- (void)setPromptedAssessmentsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptedAssessmentsManager, 0);
  objc_storeStrong((id *)&self->_restorableAlarm, 0);
  objc_storeStrong(&self->unitTest_didEvaluateIfMaintenanceWorkIsNeeded, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_assessmentNotificationStateKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_requestFromAlarmEvent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  id v3 = v2;
  id v4 = (id)OUTLINED_FUNCTION_3();
  uint64_t v11 = [v0 eventIdentifier];
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Could not create notification request from event identifier: %@", v7, v8, v9, v10, 2u);
}

void __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_1(v4);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v6, v7, "[%{public}@] Error saving date fired for periodic prompted assessment notification in key value domain: %{public}@", v8, v9, v10, v11, v12);
}

void __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_4(&dword_255F2E000, v4, v5, "[%{public}@] Error posting user notification for request %@: %{public}@", v6, v7, v8, v9, 2u);
}

void __70__HDMHAssessmentsNotificationManager__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_4(&dword_255F2E000, v4, v5, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", v6, v7, v8, v9, 2u);
}

- (void)_nextBehaviorBasedDateWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Error requesting prompted assessments %{public}@", v7, v8, v9, v10, v11);
}

- (void)_nextRegularlyScheduledDateWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Error retrieving last fired date for last periodic prompted assessment notification from key value domain: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_nextRegularlyScheduledDateWithError:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Error retrieving cadence in days %{public}@", v7, v8, v9, v10, v11);
}

- (void)_periodicAssessmentEvent
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_0(&dword_255F2E000, v5, v6, "[%{public}@] Unable to get behavior date, not scheduling due to error: %{public}@", v7, v8, v9, v10, v11);
}

@end