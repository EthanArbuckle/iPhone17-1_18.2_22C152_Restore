@interface HKSleepHealthStore
@end

@implementation HKSleepHealthStore

void __54__HKSleepHealthStore_HDSPSleep__hdsp_persistSessions___block_invoke(id *a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v58 = (id)objc_opt_class();
    id v3 = v58;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] saving sessions", buf, 0xCu);
  }
  v4 = [a1[4] healthStore];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v58 = v6;
    id v7 = v6;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] checking auth status", buf, 0xCu);
  }
  v8 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
  uint64_t v9 = [v4 authorizationStatusForType:v8];

  if (v9 == 1)
  {
    v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v38 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v58 = v38;
      id v39 = v38;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] doesn't have write access for HKCategoryTypeIdentifierSleepAnalysis", buf, 0xCu);
    }
    id v11 = a1[5];
    objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v11 finishWithError:v12];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = a1[6];
    uint64_t v14 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v53;
      uint64_t v40 = *(void *)v53;
      v41 = a1;
      do
      {
        uint64_t v17 = 0;
        uint64_t v42 = v15;
        do
        {
          if (*(void *)v53 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = v17;
          v18 = *(void **)(*((void *)&v52 + 1) + 8 * v17);
          v19 = HKSPLogForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v58 = v20;
            __int16 v59 = 2112;
            v60 = v18;
            id v21 = v20;
            _os_log_impl(&dword_221A52000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing session: %@", buf, 0x16u);
          }
          v22 = [v18 interval];

          v23 = HKSPLogForCategory();
          v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v25 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              id v58 = v25;
              id v26 = v25;
              _os_log_impl(&dword_221A52000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating HealthKit samples", buf, 0xCu);
            }
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            v24 = [v18 sleepIntervals];
            uint64_t v27 = [v24 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v49;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v49 != v29) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v48 + 1) + 8 * i);
                  v32 = (void *)MEMORY[0x263F0A150];
                  v33 = [v18 metadata];
                  v34 = objc_msgSend(v32, "hdsp_categorySampleForSleepSessionInterval:metadata:", v31, v33);

                  objc_msgSend(v13, "na_safeAddObject:", v34);
                }
                uint64_t v28 = [v24 countByEnumeratingWithState:&v48 objects:v56 count:16];
              }
              while (v28);
              uint64_t v16 = v40;
              a1 = v41;
              uint64_t v15 = v42;
            }
          }
          else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v35 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v58 = v35;
            __int16 v59 = 2112;
            v60 = v18;
            id v36 = v35;
            _os_log_error_impl(&dword_221A52000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] skipping session due to missing bedtime or wake time: %@", buf, 0x16u);
          }
          uint64_t v17 = v44 + 1;
        }
        while (v44 + 1 != v15);
        uint64_t v15 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v15);
    }

    id v37 = a1[4];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __54__HKSleepHealthStore_HDSPSleep__hdsp_persistSessions___block_invoke_281;
    v45[3] = &unk_2645DA7E0;
    v45[4] = v37;
    id v46 = v13;
    id v47 = a1[5];
    id v12 = v13;
    [v37 saveSleepTrackingSamples:v12 completion:v45];
  }
}

void __54__HKSleepHealthStore_HDSPSleep__hdsp_persistSessions___block_invoke_281(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = HKSPLogForCategory();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      uint64_t v9 = *(void **)(a1 + 40);
      id v10 = v8;
      int v14 = 138543618;
      id v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = [v9 count];
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished saving %lu samples", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138543618;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2114;
    uint64_t v17 = (uint64_t)v5;
    id v13 = v15;
    _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] saving samples to HealthKit failed with error: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  id v11 = *(void **)(a1 + 48);
  id v12 = NAEmptyResult();
  [v11 finishWithResult:v12 error:v5];
}

@end