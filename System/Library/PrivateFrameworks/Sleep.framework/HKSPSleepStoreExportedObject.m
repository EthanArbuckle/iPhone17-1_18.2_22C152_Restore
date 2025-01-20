@interface HKSPSleepStoreExportedObject
- (BOOL)_shouldNotifyObserversForClientIdentifier:(id)a3;
- (HKSPSleepStore)sleepStore;
- (id)_mergeExternalSleepEventRecordChange:(id)a3 clientIdentifier:(id)a4;
- (id)_mergeExternalSleepScheduleChange:(id)a3 clientIdentifier:(id)a4;
- (id)_mergeExternalSleepSettingsChange:(id)a3 clientIdentifier:(id)a4;
- (void)clientShouldCheckInWithCompletion:(id)a3;
- (void)getClientIdentifierWithCompletion:(id)a3;
- (void)setSleepStore:(id)a3;
- (void)sleepEventOccurred:(id)a3;
- (void)sleepEventRecordChanged:(id)a3 clientIdentifier:(id)a4;
- (void)sleepModeChanged:(id)a3;
- (void)sleepScheduleChanged:(id)a3 clientIdentifier:(id)a4;
- (void)sleepScheduleStateChanged:(id)a3;
- (void)sleepSettingsChanged:(id)a3 clientIdentifier:(id)a4;
@end

@implementation HKSPSleepStoreExportedObject

- (void)getClientIdentifierWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  v6 = [v5 clientIdentifier];

  v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    id v9 = v8;
    v10 = [v6 loggingIdentifier];
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] responding with client identifier: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v4[2](v4, v6, 0);
}

- (HKSPSleepStore)sleepStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sleepStore);
  return (HKSPSleepStore *)WeakRetained;
}

- (void)setSleepStore:(id)a3
{
}

- (void)clientShouldCheckInWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  v5 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(HKSPSleepStoreExportedObject *)self sleepStore];
    id v9 = [v8 syncAnchorContainer];
    int v12 = 138543618;
    __int16 v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] responding with container: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  v10 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  int v11 = [v10 syncAnchorContainer];
  v4[2](v4, v11, 0);
}

- (BOOL)_shouldNotifyObserversForClientIdentifier:(id)a3
{
  id v4 = a3;
  v6 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  char v5 = [v6 options];

  LOBYTE(v6) = 1;
  if (v4 && (v5 & 0x20) != 0)
  {
    id v7 = [(HKSPSleepStoreExportedObject *)self sleepStore];
    v8 = [v7 clientIdentifier];

    if (v8)
    {
      id v9 = [(HKSPSleepStoreExportedObject *)self sleepStore];
      v10 = [v9 clientIdentifier];
      LODWORD(v6) = [v4 isEqual:v10] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }

  return (char)v6;
}

- (void)sleepScheduleChanged:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  if (!v6)
  {
    id v9 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      v18 = v8;
      _os_log_error_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_ERROR, "%{public}@ received unexpected nil sleepSchedule", (uint8_t *)&v17, 0xCu);
    }
  }
  v10 = HKSPSleepScheduleUnwrap(v6);
  int v11 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepScheduleChanged: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  int v12 = [v8 syncAnchorContainer];
  __int16 v13 = [v6 syncAnchor];
  [v12 updateSleepScheduleSyncAnchor:v13];

  __int16 v14 = [(HKSPSleepStoreExportedObject *)self _mergeExternalSleepScheduleChange:v10 clientIdentifier:v7];

  uint64_t v15 = [v8 sleepStoreCache];
  [v15 updateCachedSleepSchedule:v14];

  BOOL v16 = [(HKSPSleepStoreExportedObject *)self _shouldNotifyObserversForClientIdentifier:v7];
  if (v16) {
    [v8 _notifyObserversForChangedSleepSchedule:v14];
  }
}

- (id)_mergeExternalSleepScheduleChange:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([(HKSPSleepStoreExportedObject *)self sleepStore],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 clientIdentifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v7 isEqual:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    if (v6)
    {
      int v11 = [(HKSPSleepStoreExportedObject *)self sleepStore];
      int v12 = [v11 sleepStoreCache];
      __int16 v13 = [v12 cachedSleepSchedule];

      if (v13)
      {
        __int16 v14 = (void *)[v13 mutableCopy];
        uint64_t v15 = [v6 lastModifiedDate];
        [v14 setLastModifiedDate:v15];

        [v14 freeze];
        id v16 = (id)[v14 copy];
      }
      else
      {
        id v16 = v6;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = v6;
  }

  return v16;
}

- (void)sleepSettingsChanged:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  id v9 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepSettingsChanged: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  char v10 = [v8 syncAnchorContainer];
  int v11 = [v6 syncAnchor];
  [v10 updateSleepSettingsSyncAnchor:v11];

  int v12 = [(HKSPSleepStoreExportedObject *)self _mergeExternalSleepSettingsChange:v6 clientIdentifier:v7];

  __int16 v13 = [v8 sleepStoreCache];
  [v13 updateCachedSleepSettings:v12];

  BOOL v14 = [(HKSPSleepStoreExportedObject *)self _shouldNotifyObserversForClientIdentifier:v7];
  if (v14) {
    [v8 _notifyObserversForChangedSleepSettings:v12];
  }
}

- (id)_mergeExternalSleepSettingsChange:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([(HKSPSleepStoreExportedObject *)self sleepStore],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 clientIdentifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v7 isEqual:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    if (v6)
    {
      int v11 = [(HKSPSleepStoreExportedObject *)self sleepStore];
      int v12 = [v11 sleepStoreCache];
      __int16 v13 = [v12 cachedSleepSettings];

      if (v13)
      {
        BOOL v14 = (void *)[v13 mutableCopy];
        int v15 = [v6 lastModifiedDate];
        [v14 setLastModifiedDate:v15];

        [v14 freeze];
        id v16 = (id)[v14 copy];
      }
      else
      {
        id v16 = v6;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = v6;
  }

  return v16;
}

- (void)sleepEventRecordChanged:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  id v9 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepEventRecordChanged: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  char v10 = [v8 syncAnchorContainer];
  int v11 = [v6 syncAnchor];
  [v10 updateSleepEventRecordSyncAnchor:v11];

  int v12 = [(HKSPSleepStoreExportedObject *)self _mergeExternalSleepEventRecordChange:v6 clientIdentifier:v7];

  __int16 v13 = [v8 sleepStoreCache];
  [v13 updateCachedSleepEventRecord:v12];

  BOOL v14 = [(HKSPSleepStoreExportedObject *)self _shouldNotifyObserversForClientIdentifier:v7];
  if (v14) {
    [v8 _notifyObserversForChangedSleepEventRecord:v12];
  }
}

- (id)_mergeExternalSleepEventRecordChange:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([(HKSPSleepStoreExportedObject *)self sleepStore],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 clientIdentifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v7 isEqual:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    if (v6)
    {
      int v11 = [(HKSPSleepStoreExportedObject *)self sleepStore];
      int v12 = [v11 sleepStoreCache];
      __int16 v13 = [v12 cachedSleepEventRecord];

      if (v13)
      {
        BOOL v14 = (void *)[v13 mutableCopy];
        int v15 = [v6 lastModifiedDate];
        [v14 setLastModifiedDate:v15];

        [v14 freeze];
        id v16 = (id)[v14 copy];
      }
      else
      {
        id v16 = v6;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = v6;
  }

  return v16;
}

- (void)sleepEventOccurred:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  id v6 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    char v10 = v5;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepEventOccurred: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [v5 syncAnchorContainer];
  v8 = [v4 syncAnchor];
  [v7 updateSleepEventSyncAnchor:v8];

  [v5 _notifyObserversForSleepEvent:v4];
}

- (void)sleepScheduleStateChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 scheduleState];
  uint64_t v6 = [v4 changeReason];
  id v7 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  v8 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromHKSPSleepScheduleState(v5);
    char v10 = NSStringFromHKSPSleepScheduleStateChangeReason(v6);
    int v14 = 138543874;
    int v15 = v7;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepScheduleStateChanged: %{public}@ (%{public}@)", (uint8_t *)&v14, 0x20u);
  }
  __int16 v11 = [v7 syncAnchorContainer];
  id v12 = [v4 syncAnchor];
  [v11 updateSleepScheduleStateSyncAnchor:v12];

  uint64_t v13 = [v7 sleepStoreCache];
  [v13 updateCachedSleepScheduleState:v5];

  [v7 _notifyObserversForChangedSleepScheduleState:v5 reason:v6];
}

- (void)sleepModeChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 sleepMode];
  uint64_t v6 = [v4 changeReason];
  id v7 = [(HKSPSleepStoreExportedObject *)self sleepStore];
  v8 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromHKSPSleepMode(v5);
    char v10 = NSStringFromHKSPSleepModeChangeReason(v6);
    int v14 = 138543874;
    int v15 = v7;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepModeChanged: %{public}@ (%{public}@)", (uint8_t *)&v14, 0x20u);
  }
  __int16 v11 = [v7 syncAnchorContainer];
  id v12 = [v4 syncAnchor];
  [v11 updateSleepModeSyncAnchor:v12];

  uint64_t v13 = [v7 sleepStoreCache];
  [v13 updateCachedSleepMode:v5];

  [v7 _notifyObserversForChangedSleepMode:v5 reason:v6];
}

- (void).cxx_destruct
{
}

@end