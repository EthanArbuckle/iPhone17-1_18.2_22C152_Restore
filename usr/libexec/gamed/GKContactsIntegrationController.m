@interface GKContactsIntegrationController
+ (id)sharedController;
- (BOOL)canSyncWithIDS;
- (BOOL)isAlreadyWaitingOnLimitTimer;
- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4;
- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 withContext:(id)a5;
- (CNContactStore)contactStore;
- (GKContactsIntegrationController)init;
- (GKContactsIntegrationController)initWithNotificationCenter:(id)a3 connectionManager:(id)a4 playerProvider:(id)a5 eligibilityChecker:(id)a6 metricsHandler:(id)a7 contactStore:(id)a8 migrator:(id)a9;
- (GKContactsIntegrationControllerSettings)settings;
- (GKContactsIntegrationEligibilityChecker)eligibilityChecker;
- (GKContactsIntegrationMetricsHandler)metricsHandler;
- (GKContactsIntegrationMigrator)migrator;
- (GKContactsIntegrationTimer)contactsChangedCoalescingTimer;
- (GKContactsIntegrationTimer)idsCacheUpdateTimer;
- (GKContactsIntegrationTimer)idsFetchDelayTimer;
- (GKContactsIntegrationTimer)reachabilityChangedCoalescingTimer;
- (GKDispatchGroup)contactsUpdateGroup;
- (GKDispatchGroup)idsUpdateGroup;
- (GKIDSConnectionManager)connectionManager;
- (GKPlayerInternalProvider)playerProvider;
- (OS_dispatch_queue)contactsBatchQueue;
- (OS_dispatch_queue)idsBatchQueue;
- (OS_dispatch_queue)serialQueue;
- (id)contactAssociationIDMapForContactAssociationIDs:(id)a3 withContext:(id)a4;
- (id)contactAssociationIDMapForHandles:(id)a3 withContext:(id)a4;
- (id)contactInfosForHandles:(id)a3 withContext:(id)a4;
- (id)createFriendAssociationIDMapWithIDs:(id)a3 withContext:(id)a4;
- (id)createRelationshipWithHandle:(id)a3 contactAssociationID:(id)a4 usingFriendMap:(id)a5 withContext:(id)a6;
- (id)expirationPredicateForCohort:(int)a3 matchingHandles:(id)a4 usingSettings:(id)a5;
- (id)expiredIDSEntriesWithFetchLimit:(int64_t)a3 matchingHandles:(id)a4 usingSettings:(id)a5 withContext:(id)a6;
- (id)filterForContactIDsSupportingFriendingViaPushFromContactIDs:(id)a3 withContext:(id)a4;
- (id)getContactsForContactAssociationIDs:(id)a3 withContext:(id)a4;
- (id)handleMapForContactAssociationIDs:(id)a3 withContext:(id)a4;
- (id)handlesExcludingNoneExpiredFromHandles:(id)a3 isAlreadyWaitingOnLimitTimer:(BOOL)a4 settings:(id)a5 moc:(id)a6 error:(id *)a7;
- (id)relationshipForMeContact;
- (id)relationshipsForHandles:(id)a3 contactAssociationIDMap:(id)a4 withContext:(id)a5;
- (unint64_t)calculateRemainingIDSHandleQueryCountUsingSettings:(id)a3 withContext:(id)a4;
- (void)clearCachesWithCompletionHandler:(id)a3;
- (void)connectionManagerReady:(id)a3;
- (void)contactsChanged:(id)a3;
- (void)fetchIDSDataAndUpdateCacheForHandles:(id)a3 allowingIneligibility:(unint64_t)a4 usingSettings:(id)a5 withDelay:(BOOL)a6 completion:(id)a7;
- (void)fetchIDSDataAndUpdateCacheForHandles:(id)a3 rangeToFetch:(_NSRange)a4 maxBatchSize:(unint64_t)a5 numberOfHandlesLeft:(int64_t)a6 allowingIneligibility:(unint64_t)a7 settings:(id)a8 withDelay:(BOOL)a9 completion:(id)a10;
- (void)fetchMessageTransportV2AvailabilityForUnprefixedHandles:(id)a3 completion:(id)a4;
- (void)getRelationshipsForContacts:(id)a3 updateExistingContactEntries:(BOOL)a4 completionHandler:(id)a5;
- (void)handleIDSFetchResult:(id)a3 handlesToQuery:(id)a4 rangeToFetch:(_NSRange)a5 maxBatchSize:(unint64_t)a6 numberOfHandlesLeft:(int64_t)a7 allowingIneligibility:(unint64_t)a8 settings:(id)a9 withDelay:(BOOL)a10 completion:(id)a11;
- (void)handleReachabilityChanged;
- (void)playerAuthenticated:(id)a3;
- (void)populateContactInfoForProfiles:(id)a3 playerIdToContactAssociationIdMap:(id)a4 withContext:(id)a5;
- (void)populateContactInfoForProfiles:(id)a3 replyOnQueue:(id)a4 withCompletionHandler:(id)a5;
- (void)populateContactInfoForProfiles:(id)a3 withContext:(id)a4;
- (void)reachabilityChanged:(id)a3;
- (void)refetchIDSHandlesInPriorityOrderWithCompletion:(id)a3;
- (void)relationshipsForContacts:(id)a3 updateExistingContactEntries:(BOOL)a4 allowingIneligibility:(unint64_t)a5 usingSettings:(id)a6 meContactID:(id)a7 completionHandler:(id)a8;
- (void)setConnectionManager:(id)a3;
- (void)setContactsBatchQueue:(id)a3;
- (void)setContactsChangedCoalescingTimer:(id)a3;
- (void)setContactsUpdateGroup:(id)a3;
- (void)setEligibilityChecker:(id)a3;
- (void)setIdsBatchQueue:(id)a3;
- (void)setIdsCacheUpdateTimer:(id)a3;
- (void)setIdsFetchDelayTimer:(id)a3;
- (void)setIdsUpdateGroup:(id)a3;
- (void)setMetricsHandler:(id)a3;
- (void)setMigrator:(id)a3;
- (void)setPlayerProvider:(id)a3;
- (void)setReachabilityChangedCoalescingTimer:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSettings:(id)a3;
- (void)setupIDSCacheUpdateTimerWithStartTime:(double)a3;
- (void)startContactsSyncAllowingChangeHistory:(BOOL)a3 completion:(id)a4;
- (void)startIDSSyncWithCompletion:(id)a3;
- (void)startWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)stop;
- (void)stopCacheUpdates;
- (void)storeBagUpdated:(id)a3;
- (void)syncIDSDataForHandles:(id)a3 forcefully:(BOOL)a4 completion:(id)a5;
- (void)updateIDSEntriesFromOldFriendEntries:(id)a3 againstServerRepresentation:(id)a4 withContext:(id)a5;
- (void)updateIntervalHasFinishedExceedingIDSLimit:(BOOL)a3 allowingIneligibility:(unint64_t)a4 usingSettings:(id)a5;
@end

@implementation GKContactsIntegrationController

+ (id)sharedController
{
  if (qword_100329918 != -1) {
    dispatch_once(&qword_100329918, &stru_1002DBDB8);
  }
  v2 = (void *)qword_100329910;

  return v2;
}

- (GKContactsIntegrationController)init
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = +[GKIDSConnectionManager sharedManager];
  v5 = objc_alloc_init(GKPlayerInternalProvider);
  v6 = objc_alloc_init(GKContactsIntegrationEligibilityChecker);
  v7 = objc_alloc_init(GKContactsIntegrationMetricsHandler);
  id v8 = objc_alloc_init((Class)CNContactStore);
  v9 = [GKContactsIntegrationMigrator alloc];
  v10 = +[NSUserDefaults standardUserDefaults];
  v11 = [(GKContactsIntegrationMigrator *)v9 initWithUserDefaults:v10];
  v12 = [(GKContactsIntegrationController *)self initWithNotificationCenter:v3 connectionManager:v4 playerProvider:v5 eligibilityChecker:v6 metricsHandler:v7 contactStore:v8 migrator:v11];

  return v12;
}

- (GKContactsIntegrationController)initWithNotificationCenter:(id)a3 connectionManager:(id)a4 playerProvider:(id)a5 eligibilityChecker:(id)a6 metricsHandler:(id)a7 contactStore:(id)a8 migrator:(id)a9
{
  id v15 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v16 = a8;
  id v17 = a9;
  v31.receiver = self;
  v31.super_class = (Class)GKContactsIntegrationController;
  v18 = [(GKContactsIntegrationController *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_migrator, a9);
    objc_storeStrong((id *)&v19->_metricsHandler, a7);
    objc_storeStrong((id *)&v19->_eligibilityChecker, a6);
    objc_storeStrong((id *)&v19->_playerProvider, a5);
    objc_storeStrong((id *)&v19->_contactStore, a8);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.GameKit.contactsIntegration.serialQueue", 0);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.GameKit.contactsIntegration.idsBatchQueue", 0);
    idsBatchQueue = v19->_idsBatchQueue;
    v19->_idsBatchQueue = (OS_dispatch_queue *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.GameKit.contactsIntegration.contactsBatchQueue", 0);
    contactsBatchQueue = v19->_contactsBatchQueue;
    v19->_contactsBatchQueue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v19->_connectionManager, a4);
    -[GKIDSConnectionManager setDelegate:](v19->_connectionManager, "setDelegate:", v19, v27, v28, v29, v30);
    [v15 addObserver:v19 selector:"playerAuthenticated:" name:GKPrimaryCredentialDidChangeNotification object:0];
    [v15 addObserver:v19 selector:"storeBagUpdated:" name:@"GKStoreBagUpdatedNotification" object:0];
    [v15 addObserver:v19 selector:"contactsChanged:" name:CNContactStoreDidChangeNotification object:0];
    [v15 addObserver:v19 selector:"reachabilityChanged:" name:@"GKNetworkReachabilityChangedNotification" object:0];
  }

  return v19;
}

- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 withContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(GKContactsIntegrationController *)self eligibilityChecker];
  v11 = [(GKContactsIntegrationController *)self playerProvider];
  v12 = [v11 localPlayer];
  v13 = [(GKContactsIntegrationController *)self connectionManager];
  LOBYTE(a3) = [v10 isEligibleAllowingIneligibility:a3 usingSettings:v9 localPlayerInternal:v12 isConnectionManagerReady:[v13 isReady] withContext:v8];

  return a3;
}

- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4
{
  id v6 = a4;
  v7 = [(GKContactsIntegrationController *)self playerProvider];
  id v8 = [v7 localPlayerCacheGroup];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v9 = [v8 context];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001277F8;
  v13[3] = &unk_1002DBDE0;
  id v16 = &v18;
  unint64_t v17 = a3;
  v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  id v11 = v8;
  id v15 = v11;
  [v9 performBlockAndWait:v13];

  LOBYTE(v6) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v6;
}

- (void)startWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKContactsIntegrationController.m", 172, "-[GKContactsIntegrationController startWithOptions:completion:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001279E4;
    v11[3] = &unk_1002D4050;
    v11[4] = self;
    [v8 perform:v11];
  }
  if ((v4 & 2) != 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100127AAC;
    v10[3] = &unk_1002D4050;
    v10[4] = self;
    [v8 perform:v10];
  }
  id v9 = [(GKContactsIntegrationController *)self serialQueue];
  [v8 notifyOnQueue:v9 block:v6];
}

- (void)startContactsSyncAllowingChangeHistory:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = dispatch_get_current_queue();
  v7 = [(GKContactsIntegrationController *)self serialQueue];

  if (v6 != v7)
  {
    label = dispatch_queue_get_label(v6);
    id v9 = [(GKContactsIntegrationController *)self serialQueue];
    id v10 = dispatch_queue_get_label(v9);
    id v11 = +[NSThread callStackSymbols];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKContactsIntegrationController startContactsSyncAllowingChangeHistory:completion:]", label, v10, v11);
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"];
    id v14 = [v13 lastPathComponent];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v12, "-[GKContactsIntegrationController startContactsSyncAllowingChangeHistory:completion:]", [v14 UTF8String], 192);

    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100128190;
  v61[3] = &unk_1002D3A20;
  id v16 = v5;
  id v62 = v16;
  unint64_t v17 = objc_retainBlock(v61);
  uint64_t v18 = [(GKContactsIntegrationController *)self contactsUpdateGroup];

  if (!v18)
  {
    uint64_t v20 = [(GKContactsIntegrationController *)self settings];
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 0;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = sub_1001281A8;
    v55 = sub_1001281B8;
    id v56 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0;
    dispatch_queue_t v22 = [(GKContactsIntegrationController *)self playerProvider];
    v23 = [v22 localPlayerCacheGroup];

    dispatch_queue_t v24 = [v23 context];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1001281C0;
    v45[3] = &unk_1002DBE08;
    v48 = &v57;
    v45[4] = self;
    id v25 = v20;
    id v46 = v25;
    id v26 = v23;
    id v47 = v26;
    v49 = &v51;
    [v24 performBlockAndWait:v45];

    if (*((unsigned char *)v58 + 24))
    {
      if (a3 || !v52[5])
      {
        if (!os_log_GKGeneral) {
          id v28 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
          sub_10013120C();
        }
        objc_initWeak(&location, self);
        id v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKContactsIntegrationController.m", 247, "-[GKContactsIntegrationController startContactsSyncAllowingChangeHistory:completion:]");
        id v30 = +[GKDispatchGroup dispatchGroupWithName:v29];
        [(GKContactsIntegrationController *)self setContactsUpdateGroup:v30];

        objc_super v31 = [(GKContactsIntegrationController *)self contactsUpdateGroup];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1001282E8;
        v39[3] = &unk_1002DBE58;
        objc_copyWeak(&v43, &location);
        v41 = &v51;
        id v40 = v25;
        v42 = v50;
        [v31 perform:v39];

        v32 = [(GKContactsIntegrationController *)self contactsUpdateGroup];
        v33 = [(GKContactsIntegrationController *)self serialQueue];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1001284B8;
        v36[3] = &unk_1002DA498;
        objc_copyWeak(&v38, &location);
        v37 = v17;
        [v32 notifyOnQueue:v33 block:v36];

        objc_destroyWeak(&v38);
        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);
        goto LABEL_26;
      }
      if (!os_log_GKGeneral) {
        id v27 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_100131240();
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v34 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_1001311D8();
      }
    }
    ((void (*)(void *))v17[2])(v17);
LABEL_26:
    _Block_object_dispose(v50, 8);
    _Block_object_dispose(&v51, 8);

    _Block_object_dispose(&v57, 8);
    goto LABEL_27;
  }
  if (!os_log_GKGeneral) {
    id v19 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100131274();
  }
  ((void (*)(void *))v17[2])(v17);
LABEL_27:
}

- (unint64_t)calculateRemainingIDSHandleQueryCountUsingSettings:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = +[GKCDIDSInfoList _gkPrimaryListWithContext:a4];
  v7 = [v6 updateIntervalStartTimeStamp];
  [v5 idsUpdateInterval];
  id v8 = [v7 dateByAddingTimeInterval:];

  id v9 = +[NSDate date];
  if (!v8 || [v8 compare:v9] == (id)-1) {
    [v6 _gkReset];
  }
  id v10 = [v6 updateIntervalHandlesCount];
  signed int v11 = [v10 intValue];

  id v12 = [v5 idsV2FetchSize];
  unint64_t v13 = ((uint64_t)v12 - v11) & ~(((uint64_t)v12 - v11) >> 63);

  return v13;
}

- (void)refetchIDSHandlesInPriorityOrderWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_current_queue();
  id v6 = [(GKContactsIntegrationController *)self serialQueue];

  if (v5 != v6)
  {
    label = dispatch_queue_get_label(v5);
    id v8 = [(GKContactsIntegrationController *)self serialQueue];
    id v9 = dispatch_queue_get_label(v8);
    id v10 = +[NSThread callStackSymbols];
    signed int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKContactsIntegrationController refetchIDSHandlesInPriorityOrderWithCompletion:]", label, v9, v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v11, "-[GKContactsIntegrationController refetchIDSHandlesInPriorityOrderWithCompletion:]", [v13 UTF8String], 296);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_1001312A8();
  }
  id v16 = [(GKContactsIntegrationController *)self settings];
  unint64_t v17 = [(GKContactsIntegrationController *)self playerProvider];
  uint64_t v18 = [v17 localPlayerCacheGroup];

  id v19 = [v18 context];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100128890;
  v23[3] = &unk_1002D91F0;
  id v24 = v18;
  id v25 = self;
  id v27 = v4;
  uint64_t v28 = 0;
  id v26 = v16;
  id v20 = v4;
  id v21 = v16;
  id v22 = v18;
  [v19 performBlock:v23];
}

- (void)updateIntervalHasFinishedExceedingIDSLimit:(BOOL)a3 allowingIneligibility:(unint64_t)a4 usingSettings:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    id v9 = [(GKContactsIntegrationController *)self playerProvider];
    id v10 = [v9 localPlayerCacheGroup];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100128E74;
    v18[3] = &unk_1002D5078;
    id v11 = v10;
    id v19 = v11;
    id v20 = self;
    unint64_t v22 = a4;
    id v21 = v8;
    [v11 performOnManagedObjectContext:v18];
    id v12 = [(GKContactsIntegrationController *)self serialQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100128F7C;
    v15[3] = &unk_1002D3B38;
    id v16 = v11;
    unint64_t v17 = self;
    id v13 = v11;
    [v13 notifyOnQueue:v12 block:v15];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100131310();
    }
    [(GKContactsIntegrationController *)self stop];
  }
}

- (id)handlesExcludingNoneExpiredFromHandles:(id)a3 isAlreadyWaitingOnLimitTimer:(BOOL)a4 settings:(id)a5 moc:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v12 mutableCopy];
  unint64_t v16 = [(GKContactsIntegrationController *)self calculateRemainingIDSHandleQueryCountUsingSettings:v13 withContext:v14];
  id v46 = v14;
  id v47 = v12;
  if (!v16 || v10)
  {
    if (!os_log_GKGeneral) {
      id v41 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1001313AC();
    }
    uint64_t v42 = GKContactsIntegrationErrorDomain;
    CFStringRef v53 = @"reason";
    unint64_t v17 = +[NSNumber numberWithUnsignedInteger:v16];
    id v22 = +[NSNumber numberWithBool:v10];
    id v43 = +[NSString stringWithFormat:@"remainingHandlesToUpdate: %@, isAlreadyWaitingOnLimitTimer: %@", v17, v22];
    v54 = v43;
    v44 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    *a7 = +[NSError errorWithDomain:v42 code:4 userInfo:v44];

    id v40 = 0;
    v33 = v46;
    v32 = v12;
  }
  else
  {
    unint64_t v17 = +[GKCDIDSInfo _gkFetchRequest];
    uint64_t v18 = +[NSPredicate predicateWithFormat:@"handle IN %@", v12];
    [v17 setPredicate:v18];

    id v19 = +[GKCDIDSInfo _gkObjectsFromFetchRequest:v17 withContext:v14];
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers();
    }
    id v21 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_10013152C(v21);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v22 = v19;
    id v23 = [v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v49;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v49 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (([v27 isExpiredForSettings:v13] & 1) == 0)
          {
            uint64_t v28 = [v27 handle];

            if (v28)
            {
              id v29 = [v27 handle];
              [v15 removeObject:v29];
            }
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v24);
    }

    if (!os_log_GKGeneral) {
      id v30 = (id)GKOSLoggers();
    }
    objc_super v31 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100131488(v31);
    }
    v33 = v46;
    v32 = v47;
    if (v16 < (unint64_t)[v15 count])
    {
      if (!os_log_GKGeneral) {
        id v34 = (id)GKOSLoggers();
      }
      v35 = (void *)os_log_GKContacts;
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_1001313E0(v35, v16);
      }
      v36 = [v15 allObjects];
      v37 = [v36 subarrayWithRange:0, v16];
      id v38 = +[NSSet setWithArray:v37];
      id v39 = [v38 mutableCopy];

      id v15 = v39;
    }
    id v15 = v15;
    id v40 = v15;
  }

  return v40;
}

- (void)syncIDSDataForHandles:(id)a3 forcefully:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(GKContactsIntegrationController *)self serialQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100129634;
  v13[3] = &unk_1002D5028;
  BOOL v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)fetchIDSDataAndUpdateCacheForHandles:(id)a3 allowingIneligibility:(unint64_t)a4 usingSettings:(id)a5 withDelay:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  BOOL v16 = (void *)os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100131638(v16);
  }
  id v17 = [v13 idsV2BatchFetchSize];
  if (v17)
  {
    id v18 = v17;
    id v19 = [v12 allObjects];
    id v20 = [v19 count];
    id v21 = [(GKContactsIntegrationController *)self idsBatchQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100129E84;
    v24[3] = &unk_1002DBED0;
    v24[4] = self;
    id v25 = v19;
    uint64_t v28 = 0;
    id v29 = v18;
    id v30 = v18;
    id v31 = v20;
    unint64_t v32 = a4;
    id v26 = v13;
    BOOL v33 = a6;
    id v27 = v14;
    id v22 = v19;
    dispatch_async(v21, v24);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100131604();
    }
    (*((void (**)(id, void))v14 + 2))(v14, 0);
  }
}

- (void)fetchIDSDataAndUpdateCacheForHandles:(id)a3 rangeToFetch:(_NSRange)a4 maxBatchSize:(unint64_t)a5 numberOfHandlesLeft:(int64_t)a6 allowingIneligibility:(unint64_t)a7 settings:(id)a8 withDelay:(BOOL)a9 completion:(id)a10
{
  NSUInteger v36 = a4.location;
  length = (char *)a4.length;
  id v38 = a3;
  id v34 = a8;
  id v37 = a10;
  id v12 = dispatch_get_current_queue();
  id v13 = [(GKContactsIntegrationController *)self idsBatchQueue];

  if (v12 != v13)
  {
    label = dispatch_queue_get_label(v12);
    id v15 = [(GKContactsIntegrationController *)self idsBatchQueue];
    BOOL v16 = dispatch_queue_get_label(v15);
    id v17 = +[NSThread callStackSymbols];
    id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKContactsIntegrationController fetchIDSDataAndUpdateCacheForHandles:rangeToFetch:maxBatchSize:numberOfHandlesLeft:allowingIneligibility:settings:withDelay:completion:]", label, v16, v17);
    id v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"];
    id v20 = [v19 lastPathComponent];
    id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.idsBatchQueue)\n[%s (%s:%d)]", v18, "-[GKContactsIntegrationController fetchIDSDataAndUpdateCacheForHandles:rangeToFetch:maxBatchSize:numberOfHandlesLeft:allowingIneligibility:settings:withDelay:completion:]", [v20 UTF8String], 619);

    +[NSException raise:@"GameKit Exception", @"%@", v21 format];
  }

  id v22 = (char *)[v38 count];
  if (a6 >= 1 && length)
  {
    if (&length[v36] > v22) {
      length = &v22[-v36];
    }
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers();
    }
    id v24 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = v24;
      id v29 = +[NSNumber numberWithUnsignedInteger:v36];
      id v30 = +[NSNumber numberWithUnsignedInteger:length];
      id v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v38 count]);
      *(_DWORD *)id location = 138412802;
      *(void *)&location[4] = v29;
      __int16 v46 = 2112;
      id v47 = v30;
      __int16 v48 = 2112;
      long long v49 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Fetching range: (%@, %@) of total count: %@", location, 0x20u);
    }
    id v25 = [v38 subarrayWithRange:v36, length];
    id v26 = [(GKContactsIntegrationController *)self connectionManager];
    objc_initWeak((id *)location, self);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10012A358;
    v39[3] = &unk_1002DBEF8;
    objc_copyWeak(v43, (id *)location);
    id v42 = v37;
    id v40 = v38;
    v43[1] = (id)v36;
    v43[2] = length;
    v43[3] = (id)a5;
    v43[4] = (id)a6;
    v43[5] = (id)a7;
    id v41 = v34;
    BOOL v44 = a9;
    [v26 fetchIDSDataForHandles:v25 service:@"com.apple.private.alloy.arcade" infoTypes:5 performingBlockPerBatch:v39];

    objc_destroyWeak(v43);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v27 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1001316DC();
    }
    (*((void (**)(id, void))v37 + 2))(v37, 0);
  }
}

- (void)handleIDSFetchResult:(id)a3 handlesToQuery:(id)a4 rangeToFetch:(_NSRange)a5 maxBatchSize:(unint64_t)a6 numberOfHandlesLeft:(int64_t)a7 allowingIneligibility:(unint64_t)a8 settings:(id)a9 withDelay:(BOOL)a10 completion:(id)a11
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  id v18 = a11;
  id v19 = [(GKContactsIntegrationController *)self playerProvider];
  id v20 = [v19 localPlayerCacheGroup];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10012A774;
  v43[3] = &unk_1002D6D60;
  id v21 = v20;
  id v44 = v21;
  id v45 = v15;
  __int16 v46 = self;
  unint64_t v48 = a8;
  id v22 = v17;
  id v47 = v22;
  id v30 = v15;
  [v21 performOnManagedObjectContext:v43];
  id v23 = [(GKContactsIntegrationController *)self idsBatchQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10012ACCC;
  v31[3] = &unk_1002DBF70;
  id v32 = v21;
  id v33 = v22;
  id v36 = v18;
  NSUInteger v37 = location;
  NSUInteger v38 = length;
  unint64_t v39 = a6;
  id v34 = self;
  id v35 = v16;
  int64_t v40 = a7;
  unint64_t v41 = a8;
  BOOL v42 = a10;
  id v24 = v16;
  id v25 = v22;
  id v26 = v18;
  id v27 = v21;
  [v27 notifyOnQueue:v23 block:v31];
}

- (BOOL)isAlreadyWaitingOnLimitTimer
{
  v3 = dispatch_get_current_queue();
  id v4 = [(GKContactsIntegrationController *)self serialQueue];

  if (v3 != v4)
  {
    label = dispatch_queue_get_label(v3);
    id v6 = [(GKContactsIntegrationController *)self serialQueue];
    v7 = dispatch_queue_get_label(v6);
    id v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKContactsIntegrationController isAlreadyWaitingOnLimitTimer]", label, v7, v8);
    BOOL v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v9, "-[GKContactsIntegrationController isAlreadyWaitingOnLimitTimer]", [v11 UTF8String], 821);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  id v13 = [(GKContactsIntegrationController *)self idsCacheUpdateTimer];
  BOOL v14 = v13 != 0;

  return v14;
}

- (void)getRelationshipsForContacts:(id)a3 updateExistingContactEntries:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  id v11 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100131A2C(a4, v11);
  }
  id v12 = [(GKContactsIntegrationController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012B4AC;
  block[3] = &unk_1002DBFE8;
  id v17 = v9;
  uint64_t v18 = 8;
  block[4] = self;
  id v16 = v8;
  BOOL v19 = a4;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v12, block);
}

- (id)relationshipForMeContact
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100131AA8();
  }
  id v4 = [(GKContactsIntegrationController *)self playerProvider];
  id v5 = [v4 localPlayerCacheGroup];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1001281A8;
  id v24 = sub_1001281B8;
  id v25 = 0;
  id v6 = [v5 context];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10012BB90;
  id v17 = &unk_1002D4D08;
  id v7 = v5;
  id v18 = v7;
  BOOL v19 = &v20;
  [v6 performBlockAndWait:&v14];

  if (v21[5])
  {
    id v8 = [(GKContactsIntegrationController *)self playerProvider];
    id v9 = [v8 localPlayer];
    id v10 = [v9 accountName];

    id v11 = objc_opt_new();
    [v11 setRelationship:2];
    [v11 setRelatedPlayer:v21[5]];
    if ([v10 length]) {
      id v12 = v10;
    }
    else {
      id v12 = 0;
    }
    [v11 setHandle:v12];
  }
  else
  {
    id v11 = 0;
  }

  _Block_object_dispose(&v20, 8);

  return v11;
}

- (void)relationshipsForContacts:(id)a3 updateExistingContactEntries:(BOOL)a4 allowingIneligibility:(unint64_t)a5 usingSettings:(id)a6 meContactID:(id)a7 completionHandler:(id)a8
{
  id v40 = a3;
  id v14 = a6;
  id v15 = a7;
  id v39 = a8;
  id v16 = dispatch_get_current_queue();
  id v17 = [(GKContactsIntegrationController *)self serialQueue];

  if (v16 != v17)
  {
    id v38 = v15;
    unint64_t v37 = a5;
    label = dispatch_queue_get_label(v16);
    BOOL v19 = [(GKContactsIntegrationController *)self serialQueue];
    uint64_t v20 = dispatch_queue_get_label(v19);
    id v21 = +[NSThread callStackSymbols];
    uint64_t v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKContactsIntegrationController relationshipsForContacts:updateExistingContactEntries:allowingIneligibility:usingSettings:meContactID:completionHandler:]", label, v20, v21);
    id v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"];
    id v24 = [v23 lastPathComponent];
    id v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v22, "-[GKContactsIntegrationController relationshipsForContacts:updateExistingContactEntries:allowingIneligibility:usingSettings:meContactID:completionHandler:]", [v24 UTF8String], 920);

    id v15 = v38;
    a5 = v37;

    +[NSException raise:@"GameKit Exception", @"%@", v25 format];
  }

  unsigned __int8 v26 = [(GKContactsIntegrationController *)self isAlreadyWaitingOnLimitTimer];
  id v27 = [(GKContactsIntegrationController *)self playerProvider];
  uint64_t v28 = [v27 localPlayerCacheGroup];

  if (!os_log_GKGeneral) {
    id v29 = (id)GKOSLoggers();
  }
  id v30 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100131ADC(a4, v30);
  }
  id v31 = [v28 context];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10012BF60;
  v41[3] = &unk_1002DC038;
  v41[4] = self;
  id v42 = v40;
  BOOL v48 = a4;
  id v43 = v15;
  id v44 = v28;
  unsigned __int8 v49 = v26;
  id v45 = v14;
  id v46 = v39;
  unint64_t v47 = a5;
  id v32 = v39;
  id v33 = v14;
  id v34 = v28;
  id v35 = v15;
  id v36 = v40;
  [v31 performBlock:v41];
}

- (void)playerAuthenticated:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100131D58();
  }
  id v6 = [(GKContactsIntegrationController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012C628;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)contactsChanged:(id)a3
{
  id v4 = [(GKContactsIntegrationController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012C6C0;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)reachabilityChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(GKContactsIntegrationController *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012C980;
  v7[3] = &unk_1002D3B38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleReachabilityChanged
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100131DF4();
  }
  id v4 = [(GKContactsIntegrationController *)self playerProvider];
  id v5 = [v4 localPlayerCacheGroup];

  id v6 = [v5 context];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012CCE0;
  v8[3] = &unk_1002D40E0;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlock:v8];
}

- (void)storeBagUpdated:(id)a3
{
  id v4 = [a3 object];
  if (v4)
  {
    id v5 = +[GKContactsIntegrationControllerSettings allBagKeys];
    id v6 = [(GKContactsIntegrationController *)self serialQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10012CF7C;
    v8[3] = &unk_1002DC0A8;
    void v8[4] = self;
    [v4 getValuesForKeys:v5 queue:v6 completion:v8];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100131E94();
    }
  }
}

- (BOOL)canSyncWithIDS
{
  id v3 = dispatch_get_current_queue();
  id v4 = [(GKContactsIntegrationController *)self serialQueue];

  if (v3 != v4)
  {
    label = dispatch_queue_get_label(v3);
    id v6 = [(GKContactsIntegrationController *)self serialQueue];
    id v7 = dispatch_queue_get_label(v6);
    id v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKContactsIntegrationController canSyncWithIDS]", label, v7, v8);
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v9, "-[GKContactsIntegrationController canSyncWithIDS]", [v11 UTF8String], 1120);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  id v13 = [(GKContactsIntegrationController *)self idsUpdateGroup];

  if (v13)
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    BOOL v15 = os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      sub_100131FD0();
LABEL_13:
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    id v16 = [(GKContactsIntegrationController *)self idsCacheUpdateTimer];

    if (!v16)
    {
      LOBYTE(v15) = 1;
      return v15;
    }
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    BOOL v15 = os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      sub_100131F9C();
      goto LABEL_13;
    }
  }
  return v15;
}

- (void)startIDSSyncWithCompletion:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100132004();
  }
  id v6 = [(GKContactsIntegrationController *)self serialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012D48C;
  v8[3] = &unk_1002D3C38;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)stop
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100132038();
  }
  id v4 = [(GKContactsIntegrationController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012DB34;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)setupIDSCacheUpdateTimerWithStartTime:(double)a3
{
  id v5 = dispatch_get_current_queue();
  id v6 = [(GKContactsIntegrationController *)self serialQueue];

  if (v5 != v6)
  {
    label = dispatch_queue_get_label(v5);
    id v8 = [(GKContactsIntegrationController *)self serialQueue];
    id v9 = dispatch_queue_get_label(v8);
    id v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKContactsIntegrationController setupIDSCacheUpdateTimerWithStartTime:]", label, v9, v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v11, "-[GKContactsIntegrationController setupIDSCacheUpdateTimerWithStartTime:]", [v13 UTF8String], 1184);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  id v16 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_10013206C(v16, a3, v17, v18);
  }
  BOOL v19 = [(GKContactsIntegrationController *)self idsCacheUpdateTimer];
  [v19 cancel];

  uint64_t v20 = objc_alloc_init(GKContactsIntegrationTimer);
  [(GKContactsIntegrationController *)self setIdsCacheUpdateTimer:v20];

  objc_initWeak(&location, self);
  id v21 = [(GKContactsIntegrationController *)self idsCacheUpdateTimer];
  dispatch_time_t v22 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
  id v23 = [(GKContactsIntegrationController *)self serialQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10012DE2C;
  v24[3] = &unk_1002DB120;
  objc_copyWeak(&v25, &location);
  v24[4] = self;
  [v21 startWithStartTime:v22 updateInterval:v23 queue:v24 updateBlock:&stru_1002DC118 cancelBlock:1.84467441e19];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)stopCacheUpdates
{
  id v3 = dispatch_get_current_queue();
  id v4 = [(GKContactsIntegrationController *)self serialQueue];

  if (v3 != v4)
  {
    label = dispatch_queue_get_label(v3);
    id v6 = [(GKContactsIntegrationController *)self serialQueue];
    id v7 = dispatch_queue_get_label(v6);
    id v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKContactsIntegrationController stopCacheUpdates]", label, v7, v8);
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v9, "-[GKContactsIntegrationController stopCacheUpdates]", [v11 UTF8String], 1225);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  id v13 = [(GKContactsIntegrationController *)self idsCacheUpdateTimer];
  [v13 cancel];

  [(GKContactsIntegrationController *)self setIdsCacheUpdateTimer:0];
  id v14 = [(GKContactsIntegrationController *)self idsBatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012E378;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_async(v14, block);
}

- (void)clearCachesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(GKContactsIntegrationController *)self playerProvider];
  id v6 = [v5 localPlayerCacheGroup];

  id v7 = [(GKContactsIntegrationController *)self serialQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10012E520;
  v12[3] = &unk_1002D4050;
  v12[4] = self;
  [v6 performOnQueue:v7 block:v12];

  [v6 performOnManagedObjectContext:&stru_1002DC138];
  id v8 = [(GKContactsIntegrationController *)self serialQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012E618;
  v10[3] = &unk_1002D3A20;
  id v11 = v4;
  id v9 = v4;
  [v6 notifyOnQueue:v8 block:v10];
}

- (id)contactAssociationIDMapForHandles:(id)a3 withContext:(id)a4
{
  id v4 = +[GKCDIDSInfo _gkObjectsMatchingHandles:a3 withContext:a4];
  id v5 = [v4 _gkMapDictionaryWithKeyPath:@"handle" valueKeyPath:@"contactAssociationID"];

  return v5;
}

- (id)contactAssociationIDMapForContactAssociationIDs:(id)a3 withContext:(id)a4
{
  id v4 = +[GKCDIDSInfo _gkObjectsMatchingContactAssociationIDs:a3 withContext:a4];
  id v5 = [v4 _gkMapDictionaryWithKeyPath:@"handle" valueKeyPath:@"contactAssociationID"];

  return v5;
}

- (id)handleMapForContactAssociationIDs:(id)a3 withContext:(id)a4
{
  id v4 = +[GKCDIDSInfo _gkObjectsMatchingContactAssociationIDs:a3 withContext:a4];
  id v5 = [v4 _gkMapDictionaryWithKeyPath:@"contactAssociationID" valueKeyPath:@"handle"];

  return v5;
}

- (id)relationshipsForHandles:(id)a3 contactAssociationIDMap:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v28 = a5;
  if ([v7 count])
  {
    if (![v8 count])
    {
      if (!os_log_GKGeneral) {
        id v9 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_100132148();
      }
    }
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v8 count]];
    id v11 = [v8 allValues];
    uint64_t v12 = +[NSSet setWithArray:v11];

    id v25 = (void *)v12;
    id v13 = [(GKContactsIntegrationController *)self createFriendAssociationIDMapWithIDs:v12 withContext:v28];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v7;
    id v14 = v7;
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v20 = [v8 objectForKeyedSubscript:v19];
          if (v20)
          {
            id v21 = [(GKContactsIntegrationController *)self createRelationshipWithHandle:v19 contactAssociationID:v20 usingFriendMap:v13 withContext:v28];
          }
          else
          {
            id v21 = objc_opt_new();
            dispatch_time_t v22 = [v19 _stripFZIDPrefix];
            [v21 setHandle:v22];

            [v21 setRelationship:0];
          }
          [v10 addObject:v21];
        }
        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }

    id v23 = [v10 copy];
    id v7 = v26;
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)createRelationshipWithHandle:(id)a3 contactAssociationID:(id)a4 usingFriendMap:(id)a5 withContext:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_opt_new();
  uint64_t v12 = [v10 _stripFZIDPrefix];

  [v11 setHandle:v12];
  if ([v8 length])
  {
    id v13 = [v9 objectForKeyedSubscript:v8];
    if (v13)
    {
      id v14 = [objc_alloc((Class)GKPlayerInternal) initWithCacheObject:v13];
      [v11 setRelatedPlayer:v14];

      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v15 = 1;
    }
    [v11 setRelationship:v15];
  }
  else
  {
    [v11 setRelationship:0];
  }

  return v11;
}

- (id)createFriendAssociationIDMapWithIDs:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = +[NSPredicate predicateWithFormat:@"playerID != nil && friendBiDirectional == YES && contactAssociationID != nil && contactAssociationID IN %@", v5];
    id v8 = +[GKFriendListEntryCacheObject _gkObjectsMatchingPredicate:v7 withContext:v6];
    if ([v8 count])
    {
      id v9 = [v8 _gkDistinctValuesForKeyPath:@"playerID"];
      id v10 = +[NSPredicate predicateWithFormat:@"playerID != nil && playerID IN %@", v9];
      id v11 = +[GKPlayerProfileCacheObject _gkObjectsMatchingPredicate:v10 withContext:v6];
      if ([v11 count])
      {
        id v28 = v10;
        long long v29 = v9;
        long long v31 = v7;
        id v32 = v6;
        uint64_t v12 = [v11 _gkMapDictionaryWithKeyPath:@"playerID"];
        id v27 = v11;
        id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v11 count]];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v30 = v8;
        id v14 = v8;
        id v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v34;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v14);
              }
              BOOL v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v20 = [v19 playerID];
              id v21 = [v12 objectForKeyedSubscript:v20];

              dispatch_time_t v22 = [v19 contactAssociationID];
              [v13 setObject:v21 forKeyedSubscript:v22];
            }
            id v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v16);
        }

        id v23 = [v13 copy];
        id v7 = v31;
        id v6 = v32;
        id v9 = v29;
        id v8 = v30;
        id v11 = v27;
        id v10 = v28;
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v25 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_1001321B0();
        }
        id v23 = 0;
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v24 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_10013217C();
      }
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (void)populateContactInfoForProfiles:(id)a3 replyOnQueue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GKContactsIntegrationController *)self playerProvider];
  uint64_t v12 = [v11 localPlayerCacheGroup];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10012EF78;
  v16[3] = &unk_1002D5E50;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 performOnManagedObjectContext:v16];
}

- (void)populateContactInfoForProfiles:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKContactsIntegrationController *)self settings];
  unsigned __int8 v9 = [(GKContactsIntegrationController *)self isEligibleAllowingIneligibility:0 usingSettings:v8 withContext:v7];

  if (v9)
  {
    if ([v6 count])
    {
      if ([v6 count] == (id)1
        && ([v6 firstObject],
            id v10 = objc_claimAutoreleasedReturnValue(),
            unsigned int v11 = [v10 isLocalPlayer],
            v10,
            v11))
      {
        if (!os_log_GKGeneral) {
          id v12 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
          sub_100132218();
        }
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v14 = (id)GKOSLoggers();
        }
        id v15 = (void *)os_log_GKContacts;
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
          sub_10013224C(v15);
        }
        id v28 = [v6 _gkDistinctValuesForKeyPath:@"playerID"];
        id v27 = +[NSPredicate predicateWithFormat:@"friendBiDirectional == YES && playerID != nil && playerID IN %@", v28];
        id v16 = +[GKFriendListEntryCacheObject _gkObjectsMatchingPredicate:withContext:](GKFriendListEntryCacheObject, "_gkObjectsMatchingPredicate:withContext:");
        id v17 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v16 count]);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v18 = v16;
        id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v30;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v30 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              id v24 = [v23 contactAssociationID];
              if ([v24 length])
              {
                id v25 = [v23 playerID];
                [v17 setObject:v24 forKeyedSubscript:v25];
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v20);
        }

        [(GKContactsIntegrationController *)self populateContactInfoForProfiles:v6 playerIdToContactAssociationIdMap:v17 withContext:v7];
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v26 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_1001321E4();
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1001322F0();
    }
  }
}

- (void)populateContactInfoForProfiles:(id)a3 playerIdToContactAssociationIdMap:(id)a4 withContext:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc((Class)NSSet);
  id v39 = v8;
  unsigned int v11 = [v8 allValues];
  id v12 = [v10 initWithArray:v11];

  long long v36 = v12;
  id v13 = [(GKContactsIntegrationController *)self contactAssociationIDMapForContactAssociationIDs:v12 withContext:v9];
  id v14 = [v13 allKeys];
  unint64_t v37 = v9;
  id v15 = [(GKContactsIntegrationController *)self contactInfosForHandles:v14 withContext:v9];

  id v16 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v15, "count")];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v15;
  id v17 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v47;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        dispatch_time_t v22 = [v21 handle];
        id v23 = [v13 objectForKeyedSubscript:v22];
        if ([v23 length])
        {
          id v24 = [v16 objectForKeyedSubscript:v23];

          if (!v24) {
            [v16 setObject:v21 forKeyedSubscript:v23];
          }
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v18);
  }

  id v25 = [(GKContactsIntegrationController *)self metricsHandler];
  [v25 recordContactInfoMatchCount:[v16 count]];

  id v26 = v39;
  if ([v16 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v40 = v38;
    id v27 = [v40 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v40);
          }
          long long v31 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
          long long v32 = [v31 playerID];
          long long v33 = [v26 objectForKeyedSubscript:v32];
          if ([v33 length])
          {
            long long v34 = [v16 objectForKeyedSubscript:v33];
            if (v34)
            {
              long long v35 = +[CNContact _gkContactFromCacheObject:v34];
              [v31 setContact:v35];

              id v26 = v39;
            }
          }
        }
        id v28 = [v40 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v28);
    }
  }
}

- (id)getContactsForContactAssociationIDs:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = [(GKContactsIntegrationController *)self contactAssociationIDMapForContactAssociationIDs:a3 withContext:v6];
  id v8 = [v7 allKeys];
  dispatch_time_t v22 = v6;
  id v9 = [(GKContactsIntegrationController *)self contactInfosForHandles:v8 withContext:v6];

  id v10 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v9 count]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v17 = [v16 handle];
        id v18 = [v7 objectForKeyedSubscript:v17];

        uint64_t v19 = +[CNContact _gkContactFromCacheObject:v16];
        [v10 setObject:v19 forKeyedSubscript:v18];
      }
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  id v20 = [v10 copy];

  return v20;
}

- (id)contactInfosForHandles:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKCDContactInfo _gkFetchRequest];
  id v8 = +[NSPredicate predicateWithFormat:@"handle IN %@", v6];

  [v7 setPredicate:v8];
  id v9 = +[NSSortDescriptor sortDescriptorWithKey:@"givenName" ascending:1];
  id v13 = v9;
  id v10 = +[NSArray arrayWithObjects:&v13 count:1];
  [v7 setSortDescriptors:v10];

  id v11 = +[GKCDContactInfo _gkObjectsFromFetchRequest:v7 withContext:v5];

  return v11;
}

- (id)filterForContactIDsSupportingFriendingViaPushFromContactIDs:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKContactsIntegrationController *)self settings];
  LOBYTE(self) = [(GKContactsIntegrationController *)self isEligibleAllowingIneligibility:8 usingSettings:v8 withContext:v7];

  if (self)
  {
    id v9 = +[GKCDContactInfo _gkFetchRequest];
    if ([v6 count])
    {
      id v10 = +[NSPredicate predicateWithFormat:@"contactID IN %@", v6];
      [v9 setPredicate:v10];
    }
    else
    {
      [v9 setPredicate:0];
    }
    id v13 = +[GKCDContactInfo _gkObjectsFromFetchRequest:v9 withContext:v7];
    uint64_t v14 = [v13 _gkMapDictionaryWithKeyPath:@"handle" valueKeyPath:@"contactID"];
    if ([v14 count])
    {
      long long v32 = v13;
      long long v33 = v9;
      id v34 = v6;
      id v15 = [v14 allKeys];
      uint64_t v16 = +[NSPredicate predicateWithFormat:@"handle IN %@", v15];

      long long v31 = (void *)v16;
      id v17 = +[GKCDIDSInfo _gkObjectsMatchingPredicate:v16 withContext:v7];
      id v18 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v17 count]);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v19 = v17;
      id v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v36;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            long long v25 = [v24 supportsFriendingViaPush];
            unsigned int v26 = [v25 BOOLValue];

            if (v26)
            {
              id v27 = [v24 handle];
              id v28 = [v14 objectForKeyedSubscript:v27];

              if ([v28 length]) {
                [v18 addObject:v28];
              }
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v21);
      }

      id v12 = [v18 copy];
      id v9 = v33;
      id v6 = v34;
      id v13 = v32;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v29 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_100132324();
      }
      id v12 = 0;
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100132358();
    }
    id v12 = 0;
  }

  return v12;
}

- (void)connectionManagerReady:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_10013238C();
  }
  id v6 = [(GKContactsIntegrationController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012FEC4;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)updateIDSEntriesFromOldFriendEntries:(id)a3 againstServerRepresentation:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    long long v35 = v9;
    id v37 = v7;
    id v39 = [v7 _gkMapDictionaryWithKeyPath:@"playerID"];
    long long v38 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v8 count]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v36 = v8;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v42;
      uint64_t v14 = GKPlayerIDKey;
      uint64_t v15 = GKContactsAssociationIDKey;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v10);
          }
          id v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v18 = [v17 objectForKeyedSubscript:v14];
          id v19 = [v17 objectForKeyedSubscript:v15];
          id v20 = [v39 objectForKeyedSubscript:v18];
          id v21 = v20;
          if (v20)
          {
            uint64_t v22 = [v20 contactAssociationID];
            if ([v22 length] && !objc_msgSend(v19, "length")) {
              [v38 addObject:v22];
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v12);
    }

    if ([v38 count])
    {
      id v9 = v35;
      if (!os_log_GKGeneral) {
        id v23 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_100132500();
      }
      id v24 = [objc_alloc((Class)NSBatchUpdateRequest) initWithEntityName:@"IDSInfo"];
      long long v25 = +[NSPredicate predicateWithFormat:@"contactAssociationID != nil && contactAssociationID in %@", v38];
      [v24 setPredicate:v25];

      v45[0] = @"contactAssociationID";
      unsigned int v26 = +[NSExpression expressionForConstantValue:0];
      v46[0] = v26;
      v46[1] = &off_1002F2390;
      v45[1] = @"cohort";
      v45[2] = @"timeStamp";
      id v27 = +[NSDate date];
      v46[2] = v27;
      id v28 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
      [v24 setPropertiesToUpdate:v28];

      id v40 = 0;
      id v29 = [v35 executeRequest:v24 error:&v40];
      id v30 = v40;
      id v8 = v36;
      id v7 = v37;
      if (v30)
      {
        if (!os_log_GKGeneral) {
          id v31 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_1001324CC();
        }
        if (!os_log_GKGeneral) {
          id v32 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
          sub_100132460();
        }
      }
    }
    else
    {
      id v8 = v36;
      id v7 = v37;
      if (!os_log_GKGeneral) {
        id v34 = (id)GKOSLoggers();
      }
      id v9 = v35;
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
        sub_10013242C();
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v33 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1001323F8();
    }
  }
}

- (id)expirationPredicateForCohort:(int)a3 matchingHandles:(id)a4 usingSettings:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  [a5 expirationTimeForCohort:v6];
  double v9 = v8;
  id v10 = +[NSDate date];
  id v11 = [v10 dateByAddingTimeInterval:-v9];

  if ([v7 count]) {
    +[NSPredicate predicateWithFormat:@"handle IN %@ AND cohort == %ld AND timeStamp < %@", v7, (int)v6, v11];
  }
  else {
  id v12 = +[NSPredicate predicateWithFormat:@"cohort == %ld AND timeStamp < %@", (int)v6, v11, v14];
  }

  return v12;
}

- (id)expiredIDSEntriesWithFetchLimit:(int64_t)a3 matchingHandles:(id)a4 usingSettings:(id)a5 withContext:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  uint64_t v13 = +[GKCDIDSInfo _gkFetchRequest];
  if ([v10 count]) {
    +[NSPredicate predicateWithFormat:@"handle IN %@ AND cohort == %ld", v10, -1];
  }
  else {
  uint64_t v14 = +[NSPredicate predicateWithFormat:@"cohort == %ld", -1, v26];
  }
  [v13 setPredicate:v14];

  [v13 setFetchLimit:a3];
  uint64_t v15 = +[GKCDIDSInfo _gkObjectsFromFetchRequest:v13 withContext:v11];
  +[GKCDIDSInfo _gkFetchRequest];
  int64_t v27 = a3;
  uint64_t v16 = v28 = v11;
  id v17 = [(GKContactsIntegrationController *)self expirationPredicateForCohort:0 matchingHandles:v10 usingSettings:v12];
  v29[0] = v17;
  id v18 = [(GKContactsIntegrationController *)self expirationPredicateForCohort:1 matchingHandles:v10 usingSettings:v12];
  v29[1] = v18;
  id v19 = [(GKContactsIntegrationController *)self expirationPredicateForCohort:2 matchingHandles:v10 usingSettings:v12];
  v29[2] = v19;
  id v20 = [(GKContactsIntegrationController *)self expirationPredicateForCohort:3 matchingHandles:v10 usingSettings:v12];

  v29[3] = v20;
  id v21 = +[NSArray arrayWithObjects:v29 count:4];
  uint64_t v22 = +[NSCompoundPredicate orPredicateWithSubpredicates:v21];
  [v16 setPredicate:v22];

  [v16 setFetchLimit:v27 - [v15 count]];
  id v23 = +[GKCDIDSInfo _gkObjectsFromFetchRequest:v16 withContext:v28];

  id v24 = [v15 arrayByAddingObjectsFromArray:v23];

  return v24;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (GKContactsIntegrationControllerSettings)settings
{
  return (GKContactsIntegrationControllerSettings *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSettings:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)idsBatchQueue
{
  return self->_idsBatchQueue;
}

- (void)setIdsBatchQueue:(id)a3
{
}

- (OS_dispatch_queue)contactsBatchQueue
{
  return self->_contactsBatchQueue;
}

- (void)setContactsBatchQueue:(id)a3
{
}

- (GKContactsIntegrationTimer)idsCacheUpdateTimer
{
  return self->_idsCacheUpdateTimer;
}

- (void)setIdsCacheUpdateTimer:(id)a3
{
}

- (GKContactsIntegrationTimer)idsFetchDelayTimer
{
  return self->_idsFetchDelayTimer;
}

- (void)setIdsFetchDelayTimer:(id)a3
{
}

- (GKPlayerInternalProvider)playerProvider
{
  return self->_playerProvider;
}

- (void)setPlayerProvider:(id)a3
{
}

- (GKContactsIntegrationEligibilityChecker)eligibilityChecker
{
  return self->_eligibilityChecker;
}

- (void)setEligibilityChecker:(id)a3
{
}

- (GKIDSConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (GKContactsIntegrationMetricsHandler)metricsHandler
{
  return self->_metricsHandler;
}

- (void)setMetricsHandler:(id)a3
{
}

- (GKDispatchGroup)contactsUpdateGroup
{
  return self->_contactsUpdateGroup;
}

- (void)setContactsUpdateGroup:(id)a3
{
}

- (GKDispatchGroup)idsUpdateGroup
{
  return self->_idsUpdateGroup;
}

- (void)setIdsUpdateGroup:(id)a3
{
}

- (GKContactsIntegrationMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
}

- (GKContactsIntegrationTimer)contactsChangedCoalescingTimer
{
  return self->_contactsChangedCoalescingTimer;
}

- (void)setContactsChangedCoalescingTimer:(id)a3
{
}

- (GKContactsIntegrationTimer)reachabilityChangedCoalescingTimer
{
  return self->_reachabilityChangedCoalescingTimer;
}

- (void)setReachabilityChangedCoalescingTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityChangedCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_contactsChangedCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_idsUpdateGroup, 0);
  objc_storeStrong((id *)&self->_contactsUpdateGroup, 0);
  objc_storeStrong((id *)&self->_metricsHandler, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_playerProvider, 0);
  objc_storeStrong((id *)&self->_idsFetchDelayTimer, 0);
  objc_storeStrong((id *)&self->_idsCacheUpdateTimer, 0);
  objc_storeStrong((id *)&self->_contactsBatchQueue, 0);
  objc_storeStrong((id *)&self->_idsBatchQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)fetchMessageTransportV2AvailabilityForUnprefixedHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[NSMutableSet set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v37;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
      if (![v13 length]) {
        break;
      }
      uint64_t v14 = +[IDSURI URIWithUnprefixedURI:v13];
      uint64_t v15 = [v14 prefixedURI];

      if (!v15) {
        break;
      }
      [v8 addObject:v15];

      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKContactsIntegrationController.m", 1697, "-[GKContactsIntegrationController(Multiplayer) fetchMessageTransportV2AvailabilityForUnprefixedHandles:completion:]");
  id v17 = +[GKDispatchGroup dispatchGroupWithName:v16];

  id v18 = [v9 count];
  if (v18 == [v8 count] && objc_msgSend(v8, "count"))
  {
    [v17 enter];
    objc_initWeak(&location, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100130E14;
    v31[3] = &unk_1002DC160;
    id v32 = v8;
    id v19 = v17;
    id v33 = v19;
    objc_copyWeak(&v34, &location);
    [(GKContactsIntegrationController *)self syncIDSDataForHandles:v32 forcefully:0 completion:v31];
    if ([v19 waitWithTimeout:60.0])
    {
      if (!os_log_GKGeneral) {
        id v20 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        sub_1001326DC();
      }
      id v21 = +[NSError errorWithDomain:GKContactsIntegrationErrorDomain code:9 userInfo:&off_1002F2D90];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v21);
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v25 = (id)GKOSLoggers();
      }
      uint64_t v26 = os_log_GKMatch;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        int64_t v27 = [v19 objectForKeyedSubscript:@"availablePlayerHandles"];
        id v28 = [v19 objectForKeyedSubscript:@"unavailablePlayerHandles"];
        sub_10013266C(v27, v28, buf, v26);
      }

      id v29 = [v19 error];

      if (v29)
      {
        id v21 = [v19 error];
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v21);
      }
      else
      {
        id v21 = [v19 objectForKeyedSubscript:@"availablePlayerHandles"];
        id v30 = [v19 objectForKeyedSubscript:@"unavailablePlayerHandles"];
        (*((void (**)(id, void *, void *, void))v7 + 2))(v7, v21, v30, 0);
      }
    }

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers();
    }
    id v23 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_10013256C(v23, v9, v8);
    }
    id v24 = +[NSError errorWithDomain:GKContactsIntegrationErrorDomain code:10 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v24);
  }
}

@end