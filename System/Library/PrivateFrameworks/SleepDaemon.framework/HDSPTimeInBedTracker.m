@interface HDSPTimeInBedTracker
- (BOOL)isTimeInBedTrackingEnabled;
- (HDSPEnvironment)environment;
- (HDSPInBedDetector)inBedDetector;
- (HDSPSleepTrackerDelegate)delegate;
- (HDSPTimeInBedTracker)initWithEnvironment:(id)a3;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NAScheduler)sleepIntervalScheduler;
- (id)_computeSessionMetadataForInterval:(id)a3;
- (id)_computeSleepSessionStartBeforeDate:(id)a3;
- (id)_createSleepSessionWithEndDate:(id)a3 endReason:(unint64_t)a4;
- (id)computeSleepIntervalsForInterval:(id)a3;
- (id)processedSessionForSession:(id)a3;
- (void)_compareWithCoreDuetInBedDetectionForInterval:(id)a3;
- (void)_endSleepSessionWithReason:(unint64_t)a3;
- (void)_logDetections:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
@end

@implementation HDSPTimeInBedTracker

- (HDSPTimeInBedTracker)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSPTimeInBedTracker;
  v5 = [(HDSPTimeInBedTracker *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = HKSPDispatchQueueName();
    uint64_t v8 = HKSPSerialQueueBackedScheduler();
    sleepIntervalScheduler = v6->_sleepIntervalScheduler;
    v6->_sleepIntervalScheduler = (NAScheduler *)v8;

    uint64_t v10 = +[HDSPBiomeInBedDetector inBedDetector];
    inBedDetector = v6->_inBedDetector;
    v6->_inBedDetector = (HDSPInBedDetector *)v10;

    v12 = v6;
  }

  return v6;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = [a3 sleepCoordinator];
  [v4 addObserver:self];
}

- (BOOL)isTimeInBedTrackingEnabled
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained behavior];
  v5 = [v4 features];
  char v6 = [v5 timeInBedTracking];

  if ((v6 & 1) == 0)
  {
    v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v13 = v19;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] time in bed tracking feature disabled", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_13;
  }
  v7 = [(HDSPTimeInBedTracker *)self sleepScheduleModel];
  uint64_t v8 = [v7 sleepSchedule];
  char v9 = [v8 isEnabledAndHasOccurrences];

  if ((v9 & 1) == 0)
  {
    objc_super v14 = HKSPLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v15 = v19;
      v16 = "[%{public}@] sleep schedule disabled";
LABEL_11:
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);
    }
LABEL_12:

LABEL_13:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = [v7 sleepSettings];
  char v11 = [v10 timeInBedTracking];

  if ((v11 & 1) == 0)
  {
    objc_super v14 = HKSPLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v15 = v19;
      v16 = "[%{public}@] time in bed tracking disabled";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v3 = [WeakRetained sleepScheduleModelManager];
  id v4 = [v3 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v4;
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v7 = [(HDSPTimeInBedTracker *)self isTimeInBedTrackingEnabled];
  if (a3 == 1 && v7)
  {
    uint64_t v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = (HDSPTimeInBedTracker *)objc_opt_class();
      uint64_t v10 = v9;
      char v11 = NSStringFromHKSPSleepScheduleStateChangeReason();
      int v13 = 138543618;
      objc_super v14 = v9;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] state changed to wake up (%{public}@)", (uint8_t *)&v13, 0x16u);
    }
    if (HKSPSleepScheduleStateIsForBedtime()
      && HKSPSleepScheduleStateChangeReasonIsExpected())
    {
      BOOL v12 = HKSPLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        objc_super v14 = self;
        _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] ending time in bed tracking", (uint8_t *)&v13, 0xCu);
      }

      [(HDSPTimeInBedTracker *)self _endSleepSessionWithReason:0];
    }
  }
}

- (void)_endSleepSessionWithReason:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = HDSPSleepSessionEndReasonDescription(a3);
    int v14 = 138543618;
    __int16 v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] ending sleep session with reason %{public}@", (uint8_t *)&v14, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v10 = [WeakRetained currentDateProvider];
  char v11 = v10[2]();

  BOOL v12 = [(HDSPTimeInBedTracker *)self _createSleepSessionWithEndDate:v11 endReason:a3];
  int v13 = [(HDSPTimeInBedTracker *)self delegate];
  [v13 sleepTracker:self didEndSession:v12 reason:a3];
}

- (id)_createSleepSessionWithEndDate:(id)a3 endReason:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HDSPTimeInBedTracker *)self _computeSleepSessionStartBeforeDate:v6];
  if (v7)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v7 endDate:v6];
    char v9 = [(HDSPTimeInBedTracker *)self _computeSessionMetadataForInterval:v8];
    uint64_t v10 = +[HDSPSleepSession sleepSessionWithDateInterval:v8 sleepIntervals:MEMORY[0x263EFFA68] endReason:a4 metadata:v9 requiresFirstUnlock:1];
    char v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      id v12 = v15;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] created %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_computeSleepSessionStartBeforeDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HDSPTimeInBedTracker *)self sleepScheduleModel];
  id v6 = [v5 previousEventWithIdentifier:*MEMORY[0x263F75C18] dueBeforeDate:v4];

  id v7 = v6;
  uint64_t v8 = [v5 sleepSettings];
  int v9 = [v8 sleepTracking];

  if (v9)
  {
    uint64_t v10 = [v7 dateByAddingTimeInterval:-5400.0];

    char v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v10;
      id v12 = v16;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] using 90 minutes before bedtime %{public}@ as session start", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    char v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v7;
      id v13 = v16;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] using bedtime date %{public}@ as session start", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v10 = v7;
  }

  return v10;
}

- (id)computeSleepIntervalsForInterval:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2114;
    id v17 = v4;
    id v6 = v15;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] computing in bed intervals inside %{public}@", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x263F58190];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke;
  v12[3] = &unk_2645D91E8;
  v12[4] = self;
  id v13 = v4;
  sleepIntervalScheduler = self->_sleepIntervalScheduler;
  id v9 = v4;
  uint64_t v10 = [v7 futureWithBlock:v12 scheduler:sleepIntervalScheduler];

  return v10;
}

void __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) detectInBedTimesDuringInterval:*(void *)(a1 + 40)];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_2;
  v11[3] = &unk_2645D9198;
  v5 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v6 = [v4 flatMap:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_4;
  v9[3] = &unk_2645D91C0;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

id __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _logDetections:v4];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global);

  [*(id *)(a1 + 32) _compareWithCoreDuetInBedDetectionForInterval:*(void *)(a1 + 40)];
  id v6 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v6;
}

HDSPSleepSessionInterval *__57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[HDSPSleepSessionInterval sleepSessionIntervalWithInterval:a2 type:1];
}

void __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v9 = 138543618;
      *(void *)&v9[4] = objc_opt_class();
      *(_WORD *)&v9[12] = 2114;
      *(void *)&v9[14] = v6;
      id v8 = *(id *)&v9[4];
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to detect time-in-bed with error: %{public}@", v9, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v6, *(_OWORD *)v9, *(void *)&v9[16], v10);
}

- (void)_logDetections:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 count];
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] found %lu in-bed intervals", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__HDSPTimeInBedTracker__logDetections___block_invoke;
  v8[3] = &unk_2645D9210;
  v8[4] = self;
  objc_msgSend(v4, "na_each:", v8);
}

void __39__HDSPTimeInBedTracker__logDetections___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    id v5 = v4;
    id v6 = [v2 startDate];
    id v7 = [v2 endDate];
    int v8 = 138543874;
    id v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] inBed [%@ - %@]", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_compareWithCoreDuetInBedDetectionForInterval:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] comparing against _CDInBedDetector...", buf, 0xCu);
  }
  id v7 = +[HDSPCDInBedDetector inBedDetector];
  int v8 = [v7 detectInBedTimesDuringInterval:v4];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HDSPTimeInBedTracker__compareWithCoreDuetInBedDetectionForInterval___block_invoke;
  v10[3] = &unk_2645D9238;
  v10[4] = self;
  id v9 = (id)[v8 addCompletionBlock:v10];
}

void __70__HDSPTimeInBedTracker__compareWithCoreDuetInBedDetectionForInterval___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v5;
      id v7 = v9;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to detect time-in-bed with error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _logDetections:a2];
  }
}

- (id)_computeSessionMetadataForInterval:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v33 = (id)objc_opt_class();
    __int16 v34 = 2114;
    id v35 = v4;
    id v6 = v33;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _computeSessionMetadataForInterval: %{public}@", buf, 0x16u);
  }
  id v7 = [(HDSPTimeInBedTracker *)self sleepScheduleModel];
  int v8 = [v4 endDate];
  id v9 = [v7 previousOccurrenceBeforeDate:v8];

  __int16 v10 = HKSPLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v33 = v11;
    __int16 v34 = 2114;
    id v35 = v9;
    id v12 = v11;
    _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] previous occurrence: %{public}@", buf, 0x16u);
  }
  if ([v9 isSingleDayOverride])
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    uint64_t v14 = [v9 wakeUpComponents];
    id v15 = [v13 dateFromComponents:v14];

    __int16 v16 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    id v17 = [v9 bedtimeComponents];
    [v16 dateFromComponents:v17];
  }
  else
  {
    uint64_t v18 = [v4 endDate];
    uint64_t v19 = [v9 wakeUpComponents];
    id v15 = objc_msgSend(v18, "hksp_dateNearestMatchingComponents:", v19);

    __int16 v16 = [v4 startDate];
    id v17 = [v9 bedtimeComponents];
    objc_msgSend(v16, "hksp_dateNearestMatchingComponents:", v17);
  uint64_t v20 = };

  v21 = HKSPLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    id v33 = v22;
    __int16 v34 = 2114;
    id v35 = v15;
    __int16 v36 = 2114;
    v37 = v20;
    id v23 = v22;
    _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] user set wake time: %{public}@ user set bed time: %{public}@", buf, 0x20u);
  }
  v24 = (void *)MEMORY[0x263EFFA78];
  if (v20 && v15)
  {
    v25 = objc_msgSend(MEMORY[0x263EFFA18], "systemTimeZone", *MEMORY[0x263F09B00]);
    v26 = [v25 name];
    uint64_t v27 = *MEMORY[0x263F0AB78];
    v31[0] = v26;
    v31[1] = v20;
    uint64_t v28 = *MEMORY[0x263F0AB80];
    v30[1] = v27;
    v30[2] = v28;
    v31[2] = v15;
    v24 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  }

  return v24;
}

- (id)processedSessionForSession:(id)a3
{
  id v4 = a3;
  if ([v4 requiresFirstUnlock])
  {
    id v5 = [v4 interval];
    id v6 = [(HDSPTimeInBedTracker *)self computeSleepIntervalsForInterval:v5];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__HDSPTimeInBedTracker_processedSessionForSession___block_invoke;
    v9[3] = &unk_2645D9198;
    id v10 = v4;
    id v11 = self;
    id v7 = [v6 flatMap:v9];
  }
  else
  {
    id v7 = [MEMORY[0x263F58190] futureWithResult:v4];
  }

  return v7;
}

id __51__HDSPTimeInBedTracker_processedSessionForSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 interval];
  uint64_t v6 = [*(id *)(a1 + 32) endReason];
  id v7 = [*(id *)(a1 + 32) metadata];
  int v8 = +[HDSPSleepSession sleepSessionWithDateInterval:v5 sleepIntervals:v4 endReason:v6 metadata:v7 requiresFirstUnlock:0];

  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    id v10 = v18;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished processing session: %{public}@", (uint8_t *)&v17, 0x16u);
  }
  id v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    uint64_t v14 = [v8 sleepIntervals];
    int v17 = 138543618;
    id v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] processed session has intervals: %@", (uint8_t *)&v17, 0x16u);
  }
  id v15 = [MEMORY[0x263F58190] futureWithResult:v8];

  return v15;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSleepTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPSleepTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NAScheduler)sleepIntervalScheduler
{
  return self->_sleepIntervalScheduler;
}

- (HDSPInBedDetector)inBedDetector
{
  return self->_inBedDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inBedDetector, 0);
  objc_storeStrong((id *)&self->_sleepIntervalScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end