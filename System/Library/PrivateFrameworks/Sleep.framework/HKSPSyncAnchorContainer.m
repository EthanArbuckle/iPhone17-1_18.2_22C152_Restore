@interface HKSPSyncAnchorContainer
+ (BOOL)supportsSecureCoding;
+ (id)allKeys;
+ (id)descriptionForKey:(id)a3;
- (HKSPSyncAnchor)sleepEventRecordSyncAnchor;
- (HKSPSyncAnchor)sleepEventSyncAnchor;
- (HKSPSyncAnchor)sleepModeSyncAnchor;
- (HKSPSyncAnchor)sleepScheduleStateSyncAnchor;
- (HKSPSyncAnchor)sleepScheduleSyncAnchor;
- (HKSPSyncAnchor)sleepSettingsSyncAnchor;
- (HKSPSyncAnchorContainer)initWithCoder:(id)a3;
- (HKSPSyncAnchorContainer)initWithIdentifier:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)incrementSleepEventRecordSyncAnchor;
- (id)incrementSleepEventSyncAnchor;
- (id)incrementSleepModeSyncAnchor;
- (id)incrementSleepScheduleStateSyncAnchor;
- (id)incrementSleepScheduleSyncAnchor;
- (id)incrementSleepSettingsSyncAnchor;
- (id)incrementSyncAnchorForKey:(id)a3;
- (id)lock_getSyncAnchorForKey:(id)a3;
- (id)lock_incrementSyncAnchorForKey:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)syncAnchorForKey:(id)a3;
- (void)_withLock:(id)a3;
- (void)compareWithContainer:(id)a3 sleepScheduleSyncAnchorOutOfDate:(id)a4 sleepSettingsSyncAnchorOutOfDate:(id)a5 sleepEventRecordSyncAnchorOutOfDate:(id)a6 sleepScheduleStateSyncAnchorOutOfDate:(id)a7 sleepModeSyncAnchorOutOfDate:(id)a8 sleepEventSyncAnchorOutOfDate:(id)a9;
- (void)encodeWithCoder:(id)a3;
- (void)forceSetSleepScheduleSyncAnchor:(id)a3;
- (void)lock_removeSyncAnchorForKey:(id)a3;
- (void)lock_setSyncAnchor:(id)a3 forKey:(id)a4;
- (void)lock_updateSyncAnchor:(id)a3 forKey:(id)a4;
- (void)updateSleepEventRecordSyncAnchor:(id)a3;
- (void)updateSleepEventSyncAnchor:(id)a3;
- (void)updateSleepModeSyncAnchor:(id)a3;
- (void)updateSleepScheduleStateSyncAnchor:(id)a3;
- (void)updateSleepScheduleSyncAnchor:(id)a3;
- (void)updateSleepSettingsSyncAnchor:(id)a3;
- (void)updateSyncAnchor:(id)a3 forKey:(id)a4;
- (void)updateWithContainer:(id)a3;
@end

@implementation HKSPSyncAnchorContainer

void __47__HKSPSyncAnchorContainer_updateWithContainer___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend((id)objc_opt_class(), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 32);
        v9 = [*(id *)(a1 + 40) syncAnchorForKey:v7];
        objc_msgSend(v8, "lock_updateSyncAnchor:forKey:", v9, v7);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)syncAnchorForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__HKSPSyncAnchorContainer_syncAnchorForKey___block_invoke;
  v8[3] = &unk_1E5D32148;
  long long v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(HKSPSyncAnchorContainer *)self _withLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)lock_updateSyncAnchor:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    uint64_t v7 = [(HKSPSyncAnchorContainer *)self lock_syncAnchorForKey:v6];
    v8 = v7;
    if (!v7 || [v7 compare:v9] == -1) {
      [(HKSPSyncAnchorContainer *)self lock_setSyncAnchor:v9 forKey:v6];
    }
  }
}

- (id)lock_getSyncAnchorForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_backingDictionary objectForKeyedSubscript:a3];
}

uint64_t __44__HKSPSyncAnchorContainer_syncAnchorForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "lock_syncAnchorForKey:", *(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

- (void)lock_setSyncAnchor:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copyWithZone:0];
  [(NSMutableDictionary *)self->_backingDictionary setObject:v7 forKeyedSubscript:v6];
}

uint64_t __40__HKSPSyncAnchorContainer_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 16) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 40) + 24) mutableCopy];
  return MEMORY[0x1F41817F8]();
}

+ (id)allKeys
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SleepScheduleSyncAnchor";
  v4[1] = @"SleepSettingsSyncAnchor";
  v4[2] = @"SleepRecordSyncAnchor";
  v4[3] = @"SleepStateSyncAnchor";
  v4[4] = @"SleepModeSyncAnchor";
  v4[5] = @"SleepEventSyncAnchor";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

void __43__HKSPSyncAnchorContainer_encodeWithCoder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 16) forKey:@"identifier"];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)[*(id *)(*(void *)(a1 + 40) + 24) copy];
  [v2 encodeObject:v3 forKey:@"dictionary"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDictionary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HKSPSyncAnchorContainer)initWithCoder:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKSPSyncAnchorContainer;
  id v5 = [(HKSPSyncAnchorContainer *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = HKSPSyncAnchorClass();
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    long long v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"dictionary"];
    uint64_t v12 = [v11 mutableCopy];
    backingDictionary = v5->_backingDictionary;
    v5->_backingDictionary = (NSMutableDictionary *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)updateWithContainer:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HKSPSyncAnchorContainer_updateWithContainer___block_invoke;
  v6[3] = &unk_1E5D31AA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKSPSyncAnchorContainer *)self _withLock:v6];
}

- (HKSPSyncAnchorContainer)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPSyncAnchorContainer;
  uint64_t v6 = [(HKSPSyncAnchorContainer *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backingDictionary = v7->_backingDictionary;
    v7->_backingDictionary = v8;

    long long v10 = v7;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__HKSPSyncAnchorContainer_copyWithZone___block_invoke;
  v8[3] = &unk_1E5D31AA8;
  id v5 = v4;
  id v9 = v5;
  long long v10 = self;
  [(HKSPSyncAnchorContainer *)self _withLock:v8];
  id v6 = v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__HKSPSyncAnchorContainer_encodeWithCoder___block_invoke;
  v6[3] = &unk_1E5D31AA8;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(HKSPSyncAnchorContainer *)self _withLock:v6];
}

- (void)updateSyncAnchor:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__HKSPSyncAnchorContainer_updateSyncAnchor_forKey___block_invoke;
  v10[3] = &unk_1E5D33B50;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(HKSPSyncAnchorContainer *)self _withLock:v10];
}

uint64_t __51__HKSPSyncAnchorContainer_updateSyncAnchor_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lock_updateSyncAnchor:forKey:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)lock_removeSyncAnchorForKey:(id)a3
{
}

- (id)incrementSyncAnchorForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HKSPSyncAnchorContainer_incrementSyncAnchorForKey___block_invoke;
  v8[3] = &unk_1E5D32148;
  long long v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(HKSPSyncAnchorContainer *)self _withLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __53__HKSPSyncAnchorContainer_incrementSyncAnchorForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "lock_incrementSyncAnchorForKey:", *(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

- (id)lock_incrementSyncAnchorForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPSyncAnchorContainer *)self lock_getSyncAnchorForKey:v4];
  id v6 = objc_msgSend(v5, "hksp_increment");
  [(HKSPSyncAnchorContainer *)self lock_setSyncAnchor:v6 forKey:v4];

  return v6;
}

+ (id)descriptionForKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SleepScheduleSyncAnchor"])
  {
    id v4 = @"schedule";
  }
  else if ([v3 isEqualToString:@"SleepSettingsSyncAnchor"])
  {
    id v4 = @"settings";
  }
  else if ([v3 isEqualToString:@"SleepRecordSyncAnchor"])
  {
    id v4 = @"record";
  }
  else if ([v3 isEqualToString:@"SleepStateSyncAnchor"])
  {
    id v4 = @"state";
  }
  else if ([v3 isEqualToString:@"SleepModeSyncAnchor"])
  {
    id v4 = @"mode";
  }
  else if ([v3 isEqualToString:@"SleepEventSyncAnchor"])
  {
    id v4 = @"event";
  }
  else
  {
    id v4 = &stru_1EFE54160;
  }

  return v4;
}

- (HKSPSyncAnchor)sleepScheduleSyncAnchor
{
  return (HKSPSyncAnchor *)[(HKSPSyncAnchorContainer *)self syncAnchorForKey:@"SleepScheduleSyncAnchor"];
}

- (HKSPSyncAnchor)sleepSettingsSyncAnchor
{
  return (HKSPSyncAnchor *)[(HKSPSyncAnchorContainer *)self syncAnchorForKey:@"SleepSettingsSyncAnchor"];
}

- (HKSPSyncAnchor)sleepEventRecordSyncAnchor
{
  return (HKSPSyncAnchor *)[(HKSPSyncAnchorContainer *)self syncAnchorForKey:@"SleepRecordSyncAnchor"];
}

- (HKSPSyncAnchor)sleepScheduleStateSyncAnchor
{
  return (HKSPSyncAnchor *)[(HKSPSyncAnchorContainer *)self syncAnchorForKey:@"SleepStateSyncAnchor"];
}

- (HKSPSyncAnchor)sleepModeSyncAnchor
{
  return (HKSPSyncAnchor *)[(HKSPSyncAnchorContainer *)self syncAnchorForKey:@"SleepModeSyncAnchor"];
}

- (HKSPSyncAnchor)sleepEventSyncAnchor
{
  return (HKSPSyncAnchor *)[(HKSPSyncAnchorContainer *)self syncAnchorForKey:@"SleepEventSyncAnchor"];
}

- (void)compareWithContainer:(id)a3 sleepScheduleSyncAnchorOutOfDate:(id)a4 sleepSettingsSyncAnchorOutOfDate:(id)a5 sleepEventRecordSyncAnchorOutOfDate:(id)a6 sleepScheduleStateSyncAnchorOutOfDate:(id)a7 sleepModeSyncAnchorOutOfDate:(id)a8 sleepEventSyncAnchorOutOfDate:(id)a9
{
  v38[6] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = (void *)[v14 copy];
  v37[0] = @"SleepScheduleSyncAnchor";
  v22 = (void *)MEMORY[0x1AD0DD220](v20);

  v38[0] = v22;
  v37[1] = @"SleepSettingsSyncAnchor";
  v23 = (void *)MEMORY[0x1AD0DD220](v19);

  v38[1] = v23;
  v37[2] = @"SleepRecordSyncAnchor";
  v24 = (void *)MEMORY[0x1AD0DD220](v18);

  v38[2] = v24;
  v37[3] = @"SleepModeSyncAnchor";
  v25 = (void *)MEMORY[0x1AD0DD220](v16);

  v38[3] = v25;
  v37[4] = @"SleepStateSyncAnchor";
  v26 = (void *)MEMORY[0x1AD0DD220](v17);

  v38[4] = v26;
  v37[5] = @"SleepEventSyncAnchor";
  v27 = (void *)MEMORY[0x1AD0DD220](v15);

  v38[5] = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __247__HKSPSyncAnchorContainer_compareWithContainer_sleepScheduleSyncAnchorOutOfDate_sleepSettingsSyncAnchorOutOfDate_sleepEventRecordSyncAnchorOutOfDate_sleepScheduleStateSyncAnchorOutOfDate_sleepModeSyncAnchorOutOfDate_sleepEventSyncAnchorOutOfDate___block_invoke;
  v33[3] = &unk_1E5D33B78;
  v33[4] = self;
  id v34 = v21;
  id v35 = v14;
  id v36 = v28;
  id v29 = v28;
  id v30 = v14;
  id v31 = v21;
  [(HKSPSyncAnchorContainer *)self _withLock:v33];
}

void __247__HKSPSyncAnchorContainer_compareWithContainer_sleepScheduleSyncAnchorOutOfDate_sleepSettingsSyncAnchorOutOfDate_sleepEventRecordSyncAnchorOutOfDate_sleepScheduleStateSyncAnchorOutOfDate_sleepModeSyncAnchorOutOfDate_sleepEventSyncAnchorOutOfDate___block_invoke(id *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(id)objc_opt_class() allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v33 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v20;
    *(void *)&long long v3 = 138544386;
    long long v16 = v3;
    do
    {
      uint64_t v6 = 0;
      uint64_t v17 = v4;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * v6);
        id v8 = objc_msgSend(a1[5], "syncAnchorForKey:", v7, v16);
        id v9 = objc_msgSend(a1[4], "lock_syncAnchorForKey:", v7);
        if (!v8 || [v8 compare:v9] == -1)
        {
          long long v10 = HKSPLogForCategory(0xAuLL);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = [a1[4] succinctDescription];
            id v12 = [a1[6] succinctDescription];
            [(id)objc_opt_class() descriptionForKey:v7];
            v14 = uint64_t v13 = v5;
            *(_DWORD *)buf = v16;
            v24 = v11;
            __int16 v25 = 2114;
            v26 = v12;
            __int16 v27 = 2114;
            v28 = v14;
            __int16 v29 = 2114;
            id v30 = v8;
            __int16 v31 = 2114;
            v32 = v9;
            _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ container %{public}@ has out of date %{public}@ sync anchor (%{public}@ vs %{public}@)", buf, 0x34u);

            uint64_t v5 = v13;
            uint64_t v4 = v17;
          }
          id v15 = [a1[7] objectForKeyedSubscript:v7];
          ((void (**)(void, void *))v15)[2](v15, v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v33 count:16];
    }
    while (v4);
  }
}

- (void)updateSleepScheduleSyncAnchor:(id)a3
{
}

- (void)updateSleepSettingsSyncAnchor:(id)a3
{
}

- (void)updateSleepEventRecordSyncAnchor:(id)a3
{
}

- (void)updateSleepScheduleStateSyncAnchor:(id)a3
{
}

- (void)updateSleepModeSyncAnchor:(id)a3
{
}

- (void)updateSleepEventSyncAnchor:(id)a3
{
}

- (id)incrementSleepScheduleSyncAnchor
{
  return [(HKSPSyncAnchorContainer *)self incrementSyncAnchorForKey:@"SleepScheduleSyncAnchor"];
}

- (id)incrementSleepSettingsSyncAnchor
{
  return [(HKSPSyncAnchorContainer *)self incrementSyncAnchorForKey:@"SleepSettingsSyncAnchor"];
}

- (id)incrementSleepEventRecordSyncAnchor
{
  return [(HKSPSyncAnchorContainer *)self incrementSyncAnchorForKey:@"SleepRecordSyncAnchor"];
}

- (id)incrementSleepScheduleStateSyncAnchor
{
  return [(HKSPSyncAnchorContainer *)self incrementSyncAnchorForKey:@"SleepStateSyncAnchor"];
}

- (id)incrementSleepModeSyncAnchor
{
  return [(HKSPSyncAnchorContainer *)self incrementSyncAnchorForKey:@"SleepModeSyncAnchor"];
}

- (id)incrementSleepEventSyncAnchor
{
  return [(HKSPSyncAnchorContainer *)self incrementSyncAnchorForKey:@"SleepEventSyncAnchor"];
}

- (void)forceSetSleepScheduleSyncAnchor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HKSPSyncAnchorContainer_forceSetSleepScheduleSyncAnchor___block_invoke;
  v6[3] = &unk_1E5D31AA8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(HKSPSyncAnchorContainer *)self _withLock:v6];
}

uint64_t __59__HKSPSyncAnchorContainer_forceSetSleepScheduleSyncAnchor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "lock_setSyncAnchor:forKey:", v2, @"SleepScheduleSyncAnchor");
  }
  else {
    return objc_msgSend(v1, "lock_removeSyncAnchorForKey:", @"SleepScheduleSyncAnchor");
  }
}

- (NSString)description
{
  return (NSString *)[(HKSPSyncAnchorContainer *)self descriptionWithMultilinePrefix:&stru_1EFE54160];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  long long v3 = [(HKSPSyncAnchorContainer *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(HKSPSyncAnchorContainer *)self identifier];
  id v6 = (id)[v4 appendObject:v5 withName:@"id" skipIfNil:1];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__HKSPSyncAnchorContainer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E5D31AA8;
  v11[4] = self;
  id v7 = v4;
  id v12 = v7;
  [(HKSPSyncAnchorContainer *)self _withLock:v11];
  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __65__HKSPSyncAnchorContainer_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        id v9 = objc_msgSend(*(id *)(a1 + 32), "lock_syncAnchorForKey:", v7);
        long long v10 = [(id)objc_opt_class() descriptionForKey:v7];
        id v11 = (id)[v8 appendObject:v9 withName:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (id)succinctDescription
{
  uint64_t v2 = [(HKSPSyncAnchorContainer *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v4 = [(HKSPSyncAnchorContainer *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"id"];

  return v3;
}

@end