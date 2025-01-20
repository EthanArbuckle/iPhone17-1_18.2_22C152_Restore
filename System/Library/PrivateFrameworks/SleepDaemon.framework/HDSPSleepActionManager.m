@interface HDSPSleepActionManager
+ (BOOL)_isValidSnoozeDate:(id)a3;
+ (id)_latestDateInAlarms:(id)a3 dateBlock:(id)a4;
- (HDSPEnvironment)environment;
- (HDSPSleepActionManager)initWithEnvironment:(id)a3;
- (HKSPObserverSet)observers;
- (NSString)sourceIdentifier;
- (void)addObserver:(id)a3;
- (void)confirmWakeUp:(BOOL)a3;
- (void)confirmWakeUp:(BOOL)a3 date:(id)a4;
- (void)confirmWakeUp:(BOOL)a3 date:(id)a4 confirmUntilDate:(id)a5;
- (void)dismissGoodMorning;
- (void)dismissGoodMorningOnDate:(id)a3;
- (void)dismissSleepLock;
- (void)removeObserver:(id)a3;
- (void)sleepAlarmDismissedOnDate:(id)a3 source:(unint64_t)a4;
- (void)sleepAlarmSnoozedUntilDate:(id)a3 source:(unint64_t)a4;
- (void)sleepAlarmWasModified;
@end

@implementation HDSPSleepActionManager

- (HDSPSleepActionManager)initWithEnvironment:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDSPSleepActionManager;
  v5 = [(HDSPSleepActionManager *)&v15 init];
  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      __int16 v18 = 2048;
      v19 = v5;
      id v8 = v7;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v5->_environment, v4);
    id v9 = objc_alloc(MEMORY[0x263F75E20]);
    v10 = [v4 defaultCallbackScheduler];
    uint64_t v11 = [v9 initWithCallbackScheduler:v10];
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v11;

    v13 = v5;
  }

  return v5;
}

- (NSString)sourceIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)confirmWakeUp:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)&v21[13] = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [(HDSPSleepActionManager *)self environment];
    id v9 = [v8 currentSource];
    int v18 = 138543874;
    v19 = v6;
    __int16 v20 = 1024;
    *(_DWORD *)v21 = v3;
    v21[2] = 2114;
    *(void *)&v21[3] = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up early confirmed (wasExplicitConfirmation: %d, %{public}@)", (uint8_t *)&v18, 0x1Cu);
  }
  v10 = [(HDSPSleepActionManager *)self environment];
  uint64_t v11 = [v10 sleepCoordinator];
  [v11 currentSleepScheduleState];

  if (HKSPSleepScheduleStateIsForBedtime() & 1) != 0 || (HKSPSleepScheduleStateIsForWindDown())
  {
    v12 = [(HDSPSleepActionManager *)self environment];
    v13 = [v12 currentDateProvider];
    v14 = v13[2]();

    [(HDSPSleepActionManager *)self confirmWakeUp:v3 date:v14];
  }
  else
  {
    v14 = HKSPLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v15 = objc_opt_class();
      id v16 = v15;
      v17 = NSStringFromHKSPSleepScheduleState();
      int v18 = 138543618;
      v19 = v15;
      __int16 v20 = 2114;
      *(void *)v21 = v17;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring request to confirm wake up due to state %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)confirmWakeUp:(BOOL)a3 date:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v10 = [(HDSPSleepActionManager *)self environment];
  id v7 = [v10 sleepScheduleModelManager];
  id v8 = [v7 sleepScheduleModel];
  id v9 = [v8 computeConfirmedWakeUpUntilDateForEarlyWakeUpDate:v6];

  [(HDSPSleepActionManager *)self confirmWakeUp:v4 date:v6 confirmUntilDate:v9];
}

- (void)confirmWakeUp:(BOOL)a3 date:(id)a4 confirmUntilDate:(id)a5
{
  BOOL v6 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HDSPSleepActionManager *)self environment];
  uint64_t v11 = [v10 currentContext];

  v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    id v14 = v13;
    objc_super v15 = [v11 source];
    *(_DWORD *)buf = 138544386;
    v34 = v13;
    __int16 v35 = 2114;
    id v36 = v8;
    __int16 v37 = 2114;
    id v38 = v9;
    __int16 v39 = 1024;
    BOOL v40 = v6;
    __int16 v41 = 2114;
    v42 = v15;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up notification confirmed at %{public}@, until %{public}@, (wasExplicitConfirmation: %d, %{public}@)", buf, 0x30u);
  }
  id v16 = [(HDSPSleepActionManager *)self environment];
  v17 = [v16 sleepScheduleModelManager];
  int v18 = [v17 sleepEventRecord];
  v19 = (void *)[v18 mutableCopy];

  [v19 setWakeUpEarlyNotificationConfirmedDate:v8];
  [v19 setWakeUpConfirmedUntilDate:v9];
  __int16 v20 = [(HDSPSleepActionManager *)self environment];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke;
  v27[3] = &unk_2645DABD0;
  id v28 = v17;
  id v29 = v19;
  BOOL v32 = v6;
  v30 = self;
  id v31 = v11;
  id v21 = v11;
  id v22 = v19;
  id v23 = v17;
  v24 = [v21 source];
  v25 = [(HDSPSleepActionManager *)self sourceIdentifier];
  v26 = HDSPSourceByReplacingIdentifier(v24, v25);
  [v20 perform:v27 withSource:v26];
}

void __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v11 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_2;
  v8[3] = &unk_2645DABA8;
  BOOL v3 = *(void **)(a1 + 56);
  v8[4] = *(void *)(a1 + 48);
  char v10 = *(unsigned char *)(a1 + 64);
  id v9 = v3;
  LOBYTE(v2) = [v1 saveSleepEventRecord:v2 error:&v11 preNotifyBlock:v8];
  id v4 = v11;
  if ((v2 & 1) == 0)
  {
    v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v6;
      __int16 v14 = 2114;
      id v15 = v4;
      id v7 = v6;
      _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);
    }
  }
}

id __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_3;
  v5[3] = &unk_2645DAB80;
  v5[4] = v1;
  char v7 = *(unsigned char *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  BOOL v3 = [v2 enumerateObserversWithFutureBlock:v5];

  return v3;
}

id __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) environment];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    id v9 = __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_4;
    char v10 = &unk_2645DAA58;
    id v11 = v3;
    char v12 = *(unsigned char *)(a1 + 48);
    [v4 perform:&v7 withContext:*(void *)(a1 + 40)];
  }
  v5 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v7, v8, v9, v10);

  return v5;
}

uint64_t __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) wakeUpWasConfirmed:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dismissGoodMorning
{
  id v3 = [(HDSPSleepActionManager *)self environment];
  id v4 = [v3 currentDateProvider];
  v4[2]();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(HDSPSleepActionManager *)self dismissGoodMorningOnDate:v5];
}

- (void)dismissGoodMorningOnDate:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSPSleepActionManager *)self environment];
  id v6 = [v5 currentContext];

  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    char v10 = [v6 source];
    *(_DWORD *)buf = 138543618;
    BOOL v32 = v8;
    __int16 v33 = 2114;
    v34 = v10;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissing good morning (%{public}@)", buf, 0x16u);
  }
  id v11 = [(HDSPSleepActionManager *)self environment];
  char v12 = [v11 sleepScheduleModelManager];

  v13 = [v12 sleepEventRecord];
  __int16 v14 = (void *)[v13 mutableCopy];

  [v14 setGoodMorningDismissedDate:v4];
  id v15 = HKSPLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    id v17 = v16;
    int v18 = [v14 goodMorningDismissedDate];
    *(_DWORD *)buf = 138543618;
    BOOL v32 = v16;
    __int16 v33 = 2114;
    v34 = v18;
    _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Good morning was dismissed %{public}@", buf, 0x16u);
  }
  v19 = [(HDSPSleepActionManager *)self environment];
  uint64_t v26 = MEMORY[0x263EF8330];
  id v27 = v12;
  id v28 = v14;
  id v29 = self;
  id v30 = v6;
  id v20 = v6;
  id v21 = v14;
  id v22 = v12;
  id v23 = objc_msgSend(v20, "source", v26, 3221225472, __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke, &unk_2645DAC48);
  v24 = [(HDSPSleepActionManager *)self sourceIdentifier];
  v25 = HDSPSourceByReplacingIdentifier(v23, v24);
  [v19 perform:&v26 withSource:v25];
}

void __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  id v10 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_2;
  v8[3] = &unk_2645DAC20;
  id v3 = (void *)a1[7];
  v8[4] = a1[6];
  id v9 = v3;
  LOBYTE(v2) = [v1 saveSleepEventRecord:v2 error:&v10 preNotifyBlock:v8];
  id v4 = v10;
  if ((v2 & 1) == 0)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      char v12 = v6;
      __int16 v13 = 2114;
      id v14 = v4;
      id v7 = v6;
      _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);
    }
  }
}

id __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_3;
  v5[3] = &unk_2645DABF8;
  v5[4] = v1;
  id v6 = *(id *)(a1 + 40);
  id v3 = [v2 enumerateObserversWithFutureBlock:v5];

  return v3;
}

id __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) environment];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_4;
    v7[3] = &unk_2645D90C0;
    id v8 = v3;
    [v4 perform:v7 withContext:*(void *)(a1 + 40)];
  }
  id v5 = [MEMORY[0x263F58190] futureWithNoResult];

  return v5;
}

uint64_t __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) goodMorningWasDismissed];
}

- (void)dismissSleepLock
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(HDSPSleepActionManager *)self environment];
  id v4 = [v3 currentContext];

  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 source];
    *(_DWORD *)buf = 138543618;
    id v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissed sleep lock (%{public}@)", buf, 0x16u);
  }
  observers = self->_observers;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__HDSPSleepActionManager_dismissSleepLock__block_invoke;
  v11[3] = &unk_2645DAC70;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v11];
}

void __42__HDSPSleepActionManager_dismissSleepLock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) environment];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __42__HDSPSleepActionManager_dismissSleepLock__block_invoke_2;
    v5[3] = &unk_2645D90C0;
    id v6 = v3;
    [v4 perform:v5 withContext:*(void *)(a1 + 40)];
  }
}

uint64_t __42__HDSPSleepActionManager_dismissSleepLock__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sleepLockWasDismissed];
}

- (void)sleepAlarmDismissedOnDate:(id)a3 source:(unint64_t)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HDSPSleepActionManager *)self environment];
  id v8 = [v7 currentContext];

  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = [v8 source];
    *(_DWORD *)buf = 138543874;
    v49 = v10;
    __int16 v50 = 2114;
    id v51 = v6;
    __int16 v52 = 2114;
    v53 = v12;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarm did dismiss: %{public}@ (%{public}@)", buf, 0x20u);
  }
  if (v6)
  {
    __int16 v13 = [(HDSPSleepActionManager *)self environment];
    id v14 = [v13 currentDateProvider];
    __int16 v15 = v14[2]();

    [v6 timeIntervalSinceDate:v15];
    if (fabs(v16) > 86400.0)
    {
      uint64_t v17 = HKSPLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v49 = v18;
        __int16 v50 = 2114;
        id v51 = v6;
        id v19 = v18;
        _os_log_error_impl(&dword_221A52000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] ignoring sleepAlarm with old dismiss date: %{public}@", buf, 0x16u);
      }
      goto LABEL_19;
    }
    id v22 = [(HDSPSleepActionManager *)self environment];
    uint64_t v17 = [v22 sleepScheduleModelManager];

    id v23 = [(HDSPSleepActionManager *)self environment];
    v24 = [v23 sleepCoordinator];
    uint64_t v25 = [v24 currentSleepScheduleState];

    if (v25 != 6)
    {
      id v26 = [v17 sleepScheduleModel];
      id v27 = [v26 closestEventWithIdentifier:*MEMORY[0x263F75C40] dueAroundDate:v15];
      if ((objc_msgSend(v27, "hksp_isWithinInterval:ofDate:", v6, 60.0) & 1) == 0)
      {
        __int16 v37 = HKSPLogForCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = objc_opt_class();
          id v39 = v38;
          BOOL v40 = NSStringFromHKSPSleepScheduleState();
          *(_DWORD *)buf = 138543618;
          v49 = v38;
          __int16 v50 = 2114;
          id v51 = v40;
          _os_log_impl(&dword_221A52000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring sleepAlarm dismissed outside of allowed window during %{public}@", buf, 0x16u);
        }
        goto LABEL_18;
      }
    }
    id v28 = [v17 sleepEventRecord];
    id v29 = (void *)[v28 mutableCopy];

    [v29 setWakeUpAlarmDismissedDate:v6];
    id v30 = HKSPLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = objc_opt_class();
      id v41 = v31;
      BOOL v32 = [v29 wakeUpAlarmDismissedDate];
      *(_DWORD *)buf = 138543618;
      v49 = v31;
      __int16 v50 = 2114;
      id v51 = v32;
      _os_log_impl(&dword_221A52000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarm dismissed at %{public}@", buf, 0x16u);
    }
    __int16 v33 = [(HDSPSleepActionManager *)self environment];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke;
    v42[3] = &unk_2645DACE8;
    uint64_t v43 = v17;
    id v44 = v29;
    v45 = self;
    unint64_t v47 = a4;
    id v46 = v8;
    id v26 = v29;
    v34 = [v46 source];
    uint64_t v35 = [(HDSPSleepActionManager *)self sourceIdentifier];
    id v36 = HDSPSourceByReplacingIdentifier(v34, v35);
    [v33 perform:v42 withSource:v36];

    id v27 = v43;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  __int16 v15 = HKSPLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    id v20 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v49 = v20;
    id v21 = v20;
    _os_log_fault_impl(&dword_221A52000, v15, OS_LOG_TYPE_FAULT, "[%{public}@] sleepAlarm has nil dismiss date", buf, 0xCu);
  }
LABEL_20:
}

void __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_2;
  v9[3] = &unk_2645DACC0;
  id v4 = (void *)a1[7];
  uint64_t v3 = a1[8];
  v9[4] = a1[6];
  uint64_t v11 = v3;
  id v12 = 0;
  id v10 = v4;
  LOBYTE(v2) = [v1 saveSleepEventRecord:v2 error:&v12 preNotifyBlock:v9];
  id v5 = v12;
  if ((v2 & 1) == 0)
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v14 = v7;
      __int16 v15 = 2114;
      id v16 = v5;
      id v8 = v7;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);
    }
  }
}

id __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void **)(v1 + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_3;
  v7[3] = &unk_2645DAC98;
  id v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  void v7[4] = v1;
  uint64_t v9 = v3;
  id v8 = v4;
  id v5 = [v2 enumerateObserversWithFutureBlock:v7];

  return v5;
}

id __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) environment];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_4;
    __int16 v13 = &unk_2645D96F8;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v14 = v5;
    uint64_t v15 = v7;
    [v4 perform:&v10 withContext:v6];
  }
  id v8 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v10, v11, v12, v13);

  return v8;
}

uint64_t __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) wakeUpAlarmWasDismissedFromSource:*(void *)(a1 + 40)];
}

- (void)sleepAlarmSnoozedUntilDate:(id)a3 source:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(HDSPSleepActionManager *)self environment];
  id v8 = [v7 currentContext];

  uint64_t v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    id v12 = [v8 source];
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = v10;
    __int16 v36 = 2114;
    id v37 = v6;
    __int16 v38 = 2114;
    id v39 = v12;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarm did snooze: %{public}@ (%{public}@)", buf, 0x20u);
  }
  __int16 v13 = [(HDSPSleepActionManager *)self environment];
  id v14 = [v13 sleepScheduleModelManager];

  uint64_t v15 = [v14 sleepEventRecord];
  id v16 = (void *)[v15 mutableCopy];

  [v16 setWakeUpAlarmSnoozedUntilDate:v6];
  uint64_t v17 = HKSPLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = objc_opt_class();
    id v19 = v18;
    id v20 = [v16 wakeUpAlarmSnoozedUntilDate];
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v18;
    __int16 v36 = 2114;
    id v37 = v20;
    _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarm snoozed until %{public}@", buf, 0x16u);
  }
  id v21 = [(HDSPSleepActionManager *)self environment];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke;
  v28[3] = &unk_2645DACE8;
  id v29 = v14;
  id v30 = v16;
  id v32 = v8;
  unint64_t v33 = a4;
  id v31 = self;
  id v22 = v8;
  id v23 = v16;
  id v24 = v14;
  uint64_t v25 = [v22 source];
  id v26 = [(HDSPSleepActionManager *)self sourceIdentifier];
  id v27 = HDSPSourceByReplacingIdentifier(v25, v26);
  [v21 perform:v28 withSource:v27];
}

void __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_2;
  v9[3] = &unk_2645DACC0;
  id v4 = (void *)a1[7];
  uint64_t v3 = a1[8];
  v9[4] = a1[6];
  uint64_t v11 = v3;
  id v12 = 0;
  id v10 = v4;
  LOBYTE(v2) = [v1 saveSleepEventRecord:v2 error:&v12 preNotifyBlock:v9];
  id v5 = v12;
  if ((v2 & 1) == 0)
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v14 = v7;
      __int16 v15 = 2114;
      id v16 = v5;
      id v8 = v7;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);
    }
  }
}

id __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void **)(v1 + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_3;
  v7[3] = &unk_2645DAC98;
  id v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  void v7[4] = v1;
  uint64_t v9 = v3;
  id v8 = v4;
  id v5 = [v2 enumerateObserversWithFutureBlock:v7];

  return v5;
}

id __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) environment];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_4;
    __int16 v13 = &unk_2645D96F8;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v14 = v5;
    uint64_t v15 = v7;
    [v4 perform:&v10 withContext:v6];
  }
  id v8 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v10, v11, v12, v13);

  return v8;
}

uint64_t __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) wakeUpAlarmWasSnoozedFromSource:*(void *)(a1 + 40)];
}

+ (id)_latestDateInAlarms:(id)a3 dateBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__19;
  uint64_t v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__HDSPSleepActionManager__latestDateInAlarms_dateBlock___block_invoke;
  v10[3] = &unk_2645DAD10;
  id v7 = v6;
  id v11 = v7;
  id v12 = &v13;
  objc_msgSend(v5, "na_each:", v10);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __56__HDSPSleepActionManager__latestDateInAlarms_dateBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v3 = v2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = v2;
  if (*(void *)(v4 + 40))
  {
    if (!objc_msgSend(v2, "hksp_isAfterDate:")) {
      goto LABEL_5;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = obj;
  }
  objc_storeStrong((id *)(v4 + 40), v3);
LABEL_5:
}

+ (BOOL)_isValidSnoozeDate:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  id v5 = [v3 distantPast];
  LOBYTE(v3) = [v4 isEqualToDate:v5];

  char v6 = v3 ^ 1;
  return v6;
}

- (void)sleepAlarmWasModified
{
  id v3 = [(HDSPSleepActionManager *)self environment];
  id v4 = [v3 sleepAlarmManager];
  id v5 = [v4 currentSleepAlarms];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke;
  v7[3] = &unk_2645D9238;
  void v7[4] = self;
  id v6 = (id)[v5 addCompletionBlock:v7];
}

void __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPNilify();
  id v6 = v5;
  if (v4)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v42 = (id)objc_opt_class();
      __int16 v43 = 2114;
      id v44 = v4;
      id v8 = v42;
      uint64_t v9 = "[%{public}@] fetch alarms failed with error: %{public}@";
      uint64_t v10 = v7;
      uint32_t v11 = 22;
LABEL_4:
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    }
  }
  else
  {
    if (![v5 count])
    {
      id v7 = HKSPLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138543362;
      id v42 = (id)objc_opt_class();
      id v8 = v42;
      uint64_t v9 = "[%{public}@] no sleep alarms found";
      uint64_t v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_4;
    }
    id v12 = [*(id *)(a1 + 32) environment];
    id v7 = [v12 currentContext];

    uint64_t v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_opt_class();
      id v15 = v14;
      id v16 = [v7 source];
      *(_DWORD *)buf = 138543618;
      id v42 = v14;
      __int16 v43 = 2114;
      id v44 = v16;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarms modified (%{public}@)", buf, 0x16u);
    }
    uint64_t v17 = [(id)objc_opt_class() _latestDateInAlarms:v6 dateBlock:&__block_literal_global_24];
    id v18 = HKSPLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v42 = v19;
      __int16 v43 = 2114;
      id v44 = v17;
      id v20 = v19;
      _os_log_impl(&dword_221A52000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] latest sleep alarm modified date: %{public}@", buf, 0x16u);
    }
    id v21 = [(id)objc_opt_class() _latestDateInAlarms:v6 dateBlock:&__block_literal_global_298_0];
    id v22 = HKSPLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v42 = v23;
      __int16 v43 = 2114;
      id v44 = v21;
      id v24 = v23;
      _os_log_impl(&dword_221A52000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] latest sleep alarm snooze date: %{public}@", buf, 0x16u);
    }
    uint64_t v25 = [*(id *)(a1 + 32) environment];
    id v26 = [v25 sleepScheduleModelManager];

    id v27 = [v26 sleepEventRecord];
    id v28 = (void *)[v27 mutableCopy];

    if (([(id)objc_opt_class() _isValidSnoozeDate:v21] & 1) == 0)
    {
      id v29 = objc_opt_class();
      id v30 = [v28 wakeUpAlarmSnoozedUntilDate];
      LODWORD(v29) = [v29 _isValidSnoozeDate:v30];

      if (v29)
      {
        id v31 = HKSPLogForCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v42 = v32;
          id v33 = v32;
          _os_log_impl(&dword_221A52000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] snooze date was reset", buf, 0xCu);
        }
        [v28 setWakeUpAlarmSnoozedUntilDate:0];
        v34 = [*(id *)(a1 + 32) environment];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke_299;
        v37[3] = &unk_2645D9EE0;
        id v38 = v26;
        id v35 = v28;
        uint64_t v36 = *(void *)(a1 + 32);
        id v39 = v35;
        uint64_t v40 = v36;
        objc_msgSend(v34, "perform:withSource:", v37);
      }
    }
  }
LABEL_19:
}

uint64_t __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke_294(uint64_t a1, void *a2)
{
  return [a2 lastModifiedDate];
}

uint64_t __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke_296(uint64_t a1, void *a2)
{
  return [a2 snoozeFireDate];
}

void __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke_299(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  char v4 = [v2 saveSleepEventRecord:v3 error:&v9];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint32_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      id v8 = v7;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);
    }
  }
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end