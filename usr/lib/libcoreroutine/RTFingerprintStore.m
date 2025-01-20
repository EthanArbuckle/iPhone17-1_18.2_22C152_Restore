@interface RTFingerprintStore
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)_appendWiFiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4;
- (void)_fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6;
- (void)_fetchWifiAccessPointsForFingerprint:(id)a3 fetchLimit:(unint64_t)a4 handler:(id)a5;
- (void)appendWiFiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4;
- (void)clearWithHandler:(id)a3;
- (void)fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6;
- (void)fetchWifiAccessPointsForFingerprint:(id)a3 fetchLimit:(unint64_t)a4 handler:(id)a5;
- (void)purgePredating:(id)a3 handler:(id)a4;
@end

@implementation RTFingerprintStore

- (void)appendWiFiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTFingerprintStore_appendWiFiAccessPointsToLastFingerprint_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __70__RTFingerprintStore_appendWiFiAccessPointsToLastFingerprint_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendWiFiAccessPointsToLastFingerprint:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__RTFingerprintStore_fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __95__RTFingerprintStore_fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFingerprintsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) filteredBySettledState:*(void *)(a1 + 64) handler:*(void *)(a1 + 56)];
}

- (void)fetchWifiAccessPointsForFingerprint:(id)a3 fetchLimit:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__RTFingerprintStore_fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __77__RTFingerprintStore_fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWifiAccessPointsForFingerprint:*(void *)(a1 + 40) fetchLimit:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)clearWithHandler:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  [(RTStore *)self removeAll:v5 handler:v4];
}

- (void)purgePredating:(id)a3 handler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v11 = @"start";
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [(RTStore *)self purgePredating:v7 predicateMappings:v9 handler:v6];
}

- (void)_appendWiFiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if ([v7 count])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __71__RTFingerprintStore__appendWiFiAccessPointsToLastFingerprint_handler___block_invoke;
      v16[3] = &unk_1E6B90FD0;
      id v9 = v8;
      id v18 = v9;
      id v17 = v7;
      SEL v19 = a2;
      uint64_t v10 = (void *)MEMORY[0x1E016DB00](v16);
      [(RTStore *)self _performBlock:v10 contextType:2 errorHandler:v9];
    }
    else if (v8)
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[RTFingerprintStore _appendWiFiAccessPointsToLastFingerprint:handler:]";
      __int16 v24 = 1024;
      int v25 = 93;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: accessPoints (in %s:%d)", buf, 0x12u);
    }

    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    unint64_t v21 = @"requires a non-nil accessPoints.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v15 = [v12 errorWithDomain:v13 code:7 userInfo:v14];

    if (v8) {
      (*((void (**)(id, void *))v8 + 2))(v8, v15);
    }
  }
}

void __71__RTFingerprintStore__appendWiFiAccessPointsToLastFingerprint_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v26 = 0;
  id v4 = +[RTFingerprintMO fetchLastByStartDateInManagedObjectContext:v3 error:&v26];
  id v5 = v26;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
LABEL_20:
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    goto LABEL_21;
  }
  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = +[RTWiFiAccessPointMO managedObjectWithAccessPoint:*(void *)(*((void *)&v22 + 1) + 8 * i) inManagedObjectContext:v3];
          if (v13) {
            [v4 addWifiAccessPointsObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F5CDE8]);
    id v15 = [MEMORY[0x1E4F29128] UUID];
    unint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    id v8 = (id)[v14 initWithIdentifier:v15 settledState:0 start:v16 accessPoints:*(void *)(a1 + 32)];

    id v17 = +[RTFingerprintMO managedObjectWithFingerprint:v8 inManagedObjectContext:v3];
  }

  id v21 = 0;
  char v18 = [v3 save:&v21];
  id v6 = v21;
  if ((v18 & 1) == 0)
  {
    SEL v19 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      v28 = v20;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    goto LABEL_20;
  }
LABEL_21:
}

- (void)_fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    if (v10)
    {
      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v41 = "-[RTFingerprintStore _fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:]";
        __int16 v42 = 1024;
        int v43 = 164;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
      }

      if (v11)
      {
LABEL_13:
        if (a5 >= 3)
        {
          unint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v41 = "-[RTFingerprintStore _fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:]";
            __int16 v42 = 1024;
            int v43 = 166;
            _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTScenarioTriggerSettledStateIsValid(settledState) (in %s:%d)", buf, 0x12u);
          }
        }
        if (v10)
        {
          if (v11)
          {
            if ([v10 isOnOrBefore:v11])
            {
              if (a5 < 3)
              {
                v27[0] = MEMORY[0x1E4F143A8];
                v27[1] = 3221225472;
                v27[2] = __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke;
                v27[3] = &unk_1E6B91018;
                v28 = v10;
                id v29 = v11;
                unint64_t v31 = a5;
                id v17 = v12;
                id v30 = v17;
                char v18 = (void *)MEMORY[0x1E016DB00](v27);
                v25[0] = MEMORY[0x1E4F143A8];
                v25[1] = 3221225472;
                v25[2] = __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke_3;
                v25[3] = &unk_1E6B90C18;
                id v26 = v17;
                [(RTStore *)self _performBlock:v18 contextType:1 errorHandler:v25];

                uint64_t v13 = v28;
                goto LABEL_27;
              }
              SEL v19 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v20 = *MEMORY[0x1E4F5CFE8];
              uint64_t v32 = *MEMORY[0x1E4F28568];
              v33 = @"requires a valid settledState.";
              id v21 = (void *)MEMORY[0x1E4F1C9E8];
              long long v22 = &v33;
              long long v23 = &v32;
            }
            else
            {
              SEL v19 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v20 = *MEMORY[0x1E4F5CFE8];
              uint64_t v34 = *MEMORY[0x1E4F28568];
              v35 = @"requires startDate to be before or equal to endDate.";
              id v21 = (void *)MEMORY[0x1E4F1C9E8];
              long long v22 = &v35;
              long long v23 = &v34;
            }
          }
          else
          {
            SEL v19 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v20 = *MEMORY[0x1E4F5CFE8];
            uint64_t v36 = *MEMORY[0x1E4F28568];
            v37 = @"requires a valid endDate.";
            id v21 = (void *)MEMORY[0x1E4F1C9E8];
            long long v22 = &v37;
            long long v23 = &v36;
          }
        }
        else
        {
          SEL v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = *MEMORY[0x1E4F5CFE8];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          v39 = @"requires a valid startDate.";
          id v21 = (void *)MEMORY[0x1E4F1C9E8];
          long long v22 = &v39;
          long long v23 = &v38;
        }
        long long v24 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
        uint64_t v13 = [v19 errorWithDomain:v20 code:7 userInfo:v24];

        (*((void (**)(id, void, NSObject *))v12 + 2))(v12, 0, v13);
        goto LABEL_27;
      }
    }
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[RTFingerprintStore _fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:]";
      __int16 v42 = 1024;
      int v43 = 165;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_13;
  }
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_27:
}

void __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RTFingerprintMO fetchRequest];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  id v8 = [NSNumber numberWithUnsignedInteger:a1[7]];
  uint64_t v9 = [v5 predicateWithFormat:@"(%K >= %@) AND (%K <= %@) AND (%K == %@)", @"start", v6, @"start", v7, @"settledState", v8];
  [v4 setPredicate:v9];

  [v4 setReturnsObjectsAsFaults:0];
  id v14 = 0;
  id v10 = [v3 executeFetchRequest:v4 error:&v14];

  id v11 = v14;
  if (v11)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v12 = [[_RTMap alloc] initWithInput:v10];
    uint64_t v13 = [(_RTMap *)v12 withBlock:&__block_literal_global_4];

    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5CDE8] createWithManagedObject:a2];
}

uint64_t __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchWifiAccessPointsForFingerprint:(id)a3 fetchLimit:(unint64_t)a4 handler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke;
      v19[3] = &unk_1E6B91060;
      uint64_t v20 = v8;
      unint64_t v22 = a4;
      id v10 = v9;
      id v21 = v10;
      id v11 = (void *)MEMORY[0x1E016DB00](v19);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke_3;
      v17[3] = &unk_1E6B90C18;
      id v18 = v10;
      [(RTStore *)self _performBlock:v11 contextType:1 errorHandler:v17];

      id v12 = v20;
    }
    else
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v26 = "-[RTFingerprintStore _fetchWifiAccessPointsForFingerprint:fetchLimit:handler:]";
        __int16 v27 = 1024;
        int v28 = 238;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprint (in %s:%d)", buf, 0x12u);
      }

      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      long long v24 = @"requires a valid fingerprint.";
      unint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v12 = [v14 errorWithDomain:v15 code:7 userInfo:v16];

      (*((void (**)(id, void, NSObject *))v9 + 2))(v9, 0, v12);
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTWiFiAccessPointMO fetchRequest];
  v17[0] = @"wifiAccessPoints";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v4 setRelationshipKeyPathsForPrefetching:v5];

  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = [*(id *)(a1 + 32) identifier];
  id v8 = [v6 predicateWithFormat:@"%K.%K = %@", @"fingerprint", @"identifier", v7];
  [v4 setPredicate:v8];

  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:*(void *)(a1 + 48)];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:1];
  unint64_t v16 = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v4 setSortDescriptors:v10];

  id v15 = 0;
  id v11 = [v3 executeFetchRequest:v4 error:&v15];

  id v12 = v15;
  if (v12)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v13 = [[_RTMap alloc] initWithInput:v11];
    id v14 = [(_RTMap *)v13 withBlock:&__block_literal_global_57];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5CFD0] createWithManagedObject:a2];
}

uint64_t __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"RTFingerprintStore doesn't support enumeration";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:7 userInfo:v8];

  if (a5) {
    *a5 = v9;
  }

  return 0;
}

@end