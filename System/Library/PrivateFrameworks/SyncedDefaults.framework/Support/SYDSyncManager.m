@interface SYDSyncManager
+ (BOOL)shouldIgnoreFetchError:(id)a3;
- (BOOL)alwaysSaveRecordZones;
- (BOOL)hasPendingChangesToUpload;
- (BOOL)initializeSyncEngineWithError:(id *)a3;
- (BOOL)isAutomaticSyncingEnabled;
- (BOOL)isIdentityLostError:(id)a3;
- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 didRemoveValue:(BOOL *)a6 error:(id *)a7;
- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 error:(id *)a6;
- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 error:(id *)a6;
- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 excludeFromChangeTracking:(BOOL)a6 enforceQuota:(BOOL)a7 didChangeValue:(BOOL *)a8 error:(id *)a9;
- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 excludeFromChangeTracking:(BOOL)a6 enforceQuota:(BOOL)a7 error:(id *)a8;
- (BOOL)shouldRetryAfterModifyError:(id)a3;
- (BOOL)shouldSyncStoreWithIdentifier:(id)a3;
- (BOOL)useSyncAnchor;
- (BOOL)useUUIDRecordNames;
- (BOOL)validateKey:(id)a3 error:(id *)a4;
- (CKContainer)container;
- (CKSyncEngine)engine;
- (NSMutableArray)pendingDeletedRecordIDs;
- (NSMutableArray)pendingFetchedRecords;
- (NSMutableSet)storeIdentifiersWithChangedValuesDuringFetchChanges;
- (NSString)description;
- (NSString)personaUniqueString;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SYDCoreDataStore)coreDataStore;
- (SYDSyncManager)initWithContainer:(id)a3 coreDataStore:(id)a4 storeType:(int64_t)a5 testConfiguration:(id)a6;
- (SYDSyncManagerDelegate)delegate;
- (SYDTestConfiguration)testConfiguration;
- (id)engineWithError:(id *)a3;
- (id)newRecordNameForKey:(id)a3;
- (id)objectForKey:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (id)recordIDForKey:(id)a3 inStoreWithIdentifier:(id)a4;
- (id)recordToSaveForRecordID:(id)a3 error:(id *)a4;
- (id)syncEngine:(id)a3 nextFetchChangesOptionsForContext:(id)a4;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (id)syncEngine:(id)a3 relatedApplicationBundleIdentifiersForZoneIDs:(id)a4 recordIDs:(id)a5;
- (int)mobileKeybagNotifyToken;
- (int64_t)storeType;
- (unint64_t)maxPendingFetchedRecords;
- (void)_markZoneForDeletionOnManateeFailureForRecordZoneID:(id)a3;
- (void)_queue_resetSyncEngine;
- (void)addKeyValueRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 storeIdentifier:(id)a5;
- (void)addPendingDatabaseChanges:(id)a3 storeIdentifier:(id)a4;
- (void)addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:(id)a3;
- (void)dealloc;
- (void)deduplicateRecordForKeyValue:(id)a3 withNewlyFetchedRecord:(id)a4;
- (void)deleteDataFromCloudWithCompletionHandler:(id)a3;
- (void)deleteDataFromDisk;
- (void)didDeleteRecordWithID:(id)a3;
- (void)didDeleteRecordZoneWithID:(id)a3;
- (void)didEndFetchingChanges;
- (void)didFailToDeleteRecordWithID:(id)a3 error:(id)a4;
- (void)didFailToFetchChangesForRecordZoneID:(id)a3 error:(id)a4;
- (void)didFailToSaveRecord:(id)a3 error:(id)a4;
- (void)didFetchRecord:(id)a3;
- (void)didFetchRecordDeletion:(id)a3 recordType:(id)a4;
- (void)didSaveKeyValueRecord:(id)a3;
- (void)didSaveRecord:(id)a3;
- (void)failedToSaveKeyValueRecord:(id)a3 error:(id)a4;
- (void)fetchChangesFromCloudForAllStoresWithCompletionHandler:(id)a3;
- (void)fetchChangesFromCloudForStoreIdentifiers:(id)a3 group:(id)a4 completionHandler:(id)a5;
- (void)handleSyncEngineStateUpdate:(id)a3;
- (void)markAllKeyValuesAsNeedingToBeUploaded;
- (void)markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:(id)a3;
- (void)processFetchedRecords:(id)a3 deletedRecordIDs:(id)a4;
- (void)processPendingFetchedRecordsWithReason:(id)a3;
- (void)registerForFirstUnlockNotificationsIfNecessary;
- (void)resetSyncEngine;
- (void)resetSyncEngineWithContainer:(id)a3;
- (void)savePendingChangesToCloudForAllStoresWithCompletionHandler:(id)a3;
- (void)savePendingChangesToCloudForStoreIdentifiers:(id)a3 group:(id)a4 completionHandler:(id)a5;
- (void)saveSyncAnchorSystemFieldsRecord:(id)a3;
- (void)setAlwaysSaveRecordZones:(BOOL)a3;
- (void)setAutomaticSyncingEnabled:(BOOL)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCoreDataStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxPendingFetchedRecords:(unint64_t)a3;
- (void)setMobileKeybagNotifyToken:(int)a3;
- (void)setPendingDeletedRecordIDs:(id)a3;
- (void)setPendingFetchedRecords:(id)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStoreIdentifiersWithChangedValuesDuringFetchChanges:(id)a3;
- (void)setStoreType:(int64_t)a3;
- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
- (void)synchronizeAllStoresWithCompletionHandler:(id)a3;
- (void)synchronizeStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)synchronizeStoresWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)willBeginFetchingChanges;
- (void)zoneWithIDWasPurged:(id)a3;
@end

@implementation SYDSyncManager

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYDSyncManager *)self engine];

  if (v8 == v6)
  {
    v28 = self;
    v10 = [v7 options];
    v11 = [v10 scope];

    v12 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100010FB4();
    }
    id v29 = v7;

    v13 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = [v6 state];
    v15 = [v14 pendingRecordZoneChanges];

    id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v21 = [v20 recordID];
          unsigned int v22 = [v11 containsRecordID:v21];

          if (v22) {
            [v13 addObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    v23 = objc_opt_new();
    id v24 = objc_alloc((Class)CKSyncEngineRecordZoneChangeBatch);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001CEC8;
    v30[3] = &unk_100051288;
    v30[4] = v28;
    id v31 = v23;
    id v25 = v23;
    id v9 = [v24 initWithPendingChanges:v13 recordProvider:v30];
    v26 = [v6 state];
    [v26 removePendingRecordZoneChanges:v25];

    id v7 = v29;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (BOOL)shouldRetryAfterModifyError:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [v4 code];
  if (v5 == (id)2)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001B3E0;
    v10[3] = &unk_1000511E8;
    v10[4] = self;
    v10[5] = &v11;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else if (v5 == (id)14 || v5 == (id)26)
  {
    BOOL v6 = 1;
    *((unsigned char *)v12 + 24) = 1;
  }
  else
  {
    BOOL v6 = 0;
    *((unsigned char *)v12 + 24) = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (NSMutableSet)storeIdentifiersWithChangedValuesDuringFetchChanges
{
  return self->_storeIdentifiersWithChangedValuesDuringFetchChanges;
}

- (void)processPendingFetchedRecordsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDSyncManager *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(SYDSyncManager *)self pendingFetchedRecords];
  if ([v6 count])
  {
  }
  else
  {
    id v7 = [(SYDSyncManager *)self pendingDeletedRecordIDs];
    id v8 = [v7 count];

    if (!v8) {
      goto LABEL_7;
    }
  }
  id v9 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100032F58();
  }

  v10 = [(SYDSyncManager *)self pendingFetchedRecords];
  uint64_t v11 = [(SYDSyncManager *)self pendingDeletedRecordIDs];
  [(SYDSyncManager *)self processFetchedRecords:v10 deletedRecordIDs:v11];

  v12 = [(SYDSyncManager *)self pendingFetchedRecords];
  [v12 removeAllObjects];

  uint64_t v13 = [(SYDSyncManager *)self pendingDeletedRecordIDs];
  [v13 removeAllObjects];

LABEL_7:
}

- (NSMutableArray)pendingFetchedRecords
{
  return self->_pendingFetchedRecords;
}

- (NSMutableArray)pendingDeletedRecordIDs
{
  return self->_pendingDeletedRecordIDs;
}

- (void)fetchChangesFromCloudForStoreIdentifiers:(id)a3 group:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v38 = 0;
  uint64_t v11 = [(SYDSyncManager *)self engineWithError:&v38];
  id v12 = v38;
  uint64_t v13 = v12;
  if (v11 && !v12)
  {
    id v14 = [v8 count];
    v15 = SYDGetCloudKitLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16) {
        sub_100006B80(v8);
      }

      id v17 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v15 = v8;
      id v18 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v18)
      {
        id v19 = v18;
        id v27 = v9;
        id v28 = v8;
        uint64_t v20 = *(void *)v32;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v15);
            }
            unsigned int v22 = sub_100006A2C(*(void **)(*((void *)&v31 + 1) + 8 * i));
            [v17 addObject:v22];
          }
          id v19 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v19);
        id v9 = v27;
        id v8 = v28;
      }
    }
    else
    {
      if (v16) {
        sub_100031BD8();
      }
      id v17 = 0;
    }

    id v25 = [objc_alloc((Class)CKSyncEngineFetchChangesScope) initWithZoneIDs:v17];
    id v26 = [objc_alloc((Class)CKSyncEngineFetchChangesOptions) initWithScope:v25];
    [v26 setOperationGroup:v9];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100004424;
    v29[3] = &unk_100051198;
    v29[4] = self;
    id v30 = v10;
    [v11 fetchChangesWithOptions:v26 completionHandler:v29];

    goto LABEL_22;
  }
  v23 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_100031B70();
  }

  if (v10)
  {
    id v24 = [(SYDSyncManager *)self callbackQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B388;
    block[3] = &unk_1000510D0;
    id v37 = v10;
    id v36 = v13;
    dispatch_async(v24, block);

    id v17 = v37;
LABEL_22:
  }
}

- (void)savePendingChangesToCloudForStoreIdentifiers:(id)a3 group:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v45 = 0;
  uint64_t v11 = [(SYDSyncManager *)self engineWithError:&v45];
  id v12 = v45;
  uint64_t v13 = v12;
  if (v11 && !v12)
  {
    id v14 = [v8 count];
    v15 = SYDGetCloudKitLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16) {
        sub_100006AF4(v8);
      }

      id v17 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v15 = v8;
      id v18 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v18)
      {
        id v19 = v18;
        id v30 = v9;
        id v31 = v8;
        uint64_t v20 = *(void *)v39;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v39 != v20) {
              objc_enumerationMutation(v15);
            }
            unsigned int v22 = sub_100006A2C(*(void **)(*((void *)&v38 + 1) + 8 * i));
            [v17 addObject:v22];
          }
          id v19 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v19);
        id v9 = v30;
        id v8 = v31;
      }
    }
    else
    {
      if (v16) {
        sub_100031B3C();
      }
      id v17 = 0;
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100004D58;
    v36[3] = &unk_100051120;
    v36[4] = self;
    id v37 = v10;
    id v25 = objc_retainBlock(v36);
    id v26 = [objc_alloc((Class)CKSyncEngineSendChangesScope) initWithZoneIDs:v17];
    id v27 = [objc_alloc((Class)CKSyncEngineSendChangesOptions) initWithScope:v26];
    [v27 setOperationGroup:v9];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100004C08;
    v32[3] = &unk_100051170;
    v32[4] = self;
    id v33 = v11;
    id v34 = v27;
    id v35 = v25;
    id v28 = v25;
    id v29 = v27;
    [v33 sendChangesWithOptions:v29 completionHandler:v32];

    goto LABEL_22;
  }
  v23 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_100031AD4();
  }

  if (v10)
  {
    id v24 = [(SYDSyncManager *)self callbackQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B354;
    block[3] = &unk_1000510D0;
    id v44 = v10;
    id v43 = v13;
    dispatch_async(v24, block);

    id v17 = v44;
LABEL_22:
  }
}

- (id)objectForKey:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(SYDSyncManager *)self validateKey:v8 error:a5])
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = sub_100010EF4;
    id v28 = sub_100010EAC;
    id v29 = 0;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_100010EF4;
    unsigned int v22 = sub_100010EAC;
    id v23 = 0;
    id v10 = [(SYDSyncManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F858;
    block[3] = &unk_100050FB8;
    void block[4] = self;
    id v14 = v8;
    id v15 = v9;
    BOOL v16 = &v24;
    id v17 = &v18;
    dispatch_sync(v10, block);

    if (a5) {
      *a5 = (id) v25[5];
    }
    id v11 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)validateKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  if (v5 && [v5 length])
  {
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    id v7 = +[NSString stringWithFormat:@"Invalid key parameter provided"];
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    id v11 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    *a4 = +[NSError errorWithDomain:@"SyncedDefaults" code:2222 userInfo:v8];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (SYDCoreDataStore)coreDataStore
{
  return self->_coreDataStore;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(SYDSyncManager *)self container];
  BOOL v6 = [(SYDSyncManager *)self coreDataStore];
  id v7 = sub_10000AC60([(SYDSyncManager *)self storeType]);
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; container=%@ coreDataStore=%@ storeType=%@",
    v4,
    self,
    v5,
    v6,
  id v8 = v7);

  id v9 = [(SYDSyncManager *)self personaUniqueString];
  [v8 appendFormat:@" personaUniqueString=%@", v9];

  [v8 appendString:@">"];
  return (NSString *)v8;
}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYDSyncManager *)self engine];

  if (v8 == v6)
  {
    id v9 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10000983C();
    }

    switch((unint64_t)[v7 type])
    {
      case 0uLL:
        NSErrorUserInfoKey v10 = [v7 stateUpdateEvent];
        id v11 = [v10 stateSerialization];
        [(SYDSyncManager *)self handleSyncEngineStateUpdate:v11];
        goto LABEL_66;
      case 1uLL:
        NSErrorUserInfoKey v10 = [v7 accountChangeEvent];
        id v11 = [v10 previousUser];
        id v12 = [v10 currentUser];
        [(SYDSyncManager *)self syncEngine:v6 accountChangedFromUserRecordID:v11 toUserRecordID:v12];
        goto LABEL_65;
      case 2uLL:
        NSErrorUserInfoKey v10 = [v7 fetchedDatabaseChangesEvent];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v11 = [v10 deletions];
        id v13 = [v11 countByEnumeratingWithState:&v79 objects:v89 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v80;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v80 != v15) {
                objc_enumerationMutation(v11);
              }
              id v17 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              if ([v17 reason] == (id)1)
              {
                uint64_t v18 = [v17 zoneID];
                [(SYDSyncManager *)self zoneWithIDWasPurged:v18];
              }
            }
            id v14 = [v11 countByEnumeratingWithState:&v79 objects:v89 count:16];
          }
          while (v14);
        }
        goto LABEL_66;
      case 3uLL:
        NSErrorUserInfoKey v10 = [v7 fetchedRecordZoneChangesEvent];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v19 = [v10 modifications];
        id v20 = [v19 countByEnumeratingWithState:&v75 objects:v88 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v76;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v76 != v22) {
                objc_enumerationMutation(v19);
              }
              [(SYDSyncManager *)self didFetchRecord:*(void *)(*((void *)&v75 + 1) + 8 * (void)j)];
            }
            id v21 = [v19 countByEnumeratingWithState:&v75 objects:v88 count:16];
          }
          while (v21);
        }

        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v11 = [v10 deletions];
        id v24 = [v11 countByEnumeratingWithState:&v71 objects:v87 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v72;
          do
          {
            for (k = 0; k != v25; k = (char *)k + 1)
            {
              if (*(void *)v72 != v26) {
                objc_enumerationMutation(v11);
              }
              id v28 = *(void **)(*((void *)&v71 + 1) + 8 * (void)k);
              id v29 = [v28 recordID];
              id v30 = [v28 recordType];
              [(SYDSyncManager *)self didFetchRecordDeletion:v29 recordType:v30];
            }
            id v25 = [v11 countByEnumeratingWithState:&v71 objects:v87 count:16];
          }
          while (v25);
        }
        goto LABEL_66;
      case 4uLL:
        NSErrorUserInfoKey v10 = [v7 sentDatabaseChangesEvent];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v11 = [v10 deletedZoneIDs];
        id v31 = [v11 countByEnumeratingWithState:&v67 objects:v86 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v68;
          do
          {
            for (m = 0; m != v32; m = (char *)m + 1)
            {
              if (*(void *)v68 != v33) {
                objc_enumerationMutation(v11);
              }
              [(SYDSyncManager *)self didDeleteRecordZoneWithID:*(void *)(*((void *)&v67 + 1) + 8 * (void)m)];
            }
            id v32 = [v11 countByEnumeratingWithState:&v67 objects:v86 count:16];
          }
          while (v32);
        }
        goto LABEL_66;
      case 5uLL:
        NSErrorUserInfoKey v10 = [v7 sentRecordZoneChangesEvent];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v35 = [v10 savedRecords];
        id v36 = [v35 countByEnumeratingWithState:&v63 objects:v85 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v64;
          do
          {
            for (n = 0; n != v37; n = (char *)n + 1)
            {
              if (*(void *)v64 != v38) {
                objc_enumerationMutation(v35);
              }
              [(SYDSyncManager *)self didSaveRecord:*(void *)(*((void *)&v63 + 1) + 8 * (void)n)];
            }
            id v37 = [v35 countByEnumeratingWithState:&v63 objects:v85 count:16];
          }
          while (v37);
        }

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v40 = [v10 deletedRecordIDs];
        id v41 = [v40 countByEnumeratingWithState:&v59 objects:v84 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v43 = *(void *)v60;
          do
          {
            for (ii = 0; ii != v42; ii = (char *)ii + 1)
            {
              if (*(void *)v60 != v43) {
                objc_enumerationMutation(v40);
              }
              [(SYDSyncManager *)self didDeleteRecordWithID:*(void *)(*((void *)&v59 + 1) + 8 * (void)ii)];
            }
            id v42 = [v40 countByEnumeratingWithState:&v59 objects:v84 count:16];
          }
          while (v42);
        }

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v45 = [v10 failedRecordSaves];
        id v46 = [v45 countByEnumeratingWithState:&v55 objects:v83 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v56;
          do
          {
            for (jj = 0; jj != v47; jj = (char *)jj + 1)
            {
              if (*(void *)v56 != v48) {
                objc_enumerationMutation(v45);
              }
              v50 = *(void **)(*((void *)&v55 + 1) + 8 * (void)jj);
              v51 = [v50 record];
              v52 = [v50 error];
              [(SYDSyncManager *)self didFailToSaveRecord:v51 error:v52];
            }
            id v47 = [v45 countByEnumeratingWithState:&v55 objects:v83 count:16];
          }
          while (v47);
        }

        id v11 = [v10 failedRecordDeletes];
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_10001C974;
        v54[3] = &unk_100051260;
        v54[4] = self;
        [v11 enumerateKeysAndObjectsUsingBlock:v54];
        goto LABEL_66;
      case 6uLL:
        [(SYDSyncManager *)self willBeginFetchingChanges];
        break;
      case 8uLL:
        NSErrorUserInfoKey v10 = [v7 didFetchRecordZoneChangesEvent];
        v53 = [v10 error];

        if (!v53) {
          goto LABEL_67;
        }
        id v11 = [v10 zoneID];
        id v12 = [v10 error];
        [(SYDSyncManager *)self didFailToFetchChangesForRecordZoneID:v11 error:v12];
LABEL_65:

LABEL_66:
LABEL_67:

        break;
      case 9uLL:
        [(SYDSyncManager *)self didEndFetchingChanges];
        break;
      default:
        break;
    }
  }
}

- (int64_t)storeType
{
  return self->_storeType;
}

- (CKSyncEngine)engine
{
  id v7 = 0;
  v2 = [(SYDSyncManager *)self engineWithError:&v7];
  id v3 = v7;
  id v4 = v3;
  if (!v2 || v3)
  {
    id v5 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100031438();
    }
  }
  return (CKSyncEngine *)v2;
}

- (id)engineWithError:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  engine = v4->_engine;
  if (!engine)
  {
    [(SYDSyncManager *)v4 initializeSyncEngineWithError:a3];
    engine = v4->_engine;
  }
  id v6 = engine;
  objc_sync_exit(v4);

  return v6;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)willBeginFetchingChanges
{
  id v3 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005648;
  block[3] = &unk_100050A50;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)synchronizeStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v10, 0);
  unsigned __int8 v8 = [v10 isEqualToString:@"com.apple.sbd3"];
  CFStringRef v9 = @"com.apple.security.cloudkeychainproxy3";
  if ((v8 & 1) == 0)
  {
    if (![v10 isEqualToString:@"com.apple.security.cloudkeychainproxy3"]) {
      goto LABEL_5;
    }
    CFStringRef v9 = @"com.apple.sbd3";
  }
  [v7 addObject:v9];
LABEL_5:
  [(SYDSyncManager *)self synchronizeStoresWithIdentifiers:v7 completionHandler:v6];
}

- (void)synchronizeStoresWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "kvs/sync-store", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  CFStringRef v9 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000EFB8();
  }

  id v10 = objc_alloc_init((Class)CKOperationGroup);
  [v10 setName:@"ManualSync"];
  id v11 = +[NSSet setWithObjects:@"com.apple.sbd3", @"com.apple.security.cloudkeychainproxy3", 0];
  id v12 = +[NSSet setWithArray:v6];
  unsigned int v13 = [v11 intersectsSet:v12];

  if (v13)
  {
    id v14 = [v10 defaultConfiguration];
    [v14 setIsCloudKitSupportOperation:1];
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100010EF4;
  v26[4] = sub_100010EAC;
  id v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100006130;
  v19[3] = &unk_100051058;
  id v25 = v26;
  uint64_t v15 = v8;
  id v20 = v15;
  id v16 = v7;
  id v24 = v16;
  id v21 = self;
  id v17 = v6;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  [(SYDSyncManager *)self fetchChangesFromCloudForStoreIdentifiers:v17 group:v18 completionHandler:v19];

  _Block_object_dispose(v26, 8);
  os_activity_scope_leave(&state);
}

- (void)didEndFetchingChanges
{
  id v3 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005410;
  block[3] = &unk_100050A50;
  void block[4] = self;
  dispatch_async(v3, block);
}

+ (BOOL)shouldIgnoreFetchError:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  id v5 = [v4 code];
  if (v5 == (id)2)
  {
    id v7 = [v4 userInfo];
    unsigned __int8 v8 = [v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001B39C;
    v10[3] = &unk_1000511C0;
    v10[4] = &v11;
    v10[5] = a1;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else if (v5 == (id)26 || v5 == (id)28)
  {
    BOOL v6 = 1;
    *((unsigned char *)v12 + 24) = 1;
  }
  else
  {
    BOOL v6 = 0;
    *((unsigned char *)v12 + 24) = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (SYDSyncManager)initWithContainer:(id)a3 coreDataStore:(id)a4 storeType:(int64_t)a5 testConfiguration:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v41 = +[NSAssertionHandler currentHandler];
    id v42 = (objc_class *)objc_opt_class();
    id v45 = NSStringFromClass(v42);
    [v41 handleFailureInMethod:a2, self, @"SYDSyncManager.m", 70, @"Must specify a container for %@", v45 object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  uint64_t v43 = +[NSAssertionHandler currentHandler];
  id v44 = (objc_class *)objc_opt_class();
  id v46 = NSStringFromClass(v44);
  [v43 handleFailureInMethod:a2, self, @"SYDSyncManager.m", 71, @"Must specify a database URL for %@", v46 object file lineNumber description];

LABEL_3:
  v47.receiver = self;
  v47.super_class = (Class)SYDSyncManager;
  uint64_t v15 = [(SYDSyncManager *)&v47 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_coreDataStore, a4);
    objc_storeStrong((id *)&v16->_container, a3);
    v16->_storeType = a5;
    objc_storeStrong((id *)&v16->_testConfiguration, a6);
    if (sub_10000AD74())
    {
      id v17 = +[UMUserPersona currentPersona];
      id v18 = [v17 userPersonaUniqueString];
      id v19 = (NSString *)[v18 copy];
      personaUniqueString = v16->_personaUniqueString;
      v16->_personaUniqueString = v19;
    }
    id v21 = [v12 containerIdentifier];
    id v22 = +[NSString stringWithFormat:@"com.apple.kvs.sync-manager.%@", v21];

    id v23 = v22;
    id v24 = (const char *)[v23 UTF8String];
    id v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v26 = dispatch_queue_create(v24, v25);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v26;

    id v28 = [v23 stringByAppendingString:@".callback"];
    id v29 = (const char *)[v28 UTF8String];
    id v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v31 = dispatch_queue_create(v29, v30);
    callbackQueue = v16->_callbackQueue;
    v16->_callbackQueue = (OS_dispatch_queue *)v31;

    uint64_t v33 = +[NSMutableSet set];
    storeIdentifiersWithChangedValuesDuringFetchChanges = v16->_storeIdentifiersWithChangedValuesDuringFetchChanges;
    v16->_storeIdentifiersWithChangedValuesDuringFetchChanges = (NSMutableSet *)v33;

    uint64_t v35 = +[NSMutableArray array];
    pendingFetchedRecords = v16->_pendingFetchedRecords;
    v16->_pendingFetchedRecords = (NSMutableArray *)v35;

    uint64_t v37 = +[NSMutableArray array];
    pendingDeletedRecordIDs = v16->_pendingDeletedRecordIDs;
    v16->_pendingDeletedRecordIDs = (NSMutableArray *)v37;

    v16->_maxPendingFetchedRecords = 50;
    [(SYDSyncManager *)v16 initializeSyncEngineWithError:0];
    [(SYDSyncManager *)v16 registerForFirstUnlockNotificationsIfNecessary];
    long long v39 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      sub_1000312CC();
    }
  }
  return v16;
}

- (void)dealloc
{
  if ([(SYDSyncManager *)self mobileKeybagNotifyToken] != -1) {
    notify_cancel([(SYDSyncManager *)self mobileKeybagNotifyToken]);
  }
  v3.receiver = self;
  v3.super_class = (Class)SYDSyncManager;
  [(SYDSyncManager *)&v3 dealloc];
}

- (BOOL)initializeSyncEngineWithError:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  coreDataStore = v4->_coreDataStore;
  id v23 = 0;
  BOOL v6 = [(SYDCoreDataStore *)coreDataStore syncEngineStateSerializationWithError:&v23];
  unint64_t v7 = (unint64_t)v23;
  if (v6)
  {
    id v22 = (id)v7;
    uint64_t v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v22];
    id v9 = v22;

    if (v9)
    {
      id v10 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000313D0();
      }

LABEL_14:
      id v13 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100031368();
      }
      BOOL v14 = 0;
      goto LABEL_20;
    }
    unint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (id)v7;
  if (!(v7 | v8))
  {
    uint64_t v11 = v4->_coreDataStore;
    id v21 = 0;
    id v12 = [(SYDCoreDataStore *)v11 deprecatedSyncEngineMetadataWithError:&v21];
    id v9 = v21;
    if (v12) {
      uint64_t v8 = (uint64_t)[objc_alloc((Class)CKSyncEngineStateSerialization) initWithDeprecatedData:v12];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  if (v9) {
    goto LABEL_14;
  }
  uint64_t v15 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100031334();
  }

  id v16 = objc_alloc((Class)CKSyncEngineConfiguration);
  id v17 = [(CKContainer *)v4->_container privateCloudDatabase];
  id v13 = [v16 initWithDatabase:v17 stateSerialization:v8 delegate:v4];

  [v13 setApsMachServiceName:@"com.apple.aps.kvsd"];
  id v18 = (CKSyncEngine *)[objc_alloc((Class)CKSyncEngine) initWithConfiguration:v13];
  engine = v4->_engine;
  v4->_engine = v18;

  id v9 = 0;
  BOOL v14 = 1;
LABEL_20:

  if (a3) {
    *a3 = v9;
  }

  objc_sync_exit(v4);
  return v14;
}

- (BOOL)useUUIDRecordNames
{
  return (char *)[(SYDSyncManager *)self storeType] - 1 < (char *)3;
}

- (BOOL)useSyncAnchor
{
  return (char *)[(SYDSyncManager *)self storeType] - 4 < (char *)0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)shouldSyncStoreWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYDSyncManager *)self delegate];
  if (v5
    && (BOOL v6 = (void *)v5,
        [(SYDSyncManager *)self delegate],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = [(SYDSyncManager *)self delegate];
    unsigned __int8 v10 = [v9 syncManager:self shouldSyncStoreWithIdentifier:v4];
  }
  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 excludeFromChangeTracking:(BOOL)a6 enforceQuota:(BOOL)a7 error:(id *)a8
{
  return [(SYDSyncManager *)self setObject:a3 forKey:a4 inStoreWithIdentifier:a5 excludeFromChangeTracking:a6 enforceQuota:a7 didChangeValue:0 error:a8];
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 excludeFromChangeTracking:(BOOL)a6 enforceQuota:(BOOL)a7 didChangeValue:(BOOL *)a8 error:(id *)a9
{
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (![(SYDSyncManager *)self validateKey:v16 error:a9]) {
    goto LABEL_11;
  }
  if (!v15)
  {
    unsigned __int8 v19 = [(SYDSyncManager *)self removeObjectForKey:v16 inStoreWithIdentifier:v17 excludeFromChangeTracking:v11 didRemoveValue:a8 error:a9];
    goto LABEL_12;
  }
  if (!+[NSPropertyListSerialization propertyList:v15 isValidForFormat:200])
  {
    id v20 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v20);
    +[NSException raise:NSInvalidArgumentException, @"Attempted to insert invalid value '%@' of class '%@'", v15, v21 format];

LABEL_11:
    unsigned __int8 v19 = 0;
    goto LABEL_12;
  }
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_100010EF4;
  id v36 = sub_100010EAC;
  id v37 = 0;
  id v18 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A5B8;
  block[3] = &unk_100050FE0;
  id v24 = v15;
  id v25 = v16;
  id v26 = v17;
  id v27 = self;
  id v28 = &v32;
  id v29 = &v38;
  BOOL v30 = v11;
  BOOL v31 = a7;
  dispatch_sync(v18, block);

  if (a9) {
    *a9 = (id) v33[5];
  }
  if (a8) {
    *a8 = *((unsigned char *)v39 + 24);
  }
  unsigned __int8 v19 = v33[5] == 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
LABEL_12:

  return v19;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 error:(id *)a6
{
  return [(SYDSyncManager *)self setObject:a3 forKey:a4 inStoreWithIdentifier:a5 excludeFromChangeTracking:1 enforceQuota:1 error:a6];
}

- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 error:(id *)a6
{
  return [(SYDSyncManager *)self removeObjectForKey:a3 inStoreWithIdentifier:a4 excludeFromChangeTracking:a5 didRemoveValue:0 error:a6];
}

- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 didRemoveValue:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  if ([(SYDSyncManager *)self validateKey:v12 error:a7])
  {
    uint64_t v30 = 0;
    BOOL v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = sub_100010EF4;
    id v28 = sub_100010EAC;
    id v29 = 0;
    BOOL v14 = [(SYDSyncManager *)self queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001AD8C;
    v17[3] = &unk_100051008;
    id v18 = v12;
    id v19 = v13;
    id v20 = self;
    id v21 = &v24;
    id v22 = &v30;
    BOOL v23 = a5;
    dispatch_sync(v14, v17);

    if (a7) {
      *a7 = (id) v25[5];
    }
    if (a6) {
      *a6 = *((unsigned char *)v31 + 24);
    }
    BOOL v15 = v25[5] == 0;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  return [(SYDSyncManager *)self removeObjectForKey:a3 inStoreWithIdentifier:a4 excludeFromChangeTracking:1 error:a5];
}

- (void)synchronizeAllStoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100031AA0();
  }

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100010EF4;
  v10[4] = sub_100010EAC;
  id v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001B1F8;
  v7[3] = &unk_1000510A8;
  id v9 = v10;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(SYDSyncManager *)self fetchChangesFromCloudForAllStoresWithCompletionHandler:v7];

  _Block_object_dispose(v10, 8);
}

- (void)savePendingChangesToCloudForAllStoresWithCompletionHandler:(id)a3
{
}

- (void)fetchChangesFromCloudForAllStoresWithCompletionHandler:(id)a3
{
}

- (void)deleteDataFromCloudWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting data from cloud for %@", buf, 0xCu);
  }

  id v6 = [(SYDSyncManager *)self engine];
  unint64_t v7 = [v6 database];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B564;
  v9[3] = &unk_100051238;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 fetchAllRecordZonesWithCompletionHandler:v9];
}

- (id)recordIDForKey:(id)a3 inStoreWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SYDSyncManager *)self coreDataStore];
  id v9 = [v8 keyValueForKey:v7 inStoreWithIdentifier:v6 createIfNecessary:0 error:0];

  id v10 = [v9 recordID];

  return v10;
}

- (void)setAutomaticSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SYDSyncManager *)self engine];
  [v4 setAutomaticSyncingEnabled:v3];
}

- (BOOL)isAutomaticSyncingEnabled
{
  v2 = [(SYDSyncManager *)self engine];
  unsigned __int8 v3 = [v2 isAutomaticSyncingEnabled];

  return v3;
}

- (BOOL)hasPendingChangesToUpload
{
  v2 = [(SYDSyncManager *)self engine];
  unsigned __int8 v3 = [v2 state];

  id v4 = [v3 pendingRecordZoneChanges];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 pendingDatabaseChanges];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

- (id)newRecordNameForKey:(id)a3
{
  id v4 = a3;
  if ([(SYDSyncManager *)self useUUIDRecordNames])
  {
    BOOL v5 = +[NSUUID UUID];
    id v6 = [v5 UUIDString];
    id v7 = +[NSString stringWithFormat:@"%@%@", @"KeyValue:", v6];
  }
  else
  {
    id v7 = +[SYDKeyValue recordNameForUnencryptedKey:v4];
  }

  return v7;
}

- (void)markAllKeyValuesAsNeedingToBeUploaded
{
  unsigned __int8 v3 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BC04;
  block[3] = &unk_100050A50;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SYDSyncManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100031E48();
  }

  id v7 = [(SYDSyncManager *)self coreDataStore];
  id v27 = 0;
  id v8 = [v7 allRecordNamesInStoreWithIdentifier:v4 error:&v27];
  id v9 = v27;

  if (v9)
  {
    id v10 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031DE0();
    }
  }
  else
  {
    id v21 = self;
    id v10 = sub_100006A2C(v4);
    id v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v18 = (char *)[v17 length];
          if ((unint64_t)(v18 - 256) > 0xFFFFFFFFFFFFFF00)
          {
            id v20 = [objc_alloc((Class)CKRecordID) initWithRecordName:v17 zoneID:v10];
            [v11 addObject:v20];
          }
          else
          {
            id v19 = v18;
            id v20 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              id v29 = v19;
              __int16 v30 = 2112;
              id v31 = v4;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Excluding key from cloud storage due to key length of (%ld) UTF-16 code units in store (%@)", buf, 0x16u);
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v14);
    }

    if ([v11 count]) {
      [(SYDSyncManager *)v21 addKeyValueRecordIDsToSave:v11 recordIDsToDelete:0 storeIdentifier:v4];
    }

    id v9 = 0;
    id v8 = v22;
  }
}

- (void)addPendingDatabaseChanges:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SYDSyncManager *)self shouldSyncStoreWithIdentifier:v7])
  {
    id v8 = [(SYDSyncManager *)self engine];
    id v9 = [v8 state];
    [v9 addPendingDatabaseChanges:v6];
  }
  else
  {
    id v8 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100031EB0();
    }
  }
}

- (void)addKeyValueRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 storeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SYDSyncManager *)self shouldSyncStoreWithIdentifier:v10])
  {
    id v46 = v10;
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v8, "count") + (void)objc_msgSend(v9, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v48 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v66;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v66 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [objc_alloc((Class)CKSyncEnginePendingRecordZoneChange) initWithRecordID:*(void *)(*((void *)&v65 + 1) + 8 * (void)v16) type:0];
          [v11 addObject:v17];

          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v14);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v47 = v9;
    id v18 = v9;
    id v19 = [v18 countByEnumeratingWithState:&v61 objects:v72 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v62;
      do
      {
        id v22 = 0;
        do
        {
          if (*(void *)v62 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [objc_alloc((Class)CKSyncEnginePendingRecordZoneChange) initWithRecordID:*(void *)(*((void *)&v61 + 1) + 8 * (void)v22) type:1];
          [v11 addObject:v23];

          id v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v61 objects:v72 count:16];
      }
      while (v20);
    }

    long long v24 = [(SYDSyncManager *)self engine];
    long long v25 = [v24 state];
    [v25 addPendingRecordZoneChanges:v11];

    long long v26 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", (char *)[v12 count] + (void)objc_msgSend(v18, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v27 = v12;
    id v28 = [v27 countByEnumeratingWithState:&v57 objects:v71 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v58;
      do
      {
        id v31 = 0;
        do
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)v31) zoneID];
          char v33 = [v32 zoneName];
          [v26 addObject:v33];

          id v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        id v29 = [v27 countByEnumeratingWithState:&v57 objects:v71 count:16];
      }
      while (v29);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v34 = v18;
    id v35 = [v34 countByEnumeratingWithState:&v53 objects:v70 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v54;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v54 != v37) {
            objc_enumerationMutation(v34);
          }
          long long v39 = [*(id *)(*((void *)&v53 + 1) + 8 * (void)v38) zoneID];
          uint64_t v40 = [v39 zoneName];
          [v26 addObject:v40];

          uint64_t v38 = (char *)v38 + 1;
        }
        while (v36 != v38);
        id v36 = [v34 countByEnumeratingWithState:&v53 objects:v70 count:16];
      }
      while (v36);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v41 = v26;
    id v42 = [v41 countByEnumeratingWithState:&v49 objects:v69 count:16];
    id v9 = v47;
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v50;
      do
      {
        id v45 = 0;
        do
        {
          if (*(void *)v50 != v44) {
            objc_enumerationMutation(v41);
          }
          [(SYDSyncManager *)self addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:*(void *)(*((void *)&v49 + 1) + 8 * (void)v45)];
          id v45 = (char *)v45 + 1;
        }
        while (v43 != v45);
        id v43 = [v41 countByEnumeratingWithState:&v49 objects:v69 count:16];
      }
      while (v43);
    }

    id v8 = v48;
    id v10 = v46;
  }
  else
  {
    id v11 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100031F18();
    }
  }
}

- (void)addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:(id)a3
{
  id v4 = a3;
  if (![(SYDSyncManager *)self shouldSyncStoreWithIdentifier:v4])
  {
    BOOL v5 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100031F80();
    }
    goto LABEL_6;
  }
  if ([(SYDSyncManager *)self useSyncAnchor])
  {
    BOOL v5 = sub_100018BEC(v4);
    id v6 = [(SYDSyncManager *)self engine];
    id v7 = [v6 state];
    id v8 = [objc_alloc((Class)CKSyncEnginePendingRecordZoneChange) initWithRecordID:v5 type:0];
    id v10 = v8;
    id v9 = +[NSArray arrayWithObjects:&v10 count:1];
    [v7 addPendingRecordZoneChanges:v9];

LABEL_6:
  }
}

- (void)resetSyncEngine
{
  unsigned __int8 v3 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C79C;
  block[3] = &unk_100050A50;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)resetSyncEngineWithContainer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SYDSyncManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C858;
  v7[3] = &unk_100050AA0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_queue_resetSyncEngine
{
  unsigned __int8 v3 = [(SYDSyncManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100032060();
  }

  BOOL v5 = [(SYDSyncManager *)self coreDataStore];
  [v5 saveSyncEngineStateSerialization:0 error:0];

  engine = self->_engine;
  self->_engine = 0;

  [(SYDSyncManager *)self initializeSyncEngineWithError:0];
}

- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (!a4 && v7)
  {
    id v9 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Detected a newUserRecordID: %@ Marking everything to be re-uploaded", (uint8_t *)&v10, 0xCu);
    }

    [(SYDSyncManager *)self markAllKeyValuesAsNeedingToBeUploaded];
  }
}

- (void)didFailToFetchChangesForRecordZoneID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CB28;
  block[3] = &unk_100050B90;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (BOOL)isIdentityLostError:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [v4 code];
  if (v5 == (id)2)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001CD40;
    v10[3] = &unk_1000511E8;
    v10[4] = self;
    void v10[5] = &v11;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else if (v5 == (id)112)
  {
    BOOL v6 = 1;
    *((unsigned char *)v12 + 24) = 1;
  }
  else
  {
    BOOL v6 = 0;
    *((unsigned char *)v12 + 24) = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_markZoneForDeletionOnManateeFailureForRecordZoneID:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Missing Manatee identity fetching %@, deleting the zone now", buf, 0xCu);
  }

  BOOL v6 = [v4 zoneName];
  id v7 = [objc_alloc((Class)CKSyncEnginePendingZoneDelete) initWithZoneID:v4];
  id v10 = v7;
  id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  [(SYDSyncManager *)self addPendingDatabaseChanges:v8 storeIdentifier:v6];

  id v9 = [(SYDSyncManager *)self coreDataStore];
  [v9 clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:v6 error:0];
}

- (id)recordToSaveForRecordID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100032284(v6);
  }

  id v8 = [v6 zoneID];
  id v9 = [v8 zoneName];

  id v10 = [v6 recordName];
  unsigned int v11 = [v10 isEqual:@"syncAnchor"];

  id v12 = [(SYDSyncManager *)self coreDataStore];
  uint64_t v13 = v12;
  if (v11)
  {
    id v25 = 0;
    char v14 = [v12 serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier:v9 error:&v25];
    id v15 = v25;

    if (v15)
    {
      id v16 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000321B4();
      }
LABEL_10:

      id v18 = 0;
      goto LABEL_11;
    }
    if (v14)
    {
      id v24 = 0;
      id v21 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v14 error:&v24];
      id v15 = v24;
      id v18 = [objc_alloc((Class)CKRecord) initWithCoder:v21];
      if (v15)
      {
        id v22 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10003214C();
        }
      }
    }
    else
    {
      id v18 = [objc_alloc((Class)CKRecord) initWithRecordType:@"KVSSyncAnchorRecord" recordID:v6];
      id v15 = 0;
    }
  }
  else
  {
    id v17 = [v6 recordName];
    id v23 = 0;
    char v14 = [v13 keyValueForRecordName:v17 inStoreWithIdentifier:v9 error:&v23];
    id v15 = v23;

    if (v15)
    {
      id v16 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10003221C();
      }
      goto LABEL_10;
    }
    if (!v14)
    {
      id v16 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "No keyValue for recordID %@, so we're returning nothing", buf, 0xCu);
      }
      goto LABEL_10;
    }
    objc_msgSend(v14, "recordRepresentationForStoreType:", -[SYDSyncManager storeType](self, "storeType"));
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:

  if (a4) {
    *a4 = v15;
  }
  id v19 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_1000320C8(v18);
  }

  return v18;
}

- (void)didSaveRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDSyncManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D388;
  v7[3] = &unk_100050AA0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)didSaveKeyValueRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDSyncManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000324FC(v4);
  }

  id v7 = [v4 recordID];
  id v8 = [v7 zoneID];
  id v9 = [v8 zoneName];

  id v10 = [(SYDSyncManager *)self coreDataStore];
  unsigned int v11 = [v4 recordID];
  id v12 = [v11 recordName];
  id v24 = 0;
  uint64_t v13 = [v10 keyValueForRecordName:v12 inStoreWithIdentifier:v9 error:&v24];
  id v14 = v24;

  if (v14)
  {
    id v15 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100032494();
    }
LABEL_6:

    goto LABEL_7;
  }
  id v18 = SYDGetCloudKitLog();
  id v15 = v18;
  if (!v13)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_100032390(v4);
    }
    id v14 = 0;
    goto LABEL_6;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = objc_msgSend(v4, "syd_shortDescription");
    id v20 = [v13 key];
    *(_DWORD *)buf = 138413059;
    long long v26 = v19;
    __int16 v27 = 2160;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2113;
    uint64_t v30 = v20;
    __int16 v31 = 2112;
    uint64_t v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Saved record %@ for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x2Au);
  }
  [v13 setServerSystemFieldsRecord:v4];
  id v21 = [(SYDSyncManager *)self coreDataStore];
  id v23 = 0;
  unsigned __int8 v22 = [v21 saveKeyValue:v13 inStoreWithIdentifier:v9 excludeFromChangeTracking:0 enforceQuota:0 error:&v23];
  id v14 = v23;

  if ((v22 & 1) == 0)
  {
    id v15 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003242C();
    }
    goto LABEL_6;
  }
LABEL_7:
  +[SYDKeyValue deleteFilesForAssetsInKeyValueRecord:v4];
  id v16 = [v13 key];
  id v17 = [v13 value];
  +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:v9, @"Uploaded %@ = %@", v16, v17 format];
}

- (void)didFailToSaveRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D8D0;
  block[3] = &unk_100050B90;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)failedToSaveKeyValueRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYDSyncManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 recordID];
  id v10 = [v9 zoneID];
  unsigned int v11 = [v10 zoneName];

  uint64_t v12 = (uint64_t)[v7 code];
  if (v12 <= 109)
  {
    switch(v12)
    {
      case 3:
      case 4:
      case 6:
      case 7:
      case 9:
      case 20:
      case 23:
        goto LABEL_77;
      case 11:
        id v13 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = objc_msgSend(v6, "syd_shortDescription");
          *(_DWORD *)buf = 138412290;
          v102 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Unknown item saving key-value record, will re-upload %@", buf, 0xCu);
        }
        id v15 = [(SYDSyncManager *)self coreDataStore];
        id v16 = [v6 recordID];
        id v17 = [v16 recordName];
        id v89 = 0;
        id v18 = [v15 keyValueForRecordName:v17 inStoreWithIdentifier:v11 error:&v89];
        id v19 = v89;

        if (v19)
        {
          id v20 = SYDGetCloudKitLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100032A14();
          }
          goto LABEL_74;
        }
        if (v18)
        {
          [v18 setServerSystemFieldsRecord:0];
          long long v67 = [(SYDSyncManager *)self coreDataStore];
          id v88 = 0;
          unsigned int v68 = [v67 saveKeyValue:v18 inStoreWithIdentifier:v11 excludeFromChangeTracking:0 enforceQuota:0 error:&v88];
          id v19 = v88;

          if (v68)
          {
            id v20 = [v6 recordID];
            v98 = v20;
            long long v69 = +[NSArray arrayWithObjects:&v98 count:1];
            [(SYDSyncManager *)self addKeyValueRecordIDsToSave:v69 recordIDsToDelete:0 storeIdentifier:v11];
          }
          else
          {
            id v20 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_1000329AC();
            }
          }
          goto LABEL_74;
        }
        id v19 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_100032910(v6);
        }
        goto LABEL_75;
      case 14:
        uint64_t v28 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_10003288C(v6);
        }

        __int16 v29 = [v6 recordType];
        if ([v29 isEqualToString:@"KVSRecord"])
        {
        }
        else
        {
          id v46 = [v6 recordType];
          unsigned int v47 = [v46 isEqualToString:@"EncryptedKeyValue"];

          if (!v47) {
            goto LABEL_77;
          }
        }
        id v48 = [v7 userInfo];
        id v18 = [v48 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

        if (v18)
        {
          unsigned int v49 = +[SYDKeyValue keyValueRecordHasAssetWithoutFile:v18];
          long long v50 = SYDGetCloudKitLog();
          BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG);
          if (v49)
          {
            if (v51) {
              sub_100032754(v6);
            }

            long long v52 = +[SYDKeyValue recordFieldKeyForValueModificationDateInStoreType:[(SYDSyncManager *)self storeType]];
            uint64_t v53 = [v18 objectForKeyedSubscript:v52];
            long long v54 = (void *)v53;
            if (!v53)
            {
              long long v65 = SYDGetCloudKitLog();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
                sub_100032650();
              }
              goto LABEL_70;
            }
            long long v82 = v52;
            v85 = (void *)v53;
            long long v55 = [(SYDSyncManager *)self coreDataStore];
            long long v56 = [v6 recordID];
            long long v57 = [v56 recordName];
            id v91 = 0;
            long long v58 = [v55 keyValueForRecordName:v57 inStoreWithIdentifier:v11 error:&v91];
            v84 = v91;

            v83 = v58;
            if (v58)
            {
              long long v59 = [v58 valueModificationDate];
              id v60 = [v59 compare:v85];

              long long v61 = SYDGetCloudKitLog();
              long long v62 = v61;
              if (v60 == (id)1)
              {
                if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Taking the server system fields record from the server record even though we don't have the server's value", buf, 2u);
                }

                [v58 setServerSystemFieldsRecordIfNewer:v18];
                long long v63 = [(SYDSyncManager *)self coreDataStore];
                v90 = v84;
                unsigned __int8 v64 = [v63 saveKeyValue:v58 inStoreWithIdentifier:v11 excludeFromChangeTracking:0 enforceQuota:0 error:&v90];
                long long v65 = v90;

                if (v64)
                {
                  long long v54 = v85;
                  long long v52 = v82;
LABEL_69:

LABEL_70:
                  goto LABEL_71;
                }
                long long v62 = SYDGetCloudKitLog();
                long long v54 = v85;
                long long v52 = v82;
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                  sub_1000326EC();
                }
                v84 = v65;
LABEL_68:

                long long v65 = v84;
                goto LABEL_69;
              }
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                long long v79 = [v6 recordID];
                long long v81 = [v79 recordName];
                long long v80 = [v83 valueModificationDate];
                *(_DWORD *)buf = 138413058;
                v102 = v81;
                __int16 v103 = 2112;
                v104 = v80;
                __int16 v105 = 2112;
                long long v54 = v85;
                v106 = v85;
                __int16 v107 = 2112;
                v108 = v11;
                _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Unable to update local record recordName:%@ , keyValue.valueModificationDate:%@ , serverValueModificationDate:%@ in store:%@", buf, 0x2Au);

                goto LABEL_67;
              }
            }
            else
            {
              long long v62 = SYDGetCloudKitLog();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                sub_100032684();
              }
            }
            long long v54 = v85;
LABEL_67:
            long long v52 = v82;
            goto LABEL_68;
          }
          if (v51) {
            sub_1000327F0(v6);
          }

          v100 = v18;
          long long v52 = +[NSArray arrayWithObjects:&v100 count:1];
          [(SYDSyncManager *)self processFetchedRecords:v52 deletedRecordIDs:0];
        }
        else
        {
          long long v52 = SYDGetCloudKitLog();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            long long v70 = [v6 recordID];
            long long v71 = objc_msgSend(v70, "syd_shortDescription");
            *(_DWORD *)buf = 138412290;
            v102 = v71;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "No server record when resolving conflict saving record %@", buf, 0xCu);
          }
        }
LABEL_71:

        long long v72 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          long long v73 = [v6 recordID];
          long long v74 = [v73 recordName];
          *(_DWORD *)buf = 138412290;
          v102 = v74;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Attempting to save keyValue again after a conflict for recordName:%@", buf, 0xCu);
        }
        id v19 = [v6 recordID];
        v99 = v19;
        id v20 = +[NSArray arrayWithObjects:&v99 count:1];
        [(SYDSyncManager *)self addKeyValueRecordIDsToSave:v20 recordIDsToDelete:0 storeIdentifier:v11];
LABEL_74:

        break;
      case 22:
        uint64_t v30 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = objc_msgSend(v6, "syd_shortDescription");
          *(_DWORD *)buf = 138412290;
          v102 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Batch failure trying to save %@. Retrying eventually", buf, 0xCu);
        }
        id v18 = [v6 recordID];
        v94 = v18;
        uint64_t v32 = &v94;
        goto LABEL_34;
      case 26:
        char v33 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          id v34 = objc_msgSend(v6, "syd_shortDescription");
          *(_DWORD *)buf = 138412290;
          v102 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Zone not found saving %@. Saving zone and re-saving record", buf, 0xCu);
        }
        id v35 = objc_alloc((Class)CKRecordZone);
        id v36 = [v6 recordID];
        uint64_t v37 = [v36 zoneID];
        id v38 = [v35 initWithZoneID:v37];

        id v39 = [objc_alloc((Class)CKSyncEnginePendingZoneSave) initWithZone:v38];
        id v97 = v39;
        uint64_t v40 = +[NSArray arrayWithObjects:&v97 count:1];
        [(SYDSyncManager *)self addPendingDatabaseChanges:v40 storeIdentifier:v11];

        id v41 = [(SYDSyncManager *)self coreDataStore];
        id v87 = 0;
        unsigned int v42 = [v41 clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:v11 error:&v87];
        id v43 = v87;

        if (v42)
        {
          [(SYDSyncManager *)self markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:v11];
          goto LABEL_79;
        }
        long long v66 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_100032AB0();
        }
        goto LABEL_78;
      case 28:
        id v18 = SYDGetCloudKitLog();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_76;
        }
        id v19 = objc_msgSend(v6, "syd_shortDescription");
        *(_DWORD *)buf = 138412290;
        v102 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Failed to save %@ because zone was user-purged", buf, 0xCu);
        goto LABEL_75;
      default:
        goto LABEL_16;
    }
    goto LABEL_75;
  }
  if (v12 > 4096)
  {
    if (v12 == 4097 || v12 == 4099) {
      goto LABEL_77;
    }
LABEL_16:
    id v18 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1000325B4();
    }
    goto LABEL_76;
  }
  if (v12 != 110)
  {
    if (v12 == 112)
    {
      id v21 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v22 = objc_msgSend(v6, "syd_shortDescription");
        *(_DWORD *)buf = 138412290;
        v102 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Missing Manatee identity saving %@, deleting the zone now", buf, 0xCu);
      }
      id v23 = objc_alloc((Class)CKSyncEnginePendingZoneDelete);
      id v24 = [v6 recordID];
      id v25 = [v24 zoneID];
      id v26 = [v23 initWithZoneID:v25];
      id v96 = v26;
      __int16 v27 = +[NSArray arrayWithObjects:&v96 count:1];
      [(SYDSyncManager *)self addPendingDatabaseChanges:v27 storeIdentifier:v11];

      id v18 = [(SYDSyncManager *)self coreDataStore];
      [v18 clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:v11 error:0];
      goto LABEL_76;
    }
    goto LABEL_16;
  }
  uint64_t v44 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    id v45 = objc_msgSend(v6, "syd_shortDescription");
    *(_DWORD *)buf = 138412290;
    v102 = v45;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Manatee unavailable trying to save %@. Retrying eventually", buf, 0xCu);
  }
  id v18 = [v6 recordID];
  v95 = v18;
  uint64_t v32 = &v95;
LABEL_34:
  id v19 = +[NSArray arrayWithObjects:v32 count:1];
  [(SYDSyncManager *)self addKeyValueRecordIDsToSave:v19 recordIDsToDelete:0 storeIdentifier:v11];
LABEL_75:

LABEL_76:
LABEL_77:
  v93[0] = v11;
  v92[0] = @"storeIdentifier";
  v92[1] = @"containerIdentifier";
  v86 = [(SYDSyncManager *)self container];
  id v43 = [v86 containerIdentifier];
  v93[1] = v43;
  v92[2] = @"containerEnvironment";
  long long v66 = [(SYDSyncManager *)self container];
  long long v75 = [v66 containerID];
  long long v76 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v75 environment]);
  v93[2] = v76;
  v92[3] = @"errorCode";
  long long v77 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 code]);
  v93[3] = v77;
  long long v78 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:4];
  AnalyticsSendEvent();

  id v38 = v86;
LABEL_78:

LABEL_79:
  +[SYDKeyValue deleteFilesForAssetsInKeyValueRecord:v6];
  +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:v11, @"Failed to save record: %@", v7 format];
}

- (void)didDeleteRecordWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDSyncManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EA34;
  v7[3] = &unk_100050AA0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)didFailToDeleteRecordWithID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYDSyncManager *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001EE2C;
  v11[3] = &unk_100050AA0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v11);
}

- (void)didFetchRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDSyncManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EF2C;
  v7[3] = &unk_100050AA0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)saveSyncAnchorSystemFieldsRecord:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100032ED4(v4);
  }

  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 encodeSystemFieldsWithCoder:v6];
  id v7 = [v6 encodedData];
  if (v7 && ([v6 error], id v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    id v10 = [(SYDSyncManager *)self coreDataStore];
    unsigned int v11 = [v4 recordID];
    id v12 = [v11 zoneID];
    id v13 = [v12 zoneName];
    id v16 = 0;
    unsigned __int8 v14 = [v10 saveServerSyncAnchorSystemFieldsRecordData:v7 forStoreWithIdentifier:v13 error:&v16];
    id v9 = v16;

    if ((v14 & 1) == 0)
    {
      id v15 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100032E6C();
      }
    }
  }
  else
  {
    id v9 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100032DE8(v6);
    }
  }
}

- (void)processFetchedRecords:(id)a3 deletedRecordIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SYDSyncManager *)self queue];
  dispatch_assert_queue_V2(v9);

  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    id v10 = [(SYDSyncManager *)self personaUniqueString];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001F3A4;
    v12[3] = &unk_1000512D8;
    id v13 = v7;
    unsigned __int8 v14 = self;
    SEL v16 = a2;
    id v15 = v8;
    sub_100018CC4(v10, v12);

    unsigned int v11 = v13;
  }
  else
  {
    unsigned int v11 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100033024();
    }
  }
}

- (void)deduplicateRecordForKeyValue:(id)a3 withNewlyFetchedRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 recordName];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v6 recordName];
    unsigned int v11 = [v7 recordID];
    id v12 = [v11 recordName];
    unsigned __int8 v13 = [v10 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      unsigned __int8 v14 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100033370(v6, v7, v14);
      }

      id v15 = [v6 serverSystemFieldsRecord];
      SEL v16 = v15;
      if (v15)
      {
        id v17 = [v15 creationDate];
        id v18 = [v7 creationDate];
        id v19 = [v17 compare:v18];

        if (!v19)
        {
          id v20 = self;
          id v21 = SYDGetCloudKitLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Creation dates were exactly the same when de-duplicating. Comparing record names", buf, 2u);
          }

          unsigned __int8 v22 = [v16 recordID];
          id v23 = [v22 recordName];
          id v24 = [v7 recordID];
          id v25 = [v24 recordName];
          id v19 = [v23 compare:v25];

          self = v20;
        }
        if (v19 == (id)1)
        {
          id v35 = SYDGetCloudKitLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            sub_1000332D4(v7);
          }

          uint64_t v27 = [v16 recordID];
          uint64_t v28 = [v7 recordID];
          id v36 = [v7 recordID];
          uint64_t v37 = [v36 recordName];
          [v6 setRecordName:v37];

          __int16 v31 = v6;
          id v32 = v7;
          goto LABEL_20;
        }
        if (v19)
        {
          if (v19 == (id)-1)
          {
            id v26 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
              sub_100033238(v16);
            }

            uint64_t v27 = [v7 recordID];
            uint64_t v28 = [v16 recordID];
            __int16 v29 = [v16 recordID];
            uint64_t v30 = [v29 recordName];
            [v6 setRecordName:v30];

            __int16 v31 = v6;
            id v32 = v16;
LABEL_20:
            [v31 setServerSystemFieldsRecord:v32];
            goto LABEL_24;
          }
        }
        else
        {
          id v38 = [v16 recordID];
          id v39 = [v7 recordID];
          +[NSException raise:NSInternalInconsistencyException, @"Trying to de-duplicate two identical records %@ and %@", v38, v39 format];
        }
        uint64_t v28 = 0;
      }
      else
      {
        char v33 = [v7 recordID];
        id v34 = [v33 recordName];
        [v6 setRecordName:v34];

        [v6 setServerSystemFieldsRecord:v7];
        uint64_t v28 = [v7 recordID];
      }
      uint64_t v27 = 0;
LABEL_24:
      if (!(v27 | v28))
      {
LABEL_38:

        goto LABEL_39;
      }
      uint64_t v40 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        sub_1000331D0();
      }

      if (v28)
      {
        uint64_t v63 = v28;
        id v41 = +[NSArray arrayWithObjects:&v63 count:1];
        if (v27)
        {
LABEL_29:
          uint64_t v62 = v27;
          unsigned int v42 = +[NSArray arrayWithObjects:&v62 count:1];
LABEL_32:
          long long v58 = v16;
          id v43 = [(id)v28 zoneID];
          uint64_t v44 = [v43 zoneName];
          id v45 = v44;
          if (v44)
          {
            id v46 = v44;
          }
          else
          {
            [(id)v27 zoneID];
            long long v56 = self;
            v48 = unsigned int v47 = v42;
            id v46 = [v48 zoneName];

            unsigned int v42 = v47;
            self = v56;
          }

          [(SYDSyncManager *)self addKeyValueRecordIDsToSave:v41 recordIDsToDelete:v42 storeIdentifier:v46];
          if (v46)
          {
            v61[0] = v46;
            v60[0] = @"storeIdentifier";
            v60[1] = @"containerIdentifier";
            long long v54 = [(SYDSyncManager *)self container];
            unsigned int v49 = [v54 containerIdentifier];
            v61[1] = v49;
            v60[2] = @"containerEnvironment";
            long long v55 = v42;
            [(SYDSyncManager *)self container];
            v50 = long long v57 = v41;
            BOOL v51 = [v50 containerID];
            long long v52 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v51 environment]);
            v61[2] = v52;
            uint64_t v53 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:3];
            AnalyticsSendEvent();

            unsigned int v42 = v55;
            id v41 = v57;
          }
          SEL v16 = v58;
          goto LABEL_38;
        }
      }
      else
      {
        id v41 = 0;
        if (v27) {
          goto LABEL_29;
        }
      }
      unsigned int v42 = 0;
      goto LABEL_32;
    }
  }
LABEL_39:
}

- (void)didFetchRecordDeletion:(id)a3 recordType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020738;
  block[3] = &unk_100050B90;
  id v12 = v7;
  id v13 = v6;
  unsigned __int8 v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

- (void)handleSyncEngineStateUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDSyncManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020910;
  v7[3] = &unk_100050AA0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didDeleteRecordZoneWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDSyncManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020A90;
  v7[3] = &unk_100050AA0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)zoneWithIDWasPurged:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDSyncManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020C80;
  v7[3] = &unk_100050AA0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)syncEngine:(id)a3 nextFetchChangesOptionsForContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 options];
  id v8 = [(SYDSyncManager *)self engine];

  if (v8 == v6)
  {
    id v9 = [v7 scope];
    id v10 = [v9 zoneIDs];
    id v11 = [v10 count];

    if (v11)
    {
      uint64_t v37 = v7;
      id v12 = objc_opt_new();
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v38 = v9;
      id v13 = [v9 zoneIDs];
      id v14 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v45;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v45 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            id v19 = objc_msgSend(v18, "zoneName", v37);
            unsigned int v20 = [(SYDSyncManager *)self shouldSyncStoreWithIdentifier:v19];

            if (v20) {
              [v12 addObject:v18];
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v15);
      }

      id v9 = v38;
      id v21 = [v38 zoneIDs];
      unsigned __int8 v22 = [v12 isEqual:v21];

      if (v22)
      {
        id v7 = v37;
LABEL_32:

        goto LABEL_33;
      }
      id v35 = SYDGetCloudKitLog();
      id v7 = v37;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        sub_100033680();
      }

      id v34 = [objc_alloc((Class)CKSyncEngineFetchChangesScope) initWithZoneIDs:v12];
    }
    else
    {
      id v23 = [v9 excludedZoneIDs];
      id v24 = [v23 count];

      if (v24)
      {
LABEL_33:

        goto LABEL_34;
      }
      id v39 = v9;
      id v12 = objc_opt_new();
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v25 = [v6 state];
      id v26 = [v25 zoneIDsWithUnfetchedServerChanges];

      id v27 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v41;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v41 != v29) {
              objc_enumerationMutation(v26);
            }
            __int16 v31 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
            id v32 = [v31 zoneName];
            if (![(SYDSyncManager *)self shouldSyncStoreWithIdentifier:v32]) {
              [v12 addObject:v31];
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v28);
      }

      if (![v12 count])
      {
        id v9 = v39;
        goto LABEL_32;
      }
      char v33 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_100033618();
      }

      id v34 = [objc_alloc((Class)CKSyncEngineFetchChangesScope) initWithExcludedZoneIDs:v12];
      id v9 = v39;
    }
    objc_msgSend(v7, "setScope:", v34, v37);

    goto LABEL_32;
  }
LABEL_34:

  return v7;
}

- (id)syncEngine:(id)a3 relatedApplicationBundleIdentifiersForZoneIDs:(id)a4 recordIDs:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableSet);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v33 + 1) + 8 * i) zoneName];
        [v9 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)j), "zoneID", (void)v29);
        unsigned __int8 v22 = [v21 zoneName];
        [v9 addObject:v22];
      }
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  id v23 = [(SYDSyncManager *)self delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    id v25 = [(SYDSyncManager *)self delegate];
    id v26 = [v9 allObjects];
    id v27 = [v25 applicationIdentifiersForStoreIdentifiers:v26];
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (void)deleteDataFromDisk
{
  unsigned __int8 v3 = [(SYDSyncManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021418;
  block[3] = &unk_100050A50;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)registerForFirstUnlockNotificationsIfNecessary
{
  unsigned __int8 v3 = [(SYDSyncManager *)self coreDataStore];
  NSFileProtectionType v4 = [v3 fileProtectionType];

  if (v4 != NSFileProtectionNone && !self->_engine)
  {
    id v5 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will register for first unlock notifications", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    p_mobileKeybagNotifyToken = &self->_mobileKeybagNotifyToken;
    id v8 = dispatch_get_global_queue(0, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000215F4;
    handler[3] = &unk_100050F78;
    objc_copyWeak(&v10, buf);
    notify_register_dispatch(v6, p_mobileKeybagNotifyToken, v8, handler);

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)setContainer:(id)a3
{
}

- (void)setCoreDataStore:(id)a3
{
}

- (void)setStoreType:(int64_t)a3
{
  self->_storeType = a3;
}

- (SYDTestConfiguration)testConfiguration
{
  return self->_testConfiguration;
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setCallbackQueue:(id)a3
{
}

- (void)setStoreIdentifiersWithChangedValuesDuringFetchChanges:(id)a3
{
}

- (void)setPendingFetchedRecords:(id)a3
{
}

- (void)setPendingDeletedRecordIDs:(id)a3
{
}

- (int)mobileKeybagNotifyToken
{
  return self->_mobileKeybagNotifyToken;
}

- (void)setMobileKeybagNotifyToken:(int)a3
{
  self->_mobileKeybagNotifyToken = a3;
}

- (BOOL)alwaysSaveRecordZones
{
  return self->_alwaysSaveRecordZones;
}

- (void)setAlwaysSaveRecordZones:(BOOL)a3
{
  self->_alwaysSaveRecordZones = a3;
}

- (unint64_t)maxPendingFetchedRecords
{
  return self->_maxPendingFetchedRecords;
}

- (void)setMaxPendingFetchedRecords:(unint64_t)a3
{
  self->_maxPendingFetchedRecords = a3;
}

- (SYDSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYDSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingDeletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_pendingFetchedRecords, 0);
  objc_storeStrong((id *)&self->_storeIdentifiersWithChangedValuesDuringFetchChanges, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_testConfiguration, 0);
  objc_storeStrong((id *)&self->_coreDataStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

@end