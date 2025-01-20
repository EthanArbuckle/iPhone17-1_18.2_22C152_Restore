@interface HDSHPluginServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (BOOL)_deleteSamples:(id)a3 error:(id *)a4;
- (BOOL)_deleteSleepSamplesWithClientSourceInDateInterval:(id)a3 error:(id *)a4;
- (BOOL)_insertSamplesWithClientSource:(id)a3 error:(id *)a4;
- (BOOL)_insertSleepSamplesWithClientSource:(id)a3 replacingSamplesInDateInterval:(id)a4 error:(id *)a5;
- (BOOL)_populateSamplesToInsert:(id)a3 samplesToDelete:(id)a4 forSleepDurationGoal:(id)a5 error:(id *)a6;
- (BOOL)_populateSamplesToInsert:(id)a3 samplesToDelete:(id)a4 forSleepSchedules:(id)a5 error:(id *)a6;
- (BOOL)_replaceSamples:(id)a3 withSamples:(id)a4 error:(id *)a5;
- (HDSHPluginServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)diagnosticDescription;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_performCloudSync;
- (void)_performNanoSyncWithAccessibilityAssertion:(id)a3;
- (void)_saveSleepTrackingSamplesAfterFirstUnlock:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5;
- (void)remote_saveSleepTrackingSamples:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5;
- (void)remote_startSleepTrackingSession;
- (void)remote_stopSleepTrackingSession;
- (void)remote_updateCurrentSleepSchedules:(id)a3 sleepDurationGoal:(id)a4 completion:(id)a5;
@end

@implementation HDSHPluginServer

- (HDSHPluginServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDSHPluginServer;
  v12 = [(HDStandardTaskServer *)&v21 initWithUUID:a3 configuration:a4 client:v11 delegate:a6];
  if (v12)
  {
    v13 = [v11 profile];
    objc_storeWeak((id *)&v12->_profile, v13);

    v14 = [v11 profile];
    uint64_t v15 = [v14 profileExtensionWithIdentifier:*MEMORY[0x263F75F00]];
    profileExtension = v12->_profileExtension;
    v12->_profileExtension = (HDSHProfileExtension *)v15;

    objc_storeStrong((id *)&v12->_client, a5);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.HDSHPluginServer.serial", 0);
    serializer = v12->_serializer;
    v12->_serializer = (OS_dispatch_queue *)v17;

    v19 = [MEMORY[0x263F43498] sharedDiagnosticManager];
    [v19 addObject:v12];
  }
  return v12;
}

+ (id)taskIdentifier
{
  v2 = objc_opt_class();
  return (id)[v2 taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F09BA8];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)remote_updateCurrentSleepSchedules:(id)a3 sleepDurationGoal:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serializer = self->_serializer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__HDSHPluginServer_remote_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke;
  v15[3] = &unk_2647E72A0;
  id v16 = v8;
  dispatch_queue_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(serializer, v15);
}

void __84__HDSHPluginServer_remote_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke(void *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = (os_log_t *)MEMORY[0x263F09958];
  if (a1[4])
  {
    _HKInitializeLogging();
    os_log_t v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = objc_opt_class();
      id v8 = (void *)a1[4];
      *(_DWORD *)buf = 138543618;
      v37 = v7;
      __int16 v38 = 2112;
      v39 = v8;
      id v9 = v7;
      _os_log_impl(&dword_226DD9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating current sleep schedules: %@", buf, 0x16u);
    }
    uint64_t v11 = a1[4];
    id v10 = (void *)a1[5];
    id v35 = 0;
    char v12 = [v10 _populateSamplesToInsert:v2 samplesToDelete:v3 forSleepSchedules:v11 error:&v35];
    id v13 = v35;
    id v14 = v13;
    if ((v12 & 1) == 0) {
      goto LABEL_14;
    }
  }
  if (a1[6])
  {
    _HKInitializeLogging();
    os_log_t v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      dispatch_queue_t v17 = objc_opt_class();
      id v18 = (void *)a1[6];
      *(_DWORD *)buf = 138543618;
      v37 = v17;
      __int16 v38 = 2112;
      v39 = v18;
      id v19 = v17;
      _os_log_impl(&dword_226DD9000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating sleep duration goal: %@", buf, 0x16u);
    }
    v20 = (void *)a1[5];
    uint64_t v21 = a1[6];
    id v34 = 0;
    char v22 = [v20 _populateSamplesToInsert:v2 samplesToDelete:v3 forSleepDurationGoal:v21 error:&v34];
    id v23 = v34;
    id v14 = v23;
    if (v22)
    {

      goto LABEL_11;
    }
LABEL_14:
    v32 = *(void (**)(void))(a1[7] + 16);
    goto LABEL_15;
  }
LABEL_11:
  v24 = (void *)a1[5];
  id v33 = 0;
  uint64_t v25 = [v24 _replaceSamples:v3 withSamples:v2 error:&v33];
  id v14 = v33;
  _HKInitializeLogging();
  v26 = *v4;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v26;
    v28 = objc_opt_class();
    v29 = NSNumber;
    id v30 = v28;
    v31 = [v29 numberWithBool:v25];
    *(_DWORD *)buf = 138543618;
    v37 = v28;
    __int16 v38 = 2112;
    v39 = v31;
    _os_log_impl(&dword_226DD9000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished replace with success: %@", buf, 0x16u);
  }
  v32 = *(void (**)(void))(a1[7] + 16);
LABEL_15:
  v32();
}

- (BOOL)_populateSamplesToInsert:(id)a3 samplesToDelete:(id)a4 forSleepSchedules:(id)a5 error:(id *)a6
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v92 = a3;
  id v98 = a4;
  id v89 = a5;
  id v9 = [v89 firstObject];
  v91 = [v9 startDate];

  id v10 = HKSleepScheduleWeekdayArrayFromWeekdays();
  uint64_t v11 = [v10 arrayByAddingObject:&unk_26DAF2690];

  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v118 objects:v130 count:16];
  v94 = v12;
  obuint64_t j = v13;
  if (!v14)
  {
    id v16 = 0;
    goto LABEL_19;
  }
  uint64_t v15 = v14;
  v96 = a6;
  id v16 = 0;
  uint64_t v17 = *(void *)v119;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v119 != v17) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v118 + 1) + 8 * i);
      v20 = (void *)MEMORY[0x263F43360];
      uint64_t v21 = [v19 integerValue];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      id v23 = objc_msgSend(MEMORY[0x263F431C8], "hk_timeZoneEncodingOptions");
      id v117 = v16;
      v24 = [v20 mostRecentSleepScheduleForWeekday:v21 beforeDate:0 profile:WeakRetained encodingOptions:v23 error:&v117];
      id v25 = v117;

      id v16 = v25;
      id v12 = v94;
      [v94 setObject:v24 forKeyedSubscript:v19];
      if (v24) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = v25 == 0;
      }
      if (!v26)
      {
        if (!objc_msgSend(v25, "hk_isDatabaseAccessibilityError"))
        {
          if (v96)
          {
            id v16 = v25;
            BOOL v31 = 0;
            id *v96 = v16;
          }
          else
          {
            _HKLogDroppedError();
            BOOL v31 = 0;
          }
          v77 = obj;
          id v33 = obj;
          goto LABEL_75;
        }
        _HKInitializeLogging();
        v27 = (void *)*MEMORY[0x263F09958];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
        {
          v28 = v27;
          v29 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v127 = v29;
          __int16 v128 = 2112;
          id v129 = v25;
          id v30 = v29;
          _os_log_impl(&dword_226DD9000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cannot retrieve most recent sample for weekday, protected data unavailable: %@", buf, 0x16u);
        }
      }
    }
    id v13 = obj;
    uint64_t v15 = [obj countByEnumeratingWithState:&v118 objects:v130 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_19:
  id v88 = v16;

  _HKInitializeLogging();
  v32 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEBUG))
  {
    v79 = v32;
    v80 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v127 = v80;
    __int16 v128 = 2112;
    id v129 = v12;
    id v81 = v80;
    _os_log_debug_impl(&dword_226DD9000, v79, OS_LOG_TYPE_DEBUG, "[%{public}@] Old schedules: %@", buf, 0x16u);
  }
  id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v97 = v89;
  uint64_t v34 = [v97 countByEnumeratingWithState:&v113 objects:v125 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v99 = *(void *)v114;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v114 != v99) {
          objc_enumerationMutation(v97);
        }
        v37 = *(void **)(*((void *)&v113 + 1) + 8 * j);
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        [v37 weekdays];
        __int16 v38 = HKSleepScheduleWeekdayArrayFromWeekdays();
        uint64_t v39 = [v38 countByEnumeratingWithState:&v109 objects:v124 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v110;
          do
          {
            for (uint64_t k = 0; k != v40; ++k)
            {
              if (*(void *)v110 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void *)(*((void *)&v109 + 1) + 8 * k);
              v44 = [v33 objectForKeyedSubscript:v43];

              if (v44)
              {
                v45 = [MEMORY[0x263F08690] currentHandler];
                [v45 handleFailureInMethod:a2, self, @"HDSHPluginServer.m", 136, @"Invalid parameter not satisfying: %@", @"newSchedulesByWeekday[weekdayNumber] == nil" object file lineNumber description];
              }
              [v33 setObject:v37 forKeyedSubscript:v43];
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v109 objects:v124 count:16];
          }
          while (v40);
        }
      }
      uint64_t v35 = [v97 countByEnumeratingWithState:&v113 objects:v125 count:16];
    }
    while (v35);
  }

  _HKInitializeLogging();
  v46 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEBUG))
  {
    v82 = v46;
    v83 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v127 = v83;
    __int16 v128 = 2112;
    id v129 = v33;
    id v84 = v83;
    _os_log_debug_impl(&dword_226DD9000, v82, OS_LOG_TYPE_DEBUG, "[%{public}@] New schedules: %@", buf, 0x16u);
  }
  id v47 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v48 = obj;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v105 objects:v123 count:16];
  id v12 = v94;
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v106;
    do
    {
      for (uint64_t m = 0; m != v50; ++m)
      {
        if (*(void *)v106 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = *(void *)(*((void *)&v105 + 1) + 8 * m);
        if (([v47 containsObject:v53] & 1) == 0)
        {
          v54 = [v94 objectForKeyedSubscript:v53];
          v55 = [v33 objectForKeyedSubscript:v53];
          char v56 = [v54 hasEquivalentTimesToSleepSchedule:v55];
          if (v55 && (v56 & 1) == 0)
          {
            if (v54) {
              goto LABEL_51;
            }
            v57 = [v55 bedTimeComponents];
            if (v57)
            {

              goto LABEL_51;
            }
            v58 = [v55 wakeTimeComponents];

            if (v58)
            {
LABEL_51:
              [v92 addObject:v55];
              [v55 weekdays];
              v59 = HKSleepScheduleWeekdayArrayFromWeekdays();
              [v47 addObjectsFromArray:v59];
            }
          }

          continue;
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v105 objects:v123 count:16];
    }
    while (v50);
  }

  _HKInitializeLogging();
  v60 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEBUG))
  {
    v85 = v60;
    v86 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v127 = v86;
    __int16 v128 = 2112;
    id v129 = v47;
    id v87 = v86;
    _os_log_debug_impl(&dword_226DD9000, v85, OS_LOG_TYPE_DEBUG, "[%{public}@] Changed schedules: %@", buf, 0x16u);
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v100 = v47;
  uint64_t v61 = [v100 countByEnumeratingWithState:&v101 objects:v122 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v102;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v102 != v63) {
          objc_enumerationMutation(v100);
        }
        uint64_t v65 = *(void *)(*((void *)&v101 + 1) + 8 * v64);
        v66 = [v12 objectForKeyedSubscript:v65];
        v67 = [v33 objectForKeyedSubscript:v65];
        if (v66)
        {
          if (([v98 containsObject:v66] & 1) == 0)
          {
            v68 = (void *)MEMORY[0x263EFFA08];
            [v66 weekdays];
            v69 = HKSleepScheduleWeekdayArrayFromWeekdays();
            v70 = [v68 setWithArray:v69];
            v71 = objc_msgSend(v70, "hk_minus:", v100);
            uint64_t v72 = [v71 count];

            id v12 = v94;
            if (!v72
              && ([v66 weekdays]
               || [v66 hasEquivalentOverrideDayToSleepSchedule:v67]))
            {
              v73 = [v66 startDate];
              [v73 timeIntervalSinceDate:v91];
              double v75 = v74;

              if (v75 > -3600.0) {
                [v98 addObject:v66];
              }
            }
          }
        }

        ++v64;
      }
      while (v62 != v64);
      uint64_t v76 = [v100 countByEnumeratingWithState:&v101 objects:v122 count:16];
      uint64_t v62 = v76;
    }
    while (v76);
  }

  BOOL v31 = 1;
  v77 = obj;
  id v16 = v88;
LABEL_75:

  return v31;
}

- (BOOL)_populateSamplesToInsert:(id)a3 samplesToDelete:(id)a4 forSleepDurationGoal:(id)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x263F432E8];
  uint64_t v14 = [MEMORY[0x263F0A598] sleepDurationGoalType];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v37 = 0;
  id v16 = [v13 mostRecentSampleWithType:v14 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v37];
  id v17 = v37;

  if (v16) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v17 == 0;
  }
  BOOL v19 = v18;
  if (v18)
  {
    v20 = [v16 quantity];
    uint64_t v21 = [v12 quantity];
    int v22 = [v20 isEqual:v21];

    if (v22)
    {
      _HKInitializeLogging();
      id v23 = (void *)*MEMORY[0x263F09958];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        id v25 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v25;
        id v26 = v25;
        _os_log_impl(&dword_226DD9000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping saving unchanged sleep duration goal", buf, 0xCu);
      }
    }
    else
    {
      [v10 addObject:v12];
      if (v16)
      {
        v29 = [v16 startDate];
        id v30 = [v12 startDate];
        [v29 timeIntervalSinceDate:v30];
        double v32 = v31;

        if (v32 > -3600.0) {
          [v11 addObject:v16];
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v27 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = v27;
      uint64_t v35 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v35;
      __int16 v40 = 2114;
      id v41 = v17;
      id v36 = v35;
      _os_log_error_impl(&dword_226DD9000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving latest sleep duration goal: %{public}@", buf, 0x16u);
    }
    if (a6) {
      *a6 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v19;
}

- (void)remote_startSleepTrackingSession
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v7 = 138543362;
    *(void *)&v7[4] = objc_opt_class();
    id v5 = *(id *)&v7[4];
    _os_log_impl(&dword_226DD9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep tracking session started", v7, 0xCu);
  }
  v6 = [(HDSHProfileExtension *)self->_profileExtension accessibilityAssertionManager];
  [v6 beginObservingContentProtectionState];
}

- (void)remote_stopSleepTrackingSession
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)uint64_t v8 = 138543362;
    *(void *)&v8[4] = objc_opt_class();
    id v5 = *(id *)&v8[4];
    _os_log_impl(&dword_226DD9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep tracking session stopped", v8, 0xCu);
  }
  v6 = [(HDSHProfileExtension *)self->_profileExtension accessibilityAssertionManager];
  [v6 stopObservingContentProtectionState];

  v7 = [(HDSHProfileExtension *)self->_profileExtension accessibilityAssertionManager];
  [v7 invalidateAccessibilityAssertion];
}

- (void)remote_saveSleepTrackingSamples:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [WeakRetained database];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__HDSHPluginServer_remote_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke;
  v16[3] = &unk_2647E72A0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 performWhenDataProtectedByFirstUnlockIsAvailable:v16];
}

uint64_t __94__HDSHPluginServer_remote_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveSleepTrackingSamplesAfterFirstUnlock:*(void *)(a1 + 40) replacingSamplesInDateInterval:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_saveSleepTrackingSamplesAfterFirstUnlock:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, id))a5;
  _HKInitializeLogging();
  id v11 = (os_log_t *)MEMORY[0x263F09958];
  id v12 = (void *)*MEMORY[0x263F09958];
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v13) {
      goto LABEL_7;
    }
    id v14 = v12;
    *(_DWORD *)buf = 138543874;
    id v45 = (id)objc_opt_class();
    __int16 v46 = 2112;
    id v47 = v9;
    __int16 v48 = 2112;
    id v49 = v8;
    id v15 = v45;
    id v16 = "[%{public}@] replacing sleep tracking samples in %@ with %@";
    id v17 = v14;
    uint32_t v18 = 32;
  }
  else
  {
    if (!v13) {
      goto LABEL_7;
    }
    id v14 = v12;
    *(_DWORD *)buf = 138543618;
    id v45 = (id)objc_opt_class();
    __int16 v46 = 2112;
    id v47 = v8;
    id v15 = v45;
    id v16 = "[%{public}@] saving sleep tracking samples %@";
    id v17 = v14;
    uint32_t v18 = 22;
  }
  _os_log_impl(&dword_226DD9000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

LABEL_7:
  id v19 = objc_alloc_init(MEMORY[0x263F43278]);
  v20 = [(HDSHProfileExtension *)self->_profileExtension accessibilityAssertionManager];
  uint64_t v21 = [v20 accessibilityAssertion];

  if (v21)
  {
    _HKInitializeLogging();
    os_log_t v22 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      v24 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v45 = v24;
      id v25 = v24;
      _os_log_impl(&dword_226DD9000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding accessibility assertion to transaction context", buf, 0xCu);
    }
    [v19 addAccessibilityAssertion:v21];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v27 = [WeakRetained database];
  id v43 = 0;
  uint64_t v36 = MEMORY[0x263EF8330];
  uint64_t v37 = 3221225472;
  __int16 v38 = __104__HDSHPluginServer__saveSleepTrackingSamplesAfterFirstUnlock_replacingSamplesInDateInterval_completion___block_invoke;
  uint64_t v39 = &unk_2647E72C8;
  __int16 v40 = self;
  id v28 = v8;
  id v41 = v28;
  id v29 = v9;
  id v42 = v29;
  uint64_t v30 = [v27 performWithTransactionContext:v19 error:&v43 block:&v36];
  id v31 = v43;

  if (v30)
  {
    -[HDSHPluginServer _performNanoSyncWithAccessibilityAssertion:](self, "_performNanoSyncWithAccessibilityAssertion:", v21, v36, v37, v38, v39, v40, v41);
    [(HDSHPluginServer *)self _performCloudSync];
  }
  else
  {
    _HKInitializeLogging();
    double v32 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
    {
      id v33 = v32;
      uint64_t v34 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v45 = v34;
      __int16 v46 = 2114;
      id v47 = v31;
      id v35 = v34;
      _os_log_error_impl(&dword_226DD9000, v33, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save samples with error: %{public}@", buf, 0x16u);
    }
  }
  v10[2](v10, v30, v31);
}

uint64_t __104__HDSHPluginServer__saveSleepTrackingSamplesAfterFirstUnlock_replacingSamplesInDateInterval_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertSleepSamplesWithClientSource:*(void *)(a1 + 40) replacingSamplesInDateInterval:*(void *)(a1 + 48) error:a2];
}

- (void)_performNanoSyncWithAccessibilityAssertion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained nanoSyncManager];

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v9 = v15;
      _os_log_impl(&dword_226DD9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] nano syncing health data", buf, 0xCu);
    }
    id v10 = objc_loadWeakRetained((id *)&self->_profile);
    id v11 = [v10 nanoSyncManager];
    id v12 = [NSString stringWithFormat:@"[%@] Sleep samples saved", self];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__HDSHPluginServer__performNanoSyncWithAccessibilityAssertion___block_invoke;
    v13[3] = &unk_2647E7200;
    v13[4] = self;
    [v11 syncHealthDataWithOptions:0 reason:v12 accessibilityAssertion:v4 completion:v13];
  }
}

void __63__HDSHPluginServer__performNanoSyncWithAccessibilityAssertion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v4;
      id v7 = v9;
      _os_log_error_impl(&dword_226DD9000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to nano sync health data with error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_performCloudSync
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained cloudSyncManager];
  id v22 = 0;
  int v6 = [v5 canPerformCloudSyncWithError:&v22];
  id v7 = v22;

  _HKInitializeLogging();
  int v8 = (void *)*MEMORY[0x263F09958];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      __int16 v10 = v8;
      id v11 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      id v12 = v11;
      _os_log_impl(&dword_226DD9000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] cloud syncing health data", buf, 0xCu);
    }
    BOOL v13 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
    id v14 = (void *)[objc_alloc(MEMORY[0x263F0A1C8]) initWithChangesSyncRequest:v13];
    id v15 = objc_loadWeakRetained((id *)p_profile);
    uint64_t v16 = [v15 cloudSyncManager];
    id v17 = [NSString stringWithFormat:@"[%@] Sleep samples saved", self];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __37__HDSHPluginServer__performCloudSync__block_invoke;
    v21[3] = &unk_2647E7200;
    v21[4] = self;
    [v16 syncWithRequest:v14 reason:v17 completion:v21];
  }
  else if (v9)
  {
    uint32_t v18 = v8;
    id v19 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v24 = v19;
    __int16 v25 = 2112;
    id v26 = v7;
    id v20 = v19;
    _os_log_impl(&dword_226DD9000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping cloud sync for sleep sample update: %@", buf, 0x16u);
  }
}

void __37__HDSHPluginServer__performCloudSync__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
    {
      int v6 = v5;
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v4;
      id v7 = v9;
      _os_log_error_impl(&dword_226DD9000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to cloud sync health data with error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)_replaceSamples:(id)a3 withSamples:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  __int16 v10 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    *(_DWORD *)buf = 138543874;
    id v23 = (id)objc_opt_class();
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    id v12 = v23;
    _os_log_impl(&dword_226DD9000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing old samples: %@ with new samples: %@", buf, 0x20u);
  }
  id v21 = 0;
  BOOL v13 = [(HDSHPluginServer *)self _insertSamplesWithClientSource:v9 error:&v21];
  id v14 = v21;
  id v15 = v14;
  if (v13)
  {
    id v20 = v14;
    BOOL v16 = [(HDSHPluginServer *)self _deleteSamples:v8 error:&v20];
    id v17 = v20;

    id v15 = v17;
  }
  else
  {
    BOOL v16 = 0;
  }
  id v18 = v15;
  if (v18)
  {
    if (a5) {
      *a5 = v18;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v16;
}

- (BOOL)_deleteSamples:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v6 = objc_msgSend(a3, "hk_map:", &__block_literal_global);
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    *(_DWORD *)id v15 = 138543618;
    *(void *)&void v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2112;
    *(void *)&v15[14] = v6;
    id v9 = *(id *)&v15[4];
    _os_log_impl(&dword_226DD9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting UUIDs: %@", v15, 0x16u);
  }
  __int16 v10 = [(HDStandardTaskServer *)self profile];
  id v11 = [v10 dataManager];
  id v12 = objc_alloc_init(MEMORY[0x263F431C0]);
  char v13 = [v11 deleteObjectsWithUUIDCollection:v6 configuration:v12 error:a4];

  return v13;
}

uint64_t __41__HDSHPluginServer__deleteSamples_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (BOOL)_insertSleepSamplesWithClientSource:(id)a3 replacingSamplesInDateInterval:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (!v9
      || [(HDSHPluginServer *)self _deleteSleepSamplesWithClientSourceInDateInterval:v9 error:a5])&& [(HDSHPluginServer *)self _insertSamplesWithClientSource:v8 error:a5];

  return v10;
}

- (BOOL)_insertSamplesWithClientSource:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained sourceManager];
  id v9 = [v8 createOrUpdateSourceForClient:self->_client error:a4];

  _HKInitializeLogging();
  BOOL v10 = (os_log_t *)MEMORY[0x263F09958];
  id v11 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    char v13 = objc_opt_class();
    client = self->_client;
    int v29 = 138543874;
    uint64_t v30 = v13;
    __int16 v31 = 2112;
    double v32 = client;
    __int16 v33 = 2112;
    uint64_t v34 = v9;
    id v15 = v13;
    _os_log_impl(&dword_226DD9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserting for client: %@, source: %@", (uint8_t *)&v29, 0x20u);
  }
  if (v9)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_profile);
    id v17 = [v16 dataProvenanceManager];
    id v18 = [v17 localDataProvenanceForSourceEntity:v9 version:0 deviceEntity:0];

    id v19 = objc_loadWeakRetained((id *)&self->_profile);
    id v20 = [v19 dataManager];
    uint64_t v21 = [v20 insertDataObjects:v6 withProvenance:v18 creationDate:0 skipInsertionFilter:a4 error:CFAbsoluteTimeGetCurrent()];

    _HKInitializeLogging();
    os_log_t v22 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      __int16 v24 = objc_opt_class();
      id v25 = NSNumber;
      id v26 = v24;
      id v27 = [v25 numberWithBool:v21];
      int v29 = 138543618;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      double v32 = v27;
      _os_log_impl(&dword_226DD9000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Success inserting: %@", (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (BOOL)_deleteSleepSamplesWithClientSourceInDateInterval:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained sourceManager];
  id v9 = [v8 sourceForClient:self->_client error:a4];

  _HKInitializeLogging();
  BOOL v10 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = objc_opt_class();
    client = self->_client;
    *(_DWORD *)buf = 138544130;
    uint64_t v37 = v12;
    __int16 v38 = 2112;
    uint64_t v39 = client;
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    id v43 = v6;
    id v14 = v12;
    _os_log_impl(&dword_226DD9000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting for client: %@, source: %@, dateInterval: %@", buf, 0x2Au);
  }
  if (v9)
  {
    id v15 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
    id v16 = (void *)MEMORY[0x263F434A8];
    id v33 = v6;
    id v17 = HDSampleEntityPredicateForDateInterval();
    v35[0] = v17;
    id v18 = HDSampleEntityPredicateForDataType();
    v35[1] = v18;
    id v19 = HDDataEntityPredicateForSourceEntity();
    v35[2] = v19;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
    uint64_t v21 = [v16 predicateMatchingAllPredicates:v20];

    uint64_t v34 = 0;
    id v22 = objc_loadWeakRetained((id *)&self->_profile);
    id v23 = [v22 dataManager];
    uint64_t v24 = [v23 deleteDataObjectsOfClass:objc_opt_class() predicate:v21 limit:*MEMORY[0x263F434E8] deletedSampleCount:&v34 notifyObservers:1 generateDeletedObjects:1 recursiveDeleteAuthorizationBlock:0 error:a4];

    _HKInitializeLogging();
    id v25 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v25;
      id v27 = objc_opt_class();
      uint64_t v28 = v34;
      int v29 = NSNumber;
      id v30 = v27;
      __int16 v31 = [v29 numberWithBool:v24];
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v27;
      __int16 v38 = 2048;
      uint64_t v39 = v28;
      __int16 v40 = 2112;
      id v41 = v31;
      _os_log_impl(&dword_226DD9000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Success deleting %ld samples: %@", buf, 0x20u);
    }
    id v6 = v33;
  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F73188](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x270F731A8](self, a2);
}

- (id)diagnosticDescription
{
  return &stru_26DAF0A40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end