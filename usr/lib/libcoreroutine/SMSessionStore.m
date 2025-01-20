@interface SMSessionStore
+ (BOOL)areSessionConfigsInTheSameInterval:(id)a3 config2:(id)a4 timeInADayInterval:(id)a5 error:(id *)a6;
+ (BOOL)isDateBetweenStartDate:(id)a3 endDate:(id)a4 targetDate:(id)a5 error:(id *)a6;
+ (id)getDateUsingYearMonthDayFromDate:(id)a3 hoursMinsSecsFromDate:(id)a4;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_clearSessionMonitorStatesWithHandler:(id)a3;
- (void)_clearSessionsWithHandler:(id)a3;
- (void)_clearTriggerDestinationStatesWithHandler:(id)a3;
- (void)_deleteSMLocationMOPredating:(id)a3 handler:(id)a4;
- (void)_deleteSMWorkoutEventMOPredating:(id)a3 handler:(id)a4;
- (void)_deleteSessionMonitorStatesPredating:(id)a3 handler:(id)a4;
- (void)_deleteSessionsAssociatedWithSessionConfiguration:(id)a3 handler:(id)a4;
- (void)_deleteSessionsPredating:(id)a3 handler:(id)a4;
- (void)_deleteTriggerDestinationStatesPredating:(id)a3 handler:(id)a4;
- (void)_fetchMostRecentSessionManagerStateWithHandler:(id)a3;
- (void)_fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4;
- (void)_fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchSessionCountWithDateInterval:(id)a3 handler:(id)a4;
- (void)_fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4;
- (void)_logStoreWithReason:(id)a3 handler:(id)a4;
- (void)clearSessionMonitorStatesWithHandler:(id)a3;
- (void)clearSessionsWithHandler:(id)a3;
- (void)clearTriggerDestinationStatesWithHandler:(id)a3;
- (void)deleteSMLocationMOPredating:(id)a3 handler:(id)a4;
- (void)deleteSMWorkoutEventMOPredating:(id)a3 handler:(id)a4;
- (void)deleteSessionMonitorStatesPredating:(id)a3 handler:(id)a4;
- (void)deleteSessionsAssociatedWithSessionConfiguration:(id)a3 handler:(id)a4;
- (void)deleteSessionsPredating:(id)a3 handler:(id)a4;
- (void)deleteTriggerDestinationStatesPredating:(id)a3 handler:(id)a4;
- (void)fetchMostRecentSessionManagerStateWithHandler:(id)a3;
- (void)fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4;
- (void)fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchSessionCountWithDateInterval:(id)a3 handler:(id)a4;
- (void)fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchSessionStatusWithHandler:(id)a3;
- (void)fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4;
- (void)logStoreWithReason:(id)a3 handler:(id)a4;
- (void)removeSessionManagerStatus:(id)a3 handler:(id)a4;
- (void)storeSessionConfigurations:(id)a3 handler:(id)a4;
- (void)storeSessionManagerStates:(id)a3 handler:(id)a4;
- (void)storeSessionManagerStatus:(id)a3 handler:(id)a4;
- (void)storeSessionMonitorStates:(id)a3 handler:(id)a4;
- (void)storeTriggerDestinationStates:(id)a3 handler:(id)a4;
- (void)updateSessionManagerStatus:(id)a3 handler:(id)a4;
@end

@implementation SMSessionStore

- (void)fetchSessionStatusWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke;
  v7[3] = &unk_1E6B90D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke_20;
    v12[3] = &unk_1E6B92A40;
    id v13 = v2;
    v3 = (void *)MEMORY[0x1E016DB00](v12);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke_2;
    v10[3] = &unk_1E6B90C18;
    id v4 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v4 _performBlock:v3 contextType:1 errorHandler:v10];

    v5 = v13;
  }
  else
  {
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"handler is a required parameter.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v5];
    v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412546;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMSessionManagerStatusMO fetchRequest];
  id v20 = 0;
  v5 = [v3 executeFetchRequest:v4 error:&v20];
  id v6 = v20;
  v7 = objc_opt_new();
  if (!v6 && [v5 count])
  {
    uint64_t v14 = a1;
    id v15 = v3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [MEMORY[0x1E4F99958] createWithManagedObject:*(void *)(*((void *)&v16 + 1) + 8 * v12), v14, v15, (void)v16];
          if (v13) {
            [v7 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    a1 = v14;
    id v3 = v15;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMostRecentSessionManagerStateWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SMSessionStore_fetchMostRecentSessionManagerStateWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__SMSessionStore_fetchMostRecentSessionManagerStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMostRecentSessionManagerStateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchMostRecentSessionManagerStateWithHandler:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F99998]) initWithBatchSize:1 fetchLimit:1 sortByCreationDate:1 ascending:0 dateInterval:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__SMSessionStore__fetchMostRecentSessionManagerStateWithHandler___block_invoke;
    v11[3] = &unk_1E6B92A68;
    id v12 = v4;
    [(SMSessionStore *)self _fetchSessionManagerStatesWithOptions:v5 handler:v11];
    id v6 = v12;
  }
  else
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[SMSessionStore _fetchMostRecentSessionManagerStateWithHandler:]";
      __int16 v15 = 1024;
      LODWORD(v16) = 96;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"handler is a required parameter.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v5];
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      long long v16 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __65__SMSessionStore__fetchMostRecentSessionManagerStateWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[SMSessionStore _fetchMostRecentSessionManagerStateWithHandler:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%s, most recent state fetch failed with error, %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v5 firstObject];
    int v12 = 136315394;
    id v13 = "-[SMSessionStore _fetchMostRecentSessionManagerStateWithHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, fetched most recent state, %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v5 firstObject];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SMSessionStore_fetchSessionManagerStatesWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __63__SMSessionStore_fetchSessionManagerStatesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSessionManagerStatesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __64__SMSessionStore__fetchSessionManagerStatesWithOptions_handler___block_invoke;
    v18[3] = &unk_1E6B910D8;
    id v19 = v6;
    id v8 = v7;
    id v20 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v18);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__SMSessionStore__fetchSessionManagerStatesWithOptions_handler___block_invoke_69;
    v16[3] = &unk_1E6B90C18;
    id v17 = v8;
    [(RTStore *)self _performBlock:v9 contextType:1 errorHandler:v16];

    id v10 = v19;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:]";
      __int16 v23 = 1024;
      LODWORD(v24) = 140;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"handler is a required parameter.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      v24 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __64__SMSessionStore__fetchSessionManagerStatesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:]_block_invoke";
    __int16 v68 = 2112;
    v69 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, options, %@", buf, 0x16u);
  }

  id v6 = +[SMSessionManagerStateMO fetchRequest];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([*(id *)(a1 + 32) sortByCreationDate])
  {
    id v8 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:[*(id *)(a1 + 32) ascending]];
    v75[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
    [v6 setSortDescriptors:v9];
  }
  id v10 = [*(id *)(a1 + 32) dateInterval];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
    id v12 = [*(id *)(a1 + 32) dateInterval];
    id v13 = [v12 startDate];
    __int16 v14 = [*(id *)(a1 + 32) dateInterval];
    id v15 = [v14 endDate];
    uint64_t v16 = [v11 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"date", v13, @"date", v15];
    [v7 addObject:v16];
  }
  if ([*(id *)(a1 + 32) sessionState])
  {
    id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %lu", @"sessionState", [*(id *)(a1 + 32) sessionState]];
    [v7 addObject:v17];
  }
  long long v18 = [*(id *)(a1 + 32) locationBoundingBox];

  if (v18)
  {
    *(void *)buf = 0;
    memset(&v65[1], 0, 24);
    id v19 = [*(id *)(a1 + 32) locationBoundingBox];
    [v19 coordinate];
    id v20 = [*(id *)(a1 + 32) locationBoundingBox];
    [v20 coordinate];
    v21 = [*(id *)(a1 + 32) boundingBoxRadius];
    [v21 doubleValue];
    RTCommonCalculateBoundingBox();

    v52 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v22 = (void *)MEMORY[0x1E4F28F60];
    v60 = [NSNumber numberWithDouble:0.0];
    v53 = [v22 predicateWithFormat:@"%@ <= %K", v60, @"locationLongitude"];
    v74[0] = v53;
    __int16 v23 = (void *)MEMORY[0x1E4F28F60];
    v24 = [NSNumber numberWithDouble:0.0];
    v57 = v6;
    uint64_t v25 = [v23 predicateWithFormat:@"%K <= %@", @"locationLongitude", v24];
    v74[1] = v25;
    v55 = v7;
    v26 = (void *)MEMORY[0x1E4F28F60];
    [NSNumber numberWithDouble:*(double *)buf];
    v27 = uint64_t v58 = a1;
    v28 = [v26 predicateWithFormat:@"%@ <= %K", v27, @"locationLatitude"];
    v74[2] = v28;
    v29 = (void *)MEMORY[0x1E4F28F60];
    v30 = [NSNumber numberWithDouble:0.0];
    v31 = [v29 predicateWithFormat:@"%K <= %@", @"locationLatitude", v30];
    v74[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
    v33 = [v52 andPredicateWithSubpredicates:v32];

    id v7 = v55;
    id v6 = v57;

    a1 = v58;
    [v55 addObject:v33];
  }
  v34 = [*(id *)(a1 + 32) sessionIdentifier];

  if (v34)
  {
    v35 = (void *)MEMORY[0x1E4F28F60];
    v36 = [*(id *)(a1 + 32) sessionIdentifier];
    v37 = [v35 predicateWithFormat:@"%K.%K == %@", @"sessionConfiguration", @"sessionIdentifier", v36];
    [v7 addObject:v37];
  }
  if ([v7 count])
  {
    v38 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
    [v6 setPredicate:v38];
  }
  [v6 setFetchBatchSize:[*(id *)(a1 + 32) batchSize]];
  [v6 setFetchLimit:[*(id *)(a1 + 32) fetchLimit]];
  [v6 setReturnsObjectsAsFaults:0];
  v65[0] = 0;
  v39 = [v3 executeFetchRequest:v6 error:v65];
  id v40 = v65[0];
  v41 = objc_opt_new();
  v42 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    uint64_t v43 = [v39 count];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:]_block_invoke";
    __int16 v68 = 2112;
    v69 = v6;
    __int16 v70 = 2048;
    uint64_t v71 = v43;
    __int16 v72 = 2112;
    id v73 = v40;
    _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "%s, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }

  if (!v40 && [v39 count])
  {
    v54 = v39;
    v56 = v7;
    uint64_t v59 = a1;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v44 = v39;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v62 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:]_block_invoke";
            __int16 v68 = 2112;
            v69 = v49;
            _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%s, sessionManagerState, %@", buf, 0x16u);
          }

          v51 = [MEMORY[0x1E4F99950] createWithManagedObject:v49];
          [v41 addObject:v51];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v46);
    }

    a1 = v59;
    id v7 = v56;
    v39 = v54;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __64__SMSessionStore__fetchSessionManagerStatesWithOptions_handler___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SMSessionStore_fetchSessionConfigurationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __64__SMSessionStore_fetchSessionConfigurationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSessionConfigurationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke;
    v18[3] = &unk_1E6B91088;
    id v19 = v6;
    id v20 = self;
    id v8 = v7;
    id v21 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v18);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_3;
    v16[3] = &unk_1E6B90C18;
    id v17 = v8;
    [(RTStore *)self _performBlock:v9 contextType:1 errorHandler:v16];

    id v10 = v19;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v23 = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]";
      __int16 v24 = 1024;
      LODWORD(v25) = 255;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"handler is a required parameter.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke(int8x16_t *a1, void *a2)
{
  v223[1] = *MEMORY[0x1E4F143B8];
  id v152 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[2].i64[0];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]_block_invoke";
    __int16 v204 = 2112;
    uint64_t v205 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, options, %@", buf, 0x16u);
  }

  id v5 = +[SMSessionConfigurationMO fetchRequest];
  unint64_t v6 = 0x1E4F1C000uLL;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([(id)a1[2].i64[0] sortBySessionStartDate])
  {
    id v8 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"sessionStartDate" ascending:[a1[2].i64[0] ascending]];
    v223[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v223 count:1];
    [v5 setSortDescriptors:v9];
  }
  id v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K == %ld", @"sessionManagerState", @"sessionState", 2];
  [v7 addObject:v11];

  id v12 = [(id)a1[2].i64[0] timeInADayInterval];

  if (v12)
  {
    id v13 = (void *)MEMORY[0x1E4F28F60];
    v201[0] = MEMORY[0x1E4F143A8];
    v201[1] = 3221225472;
    v201[2] = __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_80;
    v201[3] = &unk_1E6B92A90;
    int8x16_t v174 = a1[2];
    id v14 = (id)v174.i64[0];
    int8x16_t v202 = vextq_s8(v174, v174, 8uLL);
    id v15 = [v13 predicateWithBlock:v201];
    [v10 addObject:v15];
  }
  v151 = v10;
  uint64_t v16 = [(id)a1[2].i64[0] startBoundingBoxLocation];

  unint64_t v17 = 0x1E4F28000;
  v154 = a1;
  v155 = v7;
  v153 = v5;
  if (v16)
  {
    *(void *)buf = 0;
    uint64_t v200 = 0;
    uint64_t v199 = 0;
    uint64_t v198 = 0;
    long long v18 = [(id)a1[2].i64[0] startBoundingBoxLocation];
    [v18 coordinate];
    id v19 = [(id)a1[2].i64[0] startBoundingBoxLocation];
    [v19 coordinate];
    id v20 = [(id)a1[2].i64[0] boundingBoxRadius];
    [v20 doubleValue];
    RTCommonCalculateBoundingBox();

    v167 = (void *)MEMORY[0x1E4F28BA0];
    id v21 = (void *)MEMORY[0x1E4F28F60];
    v175 = [NSNumber numberWithDouble:0.0];
    v170 = [v21 predicateWithFormat:@"%@ <= %K.%K", v175, @"sessionManagerState", @"locationLongitude"];
    v222[0] = v170;
    uint64_t v22 = (void *)MEMORY[0x1E4F28F60];
    __int16 v23 = [NSNumber numberWithDouble:0.0];
    __int16 v24 = [v22 predicateWithFormat:@"%K.%K <= %@", @"sessionManagerState", @"locationLongitude", v23];
    v222[1] = v24;
    uint64_t v25 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v26 = [NSNumber numberWithDouble:*(double *)buf];
    v27 = [v25 predicateWithFormat:@"%@ <= %K.%K", v26, @"sessionManagerState", @"locationLatitude"];
    v222[2] = v27;
    v28 = (void *)MEMORY[0x1E4F28F60];
    v29 = [NSNumber numberWithDouble:0.0];
    v30 = [v28 predicateWithFormat:@"%K.%K <= %@", @"sessionManagerState", @"locationLatitude", v29];
    v222[3] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v222 count:4];
    v32 = [v167 andPredicateWithSubpredicates:v31];

    unint64_t v6 = 0x1E4F1C000;
    a1 = v154;

    id v5 = v153;
    id v7 = v155;

    [v155 addObject:v32];
    unint64_t v17 = 0x1E4F28000;
  }
  v33 = [(id)a1[2].i64[0] destinationBoundingBoxLocation];

  if (v33)
  {
    *(void *)buf = 0;
    uint64_t v200 = 0;
    uint64_t v199 = 0;
    uint64_t v198 = 0;
    v34 = [(id)a1[2].i64[0] destinationBoundingBoxLocation];
    [v34 coordinate];
    v35 = [(id)a1[2].i64[0] destinationBoundingBoxLocation];
    [v35 coordinate];
    v36 = [(id)a1[2].i64[0] boundingBoxRadius];
    [v36 doubleValue];
    RTCommonCalculateBoundingBox();

    v168 = (void *)MEMORY[0x1E4F28BA0];
    v37 = (void *)MEMORY[0x1E4F28F60];
    v176 = [NSNumber numberWithDouble:0.0];
    v171 = [v37 predicateWithFormat:@"%@ <= %K", v176, @"destinationLongitude"];
    v221[0] = v171;
    v38 = (void *)MEMORY[0x1E4F28F60];
    v39 = [NSNumber numberWithDouble:0.0];
    id v40 = [v38 predicateWithFormat:@"%K <= %@", @"destinationLongitude", v39];
    v221[1] = v40;
    v41 = (void *)MEMORY[0x1E4F28F60];
    v42 = [NSNumber numberWithDouble:*(double *)buf];
    uint64_t v43 = [v41 predicateWithFormat:@"%@ <= %K", v42, @"destinationLatitude"];
    v221[2] = v43;
    id v44 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v45 = [NSNumber numberWithDouble:0.0];
    uint64_t v46 = [v44 predicateWithFormat:@"%K <= %@", @"destinationLatitude", v45];
    v221[3] = v46;
    uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v221 count:4];
    v48 = [v168 andPredicateWithSubpredicates:v47];

    unint64_t v6 = 0x1E4F1C000uLL;
    a1 = v154;

    id v5 = v153;
    id v7 = v155;

    [v155 addObject:v48];
    unint64_t v17 = 0x1E4F28000;
  }
  v49 = [(id)a1[2].i64[0] dateInterval];

  if (v49)
  {
    v50 = (void *)MEMORY[0x1E4F28F60];
    v51 = [(id)a1[2].i64[0] dateInterval];
    v52 = [v51 startDate];
    v53 = [(id)a1[2].i64[0] dateInterval];
    v54 = [v53 endDate];
    v55 = [v50 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"sessionStartDate", v52, @"sessionStartDate", v54];
    [v155 addObject:v55];

    id v7 = v155;
    unint64_t v17 = 0x1E4F28000;
  }
  v56 = [(id)a1[2].i64[0] sessionIdentifier];

  if (v56)
  {
    v57 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v58 = [(id)a1[2].i64[0] sessionIdentifier];
    uint64_t v59 = [v57 predicateWithFormat:@"%K == %@", @"sessionIdentifier", v58];
    [v7 addObject:v59];
  }
  uint64_t v60 = [(id)a1[2].i64[0] sessionTypes];
  if (v60)
  {
    long long v61 = (void *)v60;
    long long v62 = [(id)a1[2].i64[0] sessionTypes];
    uint64_t v63 = [v62 count];

    if (v63)
    {
      id v64 = objc_alloc(*(Class *)(v6 + 2632));
      v65 = [(id)a1[2].i64[0] sessionTypes];
      v66 = [v64 initWithCapacity:[v65 count]];

      long long v196 = 0u;
      long long v197 = 0u;
      long long v194 = 0u;
      long long v195 = 0u;
      v67 = [(id)a1[2].i64[0] sessionTypes];
      uint64_t v68 = [v67 countByEnumeratingWithState:&v194 objects:v220 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v70 = *(void *)v195;
        do
        {
          for (uint64_t i = 0; i != v69; ++i)
          {
            if (*(void *)v195 != v70) {
              objc_enumerationMutation(v67);
            }
            __int16 v72 = *(void **)(*((void *)&v194 + 1) + 8 * i);
            id v73 = (void *)MEMORY[0x1E016D870]();
            uint64_t v74 = [v72 unsignedIntegerValue];
            v75 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %ld)", @"sessionType", v74];
            [v66 addObject:v75];
          }
          uint64_t v69 = [v67 countByEnumeratingWithState:&v194 objects:v220 count:16];
        }
        while (v69);
      }

      unint64_t v17 = 0x1E4F28000uLL;
      v76 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v66];
      id v7 = v155;
      [v155 addObject:v76];

      a1 = v154;
      id v5 = v153;
    }
  }
  if ([v7 count])
  {
    v77 = [*(id *)(v17 + 2976) andPredicateWithSubpredicates:v7];
    [v5 setPredicate:v77];
  }
  [v5 setFetchBatchSize:[a1[2].i64[0] batchSize]];
  [v5 setFetchLimit:[a1[2].i64[0] fetchLimit]];
  [v5 setReturnsObjectsAsFaults:0];
  id v193 = 0;
  obuint64_t j = [v152 executeFetchRequest:v5 error:&v193];
  id v78 = v193;
  v157 = objc_opt_new();
  v79 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
  {
    uint64_t v80 = [obj count];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]_block_invoke_2";
    __int16 v204 = 2112;
    uint64_t v205 = (uint64_t)v5;
    __int16 v206 = 2048;
    uint64_t v207 = v80;
    __int16 v208 = 2112;
    id v209 = v78;
    _os_log_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_INFO, "%s, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }

  if (v78 || ![obj count])
  {
    v81 = v157;
    (*(void (**)(void))(a1[3].i64[0] + 16))();
    v82 = v151;
    goto LABEL_84;
  }
  v83 = [*(id *)(v17 + 2976) andPredicateWithSubpredicates:v151];
  v84 = [obj filteredArrayUsingPredicate:v83];

  v85 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
  {
    uint64_t v86 = [v84 count];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]_block_invoke";
    __int16 v204 = 2048;
    uint64_t v205 = v86;
    _os_log_impl(&dword_1D9BFA000, v85, OS_LOG_TYPE_INFO, "%s, filtered results count, %lu,", buf, 0x16u);
  }

  v87 = objc_opt_new();
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  obuint64_t j = v84;
  uint64_t v88 = [obj countByEnumeratingWithState:&v189 objects:v219 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v190;
    do
    {
      for (uint64_t j = 0; j != v89; ++j)
      {
        if (*(void *)v190 != v90) {
          objc_enumerationMutation(obj);
        }
        v92 = *(void **)(*((void *)&v189 + 1) + 8 * j);
        v93 = (void *)MEMORY[0x1E016D870]();
        v94 = [v92 sessionIdentifier];
        v95 = [v87 objectForKeyedSubscript:v94];

        if (!v95)
        {
          v96 = objc_opt_new();
          v97 = [v92 sessionIdentifier];
          [v87 setObject:v96 forKeyedSubscript:v97];
        }
        v98 = [v92 sessionIdentifier];
        v99 = [v87 objectForKeyedSubscript:v98];
        v100 = [v92 sessionManagerState];
        [v99 addObject:v100];
      }
      uint64_t v89 = [obj countByEnumeratingWithState:&v189 objects:v219 count:16];
    }
    while (v89);
  }

  v177 = objc_opt_new();
  v165 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:[v154[2].i64[0] ascending]];
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  v101 = [v87 allKeys];
  uint64_t v102 = [v101 countByEnumeratingWithState:&v185 objects:v218 count:16];
  v166 = v87;
  if (v102)
  {
    uint64_t v103 = v102;
    uint64_t v104 = *(void *)v186;
    do
    {
      for (uint64_t k = 0; k != v103; ++k)
      {
        if (*(void *)v186 != v104) {
          objc_enumerationMutation(v101);
        }
        uint64_t v106 = *(void *)(*((void *)&v185 + 1) + 8 * k);
        v107 = (void *)MEMORY[0x1E016D870]();
        v108 = [v87 objectForKeyedSubscript:v106];
        v217 = v165;
        v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v217 count:1];
        v110 = [v108 sortedArrayUsingDescriptors:v109];
        [v177 setObject:v110 forKeyedSubscript:v106];

        v87 = v166;
      }
      uint64_t v103 = [v101 countByEnumeratingWithState:&v185 objects:v218 count:16];
    }
    while (v103);
  }

  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v158 = [v177 allKeys];
  v81 = v157;
  uint64_t v169 = [v158 countByEnumeratingWithState:&v181 objects:v216 count:16];
  if (v169)
  {
    uint64_t v111 = *(void *)v182;
    uint64_t v156 = *(void *)v182;
    do
    {
      uint64_t v112 = 0;
      do
      {
        if (*(void *)v182 != v111) {
          objc_enumerationMutation(v158);
        }
        uint64_t v113 = *(void *)(*((void *)&v181 + 1) + 8 * v112);
        v172 = (void *)MEMORY[0x1E016D870]();
        v114 = [v177 objectForKeyedSubscript:v113];
        v115 = [v114 firstObject];
        v116 = [v115 sessionConfiguration];

        v117 = [MEMORY[0x1E4F99918] createWithManagedObject:v116];
        if (v117)
        {
          [v81 addObject:v117];
          v118 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (!os_log_type_enabled(v118, OS_LOG_TYPE_INFO)) {
            goto LABEL_60;
          }
          v161 = [v116 sessionIdentifier];
          v163 = [v116 sessionStartDate];
          v160 = [v163 stringFromDate];
          v119 = (void *)MEMORY[0x1E4F99950];
          v120 = [v116 sessionManagerState];
          v121 = [v119 convertSessionStateToString:[v120 sessionState]];
          v122 = [MEMORY[0x1E4F99918] sessionTypeToString:[v116 sessionType]];
          v123 = [v177 objectForKeyedSubscript:v113];
          uint64_t v124 = [v123 count];
          *(_DWORD *)buf = 138413314;
          *(void *)&uint8_t buf[4] = v161;
          __int16 v204 = 2112;
          uint64_t v205 = (uint64_t)v160;
          __int16 v206 = 2112;
          uint64_t v207 = (uint64_t)v121;
          __int16 v208 = 2112;
          id v209 = v122;
          __int16 v210 = 2048;
          uint64_t v211 = v124;
          _os_log_impl(&dword_1D9BFA000, v118, OS_LOG_TYPE_INFO, "uuid, %@, startDate, %@, session state, %@, session type, %@, states count, %lu", buf, 0x34u);

          v81 = v157;
          uint64_t v111 = v156;

          goto LABEL_58;
        }
        v118 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          v125 = [v116 sessionIdentifier];
          v164 = [v116 sessionStartDate];
          v160 = [v164 stringFromDate];
          v126 = (void *)MEMORY[0x1E4F99950];
          v162 = [v116 sessionManagerState];
          v127 = [v126 convertSessionStateToString:(int)[v162 sessionState]];
          v128 = [MEMORY[0x1E4F99918] sessionTypeToString:(int)[v116 sessionType]];
          v129 = [v116 conversation];
          v130 = [v116 primaryHandle];
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]_block_invoke";
          __int16 v204 = 2112;
          uint64_t v205 = (uint64_t)v125;
          __int16 v206 = 2112;
          uint64_t v207 = (uint64_t)v160;
          __int16 v208 = 2112;
          id v209 = v127;
          __int16 v210 = 2112;
          uint64_t v211 = (uint64_t)v128;
          __int16 v212 = 2112;
          v213 = v129;
          __int16 v214 = 2112;
          v215 = v130;
          _os_log_error_impl(&dword_1D9BFA000, v118, OS_LOG_TYPE_ERROR, "%s,Could not convert MO to valid config, uuid, %@, startDate, %@, session state, %@, session type, %@, conversation, %@ primaryHandle, %@", buf, 0x48u);

          v81 = v157;
          uint64_t v111 = v156;
LABEL_58:
        }
LABEL_60:

        ++v112;
      }
      while (v169 != v112);
      uint64_t v131 = [v158 countByEnumeratingWithState:&v181 objects:v216 count:16];
      uint64_t v169 = v131;
    }
    while (v131);
  }

  v132 = v154;
  uint64_t v133 = [(id)v154[2].i64[0] timeInADayInterval];
  id v78 = 0;
  if (!v133)
  {
    id v5 = v153;
    id v7 = v155;
    goto LABEL_81;
  }
  v134 = (void *)v133;
  int v135 = [(id)v154[2].i64[0] pickOneConfigInTimeInADayInterval];

  id v5 = v153;
  id v7 = v155;
  if (!v135) {
    goto LABEL_81;
  }
  [v81 sortUsingComparator:&__block_literal_global_17];
  v136 = objc_opt_new();
  if ([v81 count] == 1) {
    goto LABEL_78;
  }
  v173 = v136;
  unint64_t v137 = 0;
  v138 = 0;
  while (1)
  {
    if (![v81 count])
    {
      id v146 = v138;
      goto LABEL_77;
    }
    v139 = (void *)MEMORY[0x1E016D870]();
    v140 = objc_opt_class();
    v141 = [v81 objectAtIndexedSubscript:v137];
    unint64_t v142 = v137 + 1;
    v143 = [v81 objectAtIndexedSubscript:v137 + 1];
    v144 = [(id)v132[2].i64[0] timeInADayInterval];
    id v180 = v138;
    char v145 = [v140 areSessionConfigsInTheSameInterval:v141 config2:v143 timeInADayInterval:v144 error:&v180];
    id v146 = v180;

    id v78 = 0;
    id v5 = v153;
    if ((v145 & 1) == 0) {
      break;
    }
LABEL_72:
    unint64_t v137 = v142;
    v138 = v146;
    v132 = v154;
    if (v142 >= [v81 count] - 1) {
      goto LABEL_77;
    }
  }
  if (!v146)
  {
    v81 = v157;
    v147 = [v157 objectAtIndexedSubscript:v137];
    [v173 addObject:v147];

    goto LABEL_72;
  }
  v132 = v154;
  v81 = v157;
LABEL_77:

  id v7 = v155;
  v136 = v173;
LABEL_78:
  if ([v81 count])
  {
    v148 = [v81 objectAtIndexedSubscript:[v81 count] - 1];
    [v136 addObject:v148];
  }
  v149 = [v136 allObjects];
  uint64_t v150 = [v149 mutableCopy];

  v81 = (void *)v150;
LABEL_81:
  v82 = v151;
  if ([(id)v132[2].i64[0] sortBySessionStartDate])
  {
    v178[0] = MEMORY[0x1E4F143A8];
    v178[1] = 3221225472;
    v178[2] = __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_2;
    v178[3] = &unk_1E6B92AD8;
    id v179 = (id)v132[2].i64[0];
    [v81 sortUsingComparator:v178];
  }
  (*(void (**)(void))(v132[3].i64[0] + 16))();

LABEL_84:
}

uint64_t __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = [a2 sessionStartDate];
  uint64_t v4 = objc_opt_class();
  id v5 = [*(id *)(a1 + 40) timeInADayInterval];
  unint64_t v6 = [v5 startDate];
  id v7 = [v4 getDateUsingYearMonthDayFromDate:v3 hoursMinsSecsFromDate:v6];

  id v8 = [*(id *)(a1 + 40) timeInADayInterval];
  [v8 duration];
  id v9 = [v7 dateByAddingTimeInterval:];

  id v10 = objc_opt_class();
  uint64_t v11 = [*(id *)(a1 + 40) timeInADayInterval];
  id v12 = [v11 endDate];
  id v13 = [v10 getDateUsingYearMonthDayFromDate:v3 hoursMinsSecsFromDate:v12];

  id v14 = [*(id *)(a1 + 40) timeInADayInterval];
  [v14 duration];
  uint64_t v16 = [v13 dateByAddingTimeInterval:-v15];

  id v23 = 0;
  int v17 = [(id)objc_opt_class() isDateBetweenStartDate:v7 endDate:v9 targetDate:v3 error:&v23];
  id v18 = v23;
  if (v18)
  {
    uint64_t v19 = 0;
  }
  else
  {
    id v22 = 0;
    unsigned int v20 = [(id)objc_opt_class() isDateBetweenStartDate:v16 endDate:v13 targetDate:v3 error:&v22];
    id v18 = v22;
    if (v18) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v17 | v20;
    }
  }

  return v19;
}

uint64_t __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 sessionStartDate];
  unint64_t v6 = [v4 sessionStartDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) ascending])
  {
    uint64_t v7 = [v5 sessionStartDate];
    id v8 = v6;
  }
  else
  {
    uint64_t v7 = [v6 sessionStartDate];
    id v8 = v5;
  }
  id v9 = [v8 sessionStartDate];
  uint64_t v10 = [v7 compare:v9];

  return v10;
}

uint64_t __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeSessionManagerStatus:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SMSessionStore_storeSessionManagerStatus_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __52__SMSessionStore_storeSessionManagerStatus_handler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  id v3 = [(id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a1[5], 0];
  [v2 storeWritableObjects:v3 handler:a1[6]];
}

- (void)updateSessionManagerStatus:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SMSessionStore_updateSessionManagerStatus_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __53__SMSessionStore_updateSessionManagerStatus_handler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  id v3 = [(id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a1[5], 0];
  [v2 updateWritableObjects:v3 handler:a1[6]];
}

- (void)storeSessionManagerStates:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SMSessionStore_storeSessionManagerStates_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __52__SMSessionStore_storeSessionManagerStates_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeWritableObjects:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)storeSessionConfigurations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SMSessionStore_storeSessionConfigurations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __53__SMSessionStore_storeSessionConfigurations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeWritableObjects:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)removeSessionManagerStatus:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke;
  block[3] = &unk_1E6B92668;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke_2;
    double v15 = &unk_1E6B91088;
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    id v16 = v3;
    uint64_t v17 = v4;
    id v18 = v5;
    id v6 = (void *)MEMORY[0x1E016DB00](&v12);
    [*(id *)(a1 + 40) _performBlock:v6 contextType:0 errorHandler:v12, v13, v14, v15];

    id v7 = v16;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"requires valid sessionManagerStatus.";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v11 = [v9 errorWithDomain:v10 code:0 userInfo:v7];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
  }
}

void __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[SMSessionManagerStatusMO fetchRequest];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v5 predicateWithFormat:@"%K == %@", @"identifier", v6];
  [v4 setPredicate:v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v8 setResultType:2];
  id v9 = *(void **)(a1 + 40);
  v13[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke_3;
  v11[3] = &unk_1E6B90C18;
  id v12 = *(id *)(a1 + 48);
  [v9 executeDeleteRequests:v10 context:v3 handler:v11];
}

void __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,removeSessionManagerStatus,completed, error, %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)clearSessionsWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SMSessionStore_clearSessionsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __43__SMSessionStore_clearSessionsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSessionsWithHandler:*(void *)(a1 + 40)];
}

- (void)_clearSessionsWithHandler:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)deleteSessionsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SMSessionStore_deleteSessionsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __50__SMSessionStore_deleteSessionsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSessionsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteSessionsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__SMSessionStore__deleteSessionsPredating_handler___block_invoke;
    v10[3] = &unk_1E6B91088;
    id v11 = v6;
    id v12 = self;
    id v8 = v7;
    id v13 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v10);
    [(RTStore *)self _performBlock:v9 contextType:0 errorHandler:v8];
  }
}

void __51__SMSessionStore__deleteSessionsPredating_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMSessionManagerStateMO fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K < %@)", @"date", a1[4]];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

- (void)deleteSessionMonitorStatesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SMSessionStore_deleteSessionMonitorStatesPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __62__SMSessionStore_deleteSessionMonitorStatesPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSessionMonitorStatesPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteSessionMonitorStatesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__SMSessionStore__deleteSessionMonitorStatesPredating_handler___block_invoke;
    v10[3] = &unk_1E6B91088;
    id v11 = v6;
    id v12 = self;
    id v8 = v7;
    id v13 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v10);
    [(RTStore *)self _performBlock:v9 contextType:0 errorHandler:v8];
  }
}

void __63__SMSessionStore__deleteSessionMonitorStatesPredating_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMSessionMonitorStateMO fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K < %@)", @"date", a1[4]];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

- (void)deleteTriggerDestinationStatesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SMSessionStore_deleteTriggerDestinationStatesPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __66__SMSessionStore_deleteTriggerDestinationStatesPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteTriggerDestinationStatesPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteTriggerDestinationStatesPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__SMSessionStore__deleteTriggerDestinationStatesPredating_handler___block_invoke;
    v10[3] = &unk_1E6B91088;
    id v11 = v6;
    id v12 = self;
    id v8 = v7;
    id v13 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v10);
    [(RTStore *)self _performBlock:v9 contextType:0 errorHandler:v8];
  }
}

void __67__SMSessionStore__deleteTriggerDestinationStatesPredating_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMTriggerDestinationStateMO fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K < %@)", @"date", a1[4]];
  [v4 setPredicate:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

- (void)deleteSessionsAssociatedWithSessionConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SMSessionStore_deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __75__SMSessionStore_deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSessionsAssociatedWithSessionConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteSessionsAssociatedWithSessionConfiguration:(id)a3 handler:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__SMSessionStore__deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke;
    v16[3] = &unk_1E6B92B00;
    id v17 = v6;
    id v18 = self;
    id v8 = a4;
    id v9 = (void *)MEMORY[0x1E016DB00](v16);
    [(RTStore *)self _performBlock:v9 contextType:0 errorHandler:v8];

    id v10 = v17;
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"requires valid sessionConfiguration.";
    id v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = a4;
    id v10 = [v13 dictionaryWithObjects:v20 forKeys:&v19 count:1];
    double v15 = [v11 errorWithDomain:v12 code:0 userInfo:v10];
    (*((void (**)(id, void *))a4 + 2))(v14, v15);
  }
}

void __76__SMSessionStore__deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMSessionConfigurationMO fetchRequest];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) sessionID];
  id v7 = [v5 predicateWithFormat:@"%K == %@", @"sessionIdentifier", v6];
  [v4 setPredicate:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v8 setResultType:2];
  id v9 = *(void **)(a1 + 40);
  v11[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v9 executeDeleteRequests:v10 context:v3 handler:&__block_literal_global_125];
}

void __76__SMSessionStore__deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SMSessionStore _deleteSessionsAssociatedWithSessionConfiguration:handler:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, session deletion failed with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)deleteSMLocationMOPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SMSessionStore_deleteSMLocationMOPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __54__SMSessionStore_deleteSMLocationMOPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSMLocationMOPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteSMLocationMOPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__SMSessionStore__deleteSMLocationMOPredating_handler___block_invoke;
    v10[3] = &unk_1E6B91088;
    id v11 = v6;
    id v12 = self;
    id v8 = v7;
    id v13 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v10);
    [(RTStore *)self _performBlock:v9 contextType:0 errorHandler:v8];
  }
}

void __55__SMSessionStore__deleteSMLocationMOPredating_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = +[SMLocationMO fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K < %@)", @"date", a1[4]];
  [v4 setPredicate:v5];

  [v4 setFetchLimit:100];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

- (void)deleteSMWorkoutEventMOPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SMSessionStore_deleteSMWorkoutEventMOPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__SMSessionStore_deleteSMWorkoutEventMOPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSMWorkoutEventMOPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_deleteSMWorkoutEventMOPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__SMSessionStore__deleteSMWorkoutEventMOPredating_handler___block_invoke;
    v10[3] = &unk_1E6B91088;
    id v11 = v6;
    id v12 = self;
    id v8 = v7;
    id v13 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v10);
    [(RTStore *)self _performBlock:v9 contextType:0 errorHandler:v8];
  }
}

void __59__SMSessionStore__deleteSMWorkoutEventMOPredating_handler___block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = +[SMWorkoutEventMO fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K < %@)", @"date", a1[4]];
  [v4 setPredicate:v5];

  [v4 setFetchLimit:100];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v6 setResultType:2];
  id v7 = (void *)a1[5];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 executeDeleteRequests:v8 context:v3 handler:a1[6]];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (a5)
  {
    if (v6)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F5CFE8];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"the SMSessionStore doesn't support enumeration";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v11 = [v8 errorWithDomain:v9 code:7 userInfo:v10];

      id v12 = v11;
      *a5 = v12;
    }
    else
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v16 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", v16, 2u);
      }

      _RTErrorInvalidParameterCreate(@"options");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v16 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v16, 2u);
    }
  }
  return 0;
}

- (void)fetchSessionCountWithDateInterval:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMSessionStore_fetchSessionCountWithDateInterval_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __60__SMSessionStore_fetchSessionCountWithDateInterval_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSessionCountWithDateInterval:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchSessionCountWithDateInterval:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[SMSessionStore _fetchSessionCountWithDateInterval:handler:]";
      __int16 v20 = 1024;
      LODWORD(v21) = 880;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[SMSessionStore _fetchSessionCountWithDateInterval:handler:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, fetching session count with date interval, %@", buf, 0x16u);
  }

  id v10 = objc_alloc(MEMORY[0x1E4F99920]);
  LOBYTE(v14) = 0;
  id v11 = (void *)[v10 initWithBatchSize:*MEMORY[0x1E4F99C08] fetchLimit:*MEMORY[0x1E4F99C08] sortBySessionStartDate:0 ascending:0 sessionTypes:0 timeInADayInterval:0 pickOneConfigInTimeInADayInterval:v14 dateInterval:v6 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__SMSessionStore__fetchSessionCountWithDateInterval_handler___block_invoke;
  v15[3] = &unk_1E6B914B8;
  id v16 = v6;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  [(SMSessionStore *)self _fetchSessionConfigurationsWithOptions:v11 handler:v15];
}

void __61__SMSessionStore__fetchSessionCountWithDateInterval_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v28 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v44 = "-[SMSessionStore _fetchSessionCountWithDateInterval:handler:]_block_invoke";
    __int16 v45 = 2048;
    id v46 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, fetched session configurations with count, %lu", buf, 0x16u);
  }

  v30 = v5;
  id v7 = [v5 valueForKeyPath:@"@distinctUnionOfObjects.sessionID"];
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v30 count];
    uint64_t v11 = [v7 count];
    *(_DWORD *)buf = 136315906;
    id v44 = "-[SMSessionStore _fetchSessionCountWithDateInterval:handler:]_block_invoke";
    __int16 v45 = 2112;
    id v46 = v9;
    __int16 v47 = 2048;
    uint64_t v48 = v10;
    __int16 v49 = 2048;
    uint64_t v50 = v11;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, fetched session configs with interval, %@, count, %lu, unique count, %lu", buf, 0x2Au);
  }
  uint64_t v27 = a1;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v31 = *(void *)v38;
    uint64_t v32 = 0;
    uint64_t v14 = v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v17 = v14;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v34;
          while (2)
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              id v23 = [v22 sessionID:v27];
              if (v23 == v16
                && ([v22 conversation], v24 = objc_claimAutoreleasedReturnValue(), id v23 = v16, v24))
              {
                uint64_t v25 = [v22 conversation];
                int v26 = [v25 isGroup];

                if (v26)
                {
                  ++v32;
                  goto LABEL_23;
                }
              }
              else
              {
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v19) {
              continue;
            }
            break;
          }
LABEL_23:
          uint64_t v14 = v30;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v14 = v30;
  }

  (*(void (**)(void, uint64_t, uint64_t, id))(*(void *)(v27 + 40) + 16))(*(void *)(v27 + 40), [obj count], v32, v28);
}

- (void)storeTriggerDestinationStates:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SMSessionStore_storeTriggerDestinationStates_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __56__SMSessionStore_storeTriggerDestinationStates_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeWritableObjects:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SMSessionStore_fetchTriggerDestinationStateWithSessionID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __68__SMSessionStore_fetchTriggerDestinationStateWithSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTriggerDestinationStateWithSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__SMSessionStore__fetchTriggerDestinationStateWithSessionID_handler___block_invoke;
    v16[3] = &unk_1E6B910D8;
    id v17 = v6;
    id v8 = v7;
    id v18 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__SMSessionStore__fetchTriggerDestinationStateWithSessionID_handler___block_invoke_142;
    v14[3] = &unk_1E6B90C18;
    id v15 = v8;
    [(RTStore *)self _performBlock:v9 contextType:1 errorHandler:v14];

    id v10 = v17;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[SMSessionStore _fetchTriggerDestinationStateWithSessionID:handler:]";
      __int16 v21 = 1024;
      LODWORD(v22) = 952;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"handler is a required parameter.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[SMSessionStore _fetchTriggerDestinationStateWithSessionID:handler:]";
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%s: handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __69__SMSessionStore__fetchTriggerDestinationStateWithSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = +[SMTriggerDestinationStateMO fetchRequest];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v42[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  [v4 setSortDescriptors:v7];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"sessionIdentifier_v2", v8];
    [v5 addObject:v9];
  }
  if ([v5 count])
  {
    id v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
    [v4 setPredicate:v10];
  }
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v32 = 0;
  uint64_t v11 = [v3 executeFetchRequest:v4 error:&v32];
  id v12 = v32;
  id v13 = objc_opt_new();
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v11 count];
    *(_DWORD *)buf = 136315906;
    long long v35 = "-[SMSessionStore _fetchTriggerDestinationStateWithSessionID:handler:]_block_invoke";
    __int16 v36 = 2112;
    long long v37 = v4;
    __int16 v38 = 2048;
    uint64_t v39 = v15;
    __int16 v40 = 2112;
    id v41 = v12;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }

  if (!v12 && [v11 count])
  {
    __int16 v24 = v11;
    uint64_t v25 = a1;
    int v26 = v4;
    id v27 = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          __int16 v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            long long v35 = "-[SMSessionStore _fetchTriggerDestinationStateWithSessionID:handler:]_block_invoke";
            __int16 v36 = 2112;
            long long v37 = v21;
            _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%s, triggerDestinationState, %@", buf, 0x16u);
          }

          uint64_t v23 = [MEMORY[0x1E4F999D0] createWithManagedObject:v21];
          [v13 addObject:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v18);
    }

    int v4 = v26;
    id v3 = v27;
    a1 = v25;
    uint64_t v11 = v24;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __69__SMSessionStore__fetchTriggerDestinationStateWithSessionID_handler___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearTriggerDestinationStatesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SMSessionStore_clearTriggerDestinationStatesWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__SMSessionStore_clearTriggerDestinationStatesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearTriggerDestinationStatesWithHandler:*(void *)(a1 + 40)];
}

- (void)_clearTriggerDestinationStatesWithHandler:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)storeSessionMonitorStates:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SMSessionStore_storeSessionMonitorStates_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __52__SMSessionStore_storeSessionMonitorStates_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeWritableObjects:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SMSessionStore_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__SMSessionStore_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMostRecentSessionMonitorStateWithSessionID:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__SMSessionStore__fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke;
    v16[3] = &unk_1E6B910D8;
    id v17 = v6;
    id v8 = v7;
    id v18 = v8;
    id v9 = (void *)MEMORY[0x1E016DB00](v16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__SMSessionStore__fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke_144;
    v14[3] = &unk_1E6B90C18;
    id v15 = v8;
    [(RTStore *)self _performBlock:v9 contextType:1 errorHandler:v14];

    id v10 = v17;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[SMSessionStore _fetchMostRecentSessionMonitorStateWithSessionID:handler:]";
      __int16 v21 = 1024;
      LODWORD(v22) = 1045;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"handler is a required parameter.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[SMSessionStore _fetchMostRecentSessionMonitorStateWithSessionID:handler:]";
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%s: handler is a required parameter, %@", buf, 0x16u);
    }
  }
}

void __75__SMSessionStore__fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMSessionMonitorStateMO fetchRequest];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v43[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  [v4 setSortDescriptors:v7];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"sessionIdentifier", v8];
    [v5 addObject:v9];
  }
  if ([v5 count])
  {
    id v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
    [v4 setPredicate:v10];
  }
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v33 = 0;
  uint64_t v11 = [v3 executeFetchRequest:v4 error:&v33];
  id v12 = v33;
  id v13 = objc_opt_new();
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v11 count];
    *(_DWORD *)buf = 136315906;
    __int16 v36 = "-[SMSessionStore _fetchMostRecentSessionMonitorStateWithSessionID:handler:]_block_invoke";
    __int16 v37 = 2112;
    __int16 v38 = v4;
    __int16 v39 = 2048;
    uint64_t v40 = v15;
    __int16 v41 = 2112;
    id v42 = v12;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }

  if (!v12 && [v11 count])
  {
    uint64_t v26 = a1;
    id v27 = v4;
    id v28 = v3;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          __int16 v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v36 = "-[SMSessionStore _fetchMostRecentSessionMonitorStateWithSessionID:handler:]_block_invoke";
            __int16 v37 = 2112;
            __int16 v38 = v21;
            _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%s, sessionMonitorState, %@", buf, 0x16u);
          }

          uint64_t v23 = [MEMORY[0x1E4F99970] createWithManagedObject:v21];
          [v13 addObject:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v18);
    }

    id v4 = v27;
    id v3 = v28;
    a1 = v26;
    id v12 = 0;
  }
  uint64_t v24 = *(void *)(a1 + 40);
  uint64_t v25 = [v13 firstObject];
  (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v25, v12);
}

uint64_t __75__SMSessionStore__fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearSessionMonitorStatesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SMSessionStore_clearSessionMonitorStatesWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__SMSessionStore_clearSessionMonitorStatesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSessionMonitorStatesWithHandler:*(void *)(a1 + 40)];
}

- (void)_clearSessionMonitorStatesWithHandler:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(RTStore *)self removeAll:v5 handler:v4];
}

+ (id)getDateUsingYearMonthDayFromDate:(id)a3 hoursMinsSecsFromDate:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 currentCalendar];
  id v9 = [v8 components:28 fromDate:v7];

  id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v11 = [v10 components:224 fromDate:v6];

  [v11 setDay:[v9 day]];
  [v11 setMonth:[v9 month]];
  [v11 setYear:[v9 year]];
  id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v13 = [v12 dateFromComponents:v11];

  return v13;
}

+ (BOOL)isDateBetweenStartDate:(id)a3 endDate:(id)a4 targetDate:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v9)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (!a6) {
      goto LABEL_20;
    }
    uint64_t v15 = @"startDate";
    goto LABEL_19;
  }
  if (!v10)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v21 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v21, 2u);
    }

    if (!a6) {
      goto LABEL_20;
    }
    uint64_t v15 = @"endDate";
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v15);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v13 = 0;
LABEL_23:
    *a6 = v18;
    goto LABEL_24;
  }
  if (!v11)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: targetDate", v20, 2u);
    }

    if (a6)
    {
      uint64_t v15 = @"targetDate";
      goto LABEL_19;
    }
LABEL_20:
    BOOL v13 = 0;
    goto LABEL_24;
  }
  if ([v9 compare:v11] == 1)
  {
    BOOL v13 = 0;
    if (!a6) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  BOOL v13 = [v12 compare:v10] != 1;
  if (a6)
  {
LABEL_22:
    id v18 = 0;
    goto LABEL_23;
  }
LABEL_24:

  return v13;
}

+ (BOOL)areSessionConfigsInTheSameInterval:(id)a3 config2:(id)a4 timeInADayInterval:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10)
    {
      __int16 v41 = a6;
      id v12 = objc_opt_class();
      BOOL v13 = [v9 sessionStartDate];
      uint64_t v14 = [v11 startDate];
      uint64_t v15 = [v12 getDateUsingYearMonthDayFromDate:v13 hoursMinsSecsFromDate:v14];

      [v11 duration];
      __int16 v39 = [v15 dateByAddingTimeInterval:];
      id v16 = objc_opt_class();
      uint64_t v17 = [v9 sessionStartDate];
      id v18 = [v11 endDate];
      uint64_t v19 = [v16 getDateUsingYearMonthDayFromDate:v17 hoursMinsSecsFromDate:v18];

      [v11 duration];
      uint64_t v43 = v19;
      id v42 = [v19 dateByAddingTimeInterval:-v20];
      __int16 v21 = objc_opt_class();
      uint64_t v22 = [v10 sessionStartDate];
      uint64_t v23 = [v11 startDate];
      [v21 getDateUsingYearMonthDayFromDate:v22 hoursMinsSecsFromDate:v23];
      uint64_t v25 = v24 = v10;

      [v11 duration];
      uint64_t v26 = [v25 dateByAddingTimeInterval:];
      id v27 = objc_opt_class();
      uint64_t v40 = v24;
      id v28 = [v24 sessionStartDate];
      long long v29 = [v11 endDate];
      long long v30 = [v27 getDateUsingYearMonthDayFromDate:v28 hoursMinsSecsFromDate:v29];

      [v11 duration];
      long long v32 = [v30 dateByAddingTimeInterval:-v31];
      if [v15 isEqualToDate:v25] && (objc_msgSend(v39, "isEqualToDate:", v26))
      {
        char v33 = 1;
        long long v34 = v41;
        if (!v41) {
          goto LABEL_22;
        }
      }
      else
      {
        long long v34 = v41;
        if ([v43 isEqualToDate:v30])
        {
          char v33 = [v42 isEqualToDate:v32];
          if (!v41) {
            goto LABEL_22;
          }
        }
        else
        {
          char v33 = 0;
          if (!v41)
          {
LABEL_22:

            id v10 = v40;
            goto LABEL_23;
          }
        }
      }
      id *v34 = 0;
      goto LABEL_22;
    }
    __int16 v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v44 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: config2", v44, 2u);
    }

    if (a6)
    {
      __int16 v36 = @"config2";
      goto LABEL_18;
    }
LABEL_19:
    char v33 = 0;
    goto LABEL_23;
  }
  long long v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: config1", buf, 2u);
  }

  if (!a6) {
    goto LABEL_19;
  }
  __int16 v36 = @"config1";
LABEL_18:
  _RTErrorInvalidParameterCreate((uint64_t)v36);
  char v33 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v33;
}

- (void)_logStoreWithReason:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __46__SMSessionStore__logStoreWithReason_handler___block_invoke;
  v13[3] = &unk_1E6B91060;
  id v14 = v7;
  SEL v16 = a2;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __46__SMSessionStore__logStoreWithReason_handler___block_invoke_161;
  v11[3] = &unk_1E6B90C18;
  id v12 = v15;
  id v9 = v15;
  id v10 = v7;
  [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v11];
}

void __46__SMSessionStore__logStoreWithReason_handler___block_invoke(uint64_t a1, void *a2)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      unint64_t v34 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "start logging local store with reason, %@", buf, 0xCu);
    }
  }
  uint64_t v23 = a1;
  id v6 = +[SMSessionManagerStateMO fetchRequest];
  [v6 setReturnsObjectsAsFaults:0];
  v42[0] = @"sessionConfiguration";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  [v6 setRelationshipKeyPathsForPrefetching:v7];

  uint64_t v8 = [v6 setFetchLimit:5];
  unint64_t v9 = 0;
  id v10 = 0;
  uint64_t v24 = v6;
  uint64_t v25 = v3;
  do
  {
    context = (void *)MEMORY[0x1E016D870](v8);
    id v32 = 0;
    id v11 = [v3 executeFetchRequest:v6 error:&v32];
    id v27 = v32;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = v11;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v10);
          }
          SEL v16 = [MEMORY[0x1E4F99950] createWithManagedObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            ++v9;
            *(_DWORD *)buf = 134218242;
            unint64_t v34 = v9;
            __int16 v35 = 2112;
            __int16 v36 = v16;
            _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%lu, sessionManagerState, %@", buf, 0x16u);
          }
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v13);
    }

    id v6 = v24;
    [v24 setFetchOffset:[v24 fetchOffset] + [v10 count]];
    id v3 = v25;
    [v25 reset];
    uint64_t v8 = [v10 count];
  }
  while (v8 && v9 <= 9 && !v27);
  if (*(void *)(v23 + 32))
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      unint64_t v19 = *(void *)(v23 + 32);
      *(_DWORD *)buf = 138412290;
      unint64_t v34 = v19;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "end logging local store with reason, %@", buf, 0xCu);
    }
  }
  double v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    __int16 v21 = NSStringFromSelector(*(SEL *)(v23 + 48));
    *(_DWORD *)buf = 138413058;
    unint64_t v34 = (unint64_t)v21;
    __int16 v35 = 2112;
    __int16 v36 = v24;
    __int16 v37 = 2048;
    unint64_t v38 = v9;
    __int16 v39 = 2112;
    id v40 = v27;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  uint64_t v22 = *(void *)(v23 + 40);
  if (v22) {
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v27);
  }
}

uint64_t __46__SMSessionStore__logStoreWithReason_handler___block_invoke_161(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)logStoreWithReason:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SMSessionStore_logStoreWithReason_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __45__SMSessionStore_logStoreWithReason_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logStoreWithReason:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

@end