@interface MTTimeInBedSessionTracker
+ (BOOL)_shouldUseBedtimeDismissedDateForAlarm:(id)a3;
+ (BOOL)_trackingEnabledForSleepAlarm:(id)a3;
- (Class)sessionClass;
- (id)_createSleepSessionWithUserWakeTime:(id)a3 endReason:(unint64_t)a4;
- (id)processedSessionForSession:(id)a3;
- (void)endSessionWithDate:(id)a3 reason:(unint64_t)a4;
@end

@implementation MTTimeInBedSessionTracker

+ (BOOL)_trackingEnabledForSleepAlarm:(id)a3
{
  return [a3 timeInBedTracking];
}

+ (BOOL)_shouldUseBedtimeDismissedDateForAlarm:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 bedtimeDismissedDate];
  if (v5 && (v6 = (void *)v5, uint64_t v7 = [v4 bedtimeDismissedAction], v6, v7 == 2))
  {
    v8 = [v4 bedtimeComponents];
    v9 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    v10 = [v4 bedtimeDismissedDate];
    v11 = [v9 mtPreviousDateBeforeDate:v10 matchingComponents:v8];

    v12 = [v4 bedtimeDismissedDate];
    v13 = [v9 mtNextDateAfterDate:v12 matchingComponents:v8];

    v14 = [v4 bedtimeDismissedDate];
    [v14 timeIntervalSinceDate:v11];
    double v16 = v15;

    v17 = [v4 bedtimeDismissedDate];
    [v13 timeIntervalSinceDate:v17];
    double v19 = v18;

    BOOL v20 = v16 < 4500.0 || v19 < 3600.0;
    if (!v20)
    {
      v21 = MTLogForCategory(7);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v4 bedtimeDismissedDate];
        int v24 = 138543618;
        id v25 = a1;
        __int16 v26 = 2112;
        v27 = v22;
        _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring user bedtime %@.", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (Class)sessionClass
{
  return (Class)objc_opt_class();
}

- (void)endSessionWithDate:(id)a3 reason:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = MTLogForCategory(7);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = MTSleepSessionEndReasonDescription(a4);
    int v11 = 138543618;
    v12 = self;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping session with reason %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v9 = [(MTTimeInBedSessionTracker *)self _createSleepSessionWithUserWakeTime:v6 endReason:a4];

  v10 = [(MTSleepSessionTracker *)self sleepSessionTrackerDelegate];
  [v10 sleepSessionTracker:self sessionDidComplete:v9];
}

- (id)_createSleepSessionWithUserWakeTime:(id)a3 endReason:(unint64_t)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(MTSleepSessionTracker *)self cachedAlarm];
  if ([(id)objc_opt_class() _shouldUseBedtimeDismissedDateForAlarm:v6]
    && ([v6 bedtimeDismissedDate], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = MTLogForCategory(7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ User bed time was: %@", buf, 0x16u);
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    v10 = [v6 bedtimeComponents];
    uint64_t v7 = [v9 mtPreviousDateBeforeDate:v5 matchingComponents:v10];

    int v11 = MTLogForCategory(7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ User bed time unset.  Using: %@", buf, 0x16u);
    }

    if (!v7)
    {
      NSLog(&cfstr_UnexpectedNilU.isa);
      v34 = 0;
      goto LABEL_27;
    }
  }
  v12 = [v6 dismissedDate];
  char v13 = [v5 isEqualToDate:v12];
  if (a4) {
    char v14 = 0;
  }
  else {
    char v14 = v13;
  }

  if ((v14 & 1) == 0) {
    NSLog(&cfstr_WakeTimesDonTA.isa);
  }
  uint64_t v15 = MTLogForCategory(7);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ User wake time was: %@", buf, 0x16u);
  }

  double v16 = [v6 bedtimeComponents];
  v37 = [v7 mtDateNearestMatchingComponents:v16];

  v17 = [v6 dateComponents];
  v36 = [v5 mtDateNearestMatchingComponents:v17];

  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  double v18 = (id *)getHKMetadataKeyTimeZoneSymbolLoc_ptr;
  uint64_t v42 = getHKMetadataKeyTimeZoneSymbolLoc_ptr;
  if (!getHKMetadataKeyTimeZoneSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getHKMetadataKeyTimeZoneSymbolLoc_block_invoke;
    v47 = &unk_1E5914EC0;
    v48 = &v39;
    double v19 = (void *)HealthKitLibrary();
    BOOL v20 = dlsym(v19, "HKMetadataKeyTimeZone");
    *(void *)(v48[1] + 24) = v20;
    getHKMetadataKeyTimeZoneSymbolLoc_ptr = *(void *)(v48[1] + 24);
    double v18 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v18) {
    -[MTTimeInBedSessionTracker _createSleepSessionWithUserWakeTime:endReason:]();
  }
  id v21 = *v18;
  v43[0] = v21;
  v22 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  v23 = [v22 name];
  v45[0] = v23;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v24 = (id *)get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr;
  uint64_t v42 = get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr;
  if (!get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_block_invoke;
    v47 = &unk_1E5914EC0;
    v48 = &v39;
    id v25 = (void *)HealthKitLibrary();
    __int16 v26 = dlsym(v25, "_HKPrivateMetadataKeySleepAlarmUserSetBedtime");
    *(void *)(v48[1] + 24) = v26;
    get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr = *(void *)(v48[1] + 24);
    int v24 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v24) {
    -[MTTimeInBedSessionTracker _createSleepSessionWithUserWakeTime:endReason:]();
  }
  id v27 = *v24;
  v43[1] = v27;
  v45[1] = v37;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v28 = (id *)get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr;
  uint64_t v42 = get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr;
  if (!get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_block_invoke;
    v47 = &unk_1E5914EC0;
    v48 = &v39;
    v29 = (void *)HealthKitLibrary();
    v30 = dlsym(v29, "_HKPrivateMetadataKeySleepAlarmUserWakeTime");
    *(void *)(v48[1] + 24) = v30;
    get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr = *(void *)(v48[1] + 24);
    uint64_t v28 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v28) {
    -[MTTimeInBedSessionTracker _createSleepSessionWithUserWakeTime:endReason:]();
  }
  id v44 = *v28;
  v45[2] = v36;
  v31 = (void *)MEMORY[0x1E4F1C9E8];
  id v32 = v44;
  v33 = [v31 dictionaryWithObjects:v45 forKeys:v43 count:3];
  v34 = +[MTTimeInBedSession timeInBedSessionWithStartDate:v7 endDate:v5 intervals:0 endReason:a4 metadata:v33];

  [v34 setNeedsAdditionalProcessing:1];
LABEL_27:

  return v34;
}

- (id)processedSessionForSession:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v34 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F5B3D0] inBedDetector];
  id v5 = [v3 startDate];
  v35 = v3;
  id v6 = [v3 endDate];
  id v47 = 0;
  v33 = v4;
  uint64_t v7 = [v4 detectInBedBetweenBedtimeDate:v5 wakupDate:v6 error:&v47];
  id v36 = v47;

  v8 = MTLogForCategory(7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 count];
    *(_DWORD *)buf = 138543618;
    v50 = self;
    __int16 v51 = 2048;
    uint64_t v52 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %lu in-bed intervals", buf, 0x16u);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(obj);
        }
        char v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v15 = MTLogForCategory(7);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          double v16 = [v14 startDate];
          v17 = [v14 endDate];
          *(_DWORD *)buf = 138543874;
          v50 = self;
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v16;
          __int16 v53 = 2112;
          v54 = v17;
          _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ _CDInBedDetection [%@ - %@]", buf, 0x20u);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v11);
  }

  if (!obj || v36)
  {
    v31 = MTLogForCategory(7);
    BOOL v20 = v34;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      [(MTTimeInBedSessionTracker *)(uint64_t)self processedSessionForSession:v31];
    }

    v30 = 0;
    id v25 = v35;
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = obj;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
    BOOL v20 = v34;
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v18);
          }
          int v24 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "_mt_dateInterval");
          objc_msgSend(v34, "na_safeAddObject:", v24);
        }
        uint64_t v21 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v21);
    }

    id v25 = v35;
    __int16 v26 = [v35 startDate];
    id v27 = [v35 endDate];
    uint64_t v28 = [v35 endReason];
    v29 = [v35 metadata];
    v30 = +[MTTimeInBedSession timeInBedSessionWithStartDate:v26 endDate:v27 intervals:v34 endReason:v28 metadata:v29];

    [v30 setNeedsAdditionalProcessing:0];
  }

  return v30;
}

- (void)_createSleepSessionWithUserWakeTime:endReason:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getHKMetadataKeyTimeZone(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTTimeInBedSessionTracker.m", 20, @"%s", dlerror());

  __break(1u);
}

- (void)_createSleepSessionWithUserWakeTime:endReason:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *get_HKPrivateMetadataKeySleepAlarmUserSetBedtime(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTTimeInBedSessionTracker.m", 21, @"%s", dlerror());

  __break(1u);
}

- (void)_createSleepSessionWithUserWakeTime:endReason:.cold.3()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *get_HKPrivateMetadataKeySleepAlarmUserWakeTime(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTTimeInBedSessionTracker.m", 22, @"%s", dlerror());

  __break(1u);
}

- (void)processedSessionForSession:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ In bed detector failed to detect time-in-bed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end