@interface MBCKDatabaseManager
+ (BOOL)fetchedSyncZoneWithAccount:(id)a3;
+ (CKRecordZoneID)defaultZoneID;
+ (CKRecordZoneID)syncZoneID;
+ (id)zoneIDOfType:(unint64_t)a3;
+ (void)_cacheSyncZoneFetchedWithAccount:(id)a3;
+ (void)_clearSyncZoneFetchedWithAccount:(id)a3;
- (BOOL)fetchDeviceToDeviceEncryptionSupportedByAccount:(BOOL *)a3 account:(id)a4 error:(id *)a5;
- (BOOL)resetDatabaseWithAccount:(id)a3 policy:(id)a4 operationGroup:(id)a5 error:(id *)a6;
- (BOOL)resetDatabaseWithError:(id *)a3;
- (BOOL)setUpSyncZoneWithAccount:(id)a3 policy:(id)a4 operationGroup:(id)a5 xpcActivity:(id)a6 error:(id *)a7;
- (BOOL)shouldSupportBudgeting;
- (BOOL)useSandbox;
- (MBCKDatabaseManager)initWithSandbox:(BOOL)a3;
- (NSMutableDictionary)containersByPersonaIdentifier;
- (NSObject)accountObserver;
- (NSOperationQueue)operationQueue;
- (NSString)containerID;
- (id)_configureModifyRecordsOperation:(id)a3 container:(id)a4;
- (id)_createContainerWithSyncZoneForAccount:(id)a3 policy:(id)a4 operationGroup:(id)a5 xpcActivity:(id)a6 error:(id *)a7;
- (id)_makeContainerForAccount:(id)a3;
- (int64_t)requestsToSupportBudget;
- (void)_addDatabaseOperation:(id)a3 account:(id)a4 container:(id)a5 policy:(id)a6 operationGroup:(id)a7 xpcActivity:(id)a8;
- (void)_configureCKOperation:(id)a3 container:(id)a4 policy:(id)a5 operationGroup:(id)a6 xpcActivity:(id)a7;
- (void)_handleAccountChangeNotification:(id)a3;
- (void)_removeContainerForPersonaIdentifier:(id)a3;
- (void)_setUpSyncZoneWithContainer:(id)a3 policy:(id)a4 operationGroup:(id)a5 xpcActivity:(id)a6 completion:(id)a7;
- (void)addDatabaseOperation:(id)a3 account:(id)a4 policy:(id)a5 operationGroup:(id)a6 xpcActivity:(id)a7;
- (void)addDatabaseOperation:(id)a3 container:(id)a4 policy:(id)a5 operationGroup:(id)a6;
- (void)dealloc;
- (void)fetchConfigurationWithAccount:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)setAccountObserver:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setContainersByPersonaIdentifier:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setRequestsToSupportBudget:(int64_t)a3;
- (void)setShouldSupportBudgeting:(BOOL)a3 account:(id)a4;
- (void)setUseSandbox:(BOOL)a3;
- (void)submitCKEventMetric:(id)a3 account:(id)a4 completionHandler:(id)a5;
@end

@implementation MBCKDatabaseManager

- (MBCKDatabaseManager)initWithSandbox:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MBCKDatabaseManager;
  v4 = [(MBCKDatabaseManager *)&v17 init];
  if (v4)
  {
    v5 = objc_opt_new();
    [(MBCKDatabaseManager *)v4 setContainersByPersonaIdentifier:v5];

    [(MBCKDatabaseManager *)v4 setUseSandbox:MBIsInternalInstall() & v3];
    v6 = objc_opt_new();
    [v6 setName:@"com.apple.backupd.ck.operations"];
    [v6 setMaxConcurrentOperationCount:7];
    [v6 setQualityOfService:17];
    [(MBCKDatabaseManager *)v4 setOperationQueue:v6];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.backupd.ck.notifications", v7);

    v9 = objc_opt_new();
    [v9 setMaxConcurrentOperationCount:1];
    [v9 setQualityOfService:17];
    [v9 setUnderlyingQueue:v8];
    objc_initWeak(&location, v4);
    v10 = +[NSNotificationCenter defaultCenter];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10014C84C;
    v14[3] = &unk_100414720;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = [v10 addObserverForName:CKAccountChangedNotification object:0 queue:v9 usingBlock:v14];
    accountObserver = v4->_accountObserver;
    v4->_accountObserver = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  if (self->_accountObserver)
  {
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_accountObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)MBCKDatabaseManager;
  [(MBCKDatabaseManager *)&v4 dealloc];
}

- (void)_handleAccountChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received notification: %@", buf, 0xCu);

    dispatch_queue_t v8 = [v4 name];
    _MBLog();
  }
  v7 = [(MBCKDatabaseManager *)self containersByPersonaIdentifier];
  [v7 enumerateKeysAndObjectsUsingBlock:&stru_100414760];
}

+ (void)_clearSyncZoneFetchedWithAccount:(id)a3
{
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 accountIdentifier];
    *(_DWORD *)buf = 138543618;
    CFStringRef v9 = @"SyncZoneFetched";
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing \"%{public}@\" for account %{public}@", buf, 0x16u);

    v7 = [v3 accountIdentifier];
    _MBLog();
  }
  v6 = [v3 persona];
  [v6 setPreferencesValue:0 forKey:@"SyncZoneFetched"];
}

+ (void)_cacheSyncZoneFetchedWithAccount:(id)a3
{
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 accountIdentifier];
    *(_DWORD *)buf = 138543618;
    CFStringRef v9 = @"SyncZoneFetched";
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Caching \"%{public}@\" for account %{public}@", buf, 0x16u);

    v7 = [v3 accountIdentifier];
    _MBLog();
  }
  v6 = [v3 persona];
  [v6 setPreferencesValue:&__kCFBooleanTrue forKey:@"SyncZoneFetched"];
}

+ (BOOL)fetchedSyncZoneWithAccount:(id)a3
{
  char v7 = 0;
  id v3 = [a3 persona];
  unsigned int v4 = [v3 getBooleanValueForKey:@"SyncZoneFetched" keyExists:&v7];

  if (v7) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

+ (CKRecordZoneID)defaultZoneID
{
  if (qword_100482550 != -1) {
    dispatch_once(&qword_100482550, &stru_1004147A8);
  }
  v2 = (void *)qword_100482548;
  return (CKRecordZoneID *)v2;
}

+ (CKRecordZoneID)syncZoneID
{
  if (qword_100482560 != -1) {
    dispatch_once(&qword_100482560, &stru_1004147C8);
  }
  v2 = (void *)qword_100482558;
  return (CKRecordZoneID *)v2;
}

+ (id)zoneIDOfType:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [a1 syncZoneID];
  }
  else
  {
    if (a3 != 1) {
      __assert_rtn("+[MBCKDatabaseManager zoneIDOfType:]", "MBCKDatabaseManager.m", 220, "0 && \"Unexpected call\"");
    }
    id v3 = [a1 defaultZoneID];
  }
  return v3;
}

- (void)setShouldSupportBudgeting:(BOOL)a3 account:(id)a4
{
  BOOL v4 = a3;
  id v12 = a4;
  v6 = -[MBCKDatabaseManager _makeContainerForAccount:](self, "_makeContainerForAccount:");
  char v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 ckContainer];
    if (!v8) {
      __assert_rtn("-[MBCKDatabaseManager setShouldSupportBudgeting:account:]", "MBCKDatabaseManager.m", 229, "ckContainer");
    }
    CFStringRef v9 = (void *)v8;
    __int16 v10 = self;
    objc_sync_enter(v10);
    if (v4) {
      uint64_t v11 = (char *)[(MBCKDatabaseManager *)v10 requestsToSupportBudget] + 1;
    }
    else {
      uint64_t v11 = (char *)[(MBCKDatabaseManager *)v10 requestsToSupportBudget] - 1;
    }
    [(MBCKDatabaseManager *)v10 setRequestsToSupportBudget:v11];
    if ([(MBCKDatabaseManager *)v10 requestsToSupportBudget]) {
      [v9 setSourceApplicationSecondaryIdentifier:@"com.apple.icloud.restore"];
    }
    else {
      [v9 setSourceApplicationSecondaryIdentifier:0];
    }
    objc_sync_exit(v10);
  }
}

- (BOOL)shouldSupportBudgeting
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(MBCKDatabaseManager *)v2 requestsToSupportBudget] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setUpSyncZoneWithContainer:(id)a3 policy:(id)a4 operationGroup:(id)a5 xpcActivity:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v40 = a7;
  if (!v12) {
    __assert_rtn("-[MBCKDatabaseManager _setUpSyncZoneWithContainer:policy:operationGroup:xpcActivity:completion:]", "MBCKDatabaseManager.m", 254, "container");
  }
  if (!v13) {
    __assert_rtn("-[MBCKDatabaseManager _setUpSyncZoneWithContainer:policy:operationGroup:xpcActivity:completion:]", "MBCKDatabaseManager.m", 255, "policy");
  }
  v38 = v15;
  v42 = [v12 account];
  v16 = self;
  objc_super v17 = [v12 personaIdentifier];
  v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v42 accountIdentifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Creating the sync zone for account %{public}@(%{public}@)", buf, 0x16u);

    v36 = [v42 accountIdentifier];
    _MBLog();
  }
  v20 = [v12 ckDatabase];
  if (!v20) {
    __assert_rtn("-[MBCKDatabaseManager _setUpSyncZoneWithContainer:policy:operationGroup:xpcActivity:completion:]", "MBCKDatabaseManager.m", 262, "database");
  }
  v21 = [(id)objc_opt_class() syncZoneID];
  if (!v21) {
    __assert_rtn("-[MBCKDatabaseManager _setUpSyncZoneWithContainer:policy:operationGroup:xpcActivity:completion:]", "MBCKDatabaseManager.m", 264, "syncZoneID");
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v59 = sub_10014D7D0;
  v60 = sub_10014D7E0;
  id v61 = 0;
  v22 = dispatch_group_create();
  dispatch_group_enter(v22);
  id v23 = objc_alloc((Class)CKFetchRecordZonesOperation);
  v57 = v21;
  v24 = +[NSArray arrayWithObjects:&v57 count:1];
  id v25 = [v23 initWithRecordZoneIDs:v24];

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10014D7E8;
  v47[3] = &unk_100414818;
  id v37 = v21;
  id v48 = v37;
  v56 = buf;
  v26 = v22;
  v49 = v26;
  v50 = v16;
  id v27 = v12;
  id v51 = v27;
  id v28 = v13;
  id v52 = v28;
  id v29 = v14;
  id v53 = v29;
  id v30 = v38;
  id v54 = v30;
  id v31 = v20;
  id v55 = v31;
  [v25 setFetchRecordZonesCompletionBlock:v47];
  [(MBCKDatabaseManager *)v16 _configureCKOperation:v25 container:v27 policy:v28 operationGroup:v29 xpcActivity:v30];
  [v31 addOperation:v25];
  v39 = v27;
  uint64_t v32 = dispatch_get_global_queue(17, 0);
  v33 = v16;
  v34 = v32;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014DD24;
  block[3] = &unk_100414840;
  block[4] = v33;
  id v44 = v42;
  v46 = buf;
  id v45 = v40;
  id v41 = v40;
  id v35 = v42;
  dispatch_group_notify(v26, v34, block);

  _Block_object_dispose(buf, 8);
}

- (BOOL)setUpSyncZoneWithAccount:(id)a3 policy:(id)a4 operationGroup:(id)a5 xpcActivity:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12) {
    __assert_rtn("-[MBCKDatabaseManager setUpSyncZoneWithAccount:policy:operationGroup:xpcActivity:error:]", "MBCKDatabaseManager.m", 318, "account");
  }
  if (!a7) {
    __assert_rtn("-[MBCKDatabaseManager setUpSyncZoneWithAccount:policy:operationGroup:xpcActivity:error:]", "MBCKDatabaseManager.m", 319, "error");
  }
  v16 = v15;
  [(id)objc_opt_class() _clearSyncZoneFetchedWithAccount:v12];
  objc_super v17 = [(MBCKDatabaseManager *)self _createContainerWithSyncZoneForAccount:v12 policy:v13 operationGroup:v14 xpcActivity:v16 error:a7];
  BOOL v18 = v17 != 0;

  return v18;
}

- (BOOL)resetDatabaseWithAccount:(id)a3 policy:(id)a4 operationGroup:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v35 = a5;
  if (!v10) {
    __assert_rtn("-[MBCKDatabaseManager resetDatabaseWithAccount:policy:operationGroup:error:]", "MBCKDatabaseManager.m", 327, "account");
  }
  if (!v11) {
    __assert_rtn("-[MBCKDatabaseManager resetDatabaseWithAccount:policy:operationGroup:error:]", "MBCKDatabaseManager.m", 328, "policy");
  }
  [(id)objc_opt_class() _clearSyncZoneFetchedWithAccount:v10];
  id v12 = [[MBCKContainer alloc] initWithAccount:v10 useSandbox:[(MBCKDatabaseManager *)self useSandbox]];
  if (v12)
  {
    id v13 = v12;
    id v14 = [(id)objc_opt_class() syncZoneID];
    v46[0] = v14;
    id v15 = [(id)objc_opt_class() defaultZoneID];
    v46[1] = v15;
    v16 = +[NSArray arrayWithObjects:v46 count:2];

    objc_super v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v18 = [v10 persona];
      v19 = [v18 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Deleting all CK zones for persona:%@: %{public}@", buf, 0x16u);

      v20 = [v10 persona];
      v34 = [v20 personaIdentifier];
      _MBLog();
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v43 = sub_10014D7D0;
    id v44 = sub_10014D7E0;
    id v45 = 0;
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    id v22 = [objc_alloc((Class)CKModifyRecordZonesOperation) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v16];
    id v23 = [v22 operationID];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10014E33C;
    v37[3] = &unk_100414868;
    id v24 = v16;
    id v38 = v24;
    id v25 = v23;
    id v39 = v25;
    id v41 = buf;
    v26 = v21;
    id v40 = v26;
    [v22 setModifyRecordZonesCompletionBlock:v37];
    [(MBCKDatabaseManager *)self addDatabaseOperation:v22 container:v13 policy:v11 operationGroup:v35];
    MBSemaphoreWaitForever();
    id v27 = *(void **)(*(void *)&buf[8] + 40);
    if (v27)
    {
      BOOL v28 = 0;
      if (a6) {
        *a6 = v27;
      }
    }
    else
    {
      id v29 = [v10 persona];
      id v30 = [v29 personaIdentifier];
      [(MBCKDatabaseManager *)self _removeContainerForPersonaIdentifier:v30];

      id v31 = (id *)(*(void *)&buf[8] + 40);
      id obj = *(id *)(*(void *)&buf[8] + 40);
      uint64_t v32 = [(MBCKDatabaseManager *)self _createContainerWithSyncZoneForAccount:v10 policy:v11 operationGroup:v35 xpcActivity:0 error:&obj];
      objc_storeStrong(v31, obj);

      BOOL v28 = v32 != 0;
      id v13 = (void *)v32;
    }

    _Block_object_dispose(buf, 8);
  }
  else if (a6)
  {
    +[MBError errorWithCode:1 format:@"nil container"];
    BOOL v28 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)resetDatabaseWithError:(id *)a3
{
  BOOL v5 = [MBServiceAccount alloc];
  v6 = +[UMUserPersona currentPersona];
  char v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:a3];

  if (v7)
  {
    uint64_t v8 = +[MBCKOperationPolicy expensiveCellularPolicy];
    CFStringRef v9 = [v8 operationGroupWithName:@"resetDatabase" processName:0];
    BOOL v10 = [(MBCKDatabaseManager *)self resetDatabaseWithAccount:v7 policy:v8 operationGroup:v9 error:a3];
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "nil service account", v13, 2u);
      _MBLog();
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (id)_configureModifyRecordsOperation:(id)a3 container:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 396, "operation");
  }
  char v7 = v6;
  if (!v6) {
    __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 397, "container");
  }
  [v5 recordsToSave];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v36;
    do
    {
      id v13 = 0;
      id v14 = (void *)v11;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v8);
        }
        id v15 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v13) recordID];
        uint64_t v11 = [v15 zoneID];

        if (v14 && ([v14 isEqual:v11] & 1) == 0) {
          __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 404, "!saveZoneID || [saveZoneID isEqual:currentZoneID]");
        }

        id v13 = (char *)v13 + 1;
        id v14 = (void *)v11;
      }
      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  if ([v8 count] && !v11) {
    __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 407, "!records.count || saveZoneID != nil");
  }
  [v5 recordIDsToDelete];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v32;
    do
    {
      dispatch_semaphore_t v21 = 0;
      id v22 = (void *)v19;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v19 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v21) zoneID];
        if (v22 && ([v22 isEqual:v19] & 1) == 0) {
          __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 414, "!deleteZoneID || [deleteZoneID isEqual:currentZoneID]");
        }

        dispatch_semaphore_t v21 = (char *)v21 + 1;
        id v22 = (void *)v19;
      }
      while (v18 != v21);
      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v19 = 0;
  }

  if ([v16 count] && !v19) {
    __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 417, "!recordIDs.count || deleteZoneID != nil");
  }
  if (v11 | v19)
  {
    if (v11 && v19 && ([(id)v11 isEqual:v19] & 1) == 0) {
      __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 427, "!saveZoneID || !deleteZoneID || [saveZoneID isEqual:deleteZoneID]");
    }
    if (v11) {
      id v23 = (void *)v11;
    }
    else {
      id v23 = (void *)v19;
    }
    id v24 = v23;
    id v25 = [(id)objc_opt_class() defaultZoneID];
    unsigned int v26 = [v24 isEqual:v25];

    if (v26)
    {
      id v27 = [v7 ckDatabaseWithZoneWidePCS];
      [v5 setAtomic:0];
    }
    else
    {
      id v27 = [v7 ckDatabase];
    }
    if (!v27) {
      __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 435, "database");
    }
    [v5 setDatabase:v27];
    id v29 = v27;
  }
  else
  {
    BOOL v28 = [v7 ckDatabase];
    if (!v28) {
      __assert_rtn("-[MBCKDatabaseManager _configureModifyRecordsOperation:container:]", "MBCKDatabaseManager.m", 423, "database");
    }
    id v29 = v28;
  }

  return v29;
}

- (void)_configureCKOperation:(id)a3 container:(id)a4 policy:(id)a5 operationGroup:(id)a6 xpcActivity:(id)a7
{
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v12) {
    __assert_rtn("-[MBCKDatabaseManager _configureCKOperation:container:policy:operationGroup:xpcActivity:]", "MBCKDatabaseManager.m", 441, "container");
  }
  if (!v13) {
    __assert_rtn("-[MBCKDatabaseManager _configureCKOperation:container:policy:operationGroup:xpcActivity:]", "MBCKDatabaseManager.m", 442, "policy");
  }
  id v16 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [(MBCKDatabaseManager *)self _configureModifyRecordsOperation:v24 container:v12];
  }
  else
  {
    id v17 = [v12 ckDatabase];
    [v24 setDatabase:v17];
  }
  if (!v17) {
    __assert_rtn("-[MBCKDatabaseManager _configureCKOperation:container:policy:operationGroup:xpcActivity:]", "MBCKDatabaseManager.m", 450, "database");
  }
  id v18 = objc_opt_new();
  uint64_t v19 = [v17 container];
  [v18 setContainer:v19];

  uint64_t v20 = [v13 cellularAccess];
  dispatch_semaphore_t v21 = v20;
  if (v20)
  {
    id v22 = [v20 allowsExpensiveNetworkAccess];
    [v18 setAllowsCellularAccess:1];
    [v18 setAllowsExpensiveNetworkAccess:v22];
  }
  else
  {
    [v18 setAllowsCellularAccess:0];
  }
  objc_msgSend(v18, "setQualityOfService:", objc_msgSend(v13, "qualityOfService"));
  objc_msgSend(v18, "setAutomaticallyRetryNetworkFailures:", objc_msgSend(v13, "automaticallyRetryNetworkFailures"));
  if (v16) {
    [v18 setXpcActivity:v16];
  }
  else {
    [v18 setDiscretionaryNetworkBehavior:0];
  }
  [v24 setConfiguration:v18];
  if (v14)
  {
    id v23 = [v24 group];

    if (!v23) {
      [v24 setGroup:v14];
    }
  }
}

- (void)_addDatabaseOperation:(id)a3 account:(id)a4 container:(id)a5 policy:(id)a6 operationGroup:(id)a7 xpcActivity:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = (uint64_t)a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v15) {
    __assert_rtn("-[MBCKDatabaseManager _addDatabaseOperation:account:container:policy:operationGroup:xpcActivity:]", "MBCKDatabaseManager.m", 475, "account");
  }
  uint64_t v20 = v19;
  if (v16)
  {
    dispatch_semaphore_t v21 = 0;
    BOOL v22 = 1;
LABEL_6:
    [(MBCKDatabaseManager *)self _configureCKOperation:v14 container:v16 policy:v17 operationGroup:v18 xpcActivity:v20];
    if (MBIsInternalInstall())
    {
      id v46 = v17;
      id v24 = [v14 group];
      id v25 = [v24 name];

      if (v25 || dword_100482540)
      {
        id v17 = v46;
      }
      else
      {
        id v17 = v46;
        if (!atomic_fetch_add_explicit(&dword_100482540, 1u, memory_order_relaxed))
        {
          long long v33 = MBGetDefaultLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            uint64_t v43 = objc_opt_class();
            long long v34 = [v14 operationID];
            [v14 group];
            long long v35 = v45 = v33;
            *(_DWORD *)buf = 138413058;
            uint64_t v49 = v43;
            __int16 v50 = 2112;
            id v51 = v34;
            __int16 v52 = 2112;
            id v53 = v18;
            __int16 v54 = 2112;
            id v55 = v35;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "%@(%@) doesn't have a group name: %@, %@", buf, 0x2Au);

            uint64_t v44 = objc_opt_class();
            long long v36 = [v14 operationID];
            [v14 group];
            v42 = id v41 = v18;
            uint64_t v37 = v44;
            id v39 = v36;
            _MBLog();

            long long v33 = v45;
            id v17 = v46;
          }
        }
      }
    }
    goto LABEL_10;
  }
  id v47 = 0;
  uint64_t v16 = [(MBCKDatabaseManager *)self _createContainerWithSyncZoneForAccount:v15 policy:v17 operationGroup:v18 xpcActivity:v19 error:&v47];
  unint64_t v23 = (unint64_t)v47;
  BOOL v22 = v23 == 0;
  if (!(v16 | v23)) {
    __assert_rtn("-[MBCKDatabaseManager _addDatabaseOperation:account:container:policy:operationGroup:xpcActivity:]", "MBCKDatabaseManager.m", 479, "container || localError");
  }
  dispatch_semaphore_t v21 = (void *)v23;
  if (v16) {
    goto LABEL_6;
  }
LABEL_10:
  uint64_t v26 = [(MBCKDatabaseManager *)self operationQueue];
  if (!v26) {
    __assert_rtn("-[MBCKDatabaseManager _addDatabaseOperation:account:container:policy:operationGroup:xpcActivity:]", "MBCKDatabaseManager.m", 488, "operationQueue");
  }
  id v27 = (void *)v26;
  if (!v22)
  {
    id v28 = v17;
    id v29 = [v14 operationID];
    id v30 = +[MBError errorWithCode:202, v21, @"Failed to configure operation %@", v29 error format];

    long long v31 = MBGetDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      long long v32 = [v14 operationID];
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = (uint64_t)v32;
      __int16 v50 = 2114;
      id v51 = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Canceling operation %{public}@ since we don't have a container: %{public}@", buf, 0x16u);

      long long v38 = [v14 operationID];
      id v40 = v30;
      _MBLog();
    }
    [v14 cancelWithUnderlyingError:v30];

    id v17 = v28;
  }
  objc_msgSend(v27, "addOperation:", v14, v38, v40);
}

- (void)addDatabaseOperation:(id)a3 container:(id)a4 policy:(id)a5 operationGroup:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 account];
  [(MBCKDatabaseManager *)self _addDatabaseOperation:v13 account:v14 container:v12 policy:v11 operationGroup:v10 xpcActivity:0];
}

- (void)addDatabaseOperation:(id)a3 account:(id)a4 policy:(id)a5 operationGroup:(id)a6 xpcActivity:(id)a7
{
}

- (void)submitCKEventMetric:(id)a3 account:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (!v8) {
    __assert_rtn("-[MBCKDatabaseManager submitCKEventMetric:account:completionHandler:]", "MBCKDatabaseManager.m", 508, "account");
  }
  id v10 = v9;
  id v11 = [(MBCKDatabaseManager *)self _makeContainerForAccount:v8];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 ckContainer];
    [v13 submitEventMetric:v14 completionHandler:v10];
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

- (BOOL)fetchDeviceToDeviceEncryptionSupportedByAccount:(BOOL *)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (!a3) {
    __assert_rtn("-[MBCKDatabaseManager fetchDeviceToDeviceEncryptionSupportedByAccount:account:error:]", "MBCKDatabaseManager.m", 519, "enabled");
  }
  id v9 = v8;
  if (!v8) {
    __assert_rtn("-[MBCKDatabaseManager fetchDeviceToDeviceEncryptionSupportedByAccount:account:error:]", "MBCKDatabaseManager.m", 520, "account");
  }
  if (!a5) {
    __assert_rtn("-[MBCKDatabaseManager fetchDeviceToDeviceEncryptionSupportedByAccount:account:error:]", "MBCKDatabaseManager.m", 521, "error");
  }
  id v10 = [(MBCKDatabaseManager *)self _makeContainerForAccount:v8];
  id v11 = v10;
  if (!v10)
  {
    +[MBError errorWithCode:1 format:@"nil container"];
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  id v12 = [v10 ckContainer];
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_10014D7D0;
  v42 = sub_10014D7E0;
  id v43 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = sub_10014D7D0;
  long long v36 = sub_10014D7E0;
  id v37 = 0;
  id v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10014F990;
  v28[3] = &unk_100414890;
  id v30 = &v38;
  long long v31 = &v32;
  id v14 = v13;
  id v29 = v14;
  [v12 accountInfoWithCompletionHandler:v28];
  MBGroupWaitForever();
  if (v39[5])
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v39[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to fetch the CK account info: %@", buf, 0xCu);
      _MBLog();
    }

    id v17 = (id) v39[5];
  }
  else
  {
    if (v33[5])
    {
      BOOL v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = v33[5];
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fetched the CK account info: %{public}@", buf, 0xCu);
        _MBLog();
      }

      if ([(id)v33[5] accountStatus] != (id)1)
      {
        BOOL v18 = 1;
        goto LABEL_11;
      }
      unsigned __int8 v24 = [(id)v33[5] deviceToDeviceEncryptionAvailability];
      int v19 = v24 & 1;
      *a3 = v24 & 1;
      BOOL v18 = 1;
      if (!*a5 || (v24 & 1) == 0) {
        goto LABEL_12;
      }
      id v25 = "!*error || !isDeviceToDeviceEncryptionSupportedByAccount";
      int v26 = 562;
LABEL_32:
      __assert_rtn("-[MBCKDatabaseManager fetchDeviceToDeviceEncryptionSupportedByAccount:account:error:]", "MBCKDatabaseManager.m", v26, v25);
    }
    id v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "nil CK account info", buf, 2u);
      _MBLog();
    }

    id v17 = +[MBError errorWithCode:1 format:@"nil CK account info"];
  }
  *a5 = v17;
  if (!v17)
  {
    id v25 = "result || *error";
    int v26 = 559;
    goto LABEL_32;
  }
  BOOL v18 = 0;
LABEL_11:
  int v19 = 0;
  *a3 = 0;
LABEL_12:
  uint64_t v20 = MBGetDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "isDeviceToDeviceEncryptionSupportedByAccount:%{BOOL}d", buf, 8u);
    _MBLog();
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

LABEL_16:
  return v18;
}

- (id)_makeContainerForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 persona];
  id v6 = [v5 personaIdentifier];

  char v7 = self;
  objc_sync_enter(v7);
  id v8 = [(MBCKDatabaseManager *)v7 containersByPersonaIdentifier];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    id v9 = [[MBCKContainer alloc] initWithAccount:v4 useSandbox:[(MBCKDatabaseManager *)v7 useSandbox]];
    if (v9)
    {
      id v10 = [(MBCKDatabaseManager *)v7 containersByPersonaIdentifier];
      [v10 setObject:v9 forKeyedSubscript:v6];
    }
  }
  objc_sync_exit(v7);

  return v9;
}

- (id)_createContainerWithSyncZoneForAccount:(id)a3 policy:(id)a4 operationGroup:(id)a5 xpcActivity:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v33 = a6;
  if (!v12) {
    __assert_rtn("-[MBCKDatabaseManager _createContainerWithSyncZoneForAccount:policy:operationGroup:xpcActivity:error:]", "MBCKDatabaseManager.m", 584, "account");
  }
  if (!a7) {
    __assert_rtn("-[MBCKDatabaseManager _createContainerWithSyncZoneForAccount:policy:operationGroup:xpcActivity:error:]", "MBCKDatabaseManager.m", 585, "error");
  }
  uint64_t v32 = a7;
  id v15 = [v12 persona];
  uint64_t v16 = [v15 personaIdentifier];

  if (!v16) {
    __assert_rtn("-[MBCKDatabaseManager _createContainerWithSyncZoneForAccount:policy:operationGroup:xpcActivity:error:]", "MBCKDatabaseManager.m", 587, "personaIdentifier");
  }
  id v17 = self;
  objc_sync_enter(v17);
  BOOL v18 = [(MBCKDatabaseManager *)v17 containersByPersonaIdentifier];
  int v19 = [v18 objectForKeyedSubscript:v16];

  if (!v19)
  {
    int v19 = [[MBCKContainer alloc] initWithAccount:v12 useSandbox:[(MBCKDatabaseManager *)v17 useSandbox]];
    if (!v19)
    {
      +[MBError errorWithCode:1 format:@"nil container"];
      int v19 = 0;
      unsigned __int8 v24 = 0;
      *uint64_t v32 = (id)objc_claimAutoreleasedReturnValue();
      int v25 = 1;
      goto LABEL_32;
    }
  }
  uint64_t v20 = +[MBCKRemoteConfiguration sharedInstance];
  unsigned int v21 = [v20 shouldReloadConfigurationWithAccount:v12];
  unsigned int v22 = [(MBCKContainer *)v19 fetchedSyncZone];
  if ((v22 ^ 1 | v21))
  {
    uint64_t v23 = dispatch_group_create();
    if (!v21) {
      goto LABEL_16;
    }
    if (v13)
    {
      if (!v14) {
        goto LABEL_14;
      }
    }
    else
    {
      id v13 = +[MBCKOperationPolicy expensiveCellularPolicy];
      if (!v14)
      {
LABEL_14:
        id v14 = [v13 operationGroupWithName:@"setUpSyncZone" processName:0];
      }
    }
    dispatch_group_enter(v23);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001500F4;
    v43[3] = &unk_100411060;
    uint64_t v44 = v23;
    [v20 loadConfigurationWithContainer:v19 databaseManager:v17 policy:v13 operationGroup:v14 completion:v43];

LABEL_16:
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = sub_10014D7D0;
    id v41 = sub_10014D7E0;
    id v42 = 0;
    if (v22)
    {
      int v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v26 = v26;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = [(id)objc_opt_class() syncZoneID];
          *(_DWORD *)buf = 138543362;
          id v46 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Sync zone %{public}@ already exists", buf, 0xCu);
        }
        long long v31 = [(id)objc_opt_class() syncZoneID];
        _MBLog();
      }
      goto LABEL_27;
    }
    if (v13)
    {
      if (!v14) {
        goto LABEL_25;
      }
    }
    else
    {
      id v13 = +[MBCKOperationPolicy expensiveCellularPolicy];
      if (!v14)
      {
LABEL_25:
        id v14 = [v13 operationGroupWithName:@"setUpSyncZone" processName:0];
      }
    }
    dispatch_group_enter(v23);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1001500FC;
    v34[3] = &unk_100410FC8;
    long long v36 = &v37;
    long long v35 = v23;
    [(MBCKDatabaseManager *)v17 _setUpSyncZoneWithContainer:v19 policy:v13 operationGroup:v14 xpcActivity:v33 completion:v34];
    int v26 = v35;
LABEL_27:

    MBGroupWaitForever();
    id v28 = (void *)v38[5];
    if (v28)
    {
      *uint64_t v32 = v28;
      int v25 = 1;
    }
    else
    {
      id v29 = [(MBCKDatabaseManager *)v17 containersByPersonaIdentifier];
      [v29 setObject:v19 forKeyedSubscript:v16];

      int v25 = 0;
    }
    _Block_object_dispose(&v37, 8);

    unsigned __int8 v24 = 0;
    goto LABEL_31;
  }
  unsigned __int8 v24 = v19;
  int v25 = 1;
LABEL_31:

LABEL_32:
  objc_sync_exit(v17);

  if (!v25)
  {
    if (!v19) {
      __assert_rtn("-[MBCKDatabaseManager _createContainerWithSyncZoneForAccount:policy:operationGroup:xpcActivity:error:]", "MBCKDatabaseManager.m", 644, "container");
    }
    unsigned __int8 v24 = v19;
  }

  return v24;
}

- (void)_removeContainerForPersonaIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKDatabaseManager _removeContainerForPersonaIdentifier:]", "MBCKDatabaseManager.m", 649, "personaIdentifier");
  }
  id v7 = v4;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MBCKDatabaseManager *)v5 containersByPersonaIdentifier];
  [v6 removeObjectForKey:v7];

  objc_sync_exit(v5);
}

- (void)fetchConfigurationWithAccount:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKDatabaseManager fetchConfigurationWithAccount:configuration:completion:]", "MBCKDatabaseManager.m", 657, "account");
  }
  if (!v9) {
    __assert_rtn("-[MBCKDatabaseManager fetchConfigurationWithAccount:configuration:completion:]", "MBCKDatabaseManager.m", 658, "configuration");
  }
  id v11 = v10;
  if (!v10) {
    __assert_rtn("-[MBCKDatabaseManager fetchConfigurationWithAccount:configuration:completion:]", "MBCKDatabaseManager.m", 659, "completion");
  }
  id v12 = [v8 persona];
  id v13 = [v12 personaIdentifier];

  if (!v13) {
    __assert_rtn("-[MBCKDatabaseManager fetchConfigurationWithAccount:configuration:completion:]", "MBCKDatabaseManager.m", 661, "personaIdentifier");
  }
  id v14 = dispatch_get_global_queue(17, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001503C4;
  v18[3] = &unk_1004148B8;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v11;
  id v15 = v9;
  id v16 = v11;
  id v17 = v8;
  dispatch_async(v14, v18);
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (int64_t)requestsToSupportBudget
{
  return self->_requestsToSupportBudget;
}

- (void)setRequestsToSupportBudget:(int64_t)a3
{
  self->_requestsToSupportBudget = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSObject)accountObserver
{
  return self->_accountObserver;
}

- (void)setAccountObserver:(id)a3
{
}

- (NSMutableDictionary)containersByPersonaIdentifier
{
  return self->_containersByPersonaIdentifier;
}

- (void)setContainersByPersonaIdentifier:(id)a3
{
}

- (BOOL)useSandbox
{
  return self->_useSandbox;
}

- (void)setUseSandbox:(BOOL)a3
{
  self->_useSandbox = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containersByPersonaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountObserver, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end