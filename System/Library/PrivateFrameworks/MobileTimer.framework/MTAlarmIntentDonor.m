@interface MTAlarmIntentDonor
- (MTAlarmIntentDonor)initWithStorage:(id)a3;
- (MTAlarmStorage)storage;
- (NAScheduler)serializer;
- (NSMutableDictionary)alarmsByID;
- (void)prepareAlarms;
- (void)setSerializer:(id)a3;
- (void)source:(id)a3 didAddAlarms:(id)a4;
- (void)source:(id)a3 didRemoveAlarms:(id)a4;
- (void)source:(id)a3 didUpdateAlarms:(id)a4;
@end

@implementation MTAlarmIntentDonor

- (MTAlarmIntentDonor)initWithStorage:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)&self->_storage, a3);
    [(MTAlarmStorage *)self->_storage registerObserver:self];
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTAlarmIntentDonor.access-queue", +[MTScheduler defaultPriority]);
    v7 = (NAScheduler *)objc_claimAutoreleasedReturnValue();
    serializer = self->_serializer;
    self->_serializer = v7;
  }
  return self;
}

- (void)prepareAlarms
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__MTAlarmIntentDonor_prepareAlarms__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

void __35__MTAlarmIntentDonor_prepareAlarms__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allAlarms", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = *(void **)(*(void *)(a1 + 32) + 16);
        uint64_t v12 = (void *)[v10 copy];
        v13 = [v10 alarmID];
        [v11 setObject:v12 forKey:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  serializer = self->_serializer;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke;
  v26[3] = &unk_1E5915000;
  id v9 = v7;
  id v27 = v9;
  v28 = self;
  [(NAScheduler *)serializer performBlock:v26];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 donatesIntent])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = v9;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = objc_msgSend(MEMORY[0x1E4F304D0], "mt_intentForAlarmCreate:", *(void *)(*((void *)&v22 + 1) + 8 * i));
          long long v15 = MTLogForCategory(3);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v30 = self;
            __int16 v31 = 2114;
            v32 = v14;
            _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm added - Donating intent: %{public}@", buf, 0x16u);
          }

          long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v14 response:0];
          [v16 mtSetIntentDonorFromSource:v6];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5;
          v20[3] = &unk_1E5915AA8;
          id v21 = v14;
          id v17 = v14;
          [v16 donateInteractionWithCompletion:v20];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
      }
      while (v11);
    }

    id v9 = v18;
  }
}

void __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 16);
        id v9 = objc_msgSend(v7, "copy", (void)v11);
        uint64_t v10 = [v7 alarmID];
        [v8 setObject:v9 forKey:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%@ donated successfully", (uint8_t *)&v7, 0xCu);
  }
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 donatesIntent])
  {
    serializer = self->_serializer;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke;
    v9[3] = &unk_1E5915078;
    id v10 = v7;
    long long v11 = self;
    id v12 = v6;
    [(NAScheduler *)serializer performBlock:v9];
  }
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v39;
    v30 = @"MTAlarmSleepScheduleKey";
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v39 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v38 + 1) + 8 * v5);
        id v7 = *(void **)(*(void *)(a1 + 40) + 16);
        uint64_t v8 = objc_msgSend(v6, "alarmID", v30);
        uint64_t v9 = [v7 objectForKey:v8];

        if (!v9) {
          goto LABEL_22;
        }
        id v10 = +[MTChangeSet changeSetWithChangesFromObject:v9 toObject:v6];
        if (([v10 hasChangeForProperty:@"MTAlarmLastModifiedDate"] & 1) == 0)
        {

          goto LABEL_22;
        }
        long long v11 = [v10 changes];
        if ([v11 count] == 2
          && [v10 hasChangeForProperty:@"MTAlarmEnabled"])
        {
        }
        else
        {
          id v12 = [v10 changes];
          if ([v12 count] != 3
            || ([v10 hasChangeForProperty:@"MTAlarmEnabled"] & 1) == 0)
          {

LABEL_17:
            char v14 = 1;
            goto LABEL_18;
          }
          int v13 = [v10 hasChangeForProperty:v30];

          if (!v13) {
            goto LABEL_17;
          }
        }
        char v14 = 0;
LABEL_18:
        if (([v10 hasChangeForProperty:@"MTAlarmHour"] & 1) != 0
          || ([v10 hasChangeForProperty:@"MTAlarmMinute"] & 1) != 0
          || [v10 hasChangeForProperty:@"MTAlarmTitle"])
        {

          long long v15 = (void *)MEMORY[0x1E4F304D0];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_2;
          v36[3] = &unk_1E5916328;
          uint64_t v16 = *(void **)(a1 + 48);
          v36[4] = *(void *)(a1 + 40);
          v36[5] = v6;
          id v37 = v16;
          objc_msgSend(v15, "mt_deleteDonationsForAlarm:completion:", v6, v36);

          if ((v14 & 1) == 0) {
            goto LABEL_28;
          }
        }
        else
        {

          if ((v14 & 1) == 0)
          {
LABEL_28:
            if ([v6 isEnabled]) {
              objc_msgSend(MEMORY[0x1E4F304D0], "mt_intentForAlarmEnable:", v6);
            }
            else {
            id v27 = objc_msgSend(MEMORY[0x1E4F304D0], "mt_intentForAlarmDisable:", v6);
            }
            v20 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v27 response:0];
            [v20 mtSetIntentDonorFromSource:*(void *)(a1 + 48)];
            v28 = [v6 alarmIDString];
            [v20 setGroupIdentifier:v28];

            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_9;
            v34[3] = &unk_1E5915AA8;
            v35 = v27;
            id v22 = v27;
            [v20 donateInteractionWithCompletion:v34];
            long long v23 = &v35;
            goto LABEL_25;
          }
        }
LABEL_22:
        id v17 = objc_msgSend(MEMORY[0x1E4F304D0], "mt_intentForAlarmUpdate:", v6);
        id v18 = MTLogForCategory(3);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v43 = v19;
          __int16 v44 = 2114;
          v45 = v17;
          _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm updated - Donating intent: %{public}@", buf, 0x16u);
        }

        v20 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v17 response:0];
        [v20 mtSetIntentDonorFromSource:*(void *)(a1 + 48)];
        id v21 = [v6 alarmIDString];
        [v20 setGroupIdentifier:v21];

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_10;
        v32[3] = &unk_1E5915AA8;
        v33 = v17;
        id v22 = v17;
        [v20 donateInteractionWithCompletion:v32];
        long long v23 = &v33;
LABEL_25:

        long long v24 = *(void **)(*(void *)(a1 + 40) + 16);
        long long v25 = (void *)[v6 copy];
        v26 = [v6 alarmID];
        [v24 setObject:v25 forKey:v26];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      uint64_t v3 = v29;
    }
    while (v29);
  }
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_2_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = [*(id *)(a1 + 40) alarmIDString];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Interactions for updated alarm %@ deleted successfully", buf, 0x16u);
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F304D0], "mt_intentForAlarmCreate:", *(void *)(a1 + 40));
    uint64_t v9 = MTLogForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated alarm - Donating intent: %{public}@", buf, 0x16u);
    }

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v8 response:0];
    [v5 mtSetIntentDonorFromSource:*(void *)(a1 + 48)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_8;
    v12[3] = &unk_1E5915600;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v8;
    id v11 = v8;
    [v5 donateInteractionWithCompletion:v12];
  }
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated Alarm %@ donated successfully", (uint8_t *)&v8, 0x16u);
  }
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_9_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%@ donated successfully", (uint8_t *)&v7, 0xCu);
  }
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_10_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%@ donated successfully", (uint8_t *)&v7, 0xCu);
  }
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5 = a4;
  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke;
  v8[3] = &unk_1E5915000;
  id v9 = v5;
  __int16 v10 = self;
  id v7 = v5;
  [(NAScheduler *)serializer performBlock:v8];
}

void __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v7 = *(void **)(*(void *)(a1 + 40) + 16);
        uint64_t v8 = [v6 alarmID];
        [v7 removeObjectForKey:v8];

        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke_2;
        v10[3] = &unk_1E5915AA8;
        v10[4] = v6;
        objc_msgSend(MEMORY[0x1E4F304D0], "mt_deleteDonationsForAlarm:completion:", v6, v10);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 32) alarmIDString];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "Interactions for %@ deleted successfully", (uint8_t *)&v7, 0xCu);
  }
}

- (MTAlarmStorage)storage
{
  return self->_storage;
}

- (NSMutableDictionary)alarmsByID
{
  return self->_alarmsByID;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "Error donating alarm create intent: %{public}@", v2, v3, v4, v5, v6);
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "Error deleting donations for update: %{public}@", v2, v3, v4, v5, v6);
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "Error donating alarm enable intent: %{public}@", v2, v3, v4, v5, v6);
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "Error donating alarm update intent: %{public}@", v2, v3, v4, v5, v6);
}

void __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "Error deleting donations: %{public}@", v2, v3, v4, v5, v6);
}

@end