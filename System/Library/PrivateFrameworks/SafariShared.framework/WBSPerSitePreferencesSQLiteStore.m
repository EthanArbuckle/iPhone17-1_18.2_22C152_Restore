@interface WBSPerSitePreferencesSQLiteStore
+ (BOOL)isPreferenceSyncable:(id)a3;
+ (id)defaultDatabaseURL;
+ (id)sharedStore;
+ (id)staticSyncablePerSiteSettings;
- (BOOL)_isDatabaseOpen;
- (BOOL)_migrateToSchemaVersion:(int)a3;
- (BOOL)_tryToPerformTransactionInBlock:(id)a3;
- (WBSPerSitePreferencesSQLiteStore)init;
- (WBSPerSitePreferencesSQLiteStore)initWithDatabaseURL:(id)a3;
- (WBSSafariBookmarksSyncAgentProxy)syncProxy;
- (id)_defaultValueForPreference:(id)a3;
- (id)_queryListForPreferences:(id)a3;
- (id)_valueOfPreferences:(id)a3 forDomain:(id)a4;
- (id)defaultValueForPreference:(id)a3;
- (id)valueOfPreference:(id)a3 forDomain:(id)a4;
- (int)_createFreshDatabaseSchema;
- (int)_migrateToCurrentSchemaVersionIfNecessary;
- (int)_migrateToSchemaVersion_2;
- (int)_migrateToSchemaVersion_3;
- (int)_migrateToSchemaVersion_4;
- (int)_migrateToSchemaVersion_5;
- (int)_migrateToSchemaVersion_6;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (void)_closeDatabase;
- (void)_createFreshDatabaseSchema;
- (void)_migrateToSchemaVersion_2;
- (void)_migrateToSchemaVersion_3;
- (void)_migrateToSchemaVersion_4;
- (void)_openDatabase;
- (void)_openDatabaseIfNecessary;
- (void)_setDeletedCloudKitSyncData:(id)a3 forRecordName:(id)a4 completionHandler:(id)a5;
- (void)_setSyncData:(id)a3 forPreference:(id)a4 completionHandler:(id)a5;
- (void)_setSyncData:(id)a3 forPreference:(id)a4 domain:(id)a5 recordName:(id)a6 completionHandler:(id)a7;
- (void)closeDatabase;
- (void)dealloc;
- (void)getAllDomainsConfiguredForPreference:(id)a3 completionHandler:(id)a4;
- (void)getAllPreferenceInformationForPreference:(id)a3 completionHandler:(id)a4;
- (void)getDefaultValueForPreference:(id)a3 completionHandler:(id)a4;
- (void)getDeletedCloudKitSyncDataForRecordName:(id)a3 completionHandler:(id)a4;
- (void)getSyncDataForPreference:(id)a3 completionHandler:(id)a4;
- (void)getSyncDataForPreference:(id)a3 domain:(id)a4 completionHandler:(id)a5;
- (void)getTimestampAndValueOfPreference:(id)a3 forDomain:(id)a4 completionHandler:(id)a5;
- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6;
- (void)getValuesOfPreference:(id)a3 forDomains:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6;
- (void)getValuesOfPreferences:(id)a3 forDomain:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6;
- (void)removeAllCloudKitRecordsWithCompletionHandler:(id)a3;
- (void)removeAllPreferenceValues:(id)a3;
- (void)removeAllPreferenceValuesFromPreference:(id)a3 completionHandler:(id)a4;
- (void)removeAllPreferenceValuesFromPreferences:(id)a3 completionHandler:(id)a4;
- (void)removeAllSyncData;
- (void)removePreferenceValueWithRecordName:(id)a3 completionHandler:(id)a4;
- (void)removePreferenceValuesForDomainPrefixes:(id)a3 fromPreferences:(id)a4 completionHandler:(id)a5;
- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5;
- (void)removeTombstoneWithRecordName:(id)a3 completionHandler:(id)a4;
- (void)savePerSiteSettingCloudKitRecordToDisk:(id)a3 completionHandler:(id)a4;
- (void)setDefaultValue:(id)a3 forPreference:(id)a4 completionHandler:(id)a5;
- (void)setSyncProxy:(id)a3;
- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6;
- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 includeTimestamp:(BOOL)a6 completionHandler:(id)a7;
- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 withTimestamp:(id)a6 completionHandler:(id)a7;
@end

@implementation WBSPerSitePreferencesSQLiteStore

- (void)_openDatabaseIfNecessary
{
  if (![(WBSPerSitePreferencesSQLiteStore *)self _isDatabaseOpen])
  {
    [(WBSPerSitePreferencesSQLiteStore *)self _openDatabase];
  }
}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

- (void)_openDatabase
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_5_0(&dword_1A6B5F000, v6, v4, "Failed to open Per Site Preferences store at %{private}@: %{public}@", v5);
}

- (int)_migrateToCurrentSchemaVersionIfNecessary
{
  v3 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  uint64_t v4 = [v3 nextObject];
  int v5 = [v4 intAtIndex:0];

  v6 = [v3 statement];
  [v6 invalidate];

  if (v5 <= 5)
  {
    if (v5)
    {
      --v5;
      while (v5 != 5)
      {
        BOOL v7 = [(WBSPerSitePreferencesSQLiteStore *)self _migrateToSchemaVersion:(v5 + 2)];
        ++v5;
        if (!v7) {
          goto LABEL_11;
        }
      }
      int v5 = 6;
    }
    else if ([(WBSPerSitePreferencesSQLiteStore *)self _createFreshDatabaseSchema] == 101)
    {
      int v5 = 6;
      [(WBSPerSitePreferencesSQLiteStore *)self _setDatabaseSchemaVersion:6];
    }
    else
    {
      int v5 = 0;
    }
  }
LABEL_11:

  return v5;
}

void __83__WBSPerSitePreferencesSQLiteStore_getDefaultValueForPreference_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _defaultValueForPreference:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v4 = [v2 second];
  int v5 = [v6 first];
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, [v5 BOOLValue]);
}

- (id)_defaultValueForPreference:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  [(WBSPerSitePreferencesSQLiteStore *)self _openDatabaseIfNecessary];
  if ([(WBSPerSitePreferencesSQLiteStore *)self _isDatabaseOpen])
  {
    uint64_t v4 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, @"SELECT default_value FROM default_preferences WHERE preference = ?", &v18);
    int v5 = [v4 nextObject];
    id v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 objectAtIndex:0];
    }
    else
    {
      BOOL v7 = 0;
    }

    v10 = [v4 statement];
    [v10 invalidate];

    int v11 = [v4 lastResultCode];
    if ((v11 & 0xFFFFFFFE) != 0x64)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v16 = v18;
        v17 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        *(_DWORD *)buf = 138412802;
        id v20 = v16;
        __int16 v21 = 2114;
        v22 = v17;
        __int16 v23 = 1024;
        int v24 = v11;
        _os_log_error_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch default value for preference: %@: %{public}@ (%d)", buf, 0x1Cu);
      }
    }
    id v13 = objc_alloc(MEMORY[0x1E4F97EE0]);
    v14 = [NSNumber numberWithBool:(v11 & 0xFFFFFFFE) == 100];
    v9 = (void *)[v13 initWithFirst:v14 second:v7];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F97EE0]);
    v9 = (void *)[v8 initWithFirst:MEMORY[0x1E4F1CC28] second:0];
  }

  return v9;
}

void __95__WBSPerSitePreferencesSQLiteStore_getAllPreferenceInformationForPreference_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    uint64_t v17 = a1;
    id v16 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(*(void *)(a1 + 32) + 24), @"SELECT domain, preference_value, strftime('%s', timestamp) FROM preference_values WHERE preference = ?", (void *)(a1 + 40));
    id v19 = [MEMORY[0x1E4F1CA80] set];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v16;
    v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v22;
      do
      {
        uint64_t v7 = 0;
        id v8 = v2;
        v9 = v3;
        v10 = v4;
        do
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(obj);
          }
          int v11 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
          v2 = [v11 stringAtIndex:0];

          uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "intAtIndex:", 1));

          uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v11, "intAtIndex:", 2));

          v12 = [[WBSPerSitePreferenceValueInformation alloc] initWithDomain:v2 value:v3 creationDate:v4];
          [v19 addObject:v12];

          ++v7;
          id v8 = v2;
          v9 = v3;
          v10 = v4;
        }
        while (v5 != v7);
        uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v5);
    }

    id v13 = [obj statement];
    [v13 invalidate];

    if ([obj lastResultCode] != 101)
    {
      v14 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(*(void *)(v17 + 32) + 24) lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        __95__WBSPerSitePreferencesSQLiteStore_getAllPreferenceInformationForPreference_completionHandler___block_invoke_cold_1();
      }
    }
    (*(void (**)(void))(*(void *)(v17 + 48) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    id v20 = [MEMORY[0x1E4F1CAD0] set];
    (*(void (**)(uint64_t))(v15 + 16))(v15);
  }
}

void __47__WBSPerSitePreferencesSQLiteStore_sharedStore__block_invoke(uint64_t a1)
{
  v2 = [WBSPerSitePreferencesSQLiteStore alloc];
  id v5 = [*(id *)(a1 + 32) defaultDatabaseURL];
  uint64_t v3 = -[WBSPerSitePreferencesSQLiteStore initWithDatabaseURL:](v2, "initWithDatabaseURL:");
  uint64_t v4 = (void *)+[WBSPerSitePreferencesSQLiteStore sharedStore]::sharedStore;
  +[WBSPerSitePreferencesSQLiteStore sharedStore]::sharedStore = v3;

  id v6 = [MEMORY[0x1E4F97FB8] sharedProxy];
  objc_msgSend((id)+[WBSPerSitePreferencesSQLiteStore sharedStore]::sharedStore, "setSyncProxy:");
}

- (void)setSyncProxy:(id)a3
{
}

- (WBSPerSitePreferencesSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSPerSitePreferencesSQLiteStore;
  id v5 = [(WBSPerSitePreferencesSQLiteStore *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = (NSURL *)v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.SafariShared.WBSPerSitePreferencesSQLiteStore", v8);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    int v11 = v5;
  }

  return v5;
}

+ (id)defaultDatabaseURL
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = objc_msgSend(v2, "safari_mobileSafariGroupContainerDirectoryURL");
  id v4 = [v3 URLByAppendingPathComponent:@"Library/Safari/PerSitePreferences.db" isDirectory:0];

  return v4;
}

- (void)getDefaultValueForPreference:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSPerSitePreferencesSQLiteStore_getDefaultValueForPreference_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

+ (id)sharedStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WBSPerSitePreferencesSQLiteStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSPerSitePreferencesSQLiteStore sharedStore]::onceToken != -1) {
    dispatch_once(&+[WBSPerSitePreferencesSQLiteStore sharedStore]::onceToken, block);
  }
  v2 = (void *)+[WBSPerSitePreferencesSQLiteStore sharedStore]::sharedStore;
  return v2;
}

- (void)getAllPreferenceInformationForPreference:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSPerSitePreferencesSQLiteStore_getAllPreferenceInformationForPreference_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

+ (id)staticSyncablePerSiteSettings
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"PerSitePreferencesContentBlockers";
  v6[1] = @"PerSitePreferencesUseReader";
  v6[2] = @"PerSitePreferencesRequestDesktopSite";
  v6[3] = @"PerSitePreferencesPageZoom";
  v6[4] = @"PerSitePreferencesProfile";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (BOOL)isPreferenceSyncable:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() staticSyncablePerSiteSettings];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (WBSPerSitePreferencesSQLiteStore)init
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WBSPerSitePreferencesSQLiteStore;
  [(WBSPerSitePreferencesSQLiteStore *)&v2 dealloc];
}

- (void)closeDatabase
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WBSPerSitePreferencesSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __49__WBSPerSitePreferencesSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabase];
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 includeTimestamp:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
  }
  else
  {
    uint64_t v15 = 0;
  }
  [(WBSPerSitePreferencesSQLiteStore *)self setValue:v16 ofPreference:v12 forDomain:v13 withTimestamp:v15 completionHandler:v14];
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 withTimestamp:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  databaseQueue = self->_databaseQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __100__WBSPerSitePreferencesSQLiteStore_setValue_ofPreference_forDomain_withTimestamp_completionHandler___block_invoke;
  v23[3] = &unk_1E5C9EAB0;
  v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v14;
  id v27 = v13;
  id v28 = v16;
  id v18 = v13;
  id v19 = v14;
  id v20 = v12;
  id v21 = v15;
  id v22 = v16;
  dispatch_async(databaseQueue, v23);
}

void __100__WBSPerSitePreferencesSQLiteStore_setValue_ofPreference_forDomain_withTimestamp_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [v2 setLocale:v3];

    id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v2 setTimeZone:v4];

    if (*(void *)(a1 + 40))
    {
      char v5 = objc_msgSend(v2, "stringFromDate:");
    }
    else
    {
      char v5 = 0;
    }
    id v26 = v5;
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:*(void *)(*(void *)(a1 + 32) + 24), @"INSERT INTO preference_values (domain, preference, preference_value, timestamp)VALUES (?, ?, ?, ?)ON CONFLICT (domain, preference)DO UPDATE SET domain = excluded.domain, preference = excluded.preference, preference_value = excluded.preference_value, timestamp = excluded.timestamp" query];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)buf = [*(id *)(a1 + 48) integerValue];
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSString * const {__strong},long,NSString * {__strong}&>(v8, (void *)(a1 + 56), (void *)(a1 + 64), buf, &v26);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = *(id *)(a1 + 48);
        SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSString * const {__strong},NSString * {__strong},NSString * const {__strong}&&>(v8, (void *)(a1 + 56), (void *)(a1 + 64), &v25, &v26);
      }
    }
    int v9 = [v8 execute];
    [v8 invalidate];
    if (v9 != 101)
    {
      id v10 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 56);
        uint64_t v21 = *(void *)(a1 + 64);
        uint64_t v22 = *(void *)(a1 + 48);
        id v23 = v26;
        id v24 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorMessage];
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v22;
        __int16 v30 = 2112;
        uint64_t v31 = v21;
        __int16 v32 = 2112;
        uint64_t v33 = v20;
        __int16 v34 = 2112;
        id v35 = v23;
        __int16 v36 = 2114;
        v37 = v24;
        __int16 v38 = 1024;
        int v39 = v9;
        _os_log_error_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_ERROR, "Failed to insert or replace preference value: %@ for preference: %@ for domain: %@ with date: %@: %{public}@ (%d)", buf, 0x3Au);
      }
    }
    uint64_t v11 = *(void *)(a1 + 72);
    if (v11)
    {
      (*(void (**)(uint64_t, BOOL))(v11 + 16))(v11, v9 == 101);
      if (v9 == 101
        && *(void *)(a1 + 64)
        && *(void *)(a1 + 48)
        && *(void *)(a1 + 56)
        && [(id)objc_opt_class() isPreferenceSyncable:*(void *)(a1 + 64)]
        && [MEMORY[0x1E4F97EA0] isPerSiteSettingSyncEnabled])
      {
        id v12 = *(void **)(*(void *)(a1 + 32) + 8);
        id v13 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
        LOBYTE(v12) = [v12 isEqual:v13];

        if ((v12 & 1) == 0)
        {
          v27[0] = @"PerSiteSettingName";
          v27[1] = @"Domain";
          uint64_t v14 = *(void *)(a1 + 56);
          uint64_t v15 = *(void *)(a1 + 48);
          v28[0] = *(void *)(a1 + 64);
          v28[1] = v14;
          v27[2] = @"Value";
          v28[2] = v15;
          id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
          uint64_t v17 = (void *)[v16 mutableCopy];

          id v18 = *(void **)(*(void *)(a1 + 32) + 32);
          id v19 = (void *)[v17 copy];
          [v18 saveCloudPerSiteSettingWithDictionaryRepresentation:v19 successCompletionHandler:&__block_literal_global_91];
        }
      }
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 72);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

void __100__WBSPerSitePreferencesSQLiteStore_setValue_ofPreference_forDomain_withTimestamp_completionHandler___block_invoke_22()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_INFO, "Safari's per-site settings have been updated in CloudKit", v1, 2u);
  }
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19[0] = v10;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__WBSPerSitePreferencesSQLiteStore_getValueOfPreference_forDomain_withTimeoutInterval_completionHandler___block_invoke;
  v16[3] = &unk_1E5C9EAD8;
  id v14 = v12;
  id v18 = v14;
  id v15 = v10;
  id v17 = v15;
  [(WBSPerSitePreferencesSQLiteStore *)self getValuesOfPreferences:v13 forDomain:v11 withTimeoutInterval:v16 completionHandler:a5];
}

void __105__WBSPerSitePreferencesSQLiteStore_getValueOfPreference_forDomain_withTimeoutInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (id)_valueOfPreferences:(id)a3 forDomain:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v25 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[WBSPerSitePreferencesSQLiteStore _valueOfPreferences:forDomain:]();
    }
    goto LABEL_16;
  }
  [(WBSPerSitePreferencesSQLiteStore *)self _openDatabaseIfNecessary];
  if (![(WBSPerSitePreferencesSQLiteStore *)self _isDatabaseOpen])
  {
LABEL_16:
    id v26 = (void *)[objc_alloc(MEMORY[0x1E4F97EE0]) initWithFirst:&unk_1EFC228A0 second:0];
    goto LABEL_19;
  }
  __int16 v30 = [MEMORY[0x1E4F28E78] string];
  v36[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  v29 = [v8 arrayByAddingObjectsFromArray:v6];

  int v9 = NSString;
  id v10 = objc_msgSend(@"?", "safari_stringByRepeatingWithCount:joinedByString:", objc_msgSend(v6, "count"), @", ");
  id v11 = [v9 stringWithFormat:@"preference IN (%@)", v10];
  [v30 appendString:v11];

  id v12 = [NSString stringWithFormat:@"SELECT preference_value, preference FROM preference_values WHERE domain = ? AND (%@)", v30];
  id v28 = [(WBSSQLiteDatabase *)self->_database fetchQuery:v12 stringArguments:v29];
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v28;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v19 = [v18 stringAtIndex:1];
        if (v19)
        {
          uint64_t v20 = [v18 objectAtIndex:0];
          [v13 setObject:v20 forKeyedSubscript:v19];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v15);
  }

  uint64_t v21 = [v14 statement];
  [v21 invalidate];

  if ([v14 lastResultCode] == 101)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F97EE0]);
    id v23 = &unk_1EFC228B8;
    id v24 = v13;
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x1E4F97EE0]);
    id v24 = 0;
    id v23 = &unk_1EFC228A0;
  }
  id v26 = (void *)[v22 initWithFirst:v23 second:v24];

LABEL_19:
  return v26;
}

- (id)valueOfPreference:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__31;
  uint64_t v21 = __Block_byref_object_dispose__31;
  id v22 = 0;
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__WBSPerSitePreferencesSQLiteStore_valueOfPreference_forDomain___block_invoke;
  v13[3] = &unk_1E5C9EB00;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(databaseQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __64__WBSPerSitePreferencesSQLiteStore_valueOfPreference_forDomain___block_invoke(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  v9[0] = a1[5];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v4 = [v2 _valueOfPreferences:v3 forDomain:a1[6]];
  char v5 = [v4 second];

  uint64_t v6 = [v5 objectForKeyedSubscript:a1[5]];
  uint64_t v7 = *(void *)(a1[7] + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)getValuesOfPreferences:(id)a3 forDomain:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v39 = 0;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x2020000000;
  LOBYTE(v42) = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke;
  v45[3] = &unk_1E5C9EB28;
  v45[4] = self;
  v47 = &v39;
  id v13 = v12;
  id v46 = v13;
  id v14 = (void *)MEMORY[0x1AD0C4F80](v45);

  _Block_object_dispose(&v39, 8);
  uint64_t v39 = 0;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x3042000000;
  v42 = __Block_byref_object_copy__42_0;
  v43 = __Block_byref_object_dispose__43_0;
  id v44 = 0;
  uint64_t v33 = 0;
  long long v34 = (id *)&v33;
  uint64_t v35 = 0x3042000000;
  __int16 v36 = __Block_byref_object_copy__42_0;
  v37 = __Block_byref_object_dispose__43_0;
  id v38 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke_44;
  block[3] = &unk_1E5C9EB50;
  long long v31 = &v39;
  long long v32 = &v33;
  block[4] = self;
  id v15 = v10;
  id v28 = v15;
  id v16 = v11;
  id v29 = v16;
  id v17 = v14;
  id v30 = v17;
  dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  objc_storeWeak(v34 + 5, v18);
  if (a5 != 1.79769313e308)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke_2;
    v24[3] = &unk_1E5C9EB78;
    id v26 = &v33;
    id v25 = v17;
    dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v24);
    objc_storeWeak(v40 + 5, v19);
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    dispatch_get_global_queue(21, 0);
    uint64_t v21 = self;
    id v23 = v22 = v15;
    dispatch_after(v20, v23, v19);

    id v15 = v22;
    self = v21;
  }
  dispatch_async((dispatch_queue_t)self->_databaseQueue, v18);

  _Block_object_dispose(&v33, 8);
  objc_destroyWeak(&v38);

  _Block_object_dispose(&v39, 8);
  objc_destroyWeak(&v44);
}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    objc_sync_exit(v3);
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    objc_sync_exit(v3);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke_44(uint64_t a1)
{
  id block = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  id v3 = WeakRetained;
  if (WeakRetained && !dispatch_block_testcancel(WeakRetained))
  {
    uint64_t v4 = [*(id *)(a1 + 32) _valueOfPreferences:*(void *)(a1 + 40) forDomain:*(void *)(a1 + 48)];
    if (!dispatch_block_testcancel(v3))
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 56);
        uint64_t v6 = [v4 second];
        uint64_t v7 = [v4 first];
        (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, [v7 integerValue]);
      }
      if (block) {
        dispatch_block_cancel(block);
      }
    }
  }
}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  id block = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (block) {
    dispatch_block_cancel(block);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getValuesOfPreference:(id)a3 forDomains:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v39 = 0;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x2020000000;
  LOBYTE(v42) = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke;
  v45[3] = &unk_1E5C9EB28;
  v45[4] = self;
  v47 = &v39;
  id v13 = v12;
  id v46 = v13;
  id v14 = (void *)MEMORY[0x1AD0C4F80](v45);

  _Block_object_dispose(&v39, 8);
  uint64_t v39 = 0;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x3042000000;
  v42 = __Block_byref_object_copy__42_0;
  v43 = __Block_byref_object_dispose__43_0;
  id v44 = 0;
  uint64_t v33 = 0;
  long long v34 = (id *)&v33;
  uint64_t v35 = 0x3042000000;
  __int16 v36 = __Block_byref_object_copy__42_0;
  v37 = __Block_byref_object_dispose__43_0;
  id v38 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C9EBA0;
  long long v31 = &v39;
  long long v32 = &v33;
  block[4] = self;
  id v15 = v14;
  id v30 = v15;
  id v16 = v10;
  id v28 = v16;
  id v17 = v11;
  id v29 = v17;
  dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  objc_storeWeak(v34 + 5, v18);
  if (a5 != 1.79769313e308)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_4;
    v24[3] = &unk_1E5C9EB78;
    id v26 = &v33;
    id v25 = v15;
    dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v24);
    objc_storeWeak(v40 + 5, v19);
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    dispatch_get_global_queue(21, 0);
    uint64_t v21 = self;
    id v23 = v22 = v16;
    dispatch_after(v20, v23, v19);

    id v16 = v22;
    self = v21;
  }
  dispatch_async((dispatch_queue_t)self->_databaseQueue, v18);

  _Block_object_dispose(&v33, 8);
  objc_destroyWeak(&v38);

  _Block_object_dispose(&v39, 8);
  objc_destroyWeak(&v44);
}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    objc_sync_exit(v3);
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    objc_sync_exit(v3);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if (v3 && !dispatch_block_testcancel(v3))
  {
    if ([*(id *)(a1 + 32) _isDatabaseOpen])
    {
      id v15 = [MEMORY[0x1E4F28E78] string];
      id v16 = [MEMORY[0x1E4F1CA48] array];
      [v16 addObject:*(void *)(a1 + 40)];
      uint64_t v4 = [*(id *)(a1 + 48) allObjects];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_3;
      v24[3] = &unk_1E5C9B0F8;
      id v18 = v15;
      id v25 = v18;
      id v17 = v16;
      id v26 = v17;
      [v4 enumerateObjectsUsingBlock:v24];

      id v14 = [NSString stringWithFormat:@"SELECT preference_value, domain FROM preference_values WHERE preference = ? AND (%@)", v18];
      dispatch_block_t v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "fetchQuery:stringArguments:");
      if (dispatch_block_testcancel(v3))
      {
        id v5 = [v19 statement];
        [v5 invalidate];
      }
      else
      {
        id v5 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v6 = v19;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v21 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              id v11 = [v10 objectAtIndex:0];
              id v12 = [v10 stringAtIndex:1];
              [v5 setObject:v11 forKeyedSubscript:v12];
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v27 count:16];
          }
          while (v7);
        }

        id v13 = [v6 statement];
        [v13 invalidate];

        if (!dispatch_block_testcancel(v3))
        {
          [v6 lastResultCode];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          if (WeakRetained) {
            dispatch_block_cancel(WeakRetained);
          }
        }
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3) {
    id v5 = @" OR domain = ?";
  }
  else {
    id v5 = @"domain = ?";
  }
  [*(id *)(a1 + 32) appendString:v5];
  [*(id *)(a1 + 40) addObject:v6];
}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_4(uint64_t a1)
{
  id block = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (block) {
    dispatch_block_cancel(block);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllDomainsConfiguredForPreference:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__WBSPerSitePreferencesSQLiteStore_getAllDomainsConfiguredForPreference_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

void __91__WBSPerSitePreferencesSQLiteStore_getAllDomainsConfiguredForPreference_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    uint64_t v2 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(*(void *)(a1 + 32) + 24), @"SELECT domain FROM preference_values WHERE preference = ?", (void *)(a1 + 40));
    id v3 = [MEMORY[0x1E4F1CA80] set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = [*(id *)(*((void *)&v16 + 1) + 8 * i) stringAtIndex:0];
          [v3 addObject:v8];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }
      while (v5);
    }

    id v9 = [v4 statement];
    [v9 invalidate];

    int v10 = [v4 lastResultCode];
    if (v10 != 101)
    {
      id v11 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        id v14 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorMessage];
        *(_DWORD *)buf = 138412802;
        uint64_t v21 = v13;
        __int16 v22 = 2114;
        long long v23 = v14;
        __int16 v24 = 1024;
        int v25 = v10;
        _os_log_error_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_ERROR, "Failed to get all domains configured for preference: %@: %{public}@ (%d)", buf, 0x1Cu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v15 = [MEMORY[0x1E4F1CAD0] set];
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if ([v7 count]) {
    operator new();
  }
  if (v9) {
    v9[2](v9, 1);
  }
}

void __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5C9AEF0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = *(id *)(a1 + 48);
  uint64_t v5 = [v2 _tryToPerformTransactionInBlock:v8];
  uint64_t v6 = *(id **)(a1 + 64);
  if (v6)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v6);
    MEMORY[0x1AD0C4750]();
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v5);
  }
}

uint64_t __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v40 count:16];
  if (v2)
  {
    uint64_t v4 = *(void *)v26;
    uint64_t v5 = (void *)(a1 + 48);
    *(void *)&long long v3 = 141558787;
    long long v23 = v3;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v7 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&,NSString * const {__strong}>(*(void **)(*(void *)(a1 + 40) + 24), @"SELECT sync_data FROM preference_values WHERE preference = ? AND domain = ?", (void *)(a1 + 48), &v29);
        id v8 = [v7 nextObject];
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = [v8 dataAtIndex:0];
        }
        else
        {
          uint64_t v10 = 0;
        }

        id v11 = [v7 statement];
        [v11 invalidate];

        if (([v7 lastResultCode] & 0xFFFFFFFE) != 0x64)
        {
          uint64_t v12 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            long long v17 = (void *)*v5;
            *(_DWORD *)buf = v23;
            uint64_t v33 = 1752392040;
            __int16 v34 = 2117;
            uint64_t v35 = v17;
            __int16 v36 = 2160;
            uint64_t v37 = 1752392040;
            __int16 v38 = 2117;
            uint64_t v39 = v29;
            _os_log_error_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch sync data before deletion for preference: %{sensitive, mask.hash}@ and domain: %{sensitive, mask.hash}@", buf, 0x2Au);
          }
        }
        int v13 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,NSString * const {__strong}>(*(void **)(*(void *)(a1 + 40) + 24), 0, @"DELETE from preference_values WHERE preference = ? AND domain = ?", (void *)(a1 + 48), &v29);
        if (v13 != 101)
        {
          long long v19 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = v29;
            __int16 v22 = [*(id *)(*(void *)(a1 + 40) + 24) lastErrorMessage];
            *(_DWORD *)buf = 138412802;
            uint64_t v33 = v21;
            __int16 v34 = 2114;
            uint64_t v35 = v22;
            __int16 v36 = 1024;
            LODWORD(v37) = v13;
            _os_log_error_impl(&dword_1A6B5F000, v19, OS_LOG_TYPE_ERROR, "Failed to delete domain: %@ from preference_values: %{public}@ (%d)", buf, 0x1Cu);
          }
          uint64_t v18 = 0;
          goto LABEL_24;
        }
        if ([(id)objc_opt_class() isPreferenceSyncable:*v5]
          && [MEMORY[0x1E4F97EA0] isPerSiteSettingSyncEnabled])
        {
          v30[0] = @"UseDefaultValue";
          v30[1] = @"PerSiteSettingName";
          id v14 = (void *)*v5;
          v31[0] = MEMORY[0x1E4F1CC38];
          v31[1] = v14;
          v30[2] = @"Domain";
          v31[2] = v29;
          id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
          long long v16 = (void *)[v15 mutableCopy];

          if (v10) {
            [v16 setObject:v10 forKeyedSubscript:@"SyncData"];
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "saveCloudPerSiteSettingWithDictionaryRepresentation:successCompletionHandler:", v16, &__block_literal_global_68_0, v23);
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v40 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 1;
LABEL_24:

  return v18;
}

void __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_66()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_INFO, "Safari's per-site settings have been updated in CloudKit", v1, 2u);
  }
}

- (void)removePreferenceValuesForDomainPrefixes:(id)a3 fromPreferences:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if ([v7 count] && objc_msgSend(v8, "count")) {
    operator new();
  }
  if (v9) {
    v9[2](v9, 1);
  }
}

void __110__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomainPrefixes_fromPreferences_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomainPrefixes_fromPreferences_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5C9AEF0;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 _tryToPerformTransactionInBlock:v6];
  uint64_t v4 = *(id **)(a1 + 64);
  if (v4)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v4);
    MEMORY[0x1AD0C4750]();
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v3);
  }
}

uint64_t __110__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomainPrefixes_fromPreferences_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v14 = [*(id *)(a1 + 32) _queryListForPreferences:*(void *)(a1 + 40)];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v17;
    while (2)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v17 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v16 + 1) + 8 * v4);
        uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24);
        id v7 = [NSString stringWithFormat:@"DELETE from preference_values WHERE preference in (%@) AND domain LIKE ?", v14];
        id v15 = [NSString stringWithFormat:@"%@%%", v5];
        int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}>(v6, 0, v7, &v15);

        if (v8 != 101)
        {
          uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorMessage];
            *(_DWORD *)buf = 138412802;
            uint64_t v21 = v5;
            __int16 v22 = 2114;
            long long v23 = v12;
            __int16 v24 = 1024;
            int v25 = v8;
            _os_log_error_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_ERROR, "Failed to delete domain prefix: %@ from preference_values: %{public}@ (%d)", buf, 0x1Cu);
          }
          uint64_t v9 = 0;
          goto LABEL_13;
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_13:

  return v9;
}

- (id)defaultValueForPreference:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__31;
  long long v16 = __Block_byref_object_dispose__31;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSPerSitePreferencesSQLiteStore_defaultValueForPreference___block_invoke;
  block[3] = &unk_1E5C9A498;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__WBSPerSitePreferencesSQLiteStore_defaultValueForPreference___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _defaultValueForPreference:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 second];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setDefaultValue:(id)a3 forPreference:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__WBSPerSitePreferencesSQLiteStore_setDefaultValue_forPreference_completionHandler___block_invoke;
  v15[3] = &unk_1E5C8CA48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(databaseQueue, v15);
}

void __84__WBSPerSitePreferencesSQLiteStore_setDefaultValue_forPreference_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
      *(void *)buf = [*(id *)(a1 + 40) integerValue];
      int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,long>(v2, 0, @"INSERT INTO default_preferences (preference, default_value) VALUES (?, ?) ON CONFLICT (preference) DO UPDATE SET preference = excluded.preference, default_value = excluded.default_value", (void *)(a1 + 48), buf);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v3 = 1;
        goto LABEL_13;
      }
      id v6 = *(void **)(*(void *)(a1 + 32) + 24);
      id v15 = *(id *)(a1 + 40);
      int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,NSString * {__strong}>(v6, 0, @"INSERT INTO default_preferences (preference, default_value) VALUES (?, ?) ON CONFLICT (preference) DO UPDATE SET preference = excluded.preference, default_value = excluded.default_value", (void *)(a1 + 48), &v15);
    }
    if (v3 == 101)
    {
      uint64_t v7 = 1;
LABEL_16:
      uint64_t v9 = *(void *)(a1 + 56);
      if (v9) {
        (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v7);
      }
      if (v7
        && *(void *)(a1 + 48)
        && *(void *)(a1 + 40)
        && [(id)objc_opt_class() isPreferenceSyncable:*(void *)(a1 + 48)])
      {
        if ([MEMORY[0x1E4F97EA0] isPerSiteSettingSyncEnabled])
        {
          v16[0] = @"PerSiteSettingName";
          v16[1] = @"Value";
          uint64_t v10 = *(void *)(a1 + 40);
          v17[0] = *(void *)(a1 + 48);
          v17[1] = v10;
          id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
          [*(id *)(*(void *)(a1 + 32) + 32) saveCloudPerSiteSettingWithDictionaryRepresentation:v11 successCompletionHandler:&__block_literal_global_84];
        }
      }
      return;
    }
LABEL_13:
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      id v14 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorMessage];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      __int16 v22 = v14;
      __int16 v23 = 1024;
      int v24 = v3;
      _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to set default value: %@ for preference: %@: %{public}@ (%d)", buf, 0x26u);
    }
    uint64_t v7 = 0;
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    id v5 = *(void (**)(void))(v4 + 16);
    v5();
  }
}

void __84__WBSPerSitePreferencesSQLiteStore_setDefaultValue_forPreference_completionHandler___block_invoke_82()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_INFO, "Safari's per-site settings have been updated in CloudKit", v1, 2u);
  }
}

- (void)getTimestampAndValueOfPreference:(id)a3 forDomain:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__WBSPerSitePreferencesSQLiteStore_getTimestampAndValueOfPreference_forDomain_completionHandler___block_invoke;
  v15[3] = &unk_1E5C8CA48;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(databaseQueue, v15);
}

void __97__WBSPerSitePreferencesSQLiteStore_getTimestampAndValueOfPreference_forDomain_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&,NSString * const {__strong}>(*(void **)(*(void *)(a1 + 32) + 24), @"SELECT preference_value, strftime('%s', timestamp) FROM preference_values WHERE domain = ? AND preference = ?", (void *)(a1 + 40), (void *)(a1 + 48));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v8 nextObject];
    int v3 = v2;
    if (v2)
    {
      uint64_t v4 = [v2 objectAtIndex:0];
      id v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v3, "intAtIndex:", 1));
    }
    else
    {
      id v5 = 0;
      uint64_t v4 = 0;
    }

    uint64_t v7 = [v8 statement];
    [v7 invalidate];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

- (void)removeAllPreferenceValuesFromPreference:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValuesFromPreference_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

uint64_t __94__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValuesFromPreference_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    int v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(*(void **)(*(void *)(a1 + 32) + 24), 0, @"DELETE FROM preference_values WHERE preference = ?", (void *)(a1 + 40));
    if (v2 != 101)
    {
      int v3 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        id v7 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorMessage];
        int v8 = 138412802;
        uint64_t v9 = v6;
        __int16 v10 = 2114;
        id v11 = v7;
        __int16 v12 = 1024;
        int v13 = v2;
        _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Failed to delete all preference values from preference %@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);
      }
    }
    uint64_t result = *(void *)(a1 + 48);
    if (result) {
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 101);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

- (void)removeAllPreferenceValuesFromPreferences:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValuesFromPreferences_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

void __95__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValuesFromPreferences_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    int v2 = [*(id *)(a1 + 32) _queryListForPreferences:*(void *)(a1 + 40)];
    int v3 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v4 = [NSString stringWithFormat:@"DELETE FROM preference_values WHERE preference in (%@)", v2];
    int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, v4);

    if (v5 != 101)
    {
      id v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v10 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorMessage];
        *(_DWORD *)buf = 138412802;
        id v12 = v2;
        __int16 v13 = 2114;
        uint64_t v14 = v10;
        __int16 v15 = 1024;
        int v16 = v5;
        _os_log_error_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_ERROR, "Failed to delete all preference values from preferences (%@): %{public}@ (%d)", buf, 0x1Cu);
      }
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v5 == 101);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
      v9();
    }
  }
}

- (void)removeAllPreferenceValues:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValues___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __62__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValues___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    int v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 24), 0, @"DELETE FROM preference_values");
    if (v2 != 101)
    {
      int v3 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(*(void *)(a1 + 32) + 24) lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        __62__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValues___block_invoke_cold_1();
      }
    }
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 101);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      int v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

- (void)savePerSiteSettingCloudKitRecordToDisk:(id)a3 completionHandler:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"UseDefaultValue"];

  if (v8)
  {
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = objc_msgSend(v6, "safari_encodedRecordData");
      id v11 = [v6 recordID];
      id v12 = [v11 recordName];
      int v28 = 141558531;
      uint64_t v29 = 1752392040;
      __int16 v30 = 2117;
      long long v31 = v10;
      __int16 v32 = 2114;
      uint64_t v33 = v12;
      _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Saving deleted CloudKit sync data: %{sensitive, mask.hash}@ with record name: %{public}@.", (uint8_t *)&v28, 0x20u);
    }
    __int16 v13 = objc_msgSend(v6, "safari_encodedRecordData");
    uint64_t v14 = [v6 recordID];
    __int16 v15 = [v14 recordName];
    [(WBSPerSitePreferencesSQLiteStore *)self _setDeletedCloudKitSyncData:v13 forRecordName:v15 completionHandler:v7];
  }
  else
  {
    int v16 = objc_msgSend(v6, "safari_encryptedValues");
    __int16 v13 = [v16 objectForKeyedSubscript:@"Domain"];

    uint64_t v17 = objc_msgSend(v6, "safari_encryptedValues");
    uint64_t v14 = [v17 objectForKeyedSubscript:@"PerSiteSettingName"];

    if (v13)
    {
      id v18 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = [v6 recordID];
        uint64_t v20 = [v19 recordName];
        __int16 v21 = objc_msgSend(v6, "safari_encodedRecordData");
        int v28 = 141559555;
        uint64_t v29 = 1752392040;
        __int16 v30 = 2117;
        long long v31 = v20;
        __int16 v32 = 2114;
        uint64_t v33 = v21;
        __int16 v34 = 2160;
        uint64_t v35 = 1752392040;
        __int16 v36 = 2117;
        uint64_t v37 = v14;
        __int16 v38 = 2160;
        uint64_t v39 = 1752392040;
        __int16 v40 = 2117;
        uint64_t v41 = v13;
        _os_log_impl(&dword_1A6B5F000, v18, OS_LOG_TYPE_INFO, "Saving sync data: %{sensitive, mask.hash}@ and record name: %{public}@ for preference: %{sensitive, mask.hash}@ and domain: %{sensitive, mask.hash}@.", (uint8_t *)&v28, 0x48u);
      }
      __int16 v15 = objc_msgSend(v6, "safari_encodedRecordData");
      __int16 v22 = [v6 recordID];
      __int16 v23 = [v22 recordName];
      [(WBSPerSitePreferencesSQLiteStore *)self _setSyncData:v15 forPreference:v14 domain:v13 recordName:v23 completionHandler:v7];
    }
    else
    {
      int v24 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = [v6 recordID];
        long long v26 = [v25 recordName];
        uint64_t v27 = objc_msgSend(v6, "safari_encodedRecordData");
        int v28 = 141559043;
        uint64_t v29 = 1752392040;
        __int16 v30 = 2117;
        long long v31 = v26;
        __int16 v32 = 2114;
        uint64_t v33 = v27;
        __int16 v34 = 2160;
        uint64_t v35 = 1752392040;
        __int16 v36 = 2117;
        uint64_t v37 = v14;
        _os_log_impl(&dword_1A6B5F000, v24, OS_LOG_TYPE_INFO, "Saving sync data: %{sensitive, mask.hash}@ and record name: %{public}@ for preference: %{sensitive, mask.hash}@.", (uint8_t *)&v28, 0x34u);
      }
      __int16 v15 = objc_msgSend(v6, "safari_encodedRecordData");
      [(WBSPerSitePreferencesSQLiteStore *)self _setSyncData:v15 forPreference:v14 completionHandler:v7];
    }
  }
}

- (void)getSyncDataForPreference:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

void __79__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    int v2 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(*(void *)(a1 + 32) + 24), @"SELECT sync_data FROM default_preferences WHERE preference = ?", (void *)(a1 + 40));
    int v3 = [v2 nextObject];
    id v4 = v3;
    if (v3)
    {
      int v5 = [v3 dataAtIndex:0];
    }
    else
    {
      int v5 = 0;
    }

    id v7 = [v2 statement];
    [v7 invalidate];

    int v8 = [v2 lastResultCode] & 0xFFFFFFFE;
    if (v8 != 100)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __79__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_completionHandler___block_invoke_cold_1();
      }
    }
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, void *, BOOL))(v10 + 16))(v10, v5, v8 == 100);
    }
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

- (void)getSyncDataForPreference:(id)a3 domain:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_domain_completionHandler___block_invoke;
  v15[3] = &unk_1E5C8CA48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(databaseQueue, v15);
}

void __86__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_domain_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    int v2 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&,NSString * const {__strong}>(*(void **)(*(void *)(a1 + 32) + 24), @"SELECT sync_data FROM preference_values WHERE preference = ? AND domain = ?", (void *)(a1 + 40), (void *)(a1 + 48));
    int v3 = [v2 nextObject];
    id v4 = v3;
    if (v3)
    {
      int v5 = [v3 dataAtIndex:0];
    }
    else
    {
      int v5 = 0;
    }

    id v7 = [v2 statement];
    [v7 invalidate];

    int v8 = [v2 lastResultCode] & 0xFFFFFFFE;
    if (v8 != 100)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __86__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_domain_completionHandler___block_invoke_cold_1();
      }
    }
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, void *, BOOL))(v10 + 16))(v10, v5, v8 == 100);
    }
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

- (void)getDeletedCloudKitSyncDataForRecordName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__WBSPerSitePreferencesSQLiteStore_getDeletedCloudKitSyncDataForRecordName_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

void __94__WBSPerSitePreferencesSQLiteStore_getDeletedCloudKitSyncDataForRecordName_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    int v2 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(*(void *)(a1 + 32) + 24), @"SELECT sync_data FROM deleted_cloudkit_records WHERE record_name = ?", (void *)(a1 + 40));
    int v3 = [v2 nextObject];
    id v4 = v3;
    if (v3)
    {
      int v5 = [v3 dataAtIndex:0];
    }
    else
    {
      int v5 = 0;
    }

    id v7 = [v2 statement];
    [v7 invalidate];

    int v8 = [v2 lastResultCode] & 0xFFFFFFFE;
    if (v8 != 100)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __94__WBSPerSitePreferencesSQLiteStore_getDeletedCloudKitSyncDataForRecordName_completionHandler___block_invoke_cold_1();
      }
    }
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, void *, BOOL))(v10 + 16))(v10, v5, v8 == 100);
    }
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

- (void)removePreferenceValueWithRecordName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__WBSPerSitePreferencesSQLiteStore_removePreferenceValueWithRecordName_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

uint64_t __90__WBSPerSitePreferencesSQLiteStore_removePreferenceValueWithRecordName_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    int v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(*(void **)(*(void *)(a1 + 32) + 24), 0, @"DELETE FROM preference_values WHERE record_name = ?", (void *)(a1 + 40));
    if (v2 != 101)
    {
      int v3 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __90__WBSPerSitePreferencesSQLiteStore_removePreferenceValueWithRecordName_completionHandler___block_invoke_cold_1();
      }
    }
    uint64_t result = *(void *)(a1 + 48);
    if (result) {
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 101);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      int v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

- (void)removeAllCloudKitRecordsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    uint64_t v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 24), 0, @"UPDATE default_preferences SET sync_data = NULL");
    if (v2 != 101)
    {
      uint64_t v3 = v2;
      id v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    uint64_t v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 24), 0, @"UPDATE preference_values SET sync_data = NULL");
    if (v11 != 101)
    {
      uint64_t v12 = v11;
      id v13 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    uint64_t v20 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 24), 0, @"DROP TABLE IF EXISTS deleted_cloudkit_records");
    if (v20 != 101)
    {
      __int16 v21 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v20 == 101);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      uint64_t v29 = *(uint64_t (**)(void))(result + 16);
      return v29();
    }
  }
  return result;
}

- (void)removeTombstoneWithRecordName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSPerSitePreferencesSQLiteStore_removeTombstoneWithRecordName_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

uint64_t __84__WBSPerSitePreferencesSQLiteStore_removeTombstoneWithRecordName_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(*(void **)(*(void *)(a1 + 32) + 24), 0, @"DELETE FROM deleted_cloudkit_records WHERE record_name = ?", (void *)(a1 + 40)) != 101)
    {
      uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __84__WBSPerSitePreferencesSQLiteStore_removeTombstoneWithRecordName_completionHandler___block_invoke_cold_1();
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
}

- (void)removeAllSyncData
{
  uint64_t v3 = [(id)objc_opt_class() staticSyncablePerSiteSettings];
  id v4 = [v3 allObjects];
  [(WBSPerSitePreferencesSQLiteStore *)self removeAllPreferenceValuesFromPreferences:v4 completionHandler:&__block_literal_global_124_0];

  [(WBSPerSitePreferencesSQLiteStore *)self removeAllCloudKitRecordsWithCompletionHandler:&__block_literal_global_127];
}

void __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_cold_1();
    }
  }
}

void __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_125(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_125_cold_1();
    }
  }
}

- (void)_setSyncData:(id)a3 forPreference:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_completionHandler___block_invoke;
  v15[3] = &unk_1E5C8CA48;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(databaseQueue, v15);
}

void __81__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:*(void *)(*(void *)(a1 + 32) + 24), @"INSERT INTO default_preferences (preference, sync_data) VALUES (?, ?) ON CONFLICT (preference) DO UPDATE SET sync_data = excluded.sync_data" query];
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSData * const {__strong}&>(v2, (void *)(a1 + 40), (void *)(a1 + 48));
    int v3 = [v2 execute];
    [v2 invalidate];
    if (v3 != 101)
    {
      id v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v9 = 141558275;
        uint64_t v10 = 1752392040;
        __int16 v11 = 2117;
        uint64_t v12 = v5;
        _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Failed to insert default sync data for preference: %{sensitive, mask.hash}@", (uint8_t *)&v9, 0x16u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 101);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
}

- (void)_setSyncData:(id)a3 forPreference:(id)a4 domain:(id)a5 recordName:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  databaseQueue = self->_databaseQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_domain_recordName_completionHandler___block_invoke;
  v23[3] = &unk_1E5C9EAB0;
  v23[4] = self;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v27 = v15;
  id v28 = v16;
  id v18 = v15;
  id v19 = v12;
  id v20 = v13;
  id v21 = v14;
  id v22 = v16;
  dispatch_async(databaseQueue, v23);
}

void __99__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_domain_recordName_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:*(void *)(*(void *)(a1 + 32) + 24), @"INSERT INTO preference_values (domain, preference, sync_data, record_name) VALUES (?, ?, ?, ?) ON CONFLICT (domain, preference) DO UPDATE SET sync_data = excluded.sync_data, record_name = excluded.record_name" query];
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSString * const {__strong},NSData * const {__strong}&,NSString * const {__strong}>(v2, (void *)(a1 + 40), (void *)(a1 + 48), (void *)(a1 + 56), (void *)(a1 + 64));
    int v3 = [v2 execute];
    [v2 invalidate];
    if (v3 != 101)
    {
      id v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __99__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_domain_recordName_completionHandler___block_invoke_cold_1();
      }
    }
    uint64_t v5 = *(void *)(a1 + 72);
    if (v5) {
      (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 101);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 72);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

- (void)_setDeletedCloudKitSyncData:(id)a3 forRecordName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__WBSPerSitePreferencesSQLiteStore__setDeletedCloudKitSyncData_forRecordName_completionHandler___block_invoke;
  v15[3] = &unk_1E5C8CA48;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(databaseQueue, v15);
}

void __96__WBSPerSitePreferencesSQLiteStore__setDeletedCloudKitSyncData_forRecordName_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNecessary];
  if ([*(id *)(a1 + 32) _isDatabaseOpen])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:*(void *)(*(void *)(a1 + 32) + 24), @"INSERT INTO deleted_cloudkit_records (record_name, sync_data) VALUES (?, ?) ON CONFLICT (record_name) DO UPDATE SET sync_data = excluded.sync_data" query];
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSData * const {__strong}&>(v2, (void *)(a1 + 40), (void *)(a1 + 48));
    int v3 = [v2 execute];
    [v2 invalidate];
    if (v3 != 101)
    {
      id v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Failed to insert deleted CloudKit sync data.", v8, 2u);
      }
    }
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 101);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

- (id)_queryListForPreferences:(id)a3
{
  int v3 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_139_0);
  id v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

id __61__WBSPerSitePreferencesSQLiteStore__queryListForPreferences___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [NSString stringWithFormat:@"'%@'", a2];
  return v2;
}

- (BOOL)_migrateToSchemaVersion:(int)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"_migrateToSchemaVersion_%d", *(void *)&a3);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v6 = NSSelectorFromString(v5);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__WBSPerSitePreferencesSQLiteStore__migrateToSchemaVersion___block_invoke;
  v8[3] = &unk_1E5C9EBC8;
  void v8[4] = self;
  v8[5] = v6;
  int v9 = a3;
  return [(WBSPerSitePreferencesSQLiteStore *)self _tryToPerformTransactionInBlock:v8];
}

BOOL __60__WBSPerSitePreferencesSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) methodSignatureForSelector:*(void *)(a1 + 40)];
  int v3 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v2];
  [v3 setSelector:*(void *)(a1 + 40)];
  [v3 invokeWithTarget:*(void *)(a1 + 32)];
  int v6 = 0;
  [v3 getReturnValue:&v6];
  BOOL v4 = v6 == 101
    && [*(id *)(a1 + 32) _setDatabaseSchemaVersion:*(unsigned int *)(a1 + 48)] != 0;

  return v4;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  int v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", *(void *)&a3);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      int v12 = a3;
      __int16 v13 = 2114;
      id v14 = v10;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to set the Per Site Preferences store database schema version to %d: %{public}@ (%d)", buf, 0x18u);
    }
  }
  return v7;
}

- (int)_createFreshDatabaseSchema
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE default_preferences (id INTEGER PRIMARY KEY AUTOINCREMENT,preference TEXT NOT NULL UNIQUE,default_value NUMERIC,sync_data BLOB NULL)");
  if (v3 != 101)
  {
    int v5 = v3;
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema]();
    }
    goto LABEL_10;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE preference_values (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL,preference TEXT NOT NULL,preference_value NUMERIC,timestamp TEXT NULL,sync_data BLOB NULL,record_name TEXT NULL,UNIQUE(domain, preference))");
  if (v4 != 101)
  {
    int v5 = v4;
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema]();
    }
    goto LABEL_10;
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE deleted_cloudkit_records (record_name TEXT NOT NULL UNIQUE,sync_data BLOB)");
  if (v5 != 101)
  {
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema]();
    }
LABEL_10:
  }
  return v5;
}

- (int)_migrateToSchemaVersion_2
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE preference_values ADD COLUMN timestamp TEXT");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion_2]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_3
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE preference_values ADD COLUMN sync_data BLOB");
  if (v3 != 101)
  {
    int v4 = v3;
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion_3]();
    }
    goto LABEL_7;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE preference_values ADD COLUMN record_name TEXT");
  if (v4 != 101)
  {
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion_3]();
    }
LABEL_7:
  }
  return v4;
}

- (int)_migrateToSchemaVersion_4
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE default_preferences ADD COLUMN sync_data BLOB");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion_4]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_5
{
  return 101;
}

- (int)_migrateToSchemaVersion_6
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE IF NOT EXISTS deleted_cloudkit_records (record_name TEXT NOT NULL UNIQUE,sync_data BLOB)");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema]();
    }
  }
  return v3;
}

- (void)_closeDatabase
{
  [(WBSSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;
}

- (BOOL)_tryToPerformTransactionInBlock:(id)a3
{
  int v4 = (unsigned int (**)(void))a3;
  if (![(WBSPerSitePreferencesSQLiteStore *)self _isDatabaseOpen]) {
    goto LABEL_15;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION") != 101)
  {
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:]();
    }
    goto LABEL_14;
  }
  if (!v4[2](v4))
  {
LABEL_11:
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ROLLBACK TRANSACTION") == 101)
    {
LABEL_15:
      BOOL v5 = 0;
      goto LABEL_16;
    }
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:]();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION") != 101)
  {
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:]();
    }

    goto LABEL_11;
  }
  BOOL v5 = 1;
LABEL_16:

  return v5;
}

- (WBSSafariBookmarksSyncAgentProxy)syncProxy
{
  return self->_syncProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncProxy, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_valueOfPreferences:forDomain:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Requested value of preferences for nil domain.", v1, 2u);
}

void __95__WBSPerSitePreferencesSQLiteStore_getAllPreferenceInformationForPreference_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to get all preference information: %{public}@ (%d)", v4, v5);
}

void __62__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValues___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to delete all preference values.: %{public}@ (%d)", v4, v5);
}

void __79__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_5_0(&dword_1A6B5F000, v0, v1, "Failed to fetch default sync data for preference: %{sensitive, mask.hash}@", v2);
}

void __86__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_domain_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8_1(&dword_1A6B5F000, v0, v1, "Failed to fetch sync data for preference: %{sensitive, mask.hash}@ and domain: %{sensitive, mask.hash}@");
}

void __94__WBSPerSitePreferencesSQLiteStore_getDeletedCloudKitSyncDataForRecordName_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch deleted CloudKit sync data.", v1, 2u);
}

void __90__WBSPerSitePreferencesSQLiteStore_removePreferenceValueWithRecordName_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_5_0(&dword_1A6B5F000, v0, v1, "Failed to delete the preference values using record name %{sensitive, mask.hash}@", v2);
}

void __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__WBSPerSitePreferencesSQLiteStore_removeTombstoneWithRecordName_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_5_0(&dword_1A6B5F000, v0, v1, "Failed to delete the CloudKit tombstone using record name %{sensitive, mask.hash}@", v2);
}

void __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Removing Safari's Per-Site Settings sync data from the preference_values table was successful.", v1, 2u);
}

void __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_125_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Removing Safari's Per-Site Settings CloudKit records was successful.", v1, 2u);
}

void __99__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_domain_recordName_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8_1(&dword_1A6B5F000, v0, v1, "Failed to insert sync data for preference: %{sensitive, mask.hash}@ and domain: %{sensitive, mask.hash}@");
}

- (void)_createFreshDatabaseSchema
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to create the default_preferences table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_2
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add timestamp column to preference_values table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_3
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add sync_data column to preference_values table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_4
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add sync_data column to default_preferences table: %{public}@ (%d)", v4, v5);
}

- (void)_tryToPerformTransactionInBlock:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to rollback transaction: %{public}@ (%d)", v4, v5);
}

- (void)_tryToPerformTransactionInBlock:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to commit transaction: %{public}@ (%d)", v4, v5);
}

- (void)_tryToPerformTransactionInBlock:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to begin transaction: %{public}@ (%d)", v4, v5);
}

@end