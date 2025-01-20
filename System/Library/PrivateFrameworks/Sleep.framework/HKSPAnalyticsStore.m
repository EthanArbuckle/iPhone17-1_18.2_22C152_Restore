@interface HKSPAnalyticsStore
- (HKSPAnalyticsStore)initWithUserDefaults:(id)a3;
- (HKSPAnalyticsStore)initWithUserDefaults:(id)a3 diagnosticsOptInStatusProvider:(id)a4;
- (HKSPUserDefaults)userDefaults;
- (id)diagnosticsOptInStatusProvider;
- (id)readAllWindDownActions;
- (id)uncollectedWindDownActions;
- (id)windDownActionsAfterMorningIndex:(int64_t)a3;
- (id)windDownActionsForMorningIndex:(int64_t)a3;
- (void)_setWindDownActions:(id)a3 forMorningIndex:(int64_t)a4 overwriteExisting:(BOOL)a5;
- (void)markAllActionsAsCollected;
- (void)removeAllWindDownActionsBeforeMorningIndex:(int64_t)a3;
- (void)setBaselineForWindDownActions:(id)a3 onMorningIndex:(int64_t)a4;
- (void)setDiagnosticsOptInStatusProvider:(id)a3;
- (void)updateWindDownActions:(id)a3 onMorningIndex:(int64_t)a4;
- (void)writeWindDownActions:(id)a3;
@end

@implementation HKSPAnalyticsStore

- (HKSPAnalyticsStore)initWithUserDefaults:(id)a3 diagnosticsOptInStatusProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPAnalyticsStore;
  v9 = [(HKSPAnalyticsStore *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    uint64_t v11 = [v8 copy];
    id diagnosticsOptInStatusProvider = v10->_diagnosticsOptInStatusProvider;
    v10->_id diagnosticsOptInStatusProvider = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (HKSPAnalyticsStore)initWithUserDefaults:(id)a3
{
  return [(HKSPAnalyticsStore *)self initWithUserDefaults:a3 diagnosticsOptInStatusProvider:&__block_literal_global_14];
}

BOOL __43__HKSPAnalyticsStore_initWithUserDefaults___block_invoke()
{
  return +[HKSPAnalyticsManager defaultIsDiagnosticDataSubmissionAllowed];
}

- (void)writeWindDownActions:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HKSPLogForCategory(0x11uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = objc_opt_class();
    __int16 v33 = 2114;
    id v34 = v4;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Writing wind down actions to defaults: %{public}@", buf, 0x16u);
  }

  if (v4 && [v4 count])
  {
    v24 = self;
    id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v7 = [v4 allKeys];
    id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v9 = [v4 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          objc_super v15 = [HKSPAnalyticsWindDownEventDataWrapper alloc];
          v16 = [v4 objectForKeyedSubscript:v14];
          v17 = [(HKSPAnalyticsWindDownEventDataWrapper *)v15 initWithEventDatums:v16];
          [v8 setObject:v17 forKeyedSubscript:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }

    id v25 = 0;
    v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:0 error:&v25];
    id v19 = v25;
    if (v19)
    {
      v20 = HKSPLogForCategory(0x11uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v21;
        __int16 v33 = 2114;
        id v34 = v19;
        _os_log_error_impl(&dword_1A7E74000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Unabled to archive wind down actions with error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v20 = [(HKSPAnalyticsStore *)v24 userDefaults];
      [v20 hksp_setObject:v18 forKey:@"sleepAnalyticWindDownActions"];
    }
  }
  else
  {
    v22 = HKSPLogForCategory(0x11uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v23;
      _os_log_impl(&dword_1A7E74000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all wind down actions", buf, 0xCu);
    }

    id v8 = [(HKSPAnalyticsStore *)self userDefaults];
    objc_msgSend(v8, "hksp_removeObjectForKey:", @"sleepAnalyticWindDownActions");
  }
}

- (id)readAllWindDownActions
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = [(HKSPAnalyticsStore *)self diagnosticsOptInStatusProvider];
  char v4 = v3[2]();

  if (v4)
  {
    v5 = [(HKSPAnalyticsStore *)self userDefaults];
    id v6 = objc_msgSend(v5, "hksp_dataForKey:", @"sleepAnalyticWindDownActions");

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v8 = objc_opt_class();
      id v32 = 0;
      v9 = [v7 unarchivedDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() fromData:v6 error:&v32];
      uint64_t v10 = v32;
      if (v10)
      {
        uint64_t v11 = HKSPLogForCategory(0x11uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = (uint64_t)v10;
          _os_log_error_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_ERROR, "Unabled to unarchive wind down actions with error: %{public}@", buf, 0xCu);
        }
      }
      if (v9)
      {
        long long v26 = v10;
        long long v27 = v6;
        id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
        v13 = [v9 allKeys];
        uint64_t v14 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        objc_super v15 = [v9 allKeys];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v21 = objc_msgSend(v9, "objectForKeyedSubscript:", v20, v26, v27);
              v22 = [v21 eventDatums];
              [v14 setObject:v22 forKeyedSubscript:v20];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v17);
        }

        uint64_t v23 = HKSPLogForCategory(0x11uLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v24;
          __int16 v35 = 2114;
          v36 = v14;
          _os_log_impl(&dword_1A7E74000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reading wind down actions from defaults: %{public}@", buf, 0x16u);
        }

        uint64_t v10 = v26;
        id v6 = v27;
      }
      else
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
      }
    }
    else
    {
      uint64_t v10 = HKSPLogForCategory(0x11uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v34 = objc_opt_class();
        _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] No wind down actions stored in defaults", buf, 0xCu);
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    id v6 = HKSPLogForCategory(0x11uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = objc_opt_class();
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to read stored actions", buf, 0xCu);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v14;
}

- (void)setBaselineForWindDownActions:(id)a3 onMorningIndex:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = HKSPLogForCategory(0x11uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    int v10 = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting baseline wind down actions for morning index %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(HKSPAnalyticsStore *)self _setWindDownActions:v6 forMorningIndex:a4 overwriteExisting:0];
}

- (void)updateWindDownActions:(id)a3 onMorningIndex:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = HKSPLogForCategory(0x11uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    int v10 = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating wind down actions for morning index %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(HKSPAnalyticsStore *)self _setWindDownActions:v6 forMorningIndex:a4 overwriteExisting:1];
}

- (id)windDownActionsForMorningIndex:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v4 = [(HKSPAnalyticsStore *)self readAllWindDownActions];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = HKSPLogForCategory(0x11uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    int v14 = 138543874;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Wind down actions for morning index %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  int v10 = (void *)[v6 copy];
  uint64_t v11 = v10;
  if (!v10) {
    int v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v10;

  return v12;
}

- (id)uncollectedWindDownActions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HKSPAnalyticsStore *)self readAllWindDownActions];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v4 = objc_msgSend(v2, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [v2 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        int v10 = v9;
        if (v9)
        {
          uint64_t v11 = objc_msgSend(v9, "na_filter:", &__block_literal_global_289);
          [v3 addObjectsFromArray:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

uint64_t __48__HKSPAnalyticsStore_uncollectedWindDownActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 wasCollected] ^ 1;
}

- (id)windDownActionsAfterMorningIndex:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v4 = [(HKSPAnalyticsStore *)self readAllWindDownActions];
  if ([v4 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__HKSPAnalyticsStore_windDownActionsAfterMorningIndex___block_invoke;
    v10[3] = &__block_descriptor_40_e30_B24__0__NSNumber_8__NSArray_16l;
    v10[4] = a3;
    uint64_t v5 = objc_msgSend(v4, "na_filter:", v10);
    uint64_t v6 = HKSPLogForCategory(0x11uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      long long v14 = v8;
      __int16 v15 = 2114;
      long long v16 = v5;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Wind down actions after morning index %{public}@: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

BOOL __55__HKSPAnalyticsStore_windDownActionsAfterMorningIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 integerValue] > *(void *)(a1 + 32);
}

- (void)removeAllWindDownActionsBeforeMorningIndex:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HKSPAnalyticsStore *)self windDownActionsAfterMorningIndex:a3 - 1];
  uint64_t v6 = HKSPLogForCategory(0x11uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    long long v14 = v5;
    _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all wind down actions before morning index %{public}@ except for %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [(HKSPAnalyticsStore *)self writeWindDownActions:v5];
}

- (void)markAllActionsAsCollected
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HKSPAnalyticsStore *)self readAllWindDownActions];
  char v4 = (void *)[v3 mutableCopy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        __int16 v11 = [v4 objectForKeyedSubscript:v10];
        uint64_t v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_293);
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(HKSPAnalyticsStore *)self writeWindDownActions:v4];
}

id __47__HKSPAnalyticsStore_markAllActionsAsCollected__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 wasCollected])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 collectedEventDataCopy];
  }
  char v4 = v3;

  return v4;
}

- (void)_setWindDownActions:(id)a3 forMorningIndex:(int64_t)a4 overwriteExisting:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [(HKSPAnalyticsStore *)self diagnosticsOptInStatusProvider];
  char v10 = v9[2]();

  if (v10)
  {
    __int16 v11 = [(HKSPAnalyticsStore *)self readAllWindDownActions];
    uint64_t v12 = [v11 mutableCopy];

    unint64_t v13 = 0x1E4F28000uLL;
    long long v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    long long v15 = [v12 objectForKeyedSubscript:v14];

    if (v15)
    {
      long long v28 = v15;
      long long v16 = (void *)[v15 mutableCopy];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v29 = v8;
      id v17 = v8;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v23 = [v16 indexOfObject:v22];
            if (v23 == 0x7FFFFFFFFFFFFFFFLL || !v5)
            {
              if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
                [v16 addObject:v22];
              }
            }
            else
            {
              [v16 replaceObjectAtIndex:v23 withObject:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v19);
      }

      id v25 = (void *)[v16 copy];
      id v8 = v29;
      unint64_t v13 = 0x1E4F28000;
    }
    else
    {
      id v25 = (void *)[v8 copy];
    }
    long long v26 = [*(id *)(v13 + 3792) numberWithInteger:a4];
    [v12 setObject:v25 forKeyedSubscript:v26];

    id v27 = [v12 copy];
    [(HKSPAnalyticsStore *)self writeWindDownActions:v27];
  }
  else
  {
    uint64_t v12 = HKSPLogForCategory(0x11uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = objc_opt_class();
      _os_log_impl(&dword_1A7E74000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cannot persist new actions", buf, 0xCu);
    }
  }
}

- (HKSPUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (id)diagnosticsOptInStatusProvider
{
  return self->_diagnosticsOptInStatusProvider;
}

- (void)setDiagnosticsOptInStatusProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_diagnosticsOptInStatusProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end