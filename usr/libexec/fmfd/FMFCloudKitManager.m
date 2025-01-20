@interface FMFCloudKitManager
+ (BOOL)isIdentityLossError:(id)a3;
+ (BOOL)sendShareURL:(id)a3 andInvitationToken:(id)a4 recordName:(id)a5 toDestinationID:(id)a6 error:(id *)a7;
+ (id)lookupInfosForHandles:(id)a3;
+ (id)shareInvitationTokenFromString:(id)a3 error:(id *)a4;
+ (id)sharedInstance;
+ (id)stringFromShareInvitationToken:(id)a3 error:(id *)a4;
- (BOOL)boostrapScheduled;
- (BOOL)isAccountBootstrapped;
- (CKContainer)container;
- (FMFCloudKitCache)cache;
- (FMFCloudKitManager)init;
- (NSString)cloudKitPushTopic;
- (OS_dispatch_queue)retryOperationQueue;
- (double)bootstrapRetryInterval;
- (double)maxBootstrapInterval;
- (id)createDatabaseSubscriptionOperationWithSubscriptionId:(id)a3 database:(id)a4;
- (id)fetchChangeConfigurationsForZonesWithIDs:(id)a3 inScope:(int64_t)a4;
- (id)recordWithID:(id)a3 inScope:(int64_t)a4;
- (id)stringFromBootstrapReason:(int64_t)a3;
- (void)acceptCKShareWithURL:(id)a3 invitationToken:(id)a4 completion:(id)a5;
- (void)acceptCKShareWithURLString:(id)a3 invitationTokenBase64String:(id)a4;
- (void)bootstrap;
- (void)bootstrapAccountWithReason:(int64_t)a3;
- (void)createIDForRecordWithName:(id)a3 inZoneWithName:(id)a4 withCompletion:(id)a5;
- (void)deleteRecordWithRecordID:(id)a3 inDatabaseWithScope:(int64_t)a4 withCompletion:(id)a5;
- (void)deleteRecordZonesWithID:(id)a3 fromDatabase:(id)a4 withCompletion:(id)a5;
- (void)deleteZoneWithID:(id)a3 inDatabase:(id)a4 withCompletion:(id)a5;
- (void)fetchChangedRecordZonesWithID:(id)a3 andDeleteRecordZonesWithID:(id)a4 fromDatabase:(id)a5 withCompletion:(id)a6;
- (void)fetchChangedRecordZonesWithID:(id)a3 fromDatabase:(id)a4 withCompletion:(id)a5;
- (void)fetchChangesFromDatabase:(id)a3 withCompletion:(id)a4;
- (void)fetchChangesWithCompletion:(id)a3;
- (void)fetchShareParticipantsForHandles:(id)a3 withCompletion:(id)a4;
- (void)handleAccountChangedNotification;
- (void)handleReceiveCKShareWithURLString:(id)a3 invitationTokenBase64String:(id)a4;
- (void)processCKError:(id)a3;
- (void)removeAllFenceRecordZonesWithCompletion:(id)a3;
- (void)removeAllFenceRecordsZonesInDatabase:(id)a3 withCompletion:(id)a4;
- (void)retryAcceptShareWithURLString:(id)a3 invitationToken:(id)a4 forError:(id)a5 retryCount:(int64_t)a6;
- (void)retryInviteUnacceptedCKShares;
- (void)setBoostrapScheduled:(BOOL)a3;
- (void)setBootstrapRetryInterval:(double)a3;
- (void)setMaxBootstrapInterval:(double)a3;
- (void)setRetryOperationQueue:(id)a3;
- (void)subscribeToChangesInDatabase:(id)a3;
- (void)updateRecord:(id)a3 andShare:(id)a4 inDatabase:(id)a5 withCompletion:(id)a6;
- (void)updateRecord:(id)a3 inZoneSharedWith:(id)a4 inDatabaseWithScope:(int64_t)a5 withCompletion:(id)a6;
- (void)updateZoneWithID:(id)a3 inDatabase:(id)a4 withCompletion:(id)a5;
- (void)updateZoneWithID:(id)a3 withShareRecipients:(id)a4 inDatabase:(id)a5 withCompletion:(id)a6;
@end

@implementation FMFCloudKitManager

+ (id)sharedInstance
{
  if (qword_1000BB6B8 != -1) {
    dispatch_once(&qword_1000BB6B8, &stru_1000A1598);
  }
  v2 = (void *)qword_1000BB6B0;

  return v2;
}

- (FMFCloudKitManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)FMFCloudKitManager;
  v2 = [(FMFCloudKitManager *)&v13 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [v3 setUseZoneWidePCS:1];
    id v4 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:@"com.apple.findmy.container" environment:1];
    id v5 = [objc_alloc((Class)CKContainer) initWithContainerID:v4 options:v3];
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.fmfd.cloudkitManager.retryOperationQueue", 0);
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"handleAccountChangedNotification" name:CKAccountChangedNotification object:0];

    v10 = objc_alloc_init(FMFCloudKitCache);
    v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;

    v2[8] = 0;
    *(_OWORD *)(v2 + 40) = xmmword_10007E7D0;
    if (([v2 isAccountBootstrapped] & 1) == 0) {
      [v2 bootstrapAccountWithReason:0];
    }
    [v2 retryInviteUnacceptedCKShares];
  }
  return (FMFCloudKitManager *)v2;
}

- (BOOL)isAccountBootstrapped
{
  id v3 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"Fence-DUMMY-BOOT-STRAP" ownerName:CKCurrentUserDefaultName];
  id v4 = [(FMFCloudKitManager *)self cache];
  id v5 = [v4 serverChangeTokenForZoneWithID:v3 inDatabaseWithScope:2];

  if (v5)
  {
    v6 = sub_100005560();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[FMFCloudKitManager isAccountBootstrapped]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: no-op, bootstrap zone already exists in privateCloudDatabase", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5 != 0;
}

- (void)bootstrapAccountWithReason:(int64_t)a3
{
  if (![(FMFCloudKitManager *)self boostrapScheduled])
  {
    [(FMFCloudKitManager *)self bootstrapRetryInterval];
    [(FMFCloudKitManager *)self setBootstrapRetryInterval:v5 + v5];
    [(FMFCloudKitManager *)self bootstrapRetryInterval];
    double v7 = v6;
    [(FMFCloudKitManager *)self maxBootstrapInterval];
    if (v7 >= v8)
    {
      [(FMFCloudKitManager *)self setBoostrapScheduled:0];
      objc_super v13 = sub_100005560();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [(FMFCloudKitManager *)self bootstrapRetryInterval];
        *(_DWORD *)buf = 136315394;
        v17 = "-[FMFCloudKitManager bootstrapAccountWithReason:]";
        __int16 v18 = 2048;
        uint64_t v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Not retrying bootstrapping after: %f", buf, 0x16u);
      }
    }
    else
    {
      [(FMFCloudKitManager *)self setBoostrapScheduled:1];
      v9 = sub_100005560();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        [(FMFCloudKitManager *)self bootstrapRetryInterval];
        *(_DWORD *)buf = 136315394;
        v17 = "-[FMFCloudKitManager bootstrapAccountWithReason:]";
        __int16 v18 = 2048;
        uint64_t v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Retry bootstrap after: %f", buf, 0x16u);
      }

      [(FMFCloudKitManager *)self bootstrapRetryInterval];
      dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000B380;
      v15[3] = &unk_1000A15C0;
      v15[4] = self;
      v15[5] = a3;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v15);
    }
  }
}

- (void)bootstrap
{
  id v3 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"Fence-DUMMY-BOOT-STRAP" ownerName:CKCurrentUserDefaultName];
  id v4 = +[NSNotificationCenter defaultCenter];
  objc_initWeak(&location, v4);
  double v5 = off_1000BAFD8;
  double v6 = +[NSOperationQueue mainQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000B744;
  v19[3] = &unk_1000A15E8;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  id v7 = [v4 addObserverForName:v5 object:0 queue:v6 usingBlock:v19];

  double v8 = +[NSOperationQueue mainQueue];
  uint64_t v9 = CKIdentityUpdateNotification;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000B86C;
  v17[3] = &unk_1000A15E8;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  id v10 = [v4 addObserverForName:v9 object:0 queue:v8 usingBlock:v17];

  double v11 = [(FMFCloudKitManager *)self container];
  dispatch_time_t v12 = [v11 privateCloudDatabase];
  [(FMFCloudKitManager *)self subscribeToChangesInDatabase:v12];

  objc_super v13 = [(FMFCloudKitManager *)self container];
  uint64_t v14 = [v13 privateCloudDatabase];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000B958;
  v15[3] = &unk_1000A1678;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  [(FMFCloudKitManager *)self updateZoneWithID:v3 inDatabase:v14 withCompletion:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)handleAccountChangedNotification
{
  if (![(FMFCloudKitManager *)self isAccountBootstrapped])
  {
    [(FMFCloudKitManager *)self bootstrapAccountWithReason:1];
  }
}

- (void)createIDForRecordWithName:(id)a3 inZoneWithName:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(FMFCloudKitManager *)self container];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000BE84;
  v15[3] = &unk_1000A16A0;
  id v17 = v8;
  id v18 = v10;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  [v11 fetchUserRecordIDWithCompletionHandler:v15];
}

- (id)recordWithID:(id)a3 inScope:(int64_t)a4
{
  id v7 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (a4 != 3) {
      goto LABEL_9;
    }
    id v8 = [(FMFCloudKitManager *)self cache];
    id v4 = [v8 recordWithID:v7 inDatabaseWithScope:3];
  }
  else
  {
    id v8 = [(FMFCloudKitManager *)self cache];
    id v9 = [v8 recordWithID:v7 inDatabaseWithScope:a4];
    id v10 = v9;
    if (v9)
    {
      id v4 = v9;
    }
    else
    {
      double v11 = [(FMFCloudKitManager *)self cache];
      id v12 = [v7 fmf_withCurrentUserDefaultName];
      id v4 = [v11 recordWithID:v12 inDatabaseWithScope:a4];
    }
  }

LABEL_9:

  return v4;
}

- (NSString)cloudKitPushTopic
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 bundleIdentifier];

  id v4 = +[NSString stringWithFormat:@"com.apple.icloud-container.%@", v3];

  return (NSString *)v4;
}

- (void)subscribeToChangesInDatabase:(id)a3
{
  id v4 = [(FMFCloudKitManager *)self createDatabaseSubscriptionOperationWithSubscriptionId:@"private-changes" database:a3];
  [v4 setModifySubscriptionsCompletionBlock:&stru_1000A16E0];
  id v3 = +[NSOperationQueue mainQueue];
  [v3 addOperation:v4];
}

- (id)createDatabaseSubscriptionOperationWithSubscriptionId:(id)a3 database:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:v6];

  id v8 = objc_opt_new();
  [v8 setShouldSendContentAvailable:1];
  [v7 setNotificationInfo:v8];
  id v9 = objc_alloc((Class)CKModifySubscriptionsOperation);
  id v15 = v7;
  id v10 = +[NSArray arrayWithObjects:&v15 count:1];
  id v11 = [v9 initWithSubscriptionsToSave:v10 subscriptionIDsToDelete:&__NSArray0__struct];

  [v11 setDatabase:v5];
  id v12 = [v11 configuration];
  [v12 setAutomaticallyRetryNetworkFailures:0];

  id v13 = [v11 configuration];
  [v13 setDiscretionaryNetworkBehavior:0];

  return v11;
}

+ (BOOL)isIdentityLossError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:CKErrorDomain]) {
    BOOL v5 = [v3 code] == (id)112;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)processCKError:(id)a3
{
  id v4 = a3;
  if (+[FMFCloudKitManager isIdentityLossError:v4])
  {
    BOOL v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v15 = [v4 code];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetch record zones missing indentity operation error %lu", buf, 0xCu);
    }

    id v6 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"Fence-DUMMY-BOOT-STRAP" ownerName:CKCurrentUserDefaultName];
    id v7 = +[FMXPCTransactionManager sharedInstance];
    [v7 beginTransaction:@"processCKErrorDeleteZone"];

    id v8 = [(FMFCloudKitManager *)self container];
    id v9 = [v8 privateCloudDatabase];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000C640;
    v12[3] = &unk_1000A1708;
    id v13 = @"processCKErrorDeleteZone";
    [(FMFCloudKitManager *)self deleteZoneWithID:v6 inDatabase:v9 withCompletion:v12];

    id v10 = +[FMFDataManager sharedInstance];
    id v11 = [v10 fenceSequencer];
    [v11 handleIdentityLossWithCompletion:&stru_1000A1728];
  }
}

- (void)removeAllFenceRecordZonesWithCompletion:(id)a3
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 2;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_100007608;
  v14[4] = sub_1000075C8;
  id v15 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C924;
  v10[3] = &unk_1000A1750;
  id v12 = v14;
  id v13 = v16;
  id v4 = a3;
  id v11 = v4;
  BOOL v5 = objc_retainBlock(v10);
  id v6 = [(FMFCloudKitManager *)self container];
  id v7 = [v6 privateCloudDatabase];
  [(FMFCloudKitManager *)self removeAllFenceRecordsZonesInDatabase:v7 withCompletion:v5];

  id v8 = [(FMFCloudKitManager *)self container];
  id v9 = [v8 sharedCloudDatabase];
  [(FMFCloudKitManager *)self removeAllFenceRecordsZonesInDatabase:v9 withCompletion:v5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

- (void)removeAllFenceRecordsZonesInDatabase:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
  [v8 setDatabase:v6];
  id v9 = [v8 configuration];
  [v9 setDiscretionaryNetworkBehavior:0];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000CB60;
  v14[3] = &unk_1000A1798;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 setFetchRecordZonesCompletionBlock:v14];
  id v12 = sub_100005560();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Begin fetch all records operation in order to delete all records.", buf, 0xCu);
  }

  id v13 = +[NSOperationQueue mainQueue];
  [v13 addOperation:v8];
}

- (void)fetchChangesWithCompletion:(id)a3
{
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100007608;
  v18[4] = sub_1000075C8;
  id v19 = 0;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10000CF58;
  id v13 = &unk_1000A17C0;
  id v14 = self;
  id v16 = v18;
  id v17 = v20;
  id v4 = a3;
  id v15 = v4;
  BOOL v5 = objc_retainBlock(&v10);
  id v6 = [(FMFCloudKitManager *)self container];
  id v7 = [v6 privateCloudDatabase];
  [(FMFCloudKitManager *)self fetchChangesFromDatabase:v7 withCompletion:v5];

  id v8 = [(FMFCloudKitManager *)self container];
  id v9 = [v8 sharedCloudDatabase];
  [(FMFCloudKitManager *)self fetchChangesFromDatabase:v9 withCompletion:v5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchChangesFromDatabase:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMFCloudKitManager *)self cache];
  id v9 = [v8 serverChangeTokenForDatabaseWithScope:[v6 scope]];

  id v10 = [objc_alloc((Class)CKFetchDatabaseChangesOperation) initWithPreviousServerChangeToken:v9];
  id v11 = objc_alloc_init((Class)CKOperationGroup);
  [v11 setName:@"UserActionImplicit"];
  [v10 setDatabase:v6];
  [v10 setGroup:v11];
  id v12 = [v10 configuration];
  [v12 setDiscretionaryNetworkBehavior:0];

  id v13 = objc_opt_new();
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10000D3E4;
  v41[3] = &unk_1000A17E8;
  v41[4] = v13;
  [v10 setRecordZoneWithIDChangedBlock:v41];
  id v14 = objc_opt_new();
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000D3F0;
  v40[3] = &unk_1000A17E8;
  v40[4] = v14;
  [v10 setRecordZoneWithIDWasDeletedBlock:v40];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 1;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_100007608;
  v37[4] = sub_1000075C8;
  id v38 = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000D3FC;
  v33[3] = &unk_1000A1750;
  v35 = v37;
  v36 = v39;
  id v15 = v7;
  id v34 = v15;
  id v16 = objc_retainBlock(v33);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000D48C;
  v29[3] = &unk_1000A1838;
  v29[4] = self;
  v29[5] = v13;
  v32 = v39;
  v29[6] = v14;
  id v17 = v6;
  id v30 = v17;
  id v18 = v16;
  id v31 = v18;
  id v19 = objc_retainBlock(v29);
  [v10 setChangeTokenUpdatedBlock:v19];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_10000D628;
  v26 = &unk_1000A1860;
  id v20 = v19;
  id v27 = v20;
  v21 = v18;
  id v28 = v21;
  [v10 setFetchDatabaseChangesCompletionBlock:&v23];
  v22 = +[NSOperationQueue mainQueue];
  [v22 addOperation:v10];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
}

- (void)fetchChangedRecordZonesWithID:(id)a3 andDeleteRecordZonesWithID:(id)a4 fromDatabase:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100007608;
  v19[4] = sub_1000075C8;
  id v20 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000D94C;
  v15[3] = &unk_1000A1750;
  id v17 = v19;
  id v18 = v21;
  id v13 = a6;
  id v16 = v13;
  id v14 = objc_retainBlock(v15);
  [(FMFCloudKitManager *)self deleteRecordZonesWithID:v11 fromDatabase:v12 withCompletion:v14];
  if (v10 && [v10 count]) {
    [(FMFCloudKitManager *)self fetchChangedRecordZonesWithID:v10 fromDatabase:v12 withCompletion:v14];
  }
  else {
    ((void (*)(void *, void))v14[2])(v14, 0);
  }

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

- (void)deleteRecordZonesWithID:(id)a3 fromDatabase:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v22 = (void (**)(id, id))a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v25;
    do
    {
      id v14 = 0;
      id v15 = v12;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v14);
        id v17 = sub_100005560();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v29 = "-[FMFCloudKitManager deleteRecordZonesWithID:fromDatabase:withCompletion:]";
          __int16 v30 = 2112;
          uint64_t v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Delete record zone: %@", buf, 0x16u);
        }

        id v18 = [(FMFCloudKitManager *)self cache];
        id v19 = [v9 scope];
        id v23 = 0;
        [v18 removeServerChangeTokenForZoneWithID:v16 inDatabaseWithScope:v19 error:&v23];
        id v20 = v23;

        if (v15) {
          v21 = v15;
        }
        else {
          v21 = v20;
        }
        id v12 = v21;

        id v14 = (char *)v14 + 1;
        id v15 = v12;
      }
      while (v11 != v14);
      id v11 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }
  v22[2](v22, v12);
}

- (void)fetchChangedRecordZonesWithID:(id)a3 fromDatabase:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_100007608;
  v35[4] = sub_1000075C8;
  id v36 = 0;
  id v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v38 = "-[FMFCloudKitManager fetchChangedRecordZonesWithID:fromDatabase:withCompletion:]";
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Record zones with IDs changed: %@", buf, 0x16u);
  }

  id v12 = -[FMFCloudKitManager fetchChangeConfigurationsForZonesWithIDs:inScope:](self, "fetchChangeConfigurationsForZonesWithIDs:inScope:", v8, [v9 scope]);
  id v13 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v8 configurationsByRecordZoneID:v12];
  id v14 = objc_alloc_init((Class)CKOperationGroup);
  [v14 setName:@"UserActionImplicit"];
  id v15 = [v13 configuration];
  [v15 setDiscretionaryNetworkBehavior:0];

  [v13 setDatabase:v9];
  [v13 setGroup:v14];
  uint64_t v16 = objc_opt_new();
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000E038;
  v34[3] = &unk_1000A1888;
  v34[4] = v16;
  [v13 setRecordChangedBlock:v34];
  id v17 = objc_opt_new();
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000E044;
  v33[3] = &unk_1000A18B0;
  void v33[4] = v17;
  [v13 setRecordWithIDWasDeletedBlock:v33];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000E050;
  v29[3] = &unk_1000A18D8;
  v29[4] = v16;
  v29[5] = self;
  id v18 = v9;
  uint64_t v31 = v17;
  v32 = v35;
  id v30 = v18;
  id v19 = objc_retainBlock(v29);
  [v13 setRecordZoneChangeTokensUpdatedBlock:v19];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000E328;
  v26[3] = &unk_1000A1900;
  id v20 = v19;
  id v27 = v20;
  id v28 = v35;
  [v13 setRecordZoneFetchCompletionBlock:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000E498;
  v23[3] = &unk_1000A1928;
  id v21 = v10;
  id v24 = v21;
  long long v25 = v35;
  [v13 setFetchRecordZoneChangesCompletionBlock:v23];
  v22 = +[NSOperationQueue mainQueue];
  [v22 addOperation:v13];

  _Block_object_dispose(v35, 8);
}

- (id)fetchChangeConfigurationsForZonesWithIDs:(id)a3 inScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v13 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
        id v14 = [(FMFCloudKitManager *)self cache];
        id v15 = [v14 serverChangeTokenForZoneWithID:v12 inDatabaseWithScope:a4];
        [v13 setPreviousServerChangeToken:v15];

        [v7 setObject:v13 forKeyedSubscript:v12];
      }
      id v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)deleteRecordWithRecordID:(id)a3 inDatabaseWithScope:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(FMFCloudKitManager *)self container];
  id v11 = [v10 databaseWithDatabaseScope:a4];

  uint64_t v12 = [v9 zoneID];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E7A0;
  v14[3] = &unk_1000A1950;
  id v15 = v8;
  id v13 = v8;
  [(FMFCloudKitManager *)self deleteZoneWithID:v12 inDatabase:v11 withCompletion:v14];
}

- (void)updateRecord:(id)a3 inZoneSharedWith:(id)a4 inDatabaseWithScope:(int64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(FMFCloudKitManager *)self container];
  id v14 = [v13 databaseWithDatabaseScope:a5];

  id v15 = [v10 recordID];
  uint64_t v16 = [v15 zoneID];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E8F8;
  v19[3] = &unk_1000A19A0;
  v19[4] = self;
  id v20 = v10;
  long long v21 = v14;
  id v22 = v11;
  id v17 = v10;
  id v18 = v11;
  [(FMFCloudKitManager *)self updateZoneWithID:v16 withShareRecipients:v12 inDatabase:v14 withCompletion:v19];
}

- (void)updateZoneWithID:(id)a3 withShareRecipients:(id)a4 inDatabase:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000EC48;
  v16[3] = &unk_1000A19F0;
  id v19 = a5;
  id v20 = a6;
  void v16[4] = self;
  id v17 = v11;
  id v18 = v10;
  id v12 = v19;
  id v13 = v10;
  id v14 = v11;
  id v15 = v20;
  [(FMFCloudKitManager *)self updateZoneWithID:v13 inDatabase:v12 withCompletion:v16];
}

- (void)updateZoneWithID:(id)a3 inDatabase:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v9];

  id v11 = objc_alloc((Class)CKModifyRecordZonesOperation);
  id v20 = v10;
  id v12 = +[NSArray arrayWithObjects:&v20 count:1];
  id v13 = [v11 initWithRecordZonesToSave:v12 recordZoneIDsToDelete:0];

  id v14 = objc_alloc_init((Class)CKOperationGroup);
  [v14 setName:@"UserActionExplicit"];
  [v13 setDatabase:v8];

  id v15 = [v13 configuration];
  [v15 setDiscretionaryNetworkBehavior:0];

  [v13 setGroup:v14];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F024;
  v18[3] = &unk_1000A1A18;
  id v19 = v7;
  id v16 = v7;
  [v13 setModifyRecordZonesCompletionBlock:v18];
  id v17 = +[NSOperationQueue mainQueue];
  [v17 addOperation:v13];
}

- (void)deleteZoneWithID:(id)a3 inDatabase:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)CKModifyRecordZonesOperation);
  id v18 = v9;
  id v11 = +[NSArray arrayWithObjects:&v18 count:1];
  id v12 = [v10 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v11];

  [v12 setDatabase:v8];
  id v13 = [v12 configuration];
  [v13 setDiscretionaryNetworkBehavior:0];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000F1C0;
  v16[3] = &unk_1000A1A18;
  id v17 = v7;
  id v14 = v7;
  [v12 setModifyRecordZonesCompletionBlock:v16];
  id v15 = +[NSOperationQueue mainQueue];
  [v15 addOperation:v12];
}

- (void)fetchShareParticipantsForHandles:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = objc_opt_class();
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = &__NSArray0__struct;
  }
  id v11 = [v9 lookupInfosForHandles:v10];

  id v12 = [objc_alloc((Class)CKFetchShareParticipantsOperation) initWithUserIdentityLookupInfos:v11];
  id v13 = objc_alloc_init((Class)CKOperationGroup);
  [v13 setName:@"SharingSetup"];
  id v14 = [(FMFCloudKitManager *)self container];
  id v15 = [v12 configuration];
  [v15 setContainer:v14];

  [v12 setGroup:v13];
  id v16 = [v12 configuration];
  [v16 setDiscretionaryNetworkBehavior:0];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000F3DC;
  v21[3] = &unk_1000A1A40;
  void v21[4] = v8;
  [v12 setShareParticipantFetchedBlock:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000F3E8;
  v19[3] = &unk_1000A1A68;
  v19[4] = v8;
  id v20 = v6;
  id v17 = v6;
  [v12 setFetchShareParticipantsCompletionBlock:v19];
  id v18 = +[NSOperationQueue mainQueue];
  [v18 addOperation:v12];
}

- (void)updateRecord:(id)a3 andShare:(id)a4 inDatabase:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    v27[0] = v10;
    v27[1] = v11;
    id v14 = (id *)v27;
    uint64_t v15 = 2;
  }
  else
  {
    id v26 = v10;
    id v14 = &v26;
    uint64_t v15 = 1;
  }
  id v16 = +[NSArray arrayWithObjects:v14 count:v15];
  id v17 = objc_alloc_init((Class)CKOperationGroup);
  [v17 setName:@"SharingSetup"];
  id v18 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v16 recordIDsToDelete:&__NSArray0__struct];
  id v19 = [v18 configuration];
  [v19 setDiscretionaryNetworkBehavior:0];

  [v18 setDatabase:v12];
  [v18 setGroup:v17];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000F5FC;
  v23[3] = &unk_1000A1AF0;
  void v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v20 = v13;
  id v21 = v12;
  [v18 setModifyRecordsCompletionBlock:v23];
  id v22 = +[NSOperationQueue mainQueue];
  [v22 addOperation:v18];
}

+ (id)lookupInfosForHandles:(id)a3
{
  return [a3 fm_map:&stru_1000A1B30];
}

+ (BOOL)sendShareURL:(id)a3 andInvitationToken:(id)a4 recordName:(id)a5 toDestinationID:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    id v24 = 0;
    uint64_t v15 = [(id)objc_opt_class() stringFromShareInvitationToken:v12 error:&v24];
    id v16 = v24;
    id v17 = v16;
    if (v16 || !v15)
    {
      unsigned __int8 v21 = 0;
      *a7 = v16;
    }
    else
    {
      v25[0] = @"kFMFServicePayloadKey";
      v25[1] = @"p0";
      v26[0] = @"CKDeviceToDeviceShareInvitationToken";
      v26[1] = v15;
      v25[2] = @"p1";
      id v18 = [v11 absoluteString];
      v26[2] = v18;
      v26[3] = @"1";
      v25[3] = @"v";
      v25[4] = @"ckRecordName";
      void v26[4] = v13;
      id v19 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];

      id v20 = +[FMFIDSMessageController sharedInstance];
      unsigned __int8 v21 = [v20 sendMessage:v19 toIdentifier:v14 error:a7];
    }
  }
  else
  {
    if (!a7)
    {
      unsigned __int8 v21 = 0;
      goto LABEL_10;
    }
    uint64_t v22 = FMFErrorDomain;
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    CFStringRef v28 = @"no participant token";
    id v17 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    +[NSError errorWithDomain:v22 code:1018 userInfo:v17];
    unsigned __int8 v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v21;
}

- (void)handleReceiveCKShareWithURLString:(id)a3 invitationTokenBase64String:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v8 = [(FMFCloudKitManager *)self cache];
    uint64_t v10 = 0;
    [v8 updateUnacceptedShareInvitationsWithShareURLString:v6 invitationTokenBase64String:v7 InDatabaseWithScope:3 error:&v10];

    id v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[FMFCloudKitManager handleReceiveCKShareWithURLString:invitationTokenBase64String:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Received share invitation", buf, 0xCu);
    }

    [(FMFCloudKitManager *)self acceptCKShareWithURLString:v6 invitationTokenBase64String:v7];
  }
}

- (void)acceptCKShareWithURLString:(id)a3 invitationTokenBase64String:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    id v17 = 0;
    id v9 = [(id)objc_opt_class() shareInvitationTokenFromString:v7 error:&v17];
    id v8 = v17;
    if (v6)
    {
      uint64_t v10 = +[NSURL URLWithString:v6];
      id v11 = (void *)v10;
      if (!v8 && v9 && v10)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10000FEA0;
        v14[3] = &unk_1000A1B58;
        void v14[4] = v10;
        void v14[5] = v9;
        v14[6] = self;
        id v15 = v6;
        [(FMFCloudKitManager *)self acceptCKShareWithURL:v11 invitationToken:v9 completion:v14];

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006AE9C();
    }

    AnalyticsSendEvent();
    id v13 = [(FMFCloudKitManager *)self cache];
    uint64_t v16 = 0;
    [v13 removeUnacceptedShareInvitationWithShareURLString:v6 inDatabaseWithScope:3 error:&v16];

    goto LABEL_13;
  }
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[FMFCloudKitManager acceptCKShareWithURLString:invitationTokenBase64String:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: Fences_Migration is enabled - returning", buf, 0xCu);
  }
LABEL_14:
}

- (void)acceptCKShareWithURL:(id)a3 invitationToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100007608;
  v30[4] = sub_1000075C8;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100007608;
  v28[4] = sub_1000075C8;
  id v29 = 0;
  id v33 = v8;
  id v34 = v9;
  id v11 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  id v12 = objc_alloc((Class)CKFetchShareMetadataOperation);
  id v32 = v8;
  id v13 = +[NSArray arrayWithObjects:&v32 count:1];
  id v14 = [v12 initWithShareURLs:v13 invitationTokensByShareURL:v11];

  id v15 = objc_alloc_init((Class)CKOperationGroup);
  [v15 setName:@"SharingSetup"];
  [v14 setGroup:v15];
  uint64_t v16 = [(FMFCloudKitManager *)self container];
  id v17 = [v14 configuration];
  [v17 setContainer:v16];

  id v18 = [v14 configuration];
  [v18 setDiscretionaryNetworkBehavior:0];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  void v27[2] = sub_1000105FC;
  v27[3] = &unk_1000A1B80;
  v27[4] = v30;
  v27[5] = v28;
  [v14 setPerShareMetadataBlock:v27];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100010680;
  v22[3] = &unk_1000A1BF8;
  id v25 = v30;
  id v19 = v10;
  id v26 = v28;
  id v24 = v19;
  v22[4] = self;
  id v20 = v15;
  id v23 = v20;
  [v14 setFetchShareMetadataCompletionBlock:v22];
  unsigned __int8 v21 = +[NSOperationQueue mainQueue];
  [v21 addOperation:v14];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

- (void)retryAcceptShareWithURLString:(id)a3 invitationToken:(id)a4 forError:(id)a5 retryCount:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = a6 + 1;
  id v14 = [v12 userInfo];
  id v15 = [v14 objectForKeyedSubscript:CKErrorRetryAfterKey];
  if (v15)
  {
    uint64_t v16 = [v12 userInfo];
    id v17 = [v16 objectForKeyedSubscript:CKErrorRetryAfterKey];
  }
  else
  {
    id v17 = &off_1000A8ED8;
  }

  if (a6 > 4)
  {
    unsigned __int8 v21 = sub_100005560();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v33 = "-[FMFCloudKitManager retryAcceptShareWithURLString:invitationToken:forError:retryCount:]";
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v10;
      __int16 v38 = 2112;
      id v39 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: error: %@, NOT RETRYING, shareURL: %@ invitationToken: %@", buf, 0x2Au);
    }

    v30[0] = @"acceptCKShareOperationSuccessful";
    v30[1] = @"ckShareRetryAvailable";
    v31[0] = &off_1000A8EF0;
    v31[1] = &off_1000A8EF0;
    v30[2] = @"ckShareRetryCount";
    uint64_t v22 = +[NSNumber numberWithInteger:a6 + 1];
    v31[2] = v22;
    v30[3] = @"acceptCKShareError";
    [v12 code];
    id v23 = stringForCKErrorCode();
    v31[3] = v23;
    id v24 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
    AnalyticsSendEvent();
  }
  else
  {
    [v17 doubleValue];
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
    id v20 = [(FMFCloudKitManager *)self retryOperationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010C5C;
    block[3] = &unk_1000A1C48;
    block[4] = self;
    id v26 = v10;
    id v27 = v11;
    id v28 = v12;
    int64_t v29 = v13;
    dispatch_after(v19, v20, block);
  }
}

- (void)retryInviteUnacceptedCKShares
{
  id v3 = [(FMFCloudKitManager *)self cache];
  id v4 = [v3 unacceptedShareInvitationsInDatabaseWithScope:3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [v4 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
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
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = sub_100005560();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v4 count];
          *(_DWORD *)buf = 136315394;
          dispatch_time_t v19 = "-[FMFCloudKitManager retryInviteUnacceptedCKShares]";
          __int16 v20 = 2048;
          id v21 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Number of unaccepted shares: %lu ", buf, 0x16u);
        }

        int64_t v13 = [v4 valueForKey:v10];
        [(FMFCloudKitManager *)self acceptCKShareWithURLString:v10 invitationTokenBase64String:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }
}

+ (id)stringFromShareInvitationToken:(id)a3 error:(id *)a4
{
  id v18 = 0;
  BOOL v5 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v18];
  id v6 = v18;
  if (v6)
  {
    id v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006B138((uint64_t)v6, v7);
    }

    uint64_t v8 = 0;
    *a4 = v6;
  }
  else if (v5)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006B100(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)shareInvitationTokenFromString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v5 options:1];

  if (v6)
  {
    uint64_t v30 = objc_opt_class();
    id v7 = +[NSArray arrayWithObjects:&v30 count:1];
    uint64_t v8 = +[NSSet setWithArray:v7];

    id v29 = 0;
    id v9 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v8 fromData:v6 error:&v29];
    uint64_t v10 = v29;
    if (v10)
    {
      uint64_t v11 = sub_100005560();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10006B1E8((uint64_t)v10, v11);
      }

      id v12 = 0;
      *a4 = v10;
    }
    else if (v9)
    {
      id v12 = v9;
    }
    else
    {
      __int16 v20 = sub_100005560();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10006B1B0(v20, v21, v22, v23, v24, v25, v26, v27);
      }

      id v12 = 0;
    }
  }
  else
  {
    uint64_t v10 = sub_100005560();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006B1B0(v10, v13, v14, v15, v16, v17, v18, v19);
    }
    id v12 = 0;
  }

  return v12;
}

- (id)stringFromBootstrapReason:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return *(&off_1000A1C68 + a3);
  }
}

- (CKContainer)container
{
  return self->_container;
}

- (FMFCloudKitCache)cache
{
  return self->_cache;
}

- (OS_dispatch_queue)retryOperationQueue
{
  return self->_retryOperationQueue;
}

- (void)setRetryOperationQueue:(id)a3
{
}

- (double)bootstrapRetryInterval
{
  return self->_bootstrapRetryInterval;
}

- (void)setBootstrapRetryInterval:(double)a3
{
  self->_bootstrapRetryInterval = a3;
}

- (double)maxBootstrapInterval
{
  return self->_maxBootstrapInterval;
}

- (void)setMaxBootstrapInterval:(double)a3
{
  self->_maxBootstrapInterval = a3;
}

- (BOOL)boostrapScheduled
{
  return self->_boostrapScheduled;
}

- (void)setBoostrapScheduled:(BOOL)a3
{
  self->_boostrapScheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryOperationQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end