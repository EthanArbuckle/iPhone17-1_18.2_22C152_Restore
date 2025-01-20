@interface FCRecordSource
+ (BOOL)recognizesRecordID:(id)a3 inRecordIDPrefixes:(id)a4;
+ (BOOL)supportsDeletions;
+ (id)canaryRecordName;
+ (id)changeTagFromCKRecord:(id)a3;
+ (id)defaultCachePolicy;
+ (id)identifierFromCKRecord:(id)a3;
+ (id)modificationDateFromCKRecord:(id)a3;
- (BOOL)isRecordStale:(id)a3 withCachePolicy:(id)a4;
- (BOOL)recognizesRecordID:(id)a3;
- (FCRecordSource)init;
- (FCRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6;
- (FCRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8;
- (FCThreadSafeMutableDictionary)fetchErrorsByKey;
- (NSArray)alwaysLocalizedKeys;
- (NSArray)desiredKeys;
- (NSArray)experimentalizableKeys;
- (NSArray)localizableExperimentalizableKeys;
- (NSArray)localizableKeys;
- (NSArray)localizableLanguageSpecificKeys;
- (NSArray)nonLocalizableKeys;
- (NSDictionary)experimentalizedKeysByOriginalKey;
- (NSDictionary)localizedExperimentalizedKeysByOriginalKey;
- (NSDictionary)localizedKeysByOriginalKey;
- (NSDictionary)localizedLanguageSpecificKeysByOriginalKey;
- (NSString)activeTreatmentID;
- (NSString)experimentalizableFieldsPostfix;
- (id)_ckRecordIDFromIdentifier:(void *)a1;
- (id)_deleteRecordsWithWriteLockWithIDs:(id *)a1;
- (id)_experimentalizedKeysByOriginalKeyForExperimentPostfix:(id)a3;
- (id)_faultableRecordsWithIdentifiers:(id *)a1;
- (id)_fetchErrorForKey:(id)a1;
- (id)_identifierFromCKRecordID:(void *)a1;
- (id)_localizedExperimentalizedKeysByOriginalKeyForContentStoreFrontID:(id)a3 experimentPostfix:(id)a4;
- (id)_localizedKeysByOriginalKeyForContentStoreFrontID:(id)a3;
- (id)_localizedLanguageSpecificKeysByOriginalKeyForContentStoreFrontID:(void *)a3 languageCode:;
- (id)_recordFromCKRecord:(void *)a1;
- (id)_saveCKRecordsWithWriteLock:(void *)a3 updateFetchDateForRecordIdentifiers:(void *)a4 fetchContext:;
- (id)cachedRecordWithID:(id)a3;
- (id)cachedRecordsWithIDs:(id)a3;
- (id)convertRecords:(id)a3;
- (id)deleteRecordsWithIDs:(id)a3;
- (id)fetchCoordinator:(id)a3 fetchOperationForKeys:(id)a4 context:(id)a5 qualityOfService:(int64_t)a6 relativePriority:(int64_t)a7;
- (id)fetchOperationForRecordsWithIDs:(id)a3;
- (id)fetchOperationForRecordsWithIDs:(id)a3 ignoreCacheForRecordIDs:(id)a4;
- (id)interestTokenForRecordIDs:(id)a3;
- (id)jsonEncodableObject;
- (id)keyValueRepresentationOfRecord:(id)a3;
- (id)recordFromCKRecord:(id)a3;
- (id)recordFromCKRecord:(id)a3 base:(id)a4;
- (id)recordIDPrefixes;
- (id)recordType;
- (id)resolveLocalizableExperimentalizableFieldforKey:(id)a3 inRecord:(id)a4 activeExperimentIDKey:(id)a5;
- (id)savePBRecords:(id)a3;
- (id)saveRecords:(id)a3;
- (id)storeFilename;
- (id)valueFromCKRecord:(id)a3 baseKey:(id)a4 localizedKeys:(id)a5 localizedLanguageSpecificKeys:(id)a6;
- (int)pbRecordType;
- (int64_t)storageSize;
- (uint64_t)_prepareForUse;
- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3;
- (unint64_t)highThresholdDataSizeLimit;
- (unint64_t)lowThresholdDataSizeLimit;
- (unint64_t)storeVersion;
- (void)_deriveDesiredKeys;
- (void)_deriveDesiredKeysIfNeeded;
- (void)addCacheObserver:(id)a3;
- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3;
- (void)fetchCoordinator:(id)a3 addFetchOperation:(id)a4 context:(id)a5;
- (void)fetchCoordinator:(id)a3 filterKeysToFetch:(id)a4 isFirstAttempt:(BOOL)a5 context:(id)a6;
- (void)forceRefreshDesiredKeys;
- (void)save;
- (void)t_startOverridingExperimentalizableFieldsPostfix:(id)a3 treatmentID:(id)a4;
- (void)t_stopOverridingExperimentalizableFieldsPostfixAndTreatmentID;
- (void)updateFetchDateForRecordIDs:(id)a3;
@end

@implementation FCRecordSource

- (BOOL)recognizesRecordID:(id)a3
{
  id v4 = a3;
  v5 = [(FCRecordSource *)self recordIDPrefixes];
  BOOL v6 = +[FCRecordSource recognizesRecordID:v4 inRecordIDPrefixes:v5];

  return v6;
}

+ (BOOL)recognizesRecordID:(id)a3 inRecordIDPrefixes:(id)a4
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__FCRecordSource_recognizesRecordID_inRecordIDPrefixes___block_invoke;
  v8[3] = &unk_1E5B4DBB0;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "fc_containsObjectPassingTest:", v8);

  return (char)a4;
}

uint64_t __56__FCRecordSource_recognizesRecordID_inRecordIDPrefixes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPrefix:a2];
}

id __39__FCRecordSource_cachedRecordsWithIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = -[FCFaultableRecord recordBase](a2);
  v3 = [v2 identifier];

  return v3;
}

- (id)_ckRecordIDFromIdentifier:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (![v3 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier.length != 0");
      *(_DWORD *)buf = 136315906;
      v8 = "-[FCRecordSource _ckRecordIDFromIdentifier:]";
      __int16 v9 = 2080;
      v10 = "FCRecordSource.m";
      __int16 v11 = 1024;
      int v12 = 1140;
      __int16 v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    if ([v4 length]) {
      a1 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v4];
    }
    else {
      a1 = 0;
    }
  }

  return a1;
}

id __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke(uint64_t a1, void *a2)
{
  return -[FCRecordSource _ckRecordIDFromIdentifier:](*(void **)(a1 + 32), a2);
}

id __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_2(uint64_t a1, void *a2)
{
  return -[FCRecordSource _identifierFromCKRecordID:](*(void **)(a1 + 32), a2);
}

id __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_78(uint64_t a1, void *a2)
{
  return -[FCRecordSource _ckRecordIDFromIdentifier:](*(void **)(a1 + 32), a2);
}

- (id)fetchOperationForRecordsWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = [FCRecordsFetchOperation alloc];
  id v6 = self;
  id v7 = v4;
  if (v5)
  {
    v12.receiver = v5;
    v12.super_class = (Class)FCRecordsFetchOperation;
    v8 = [(FCRecordSource *)&v12 init];
    id v5 = (FCRecordsFetchOperation *)v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8[2]._experimentalizableFieldsPostfix, self);
      uint64_t v9 = [v7 copy];
      recordIdentifiers = v5->_recordIdentifiers;
      v5->_recordIdentifiers = (NSArray *)v9;
    }
  }

  return v5;
}

- (id)recordIDPrefixes
{
  return &unk_1EF8D88B0;
}

void __39__FCRecordSource_cachedRecordsWithIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 40);
        if (v8) {
          uint64_t v9 = *(void **)(v8 + 104);
        }
        else {
          uint64_t v9 = 0;
        }
        if (objc_msgSend(v9, "cacheContainsKey:", *(void *)(*((void *)&v15 + 1) + 8 * v6), (void)v15))
        {
          uint64_t v10 = *(void *)(a1 + 40);
          if (v10) {
            __int16 v11 = *(void **)(v10 + 96);
          }
          else {
            __int16 v11 = 0;
          }
          objc_super v12 = [v11 objectForKey:v7];
          __int16 v13 = -[FCFaultableRecord recordBase]((uint64_t)v12);
          if (!-[NTPBRecordBase hasExpiredAssetURLs](v13)) {
            [*(id *)(a1 + 48) addObject:v12];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v14 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v4 = v14;
    }
    while (v14);
  }
}

- (BOOL)isRecordStale:(id)a3 withCachePolicy:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v6 || ![v6 cachePolicy])
  {
    uint64_t v8 = [(id)objc_opt_class() defaultCachePolicy];

    uint64_t v7 = (void *)v8;
  }
  switch([v7 cachePolicy])
  {
    case 0:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = (void *)[[NSString alloc] initWithFormat:@"record sources must provide a real cache policy as the default fallback"];
        int v14 = 136315906;
        long long v15 = "-[FCRecordSource isRecordStale:withCachePolicy:]";
        __int16 v16 = 2080;
        long long v17 = "FCRecordSource.m";
        __int16 v18 = 1024;
        int v19 = 697;
        __int16 v20 = 2114;
        v21 = v13;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
      }
      goto LABEL_9;
    case 1:
      char v11 = 1;
      break;
    case 2:
    case 3:
      [v7 maximumCachedAge];
      if (v9 != 0.0) {
        goto LABEL_6;
      }
      goto LABEL_9;
    case 4:
    case 5:
LABEL_6:
      uint64_t v10 = [v5 base];
      [v7 maximumCachedAge];
      char v11 = objc_msgSend(v10, "fc_isCachedAgeGreaterThan:");

      break;
    default:
LABEL_9:
      char v11 = 0;
      break;
  }

  return v11;
}

- (id)keyValueRepresentationOfRecord:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)defaultCachePolicy
{
  if (qword_1EB5D0E60 != -1) {
    dispatch_once(&qword_1EB5D0E60, &__block_literal_global_13);
  }
  id v2 = (void *)_MergedGlobals_31;
  return v2;
}

- (id)_fetchErrorForKey:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = [v2 fetchErrorsByKey];
    id v2 = [v4 objectForKey:v3];
  }
  return v2;
}

void __76__FCRecordSource_fetchCoordinator_filterKeysToFetch_isFirstAttempt_context___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 40);
        if (v8) {
          double v9 = *(void **)(v8 + 104);
        }
        else {
          double v9 = 0;
        }
        if ([v9 cacheContainsKey:*(void *)(*((void *)&v13 + 1) + 8 * v6)]) {
          [*(id *)(a1 + 32) removeObject:v7];
        }
        uint64_t v10 = [*(id *)(a1 + 40) fetchErrorsByKey];
        char v11 = [v10 objectForKey:v7];

        if (v11)
        {
          if (objc_msgSend(v11, "fc_isCKUnknownItemError")) {
            [*(id *)(a1 + 32) removeObject:v7];
          }
          if (!*(unsigned char *)(a1 + 48)) {
            [*(id *)(a1 + 32) removeObject:v7];
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v12 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v4 = v12;
    }
    while (v12);
  }
}

- (FCThreadSafeMutableDictionary)fetchErrorsByKey
{
  return self->_fetchErrorsByKey;
}

- (id)cachedRecordsWithIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self);
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    uint64_t v6 = [(FCCacheCoordinator *)cacheCoordinator holdTokensForKeys:v4];
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    if (self) {
      uint64_t v8 = self->_cacheCoordinator;
    }
    else {
      uint64_t v8 = 0;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__FCRecordSource_cachedRecordsWithIDs___block_invoke_2;
    v13[3] = &unk_1E5B4C738;
    id v14 = v4;
    long long v15 = self;
    id v16 = v7;
    id v9 = v7;
    [(FCCacheCoordinator *)v8 performCacheRead:v13];
    uint64_t v10 = objc_msgSend(v9, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_44, &__block_literal_global_47_0);
    char v11 = [[FCHeldRecords alloc] initWithRecordsByID:v10 interestTokensByID:v6];
  }
  else
  {
    char v11 = objc_alloc_init(FCHeldRecords);
  }

  return v11;
}

- (uint64_t)_prepareForUse
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 56) lock];
    if (!*(void *)(v1 + 96))
    {
      uint64_t v3 = (void *)MEMORY[0x1A6260FD0](v2);
      id v4 = objc_alloc_init(FCKeyValueStoreClassRegistry);
      [(FCKeyValueStoreClassRegistry *)v4 registerClass:objc_opt_class()];
      [(FCKeyValueStoreClassRegistry *)v4 registerClass:objc_opt_class()];
      uint64_t v5 = +[FCKeyValueStoreSavePolicy defaultPolicy];
      id v6 = *(id *)(v1 + 80);
      if (v6)
      {
        uint64_t v7 = *(void *)(v1 + 88);

        if (v7)
        {
          uint64_t v8 = *(void *)(v1 + 88);
          id v9 = *(id *)(v1 + 80);
          uint64_t v10 = +[FCKeyValueStoreSavePolicy appBackgroundPolicyWithActivityMonitor:v9 backgroundTaskable:v8];

          uint64_t v5 = (void *)v10;
        }
      }
      char v11 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v12 = [v11 bundleIdentifier];
      int v13 = [v12 isEqualToString:@"com.apple.newsd"];

      if (v13) {
        uint64_t v14 = 4;
      }
      else {
        uint64_t v14 = 0;
      }
      long long v15 = [FCKeyValueStore alloc];
      id v16 = [(id)v1 storeFilename];
      id v17 = *(id *)(v1 + 72);
      uint64_t v18 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:migrator:savePolicy:](v15, "initWithName:directory:version:options:classRegistry:migrator:savePolicy:", v16, v17, [(id)v1 storeVersion], v14, v4, 0, v5);
      int v19 = *(void **)(v1 + 96);
      *(void *)(v1 + 96) = v18;

      [*(id *)(v1 + 96) setShouldExportJSONSidecar:1];
      [*(id *)(v1 + 96) setJSONEncodingHandlersWithObjectHandler:&__block_literal_global_96 arrayObjectHandler:0 dictionaryKeyHandler:0 dictionaryValueHandler:0];
      __int16 v20 = [*(id *)(v1 + 96) allKeys];
      v21 = objc_msgSend(v20, "fc_arrayByRemovingObject:", @"cacheHints");

      uint64_t v22 = *(void **)(v1 + 104);
      v23 = [*(id *)(v1 + 96) objectForKeyedSubscript:@"cacheHints"];
      [v22 setupWithInitialKeys:v21 persistedHints:v23];
    }
    v24 = *(void **)(v1 + 56);
    return [v24 unlock];
  }
  return result;
}

- (void)_deriveDesiredKeys
{
  if (a1)
  {
    uint64_t v2 = +[FCAppleAccount sharedAccount];
    uint64_t v3 = [v2 contentStoreFrontID];

    id v4 = +[FCAppleAccount sharedAccount];
    uint64_t v5 = [v4 primaryLanguageCode];

    id v6 = [a1 experimentalizableFieldsPostfix];
    id v36 = v3;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
    id v8 = v5;
    id v9 = v6;
    uint64_t v10 = [a1 nonLocalizableKeys];
    char v11 = [v7 setWithArray:v10];

    uint64_t v12 = [a1 localizableKeys];
    [v11 addObjectsFromArray:v12];

    int v13 = [a1 _localizedKeysByOriginalKeyForContentStoreFrontID:v36];
    uint64_t v14 = [v13 allValues];
    [v11 addObjectsFromArray:v14];

    long long v15 = +[FCAppleAccount sharedAccount];
    LOBYTE(v14) = [v15 isContentStoreFrontSupported];

    if ((v14 & 1) == 0)
    {
      id v16 = [a1 alwaysLocalizedKeys];
      [v11 addObjectsFromArray:v16];
    }
    id v17 = [a1 experimentalizableKeys];
    [v11 addObjectsFromArray:v17];

    uint64_t v18 = [a1 _experimentalizedKeysByOriginalKeyForExperimentPostfix:v9];
    int v19 = [v18 allValues];
    [v11 addObjectsFromArray:v19];

    __int16 v20 = [a1 localizableExperimentalizableKeys];
    [v11 addObjectsFromArray:v20];

    v21 = [a1 _localizedExperimentalizedKeysByOriginalKeyForContentStoreFrontID:v36 experimentPostfix:v9];

    uint64_t v22 = [v21 allValues];
    [v11 addObjectsFromArray:v22];

    v23 = [a1 localizableLanguageSpecificKeys];
    [v11 addObjectsFromArray:v23];

    v24 = -[FCRecordSource _localizedLanguageSpecificKeysByOriginalKeyForContentStoreFrontID:languageCode:](a1, v36, v8);

    v25 = [v24 allValues];
    [v11 addObjectsFromArray:v25];

    uint64_t v26 = [v11 allObjects];

    v27 = (void *)a1[2];
    a1[2] = v26;

    uint64_t v28 = [a1 _localizedKeysByOriginalKeyForContentStoreFrontID:v36];
    v29 = (void *)a1[3];
    a1[3] = v28;

    uint64_t v30 = [a1 _experimentalizedKeysByOriginalKeyForExperimentPostfix:v9];
    v31 = (void *)a1[4];
    a1[4] = v30;

    uint64_t v32 = [a1 _localizedExperimentalizedKeysByOriginalKeyForContentStoreFrontID:v36 experimentPostfix:v9];
    v33 = (void *)a1[5];
    a1[5] = v32;

    uint64_t v34 = -[FCRecordSource _localizedLanguageSpecificKeysByOriginalKeyForContentStoreFrontID:languageCode:](a1, v36, v8);
    v35 = (void *)a1[6];
    a1[6] = v34;
  }
}

- (id)_localizedLanguageSpecificKeysByOriginalKeyForContentStoreFrontID:(void *)a3 languageCode:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = objc_msgSend(a1, "localizableLanguageSpecificKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v14 = FCCKLocalizedLanguageSpecificRecordKey(v13, (uint64_t)v5, (uint64_t)v6);
          [v7 setObject:v14 forKey:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

- (NSArray)localizableLanguageSpecificKeys
{
  return 0;
}

- (id)_localizedKeysByOriginalKeyForContentStoreFrontID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v4 length])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = [(FCRecordSource *)self localizableKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v12 = FCCKLocalizedRecordKey(v11, (uint64_t)v4);
          [v5 setObject:v12 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = [(FCRecordSource *)self alwaysLocalizedKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * j);
          long long v19 = FCCKLocalizedRecordKey(v18, (uint64_t)v4);
          [v5 setObject:v19 forKey:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v15);
    }
  }
  return v5;
}

- (id)_localizedExperimentalizedKeysByOriginalKeyForContentStoreFrontID:(id)a3 experimentPostfix:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [(FCRecordSource *)self localizableExperimentalizableKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v15 = FCCKLocalizedExperimentizedRecordKey(v14, (uint64_t)v6, (uint64_t)v7);
          [v8 setObject:v15 forKey:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (id)_experimentalizedKeysByOriginalKeyForExperimentPostfix:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v4 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(FCRecordSource *)self experimentalizableKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = FCCKExperimentizedRecordKey(v11, (uint64_t)v4);
          [v5 setObject:v12 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (NSArray)localizableKeys
{
  return 0;
}

- (NSString)experimentalizableFieldsPostfix
{
  return self->_experimentalizableFieldsPostfix;
}

- (NSArray)alwaysLocalizedKeys
{
  return 0;
}

- (NSArray)localizableExperimentalizableKeys
{
  return 0;
}

- (NSArray)experimentalizableKeys
{
  return 0;
}

- (id)_saveCKRecordsWithWriteLock:(void *)a3 updateFetchDateForRecordIdentifiers:(void *)a4 fetchContext:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v36 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    v43 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v40 = [MEMORY[0x1E4F1CA48] array];
    v39 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v35 = v7;
    obuint64_t j = v7;
    id v38 = v9;
    uint64_t v44 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v46;
      v37 = v8;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v46 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v12 = [(id)objc_opt_class() identifierFromCKRecord:v11];
          if ([a1[13] cacheContainsKey:v12])
          {
            uint64_t v13 = [a1[12] objectForKey:v12];
            long long v14 = -[FCFaultableRecord recordBase]((uint64_t)v13);
            if (v8) {
              LODWORD(v8) = v8[2] == 1 && NSClassFromString(&cfstr_Xctest.isa) != 0;
            }
            long long v20 = (void *)MEMORY[0x1E4F1C9C8];
            long long v21 = objc_msgSend(v14, "modificationDate", v35);
            uint64_t v19 = [v20 dateWithPBDate:v21];

            uint64_t v22 = [(id)objc_opt_class() modificationDateFromCKRecord:v11];
            char v23 = objc_msgSend(v22, "fc_isLaterThan:withPrecision:", v19, 1);
            if (-[NTPBRecordBase needsAssetURLRefresh](v14) || (v23 & 1) != 0 || v8)
            {
              long long v25 = -[FCRecordSource _recordFromCKRecord:](a1, v11);
              long long v26 = +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v25);
              [v43 setObject:v26 forKey:v12];
            }
            else
            {
              long long v24 = -[FCFaultableRecord record]((uint64_t)v13);
              long long v25 = (void *)[v24 copy];

              long long v26 = [v25 base];
              long long v27 = [MEMORY[0x1E4F1C9C8] pbDate];
              [v26 setFetchDate:v27];

              long long v28 = +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v25);
              [v43 setObject:v28 forKey:v12];
            }
            uint64_t v8 = v37;

            uint64_t v9 = v38;
          }
          else
          {
            uint64_t v13 = -[FCRecordSource _recordFromCKRecord:](a1, v11);
            long long v14 = [v13 base];
            long long v15 = +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v13);
            [v43 setObject:v15 forKey:v12];

            [v40 addObject:v12];
            long long v16 = NSNumber;
            int v17 = [v14 cacheLifetimeHint];
            if (v17 == 2) {
              uint64_t v18 = 2;
            }
            else {
              uint64_t v18 = v17 == 1;
            }
            uint64_t v19 = objc_msgSend(v16, "numberWithInteger:", v18, v35);
            [v39 setObject:v19 forKey:v12];
          }

          [v9 addObject:v12];
        }
        uint64_t v44 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v44);
    }

    v29 = v36;
    if ([v36 count]) {
      [a1[12] updateObjectsForKeys:v36 withBlock:&__block_literal_global_105];
    }
    id v30 = a1[12];
    uint64_t v31 = [v43 allValues];
    uint64_t v32 = [v43 allKeys];
    [v30 setObjects:v31 forKeys:v32];

    [a1[13] didInsertKeysIntoCache:v40 withLifetimeHints:v39];
    v33 = [a1[13] persistableHints];
    if (v33) {
      [a1[12] setObject:v33 forKey:@"cacheHints"];
    }

    id v7 = v35;
  }
  else
  {
    id v38 = 0;
    v29 = v36;
  }

  return v38;
}

+ (id)identifierFromCKRecord:(id)a3
{
  uint64_t v3 = [a3 recordID];
  id v4 = [v3 recordName];

  return v4;
}

id __95__FCRecordSource__saveCKRecordsWithWriteLock_updateFetchDateForRecordIdentifiers_fetchContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = -[FCFaultableRecord record](a2);
  uint64_t v3 = (void *)[v2 copy];

  id v4 = [v3 base];
  id v5 = [MEMORY[0x1E4F1C9C8] pbDate];
  [v4 setFetchDate:v5];

  id v6 = +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v3);

  return v6;
}

- (id)_recordFromCKRecord:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)MEMORY[0x1A6260FD0]();
    id v5 = (objc_class *)MEMORY[0x1E4F82B98];
    id v6 = v3;
    id v7 = objc_alloc_init(v5);
    uint64_t v8 = [(id)objc_opt_class() identifierFromCKRecord:v6];
    [v7 setIdentifier:v8];

    uint64_t v9 = [(id)objc_opt_class() changeTagFromCKRecord:v6];
    [v7 setChangeTag:v9];

    uint64_t v10 = [(id)objc_opt_class() modificationDateFromCKRecord:v6];

    uint64_t v11 = [v10 pbDate];
    [v7 setModificationDate:v11];

    objc_msgSend(v7, "setRecordType:", objc_msgSend(a1, "pbRecordType"));
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] pbDate];
    [v7 setFetchDate:v12];
    [v7 setAssetURLsDate:v12];

    a1 = [a1 recordFromCKRecord:v6 base:v7];
  }

  return a1;
}

+ (id)modificationDateFromCKRecord:(id)a3
{
  return (id)[a3 modificationDate];
}

+ (id)changeTagFromCKRecord:(id)a3
{
  return (id)[a3 recordChangeTag];
}

- (NSDictionary)localizedKeysByOriginalKey
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  localizedKeysByOriginalKey = self->_localizedKeysByOriginalKey;
  return localizedKeysByOriginalKey;
}

- (void)_deriveDesiredKeysIfNeeded
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (!*(void *)(a1 + 16)) {
      -[FCRecordSource _deriveDesiredKeys]((void *)a1);
    }
    os_unfair_lock_unlock(v2);
  }
}

void __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v16 = objc_msgSend(v10, "objectForKey:", v15, (void)v35);
        if (v16)
        {
          int v17 = -[FCRecordSource _identifierFromCKRecordID:](*(void **)(a1 + 32), v15);
          [v9 setObject:v16 forKey:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    uint64_t v18 = [*(id *)(a1 + 32) fetchErrorsByKey];
    [v18 addEntriesFromDictionary:v9];
  }
  if (objc_msgSend(v5, "count", (void)v35))
  {
    uint64_t v19 = *(void **)(a1 + 32);
    long long v20 = [v5 allValues];
    id v21 = (id)[v19 saveRecords:v20];

    uint64_t v22 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      char v23 = v22;
      uint64_t v24 = [v5 count];
      long long v25 = [*(id *)(a1 + 32) recordType];
      uint64_t v26 = *(void *)(a1 + 40);
      double v27 = v8 - *(double *)(a1 + 56);
      *(_DWORD *)buf = 134218754;
      uint64_t v40 = v24;
      __int16 v41 = 2114;
      uint64_t v42 = v25;
      __int16 v43 = 2112;
      uint64_t v44 = v26;
      __int16 v45 = 2048;
      double v46 = v27;
      long long v28 = "successfully fetched %lu %{public}@ records with operation ID %@, total time: %f";
      v29 = v23;
      uint32_t v30 = 42;
LABEL_17:
      _os_log_impl(&dword_1A460D000, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
    }
  }
  else
  {
    uint64_t v31 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = *(void **)(a1 + 48);
      char v23 = v31;
      uint64_t v33 = [v32 count];
      long long v25 = [*(id *)(a1 + 32) recordType];
      uint64_t v34 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v40 = v33;
      __int16 v41 = 2114;
      uint64_t v42 = v25;
      __int16 v43 = 2112;
      uint64_t v44 = v34;
      long long v28 = "failed to fetch %lu %{public}@ records with operation ID %@";
      v29 = v23;
      uint32_t v30 = 32;
      goto LABEL_17;
    }
  }
}

- (id)_identifierFromCKRecordID:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "ckRrecordID != nil");
      *(_DWORD *)buf = 136315906;
      double v8 = "-[FCRecordSource _identifierFromCKRecordID:]";
      __int16 v9 = 2080;
      id v10 = "FCRecordSource.m";
      __int16 v11 = 1024;
      int v12 = 1146;
      __int16 v13 = 2114;
      long long v14 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    a1 = [v4 recordName];
  }

  return a1;
}

void __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_82(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v14 = v13;
  if ([v10 count] || objc_msgSend(v9, "count") || objc_msgSend(v11, "count"))
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_2;
    v44[3] = &unk_1E5B4DC48;
    v44[4] = *(void *)(a1 + 32);
    uint64_t v15 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v44);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_3;
    v43[3] = &unk_1E5B4DC48;
    v43[4] = *(void *)(a1 + 32);
    long long v16 = objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v43);
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      uint64_t v18 = *(void **)(v17 + 104);
    }
    else {
      uint64_t v18 = 0;
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_4;
    v37[3] = &unk_1E5B4DC70;
    id v38 = v10;
    id v39 = v15;
    uint64_t v19 = *(void **)(a1 + 40);
    uint64_t v40 = *(void *)(a1 + 32);
    id v41 = v19;
    id v42 = v16;
    id v20 = v16;
    id v21 = v15;
    [v18 performCacheWrite:v37];
  }
  if (v12 && [v12 code] != 2)
  {
    uint64_t v33 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = *(void **)(a1 + 56);
      char v23 = v33;
      uint64_t v35 = [v34 count];
      long long v25 = [*(id *)(a1 + 32) recordType];
      uint64_t v36 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      uint64_t v46 = v35;
      __int16 v47 = 2114;
      uint64_t v48 = v25;
      __int16 v49 = 2114;
      uint64_t v50 = v36;
      uint32_t v30 = "failed to refresh %lu %{public}@ records with operation ID %{public}@";
      uint64_t v31 = v23;
      uint32_t v32 = 32;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v22 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      char v23 = v22;
      uint64_t v24 = [v9 count];
      long long v25 = [*(id *)(a1 + 32) recordType];
      uint64_t v26 = [v10 count];
      uint64_t v27 = [v11 count];
      uint64_t v28 = *(void *)(a1 + 48);
      double v29 = v14 - *(double *)(a1 + 64);
      *(_DWORD *)buf = 134219266;
      uint64_t v46 = v24;
      __int16 v47 = 2114;
      uint64_t v48 = v25;
      __int16 v49 = 2048;
      uint64_t v50 = v26;
      __int16 v51 = 2048;
      uint64_t v52 = v27;
      __int16 v53 = 2114;
      uint64_t v54 = v28;
      __int16 v55 = 2048;
      double v56 = v29;
      uint32_t v30 = "successfully refreshed %lu %{public}@ records with %lu changes and %lu deletions, operation ID %{public}@, total time: %f";
      uint64_t v31 = v23;
      uint32_t v32 = 62;
LABEL_13:
      _os_log_impl(&dword_1A460D000, v31, OS_LOG_TYPE_INFO, v30, buf, v32);
    }
  }
}

- (id)saveRecords:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__9;
  long long v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  if ([v4 count])
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self);
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    id v6 = cacheCoordinator;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__FCRecordSource_saveRecords___block_invoke;
    v9[3] = &unk_1E5B4C4D0;
    v9[4] = self;
    id v10 = v4;
    id v11 = &v12;
    [(FCCacheCoordinator *)v6 performCacheWrite:v9];
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __36__FCRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = v0;

  [(id)_MergedGlobals_31 setCachePolicy:4];
  uint64_t v2 = (void *)_MergedGlobals_31;
  return [v2 setMaximumCachedAge:1.79769313e308];
}

id __39__FCRecordSource_cachedRecordsWithIDs___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return -[FCFaultableRecord record](a2);
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = @"zero-interest";
  if (a3 == 1) {
    id v5 = @"low";
  }
  if (a3 == 2) {
    id v5 = @"high";
  }
  id v6 = v5;
  id v7 = (void *)FCRecordSourceLog;
  if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = v7;
    id v9 = [(FCRecordSource *)self recordType];
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "will enable flushing %{public}@ records with %{public}@ threshold", buf, 0x16u);
  }
  if (a3 == 2)
  {
    unint64_t v13 = [(FCRecordSource *)self highThresholdDataSizeLimit];
  }
  else
  {
    if (a3 != 1)
    {
      BOOL v10 = a3 == 0;
      unint64_t v11 = 0;
      uint64_t v12 = v10;
      goto LABEL_15;
    }
    unint64_t v13 = [(FCRecordSource *)self lowThresholdDataSizeLimit];
  }
  unint64_t v11 = v13;
  uint64_t v12 = 0;
LABEL_15:
  uint64_t v14 = [[FCCacheCoordinatorFlushPolicy alloc] initWithLowWaterMark:(unint64_t)((double)v11 * 0.7) highWaterMark:v11 alwaysFlushKeysWithZeroInterest:v12];
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  [(FCCacheCoordinator *)cacheCoordinator enableFlushingWithPolicy:v14];
}

- (FCRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v17 = a8;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    double v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentDatabase != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v36 = "-[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentaliz"
          "ableFieldsPostfix:activeTreatmentID:]";
    __int16 v37 = 2080;
    id v38 = "FCRecordSource.m";
    __int16 v39 = 1024;
    int v40 = 130;
    __int16 v41 = 2114;
    id v42 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint32_t v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentDirectory != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v36 = "-[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentaliz"
          "ableFieldsPostfix:activeTreatmentID:]";
    __int16 v37 = 2080;
    id v38 = "FCRecordSource.m";
    __int16 v39 = 1024;
    int v40 = 131;
    __int16 v41 = 2114;
    id v42 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v34.receiver = self;
  v34.super_class = (Class)FCRecordSource;
  __int16 v18 = [(FCRecordSource *)&v34 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contentDatabase, a3);
    objc_storeStrong((id *)&v19->_contentDirectory, a4);
    objc_storeStrong((id *)&v19->_appActivityMonitor, a5);
    objc_storeStrong((id *)&v19->_backgroundTaskable, a6);
    objc_storeStrong((id *)&v19->_experimentalizableFieldsPostfix, a7);
    objc_storeStrong((id *)&v19->_activeTreatmentID, a8);
    uint64_t v20 = objc_alloc_init(FCThreadSafeMutableDictionary);
    fetchErrorsByKey = v19->_fetchErrorsByKey;
    v19->_fetchErrorsByKey = v20;

    uint64_t v22 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E4F81C18]);
    initializationLock = v19->_initializationLock;
    v19->_initializationLock = v22;

    uint64_t v24 = objc_alloc_init(FCCacheCoordinator);
    cacheCoordinator = v19->_cacheCoordinator;
    v19->_cacheCoordinator = v24;

    [(FCCacheCoordinator *)v19->_cacheCoordinator setDelegate:v19];
    uint64_t v26 = objc_alloc_init(FCFetchCoordinator);
    fetchCoordinator = v19->_fetchCoordinator;
    v19->_fetchCoordinator = v26;

    [(FCFetchCoordinator *)v19->_fetchCoordinator setDelegate:v19];
    v19->_derivedKeysLock._os_unfair_lock_opaque = 0;
  }

  return v19;
}

- (FCRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6
{
  return [(FCRecordSource *)self initWithContentDatabase:a3 contentDirectory:a4 appActivityMonitor:a5 backgroundTaskable:a6 experimentalizableFieldsPostfix:0 activeTreatmentID:0];
}

- (id)interestTokenForRecordIDs:(id)a3
{
  id v4 = a3;
  -[FCRecordSource _prepareForUse]((uint64_t)self);
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  id v6 = [(FCCacheCoordinator *)cacheCoordinator holdTokenForKeys:v4];

  return v6;
}

- (id)fetchCoordinator:(id)a3 fetchOperationForKeys:(id)a4 context:(id)a5 qualityOfService:(int64_t)a6 relativePriority:(int64_t)a7
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = FCCheckedDynamicCast(v12, (uint64_t)v11);
  uint64_t v14 = (void *)v13;
  if (v13 && *(unsigned char *)(v13 + 8))
  {
    int64_t v72 = a6;
    v73 = (void *)v13;
    id v74 = v11;
    id v15 = [v10 allObjects];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_78;
    v86[3] = &unk_1E5B4DC20;
    v86[4] = self;
    v76 = objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", v86);

    id v75 = v10;
    id v16 = [v10 allObjects];
    id v17 = -[FCRecordSource _faultableRecordsWithIdentifiers:]((id *)&self->super.isa, v16);

    id v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v83 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          long long v25 = [v19 objectForKey:v24];
          uint64_t v26 = -[FCFaultableRecord recordBase]((uint64_t)v25);
          BOOL v27 = -[NTPBRecordBase needsAssetURLRefresh](v26);

          if (!v27)
          {
            uint64_t v28 = -[FCFaultableRecord recordBase]((uint64_t)v25);
            double v29 = [v28 changeTag];

            if (v29)
            {
              uint32_t v30 = -[FCRecordSource _ckRecordIDFromIdentifier:](self, v24);
              [v18 setObject:v29 forKeyedSubscript:v30];
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v82 objects:v92 count:16];
      }
      while (v21);
    }

    id v31 = objc_alloc_init(FCCKContentBatchedRefreshRecordsOperation);
    id v32 = v31;
    if (self) {
      contentDatabase = self->_contentDatabase;
    }
    else {
      contentDatabase = 0;
    }
    objc_super v34 = v76;
    -[FCCKContentBatchedRefreshRecordsOperation setDatabase:]((uint64_t)v31, contentDatabase);
    if (v32)
    {
      objc_setProperty_nonatomic_copy(v32, v35, v76, 384);
      objc_setProperty_nonatomic_copy(v32, v36, v18, 392);
      __int16 v37 = [(FCRecordSource *)self desiredKeys];
      objc_setProperty_nonatomic_copy(v32, v38, v37, 400);
    }
    else
    {
      __int16 v37 = [(FCRecordSource *)self desiredKeys];
    }
    id v10 = v75;
    uint64_t v14 = v73;

    [v32 setQualityOfService:v72];
    if ([(id)objc_opt_class() supportsDeletions])
    {
      if (v32) {
        v32[368] = 1;
      }
      __int16 v39 = [(id)objc_opt_class() canaryRecordName];
      if (v39)
      {
        __int16 v41 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v39];
        if (v32) {
          objc_setProperty_nonatomic_copy(v32, v40, v41, 408);
        }
      }
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v43 = v42;
    uint64_t v44 = [v32 operationID];
    __int16 v45 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      uint64_t v46 = v45;
      uint64_t v47 = [v76 count];
      uint64_t v48 = [(FCRecordSource *)self recordType];
      *(_DWORD *)buf = 134218498;
      uint64_t v94 = v47;
      __int16 v95 = 2114;
      v96 = v48;
      __int16 v97 = 2114;
      v98 = v44;
      _os_log_impl(&dword_1A460D000, v46, OS_LOG_TYPE_INFO, "will refresh %lu %{public}@ records with operation ID %{public}@", buf, 0x20u);

      objc_super v34 = v76;
    }
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_82;
    newValue[3] = &unk_1E5B4DC98;
    newValue[4] = self;
    id v78 = v73;
    id v79 = v44;
    uint64_t v81 = v43;
    v80 = v34;
    id v49 = v34;
    id v51 = v44;
    uint64_t v52 = v49;
    if (v32)
    {
      objc_setProperty_nonatomic_copy(v32, v50, newValue, 416);
      uint64_t v52 = v80;
    }

    id v11 = v74;
  }
  else
  {
    __int16 v53 = [v10 allObjects];
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke;
    v91[3] = &unk_1E5B4DDA8;
    v91[4] = self;
    uint64_t v54 = objc_msgSend(v53, "fc_arrayByTransformingWithBlock:", v91);

    __int16 v55 = objc_alloc_init(FCCKContentBatchedFetchRecordsOperation);
    id v32 = v55;
    if (self) {
      double v56 = self->_contentDatabase;
    }
    else {
      double v56 = 0;
    }
    -[FCCKContentBatchedFetchRecordsOperation setDatabase:]((uint64_t)v55, v56);
    if (v32)
    {
      objc_setProperty_nonatomic_copy(v32, v57, v54, 376);
      v58 = [(FCRecordSource *)self desiredKeys];
      objc_setProperty_nonatomic_copy(v32, v59, v58, 384);
    }
    else
    {
      v58 = [(FCRecordSource *)self desiredKeys];
    }

    [v32 setQualityOfService:a6];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v61 = v60;
    v62 = [v32 operationID];
    v63 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      v64 = v63;
      id v65 = v11;
      uint64_t v66 = [v54 count];
      [(FCRecordSource *)self recordType];
      v68 = v67 = v14;
      *(_DWORD *)buf = 134218498;
      uint64_t v94 = v66;
      id v11 = v65;
      __int16 v95 = 2114;
      v96 = v68;
      __int16 v97 = 2112;
      v98 = v62;
      _os_log_impl(&dword_1A460D000, v64, OS_LOG_TYPE_INFO, "will fetch %lu %{public}@ records with operation ID %@", buf, 0x20u);

      uint64_t v14 = v67;
    }
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_76;
    v87[3] = &unk_1E5B4DBF8;
    v87[4] = self;
    id v88 = v62;
    uint64_t v90 = v61;
    v89 = v54;
    id v18 = v54;
    id v19 = v62;
    v70 = v18;
    if (v32)
    {
      objc_setProperty_nonatomic_copy(v32, v69, v87, 400);
      v70 = v89;
    }
  }
  return v32;
}

- (NSArray)desiredKeys
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  desiredKeys = self->_desiredKeys;
  return desiredKeys;
}

- (void)fetchCoordinator:(id)a3 addFetchOperation:(id)a4 context:(id)a5
{
  id v5 = (void *)MEMORY[0x1E4F28F08];
  id v6 = a4;
  objc_msgSend(v5, "fc_sharedConcurrentQueue");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 addOperation:v6];
}

- (id)_faultableRecordsWithIdentifiers:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__9;
    uint64_t v13 = __Block_byref_object_dispose__9;
    id v14 = 0;
    id v4 = a1[13];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__FCRecordSource__faultableRecordsWithIdentifiers___block_invoke;
    v6[3] = &unk_1E5B4C230;
    double v8 = &v9;
    v6[4] = a1;
    id v7 = v3;
    [v4 performCacheRead:v6];

    a1 = (id *)(id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  return a1;
}

- (void)fetchCoordinator:(id)a3 filterKeysToFetch:(id)a4 isFirstAttempt:(BOOL)a5 context:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = FCCheckedDynamicCast(v11, (uint64_t)v10);
  uint64_t v13 = (void *)v12;
  if (v12 && *(unsigned char *)(v12 + 8))
  {
    id v36 = v10;
    SEL v38 = (double *)v12;
    if ((*(void *)(v12 + 16) | 4) == 5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = (void *)[[NSString alloc] initWithFormat:@"shouldn't be filtering for this cache policy"];
      *(_DWORD *)buf = 136315906;
      id v49 = "-[FCRecordSource fetchCoordinator:filterKeysToFetch:isFirstAttempt:context:]";
      __int16 v50 = 2080;
      id v51 = "FCRecordSource.m";
      __int16 v52 = 1024;
      int v53 = 854;
      __int16 v54 = 2114;
      __int16 v55 = v35;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v14 = [v9 allObjects];
    id v15 = -[FCRecordSource _faultableRecordsWithIdentifiers:]((id *)&self->super.isa, v14);

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v40;
      uint64_t v37 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v22 = [v16 objectForKeyedSubscript:v21];
          char v23 = -[FCFaultableRecord recordBase]((uint64_t)v22);
          if (!-[NTPBRecordBase needsAssetURLRefresh](v23))
          {
            uint64_t v24 = [v23 fetchDate];
            if (!v24) {
              goto LABEL_14;
            }
            long long v25 = (void *)v24;
            id v26 = v9;
            BOOL v27 = (void *)MEMORY[0x1E4F1C9C8];
            [v23 fetchDate];
            v29 = uint64_t v28 = v18;
            uint32_t v30 = [v27 dateWithPBDate:v29];
            objc_msgSend(v30, "fc_timeIntervalUntilNow");
            double v32 = v31;
            double v33 = v38[3];

            id v9 = v26;
            uint64_t v19 = v37;

            uint64_t v18 = v28;
            if (v32 < v33) {
LABEL_14:
            }
              [v9 removeObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v18);
    }

    id v10 = v36;
    uint64_t v13 = v38;
  }
  else
  {
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __76__FCRecordSource_fetchCoordinator_filterKeysToFetch_isFirstAttempt_context___block_invoke;
    v43[3] = &unk_1E5B4C710;
    id v44 = v9;
    __int16 v45 = self;
    BOOL v46 = a5;
    [(FCCacheCoordinator *)cacheCoordinator performCacheRead:v43];
    id v16 = v44;
  }
}

+ (BOOL)supportsDeletions
{
  return 0;
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  if (self) {
    self = (FCRecordSource *)self->_localStore;
  }
  return [(FCRecordSource *)self storeSize];
}

- (NSDictionary)localizedLanguageSpecificKeysByOriginalKey
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  localizedLanguageSpecificKeysByOriginalKey = self->_localizedLanguageSpecificKeysByOriginalKey;
  return localizedLanguageSpecificKeysByOriginalKey;
}

void __51__FCRecordSource__faultableRecordsWithIdentifiers___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[12];
  }
  uint64_t v3 = a1[5];
  id v7 = v2;
  uint64_t v4 = [v7 objectsForKeys:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __30__FCRecordSource_saveRecords___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[FCRecordSource _saveCKRecordsWithWriteLock:updateFetchDateForRecordIdentifiers:fetchContext:](*(id **)(a1 + 32), *(void **)(a1 + 40), 0, 0);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 96);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [v4 objectsForKeys:v2];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v7, "objectForKey:", v12, (void)v22);
        id v14 = -[FCFaultableRecord record]((uint64_t)v13);
        [v6 setObject:v14 forKey:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  id v15 = [FCHeldRecords alloc];
  id v16 = *(void **)(a1 + 32);
  if (v16) {
    id v16 = (void *)v16[13];
  }
  uint64_t v17 = v16;
  uint64_t v18 = [v17 holdTokensForKeys:v2];
  uint64_t v19 = [(FCHeldRecords *)v15 initWithRecordsByID:v6 interestTokensByID:v18];
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    uint64_t v2 = *(id **)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 32) allValues];
    id v4 = -[FCRecordSource _saveCKRecordsWithWriteLock:updateFetchDateForRecordIdentifiers:fetchContext:](v2, v3, *(void **)(a1 + 40), *(void **)(a1 + 56));
  }
  if ([*(id *)(a1 + 64) count])
  {
    uint64_t v5 = *(id **)(a1 + 48);
    id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 64)];
    id v6 = -[FCRecordSource _deleteRecordsWithWriteLockWithIDs:](v5, v7);
  }
}

- (FCRecordSource)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCRecordSource init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCRecordSource.m";
    __int16 v11 = 1024;
    int v12 = 107;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCRecordSource init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)recordType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCRecordSource recordType]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCRecordSource.m";
    __int16 v11 = 1024;
    int v12 = 160;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCRecordSource recordType]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (int)pbRecordType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCRecordSource pbRecordType]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCRecordSource.m";
    __int16 v11 = 1024;
    int v12 = 166;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCRecordSource pbRecordType]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)storeFilename
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCRecordSource storeFilename]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCRecordSource.m";
    __int16 v11 = 1024;
    int v12 = 172;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCRecordSource storeFilename]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (unint64_t)storeVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCRecordSource storeVersion]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCRecordSource.m";
    __int16 v11 = 1024;
    int v12 = 178;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCRecordSource storeVersion]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCRecordSource lowThresholdDataSizeLimit]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCRecordSource.m";
    __int16 v11 = 1024;
    int v12 = 184;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCRecordSource lowThresholdDataSizeLimit]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (unint64_t)highThresholdDataSizeLimit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCRecordSource highThresholdDataSizeLimit]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCRecordSource.m";
    __int16 v11 = 1024;
    int v12 = 190;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCRecordSource highThresholdDataSizeLimit]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCRecordSource recordFromCKRecord:base:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCRecordSource.m";
    __int16 v16 = 1024;
    int v17 = 201;
    __int16 v18 = 2114;
    uint64_t v19 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  uint64_t v10 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCRecordSource recordFromCKRecord:base:]"];
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (id)canaryRecordName
{
  return 0;
}

- (NSArray)nonLocalizableKeys
{
  return 0;
}

- (id)resolveLocalizableExperimentalizableFieldforKey:(id)a3 inRecord:(id)a4 activeExperimentIDKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FCRecordSource *)self localizedExperimentalizedKeysByOriginalKey];
  int v12 = [v11 objectForKeyedSubscript:v10];
  __int16 v13 = objc_msgSend(v9, "fc_safeObjectForKey:", v12);

  __int16 v14 = [(FCRecordSource *)self experimentalizedKeysByOriginalKey];
  uint64_t v15 = [v14 objectForKeyedSubscript:v10];
  __int16 v16 = objc_msgSend(v9, "fc_safeObjectForKey:", v15);

  int v17 = [(FCRecordSource *)self localizedKeysByOriginalKey];
  __int16 v18 = [v17 objectForKeyedSubscript:v10];
  uint64_t v19 = objc_msgSend(v9, "fc_safeObjectForKey:", v18);

  uint64_t v20 = [v9 objectForKeyedSubscript:v10];

  uint64_t v21 = [(FCRecordSource *)self experimentalizedKeysByOriginalKey];
  long long v22 = [v21 objectForKeyedSubscript:v8];

  long long v23 = [v9 objectForKeyedSubscript:v22];

  long long v24 = (void *)MEMORY[0x1E4FBA8A8];
  long long v25 = [(FCRecordSource *)self activeTreatmentID];
  int v26 = objc_msgSend(v24, "nf_object:isEqualToObject:", v23, v25);

  if (v19) {
    uint64_t v27 = v19;
  }
  else {
    uint64_t v27 = v20;
  }
  if (v16) {
    uint64_t v28 = v16;
  }
  else {
    uint64_t v28 = v20;
  }
  if (v19) {
    uint64_t v28 = v19;
  }
  if (v13) {
    uint64_t v28 = v13;
  }
  if (v26) {
    double v29 = v28;
  }
  else {
    double v29 = v27;
  }
  id v30 = v29;

  return v30;
}

- (id)valueFromCKRecord:(id)a3 baseKey:(id)a4 localizedKeys:(id)a5 localizedLanguageSpecificKeys:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "ckRecord");
    *(_DWORD *)buf = 136315906;
    uint64_t v28 = "-[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:]";
    __int16 v29 = 2080;
    id v30 = "FCRecordSource.m";
    __int16 v31 = 1024;
    int v32 = 308;
    __int16 v33 = 2114;
    objc_super v34 = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "baseKey");
    *(_DWORD *)buf = 136315906;
    uint64_t v28 = "-[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:]";
    __int16 v29 = 2080;
    id v30 = "FCRecordSource.m";
    __int16 v31 = 1024;
    int v32 = 309;
    __int16 v33 = 2114;
    objc_super v34 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  uint64_t v13 = [v12 objectForKeyedSubscript:v10];
  if (v13)
  {
    __int16 v14 = (void *)v13;
    uint64_t v15 = [v12 objectForKeyedSubscript:v10];
    __int16 v16 = [v9 objectForKeyedSubscript:v15];

    if (v16)
    {
      int v17 = v12;
LABEL_12:
      long long v22 = [v17 objectForKeyedSubscript:v10];
      long long v23 = [v9 objectForKeyedSubscript:v22];

      goto LABEL_14;
    }
  }
  uint64_t v18 = [v11 objectForKeyedSubscript:v10];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [v11 objectForKeyedSubscript:v10];
    uint64_t v21 = [v9 objectForKeyedSubscript:v20];

    if (v21)
    {
      int v17 = v11;
      goto LABEL_12;
    }
  }
  long long v23 = [v9 objectForKeyedSubscript:v10];
LABEL_14:

  return v23;
}

- (id)recordFromCKRecord:(id)a3
{
  return -[FCRecordSource _recordFromCKRecord:](self, a3);
}

- (NSDictionary)experimentalizedKeysByOriginalKey
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  experimentalizedKeysByOriginalKey = self->_experimentalizedKeysByOriginalKey;
  return experimentalizedKeysByOriginalKey;
}

- (NSDictionary)localizedExperimentalizedKeysByOriginalKey
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  localizedExperimentalizedKeysByOriginalKey = self->_localizedExperimentalizedKeysByOriginalKey;
  return localizedExperimentalizedKeysByOriginalKey;
}

- (id)fetchOperationForRecordsWithIDs:(id)a3 ignoreCacheForRecordIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [FCRecordsFetchOperation alloc];
  id v9 = self;
  id v10 = v7;
  id v11 = v6;
  if (v8)
  {
    v18.receiver = v8;
    v18.super_class = (Class)FCRecordsFetchOperation;
    id v12 = [(FCRecordSource *)&v18 init];
    id v8 = (FCRecordsFetchOperation *)v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12[2]._experimentalizableFieldsPostfix, self);
      uint64_t v13 = [v10 copy];
      recordIdentifiers = v8->_recordIdentifiers;
      v8->_recordIdentifiers = (NSArray *)v13;

      uint64_t v15 = [v11 copy];
      ignoreCacheForRecordIDs = v8->_ignoreCacheForRecordIDs;
      v8->_ignoreCacheForRecordIDs = (NSArray *)v15;
    }
  }

  return v8;
}

- (id)cachedRecordWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v11 = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v11 count:1];

    id v7 = -[FCRecordSource cachedRecordsWithIDs:](self, "cachedRecordsWithIDs:", v6, v11, v12);
    id v8 = [v7 allRecords];
    id v9 = [v8 firstObject];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)savePBRecords:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__9;
  int v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  if ([v4 count])
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self);
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    id v6 = cacheCoordinator;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__FCRecordSource_savePBRecords___block_invoke;
    v9[3] = &unk_1E5B4C4D0;
    id v10 = v4;
    id v11 = self;
    uint64_t v12 = &v13;
    [(FCCacheCoordinator *)v6 performCacheWrite:v9];
  }
  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __32__FCRecordSource_savePBRecords___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v49 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v47 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  uint64_t v48 = a1;
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v52;
    uint64_t v45 = *(void *)v52;
    BOOL v46 = v2;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v52 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v51 + 1) + 8 * v6);
        id v8 = objc_msgSend(v7, "base", v45, v46);
        id v9 = [v8 identifier];
        if (v9)
        {
          uint64_t v10 = *(void *)(a1 + 40);
          if (v10) {
            id v11 = *(void **)(v10 + 104);
          }
          else {
            id v11 = 0;
          }
          if ([v11 cacheContainsKey:v9])
          {
            uint64_t v12 = *(void *)(a1 + 40);
            if (v12) {
              uint64_t v13 = *(void **)(v12 + 96);
            }
            else {
              uint64_t v13 = 0;
            }
            __int16 v14 = [v13 objectForKey:v9];
            uint64_t v15 = -[FCFaultableRecord recordBase]((uint64_t)v14);
            __int16 v16 = (void *)MEMORY[0x1E4F1C9C8];
            int v17 = [v15 modificationDate];
            id v18 = [v16 dateWithPBDate:v17];

            uint64_t v19 = (void *)MEMORY[0x1E4F1C9C8];
            uint64_t v20 = [v8 modificationDate];
            uint64_t v21 = [v19 dateWithPBDate:v20];

            if (objc_msgSend(v21, "fc_isLaterThan:withPrecision:", v18, 1))
            {
              long long v22 = +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v7);
              [v49 setObject:v22 forKey:v9];
            }
            uint64_t v5 = v45;
            uint64_t v2 = v46;
            a1 = v48;
          }
          else
          {
            long long v23 = +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v7);
            [v49 setObject:v23 forKey:v9];

            long long v24 = NSNumber;
            int v25 = [v8 cacheLifetimeHint];
            if (v25 == 2) {
              uint64_t v26 = 2;
            }
            else {
              uint64_t v26 = v25 == 1;
            }
            __int16 v14 = [v24 numberWithInteger:v26];
            [v47 setObject:v14 forKey:v9];
          }

          [v2 addObject:v9];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v27 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      uint64_t v4 = v27;
    }
    while (v27);
  }

  uint64_t v28 = *(void **)(a1 + 40);
  if (v28) {
    uint64_t v28 = (void *)v28[12];
  }
  __int16 v29 = v28;
  id v30 = [v49 allValues];
  __int16 v31 = [v49 allKeys];
  [v29 setObjects:v30 forKeys:v31];

  int v32 = *(void **)(v48 + 40);
  if (v32) {
    int v32 = (void *)v32[13];
  }
  __int16 v33 = v32;
  objc_super v34 = [v49 allKeys];
  [v33 didInsertKeysIntoCache:v34 withLifetimeHints:v47];

  uint64_t v35 = *(void *)(v48 + 40);
  if (v35) {
    id v36 = *(void **)(v35 + 104);
  }
  else {
    id v36 = 0;
  }
  uint64_t v37 = [v36 persistableHints];
  if (v37)
  {
    uint64_t v38 = *(void *)(v48 + 40);
    if (v38) {
      long long v39 = *(void **)(v38 + 96);
    }
    else {
      long long v39 = 0;
    }
    [v39 setObject:v37 forKey:@"cacheHints"];
  }
  long long v40 = *(void **)(v48 + 40);
  if (v40) {
    long long v40 = (void *)v40[13];
  }
  long long v41 = v40;
  uint64_t v42 = [v41 holdTokenForKeys:v2];
  uint64_t v43 = *(void *)(*(void *)(v48 + 48) + 8);
  id v44 = *(void **)(v43 + 40);
  *(void *)(v43 + 40) = v42;
}

- (id)convertRecords:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1A6260FD0](v8);
        __int16 v14 = objc_msgSend((id)objc_opt_class(), "identifierFromCKRecord:", v12, (void)v18);
        uint64_t v15 = -[FCRecordSource _recordFromCKRecord:](self, v12);
        [v5 setObject:v15 forKey:v14];
        [v6 setObject:v14 forKey:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }

  __int16 v16 = [[FCHeldRecords alloc] initWithRecordsByID:v5 interestTokensByID:v6];
  return v16;
}

- (id)deleteRecordsWithIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(id)objc_opt_class() supportsDeletions] & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"should only attempt to delete when the record source supports deletions"];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCRecordSource deleteRecordsWithIDs:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCRecordSource.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v16) = 653;
    WORD2(v16) = 2114;
    *(void *)((char *)&v16 + 6) = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v16 = __Block_byref_object_copy__9;
  *((void *)&v16 + 1) = __Block_byref_object_dispose__9;
  id v17 = 0;
  if ([v4 count])
  {
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    uint64_t v6 = cacheCoordinator;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__FCRecordSource_deleteRecordsWithIDs___block_invoke;
    v12[3] = &unk_1E5B4C230;
    __int16 v14 = buf;
    v12[4] = self;
    id v13 = v4;
    [(FCCacheCoordinator *)v6 performCacheWrite:v12];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v7;
  }
  id v9 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v9;
}

uint64_t __39__FCRecordSource_deleteRecordsWithIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[FCRecordSource _deleteRecordsWithWriteLockWithIDs:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_deleteRecordsWithWriteLockWithIDs:(id *)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v24 = v3;
  if (!a1) {
    goto LABEL_15;
  }
  uint64_t v4 = v3;
  if (([(id)objc_opt_class() supportsDeletions] & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v22 = (void *)[[NSString alloc] initWithFormat:@"should only attempt to delete when the record source supports deletions"];
    *(_DWORD *)buf = 136315906;
    __int16 v31 = "-[FCRecordSource _deleteRecordsWithWriteLockWithIDs:]";
    __int16 v32 = 2080;
    __int16 v33 = "FCRecordSource.m";
    __int16 v34 = 1024;
    int v35 = 1252;
    __int16 v36 = 2114;
    uint64_t v37 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v4)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordIDs != nil", v24);
        *(_DWORD *)buf = 136315906;
        __int16 v31 = "-[FCRecordSource _deleteRecordsWithWriteLockWithIDs:]";
        __int16 v32 = 2080;
        __int16 v33 = "FCRecordSource.m";
        __int16 v34 = 1024;
        int v35 = 1253;
        __int16 v36 = 2114;
        uint64_t v37 = v23;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v4)
  {
    goto LABEL_5;
  }
  id v5 = a1[12];
  uint64_t v6 = [v4 allObjects];
  uint64_t v7 = [v5 objectsForKeys:v6];

  uint64_t v8 = [v7 allKeys];

  [a1[12] updateObjectsForKeys:v8 withBlock:&__block_literal_global_108_0];
  id v9 = [a1[12] objectsForKeys:v8];
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v17 = [v11 objectForKey:v16];
        uint64_t v18 = -[FCFaultableRecord record]((uint64_t)v17);
        [v10 setObject:v18 forKey:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  long long v19 = [FCHeldRecords alloc];
  long long v20 = [a1[13] holdTokensForKeys:v8];
  a1 = [(FCHeldRecords *)v19 initWithRecordsByID:v10 interestTokensByID:v20];

LABEL_15:
  return a1;
}

- (void)updateFetchDateForRecordIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self);
    if (self) {
      cacheCoordinator = self->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__FCRecordSource_updateFetchDateForRecordIDs___block_invoke;
    v6[3] = &unk_1E5B4BE70;
    v6[4] = self;
    id v7 = v4;
    [(FCCacheCoordinator *)cacheCoordinator performCacheWrite:v6];
  }
}

id __46__FCRecordSource_updateFetchDateForRecordIDs___block_invoke(uint64_t a1)
{
  return -[FCRecordSource _saveCKRecordsWithWriteLock:updateFetchDateForRecordIdentifiers:fetchContext:](*(id **)(a1 + 32), 0, *(void **)(a1 + 40), 0);
}

- (int64_t)storageSize
{
  -[FCRecordSource _prepareForUse]((uint64_t)self);
  if (self) {
    localStore = self->_localStore;
  }
  else {
    localStore = 0;
  }
  return [(FCKeyValueStore *)localStore storeSize];
}

- (void)save
{
  if (self)
  {
    [(NFUnfairLock *)self->_initializationLock lock];
    id v4 = self->_localStore;
    initializationLock = self->_initializationLock;
  }
  else
  {
    [0 lock];
    id v4 = 0;
    initializationLock = 0;
  }
  [(NFUnfairLock *)initializationLock unlock];
  [(FCKeyValueStore *)v4 save];
}

- (void)addCacheObserver:(id)a3
{
  id v5 = a3;
  -[FCRecordSource _prepareForUse]((uint64_t)self);
  if (self) {
    cacheCoordinator = self->_cacheCoordinator;
  }
  else {
    cacheCoordinator = 0;
  }
  [(FCCacheCoordinator *)cacheCoordinator addObserver:v5];
}

__CFString *__54__FCRecordSource_enableFlushingWithFlushingThreshold___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = @"zero-interest";
  if (v1 == 1) {
    uint64_t v2 = @"low";
  }
  if (v1 == 2) {
    return @"high";
  }
  else {
    return v2;
  }
}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)FCRecordSourceLog;
  if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = [v7 count];
    if (self) {
      localStore = self->_localStore;
    }
    else {
      localStore = 0;
    }
    uint64_t v12 = localStore;
    uint64_t v13 = [(FCKeyValueStore *)v12 allKeys];
    uint64_t v14 = [v13 count] - 1;
    uint64_t v15 = [(FCRecordSource *)self recordType];
    int v19 = 134218754;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v14;
    __int16 v23 = 2114;
    long long v24 = v15;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "record source is flushing %lu of %lu %{public}@ records: %{public}@", (uint8_t *)&v19, 0x2Au);
  }
  if (self) {
    uint64_t v16 = self->_localStore;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;
  uint64_t v18 = [v7 allObjects];
  [(FCKeyValueStore *)v17 removeObjectsForKeys:v18];
}

id __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_3(uint64_t a1, void *a2)
{
  return -[FCRecordSource _identifierFromCKRecordID:](*(void **)(a1 + 32), a2);
}

id __34__FCRecordSource__initializeStore__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = -[FCFaultableRecord record]((uint64_t)v4);
    id v6 = [v5 dictionaryRepresentation];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)forceRefreshDesiredKeys
{
  p_derivedKeysLock = &self->_derivedKeysLock;
  os_unfair_lock_lock(&self->_derivedKeysLock);
  -[FCRecordSource _deriveDesiredKeys](self);
  os_unfair_lock_unlock(p_derivedKeysLock);
}

id __53__FCRecordSource__deleteRecordsWithWriteLockWithIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = -[FCFaultableRecord record](a2);
  id v3 = (void *)[v2 copy];

  id v4 = [v3 base];
  [v4 setDeletedFromCloud:1];
  id v5 = [MEMORY[0x1E4F1C9C8] pbDate];
  [v4 setModificationDate:v5];

  id v6 = [MEMORY[0x1E4F1C9C8] pbDate];
  [v4 setFetchDate:v6];

  id v7 = +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v3);

  return v7;
}

- (void)t_startOverridingExperimentalizableFieldsPostfix:(id)a3 treatmentID:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = (NSString *)a4;
  experimentalizableFieldsPostfix = self->_experimentalizableFieldsPostfix;
  self->_experimentalizableFieldsPostfix = v6;
  uint64_t v12 = v6;

  activeTreatmentID = self->_activeTreatmentID;
  self->_activeTreatmentID = v7;
  uint64_t v10 = v7;

  desiredKeys = self->_desiredKeys;
  self->_desiredKeys = 0;
}

- (void)t_stopOverridingExperimentalizableFieldsPostfixAndTreatmentID
{
  experimentalizableFieldsPostfix = self->_experimentalizableFieldsPostfix;
  self->_experimentalizableFieldsPostfix = 0;

  activeTreatmentID = self->_activeTreatmentID;
  self->_activeTreatmentID = 0;

  desiredKeys = self->_desiredKeys;
  self->_desiredKeys = 0;
}

- (id)jsonEncodableObject
{
  if (self) {
    self = (FCRecordSource *)self->_localStore;
  }
  return [(FCRecordSource *)self jsonEncodableObject];
}

- (NSString)activeTreatmentID
{
  return self->_activeTreatmentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTreatmentID, 0);
  objc_storeStrong((id *)&self->_experimentalizableFieldsPostfix, 0);
  objc_storeStrong((id *)&self->_fetchErrorsByKey, 0);
  objc_storeStrong((id *)&self->_fetchCoordinator, 0);
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_backgroundTaskable, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_contentDirectory, 0);
  objc_storeStrong((id *)&self->_contentDatabase, 0);
  objc_storeStrong((id *)&self->_initializationLock, 0);
  objc_storeStrong((id *)&self->_localizedLanguageSpecificKeysByOriginalKey, 0);
  objc_storeStrong((id *)&self->_localizedExperimentalizedKeysByOriginalKey, 0);
  objc_storeStrong((id *)&self->_experimentalizedKeysByOriginalKey, 0);
  objc_storeStrong((id *)&self->_localizedKeysByOriginalKey, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
}

@end