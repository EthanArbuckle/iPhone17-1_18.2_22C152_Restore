@interface SYDCoreDataStore
+ (BOOL)isCorruptionError:(id)a3;
+ (BOOL)isInvalidTokenError:(id)a3;
+ (id)managedObjectModel;
- (BOOL)_queue_handleCorruptionIfNecessaryFromError:(id)a3 inPersistentStoreCoordinator:(id)a4;
- (BOOL)_saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 enforceQuota:(BOOL)a6 forceCreateNewRow:(BOOL)a7 error:(id *)a8;
- (BOOL)_saveKeyValues:(id)a3 excludeFromChangeTracking:(BOOL)a4 enforceQuota:(BOOL)a5 forceCreateNewRow:(BOOL)a6 error:(id *)a7;
- (BOOL)clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)clearServerSystemFieldsRecordsForAllStoresWithError:(id *)a3;
- (BOOL)deleteDataForAllStoresWithError:(id *)a3;
- (BOOL)deleteDataForStoreWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteDataForStoresMatchingPredicate:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)didMigrateFromPlistsWithError:(id *)a3;
- (BOOL)removeKeyValueForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 error:(id *)a6;
- (BOOL)removeKeyValueForRecordName:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)saveContext:(id)a3 reason:(id)a4 includingTransactionContext:(BOOL)a5 error:(id *)a6;
- (BOOL)saveDeprecatedSyncEngineMetadata:(id)a3 error:(id *)a4;
- (BOOL)saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 enforceQuota:(BOOL)a6 error:(id *)a7;
- (BOOL)saveKeyValues:(id)a3 excludeFromChangeTracking:(BOOL)a4 enforceQuota:(BOOL)a5 error:(id *)a6;
- (BOOL)saveServerSyncAnchorSystemFieldsRecordData:(id)a3 forStoreWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)saveSyncEngineStateSerialization:(id)a3 error:(id *)a4;
- (BOOL)saveTransaction:(id *)a3;
- (BOOL)setACAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setDidMigrateFromPlists:(BOOL)a3 error:(id *)a4;
- (BOOL)setFailedMigrationCount:(signed __int16)a3 error:(id *)a4;
- (BOOL)shouldLogValues;
- (NSCache)contexts;
- (NSLock)contextsLock;
- (NSManagedObjectContext)transactionContext;
- (NSPersistentContainer)_persistentContainer;
- (NSString)fileProtectionType;
- (NSURL)URL;
- (OS_dispatch_queue)persistentContainerQueue;
- (SYDCoreDataStore)initWithURL:(id)a3;
- (SYDCoreDataStore)initWithURL:(id)a3 fileProtectionType:(id)a4;
- (SYDCoreDataStore)initWithURL:(id)a3 fileProtectionType:(id)a4 persistentContainer:(id)a5 isTransactional:(BOOL)a6;
- (id)_contextForStoreIdentifier:(id)a3 persistentContainer:(id)a4;
- (id)acAccountIdentifierWithError:(id *)a3;
- (id)allRecordNamesInStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)allStoreIdentifiersWithError:(id *)a3;
- (id)changedKeysForStoreIdentifier:(id)a3 sinceChangeToken:(id)a4 error:(id *)a5;
- (id)contextForStoreIdentifier:(id)a3 error:(id *)a4;
- (id)currentChangeTokenForStoreIdentifier:(id)a3 error:(id *)a4;
- (id)deprecatedSyncEngineMetadataWithError:(id *)a3;
- (id)description;
- (id)dictionaryRepresentationForStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)keyValueForKey:(id)a3 inStoreWithIdentifier:(id)a4 createIfNecessary:(BOOL)a5 error:(id *)a6;
- (id)keyValueForRecordName:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (id)keyValueFromManagedKeyValue:(id)a3 inStoreWithIdentifier:(id)a4;
- (id)keyValuesForKeyIDs:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)managedDatabaseCreateIfNecessary:(BOOL)a3 inContext:(id)a4 error:(id *)a5;
- (id)managedKeyValueWithRecordName:(id)a3 inStoreWithIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6;
- (id)managedKeyValuesForKeyIDs:(id)a3 inContext:(id)a4 error:(id *)a5;
- (id)managedKeyValuesMatchingPredicate:(id)a3 inContext:(id)a4 error:(id *)a5;
- (id)managedStoreWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 inContext:(id)a5 error:(id *)a6;
- (id)persistentContainerWithError:(id *)a3;
- (id)serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)syncEngineStateSerializationWithError:(id *)a3;
- (id)transactionalStoreWithError:(id *)a3;
- (signed)failedMigrationCountWithError:(id *)a3;
- (unint64_t)fileSizeBytes;
- (unint64_t)numberOfKeyValuesInStoreWithIdentifier:(id)a3 error:(id *)a4;
- (void)_queue_destroyPersistentStoreInPersistentStoreCoordinator:(id)a3;
- (void)clearContexts;
- (void)dealloc;
- (void)destroyPersistentStore;
- (void)handleCorruptionIfNecessaryFromError:(id)a3 inPersistentStoreCoordinator:(id)a4;
- (void)setContexts:(id)a3;
- (void)setContextsLock:(id)a3;
- (void)setFileProtectionType:(id)a3;
- (void)setPersistentContainerQueue:(id)a3;
- (void)setShouldLogValues:(BOOL)a3;
- (void)setTransactionContext:(id)a3;
- (void)setURL:(id)a3;
- (void)set_persistentContainer:(id)a3;
- (void)transactionStoreDidSave:(id)a3;
@end

@implementation SYDCoreDataStore

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(SYDCoreDataStore *)self URL];
  v6 = +[NSString stringWithFormat:@"<%@: %p url=%@>", v4, self, v5];;

  return v6;
}

- (NSURL)URL
{
  return self->_URL;
}

- (id)dictionaryRepresentationForStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100004BA0();
  }

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100010F14;
  v30 = sub_100010EBC;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100010F14;
  v24 = sub_100010EBC;
  id v25 = 0;
  id obj = 0;
  v8 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v6 error:&obj];
  objc_storeStrong(&v25, obj);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001048C;
  v13[3] = &unk_100051830;
  id v9 = v6;
  v17 = &v20;
  id v14 = v9;
  v15 = self;
  id v10 = v8;
  id v16 = v10;
  v18 = &v26;
  [v10 performBlockAndWait:v13];
  if (!v27[5] && !v21[5])
  {
    v27[5] = (uint64_t)&__NSDictionary0__struct;
  }
  if (a4) {
    *a4 = (id) v21[5];
  }
  id v11 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

- (id)currentChangeTokenForStoreIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10000D78C();
  }

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100010F14;
  uint64_t v28 = sub_100010EBC;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100010F14;
  uint64_t v22 = sub_100010EBC;
  id v23 = 0;
  id obj = 0;
  v8 = [(SYDCoreDataStore *)self persistentContainerWithError:&obj];
  objc_storeStrong(&v29, obj);
  id v9 = [v8 persistentStoreCoordinator];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000050A0;
  v13[3] = &unk_100051768;
  id v10 = v9;
  id v14 = v10;
  v15 = &v24;
  id v16 = &v18;
  [v10 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v25[5];
  }
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (id)contextForStoreIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(SYDCoreDataStore *)self transactionContext];

  if (v7)
  {
    v8 = [(SYDCoreDataStore *)self transactionContext];
  }
  else
  {
    id v9 = [(SYDCoreDataStore *)self persistentContainerWithError:a4];
    if (v9)
    {
      v8 = [(SYDCoreDataStore *)self _contextForStoreIdentifier:v6 persistentContainer:v9];
    }
    else
    {
      id v10 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100037C04();
      }

      v8 = 0;
    }
  }
  return v8;
}

- (id)persistentContainerWithError:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_100010F14;
  v13 = sub_100010EBC;
  id v14 = 0;
  v5 = [(SYDCoreDataStore *)self persistentContainerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010AD8;
  v8[3] = &unk_100050A78;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = self->__persistentContainer;
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (OS_dispatch_queue)persistentContainerQueue
{
  return self->_persistentContainerQueue;
}

- (NSManagedObjectContext)transactionContext
{
  return self->_transactionContext;
}

- (id)_contextForStoreIdentifier:(id)a3 persistentContainer:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  v8 = @"__no_store__";
  if (v6) {
    v8 = v6;
  }
  uint64_t v9 = v8;
  id v10 = [(SYDCoreDataStore *)self contextsLock];
  [v10 lock];

  uint64_t v11 = [(SYDCoreDataStore *)self contexts];
  id v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    id v12 = [v7 newBackgroundContext];
    [v12 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    if (v6) {
      [v12 setName:v6];
    }
    v13 = [(SYDCoreDataStore *)self contexts];
    [v13 setObject:v12 forKey:v9];
  }
  id v14 = [(SYDCoreDataStore *)self contextsLock];
  [v14 unlock];

  return v12;
}

- (NSLock)contextsLock
{
  return self->_contextsLock;
}

- (NSCache)contexts
{
  return self->_contexts;
}

- (id)keyValuesForKeyIDs:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5
{
  v19 = self;
  id v6 = a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100010F14;
  v37 = sub_100010EBC;
  id v38 = (id)objc_opt_new();
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100010F14;
  id v31 = sub_100010EBC;
  id v32 = 0;
  id v7 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "storeIdentifier", v19);
        id v14 = [v7 objectForKeyedSubscript:v13];

        if (!v14)
        {
          id v14 = objc_opt_new();
          v15 = [v12 storeIdentifier];
          [v7 setObject:v14 forKeyedSubscript:v15];
        }
        [v14 addObject:v12];
      }
      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v39 count:16];
    }
    while (v9);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000052E4;
  v21[3] = &unk_100051600;
  v21[4] = v19;
  v21[5] = &v27;
  BOOL v22 = a4;
  v21[6] = &v33;
  [v7 enumerateKeysAndObjectsUsingBlock:v21];
  if (v28[5])
  {
    id v16 = (void *)v34[5];
    v34[5] = 0;
  }
  if (a5) {
    *a5 = (id) v28[5];
  }
  id v17 = objc_msgSend((id)v34[5], "copy", v19);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

- (id)managedKeyValuesForKeyIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v47 = a4;
  id v8 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v59;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v59 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v14 = [v13 storeIdentifier];
        v15 = [v8 objectForKeyedSubscript:v14];

        if (!v15)
        {
          v15 = +[NSMutableSet set];
          id v16 = [v13 storeIdentifier];
          [v8 setObject:v15 forKeyedSubscript:v16];
        }
        id v17 = [v13 key];
        [v15 addObject:v17];
      }
      id v10 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v10);
  }

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10000C660;
  v56[3] = &unk_1000512B0;
  id v18 = (id)objc_opt_new();
  id v57 = v18;
  [v8 enumerateKeysAndObjectsUsingBlock:v56];
  v19 = +[NSCompoundPredicate orPredicateWithSubpredicates:v18];
  id v55 = 0;
  uint64_t v20 = v47;
  v21 = [(SYDCoreDataStore *)self managedKeyValuesMatchingPredicate:v19 inContext:v47 error:&v55];
  id v22 = v55;
  if (v22)
  {
    v48 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100037B34();
    }
    long long v23 = 0;
    goto LABEL_14;
  }
  long long v23 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v48 = v21;
  id v25 = [v48 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (!v25)
  {
LABEL_14:
    long long v24 = a5;
    goto LABEL_26;
  }
  id v26 = v25;
  v43 = v21;
  v44 = v19;
  id v45 = v18;
  uint64_t v49 = *(void *)v52;
  do
  {
    for (j = 0; j != v26; j = (char *)j + 1)
    {
      if (*(void *)v52 != v49) {
        objc_enumerationMutation(v48);
      }
      uint64_t v28 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
      uint64_t v29 = [_TtC13syncdefaultsd8SYDKeyID alloc];
      v30 = [v28 key];
      id v31 = [v28 store];
      id v32 = [v31 identifier];
      uint64_t v33 = [(SYDKeyID *)v29 initWithKey:v30 storeIdentifier:v32];

      v34 = [v23 objectForKeyedSubscript:v33];
      uint64_t v35 = v34;
      if (!v34) {
        goto LABEL_22;
      }
      v36 = [v34 valueModificationDate];
      [v36 timeIntervalSinceNow];
      double v38 = v37;
      v39 = [v28 valueModificationDate];
      [v39 timeIntervalSinceNow];
      double v41 = v40;

      if (v38 < v41) {
LABEL_22:
      }
        [v23 setObject:v28 forKeyedSubscript:v33];
    }
    id v26 = [v48 countByEnumeratingWithState:&v51 objects:v62 count:16];
  }
  while (v26);
  long long v24 = a5;
  uint64_t v20 = v47;
  v19 = v44;
  id v18 = v45;
  id v22 = 0;
  v21 = v43;
LABEL_26:

  if (v24) {
    *long long v24 = v22;
  }

  return v23;
}

- (id)managedKeyValuesMatchingPredicate:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[SYDManagedKeyValue fetchRequest];
  [v10 setPredicate:v8];
  uint64_t v11 = NSStringFromSelector("valueModificationDate");
  id v12 = +[NSSortDescriptor sortDescriptorWithKey:v11 ascending:0];
  uint64_t v20 = v12;
  v13 = +[NSArray arrayWithObjects:&v20 count:1];
  [v10 setSortDescriptors:v13];

  id v19 = 0;
  id v14 = [v10 execute:&v19];
  id v15 = v19;
  if (v15)
  {
    id v16 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_100037B9C();
    }

    id v17 = [v9 persistentStoreCoordinator];
    [(SYDCoreDataStore *)self handleCorruptionIfNecessaryFromError:v15 inPersistentStoreCoordinator:v17];
  }
  if (a5) {
    *a5 = v15;
  }

  return v14;
}

- (id)keyValueForKey:(id)a3 inStoreWithIdentifier:(id)a4 createIfNecessary:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 141558787;
    uint64_t v25 = 1752392040;
    __int16 v26 = 2113;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Fetching keyValue for key <(%{private, mask.hash}@)> in store <(%@)> create=%d", buf, 0x26u);
  }

  if (!v10)
  {
    SYDGetCoreDataLog();
    v13 = (_TtC13syncdefaultsd8SYDKeyID *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v13->super, OS_LOG_TYPE_INFO, "Trying to access key value for nil key", buf, 2u);
    }
    id v18 = 0;
    goto LABEL_17;
  }
  if ([v11 length])
  {
    v13 = [[_TtC13syncdefaultsd8SYDKeyID alloc] initWithKey:v10 storeIdentifier:v11];
    v21 = v13;
    id v14 = +[NSArray arrayWithObjects:&v21 count:1];
    id v15 = [(SYDCoreDataStore *)self keyValuesForKeyIDs:v14 createIfNecessary:v7 error:a6];

    if ((unint64_t)[v15 count] >= 2)
    {
      id v16 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_10003608C();
      }
    }
    id v17 = [v15 allValues];
    id v18 = [v17 firstObject];

    goto LABEL_17;
  }
  id v19 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100036058();
  }

  if (a6)
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    CFStringRef v23 = @"Trying to access a key value with an empty store identifier";
    v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    +[NSError errorWithDomain:@"SyncedDefaults" code:2222 userInfo:v13];
    id v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  id v18 = 0;
LABEL_18:

  return v18;
}

- (id)changedKeysForStoreIdentifier:(id)a3 sinceChangeToken:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10000DB10();
  }

  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_100010F14;
  v36 = sub_100010EBC;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100010F14;
  __int16 v30 = sub_100010EBC;
  id v31 = 0;
  id obj = 0;
  id v11 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v8 error:&obj];
  objc_storeStrong(&v37, obj);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C76C;
  v18[3] = &unk_100051790;
  id v12 = v9;
  id v19 = v12;
  CFStringRef v23 = &v32;
  id v13 = v8;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  NSErrorUserInfoKey v22 = self;
  long long v24 = &v26;
  [v14 performBlockAndWait:v18];
  if (a5) {
    *a5 = (id) v33[5];
  }
  if (!v33[5])
  {
    id v15 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10000DBB4((uint64_t)v13, buf, (uint64_t)[(id)v27[5] count], v15);
    }
  }
  id v16 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

- (id)keyValueFromManagedKeyValue:(id)a3 inStoreWithIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SYDCoreDataStore.m", 221, @"Trying load a nil key in store <(%@)>", v8 object file lineNumber description];
  }
  if (![v8 length])
  {
    uint64_t v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:222 description:@"Trying to load without a store identifier"];
  }
  id v9 = [v7 store];
  id v10 = [v9 identifier];
  id v11 = [v10 length];

  if (v11)
  {
    id v12 = [SYDKeyValue alloc];
    id v13 = [v7 key];
    id v14 = [v7 store];
    id v15 = [v14 identifier];
    id v16 = [(SYDKeyValue *)v12 initWithKey:v13 storeIdentifier:v15];
  }
  else
  {
    id v17 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100036294(v7, (uint64_t)v8, v17);
    }

    id v18 = [SYDKeyValue alloc];
    id v13 = [v7 key];
    id v16 = [(SYDKeyValue *)v18 initWithKey:v13 storeIdentifier:v8];
  }

  id v19 = [v7 value];
  id v20 = [v7 valueModificationDate];
  [(SYDKeyValue *)v16 setValue:v19 withModificationDate:v20];

  id v21 = [v7 recordName];
  [(SYDKeyValue *)v16 setRecordName:v21];

  NSErrorUserInfoKey v22 = [v7 serverSystemFieldsRecordData];
  [(SYDKeyValue *)v16 setServerSystemFieldsRecordData:v22];

  return v16;
}

- (SYDCoreDataStore)initWithURL:(id)a3
{
  return [(SYDCoreDataStore *)self initWithURL:a3 fileProtectionType:NSFileProtectionCompleteUntilFirstUserAuthentication];
}

- (SYDCoreDataStore)initWithURL:(id)a3 fileProtectionType:(id)a4
{
  return [(SYDCoreDataStore *)self initWithURL:a3 fileProtectionType:a4 persistentContainer:0 isTransactional:0];
}

- (SYDCoreDataStore)initWithURL:(id)a3 fileProtectionType:(id)a4 persistentContainer:(id)a5 isTransactional:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    uint64_t v28 = +[NSAssertionHandler currentHandler];
    id v29 = (objc_class *)objc_opt_class();
    id v31 = NSStringFromClass(v29);
    [v28 handleFailureInMethod:a2, self, @"SYDCoreDataStore.m", 72, @"Cannot initialize %@ with a nil URL", v31 object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)SYDCoreDataStore;
  id v15 = [(SYDCoreDataStore *)&v32 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_URL, a3);
    objc_storeStrong((id *)&v16->_fileProtectionType, a4);
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.kvs.coredata.persistent-container", v17);
    persistentContainerQueue = v16->_persistentContainerQueue;
    v16->_persistentContainerQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->__persistentContainer, a5);
    id v20 = (NSCache *)objc_alloc_init((Class)NSCache);
    contexts = v16->_contexts;
    v16->_contexts = v20;

    NSErrorUserInfoKey v22 = (NSLock *)objc_alloc_init((Class)NSLock);
    contextsLock = v16->_contextsLock;
    v16->_contextsLock = v22;

    if (v6)
    {
      if (!v16->__persistentContainer)
      {
        __int16 v30 = +[NSAssertionHandler currentHandler];
        [v30 handleFailureInMethod:a2 object:v16 file:@"SYDCoreDataStore.m" lineNumber:84 description:@"Cannot create a transactional context without a persistent container"];
      }
      uint64_t v24 = -[SYDCoreDataStore _contextForStoreIdentifier:persistentContainer:](v16, "_contextForStoreIdentifier:persistentContainer:", 0);
      transactionContext = v16->_transactionContext;
      v16->_transactionContext = (NSManagedObjectContext *)v24;
    }
    else
    {
      transactionContext = +[NSNotificationCenter defaultCenter];
      [transactionContext addObserver:v16 selector:"transactionStoreDidSave:" name:@"TransactionStoreDidSave" object:0];
    }
  }
  uint64_t v26 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_100035FF0();
  }

  return v16;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SYDCoreDataStore;
  [(SYDCoreDataStore *)&v4 dealloc];
}

- (id)keyValueForRecordName:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10003615C();
  }

  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_100010F14;
  uint64_t v34 = sub_100010EBC;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_100010F14;
  uint64_t v28 = sub_100010EBC;
  id v29 = 0;
  id obj = 0;
  id v11 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v9 error:&obj];
  objc_storeStrong(&v29, obj);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000277E4;
  v17[3] = &unk_100051628;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  id v21 = &v24;
  NSErrorUserInfoKey v22 = &v30;
  [v14 performBlockAndWait:v17];
  if (a5) {
    *a5 = (id) v25[5];
  }
  id v15 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (BOOL)saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 enforceQuota:(BOOL)a6 error:(id *)a7
{
  return [(SYDCoreDataStore *)self _saveKeyValue:a3 inStoreWithIdentifier:a4 excludeFromChangeTracking:a5 enforceQuota:a6 forceCreateNewRow:0 error:a7];
}

- (BOOL)_saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 enforceQuota:(BOOL)a6 forceCreateNewRow:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v15 = a3;
  id v16 = a4;
  if (!v15)
  {
    id v20 = +[NSAssertionHandler currentHandler];
    id v21 = (objc_class *)objc_opt_class();
    NSErrorUserInfoKey v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"SYDCoreDataStore.m", 244, @"Trying to save a nil %@ in %@", v22, v16 object file lineNumber description];
  }
  if (![v16 length])
  {
    CFStringRef v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:245 description:@"Trying to save without a store identifier"];
  }
  id v24 = v15;
  id v17 = +[NSArray arrayWithObjects:&v24 count:1];
  BOOL v18 = [(SYDCoreDataStore *)self _saveKeyValues:v17 excludeFromChangeTracking:v11 enforceQuota:v10 forceCreateNewRow:v9 error:a8];

  return v18;
}

- (BOOL)saveKeyValues:(id)a3 excludeFromChangeTracking:(BOOL)a4 enforceQuota:(BOOL)a5 error:(id *)a6
{
  return [(SYDCoreDataStore *)self _saveKeyValues:a3 excludeFromChangeTracking:a4 enforceQuota:a5 forceCreateNewRow:0 error:a6];
}

- (BOOL)_saveKeyValues:(id)a3 excludeFromChangeTracking:(BOOL)a4 enforceQuota:(BOOL)a5 forceCreateNewRow:(BOOL)a6 error:(id *)a7
{
  id v20 = self;
  id v8 = a3;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_100010F14;
  v36 = sub_100010EBC;
  id v37 = 0;
  BOOL v9 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "storeIdentifier", v20);
        id v16 = [v9 objectForKeyedSubscript:v15];

        if (!v16)
        {
          id v16 = objc_opt_new();
          id v17 = [v14 storeIdentifier];
          [v9 setObject:v16 forKeyedSubscript:v17];
        }
        [v16 addObject:v14];
      }
      id v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v11);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100027D48;
  v24[3] = &unk_100051678;
  v24[4] = v20;
  v24[5] = &v32;
  BOOL v25 = a4;
  BOOL v26 = a6;
  BOOL v27 = a5;
  [v9 enumerateKeysAndObjectsUsingBlock:v24];
  if (a7) {
    *a7 = (id) v33[5];
  }
  BOOL v18 = v33[5] == 0;

  _Block_object_dispose(&v32, 8);
  return v18;
}

- (BOOL)saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  return [(SYDCoreDataStore *)self saveKeyValue:a3 inStoreWithIdentifier:a4 excludeFromChangeTracking:0 enforceQuota:0 error:a5];
}

- (BOOL)removeKeyValueForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    id v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:362 description:@"Trying to remove a value for a nil key"];
  }
  if (![v12 length])
  {
    NSErrorUserInfoKey v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:363 description:@"Trying to remove without a store identifier"];
  }
  id v13 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100036410();
  }

  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_100010F14;
  uint64_t v34 = sub_100010EBC;
  id v35 = 0;
  id obj = 0;
  id v14 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v12 error:&obj];
  objc_storeStrong(&v35, obj);
  if (v7) {
    CFStringRef v15 = @"no-change-tracking";
  }
  else {
    CFStringRef v15 = 0;
  }
  [v14 setTransactionAuthor:v15];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100028A68;
  v23[3] = &unk_1000516A0;
  id v16 = v11;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  BOOL v26 = self;
  id v18 = v14;
  id v27 = v18;
  long long v28 = &v30;
  [v18 performBlockAndWait:v23];
  if (a6) {
    *a6 = (id) v31[5];
  }
  BOOL v19 = v31[5] == 0;

  _Block_object_dispose(&v30, 8);
  return v19;
}

- (BOOL)removeKeyValueForRecordName:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:394 description:@"Trying to remove a value for a nil record name"];
  }
  if (![v10 length])
  {
    BOOL v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:395 description:@"Trying to remove without a store identifier"];
  }
  id v11 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000365B4();
  }

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = sub_100010F14;
  uint64_t v30 = sub_100010EBC;
  id v31 = 0;
  id obj = 0;
  id v12 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v10 error:&obj];
  objc_storeStrong(&v31, obj);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100028EA8;
  v20[3] = &unk_1000516A0;
  v20[4] = self;
  id v13 = v9;
  id v21 = v13;
  id v14 = v10;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  id v24 = &v26;
  [v15 performBlockAndWait:v20];
  if (a5) {
    *a5 = (id) v27[5];
  }
  BOOL v16 = v27[5] == 0;

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (id)serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000366EC();
  }

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100010F14;
  long long v29 = sub_100010EBC;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100010F14;
  id v23 = sub_100010EBC;
  id v24 = 0;
  id obj = 0;
  id v8 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v6 error:&obj];
  objc_storeStrong(&v24, obj);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000291DC;
  v13[3] = &unk_100050FB8;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  BOOL v16 = &v19;
  id v17 = &v25;
  [v10 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v11 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

- (BOOL)saveServerSyncAnchorSystemFieldsRecordData:(id)a3 forStoreWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCoreDataLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v11) {
      sub_100036858();
    }
  }
  else if (v11)
  {
    sub_1000367F0();
  }

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_100010F14;
  uint64_t v28 = sub_100010EBC;
  id v29 = 0;
  id obj = 0;
  id v12 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v9 error:&obj];
  objc_storeStrong(&v29, obj);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000294BC;
  v18[3] = &unk_1000516C8;
  void v18[4] = self;
  id v13 = v9;
  id v19 = v13;
  id v14 = v12;
  id v20 = v14;
  id v22 = &v24;
  id v15 = v8;
  id v21 = v15;
  [v14 performBlockAndWait:v18];
  if (a5) {
    *a5 = (id) v25[5];
  }
  BOOL v16 = v25[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (BOOL)deleteDataForStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  BOOL v7 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v6 error:&v13];
  id v8 = v13;
  if (v7)
  {
    id v9 = +[NSPredicate predicateWithFormat:@"identifier == %@", v6];
    id v12 = v8;
    [(SYDCoreDataStore *)self deleteDataForStoresMatchingPredicate:v9 context:v7 error:&v12];
    id v10 = v12;

    id v8 = v10;
  }
  if (a4) {
    *a4 = v8;
  }

  return v8 == 0;
}

- (BOOL)deleteDataForAllStoresWithError:(id *)a3
{
  id v11 = 0;
  v5 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&v11];
  id v6 = v11;
  BOOL v7 = v6;
  if (v5)
  {
    id v10 = v6;
    [(SYDCoreDataStore *)self deleteDataForStoresMatchingPredicate:0 context:v5 error:&v10];
    id v8 = v10;

    BOOL v7 = v8;
  }
  if (a3) {
    *a3 = v7;
  }

  return v7 == 0;
}

- (BOOL)deleteDataForStoresMatchingPredicate:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000368F4();
  }

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100010F14;
  id v23 = sub_100010EBC;
  id v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100029900;
  v15[3] = &unk_100050F50;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v18 = &v19;
  [v12 performBlockAndWait:v15];
  [(SYDCoreDataStore *)self clearContexts];
  if (a5) {
    *a5 = (id) v20[5];
  }
  BOOL v13 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)allRecordNamesInStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[NSMutableArray array];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100010F14;
  uint64_t v25 = sub_100010EBC;
  id v26 = 0;
  id obj = 0;
  id v8 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v6 error:&obj];
  objc_storeStrong(&v26, obj);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100029BB4;
  v15[3] = &unk_1000516F0;
  id v9 = v6;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  uint64_t v19 = &v21;
  id v11 = v7;
  id v18 = v11;
  [v10 performBlockAndWait:v15];
  if (a4) {
    *a4 = (id) v22[5];
  }
  id v12 = v18;
  id v13 = v11;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)allStoreIdentifiersWithError:(id *)a3
{
  v5 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100036AFC();
  }

  id v6 = +[NSMutableSet set];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100010F14;
  uint64_t v23 = sub_100010EBC;
  id v24 = 0;
  id obj = 0;
  BOOL v7 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v24, obj);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002A03C;
  v13[3] = &unk_100051718;
  id v8 = v7;
  id v17 = &v19;
  id v14 = v8;
  id v15 = self;
  id v9 = v6;
  id v16 = v9;
  [v8 performBlockAndWait:v13];
  id v10 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100036A94();
  }

  if (a3) {
    *a3 = (id) v20[5];
  }
  id v11 = [v9 allObjects];

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (BOOL)clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100036BCC();
  }

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100010F14;
  id v22 = sub_100010EBC;
  id v23 = 0;
  id obj = 0;
  id v8 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v6 error:&obj];
  objc_storeStrong(&v23, obj);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002A474;
  v13[3] = &unk_100051740;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v16 = &v18;
  [v10 performBlockAndWait:v13];
  [(SYDCoreDataStore *)self clearContexts];
  if (a4) {
    *a4 = (id) v19[5];
  }
  BOOL v11 = v19[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (unint64_t)numberOfKeyValuesInStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100010F14;
  id v22 = sub_100010EBC;
  id v23 = 0;
  id obj = 0;
  BOOL v7 = [(SYDCoreDataStore *)self contextForStoreIdentifier:v6 error:&obj];
  objc_storeStrong(&v23, obj);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002A8DC;
  v12[3] = &unk_100050B40;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v24;
  id v9 = v7;
  id v14 = v9;
  id v16 = &v18;
  [v9 performBlockAndWait:v12];
  if (a4) {
    *a4 = (id) v19[5];
  }
  unint64_t v10 = v25[3];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (BOOL)clearServerSystemFieldsRecordsForAllStoresWithError:(id *)a3
{
  v5 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000372A0();
  }

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100010F14;
  uint64_t v18 = sub_100010EBC;
  id v19 = 0;
  id obj = 0;
  id v6 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v19, obj);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AB54;
  v10[3] = &unk_100050A78;
  id v7 = v6;
  id v11 = v7;
  id v12 = &v14;
  [v7 performBlockAndWait:v10];
  [(SYDCoreDataStore *)self clearContexts];
  if (a3) {
    *a3 = (id) v15[5];
  }
  BOOL v8 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)setACAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100010F14;
  uint64_t v21 = sub_100010EBC;
  id v22 = 0;
  id obj = 0;
  id v7 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v22, obj);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002AF88;
  v12[3] = &unk_1000516F0;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  id v15 = &v17;
  id v9 = v6;
  id v14 = v9;
  [v8 performBlockAndWait:v12];
  if (a4) {
    *a4 = (id) v18[5];
  }
  BOOL v10 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)acAccountIdentifierWithError:(id *)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100010F14;
  uint64_t v24 = sub_100010EBC;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100010F14;
  uint64_t v18 = sub_100010EBC;
  id v19 = 0;
  id obj = 0;
  v5 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v19, obj);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002B250;
  v9[3] = &unk_1000517B8;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  id v11 = &v14;
  id v12 = &v20;
  [v6 performBlockAndWait:v9];
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (BOOL)setDidMigrateFromPlists:(BOOL)a3 error:(id *)a4
{
  id v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100037474();
  }

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100010F14;
  uint64_t v21 = sub_100010EBC;
  id v22 = 0;
  id obj = 0;
  id v8 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v22, obj);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B468;
  v12[3] = &unk_1000517E0;
  void v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  uint64_t v14 = &v17;
  BOOL v15 = a3;
  [v9 performBlockAndWait:v12];
  if (a4) {
    *a4 = (id) v18[5];
  }
  BOOL v10 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)didMigrateFromPlistsWithError:(id *)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100010F14;
  uint64_t v18 = sub_100010EBC;
  id v19 = 0;
  id obj = 0;
  v5 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v19, obj);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002B71C;
  v9[3] = &unk_1000517B8;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  id v11 = &v14;
  id v12 = &v20;
  [v6 performBlockAndWait:v9];
  if (a3) {
    *a3 = (id) v15[5];
  }
  char v7 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v7;
}

- (BOOL)setFailedMigrationCount:(signed __int16)a3 error:(id *)a4
{
  char v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000375B4();
  }

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100010F14;
  uint64_t v21 = sub_100010EBC;
  id v22 = 0;
  id obj = 0;
  id v8 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v22, obj);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B928;
  v12[3] = &unk_100051808;
  void v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  uint64_t v14 = &v17;
  signed __int16 v15 = a3;
  [v9 performBlockAndWait:v12];
  if (a4) {
    *a4 = (id) v18[5];
  }
  BOOL v10 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (signed)failedMigrationCountWithError:(id *)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  __int16 v23 = 0;
  uint64_t v14 = 0;
  signed __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100010F14;
  uint64_t v18 = sub_100010EBC;
  id v19 = 0;
  id obj = 0;
  v5 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v19, obj);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002BBDC;
  v9[3] = &unk_1000517B8;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  id v11 = &v14;
  id v12 = &v20;
  [v6 performBlockAndWait:v9];
  if (a3) {
    *a3 = (id) v15[5];
  }
  signed __int16 v7 = *((_WORD *)v21 + 12);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v7;
}

- (BOOL)saveSyncEngineStateSerialization:(id)a3 error:(id *)a4
{
  id v6 = a3;
  signed __int16 v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10003775C(v6, v7);
  }

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100010F14;
  uint64_t v22 = sub_100010EBC;
  id v23 = 0;
  id obj = 0;
  id v8 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v23, obj);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002BE08;
  v13[3] = &unk_1000516F0;
  void v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  uint64_t v16 = &v18;
  id v10 = v6;
  id v15 = v10;
  [v9 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  BOOL v11 = v19[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)syncEngineStateSerializationWithError:(id *)a3
{
  v5 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000377DC();
  }

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100010F14;
  id v25 = sub_100010EBC;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100010F14;
  id v19 = sub_100010EBC;
  id v20 = 0;
  id obj = 0;
  id v6 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v20, obj);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C0AC;
  v10[3] = &unk_1000517B8;
  void v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  id v12 = &v15;
  id v13 = &v21;
  [v7 performBlockAndWait:v10];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v8 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

- (BOOL)saveDeprecatedSyncEngineMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100037810(v6, v7);
  }

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100010F14;
  uint64_t v22 = sub_100010EBC;
  id v23 = 0;
  id obj = 0;
  id v8 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v23, obj);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C2E4;
  v13[3] = &unk_1000516F0;
  void v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  uint64_t v16 = &v18;
  id v10 = v6;
  id v15 = v10;
  [v9 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  BOOL v11 = v19[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)deprecatedSyncEngineMetadataWithError:(id *)a3
{
  v5 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100037890();
  }

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100010F14;
  id v25 = sub_100010EBC;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100010F14;
  id v19 = sub_100010EBC;
  id v20 = 0;
  id obj = 0;
  id v6 = [(SYDCoreDataStore *)self contextForStoreIdentifier:0 error:&obj];
  objc_storeStrong(&v20, obj);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C57C;
  v10[3] = &unk_1000517B8;
  void v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  id v12 = &v15;
  id v13 = &v21;
  [v7 performBlockAndWait:v10];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v8 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

- (id)managedDatabaseCreateIfNecessary:(BOOL)a3 inContext:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = +[SYDManagedDatabase fetchRequest];
  id v20 = 0;
  id v10 = [v9 execute:&v20];
  id v11 = v20;
  if ((unint64_t)[v10 count] >= 2)
  {
    id v12 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100037994();
    }
  }
  uint64_t v13 = [v10 firstObject];
  id v14 = (SYDManagedDatabase *)v13;
  if (v11)
  {
    uint64_t v15 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10003792C();
    }

    uint64_t v16 = [v8 persistentStoreCoordinator];
    [(SYDCoreDataStore *)self handleCorruptionIfNecessaryFromError:v11 inPersistentStoreCoordinator:v16];
  }
  else
  {
    if (v13) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = !v6;
    }
    if (!v17)
    {
      uint64_t v18 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000378C4();
      }

      id v14 = [[SYDManagedDatabase alloc] initWithContext:v8];
    }
  }
  if (a5) {
    *a5 = v11;
  }

  return v14;
}

- (id)managedStoreWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 inContext:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = +[SYDManagedStore fetchRequest];
  uint64_t v13 = +[NSPredicate predicateWithFormat:@"identifier == %@", v10];
  [v12 setPredicate:v13];

  id v24 = 0;
  id v14 = [v12 execute:&v24];
  id v15 = v24;
  if ((unint64_t)[v14 count] >= 2)
  {
    uint64_t v16 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_100037ACC();
    }
  }
  uint64_t v17 = [v14 firstObject];
  uint64_t v18 = (SYDManagedStore *)v17;
  if (v15)
  {
    id v19 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_100037A64();
    }

    id v20 = [v11 persistentStoreCoordinator];
    [(SYDCoreDataStore *)self handleCorruptionIfNecessaryFromError:v15 inPersistentStoreCoordinator:v20];
LABEL_14:

    goto LABEL_15;
  }
  if (!v17 && v8)
  {
    uint64_t v21 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1000379FC();
    }

    uint64_t v18 = [[SYDManagedStore alloc] initWithContext:v11];
    [(SYDManagedStore *)v18 setIdentifier:v10];
    id v23 = 0;
    id v20 = [(SYDCoreDataStore *)self managedDatabaseCreateIfNecessary:1 inContext:v11 error:&v23];
    id v15 = v23;
    [(SYDManagedStore *)v18 setDatabase:v20];
    goto LABEL_14;
  }
LABEL_15:
  if (a6) {
    *a6 = v15;
  }

  return v18;
}

- (id)managedKeyValueWithRecordName:(id)a3 inStoreWithIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[NSPredicate predicateWithFormat:@"recordName == %@", v10];
  v30[0] = v13;
  id v14 = +[NSPredicate predicateWithFormat:@"store.identifier == %@", v11];
  v30[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v30 count:2];

  uint64_t v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];
  uint64_t v17 = [(SYDCoreDataStore *)self managedKeyValuesMatchingPredicate:v16 inContext:v12 error:a6];

  if ((unint64_t)[v17 count] >= 2)
  {
    uint64_t v18 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Found multiple key values for the same record name (%@) in store <(%@)>", buf, 0x16u);
    }
  }
  id v19 = [v17 firstObject];
  if ([v11 length])
  {
    id v20 = 0;
    if (!a6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v22 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100036058();
  }

  NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
  CFStringRef v25 = @"Fetched a managedKeyValue with an empty store identifier";
  id v23 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v20 = +[NSError errorWithDomain:@"SyncedDefaults" code:2222 userInfo:v23];

  if (a6) {
LABEL_7:
  }
    *a6 = v20;
LABEL_8:

  return v19;
}

- (void)clearContexts
{
  v3 = [(SYDCoreDataStore *)self contextsLock];
  [v3 lock];

  objc_super v4 = [(SYDCoreDataStore *)self contexts];
  [v4 removeAllObjects];

  id v5 = [(SYDCoreDataStore *)self contextsLock];
  [v5 unlock];
}

- (BOOL)saveContext:(id)a3 reason:(id)a4 includingTransactionContext:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5
    || ([(SYDCoreDataStore *)self transactionContext],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v10))
  {
    if (![v10 hasChanges])
    {
      id v15 = 0;
      if (!a6) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    id v27 = 0;
    unsigned __int8 v13 = [v10 save:&v27];
    id v14 = v27;
    id v15 = v14;
    if (v13)
    {
      uint64_t v16 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100037C6C();
      }
      goto LABEL_26;
    }
    uint64_t v17 = [v14 domain];
    unsigned int v18 = [v17 isEqualToString:NSSQLiteErrorDomain];

    if (v18)
    {
      id v19 = [v15 code];
      BOOL v20 = 0;
    }
    else
    {
      uint64_t v21 = [v15 domain];
      unsigned int v22 = [v21 isEqualToString:NSCocoaErrorDomain];

      if (!v22) {
        goto LABEL_21;
      }
      id v23 = [v15 userInfo];
      NSErrorUserInfoKey v24 = [v23 objectForKeyedSubscript:NSSQLiteErrorDomain];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v19 = [v24 integerValue];
      }
      else {
        id v19 = 0;
      }
      BOOL v20 = [v15 code] == (id)640;
    }
    if (v19 == (id)13 || v20)
    {
      CFStringRef v25 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100037CD4();
      }
      goto LABEL_25;
    }
LABEL_21:
    CFStringRef v25 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_100037D4C();
    }
LABEL_25:

    uint64_t v16 = [v10 persistentStoreCoordinator];
    [(SYDCoreDataStore *)self handleCorruptionIfNecessaryFromError:v15 inPersistentStoreCoordinator:v16];
    goto LABEL_26;
  }
  uint64_t v16 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100037DB4();
  }
  id v15 = 0;
LABEL_26:

  if (a6) {
LABEL_27:
  }
    *a6 = v15;
LABEL_28:

  return v15 == 0;
}

+ (id)managedObjectModel
{
  if (qword_10005BC38 != -1) {
    dispatch_once(&qword_10005BC38, &stru_1000518A0);
  }
  v2 = (void *)qword_10005BC30;
  return v2;
}

- (void)destroyPersistentStore
{
  id v9 = 0;
  v3 = [(SYDCoreDataStore *)self persistentContainerWithError:&v9];
  id v4 = v9;
  if (v4)
  {
    id v5 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100038128();
    }
  }
  else
  {
    if (v3)
    {
      BOOL v6 = [(SYDCoreDataStore *)self persistentContainerQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002D3E8;
      block[3] = &unk_100050AA0;
      block[4] = self;
      id v8 = v3;
      dispatch_sync(v6, block);

      goto LABEL_7;
    }
    id v5 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000380F4();
    }
  }

LABEL_7:
}

- (void)_queue_destroyPersistentStoreInPersistentStoreCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDCoreDataStore *)self persistentContainerQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    BOOL v6 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100038284(self, v6);
    }

    id v7 = [(SYDCoreDataStore *)self URL];
    id v12 = 0;
    unsigned __int8 v8 = [v4 destroyPersistentStoreAtURL:v7 withType:NSSQLiteStoreType options:0 error:&v12];
    id v9 = v12;

    id v10 = SYDGetCoreDataLog();
    persistentContainer = (NSPersistentContainer *)v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100038190(self, &persistentContainer->super);
      }

      persistentContainer = self->__persistentContainer;
      self->__persistentContainer = 0;
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      sub_10003821C();
    }
  }
}

- (unint64_t)fileSizeBytes
{
  v2 = [(SYDCoreDataStore *)self URL];
  v3 = [v2 lastPathComponent];
  uint64_t v4 = [v3 stringByAppendingString:@"-wal"];

  id v5 = [v2 lastPathComponent];
  uint64_t v6 = [v5 stringByAppendingString:@"-shm"];

  v39[0] = v2;
  id v7 = [v2 URLByDeletingLastPathComponent];
  id v26 = (void *)v4;
  unsigned __int8 v8 = [v7 URLByAppendingPathComponent:v4];
  v39[1] = v8;
  id v27 = v2;
  id v9 = [v2 URLByDeletingLastPathComponent];
  CFStringRef v25 = (void *)v6;
  id v10 = [v9 URLByAppendingPathComponent:v6];
  v39[2] = v10;
  id v11 = +[NSArray arrayWithObjects:v39 count:3];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v13)
  {
    id v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v12);
        }
        unsigned int v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v28 = 0;
        id v29 = 0;
        unsigned int v19 = [v18 getResourceValue:&v29 forKey:NSURLFileSizeKey error:&v28];
        id v20 = v29;
        id v21 = v28;
        if (v19)
        {
          v15 += (unint64_t)[v20 unsignedIntegerValue];
        }
        else
        {
          unsigned int v22 = SYDGetCoreDataLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v35 = v18;
            __int16 v36 = 2112;
            id v37 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error getting file size for %@: %@", buf, 0x16u);
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  id v23 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100038310();
  }

  return v15;
}

- (id)transactionalStoreWithError:(id *)a3
{
  id v12 = 0;
  id v5 = [(SYDCoreDataStore *)self persistentContainerWithError:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = [SYDCoreDataStore alloc];
    unsigned __int8 v8 = [(SYDCoreDataStore *)self URL];
    id v9 = [(SYDCoreDataStore *)self fileProtectionType];
    id v10 = [(SYDCoreDataStore *)v7 initWithURL:v8 fileProtectionType:v9 persistentContainer:v5 isTransactional:1];
  }
  else
  {
    unsigned __int8 v8 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100038384();
    }
    id v10 = 0;
  }

  if (a3) {
    *a3 = v6;
  }

  return v10;
}

- (BOOL)saveTransaction:(id *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100010F14;
  uint64_t v17 = sub_100010EBC;
  id v18 = 0;
  id v5 = [(SYDCoreDataStore *)self transactionContext];

  if (v5)
  {
    id v6 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100038420();
    }

    id v7 = [(SYDCoreDataStore *)self transactionContext];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002DB48;
    v12[3] = &unk_100050A78;
    void v12[4] = self;
    void v12[5] = &v13;
    [v7 performBlockAndWait:v12];

    unsigned __int8 v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"TransactionStoreDidSave" object:self];

    if (a3) {
LABEL_5:
    }
      *a3 = (id) v14[5];
  }
  else
  {
    id v11 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1000383EC();
    }

    if (a3) {
      goto LABEL_5;
    }
  }
  BOOL v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (void)transactionStoreDidSave:(id)a3
{
  uint64_t v4 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "A transaction store saved, clearing cached contexts", v5, 2u);
  }

  [(SYDCoreDataStore *)self clearContexts];
}

- (void)handleCorruptionIfNecessaryFromError:(id)a3 inPersistentStoreCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(SYDCoreDataStore *)self persistentContainerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DD14;
  block[3] = &unk_100050B90;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

+ (BOOL)isCorruptionError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:NSCocoaErrorDomain])
  {
    id v5 = [v3 code];

    if (v5 == (id)259)
    {
      id v6 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_100038454();
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v7 = [v3 userInfo];
  unsigned __int8 v8 = [v7 objectForKeyedSubscript:NSSQLiteErrorDomain];
  unsigned int v9 = [v8 isEqual:&off_100053DC8];

  if (v9)
  {
    id v6 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000384BC();
    }
  }
  else
  {
    id v10 = [v3 userInfo];
    id v11 = [v10 objectForKeyedSubscript:NSSQLiteErrorDomain];
    unsigned int v12 = [v11 isEqual:&off_100053DE0];

    if (!v12)
    {
      BOOL v13 = 0;
      goto LABEL_13;
    }
    id v6 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100038524();
    }
  }
LABEL_12:

  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (BOOL)_queue_handleCorruptionIfNecessaryFromError:(id)a3 inPersistentStoreCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(SYDCoreDataStore *)self persistentContainerQueue];
  dispatch_assert_queue_V2(v8);

  if (v6 && [(id)objc_opt_class() isCorruptionError:v6])
  {
    unsigned int v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10003858C();
    }

    [(SYDCoreDataStore *)self _queue_destroyPersistentStoreInPersistentStoreCoordinator:v7];
    id v10 = +[NSMutableDictionary dictionary];
    id v11 = [v6 domain];
    [v10 setObject:v11 forKeyedSubscript:@"errorDomain"];

    unsigned int v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    [v10 setObject:v12 forKeyedSubscript:@"errorCode"];

    BOOL v13 = [v6 userInfo];
    id v14 = [v13 objectForKeyedSubscript:NSSQLiteErrorDomain];

    if (v14)
    {
      uint64_t v15 = [v6 userInfo];
      uint64_t v16 = [v15 objectForKeyedSubscript:NSSQLiteErrorDomain];
      [v10 setObject:v16 forKeyedSubscript:@"sqliteError"];
    }
    AnalyticsSendEvent();

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)isInvalidTokenError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if (![v4 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_7;
  }
  if ([v3 code] != (id)134301 && objc_msgSend(v3, "code") != (id)134501)
  {
    id v7 = [v3 code];

    if (v7 == (id)4864) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }

LABEL_5:
  BOOL v5 = 1;
LABEL_8:

  return v5;
}

- (NSPersistentContainer)_persistentContainer
{
  return self->__persistentContainer;
}

- (void)set_persistentContainer:(id)a3
{
}

- (void)setURL:(id)a3
{
}

- (NSString)fileProtectionType
{
  return self->_fileProtectionType;
}

- (void)setFileProtectionType:(id)a3
{
}

- (BOOL)shouldLogValues
{
  return self->_shouldLogValues;
}

- (void)setShouldLogValues:(BOOL)a3
{
  self->_shouldLogValues = a3;
}

- (void)setPersistentContainerQueue:(id)a3
{
}

- (void)setTransactionContext:(id)a3
{
}

- (void)setContexts:(id)a3
{
}

- (void)setContextsLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextsLock, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_transactionContext, 0);
  objc_storeStrong((id *)&self->_persistentContainerQueue, 0);
  objc_storeStrong((id *)&self->_fileProtectionType, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->__persistentContainer, 0);
}

@end