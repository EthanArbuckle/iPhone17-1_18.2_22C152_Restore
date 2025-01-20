@interface HDSPSleepStorage
+ (id)standardConfiguration;
- (BOOL)_removeObjectProperties:(id)a3 error:(id *)a4;
- (BOOL)_saveObject:(id)a3 error:(id *)a4;
- (BOOL)_saveObjectChanges:(id)a3 versionKey:(id)a4 currentVersion:(unint64_t)a5 error:(id *)a6;
- (BOOL)needsMigration;
- (BOOL)removeSleepEventRecordWithError:(id *)a3;
- (BOOL)removeSleepScheduleWithError:(id *)a3;
- (BOOL)removeSleepSettingsWithError:(id *)a3;
- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4;
- (BOOL)saveSleepEventRecordChanges:(id)a3 error:(id *)a4;
- (BOOL)saveSleepSchedule:(id)a3 error:(id *)a4;
- (BOOL)saveSleepScheduleChanges:(id)a3 error:(id *)a4;
- (BOOL)saveSleepScheduleModel:(id)a3 error:(id *)a4;
- (BOOL)saveSleepSettings:(id)a3 error:(id *)a4;
- (BOOL)saveSleepSettingsChanges:(id)a3 error:(id *)a4;
- (HDSPEnvironment)environment;
- (HDSPSleepStorage)initWithEnvironment:(id)a3;
- (HDSPSleepStorage)initWithEnvironment:(id)a3 configuration:(id)a4 syncedDefaults:(id)a5;
- (HDSPSyncedDefaults)syncedDefaults;
- (HDSPSyncedDefaultsConfiguration)configuration;
- (HKSPObserverSet)observers;
- (NSString)sourceIdentifier;
- (id)_loadObjectOfClass:(Class)a3 allowedClasses:(id)a4 propertiesToLoad:(id)a5 error:(id *)a6;
- (id)diagnosticDescription;
- (id)loadSleepEventRecord:(id *)a3;
- (id)loadSleepSchedule:(id *)a3;
- (id)loadSleepScheduleModel:(id *)a3;
- (id)loadSleepSettings:(id *)a3;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (unint64_t)cloudStorageDataVersion;
- (unint64_t)dataVersion;
- (unint64_t)localDataVersion;
- (void)addObserver:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)performInitialSyncWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetCloudStorage;
- (void)saveDataVersion;
- (void)syncedUserDefaultsDidChangeExternally:(id)a3;
@end

@implementation HDSPSleepStorage

+ (id)standardConfiguration
{
  v39[3] = *MEMORY[0x263EF8340];
  v2 = [HDSPSyncedDefaultsInfo alloc];
  v38 = [(HDSPSyncedDefaultsInfo *)v2 initWithDataVersionKey:@"DataVersion" currentDataVersion:8 cloudDataVersionKey:@"CloudStorageDataVersion" currentCloudDataVersion:1 cloudSyncEnabledKey:*MEMORY[0x263F75BE8] localDataVersionKey:@"LocalDataVersion" currentLocalDataVersion:1];
  v3 = [HDSPSyncedDefaultsKeySet alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = *MEMORY[0x263F75BC0];
  v7 = HKSPSleepScheduleProperties();
  v8 = HKSPPropertyIdentifiersForProperties();
  v9 = HKSPSleepScheduleProperties();
  v10 = HKSPPropertyIdentifiersForProperties();
  v37 = [(HDSPSyncedDefaultsKeySet *)v3 initWithIdentifier:v5 modficationDateKey:v6 keysToPersist:v8 keysToSync:v10];

  v36 = [HDSPSyncedDefaultsKeySet alloc];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  uint64_t v13 = *MEMORY[0x263F75BD8];
  v14 = HKSPSleepSettingsPropertiesForPersist();
  v15 = HKSPPropertyIdentifiersForProperties();
  v16 = HKSPSleepSettingsPropertiesForSync();
  v17 = HKSPPropertyIdentifiersForProperties();
  v18 = HKSPSleepSettingsPerGizmoProperties();
  v19 = HKSPPropertyIdentifiersForProperties();
  v20 = HKSPSleepSettingsDefaultValues();
  v21 = HKSPDefaultValuesByIdentifier();
  v22 = [(HDSPSyncedDefaultsKeySet *)v36 initWithIdentifier:v12 modficationDateKey:v13 keysToPersist:v15 keysToSync:v17 perGizmoKeys:v19 defaultValues:v21];

  v23 = [HDSPSyncedDefaultsKeySet alloc];
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  uint64_t v26 = *MEMORY[0x263F75A98];
  v27 = HKSPSleepEventRecordProperties();
  v28 = HKSPPropertyIdentifiersForProperties();
  v29 = HKSPSleepEventRecordProperties();
  v30 = HKSPPropertyIdentifiersForProperties();
  v31 = [(HDSPSyncedDefaultsKeySet *)v23 initWithIdentifier:v25 modficationDateKey:v26 keysToPersist:v28 keysToSync:v30];

  v32 = [HDSPSyncedDefaultsConfiguration alloc];
  v39[0] = v37;
  v39[1] = v22;
  v39[2] = v31;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:3];
  v34 = [(HDSPSyncedDefaultsConfiguration *)v32 initWithInfo:v38 keySets:v33];

  return v34;
}

- (HDSPSleepStorage)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() standardConfiguration];
  uint64_t v6 = [[HDSPSyncedDefaults alloc] initWithEnvironment:v4 configuration:v5];
  v7 = [(HDSPSleepStorage *)self initWithEnvironment:v4 configuration:v5 syncedDefaults:v6];

  return v7;
}

- (HDSPSleepStorage)initWithEnvironment:(id)a3 configuration:(id)a4 syncedDefaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDSPSleepStorage;
  v11 = [(HDSPSleepStorage *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    id v13 = objc_alloc(MEMORY[0x263F75E20]);
    v14 = [v8 defaultCallbackScheduler];
    uint64_t v15 = [v13 initWithCallbackScheduler:v14];
    observers = v12->_observers;
    v12->_observers = (HKSPObserverSet *)v15;

    objc_storeStrong((id *)&v12->_syncedDefaults, a5);
    objc_storeStrong((id *)&v12->_configuration, a4);
    v17 = v12;
  }

  return v12;
}

- (unint64_t)dataVersion
{
  v2 = [(HDSPSleepStorage *)self syncedDefaults];
  unint64_t v3 = objc_msgSend(v2, "hksp_integerForKey:", @"DataVersion");

  return v3;
}

- (unint64_t)cloudStorageDataVersion
{
  v2 = [(HDSPSleepStorage *)self syncedDefaults];
  unint64_t v3 = objc_msgSend(v2, "hksp_integerForKey:", @"CloudStorageDataVersion");

  return v3;
}

- (unint64_t)localDataVersion
{
  v2 = [(HDSPSleepStorage *)self syncedDefaults];
  unint64_t v3 = objc_msgSend(v2, "hksp_integerForKey:", @"LocalDataVersion");

  return v3;
}

- (BOOL)needsMigration
{
  if ([(HDSPSleepStorage *)self dataVersion] < 8) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained behavior];
  v5 = [v4 features];
  BOOL v6 = [v5 sleepCloudKitSync]
    && ![(HDSPSleepStorage *)self cloudStorageDataVersion]
    || [(HDSPSleepStorage *)self localDataVersion] == 0;

  return v6;
}

- (void)performInitialSyncWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v6 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing initial sync", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(HDSPSleepStorage *)self syncedDefaults];
  objc_msgSend(v7, "hdsp_forceSynchronizeWithCompletion:", v4);
}

- (void)saveDataVersion
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] saving data version", (uint8_t *)&v6, 0xCu);
  }
  v5 = [(HDSPSleepStorage *)self syncedDefaults];
  [v5 saveDataVersion];
}

- (id)loadSleepSchedule:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = (id)objc_opt_class();
    id v6 = v15;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading schedule", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  id v9 = [MEMORY[0x263F75E80] innerClasses];
  uint64_t v10 = [v8 setByAddingObjectsFromSet:v9];
  v11 = HKSPSleepScheduleProperties();
  v12 = [(HDSPSleepStorage *)self _loadObjectOfClass:v7 allowedClasses:v10 propertiesToLoad:v11 error:a3];

  return v12;
}

- (BOOL)saveSleepSchedule:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v6;
    id v8 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting schedule %{public}@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v9 = [(HDSPSleepStorage *)self _saveObject:v6 error:a4];

  return v9;
}

- (BOOL)saveSleepScheduleChanges:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v6;
    id v8 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting schedule changes %{public}@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v9 = [(HDSPSleepStorage *)self _saveObjectChanges:v6 versionKey:*MEMORY[0x263F75BC8] currentVersion:1 error:a4];

  return v9;
}

- (BOOL)removeSleepScheduleWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing sleep schedule", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = HKSPSleepScheduleProperties();
  BOOL v8 = [(HDSPSleepStorage *)self _removeObjectProperties:v7 error:a3];

  return v8;
}

- (id)loadSleepSettings:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading settings", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v7 = objc_opt_class();
  BOOL v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  BOOL v9 = HKSPSleepSettingsPropertiesForPersist();
  int v10 = [(HDSPSleepStorage *)self _loadObjectOfClass:v7 allowedClasses:v8 propertiesToLoad:v9 error:a3];

  return v10;
}

- (BOOL)saveSleepSettings:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v6;
    id v8 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting settings %{public}@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v9 = [(HDSPSleepStorage *)self _saveObject:v6 error:a4];

  return v9;
}

- (BOOL)saveSleepSettingsChanges:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v6;
    id v8 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting settings changes %{public}@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v9 = [(HDSPSleepStorage *)self _saveObjectChanges:v6 versionKey:*MEMORY[0x263F75BE0] currentVersion:11 error:a4];

  return v9;
}

- (BOOL)removeSleepSettingsWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing sleep settings", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = HKSPSleepSettingsPropertiesForPersist();
  BOOL v8 = [(HDSPSleepStorage *)self _removeObjectProperties:v7 error:a3];

  return v8;
}

- (id)loadSleepEventRecord:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = (id)objc_opt_class();
    id v6 = v16;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading event record", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v7 = objc_opt_class();
  BOOL v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  BOOL v9 = HKSPSleepEventRecordProperties();
  id v10 = [(HDSPSleepStorage *)self _loadObjectOfClass:v7 allowedClasses:v8 propertiesToLoad:v9 error:a3];

  if (!v10)
  {
    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      int v15 = 138543362;
      id v16 = v12;
      id v13 = v12;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating default event record", (uint8_t *)&v15, 0xCu);
    }
    id v10 = objc_alloc_init(MEMORY[0x263F75E58]);
  }

  return v10;
}

- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v6;
    id v8 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting event record %{public}@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v9 = [(HDSPSleepStorage *)self _saveObject:v6 error:a4];

  return v9;
}

- (BOOL)saveSleepEventRecordChanges:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v6;
    id v8 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting event record changes %{public}@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v9 = [(HDSPSleepStorage *)self _saveObjectChanges:v6 versionKey:*MEMORY[0x263F75AA0] currentVersion:1 error:a4];

  return v9;
}

- (BOOL)removeSleepEventRecordWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing sleep event record", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = HKSPSleepEventRecordProperties();
  BOOL v8 = [(HDSPSleepStorage *)self _removeObjectProperties:v7 error:a3];

  return v8;
}

- (id)loadSleepScheduleModel:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = (id)objc_opt_class();
    id v6 = v22;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading model", buf, 0xCu);
  }
  id v20 = 0;
  uint64_t v7 = [(HDSPSleepStorage *)self loadSleepSchedule:&v20];
  id v8 = v20;
  BOOL v9 = v8;
  if (v8)
  {
    int v10 = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    id v19 = 0;
    id v11 = [(HDSPSleepStorage *)self loadSleepSettings:&v19];
    id v12 = v19;
    __int16 v13 = v12;
    if (v12)
    {
      int v10 = 0;
      if (a3) {
        *a3 = v12;
      }
    }
    else
    {
      id v18 = 0;
      id v14 = [(HDSPSleepStorage *)self loadSleepEventRecord:&v18];
      id v15 = v18;
      id v16 = v15;
      if (v15)
      {
        int v10 = 0;
        if (a3) {
          *a3 = v15;
        }
      }
      else
      {
        int v10 = [MEMORY[0x263F75E88] sleepScheduleModelWithSleepSchedule:v7 sleepSettings:v11 sleepEventRecord:v14];
      }
    }
  }

  return v10;
}

- (BOOL)saveSleepScheduleModel:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = (id)objc_opt_class();
    id v8 = v25;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting model", buf, 0xCu);
  }
  BOOL v9 = [v6 sleepSchedule];
  id v23 = 0;
  BOOL v10 = [(HDSPSleepStorage *)self saveSleepSchedule:v9 error:&v23];
  id v11 = v23;

  id v12 = [v6 sleepSettings];
  id v22 = 0;
  BOOL v13 = [(HDSPSleepStorage *)self saveSleepSettings:v12 error:&v22];
  id v14 = v22;

  id v15 = [v6 sleepEventRecord];

  id v21 = 0;
  BOOL v16 = [(HDSPSleepStorage *)self saveSleepEventRecord:v15 error:&v21];
  id v17 = v21;

  if (a4)
  {
    if (v14) {
      id v18 = v14;
    }
    else {
      id v18 = v17;
    }
    if (v11) {
      id v19 = v11;
    }
    else {
      id v19 = v18;
    }
    *a4 = v19;
  }

  return v10 && v13 && v16;
}

- (id)_loadObjectOfClass:(Class)a3 allowedClasses:(id)a4 propertiesToLoad:(id)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = [(HDSPSleepStorage *)self syncedDefaults];
  BOOL v13 = HKSPPropertyIdentifiersForProperties();

  id v14 = objc_msgSend(v12, "hksp_dictionaryRepresentationForKeys:", v13);

  if ([v14 count])
  {
    id v15 = HKSPSerializableKeyForClass();
    v32 = v15;
    v33[0] = v14;
    BOOL v16 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];

    id v17 = (void *)[objc_alloc(MEMORY[0x263F75DD0]) initWithAllowedClasses:v10 serializedDictionary:v16];
    id v25 = 0;
    id v18 = [v17 deserializeObjectOfClass:a3 error:&v25];
    id v19 = v25;
    if (v19)
    {
      id v20 = HKSPLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v23 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v27 = v23;
        __int16 v28 = 2114;
        Class v29 = a3;
        __int16 v30 = 2114;
        id v31 = v19;
        id v24 = v23;
        _os_log_error_impl(&dword_221A52000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] failed deserialization of class %{public}@ with error %{public}@", buf, 0x20u);
      }
      if (a6) {
        *a6 = v19;
      }
    }
  }
  else
  {
    BOOL v16 = HKSPLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = (id)objc_opt_class();
      __int16 v28 = 2114;
      Class v29 = a3;
      id v21 = v27;
      _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] nothing persisted for properties of class %{public}@", buf, 0x16u);
    }
    id v18 = 0;
  }

  return v18;
}

- (BOOL)_saveObject:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F75DD8]);
  id v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "serializedDictionary", 0);
    goto LABEL_5;
  }
  id v32 = 0;
  int v9 = [v7 serialize:v6 error:&v32];
  id v10 = v32;
  id v11 = v10;
  if (v9)
  {
    objc_msgSend(v8, "serializedDictionary", v10);
    id v12 = LABEL_5:;
    BOOL v13 = objc_msgSend(v12, "hksp_serializedProperties");
    id v14 = (void *)[v13 mutableCopy];

    id v15 = [(HDSPSleepStorage *)self syncedDefaults];
    objc_msgSend(v15, "hksp_saveDictionary:", v14);

    BOOL v16 = [v8 serializedDictionary];
    id v17 = objc_msgSend(v16, "hksp_serializedClassName");

    id v18 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration keySetForIdentifier:v17];
    id v19 = [v18 keysToPersist];
    id v20 = (void *)MEMORY[0x263EFFA08];
    id v21 = [v14 allKeys];
    id v22 = [v20 setWithArray:v21];
    id v23 = objc_msgSend(v19, "na_setByRemovingObjectsFromSet:", v22);

    id v24 = [(HDSPSleepStorage *)self syncedDefaults];
    objc_msgSend(v24, "hksp_removeObjectsForKeys:", v23);

    id v25 = [(HDSPSleepStorage *)self syncedDefaults];
    objc_msgSend(v25, "hksp_synchronize");

    BOOL v26 = 1;
    id v11 = v31;
    goto LABEL_11;
  }
  id v27 = HKSPLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    Class v29 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v34 = v29;
    __int16 v35 = 2114;
    id v36 = v11;
    id v30 = v29;
    _os_log_error_impl(&dword_221A52000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] failed serialization with error %{public}@", buf, 0x16u);
  }
  if (a4)
  {
    id v11 = v11;
    BOOL v26 = 0;
    *a4 = v11;
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_11:

  return v26;
}

- (BOOL)_saveObjectChanges:(id)a3 versionKey:(id)a4 currentVersion:(unint64_t)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v14 = [v10 changes];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = __71__HDSPSleepStorage__saveObjectChanges_versionKey_currentVersion_error___block_invoke;
  id v31 = &unk_2645D9128;
  v34 = &v36;
  id v15 = v12;
  id v32 = v15;
  __int16 v35 = &v42;
  id v16 = v13;
  id v33 = v16;
  objc_msgSend(v14, "na_each:", &v28);

  if (*((unsigned char *)v43 + 24))
  {
    id v17 = [(HDSPSleepStorage *)self syncedDefaults];
    id v18 = [NSNumber numberWithUnsignedInteger:a5];
    objc_msgSend(v17, "hksp_setObject:forKey:", v18, v11);

    id v19 = [(HDSPSleepStorage *)self syncedDefaults];
    objc_msgSend(v19, "hksp_saveDictionary:", v15);

    id v20 = [(HDSPSleepStorage *)self syncedDefaults];
    objc_msgSend(v20, "hksp_removeObjectsForKeys:", v16);

    id v21 = [(HDSPSleepStorage *)self syncedDefaults];
    objc_msgSend(v21, "hksp_synchronize");
  }
  else
  {
    id v22 = HKSPLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v25 = objc_opt_class();
      uint64_t v26 = v37[5];
      *(_DWORD *)buf = 138543618;
      v47 = v25;
      __int16 v48 = 2114;
      uint64_t v49 = v26;
      id v27 = v25;
      _os_log_error_impl(&dword_221A52000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] failed serialization with error %{public}@", buf, 0x16u);
    }
    if (a6) {
      *a6 = (id) v37[5];
    }
  }
  BOOL v23 = *((unsigned char *)v43 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v23;
}

void __71__HDSPSleepStorage__saveObjectChanges_versionKey_currentVersion_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 changedValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    if (([v5 isAdd] & 1) != 0 || objc_msgSend(v5, "isUpdate"))
    {
      id v6 = objc_alloc_init(MEMORY[0x263F75DD8]);
      id v7 = [v5 changedValue];
      id v8 = (void *)[v7 copyWithZone:0];
      uint64_t v9 = *(void *)(a1[6] + 8);
      id obj = *(id *)(v9 + 40);
      int v10 = [v6 serialize:v8 error:&obj];
      objc_storeStrong((id *)(v9 + 40), obj);

      if (v10)
      {
        uint64_t v11 = [v6 serializedDictionary];

        id v12 = (void *)a1[4];
        id v13 = [v5 property];
        id v14 = [v13 identifier];
        [v12 setObject:v11 forKeyedSubscript:v14];

        id v4 = (void *)v11;
      }
      else
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
      }
    }
    else
    {
      id v21 = (void *)a1[5];
      id v6 = [v5 property];
      id v22 = [v6 identifier];
      [v21 addObject:v22];
    }
    goto LABEL_12;
  }
  if (v4)
  {
    id v15 = (void *)a1[4];
    id v16 = [v3 property];
    id v17 = [v16 identifier];
    [v15 setObject:v4 forKeyedSubscript:v17];

LABEL_12:
    goto LABEL_13;
  }
  id v18 = (void *)a1[5];
  id v19 = [v3 property];
  id v20 = [v19 identifier];
  [v18 addObject:v20];

LABEL_13:
}

- (BOOL)_removeObjectProperties:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(HDSPSleepStorage *)self syncedDefaults];
  id v7 = HKSPPropertyIdentifiersForProperties();

  objc_msgSend(v6, "hksp_removeObjectsForKeys:", v7);
  id v8 = [(HDSPSleepStorage *)self syncedDefaults];
  objc_msgSend(v8, "hksp_synchronize");

  return 1;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 diagnostics];
  [v7 addProvider:self];

  id v8 = [v4 notificationListener];

  [v8 addObserver:self];
  uint64_t v9 = [(HDSPSleepStorage *)self syncedDefaults];
  objc_msgSend(v9, "hdsp_setExternalChangeDelegate:", self);
}

- (void)resetCloudStorage
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting Cloud storage", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(HDSPSleepStorage *)self syncedDefaults];
  [v5 resetCloudData];
}

- (void)syncedUserDefaultsDidChangeExternally:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncedDefaultsDidChangeExternally", buf, 0xCu);
  }
  observers = self->_observers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HDSPSleepStorage_syncedUserDefaultsDidChangeExternally___block_invoke;
  v7[3] = &unk_2645D9150;
  v7[4] = self;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v7];
}

uint64_t __58__HDSPSleepStorage_syncedUserDefaultsDidChangeExternally___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sleepStorageDidChangeExternally:*(void *)(a1 + 32)];
}

- (NSString)sourceIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.sleepd.cloudkit.reset"])
  {
    int v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v5;
      id v7 = *(id *)&v10[4];
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v10, 0x16u);
    }
    if ([v5 isEqualToString:@"com.apple.sleepd.cloudkit.reset"]) {
      [(HDSPSleepStorage *)self resetCloudStorage];
    }
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", *(_OWORD *)v10, *(void *)&v10[16], v11);

  return v8;
}

- (id)diagnosticDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained behavior];
  id v5 = [v4 features];
  int v6 = [v5 sleepCloudKitSync];

  id v7 = NSString;
  uint64_t v8 = [(HDSPSleepStorage *)self syncedDefaults];
  uint64_t v9 = [v8 localDefaultsDictionaryRepresentation];
  uint64_t v10 = (void *)v9;
  if (v6)
  {
    uint64_t v11 = [(HDSPSleepStorage *)self syncedDefaults];
    uint64_t v12 = [v11 cloudKitDefaultsDictionaryRepresentation];
    id v13 = [v7 stringWithFormat:@"Local Data: %@\nCloudKit Data %@", v10, v12];
  }
  else
  {
    id v13 = [v7 stringWithFormat:@"Data: %@", v9];
  }

  return v13;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSyncedDefaults)syncedDefaults
{
  return self->_syncedDefaults;
}

- (HDSPSyncedDefaultsConfiguration)configuration
{
  return self->_configuration;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncedDefaults, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end