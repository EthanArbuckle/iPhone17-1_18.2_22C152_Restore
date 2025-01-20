@interface PCSUserRegistry
- (BOOL)checkRegistry:(id)a3;
- (BOOL)ensureUserRegistryDbLoaded:(id *)a3;
- (BOOL)errorShouldCauseReset:(id)a3;
- (BOOL)resubmitSyncing;
- (BOOL)saveEscrowChange:(id)a3;
- (BOOL)setupCloudKitSyncing;
- (BOOL)stats_dirty;
- (BOOL)updateEscrowData:(id)a3 escrowIdentity:(_PCSIdentityData *)a4 identity:(_PCSIdentityData *)a5;
- (CKContainer)container;
- (CKRecordZoneID)mobileBackupRecordZoneID;
- (CKRecordZoneID)recordZoneID;
- (NSOperation)cloudKitRateLimitedOp;
- (NSOperationQueue)mainOperationQueue;
- (OS_dispatch_queue)queue;
- (OS_os_log)oslog;
- (PCSAccountsModel)accounts;
- (PCSDelayedAction)resyncRegistryAction;
- (PCSDelayedAction)subscribeAction;
- (PCSMobileBackup)mobileBackup;
- (PCSRegistryOperationPair)currentSyncOperations;
- (PCSRegistryOperationPair)pendingSyncOperations;
- (PCSUserRegistry)initWithBackup:(id)a3;
- (UserRegistryDB)userdb;
- (UserRegistryStats)stats;
- (_PCSIdentitySetData)identityCopySet;
- (id)allMobileBackupKeys;
- (id)allMobileBackupPublicKeys;
- (id)ckRecordListToRecordIDs:(id)a3;
- (id)createPendingSyncOperation:(id)a3;
- (id)createZone:(id)a3 withName:(id)a4;
- (id)defaultCKConfiguration;
- (id)deleteMobileBackupZone;
- (id)extractMobilebackupKeyEscrow:(id)a3;
- (id)fetchAllChanges:(id)a3;
- (id)fetchMobileBackupRecordIDsWithError:(id *)a3;
- (id)getServerChangeToken:(id)a3;
- (id)keyRecord:(_PCSIdentityData *)a3 withName:(id)a4 zone:(id)a5;
- (id)keyRecordIdentity:(_PCSIdentityData *)a3 device:(id)a4 version:(id)a5;
- (id)loadMobileBackupKeysFromDB;
- (id)mobileBackupKeyRecordIdentity:(_PCSIdentityData *)a3 version:(id)a4;
- (id)privateDatabase;
- (id)pushMobileBackupRecordsToCloudKit:(id)a3 removeObjects:(id)a4;
- (id)queryEscrowID:(id)a3;
- (id)queryEscrowName:(id)a3;
- (id)queryMobileBackupKeysFromCloudKit:(id *)a3;
- (id)scanPCSIdentitiesForNewMobileBackupRecords;
- (id)startBackupOfNewMobileBackupIdentities;
- (id)syncUserRegistry;
- (id)userDBBackupRecordIDsWithError:(id *)a3;
- (void)_onqueueDeleteServerChangeToken:(id)a3;
- (void)_onqueueSaveUserRegistryStats;
- (void)addDatabaseOperation:(id)a3;
- (void)cacheUserRegistryStats;
- (void)checkAccountStatus:(id)a3;
- (void)checkErrorForRetryPause:(id)a3;
- (void)clearCloudKitCache;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)deleteEscrowID:(id)a3;
- (void)flushStats;
- (void)registerCloudKitNotifications;
- (void)resyncDatabase:(id)a3;
- (void)saveRecord:(id)a3;
- (void)saveServerChangeToken:(id)a3 forKey:(id)a4;
- (void)setAccounts:(id)a3;
- (void)setCloudKitRateLimitedOp:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentSyncOperations:(id)a3;
- (void)setMainOperationQueue:(id)a3;
- (void)setMobileBackup:(id)a3;
- (void)setMobileBackupRecordZoneID:(id)a3;
- (void)setOslog:(id)a3;
- (void)setPendingSyncOperations:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecordZoneID:(id)a3;
- (void)setResubmitSyncing:(BOOL)a3;
- (void)setResyncRegistryAction:(id)a3;
- (void)setStats:(id)a3;
- (void)setStats_dirty:(BOOL)a3;
- (void)setSubscribeAction:(id)a3;
- (void)setUserdb:(id)a3;
- (void)setupStatCache;
- (void)setupSubscriptions;
- (void)statFetch;
- (void)statModify;
@end

@implementation PCSUserRegistry

- (PCSUserRegistry)initWithBackup:(id)a3
{
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PCSUserRegistry;
  v6 = [(PCSUserRegistry *)&v39 init];
  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    mainOperationQueue = v6->_mainOperationQueue;
    v6->_mainOperationQueue = v7;

    v9 = +[CKContainer containerIDForContainerIdentifier:off_1000218E0];
    id v10 = objc_alloc_init((Class)CKContainerOptions);
    [v10 setBypassPCSEncryption:1];
    v11 = (CKContainer *)[objc_alloc((Class)CKContainer) initWithContainerID:v9 options:v10];
    container = v6->_container;
    v6->_container = v11;

    v13 = (CKRecordZoneID *)[objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"PCSUserRegistry" ownerName:CKCurrentUserDefaultName];
    recordZoneID = v6->_recordZoneID;
    v6->_recordZoneID = v13;

    v15 = (CKRecordZoneID *)[objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"PCSUserRegistryMobileBackup" ownerName:CKCurrentUserDefaultName];
    mobileBackupRecordZoneID = v6->_mobileBackupRecordZoneID;
    v6->_mobileBackupRecordZoneID = v15;

    uint64_t v17 = +[PCSAccountsModel defaultAccountsModel];
    accounts = v6->_accounts;
    v6->_accounts = (PCSAccountsModel *)v17;

    os_log_t v19 = os_log_create("com.apple.ProtectedCloudStorage", "UserRegistry");
    oslog = v6->_oslog;
    v6->_oslog = (OS_os_log *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("PCS-APS", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v6->_mobileBackup, a3);
    v23 = [[PCSDelayedAction alloc] initWithLabel:@"resyncRegistryAction" delay:300 operationQueue:v6->_mainOperationQueue];
    resyncRegistryAction = v6->_resyncRegistryAction;
    v6->_resyncRegistryAction = v23;

    v25 = v6->_resyncRegistryAction;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100009AD0;
    v36[3] = &unk_10001CA58;
    objc_copyWeak(&v37, &location);
    [(PCSDelayedAction *)v25 setAction:v36];
    [(PCSDelayedAction *)v6->_resyncRegistryAction setHoldTransaction:0];
    [(PCSDelayedAction *)v6->_resyncRegistryAction run];
    v26 = [[PCSDelayedAction alloc] initWithLabel:@"subscribeAction" delay:300 operationQueue:v6->_mainOperationQueue];
    subscribeAction = v6->_subscribeAction;
    v6->_subscribeAction = v26;

    v28 = v6->_subscribeAction;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100009B18;
    v34[3] = &unk_10001CA58;
    objc_copyWeak(&v35, &location);
    [(PCSDelayedAction *)v28 setAction:v34];
    [(PCSDelayedAction *)v6->_subscribeAction setHoldTransaction:0];
    [(PCSDelayedAction *)v6->_subscribeAction run];
    id v33 = 0;
    unsigned __int8 v29 = [(PCSUserRegistry *)v6 ensureUserRegistryDbLoaded:&v33];
    id v30 = v33;
    if ((v29 & 1) == 0)
    {
      v31 = [(PCSUserRegistry *)v6 oslog];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to initalize UserRegistryDB: %@", buf, 0xCu);
      }
    }
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&location);
  }

  return v6;
}

- (BOOL)ensureUserRegistryDbLoaded:(id *)a3
{
  id v5 = [(PCSUserRegistry *)self userdb];

  if (v5) {
    return 1;
  }
  id v6 = objc_alloc((Class)UserRegistryDB);
  v7 = [(PCSAccountsModel *)self->_accounts dsid];
  id v8 = [v6 initWithDSID:v7];
  [(PCSUserRegistry *)self setUserdb:v8];

  v9 = [(PCSUserRegistry *)self userdb];

  if (v9) {
    return 1;
  }
  v11 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to initalize UserRegistryDB", v14, 2u);
  }

  if (a3)
  {
    uint64_t v12 = kPCSErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Failed to initalize UserRegistryDB";
    v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    *a3 = +[NSError errorWithDomain:v12 code:138 userInfo:v13];
  }
  return 0;
}

- (void)setupStatCache
{
}

- (void)flushStats
{
  v3 = [(PCSUserRegistry *)self stats];

  if (v3)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (![(PCSUserRegistry *)v4 stats_dirty])
    {
      [(PCSUserRegistry *)v4 setStats_dirty:1];
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x3032000000;
      v8[3] = sub_100009E7C;
      v8[4] = sub_100009E8C;
      id v9 = (id)os_transaction_create();
      dispatch_time_t v5 = dispatch_time(0, 10000000000);
      id v6 = [(PCSUserRegistry *)v4 queue];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100009E94;
      v7[3] = &unk_10001CA80;
      v7[4] = v4;
      v7[5] = v8;
      dispatch_after(v5, v6, v7);

      _Block_object_dispose(v8, 8);
    }
    objc_sync_exit(v4);
  }
}

- (id)defaultCKConfiguration
{
  if (qword_1000219B0 != -1) {
    dispatch_once(&qword_1000219B0, &stru_10001CAC0);
  }
  v2 = (void *)qword_1000219A8;

  return v2;
}

- (void)checkAccountStatus:(id)a3
{
  v4 = [(PCSUserRegistry *)self container];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A024;
  v5[3] = &unk_10001CAE8;
  v5[4] = self;
  [v4 accountStatusWithCompletionHandler:v5];
}

- (BOOL)setupCloudKitSyncing
{
  id v7 = 0;
  BOOL v3 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v7];
  id v4 = v7;
  if (v3)
  {
    dispatch_time_t v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"checkAccountStatus:" name:NSUbiquityIdentityDidChangeNotification object:0];
    [(PCSUserRegistry *)self checkAccountStatus:0];
  }
  else
  {
    dispatch_time_t v5 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setupCloudKitSyncing: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
  }

  return v3;
}

- (void)registerCloudKitNotifications
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A3F0;
  block[3] = &unk_10001CB38;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  if (qword_1000219C0 != -1) {
    dispatch_once(&qword_1000219C0, block);
  }
  BOOL v3 = [(PCSUserRegistry *)self subscribeAction];
  [v3 trigger];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupSubscriptions
{
  id v22 = 0;
  unsigned __int8 v3 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v22];
  id v4 = v22;
  if (v3)
  {
    objc_initWeak(&location, self);
    *(void *)&long long v24 = 0;
    *((void *)&v24 + 1) = &v24;
    uint64_t v25 = 0x3032000000;
    v26 = sub_100009E7C;
    v27 = sub_100009E8C;
    id v28 = 0;
    id v5 = [(PCSUserRegistry *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A9F8;
    block[3] = &unk_10001CB60;
    block[4] = self;
    void block[5] = &v24;
    dispatch_sync(v5, block);

    if (!*(void *)(*((void *)&v24 + 1) + 40))
    {
      id v6 = [(PCSUserRegistry *)self oslog];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "attempting to subscribe to CK zone changes", buf, 2u);
      }

      id v7 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:@"PCSUserRegistrySubscription"];
      id v8 = objc_alloc_init((Class)CKNotificationInfo);
      [v7 setNotificationInfo:v8];
      id v9 = objc_alloc((Class)CKModifySubscriptionsOperation);
      id v23 = v7;
      id v10 = +[NSArray arrayWithObjects:&v23 count:1];
      id v11 = [v9 initWithSubscriptionsToSave:v10 subscriptionIDsToDelete:0];

      uint64_t v12 = [(PCSUserRegistry *)self cloudKitRateLimitedOp];

      if (v12)
      {
        v13 = [(PCSUserRegistry *)self oslog];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setupSubscriptions: rate-limited by CloudKit", buf, 2u);
        }

        v14 = [(PCSUserRegistry *)self cloudKitRateLimitedOp];
        [v11 addDependency:v14];
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000AA68;
      v17[3] = &unk_10001CB88;
      objc_copyWeak(&v18, &location);
      [v11 setModifySubscriptionsCompletionBlock:v17];
      NSErrorUserInfoKey v15 = [(PCSUserRegistry *)self defaultCKConfiguration];
      [v11 setConfiguration:v15];

      [(PCSUserRegistry *)self addDatabaseOperation:v11];
      objc_destroyWeak(&v18);
    }
    _Block_object_dispose(&v24, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    CFStringRef v16 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v24) = 138412290;
      *(void *)((char *)&v24 + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "setupSubscriptions: Failed to initalize UserRegistryDB: %@", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v7 = a5;
  id v8 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didReceiveToken: %@, triggering syncing", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [(PCSUserRegistry *)self stats];
  [v9 setPushNotifications:((char *)[v9 pushNotifications] + 1)];

  [(PCSUserRegistry *)self flushStats];
  id v10 = [(PCSUserRegistry *)self syncUserRegistry];
}

- (void)resyncDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(PCSUserRegistry *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AF64;
  block[3] = &unk_10001CA30;
  block[4] = self;
  dispatch_sync(v5, block);

  [(PCSUserRegistry *)self clearCloudKitCache];
  id v6 = [(PCSUserRegistry *)self stats];
  [v6 setZoneReset:((char *)[v6 zoneReset] + 1)];

  [(PCSUserRegistry *)self flushStats];
  id v7 = [(PCSUserRegistry *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AFDC;
  v9[3] = &unk_10001CBB0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (id)fetchAllChanges:(id)a3
{
  id v4 = a3;
  id v31 = 0;
  unsigned __int8 v5 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v31];
  id v21 = v31;
  if (v5)
  {
    id v6 = objc_alloc_init(PCSRegistryOperation);
    id v7 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
    id v8 = [(PCSUserRegistry *)self getServerChangeToken:@"MBserverChangeToken"];
    [v7 setPreviousServerChangeToken:v8];

    id v9 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 previousServerChangeToken];
      *(_DWORD *)buf = 138412290;
      id v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching changes after change token %@", buf, 0xCu);
    }
    id v11 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"PCSUserRegistryMobileBackup" ownerName:CKCurrentUserDefaultName];
    id v33 = v11;
    id v34 = v7;
    v20 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v12 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
    id v32 = v11;
    v13 = +[NSArray arrayWithObjects:&v32 count:1];
    id v14 = [v12 initWithRecordZoneIDs:v13 configurationsByRecordZoneID:v20];

    [v14 setFetchAllChanges:1];
    NSErrorUserInfoKey v15 = [(PCSUserRegistry *)self defaultCKConfiguration];
    [v14 setConfiguration:v15];

    if (v4) {
      [v14 addDependency:v4];
    }
    objc_initWeak((id *)buf, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000B604;
    v29[3] = &unk_10001CBD8;
    objc_copyWeak(&v30, (id *)buf);
    [v14 setRecordWasChangedBlock:v29];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000B840;
    v27[3] = &unk_10001CC00;
    objc_copyWeak(&v28, (id *)buf);
    [v14 setRecordWithIDWasDeletedBlock:v27];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000B9DC;
    v25[3] = &unk_10001CC28;
    objc_copyWeak(&v26, (id *)buf);
    [v14 setRecordZoneFetchCompletionBlock:v25];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000BBE8;
    v22[3] = &unk_10001CC50;
    objc_copyWeak(&v24, (id *)buf);
    CFStringRef v16 = v6;
    id v23 = v16;
    [v14 setFetchRecordZoneChangesCompletionBlock:v22];
    uint64_t v17 = [(PCSUserRegistry *)self privateDatabase];
    [v17 addOperation:v14];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v18 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "fetchAllChanges: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }

    CFStringRef v16 = objc_alloc_init(PCSRegistryOperation);
    [(PCSRegistryOperation *)v16 setError:v21];
    if (v4) {
      [(PCSRegistryOperation *)v16 addDependency:v4];
    }
    id v7 = [(PCSUserRegistry *)self mainOperationQueue];
    [v7 addOperation:v16];
  }

  return v16;
}

- (id)syncUserRegistry
{
  id v13 = 0;
  unsigned __int8 v3 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v13];
  id v4 = v13;
  if (v3)
  {
    *(void *)&long long v16 = 0;
    *((void *)&v16 + 1) = &v16;
    uint64_t v17 = 0x3032000000;
    id v18 = sub_100009E7C;
    os_log_t v19 = sub_100009E8C;
    id v20 = 0;
    unsigned __int8 v5 = [(PCSUserRegistry *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C094;
    block[3] = &unk_10001CA80;
    block[4] = self;
    void block[5] = &v16;
    dispatch_sync(v5, block);

    id v6 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Returning pending syncing operation: %@", buf, 0xCu);
    }

    id v8 = (PCSRegistryOperation *)*(id *)(*((void *)&v16 + 1) + 40);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v9 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v16) = 138412290;
      *(void *)((char *)&v16 + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "syncUserRegistry: Failed to initalize UserRegistryDB: %@", (uint8_t *)&v16, 0xCu);
    }

    id v8 = objc_alloc_init(PCSRegistryOperation);
    [(PCSRegistryOperation *)v8 setError:v4];
    id v10 = [(PCSUserRegistry *)self mainOperationQueue];
    [v10 addOperation:v8];
  }

  return v8;
}

- (id)createPendingSyncOperation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100009E7C;
  unsigned __int8 v29 = sub_100009E8C;
  id v30 = 0;
  if (!v4)
  {
    uint64_t v5 = os_transaction_create();
    id v6 = (void *)v26[5];
    v26[5] = v5;
  }
  uint64_t v7 = objc_alloc_init(PCSRegistryOperation);
  if (v4) {
    id v8 = (PCSRegistryOperation *)v4;
  }
  else {
    id v8 = objc_alloc_init(PCSRegistryOperation);
  }
  id v9 = v8;
  id v10 = [[PCSRegistryOperationPair alloc] init:v7 finish:v8];
  objc_initWeak(&from, v7);
  id v11 = [(PCSUserRegistry *)self cloudKitRateLimitedOp];

  if (v11)
  {
    id v12 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "rate-limited by CloudKit", buf, 2u);
    }

    id v13 = [(PCSUserRegistry *)self cloudKitRateLimitedOp];
    [(PCSRegistryOperation *)v7 addDependency:v13];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C688;
  v18[3] = &unk_10001CCF0;
  id v14 = v9;
  os_log_t v19 = v14;
  objc_copyWeak(&v21, &from);
  objc_copyWeak(&v22, &location);
  BOOL v23 = v4 == 0;
  id v20 = &v25;
  [(PCSRegistryOperation *)v7 addExecutionBlock:v18];
  uint64_t v15 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created new pending syncing operation: %@", buf, 0xCu);
  }

  id v16 = v10;
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&from);
  _Block_object_dispose(&v25, 8);

  objc_destroyWeak(&location);

  return v16;
}

- (void)saveRecord:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  unsigned __int8 v5 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v18];
  id v6 = v18;
  if (v5)
  {
    id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v7 encodeObject:v4 forKey:@"record"];
    id v8 = [v4 recordType];
    unsigned int v9 = [v8 isEqualToString:@"URKey"];

    if (v9)
    {
      id v10 = [v4 objectForKeyedSubscript:@"publicKey"];
    }
    else
    {
      id v10 = &stru_10001D108;
    }
    id v12 = [(PCSUserRegistry *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DD84;
    block[3] = &unk_10001CD18;
    block[4] = self;
    id v15 = v4;
    id v16 = v7;
    uint64_t v17 = v10;
    id v13 = v10;
    id v11 = v7;
    dispatch_sync(v12, block);
  }
  else
  {
    id v11 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "saveRecord: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
  }
}

- (void)saveServerChangeToken:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  unsigned __int8 v8 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v16];
  id v9 = v16;
  if (v8)
  {
    id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v10 encodeObject:v6 forKey:v7];
    id v11 = [(PCSUserRegistry *)self queue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000DFD0;
    v13[3] = &unk_10001CD40;
    v13[4] = self;
    id v14 = v7;
    id v15 = v10;
    id v12 = v10;
    dispatch_sync(v11, v13);
  }
  else
  {
    id v12 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "saveRecord: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
  }
}

- (void)_onqueueDeleteServerChangeToken:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PCSUserRegistry *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PCSUserRegistry *)self userdb];
  [v6 deleteRecordID:v4];
}

- (id)getServerChangeToken:(id)a3
{
  id v4 = a3;
  id v21 = 0;
  unsigned __int8 v5 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v21];
  id v6 = v21;
  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000;
    id v24 = sub_100009E7C;
    uint64_t v25 = sub_100009E8C;
    id v26 = 0;
    id v7 = [(PCSUserRegistry *)self queue];
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_10000E318;
    uint64_t v17 = &unk_10001CD68;
    p_long long buf = &buf;
    id v18 = self;
    id v8 = v4;
    id v19 = v8;
    dispatch_sync(v7, &v14);

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      id v9 = objc_alloc((Class)NSKeyedUnarchiver);
      id v10 = [v9 initForReadingFromData:*(void *)(*((void *)&buf + 1) + 40) error:0, v14, v15, v16, v17, v18];
      id v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:v8];
    }
    else
    {
      id v11 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v12 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "saveRecord: Failed to initalize UserRegistryDB: %@", (uint8_t *)&buf, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

- (void)cacheUserRegistryStats
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100009E7C;
  id v12 = sub_100009E8C;
  id v13 = 0;
  unsigned __int8 v3 = [(PCSUserRegistry *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E508;
  v7[3] = &unk_10001CB60;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  if (v9[5])
  {
    id v4 = objc_alloc((Class)NSKeyedUnarchiver);
    id v5 = [v4 initForReadingFromData:v9[5] error:0];
    id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UserRegistryStats"];
    [(PCSUserRegistry *)self setStats:v6];
  }
  else
  {
    id v5 = objc_alloc_init((Class)UserRegistryStats);
    [(PCSUserRegistry *)self setStats:v5];
  }

  _Block_object_dispose(&v8, 8);
}

- (void)_onqueueSaveUserRegistryStats
{
  unsigned __int8 v3 = [(PCSUserRegistry *)self queue];
  dispatch_assert_queue_V2(v3);

  id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  id v4 = [(PCSUserRegistry *)self stats];
  [v7 encodeObject:v4 forKey:@"UserRegistryStats"];

  id v5 = [(PCSUserRegistry *)self userdb];
  id v6 = [v7 encodedData];
  [v5 replaceConfigRecord:@"UserRegistryStats" data:v6];
}

- (void)statFetch
{
  unsigned __int8 v3 = [(PCSUserRegistry *)self stats];
  [v3 setRecordFetch:((char *)[v3 recordFetch] + 1)];

  [(PCSUserRegistry *)self flushStats];
}

- (void)statModify
{
  unsigned __int8 v3 = [(PCSUserRegistry *)self stats];
  [v3 setRecordModify:((char *)[v3 recordModify] + 1)];

  [(PCSUserRegistry *)self flushStats];
}

- (void)clearCloudKitCache
{
  unsigned __int8 v3 = [(PCSUserRegistry *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E77C;
  block[3] = &unk_10001CA30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)privateDatabase
{
  v2 = [(PCSUserRegistry *)self container];
  unsigned __int8 v3 = [v2 privateCloudDatabase];

  return v3;
}

- (void)addDatabaseOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(PCSUserRegistry *)self privateDatabase];
  [v5 addOperation:v4];
}

- (BOOL)errorShouldCauseReset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:CKErrorDomain])
  {
    id v5 = [v3 code];

    if (v5 == (id)21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  id v6 = [v3 domain];
  if (![v6 isEqualToString:CKErrorDomain]) {
    goto LABEL_21;
  }
  id v7 = [v3 code];

  if (v7 != (id)2) {
    goto LABEL_22;
  }
  uint64_t v8 = [v3 userInfo];
  id v6 = [v8 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = [v6 allValues];
  id v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v10)
  {

LABEL_21:
    goto LABEL_22;
  }
  id v11 = v10;
  char v12 = 0;
  uint64_t v13 = *(void *)v40;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v40 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      id v16 = [v15 domain];
      if ([v16 isEqualToString:CKErrorDomain])
      {
        id v17 = [v15 code];

        if (v17 == (id)21) {
          char v12 = 1;
        }
      }
      else
      {
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  }
  while (v11);

  if (v12) {
    goto LABEL_27;
  }
LABEL_22:
  id v18 = [v3 domain];
  if (![v18 isEqualToString:CKErrorDomain])
  {

    goto LABEL_28;
  }
  if ([v3 code] != (id)28)
  {
    id v19 = [v3 code];

    if (v19 == (id)26) {
      goto LABEL_27;
    }
LABEL_28:
    id v21 = [v3 domain];
    if ([v21 isEqualToString:CKErrorDomain])
    {
      id v22 = [v3 code];

      if (v22 == (id)2)
      {
        uint64_t v23 = [v3 userInfo];
        id v24 = [v23 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v25 = [v24 allValues];
        id v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (!v26)
        {
          char v28 = 0;
          goto LABEL_47;
        }
        id v27 = v26;
        char v28 = 0;
        uint64_t v29 = *(void *)v36;
        while (1)
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v25);
            }
            id v31 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
            id v32 = [v31 domain];
            if (![v32 isEqualToString:CKErrorDomain])
            {

              continue;
            }
            if ([v31 code] == (id)28)
            {
            }
            else
            {
              id v33 = [v31 code];

              if (v33 != (id)26) {
                continue;
              }
            }
            char v28 = 1;
          }
          id v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (!v27)
          {
LABEL_47:

            BOOL v20 = v28 & 1;
            goto LABEL_48;
          }
        }
      }
    }
    else
    {
    }
    BOOL v20 = 0;
    goto LABEL_48;
  }

LABEL_27:
  BOOL v20 = 1;
LABEL_48:

  return v20;
}

- (void)checkErrorForRetryPause:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    unsigned int v6 = [v5 isEqualToString:CKErrorDomain];

    if (v6)
    {
      id v7 = [v4 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:CKErrorRetryAfterKey];

      id v9 = [v4 userInfo];
      uint64_t v29 = [v9 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v10 = [v29 allValues];
      id v11 = [v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v37;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)v13) domain:v29];
            unsigned int v15 = [v14 isEqualToString:CKErrorDomain];

            if (v15)
            {
              id v16 = [v4 userInfo];
              id v17 = [v16 objectForKeyedSubscript:CKErrorRetryAfterKey];

              if (!v8 || ([v8 doubleValue], double v19 = v18, objc_msgSend(v17, "doubleValue"), v19 < v20))
              {
                id v21 = v17;

                uint64_t v8 = v21;
              }
            }
            uint64_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v11);
      }

      if (v8)
      {
        objc_initWeak(&location, self);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10000F030;
        v33[3] = &unk_10001CA58;
        objc_copyWeak(&v34, &location);
        id v22 = +[NSBlockOperation blockOperationWithBlock:v33];
        [(PCSUserRegistry *)self setCloudKitRateLimitedOp:v22];
        [v8 doubleValue];
        double v24 = v23 + 0.5;
        dispatch_time_t v25 = dispatch_time(0, (unint64_t)((v23 + 0.5) * 1000000000.0));
        id v26 = [(PCSUserRegistry *)self oslog];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          double v41 = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Delaying %.1f seconds for CK operations", buf, 0xCu);
        }

        id v27 = [(PCSUserRegistry *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000F0A8;
        block[3] = &unk_10001CBB0;
        block[4] = self;
        id v32 = v22;
        id v28 = v22;
        dispatch_after(v25, v27, block);

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v8 = v29;
      }
    }
  }
}

- (id)createZone:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [objc_alloc((Class)CKRecordZone) initWithZoneName:v7];
  id v9 = objc_alloc_init(PCSRegistryOperation);
  id v10 = objc_alloc((Class)CKModifyRecordZonesOperation);
  id v29 = v8;
  id v11 = +[NSArray arrayWithObjects:&v29 count:1];
  id v12 = [v10 initWithRecordZonesToSave:v11 recordZoneIDsToDelete:0];

  uint64_t v13 = [(PCSUserRegistry *)self cloudKitRateLimitedOp];

  if (v13)
  {
    id v14 = [(PCSUserRegistry *)self cloudKitRateLimitedOp];
    [v12 addDependency:v14];
  }
  [v12 setConfiguration:v6];
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  double v23 = sub_10000F364;
  double v24 = &unk_10001CD90;
  objc_copyWeak(&v27, &location);
  id v15 = v8;
  id v25 = v15;
  id v16 = v9;
  id v26 = v16;
  [v12 setModifyRecordZonesCompletionBlock:&v21];
  id v17 = [(PCSUserRegistry *)self privateDatabase];
  [v17 addOperation:v12];

  double v18 = v26;
  double v19 = v16;

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v19;
}

- (id)deleteMobileBackupZone
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(PCSRegistryOperation);
  id v4 = objc_alloc((Class)CKModifyRecordZonesOperation);
  id v5 = [(PCSUserRegistry *)self mobileBackupRecordZoneID];
  id v16 = v5;
  id v6 = +[NSArray arrayWithObjects:&v16 count:1];
  id v7 = [v4 initWithRecordZonesToSave:&__NSArray0__struct recordZoneIDsToDelete:v6];

  id v8 = [(PCSUserRegistry *)self defaultCKConfiguration];
  [v7 setConfiguration:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F6DC;
  v12[3] = &unk_10001CDB8;
  objc_copyWeak(&v14, &location);
  id v9 = v3;
  uint64_t v13 = v9;
  [v7 setModifyRecordZonesCompletionBlock:v12];
  id v10 = [(PCSUserRegistry *)self privateDatabase];
  [v10 addOperation:v7];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (BOOL)saveEscrowChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordID];
  id v6 = [v5 recordName];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v7 = [(PCSUserRegistry *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F97C;
  v11[3] = &unk_10001CDE0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v4;
  id v14 = &v15;
  id v8 = v4;
  id v9 = v6;
  dispatch_sync(v7, v11);

  LOBYTE(v6) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

- (void)deleteEscrowID:(id)a3
{
  id v4 = a3;
  id v5 = [(PCSUserRegistry *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FB08;
  v7[3] = &unk_10001CBB0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)queryEscrowName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_100009E7C;
    id v16 = sub_100009E8C;
    id v17 = 0;
    id v5 = [(PCSUserRegistry *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000FCD4;
    block[3] = &unk_10001CD68;
    id v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
    if (v6)
    {
      id v7 = sub_10000FD40(v6);
    }
    else
    {
      id v7 = 0;
    }

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)queryEscrowID:(id)a3
{
  id v4 = [a3 recordName];
  id v5 = [(PCSUserRegistry *)self queryEscrowName:v4];

  return v5;
}

- (id)pushMobileBackupRecordsToCloudKit:(id)a3 removeObjects:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = objc_alloc_init(PCSRegistryOperation);
  objc_initWeak(&from, v7);
  id v8 = [(PCSUserRegistry *)self cloudKitRateLimitedOp];

  if (v8)
  {
    id v9 = [(PCSUserRegistry *)self cloudKitRateLimitedOp];
    [(PCSRegistryOperation *)v7 addDependency:v9];
  }
  id v10 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "pushMobileBackupRecordsToCloudKit Starting", buf, 2u);
  }

  id v11 = [(PCSUserRegistry *)self defaultCKConfiguration];
  uint64_t v12 = [(PCSUserRegistry *)self getServerChangeToken:@"MBserverChangeToken"];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    uint64_t v14 = [(PCSUserRegistry *)self createZone:v11 withName:@"PCSUserRegistryMobileBackup"];
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = &__NSArray0__struct;
  if (v6) {
    uint64_t v15 = v6;
  }
  id v16 = v15;

  id v17 = (char *)[v16 count];
  if ((unint64_t)v17 < 0x65)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v16 mutableCopy];
    [v18 removeObjectsInRange:NSMakeRange(100, v17 - 100)];
  }
  double v19 = +[NSMutableArray arrayWithArray:v33];
  double v20 = (char *)[v19 count];
  if ((unint64_t)v20 < 0x65)
  {
    uint64_t v22 = 0;
  }
  else
  {
    id v21 = v20 - 100;
    uint64_t v22 = [v19 subarrayWithRange:100, v20 - 100];
    [v19 removeObjectsInRange:100, v21];
  }
  double v23 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v24 = [v19 count];
    unsigned int v25 = [v18 count];
    *(_DWORD *)long long buf = 67109376;
    unsigned int v41 = v24;
    __int16 v42 = 1024;
    unsigned int v43 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "updating %u records, removing %u records", buf, 0xEu);
  }

  [(PCSUserRegistry *)self statModify];
  id v26 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v19 recordIDsToDelete:v18];
  id v27 = v26;
  if (v14) {
    [v26 addDependency:v14];
  }
  [v27 setSavePolicy:1];
  id v28 = [(PCSUserRegistry *)self defaultCKConfiguration];
  [v27 setConfiguration:v28];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000102A4;
  v34[3] = &unk_10001CE30;
  objc_copyWeak(&v36, &location);
  objc_copyWeak(&v37, &from);
  id v29 = v22;
  id v35 = v29;
  [v27 setModifyRecordsCompletionBlock:v34];
  id v30 = [(PCSUserRegistry *)self privateDatabase];
  [v30 addOperation:v27];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v7;
}

- (BOOL)updateEscrowData:(id)a3 escrowIdentity:(_PCSIdentityData *)a4 identity:(_PCSIdentityData *)a5
{
  id v5 = a3;
  EscrowedKeyWithIdentity = (void *)PCSBackupCreateEscrowedKeyWithIdentity();
  if (EscrowedKeyWithIdentity) {
    [v5 setObject:EscrowedKeyWithIdentity forKeyedSubscript:@"escrow"];
  }

  return EscrowedKeyWithIdentity != 0;
}

- (id)keyRecordIdentity:(_PCSIdentityData *)a3 device:(id)a4 version:(id)a5
{
  id v7 = a5;
  id v8 = [a4 recordID];
  id v9 = [v8 recordName];
  id v10 = sub_100010990((uint64_t)a3, v9, v7);

  return v10;
}

- (id)mobileBackupKeyRecordIdentity:(_PCSIdentityData *)a3 version:(id)a4
{
  return sub_100010990((uint64_t)a3, @"MobileBackup", a4);
}

- (id)keyRecord:(_PCSIdentityData *)a3 withName:(id)a4 zone:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = PCSIdentityGetPublicKey();
  id v9 = [objc_alloc((Class)CKRecordID) initWithRecordName:v7 zoneID:v6];

  id v10 = [objc_alloc((Class)CKRecord) initWithRecordType:@"URKey" recordID:v9];
  id v11 = +[NSDate date];
  [v10 setObject:v11 forKeyedSubscript:@"firstSeen"];

  [v10 setObject:v8 forKeyedSubscript:@"publicKey"];
  uint64_t v12 = (void *)PCSIdentityCopyPublicKeyInfo();
  [v10 setObject:v12 forKeyedSubscript:@"identity"];

  return v10;
}

- (BOOL)checkRegistry:(id)a3
{
  id v4 = a3;
  id v15 = 0;
  BOOL v5 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v15];
  id v6 = v15;
  if (v5)
  {
    [(PCSUserRegistry *)self syncUserRegistry];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100010D90;
    v12[3] = &unk_10001CE58;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v4;
    id v7 = v13;
    id v8 = +[NSBlockOperation blockOperationWithBlock:v12];
    [v8 addDependency:v7];
    id v9 = [(PCSUserRegistry *)self mainOperationQueue];
    [v9 addOperation:v8];
  }
  else
  {
    id v10 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "checkRegistry: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }

    (*((void (**)(id, id))v4 + 2))(v4, v6);
  }

  return v5;
}

- (id)scanPCSIdentitiesForNewMobileBackupRecords
{
  id v3 = [(PCSUserRegistry *)self mobileBackup];
  unsigned __int8 v4 = [v3 isBackupEnabled];

  if (v4)
  {
    BOOL v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = [(PCSUserRegistry *)self identityCopySet];
    if (v6)
    {
      id v7 = v6;
      if (PCSIdentitySetIsWalrusWithForceFetch())
      {
        id v14 = [(PCSUserRegistry *)self oslog];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping MobileBackup Escrow: %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v8 = _PCSIdentitySetCopyCurrentIdentityInternal();
        if (v8)
        {
          id v9 = (const void *)v8;
          id v10 = v5;
          PCSServiceItemsGetEachName();
          id v11 = [(PCSUserRegistry *)self oslog];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 134217984;
            id v17 = [v10 count];
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Harvested %lu records for MobileBackup escrow from Local PCS", buf, 0xCu);
          }

          CFRelease(v7);
          CFRelease(v9);
          uint64_t v12 = v10;

          goto LABEL_21;
        }
        id v14 = [(PCSUserRegistry *)self oslog];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No escrow identity", buf, 2u);
        }
      }

      CFRelease(v7);
    }
    else
    {
      id v13 = [(PCSUserRegistry *)self oslog];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No PCSIdentities to Escrow to MobileBackup", buf, 2u);
      }
    }
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  BOOL v5 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MobileBackup is off; no new records!", buf, 2u);
  }
  uint64_t v12 = &__NSArray0__struct;
LABEL_21:

  return v12;
}

- (id)startBackupOfNewMobileBackupIdentities
{
  id v3 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting startBackupOfNewMobileBackupIdentities", buf, 2u);
  }

  unsigned __int8 v4 = [(PCSUserRegistry *)self scanPCSIdentitiesForNewMobileBackupRecords];
  if ([v4 count])
  {
    BOOL v5 = +[NSMutableArray array];
    id v6 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "startBackupOfNewMobileBackupIdentities - pushing new keys to cloudKit", v10, 2u);
    }

    id v7 = [(PCSUserRegistry *)self pushMobileBackupRecordsToCloudKit:v4 removeObjects:v5];
  }
  else
  {
    BOOL v5 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No local mobile backup key changes", v9, 2u);
    }
    id v7 = 0;
  }

  return v7;
}

- (_PCSIdentitySetData)identityCopySet
{
  id v3 = [(PCSUserRegistry *)self accounts];
  unsigned __int8 v4 = [v3 dsid];

  if (!v4)
  {
    uint64_t v8 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(PCSUserRegistry *)self accounts];
      id v10 = [v9 lastError];
      *(_DWORD *)long long buf = 138412290;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fail getting dsid: %@", buf, 0xCu);
    }
    BOOL v5 = 0;
    goto LABEL_7;
  }
  uint64_t v12 = kPCSSetupDSID;
  id v13 = v4;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v6 = PCSIdentitySetCreate();
  if (!v6)
  {
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  id v7 = (_PCSIdentitySetData *)v6;
LABEL_8:

  return v7;
}

- (id)extractMobilebackupKeyEscrow:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  id v21 = self;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Converting CKRecords to PCSKeybagKeys", buf, 2u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    id v9 = &CFArrayApplyFunction_ptr;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"keyStatus"];
        id v13 = v12;
        if (!v12 || ([v12 longValue] & 1) == 0)
        {
          id v14 = [v11 objectForKeyedSubscript:@"escrow"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v9;
            id v16 = objc_alloc_init((Class)PCSKeybagKey);
            id v17 = [v14 copy];
            [v16 setData:v17];

            [v16 setFlags:[v13 longValue]];
            [v22 addObject:v16];

            id v9 = v15;
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  id v18 = [(PCSUserRegistry *)v21 oslog];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v22 count];
    *(_DWORD *)long long buf = 134217984;
    id v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Converted %lu CKRecords to PCSKeybagKeys", buf, 0xCu);
  }

  return v22;
}

- (id)loadMobileBackupKeysFromDB
{
  id v3 = +[NSMutableArray array];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = sub_100009E7C;
  long long v24 = sub_100009E8C;
  id v25 = 0;
  id v4 = [(PCSUserRegistry *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011D80;
  block[3] = &unk_10001CB60;
  block[4] = self;
  void block[5] = &v20;
  dispatch_sync(v4, block);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)v21[5];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [v21[5] objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15];
        id v10 = sub_10000FD40(v9);
        [v3 addObject:v10];
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v6);
  }

  id v11 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v3 count];
    *(_DWORD *)long long buf = 134217984;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "loadMobileBackupKeysFromDB returning (count %lu)", buf, 0xCu);
  }

  id v13 = v3;
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (id)allMobileBackupKeys
{
  id v8 = 0;
  unsigned __int8 v3 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = [(PCSUserRegistry *)self loadMobileBackupKeysFromDB];
    id v6 = [(PCSUserRegistry *)self extractMobilebackupKeyEscrow:v5];
  }
  else
  {
    id v5 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "allMobileBackupKeys: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)allMobileBackupPublicKeys
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v31 = 0;
  unsigned __int8 v4 = [(PCSUserRegistry *)self ensureUserRegistryDbLoaded:&v31];
  id v5 = v31;
  id v6 = v5;
  if (v4)
  {
    id v25 = v5;
    uint64_t v7 = [(PCSUserRegistry *)self loadMobileBackupKeysFromDB];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      CFStringRef v11 = @"publicKey";
      do
      {
        id v12 = 0;
        id v26 = v9;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v12);
          id v14 = [v13 objectForKeyedSubscript:v11];
          if (v14)
          {
            [v3 addObject:v14];
          }
          else
          {
            long long v15 = [(PCSUserRegistry *)self oslog];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = [v13 recordID];
              [v16 recordName];
              uint64_t v17 = v10;
              CFStringRef v18 = v11;
              id v19 = v3;
              uint64_t v20 = v7;
              v22 = id v21 = self;
              *(_DWORD *)long long buf = 138412290;
              id v34 = v22;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Record %@ missing public key", buf, 0xCu);

              self = v21;
              uint64_t v7 = v20;
              id v3 = v19;
              CFStringRef v11 = v18;
              uint64_t v10 = v17;
              id v9 = v26;
            }
          }

          id v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }
    id v23 = v3;
    id v6 = v25;
  }
  else
  {
    uint64_t v7 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "allMobileBackupKeys: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
    id v23 = 0;
  }

  return v23;
}

- (id)queryMobileBackupKeysFromCloudKit:(id *)a3
{
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = sub_100009E7C;
  long long v39 = sub_100009E8C;
  id v40 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100009E7C;
  id v33 = sub_100009E8C;
  id v34 = 0;
  id v6 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit", buf, 2u);
  }

  id v7 = objc_alloc((Class)CKQuery);
  id v8 = +[NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
  id v9 = [v7 initWithRecordType:@"URKey" predicate:v8];

  uint64_t v10 = [(PCSUserRegistry *)self privateDatabase];
  CFStringRef v11 = [(PCSUserRegistry *)self mobileBackupRecordZoneID];
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_10001251C;
  long long v24 = &unk_10001CED0;
  id v25 = self;
  long long v27 = &v29;
  long long v28 = &v35;
  id v12 = v5;
  id v26 = v12;
  [v10 performQuery:v9 inZoneWithID:v11 completionHandler:&v21];

  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  if (!v36[5])
  {
    id v14 = objc_alloc_init((Class)NSArray);
    long long v15 = (void *)v36[5];
    v36[5] = (uint64_t)v14;
  }
  long long v16 = [(PCSUserRegistry *)self oslog];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(id)v36[5] count];
    *(_DWORD *)long long buf = 134217984;
    id v42 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit returning (count %lu)", buf, 0xCu);
  }

  if (a3)
  {
    CFStringRef v18 = (void *)v30[5];
    if (v18) {
      *a3 = [v18 copy];
    }
  }
  id v19 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

- (id)ckRecordListToRecordIDs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) recordID:v14];
        CFStringRef v11 = [v10 recordName];
        id v12 = [v11 copy];

        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)fetchMobileBackupRecordIDsWithError:(id *)a3
{
  if (-[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:"))
  {
    id v5 = [(PCSUserRegistry *)self queryMobileBackupKeysFromCloudKit:a3];
    id v6 = [(PCSUserRegistry *)self ckRecordListToRecordIDs:v5];
  }
  else
  {
    id v7 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v8 = *a3;
      }
      else {
        id v8 = 0;
      }
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetchMobileBackupRecordIDsWithError: Failed to initalize UserRegistryDB: %@", (uint8_t *)&v10, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)userDBBackupRecordIDsWithError:(id *)a3
{
  if (-[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:"))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x3032000000;
    long long v15 = sub_100009E7C;
    long long v16 = sub_100009E8C;
    id v17 = 0;
    id v5 = [(PCSUserRegistry *)self queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100012AD0;
    v12[3] = &unk_10001CB60;
    void v12[4] = self;
    v12[5] = &buf;
    dispatch_sync(v5, v12);

    id v6 = *(void **)(*((void *)&buf + 1) + 40);
    if (v6)
    {
      id v7 = [v6 allKeys];
    }
    else
    {
      id v7 = objc_alloc_init((Class)NSArray);
    }
    int v10 = v7;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v8 = [(PCSUserRegistry *)self oslog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v9 = *a3;
      }
      else {
        id v9 = 0;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "userDBBackupRecordIDsWithError: Failed to initalize UserRegistryDB: %@", (uint8_t *)&buf, 0xCu);
    }

    int v10 = 0;
  }

  return v10;
}

- (UserRegistryStats)stats
{
  return (UserRegistryStats *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStats:(id)a3
{
}

- (NSOperationQueue)mainOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMainOperationQueue:(id)a3
{
}

- (PCSDelayedAction)resyncRegistryAction
{
  return (PCSDelayedAction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResyncRegistryAction:(id)a3
{
}

- (PCSDelayedAction)subscribeAction
{
  return (PCSDelayedAction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubscribeAction:(id)a3
{
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContainer:(id)a3
{
}

- (PCSMobileBackup)mobileBackup
{
  return (PCSMobileBackup *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMobileBackup:(id)a3
{
}

- (CKRecordZoneID)recordZoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRecordZoneID:(id)a3
{
}

- (CKRecordZoneID)mobileBackupRecordZoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMobileBackupRecordZoneID:(id)a3
{
}

- (PCSAccountsModel)accounts
{
  return (PCSAccountsModel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAccounts:(id)a3
{
}

- (OS_os_log)oslog
{
  return (OS_os_log *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOslog:(id)a3
{
}

- (UserRegistryDB)userdb
{
  return (UserRegistryDB *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUserdb:(id)a3
{
}

- (BOOL)resubmitSyncing
{
  return self->_resubmitSyncing;
}

- (void)setResubmitSyncing:(BOOL)a3
{
  self->_resubmitSyncing = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)stats_dirty
{
  return self->_stats_dirty;
}

- (void)setStats_dirty:(BOOL)a3
{
  self->_stats_dirty = a3;
}

- (PCSRegistryOperationPair)currentSyncOperations
{
  return (PCSRegistryOperationPair *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentSyncOperations:(id)a3
{
}

- (PCSRegistryOperationPair)pendingSyncOperations
{
  return (PCSRegistryOperationPair *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPendingSyncOperations:(id)a3
{
}

- (NSOperation)cloudKitRateLimitedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCloudKitRateLimitedOp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitRateLimitedOp, 0);
  objc_storeStrong((id *)&self->_pendingSyncOperations, 0);
  objc_storeStrong((id *)&self->_currentSyncOperations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userdb, 0);
  objc_storeStrong((id *)&self->_oslog, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_mobileBackupRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_mobileBackup, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_subscribeAction, 0);
  objc_storeStrong((id *)&self->_resyncRegistryAction, 0);
  objc_storeStrong((id *)&self->_mainOperationQueue, 0);

  objc_storeStrong((id *)&self->_stats, 0);
}

@end