@interface PCSSyncing
+ (id)defaultPCSSyncing;
- (BOOL)activityIsScheduled:(id)a3;
- (BOOL)ensureMKExists:(_PCSIdentitySetData *)a3 error:(__CFError *)a4;
- (BOOL)forceSyncNeeded:(id)a3 dsid:(id)a4;
- (BOOL)getServicesToRoll:(id)a3 handler:(id)a4;
- (BOOL)shouldRoll;
- (BOOL)shouldRollStingray;
- (NSOperationQueue)serialOperationQueue;
- (NSUserDefaults)settings;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)registryQueue;
- (OS_xpc_object)scheduledKeyrollActivity;
- (PCSAccountsModel)accounts;
- (PCSDelayedAction)triggerWatchSyncingAction;
- (PCSIDSSyncing)syncing;
- (PCSKeySyncing)manager;
- (PCSMobileBackup)mobileBackup;
- (PCSSyncing)initWithPCSKeySyncing:(id)a3;
- (PCSUserRegistry)registry;
- (_PCSIdentitySetData)identityCopySet:(id)a3;
- (id)getRollEpoch;
- (id)healthSummary;
- (id)initForTesting;
- (int64_t)attemptTimer;
- (void)checkForBackupStateChange;
- (void)checkSyncingForPeer:(id)a3 force:(BOOL)a4;
- (void)clearNextSyncNegativeCache;
- (void)createIdentity:(id)a3 dsid:(id)a4 roll:(BOOL)a5 sync:(BOOL)a6 forceSync:(BOOL)a7 complete:(id)a8;
- (void)disableWalrusForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5;
- (void)enableWalrusForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5;
- (void)fetchAllDeviceKeys:(id)a3 withReply:(id)a4;
- (void)fetchStats:(id)a3;
- (void)getAllClients:(id)a3;
- (void)getHealthSummary:(id)a3;
- (void)keyRollPending:(id)a3 complete:(id)a4;
- (void)manateeStatus:(id)a3 complete:(id)a4;
- (void)migrateToiCDPForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5;
- (void)mobileBackupRecordIDsWithReply:(id)a3;
- (void)mobileBackupStatus:(id)a3;
- (void)notifyDailyEvent;
- (void)notifyEvent:(id)a3;
- (void)notifyInternalEvent:(id)a3;
- (void)notifyKeyRegistry;
- (void)queuedCheckRegistry:(id)a3 withReply:(id)a4;
- (void)recordEpochForKeyroll;
- (void)repairWalrus;
- (void)restoreMobileBackup:(BOOL)a3 dsid:(id)a4 withReply:(id)a5;
- (void)rollingComplete:(BOOL)a3;
- (void)scheduleRollAttempt;
- (void)setAccounts:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setManager:(id)a3;
- (void)setMobileBackup:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setRegistryQueue:(id)a3;
- (void)setScheduledKeyrollActivity:(id)a3;
- (void)setSerialOperationQueue:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSyncing:(id)a3;
- (void)setTriggerWatchSyncingAction:(id)a3;
- (void)setupIdentitiesForAccount:(id)a3 withParameters:(id)a4 optional:(BOOL)a5;
- (void)setupIdentitiesWithParameters:(id)a3 complete:(id)a4;
- (void)setupMetrics;
- (void)syncKeys:(id)a3 withReply:(id)a4;
- (void)triggerCKKSSyncForService:(id)a3 dsid:(id)a4 publicKeys:(id)a5 complete:(id)a6;
- (void)triggerDaily:(id)a3 withReply:(id)a4;
- (void)triggerEscrowSyncWithDSID:(id)a3 accountIdentifier:(id)a4 settingsKeyExpirationDate:(id)a5 settingsKeyIdentifier:(id)a6 complete:(id)a7;
- (void)triggerKeyRolling;
- (void)triggerSyncingWithEscrowProxy:(id)a3 dsid:(id)a4 publicKeys:(id)a5 accountIdentifier:(id)a6 settingsKeyExpirationDate:(id)a7 settingsKeyIdentifier:(id)a8 complete:(id)a9;
- (void)triggerWatchSyncing;
- (void)triggerWatchSyncing:(id)a3;
- (void)userDBBackupRecordIDsWithReply:(id)a3;
- (void)wStateChanged;
@end

@implementation PCSSyncing

+ (id)defaultPCSSyncing
{
  if (qword_100040EA0 != -1) {
    dispatch_once(&qword_100040EA0, &stru_1000395C0);
  }
  v2 = (void *)qword_100040E98;
  return v2;
}

- (id)initForTesting
{
  v12.receiver = self;
  v12.super_class = (Class)PCSSyncing;
  v2 = [(PCSSyncing *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ProtectedCloudStorage", v3);
    [(PCSSyncing *)v2 setInternalQueue:v4];

    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    serialOperationQueue = v2->_serialOperationQueue;
    v2->_serialOperationQueue = v5;

    [(NSOperationQueue *)v2->_serialOperationQueue setMaxConcurrentOperationCount:1];
    v7 = (NSUserDefaults *)objc_alloc_init((Class)NSUserDefaults);
    settings = v2->_settings;
    v2->_settings = v7;

    v9 = +[PCSAccountsModel defaultAccountsModel];
    [(PCSSyncing *)v2 setAccounts:v9];

    v10 = v2;
  }

  return v2;
}

- (PCSSyncing)initWithPCSKeySyncing:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PCSSyncing;
  v5 = [(PCSSyncing *)&v34 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ProtectedCloudStorage", v6);
    [(PCSSyncing *)v5 setInternalQueue:v7];

    v8 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    serialOperationQueue = v5->_serialOperationQueue;
    v5->_serialOperationQueue = v8;

    [(NSOperationQueue *)v5->_serialOperationQueue setMaxConcurrentOperationCount:1];
    v10 = (NSUserDefaults *)objc_alloc_init((Class)NSUserDefaults);
    settings = v5->_settings;
    v5->_settings = v10;

    objc_super v12 = +[PCSIDSTransport transportWithIDSServiceName:off_100040D40];
    v13 = [[PCSIDSSyncing alloc] initWithManager:v4 transport:v12 serialQueue:v5->_serialOperationQueue];
    [(PCSSyncing *)v5 setSyncing:v13];

    [(PCSSyncing *)v5 setManager:v4];
    v14 = +[PCSAccountsModel defaultAccountsModel];
    [(PCSSyncing *)v5 setAccounts:v14];

    v15 = +[PCSMobileBackup defaultMobileBackup];
    [(PCSSyncing *)v5 setMobileBackup:v15];

    if ((_PCSIsMultiDevice() & 1) == 0)
    {
      v16 = [PCSUserRegistry alloc];
      v17 = [(PCSSyncing *)v5 mobileBackup];
      v18 = [(PCSUserRegistry *)v16 initWithBackup:v17];
      [(PCSSyncing *)v5 setRegistry:v18];

      v19 = [(PCSSyncing *)v5 registry];
      [v19 setupStatCache];

      dispatch_queue_t v20 = dispatch_queue_create("PCSUserRegistry", 0);
      [(PCSSyncing *)v5 setRegistryQueue:v20];

      v21 = [(PCSSyncing *)v5 registry];
      [v21 setupCloudKitSyncing];

      v22 = [(PCSSyncing *)v5 registry];
      [v22 registerCloudKitNotifications];
    }
    objc_initWeak(&location, v5);
    v23 = [[PCSDelayedAction alloc] initWithLabel:@"triggerWatchSyncing" delay:30 operationQueue:v5->_serialOperationQueue];
    [(PCSSyncing *)v5 setTriggerWatchSyncingAction:v23];

    v24 = [(PCSSyncing *)v5 triggerWatchSyncingAction];
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_10001CE28;
    v31 = &unk_100038AF0;
    objc_copyWeak(&v32, &location);
    [v24 setAction:&v28];

    v25 = [(PCSSyncing *)v5 triggerWatchSyncingAction];
    [v25 run];

    [(PCSSyncing *)v5 scheduleRollAttempt];
    v26 = v5;
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)setupMetrics
{
  v3 = +[PCSAnalytics logger];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D000;
  v5[3] = &unk_100039610;
  v5[4] = self;
  id v4 = [v3 AddMultiSamplerForName:@"PCS-healthSummary" withTimeInterval:v5 block:SFAnalyticsSamplerIntervalOncePerReport];
}

- (id)healthSummary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:&off_10003B198 forKeyedSubscript:@"version"];
  id v4 = +[PCSAccountsModel accountForCurrentPersona];
  v5 = objc_msgSend(v4, "aa_personID");

  if (v5)
  {
    v6 = [(PCSSyncing *)self identityCopySet:v5];
    if (v6)
    {
      dispatch_queue_t v7 = v6;
      char v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"noDSID"];
  }
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"noIdentitySet"];
  dispatch_queue_t v7 = 0;
  char v8 = 1;
LABEL_6:
  v9 = +[NSNumber numberWithBool:[(PCSSyncing *)self shouldRoll]];
  [v3 setObject:v9 forKeyedSubscript:@"shouldRoll"];

  v10 = [(PCSSyncing *)self getRollEpoch];
  v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[PCSAnalytics fuzzyDaysSinceDate:v10]);
  [v3 setObject:v11 forKeyedSubscript:@"roll"];

  objc_super v12 = [(PCSSyncing *)self scheduledKeyrollActivity];
  v13 = +[NSNumber numberWithBool:[(PCSSyncing *)self activityIsScheduled:v12]];
  [v3 setObject:v13 forKeyedSubscript:@"keyrollScheduled"];

  if ((v8 & 1) == 0)
  {
    v14 = +[PCSMetrics metrics];
    [v14 addMetricsToHealthSummary:v3 withIdentitySet:v7];

    CFRelease(v7);
  }

  return v3;
}

- (void)triggerWatchSyncing
{
  id v2 = [(PCSSyncing *)self triggerWatchSyncingAction];
  [v2 trigger];
}

- (void)notifyKeyRegistry
{
  id v3 = [(PCSSyncing *)self registry];

  if (v3)
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3032000000;
    v5[3] = sub_10001CF28;
    v5[4] = sub_10001CF38;
    id v6 = (id)os_transaction_create();
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10001D364;
    v4[3] = &unk_100039638;
    v4[4] = v5;
    [(PCSSyncing *)self queuedCheckRegistry:&__NSDictionary0__struct withReply:v4];
    _Block_object_dispose(v5, 8);
  }
}

- (void)triggerWatchSyncing:(id)a3
{
  id v4 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_10001CF28;
  v14[4] = sub_10001CF38;
  id v15 = (id)os_transaction_create();
  v5 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trigger syncing with watches", buf, 2u);
  }
  id v6 = [(PCSSyncing *)self syncing];
  unsigned __int8 v7 = [v6 havePeers];

  if (v7)
  {
    v4[2](v4);
    char v8 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Catching up local database changes from keychain", buf, 2u);
    }
    serialOperationQueue = self->_serialOperationQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001D69C;
    v11[3] = &unk_1000396A8;
    v11[4] = self;
    objc_copyWeak(&v12, &location);
    v11[5] = v14;
    [(NSOperationQueue *)serialOperationQueue addOperationWithBlock:v11];
    objc_destroyWeak(&v12);
  }
  else
  {
    v10 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No peers, not doing any syncing with watches", buf, 2u);
    }
    v4[2](v4);
  }
  _Block_object_dispose(v14, 8);

  objc_destroyWeak(&location);
}

- (void)notifyInternalEvent:(id)a3
{
  id v4 = a3;
  if (qword_100040EA8 != -1) {
    dispatch_once(&qword_100040EA8, &stru_1000396C8);
  }
  v5 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got darwin notification %@", buf, 0xCu);
  }
  if ([v4 isEqualToString:@"_CDPWalrusStateChangeDarwinNotification"])
  {
    [(PCSSyncing *)self wStateChanged];
  }
  else
  {
    if ([(id)qword_100040EB0 containsObject:v4]) {
      [(PCSSyncing *)self triggerWatchSyncing];
    }
    if ([(id)qword_100040EC0 containsObject:v4])
    {
      id v6 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MOBSTATE Got notification that mobile backup state changed.", buf, 2u);
      }
      if ([v4 isEqualToString:@"com.apple.ProtectedCloudStorage.test.mobileBackupStateChange"])
      {
        unsigned __int8 v7 = +[PCSAnalytics logger];
        id v18 = 0;
        char v8 = +[PCSAccountsModel settingsKeyForKey:@"testRollEpoch" error:&v18];
        id v9 = v18;
        v10 = v9;
        if (!v8 || v9)
        {
          v14 = qword_100040ED8;
          if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to fetch appropriate key: %@", buf, 0xCu);
          }
        }
        else
        {
          if ([(PCSSyncing *)self shouldRoll])
          {
            v11 = [(PCSSyncing *)self settings];
            unsigned int v12 = [v11 BOOLForKey:v8];

            if (v12) {
              notify_post("com.apple.ProtectedCloudStorage.PendingKeyRoll");
            }
          }
          v13 = [(PCSSyncing *)self settings];
          [v13 setBool:1 forKey:v8];

          [(PCSSyncing *)self recordEpochForKeyroll];
          [v7 logSuccessForEvent:PCSEventTestKeyRollStateChange];
        }
      }
      else
      {
        [(PCSSyncing *)self checkForBackupStateChange];
      }
    }
    if ([(PCSSyncing *)self shouldRoll]) {
      [(PCSSyncing *)self triggerKeyRolling];
    }
    if (([(id)qword_100040EB8 containsObject:v4] & 1) != 0
      || [(id)qword_100040EC0 containsObject:v4])
    {
      id v15 = [(PCSSyncing *)self mobileBackup];
      unsigned int v16 = [v15 isBackupEnabled];

      if (v16)
      {
        v17 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MOBSTATE Notifying registry.", buf, 2u);
        }
        [(PCSSyncing *)self notifyKeyRegistry];
      }
    }
  }
}

- (void)wStateChanged
{
  id v3 = +[PCSAccountsModel accountForCurrentPersona];
  uint64_t v7 = objc_msgSend(v3, "aa_personID");

  if (v7)
  {
    id v4 = [(PCSSyncing *)self identityCopySet:v7];
    if (v4)
    {
      v5 = v4;
      id v6 = +[PCSMetrics metrics];
      [v6 updateCurrentWState:v5];

      CFRelease(v5);
    }
  }
  _objc_release_x1();
}

- (void)clearNextSyncNegativeCache
{
  id v15 = 0;
  id v3 = +[PCSAccountsModel settingsKeyForKey:@"nextRegistrySync" error:&v15];
  id v4 = v15;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    char v8 = [(PCSSyncing *)self settings];
    [v8 removeObjectForKey:v3];
  }
  else
  {
    uint64_t v7 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
  }
  id v14 = 0;
  id v9 = +[PCSAccountsModel settingsKeyForKey:@"nextRegistrySyncEnterprise" error:&v14];
  id v10 = v14;
  v11 = v10;
  if (!v3 || v10)
  {
    v13 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
  }
  else
  {
    unsigned int v12 = [(PCSSyncing *)self settings];
    [v12 removeObjectForKey:v9];
  }
}

- (void)mobileBackupStatus:(id)a3
{
  id v5 = a3;
  id v6 = [(PCSSyncing *)self mobileBackup];
  (*((void (**)(id, id, void))a3 + 2))(v5, [v6 isBackupEnabled], 0);
}

- (id)getRollEpoch
{
  id v15 = 0;
  id v3 = +[PCSAccountsModel settingsKeyForKey:kPCSPendingRollEpoch error:&v15];
  id v4 = v15;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v9 = [(PCSSyncing *)self settings];
    id v10 = [v9 objectForKey:v3];

    if (v10)
    {
      v11 = +[NSDate date];
      if ([v10 compare:v11] == (id)1 || (objc_msgSend(v10, "timeIntervalSince1970"), v12 == 0.0))
      {
        v13 = [(PCSSyncing *)self settings];
        [v13 removeObjectForKey:v3];

        id v8 = 0;
      }
      else
      {
        id v8 = v10;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    uint64_t v7 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)recordEpochForKeyroll
{
  id v3 = +[NSDate date];
  id v10 = 0;
  id v4 = +[PCSAccountsModel settingsKeyForKey:kPCSPendingRollEpoch error:&v10];
  id v5 = v10;
  BOOL v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v9 = [(PCSSyncing *)self settings];
    [v9 setObject:v3 forKey:v4];
  }
  else
  {
    id v8 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
  }
}

- (void)checkForBackupStateChange
{
  objc_initWeak(&location, self);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(PCSSyncing *)self serialOperationQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E408;
  v6[3] = &unk_100038D88;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  BOOL v7 = v5;
  id v8 = self;
  [v4 addOperationWithBlock:v6];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (BOOL)shouldRoll
{
  dispatch_semaphore_t v3 = [(PCSSyncing *)self getRollEpoch];
  if (v3)
  {
    id v4 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "There is a pending keyRoll for epoch %@", (uint8_t *)&v7, 0xCu);
    }
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(PCSSyncing *)self shouldRollStingray];
  }

  return v5;
}

- (BOOL)shouldRollStingray
{
  if (!_os_feature_enabled_impl())
  {
    id v21 = 0;
    BOOL v5 = +[PCSAccountsModel settingsKeyForKey:kPCSSettingStingrayRoll error:&v21];
    id v6 = v21;
    int v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v10 = [(PCSSyncing *)self settings];
      v11 = [v10 objectForKey:v5];

      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
        }
        else
        {
          id v12 = +[NSDate distantPast];
        }
        id v14 = v12;
        if (_os_feature_enabled_impl()) {
          int64_t v15 = XPC_ACTIVITY_INTERVAL_1_MIN;
        }
        else {
          int64_t v15 = XPC_ACTIVITY_INTERVAL_8_HOURS;
        }
        unsigned int v16 = +[NSDate now];
        [v16 timeIntervalSinceDate:v14];
        double v18 = v17;

        if (v18 > (double)v15)
        {

          BOOL v4 = 1;
          goto LABEL_26;
        }
        v19 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Insufficient time elapsed since previous Stingray key roll attempt (%{public}@)", buf, 0xCu);
        }
      }
      else
      {
        v13 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Stingray key roll not required", buf, 2u);
        }
      }
    }
    else
    {
      id v9 = qword_100040ED8;
      BOOL v4 = 0;
      if (!os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        return v4;
      }
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
    BOOL v4 = 0;
    goto LABEL_26;
  }
  dispatch_semaphore_t v3 = qword_100040ED8;
  BOOL v4 = 0;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Feature enabled, no stingray roll", buf, 2u);
    return 0;
  }
  return v4;
}

- (int64_t)attemptTimer
{
  dispatch_semaphore_t v3 = [(PCSSyncing *)self getRollEpoch];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    if (v5 <= 0.0)
    {
      double v12 = -v5;
      int64_t v6 = XPC_ACTIVITY_INTERVAL_5_MIN;
      if (v12 >= (double)XPC_ACTIVITY_INTERVAL_5_MIN)
      {
        int64_t v6 = XPC_ACTIVITY_INTERVAL_30_MIN;
        if (v12 >= (double)XPC_ACTIVITY_INTERVAL_30_MIN)
        {
          int64_t v6 = XPC_ACTIVITY_INTERVAL_1_HOUR;
          if (v12 >= (double)XPC_ACTIVITY_INTERVAL_1_HOUR)
          {
            int64_t v6 = XPC_ACTIVITY_INTERVAL_4_HOURS;
            if (v12 >= (double)XPC_ACTIVITY_INTERVAL_4_HOURS) {
              int64_t v6 = XPC_ACTIVITY_INTERVAL_8_HOURS;
            }
          }
        }
      }
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else
  {
    int v7 = [(PCSSyncing *)self settings];
    BOOL v8 = [v7 objectForKey:kPCSSettingStingrayRoll];

    int v9 = _os_feature_enabled_impl();
    id v10 = &XPC_ACTIVITY_INTERVAL_1_MIN;
    if (!v9) {
      id v10 = &XPC_ACTIVITY_INTERVAL_8_HOURS;
    }
    int64_t v11 = *v10;
    if (v8) {
      int64_t v6 = v11;
    }
    else {
      int64_t v6 = 0;
    }
  }
  return v6;
}

- (BOOL)activityIsScheduled:(id)a3
{
  if (!a3) {
    return 0;
  }
  xpc_object_t v3 = xpc_activity_copy_criteria((xpc_activity_t)a3);
  BOOL v4 = v3;
  if (v3)
  {
    double v5 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_RANDOM_INITIAL_DELAY);
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)scheduleRollAttempt
{
  int64_t v3 = [(PCSSyncing *)self attemptTimer];
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001EEEC;
    v5[3] = &unk_1000396F0;
    v5[4] = self;
    void v5[5] = v3;
    xpc_activity_register("com.apple.ProtectedCloudStorage.scheduledKeyroll", XPC_ACTIVITY_CHECK_IN, v5);
  }
  else
  {
    BOOL v4 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No identity key roll is required, unscheduling keyroll activity.", buf, 2u);
    }
    [(PCSSyncing *)self setScheduledKeyrollActivity:0];
    xpc_activity_unregister("com.apple.ProtectedCloudStorage.scheduledKeyroll");
  }
}

- (BOOL)getServicesToRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PCSSyncing *)self getRollEpoch];
  int v9 = [(PCSSyncing *)self identityCopySet:v6];
  if (v9)
  {
    uint64_t v23 = 0;
    PCSIdentitySetIsWalrusWithForceFetch();
    _os_feature_enabled_impl();
    id v10 = _PCSServiceItemsGetNoRollStingrayServiceTypes();
    *(void *)buf = 0;
    double v18 = buf;
    uint64_t v19 = 0x3032000000;
    id v20 = sub_10001CF28;
    id v21 = sub_10001CF38;
    id v22 = 0;
    id v13 = v8;
    id v16 = v7;
    id v14 = v10;
    id v15 = v6;
    PCSServiceItemsInfoIteration();
    CFRelease(v9);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    int64_t v11 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "getServicesToRoll: no identity set", buf, 2u);
    }
  }

  return v9 != 0;
}

- (void)rollingComplete:(BOOL)a3
{
  id v18 = 0;
  double v5 = +[PCSAccountsModel settingsKeyForKey:kPCSPendingRollEpoch error:&v18];
  id v6 = v18;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v10 = [(PCSSyncing *)self settings];
    [v10 removeObjectForKey:v5];
  }
  else
  {
    int v9 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
  }
  if (!a3)
  {
    id v17 = 0;
    int64_t v11 = +[PCSAccountsModel settingsKeyForKey:kPCSSettingStingrayRoll error:&v17];
    id v12 = v17;
    id v13 = v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      id v16 = [(PCSSyncing *)self settings];
      [v16 removeObjectForKey:v11];
    }
    else
    {
      id v15 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
      }
    }
  }
  [(PCSSyncing *)self scheduleRollAttempt];
}

- (void)triggerKeyRolling
{
  objc_initWeak(&location, self);
  int64_t v3 = [(PCSSyncing *)self serialOperationQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F958;
  v4[3] = &unk_100038EC8;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 addOperationWithBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)ensureMKExists:(_PCSIdentitySetData *)a3 error:(__CFError *)a4
{
  CFTypeRef cf = 0;
  uint64_t v5 = _PCSIdentitySetCopyCurrentIdentityInternal();
  if (v5)
  {
    Master = (const void *)v5;
    LOBYTE(v7) = 1;
    goto LABEL_3;
  }
  if (CFErrorGetCode((CFErrorRef)cf) != -25300)
  {
    LODWORD(v7) = 0;
    goto LABEL_16;
  }
  id v13 = 0;
  unsigned __int8 v10 = +[PCSCKKS fetchWithTimeout:20 error:&v13];
  id v11 = v13;
  id v7 = v11;
  if (v10)
  {
    Master = (const void *)_PCSIdentitySetCopyCurrentIdentityInternal();

    LODWORD(v7) = Master != 0;
    if (Master)
    {
LABEL_3:
      CFTypeRef v8 = cf;
      if (a4 && cf)
      {
        *a4 = (__CFError *)CFRetain(cf);
        CFTypeRef v8 = cf;
      }
      if (v8)
      {
        CFTypeRef cf = 0;
        CFRelease(v8);
      }
      if (Master) {
        CFRelease(Master);
      }
      return (char)v7;
    }
LABEL_16:
    if (CFErrorGetCode((CFErrorRef)cf) == -25300)
    {
      CFTypeRef v12 = cf;
      if (cf)
      {
        CFTypeRef cf = 0;
        CFRelease(v12);
      }
      Master = (const void *)PCSIdentityCreateMaster();
      if (Master && PCSIdentitySetAddIdentityWithError()) {
        LODWORD(v7) = PCSIdentitySetSetCurrentIdentityWithError() | v7;
      }
    }
    else
    {
      Master = 0;
    }
    goto LABEL_3;
  }
  if (a4) {
    *a4 = (__CFError *)v11;
  }

  LOBYTE(v7) = 0;
  return (char)v7;
}

- (void)triggerEscrowSyncWithDSID:(id)a3 accountIdentifier:(id)a4 settingsKeyExpirationDate:(id)a5 settingsKeyIdentifier:(id)a6 complete:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  id v17 = [(PCSSyncing *)self serialOperationQueue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000206D8;
  v23[3] = &unk_1000397B8;
  objc_copyWeak(&v30, &location);
  id v18 = v16;
  id v29 = v18;
  id v19 = v12;
  id v24 = v19;
  id v20 = v13;
  id v25 = v20;
  v26 = self;
  id v21 = v15;
  id v27 = v21;
  id v22 = v14;
  id v28 = v22;
  [v17 addOperationWithBlock:v23];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (BOOL)forceSyncNeeded:(id)a3 dsid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    LOBYTE(v11) = 0;
    goto LABEL_22;
  }
  if (![v6 count])
  {
    id v15 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v16 = "received empty public keys array, will force CKKS fetch";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
LABEL_21:
    LOBYTE(v11) = 1;
    goto LABEL_22;
  }
  CFTypeRef v8 = [(PCSSyncing *)self identityCopySet:v7];
  if (!v8)
  {
    id v15 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v16 = "failed to create identity set, will force CKKS fetch";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  int v9 = v8;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v6;
  id v11 = (char *)[v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = (const void *)PCSIdentitySetCopyIdentity();
        if (!v14)
        {
          LOBYTE(v11) = 1;
          goto LABEL_17;
        }
        CFRelease(v14);
      }
      id v11 = (char *)[v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  CFRelease(v9);
LABEL_22:

  return (char)v11;
}

- (void)triggerCKKSSyncForService:(id)a3 dsid:(id)a4 publicKeys:(id)a5 complete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  if ((PCSSupportsPersonaMultiuser() & 1) == 0)
  {
    id v25 = 0;
    unsigned __int8 v14 = +[PCSAccountsModel currentPersonaSupportsPrimaryAccount:&v25];
    id v15 = v25;
    id v16 = v15;
    if ((v14 & 1) == 0)
    {
      (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v15);

      goto LABEL_6;
    }
  }
  id v17 = [(PCSSyncing *)self serialOperationQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000210CC;
  v18[3] = &unk_100039808;
  objc_copyWeak(&v24, &location);
  id v23 = v13;
  id v19 = v10;
  long long v20 = self;
  id v21 = v12;
  id v22 = v11;
  [v17 addOperationWithBlock:v18];

  objc_destroyWeak(&v24);
LABEL_6:
  objc_destroyWeak(&location);
}

- (void)triggerSyncingWithEscrowProxy:(id)a3 dsid:(id)a4 publicKeys:(id)a5 accountIdentifier:(id)a6 settingsKeyExpirationDate:(id)a7 settingsKeyIdentifier:(id)a8 complete:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  CFTypeRef cf = 0;
  if (CFEqual(v15, kPCSServiceMaster) || (id v23 = [(PCSSyncing *)self identityCopySet:v16]) == 0)
  {
    _PCSError();
  }
  else
  {
    CFTypeRef v22 = v23;
    if (v15) {
      int IsManatee = PCSServiceItemTypeIsManatee();
    }
    else {
      int IsManatee = 0;
    }
    if (!PCSIdentitySetIsWalrusWithForceFetch())
    {
      if (!IsManatee)
      {
        [(PCSSyncing *)self triggerEscrowSyncWithDSID:v16 accountIdentifier:v18 settingsKeyExpirationDate:v19 settingsKeyIdentifier:v20 complete:v21];
        goto LABEL_5;
      }
      goto LABEL_17;
    }
    if ([(PCSSyncing *)self ensureMKExists:v22 error:&cf])
    {
      if ((IsManatee & 1) == 0) {
        [(PCSSyncing *)self triggerEscrowSyncWithDSID:v16 accountIdentifier:v18 settingsKeyExpirationDate:v19 settingsKeyIdentifier:v20 complete:&stru_100039848];
      }
LABEL_17:
      [(PCSSyncing *)self triggerCKKSSyncForService:v15 dsid:v16 publicKeys:v17 complete:v21];
      goto LABEL_5;
    }
    CFRelease(v22);
  }
  (*((void (**)(id, void, void, CFTypeRef))v21 + 2))(v21, 0, 0, cf);
  CFTypeRef v22 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
LABEL_5:
    CFRelease(v22);
  }
}

- (void)setupIdentitiesForAccount:(id)a3 withParameters:(id)a4 optional:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  id v10 = [(PCSSyncing *)self serialOperationQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021850;
  v13[3] = &unk_100039200;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v14 = v11;
  BOOL v17 = a5;
  id v12 = v8;
  id v15 = v12;
  [v10 addOperationWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)migrateToiCDPForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(PCSSyncing *)self serialOperationQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100021BEC;
  v14[3] = &unk_100039188;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addOperationWithBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)enableWalrusForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(PCSSyncing *)self serialOperationQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100021D98;
  v14[3] = &unk_100039188;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addOperationWithBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)disableWalrusForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(PCSSyncing *)self serialOperationQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002202C;
  v14[3] = &unk_100039188;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addOperationWithBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)createIdentity:(id)a3 dsid:(id)a4 roll:(BOOL)a5 sync:(BOOL)a6 forceSync:(BOOL)a7 complete:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  uint64_t v31 = 0;
  if (!v14)
  {
    _PCSError();
LABEL_8:
    (*((void (**)(id, void, void, uint64_t))v16 + 2))(v16, 0, 0, v31);
    goto LABEL_11;
  }
  if (!v15)
  {
    id v18 = [(PCSSyncing *)self accounts];
    CFTypeRef v22 = [v18 lastError];
    _PCSError();

    goto LABEL_8;
  }
  id v17 = [(PCSSyncing *)self identityCopySet:v15];
  if (v17 && !PCSIdentityGetCDPStatus())
  {
    id v19 = [objc_alloc((Class)PCSCKKS) initWithIdentitySet:v17 dsid:v15];
    if (v19)
    {
      if (v10 && [v14 isEqualToString:kPCSMessages3])
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100022510;
        v29[3] = &unk_100039870;
        id v20 = dispatch_semaphore_create(0);
        id v30 = v20;
        [(PCSSyncing *)self restoreMobileBackup:0 dsid:v15 withReply:v29];
        dispatch_time_t v21 = dispatch_time(0, 60000000000);
        if (dispatch_semaphore_wait(v20, v21))
        {
          log = qword_100040ED8;
          if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Timeout expired for best-effort backup recovery. Continuing with CKKS sync.", (uint8_t *)buf, 2u);
          }
        }
      }
      objc_initWeak(buf, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100022624;
      v24[3] = &unk_100039898;
      objc_copyWeak(&v27, buf);
      id v25 = v14;
      id v26 = v16;
      [v19 createNewIdentity:v25 roll:v11 sync:v10 forceSync:v9 complete:v24];
      CFRelease(v17);

      objc_destroyWeak(&v27);
      objc_destroyWeak(buf);
    }
    else
    {
      _PCSError();
      (*((void (**)(id, void, void, uint64_t))v16 + 2))(v16, 0, 0, v31);
      CFRelease(v17);
    }
  }
  else
  {
    _PCSError();
    (*((void (**)(id, void, void, uint64_t))v16 + 2))(v16, 0, 0, v31);
    if (v17) {
      CFRelease(v17);
    }
  }
LABEL_11:
}

- (_PCSIdentitySetData)identityCopySet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  v17[1] = 0;
  if (!v4)
  {
    v17[0] = 0;
    unsigned int v9 = +[PCSAccountsModel currentPersonaSupportsPrimaryAccount:v17];
    id v10 = v17[0];
    BOOL v11 = qword_100040ED8;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        id v13 = v11;
        id v14 = [(PCSSyncing *)self accounts];
        id v15 = [v14 lastError];
        *(_DWORD *)buf = 138412290;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fail getting dsid: %@", buf, 0xCu);
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fail getting dsid, error: %@", buf, 0xCu);
    }

    id v6 = 0;
    goto LABEL_11;
  }
  uint64_t v18 = kPCSSetupDSID;
  id v19 = v4;
  id v6 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  uint64_t v7 = PCSIdentitySetCreate();
  if (!v7)
  {
LABEL_11:
    id v8 = 0;
    goto LABEL_12;
  }
  id v8 = (_PCSIdentitySetData *)v7;
LABEL_12:

  return v8;
}

- (void)repairWalrus
{
  int64_t v3 = [(PCSSyncing *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PCSSyncing *)self accounts];
  uint64_t v5 = [v4 dsid];

  id v6 = [(PCSSyncing *)self identityCopySet:v5];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = PCSIdentitySetIsWalrusWithForceFetch();
    CFRelease(v7);
    if (v8)
    {
      uint64_t v11 = kPCSSetupDSID;
      BOOL v12 = v5;
      id v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      [(PCSSyncing *)self enableWalrusForAccount:0 withParameters:v10 complete:&stru_1000398D8];
    }
  }
  else
  {
    unsigned int v9 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "repairWalrus: no identity set", buf, 2u);
    }
  }
}

- (void)notifyDailyEvent
{
  int64_t v3 = [(PCSSyncing *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022D14;
  block[3] = &unk_100038C20;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)notifyEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PCSSyncing *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022FEC;
  v7[3] = &unk_100038C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)queuedCheckRegistry:(id)a3 withReply:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PCSSyncing *)self registry];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [(PCSSyncing *)self mobileBackup],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isBackupEnabled],
        v8,
        v7,
        v9))
  {
    id v10 = [(PCSSyncing *)self registryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023198;
    block[3] = &unk_100038F18;
    block[4] = self;
    id v15 = v5;
    dispatch_async(v10, block);

    uint64_t v11 = v15;
  }
  else
  {
    uint64_t v12 = kPCSErrorDomain;
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"Mobile backup is disabled";
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v13 = +[NSError errorWithDomain:v12 code:137 userInfo:v11];
    (*((void (**)(id, void *))v5 + 2))(v5, v13);
  }
}

- (void)getAllClients:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v5 = [(PCSSyncing *)self manager];
  uint64_t v6 = [v5 allClients];

  +[NSMutableDictionary dictionary];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000234B4;
  v8[3] = &unk_100039988;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = self;
  id v7 = v9;
  [v6 enumerateObjectsUsingBlock:v8];
  v4[2](v4, v7, 0);
}

- (void)syncKeys:(id)a3 withReply:(id)a4
{
  id v8 = (void (**)(id, void *, void))a4;
  id v6 = a3;
  id v7 = [(PCSSyncing *)self syncing];
  [v7 triggerIDSSyncing:v6];

  v8[2](v8, &__NSDictionary0__struct, 0);
}

- (void)triggerDaily:(id)a3 withReply:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  [(PCSSyncing *)self notifyDailyEvent];
  v5[2](v5, &__NSDictionary0__struct, 0);
}

- (void)checkSyncingForPeer:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PCSSyncing *)self syncing];
  [v7 checkSyncingForPeer:v6 force:v4];
}

- (void)fetchAllDeviceKeys:(id)a3 withReply:(id)a4
{
  id v4 = a4;
  id v5 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching all device keys", v7, 2u);
  }
  id v6 = PCSErrorCreate();
  (*((void (**)(id, void, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, 0, v6);
}

- (void)restoreMobileBackup:(BOOL)a3 dsid:(id)a4 withReply:(id)a5
{
  BOOL v70 = a3;
  id v7 = a4;
  id v8 = a5;
  if ((PCSSupportsPersonaMultiuser() & 1) == 0)
  {
    id v79 = 0;
    unsigned __int8 v9 = +[PCSAccountsModel currentPersonaSupportsPrimaryAccount:&v79];
    id v10 = v79;
    uint64_t v11 = v10;
    if ((v9 & 1) == 0)
    {
      (*((void (**)(id, void, void, void, id))v8 + 2))(v8, 0, 0, 0, v10);
      goto LABEL_69;
    }
  }
  uint64_t v12 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = "restore";
    if (v70) {
      id v13 = "test";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v81 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PCSRestoreCKBackupWithCompletion: %s", buf, 0xCu);
  }
  uint64_t v11 = +[PCSAnalytics logger];
  uint64_t v68 = PCSEventMobileRestore;
  uint64_t v69 = PCSEventMBValidate;
  if (v70) {
    id v14 = (void *)PCSEventMBValidate;
  }
  else {
    id v14 = (void *)PCSEventMobileRestore;
  }
  id v15 = v14;
  NSErrorUserInfoKey v16 = [(PCSSyncing *)self registry];

  if (!v16 || !v7)
  {
    id v24 = PCSErrorCreate();
    (*((void (**)(id, void, void, void, void *))v8 + 2))(v8, 0, 0, 0, v24);
    [v11 logRecoverableError:v24 forEvent:v15 withAttributes:0];
    goto LABEL_68;
  }
  CFStringRef v17 = [(PCSSyncing *)self registry];
  uint64_t v18 = [v17 syncUserRegistry];

  [v18 waitUntilFinished];
  id v19 = (void *)qword_100040ED8;
  v72 = v11;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v19;
    id v21 = [v18 error];
    *(_DWORD *)buf = 138412290;
    *(void *)v81 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "restoreMobileBackup: sync finished with: %@", buf, 0xCu);

    uint64_t v11 = v72;
  }
  CFTypeRef v22 = [v18 error];

  if (v22)
  {
    id v23 = [v18 error];
    id v24 = CKXPCSuitableError();
  }
  else
  {
    id v24 = 0;
  }
  id v25 = [(PCSSyncing *)self registry];
  uint64_t v26 = [v25 allMobileBackupKeys];

  v66 = (void *)v26;
  if (!v26)
  {
    uint64_t v56 = 0;
    unsigned int v71 = 0;
    goto LABEL_65;
  }
  id v27 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "restoreMobileBackup: got reply from server", buf, 2u);
  }
  v35 = sub_100023FB4(kCFAllocatorDefault, v28, v29, v30, v31, v32, v33, v34, kPCSSetupDSID, (uint64_t)v7);
  Keychain = (const void *)PCSIdentitySetCreateKeychain();
  v37 = (const void *)PCSIdentitySetCreateKeychain();
  if (v35) {
    CFRelease(v35);
  }
  if (!Keychain)
  {
    uint64_t v60 = PCSErrorCreate();

    unsigned int v71 = 0;
    uint64_t v56 = 0;
    uint64_t v26 = 0;
    id v24 = (void *)v60;
    if (v37) {
      goto LABEL_64;
    }
    goto LABEL_65;
  }
  CFTypeRef v73 = v37;
  v62 = v24;
  v63 = v18;
  id v38 = v15;
  id v64 = v8;
  id v65 = v7;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v39 = (id)v26;
  id v40 = [v39 countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (!v40)
  {
    uint64_t v26 = 0;
    unsigned int v74 = 0;
    unsigned int v71 = 0;
    goto LABEL_61;
  }
  id v41 = v40;
  uint64_t v26 = 0;
  unsigned int v74 = 0;
  unsigned int v71 = 0;
  uint64_t v42 = *(void *)v76;
  CFStringRef v43 = @"Would Be";
  if (!v70) {
    CFStringRef v43 = &stru_100039C58;
  }
  CFStringRef v67 = v43;
  do
  {
    for (i = 0; i != v41; i = (char *)i + 1)
    {
      if (*(void *)v76 != v42) {
        objc_enumerationMutation(v39);
      }
      v45 = [*(id *)(*((void *)&v75 + 1) + 8 * i) data];
      v46 = (const void *)PCSBackupCopyRecoveredKeyWithIdentitySet();

      if (v46)
      {
        ServiceName = (const void *)PCSIdentityGetServiceName();
        if (ServiceName) {
          BOOL v48 = kPCSMessages3 == 0;
        }
        else {
          BOOL v48 = 1;
        }
        if (v48)
        {
          if (ServiceName == (const void *)kPCSMessages3)
          {
LABEL_46:
            PCSIdentityGetPublicKey();
            v51 = (const void *)PCSIdentitySetCopyIdentity();
            v52 = qword_100040ED8;
            BOOL v53 = os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT);
            if (v51)
            {
              if (v53)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Already have identity", buf, 2u);
              }
              CFRelease(v51);
              uint64_t v11 = v72;
              [v72 logSuccessForEvent:v38];
              ++v74;
            }
            else
            {
              uint64_t v11 = v72;
              if (v53)
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v81 = v67;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%@ Adding missing identity", buf, 0xCu);
              }
              if (v70)
              {
                key = (void *)PCSIdentityGetServiceName();
                v54 = PCSErrorCreate();
                objc_msgSend(v72, "logRecoverableError:forEvent:withAttributes:", v54, v69, 0, key);
              }
              else
              {
                PCSIdentitySetAddIdentity();
                [v72 logSuccessForEvent:v68];
              }
              ++v71;
            }
          }
        }
        else if (CFEqual(ServiceName, kPCSMessages3))
        {
          goto LABEL_46;
        }
        CFRelease(v46);
        continue;
      }
      v49 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v81 = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "PCSRestoreCKBackupWithCompletion failed with: %@", buf, 0xCu);
      }
      [v11 logRecoverableError:0 forEvent:v38 withAttributes:0];
      uint64_t v26 = (v26 + 1);
    }
    id v41 = [v39 countByEnumeratingWithState:&v75 objects:v84 count:16];
  }
  while (v41);
LABEL_61:

  v55 = qword_100040ED8;
  uint64_t v56 = v74;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v81 = v71;
    *(_WORD *)&v81[4] = 1024;
    *(_DWORD *)&v81[6] = v74;
    __int16 v82 = 1024;
    int v83 = v26;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "recover stats: Recovered: %d AlreadyPresent: %d RecoveryIssue: %d", buf, 0x14u);
  }
  CFRelease(Keychain);
  id v8 = v64;
  id v7 = v65;
  id v15 = v38;
  id v24 = v62;
  uint64_t v18 = v63;
  v37 = v73;
  if (v73) {
LABEL_64:
  }
    CFRelease(v37);
LABEL_65:
  id v57 = [objc_alloc((Class)NSNumber) initWithInt:v26];
  id v58 = [objc_alloc((Class)NSNumber) initWithInt:v71];
  id v59 = [objc_alloc((Class)NSNumber) initWithInt:v56];
  (*((void (**)(id, id, id, id, void *))v8 + 2))(v8, v57, v58, v59, v24);

  uint64_t v11 = v72;
  if (v24) {
    [v72 logRecoverableError:v24 forEvent:v15 withAttributes:0];
  }

LABEL_68:
LABEL_69:
}

- (void)mobileBackupRecordIDsWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(PCSSyncing *)self registry];

  if (v5)
  {
    id v6 = [(PCSSyncing *)self registry];
    id v8 = 0;
    id v7 = [v6 fetchMobileBackupRecordIDsWithError:&v8];
    id v5 = v8;
  }
  else
  {
    id v7 = 0;
  }
  v4[2](v4, v7, v5);
}

- (void)userDBBackupRecordIDsWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(PCSSyncing *)self registry];

  if (v5)
  {
    id v6 = [(PCSSyncing *)self registry];
    id v8 = 0;
    id v7 = [v6 userDBBackupRecordIDsWithError:&v8];
    id v5 = v8;
  }
  else
  {
    id v7 = 0;
  }
  v4[2](v4, v7, v5);
}

- (void)fetchStats:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(PCSSyncing *)self registry];

  if (v5)
  {
    id v7 = [(PCSSyncing *)self registry];
    uint64_t v6 = [v7 stats];
    v4[2](v4, v6);

    id v4 = (void (**)(id, uint64_t))v6;
  }
  else
  {
    id v7 = objc_alloc_init((Class)UserRegistryStats);
    ((void (*)(void (**)(id, uint64_t)))v4[2])(v4);
  }
}

- (void)manateeStatus:(id)a3 complete:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  id v7 = +[PCSAccountsModel accountForCurrentPersona];
  id v8 = objc_alloc_init((Class)OTConfigurationContext);
  unsigned __int8 v9 = objc_msgSend(v7, "aa_altDSID");
  [v8 setAltDSID:v9];

  [v8 setContext:OTDefaultContext];
  id v10 = [objc_alloc((Class)OTClique) initWithContextData:v8];
  id v11 = objc_alloc_init((Class)OTOperationConfiguration);
  [v11 setUseCachedAccountStatus:1];
  id v26 = 0;
  id v12 = [v10 fetchCliqueStatus:v11 error:&v26];
  id v13 = v26;
  if (v12)
  {
    id v14 = pcsLogObjForScope();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PCSReportManateeStatus otStatus: %@", (uint8_t *)&buf, 0xCu);
    }

    if ((unint64_t)v12 + 1 > 4) {
      uint64_t v15 = 30;
    }
    else {
      uint64_t v15 = dword_10002BFB0[(void)v12 + 1];
    }
    v6[2](v6, v15);
  }
  if (v5)
  {
    id v25 = 0;
    NSErrorUserInfoKey v16 = +[CKKSControl controlObject:&v25];
    id v21 = v25;
    if (v16)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v32 = 0x2020000000;
      int v33 = 9;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100024654;
      v22[3] = &unk_1000399B0;
      p_long long buf = &buf;
      CFStringRef v17 = dispatch_semaphore_create(0);
      id v23 = v17;
      [v16 rpcStatus:v5 reply:v22];
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v18 = pcsLogObjForScope();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = *(_DWORD *)(*((void *)&buf + 1) + 24);
        *(_DWORD *)id v27 = 138412546;
        id v28 = v5;
        __int16 v29 = 1024;
        int v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PCSReportManateeStatus %@ rpcStatus: %d", v27, 0x12u);
      }

      v6[2](v6, *(unsigned int *)(*((void *)&buf + 1) + 24));
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v20 = pcsLogObjForScope();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PCSReportManateeStatus rpcStatus: %@", (uint8_t *)&buf, 0xCu);
      }

      v6[2](v6, 10);
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)keyRollPending:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ((PCSSupportsPersonaMultiuser() & 1) == 0)
  {
    id v14 = 0;
    unsigned __int8 v8 = +[PCSAccountsModel currentPersonaSupportsPrimaryAccount:&v14];
    id v9 = v14;
    id v10 = v9;
    if ((v8 & 1) == 0)
    {
      v7[2](v7, 0, v9);
LABEL_11:

      goto LABEL_12;
    }
  }
  if (v6)
  {
    id v10 = +[PCSAccountsModel defaultAccountsModel];
    id v11 = [v10 dsid];
    id v12 = [(PCSSyncing *)self identityCopySet:v11];

    if (v12)
    {
      uint64_t IsPending = PCSDaemonKeyRollIsPending();
      CFRelease(v12);
    }
    else
    {
      uint64_t IsPending = 0;
    }
    v7[2](v7, IsPending, 0);
    goto LABEL_11;
  }
  v7[2](v7, 0, 0);
LABEL_12:
}

- (void)getHealthSummary:(id)a3
{
  id v5 = a3;
  id v6 = [(PCSSyncing *)self healthSummary];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)setupIdentitiesWithParameters:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  unsigned __int8 v8 = [(PCSSyncing *)self serialOperationQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024EA8;
  v11[3] = &unk_100039188;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 addOperationWithBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (PCSUserRegistry)registry
{
  return (PCSUserRegistry *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRegistry:(id)a3
{
}

- (OS_dispatch_queue)registryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegistryQueue:(id)a3
{
}

- (PCSKeySyncing)manager
{
  return (PCSKeySyncing *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManager:(id)a3
{
}

- (PCSAccountsModel)accounts
{
  return (PCSAccountsModel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccounts:(id)a3
{
}

- (PCSDelayedAction)triggerWatchSyncingAction
{
  return (PCSDelayedAction *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTriggerWatchSyncingAction:(id)a3
{
}

- (NSOperationQueue)serialOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSerialOperationQueue:(id)a3
{
}

- (PCSIDSSyncing)syncing
{
  return (PCSIDSSyncing *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSyncing:(id)a3
{
}

- (NSUserDefaults)settings
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSettings:(id)a3
{
}

- (PCSMobileBackup)mobileBackup
{
  return (PCSMobileBackup *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMobileBackup:(id)a3
{
}

- (OS_xpc_object)scheduledKeyrollActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 88, 1);
}

- (void)setScheduledKeyrollActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledKeyrollActivity, 0);
  objc_storeStrong((id *)&self->_mobileBackup, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_syncing, 0);
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
  objc_storeStrong((id *)&self->_triggerWatchSyncingAction, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_registryQueue, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end