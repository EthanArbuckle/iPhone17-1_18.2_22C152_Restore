@interface CKNCloudKitManager
+ (id)getApplicationIdentifierFromEntitlements;
+ (id)sharedManager;
- (BOOL)_shouldSync;
- (CKNCloudKitManager)init;
- (id)_createCloudKitContainer;
- (id)_createDictionaryFromRecords:(id)a3;
- (id)_createKeysForRecordsIDs:(id)a3;
- (id)_createRecordsIDsForKeys:(id)a3;
- (id)_createRecordsWithDictionary:(id)a3;
- (id)_underlyingErrorForError:(id)a3 zoneID:(id)a4;
- (void)_cancelRecordZoneSetupTimer;
- (void)_cancelSubscriptionSetupTimer;
- (void)_cleanUpRecordZoneSubscriptionsTimers;
- (void)_cleanUpRecordZonesAndSubscriptions;
- (void)_cloudKitAccountStatusChanged:(id)a3;
- (void)_cloudSyncPreferenceDidChange;
- (void)_createRecordZoneWithID:(id)a3 completion:(id)a4;
- (void)_deleteRecordZoneWithID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)_disablePush;
- (void)_disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3;
- (void)_enablePush;
- (void)_fetchChanges;
- (void)_fetchChangesFrom:(id)a3 completion:(id)a4;
- (void)_fetchChangesWithRetryCount:(unint64_t)a3;
- (void)_handleAccountStatusChange:(id)a3;
- (void)_handleCloudKitNotification:(id)a3;
- (void)_initializeZone;
- (void)_resetZone;
- (void)_saveRecords:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 completion:(id)a6;
- (void)_setupAccount;
- (void)_setupAccountState;
- (void)_setupRecordZone;
- (void)_setupRecordZoneSubscription;
- (void)_setupRecordZoneSubscriptionWithRetryInterval:(double)a3;
- (void)_setupRecordZoneWithRetryInterval:(double)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)disablePushNotifications;
- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3;
- (void)enablePushNotifications;
- (void)fetchAllChangesWithCompletion:(id)a3;
- (void)fetchChangesWithCompletion:(id)a3;
- (void)removeValuesForKeys:(id)a3 completion:(id)a4;
- (void)saveRecords:(id)a3 deleteRecordIDs:(id)a4 completion:(id)a5;
- (void)saveRecordsWithDictionary:(id)a3 completion:(id)a4;
@end

@implementation CKNCloudKitManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_subscriptionSetupTimer, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_recordZoneSetupTimer, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_accountInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);

  objc_storeStrong((id *)&self->_supportedRecordType, 0);
}

- (void)_disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_cloudSyncEnabled)
  {
    self->_cloudSyncEnabled = 0;
    [(CKNCloudKitManager *)self _cleanUpRecordZonesAndSubscriptions];
  }
  sub_100003184((uint64_t)self, 0);
  id v5 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"com.apple.siri.knowledge" ownerName:CKCurrentUserDefaultName];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003228;
  v7[3] = &unk_100018A20;
  id v8 = v4;
  id v6 = v4;
  [(CKNCloudKitManager *)self _deleteRecordZoneWithID:v5 qualityOfService:33 completion:v7];
}

- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000032D8;
  v7[3] = &unk_100018890;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)_cancelSubscriptionSetupTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  subscriptionSetupTimer = self->_subscriptionSetupTimer;
  if (subscriptionSetupTimer)
  {
    dispatch_source_cancel((dispatch_source_t)subscriptionSetupTimer);
    id v4 = self->_subscriptionSetupTimer;
    self->_subscriptionSetupTimer = 0;
  }
}

- (void)_setupRecordZoneSubscriptionWithRetryInterval:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(CKNCloudKitManager *)self _shouldSync])
  {
    id v5 = [(CKRecordZone *)self->_recordZone zoneID];

    if (v5)
    {
      id v6 = +[NSString stringWithFormat:@"%@-%@", @"com.apple.siri.knowledge.subscription", self->_supportedRecordType];
      id v7 = objc_alloc((Class)CKRecordZoneSubscription);
      id v8 = [(CKRecordZone *)self->_recordZone zoneID];
      id v9 = [v7 initWithZoneID:v8 subscriptionID:v6];

      [v9 setRecordType:self->_supportedRecordType];
      id v10 = objc_alloc_init((Class)CKNotificationInfo);
      [v10 setShouldSendContentAvailable:1];
      [v9 setNotificationInfo:v10];
      id v11 = objc_alloc((Class)CKModifySubscriptionsOperation);
      id v21 = v9;
      v12 = +[NSArray arrayWithObjects:&v21 count:1];
      id v13 = [v11 initWithSubscriptionsToSave:v12 subscriptionIDsToDelete:0];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100003618;
      v18[3] = &unk_1000189F8;
      v18[4] = self;
      id v19 = v9;
      double v20 = a3;
      id v14 = v9;
      [v13 setModifySubscriptionsCompletionBlock:v18];
      [v13 setQualityOfService:17];
      v15 = [(CKContainer *)self->_container privateCloudDatabase];
      [v15 addOperation:v13];

      return;
    }
    v17 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Unable to create zone subscription without a record zone", buf, 0xCu);
    }
  }
  else
  {
    v16 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Unable to create zone subscription", buf, 0xCu);
    }
  }
  [(CKNCloudKitManager *)self _cancelSubscriptionSetupTimer];
}

- (void)_setupRecordZoneSubscription
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);

  [(CKNCloudKitManager *)self _setupRecordZoneSubscriptionWithRetryInterval:120.0];
}

- (void)removeValuesForKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003D3C;
  block[3] = &unk_100018B10;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)saveRecordsWithDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003FD4;
  block[3] = &unk_100018B10;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)saveRecords:(id)a3 deleteRecordIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000428C;
  v15[3] = &unk_100018B38;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)_saveRecords:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(CKNCloudKitManager *)self _shouldSync])
  {
    if ([v10 count] || objc_msgSend(v11, "count"))
    {
      id v13 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v10 recordIDsToDelete:v11];
      [v13 setAtomic:1];
      [v13 setSavePolicy:a5];
      double v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_100004520;
      v23 = &unk_1000189A8;
      v24 = self;
      id v25 = v12;
      [v13 setModifyRecordsCompletionBlock:&v20];
      [v13 setQualityOfService:17, v20, v21, v22, v23, v24];
      id v14 = [(CKContainer *)self->_container privateCloudDatabase];
      [v14 addOperation:v13];
    }
    else if (v12)
    {
      (*((void (**)(id, void, void, void))v12 + 2))(v12, 0, 0, 0);
    }
  }
  else
  {
    v15 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      int v17 = AFIsHorseman();
      id v18 = "NO";
      if (v17) {
        id v18 = "YES";
      }
      *(_DWORD *)buf = 136315394;
      v27 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]";
      __int16 v28 = 2080;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Unable to modify records. On HomePod: %s", buf, 0x16u);
    }
    if (v12)
    {
      id v19 = +[NSError errorWithDomain:CKErrorDomain code:6 userInfo:0];
      (*((void (**)(id, void *, void, void))v12 + 2))(v12, v19, 0, 0);
    }
  }
}

- (id)_createKeysForRecordsIDs:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v3 count]];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [[*(id *)(*((void *)&v12 + 1) + 8 * i) recordName:v12];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_createRecordsIDsForKeys:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 count])
  {
    id v5 = [(CKRecordZone *)self->_recordZone zoneID];

    if (v5)
    {
      id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v16 = v4;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            id v12 = objc_alloc((Class)CKRecordID);
            long long v13 = [(CKRecordZone *)self->_recordZone zoneID];
            id v14 = [v12 initWithRecordName:v11 zoneID:v13];

            [v5 addObject:v14];
          }
          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }

      id v4 = v16;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_createDictionaryFromRecords:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = [v11 data];
          long long v13 = v12;
          if (!v12)
          {
            id v3 = +[NSNull null];
            long long v13 = v3;
          }
          id v14 = [v11 recordID];
          long long v15 = [v14 recordName];
          [v5 setObject:v13 forKey:v15];

          if (!v12) {
        }
          }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v4 = v17;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_createRecordsWithDictionary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 count]
    && ([(CKRecordZone *)self->_recordZone zoneID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v24 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v11 = objc_alloc((Class)CKRecordID);
          id v12 = [(CKRecordZone *)self->_recordZone zoneID];
          id v13 = [v11 initWithRecordName:v10 zoneID:v12];

          id v14 = [objc_alloc((Class)CKRecord) initWithRecordType:self->_supportedRecordType recordID:v13];
          long long v15 = [v6 objectForKey:v10];
          id v16 = +[NSNull null];
          unsigned int v17 = [v15 isEqual:v16];

          if (v17)
          {

            long long v15 = 0;
          }
          long long v18 = [v14 encryptedValuesByKey];
          long long v19 = +[NSNumber numberWithUnsignedInteger:1];
          [v18 setObject:v19 forKey:@"version"];

          long long v20 = [v14 encryptedValuesByKey];
          [v20 setObject:v10 forKey:@"key"];

          [v14 setData:v15];
          [v24 addObject:v14];
        }
        id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    id v4 = v22;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (void)_cleanUpRecordZonesAndSubscriptions
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(CKNCloudKitManager *)self _cleanUpRecordZoneSubscriptionsTimers];
  recordZone = self->_recordZone;
  self->_recordZone = 0;

  subscription = self->_subscription;
  self->_subscription = 0;
}

- (void)_cleanUpRecordZoneSubscriptionsTimers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(CKNCloudKitManager *)self _cancelRecordZoneSetupTimer];

  [(CKNCloudKitManager *)self _cancelSubscriptionSetupTimer];
}

- (void)_deleteRecordZoneWithID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v10 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = [v8 zoneName];
    *(_DWORD *)buf = 136315394;
    id v22 = "-[CKNCloudKitManager _deleteRecordZoneWithID:qualityOfService:completion:]";
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Deleting zone: (%@)", buf, 0x16u);
  }
  if (self->_container)
  {
    id v13 = objc_alloc((Class)CKModifyRecordZonesOperation);
    id v20 = v8;
    id v14 = +[NSArray arrayWithObjects:&v20 count:1];
    id v15 = [v13 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v14];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000054B4;
    v17[3] = &unk_1000189A8;
    id v18 = v8;
    id v19 = v9;
    [v15 setModifyRecordZonesCompletionBlock:v17];
    [v15 setQualityOfService:a4];
    id v16 = [(CKContainer *)self->_container privateCloudDatabase];
    [v16 addOperation:v15];

LABEL_7:
    goto LABEL_8;
  }
  if (v9)
  {
    id v15 = +[NSError errorWithDomain:CKErrorDomain code:5 userInfo:0];
    (*((void (**)(id, id))v9 + 2))(v9, v15);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_createRecordZoneWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned __int8 v8 = [(CKNCloudKitManager *)self _shouldSync];
  id v9 = (void *)CKLogContextDaemon;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v19 = v9;
      id v20 = [v6 zoneName];
      *(_DWORD *)buf = 136315394;
      long long v26 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]";
      __int16 v27 = 2112;
      long long v28 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s iCloud sync is disabled. Unable to create zone: (%@)", buf, 0x16u);

      if (!v7) {
        goto LABEL_13;
      }
    }
    else if (!v7)
    {
      goto LABEL_13;
    }
    unsigned int v17 = CKErrorDomain;
    uint64_t v18 = 6;
LABEL_11:
    id v12 = +[NSError errorWithDomain:v17 code:v18 userInfo:0];
    v7[2](v7, v12, 0);
    goto LABEL_12;
  }
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    id v11 = [v6 zoneName];
    *(_DWORD *)buf = 136315394;
    long long v26 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]";
    __int16 v27 = 2112;
    long long v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Creating zone: (%@)", buf, 0x16u);
  }
  if (self->_container)
  {
    id v12 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v6];
    [v12 setCapabilities:3];
    id v13 = objc_alloc((Class)CKModifyRecordZonesOperation);
    id v24 = v12;
    id v14 = +[NSArray arrayWithObjects:&v24 count:1];
    id v15 = [v13 initWithRecordZonesToSave:v14 recordZoneIDsToDelete:0];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100005904;
    v21[3] = &unk_1000189A8;
    id v22 = v6;
    __int16 v23 = v7;
    [v15 setModifyRecordZonesCompletionBlock:v21];
    [v15 setQualityOfService:17];
    id v16 = [(CKContainer *)self->_container privateCloudDatabase];
    [v16 addOperation:v15];

LABEL_12:
    goto LABEL_13;
  }
  if (v7)
  {
    unsigned int v17 = CKErrorDomain;
    uint64_t v18 = 5;
    goto LABEL_11;
  }
LABEL_13:
}

- (void)_cancelRecordZoneSetupTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  recordZoneSetupTimer = self->_recordZoneSetupTimer;
  p_recordZoneSetupTimer = &self->_recordZoneSetupTimer;
  id v3 = recordZoneSetupTimer;
  if (recordZoneSetupTimer)
  {
    dispatch_source_cancel(v3);
    objc_storeStrong((id *)p_recordZoneSetupTimer, 0);
  }
}

- (void)_setupRecordZoneWithRetryInterval:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005B88;
  v6[3] = &unk_100018980;
  v6[4] = self;
  id v7 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"com.apple.siri.knowledge" ownerName:CKCurrentUserDefaultName];
  double v8 = a3;
  id v5 = v7;
  [(CKNCloudKitManager *)self _createRecordZoneWithID:v5 completion:v6];
}

- (void)_setupRecordZone
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(CKNCloudKitManager *)self _shouldSync])
  {
    if (self->_recordZone)
    {
      if (self->_subscription && self->_hasSetUpRecordZoneSubscription)
      {
        [(CKNCloudKitManager *)self _fetchChanges];
      }
      else
      {
        [(CKNCloudKitManager *)self _setupRecordZoneSubscription];
      }
    }
    else
    {
      [(CKNCloudKitManager *)self _setupRecordZoneWithRetryInterval:120.0];
    }
  }
}

- (void)_resetZone
{
  recordZone = self->_recordZone;
  self->_recordZone = 0;

  subscription = self->_subscription;
  self->_subscription = 0;

  sub_100003184((uint64_t)self, 0);
  sub_100005FE4((uint64_t)self, 0);

  [(CKNCloudKitManager *)self _setupRecordZone];
}

- (void)_initializeZone
{
  id v11 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"com.apple.siri.knowledge" ownerName:CKCurrentUserDefaultName];
  if (v11)
  {
    id v3 = (CKRecordZone *)[objc_alloc((Class)CKRecordZone) initWithZoneID:v11];
    p_recordZone = &self->_recordZone;
    recordZone = self->_recordZone;
    self->_recordZone = v3;
  }
  else
  {
    p_recordZone = &self->_recordZone;
    recordZone = self->_recordZone;
    self->_recordZone = 0;
  }

  if (*p_recordZone)
  {
    id v6 = +[NSString stringWithFormat:@"%@-%@", @"com.apple.siri.knowledge.subscription", self->_supportedRecordType];
    id v7 = objc_alloc((Class)CKRecordZoneSubscription);
    double v8 = [(CKRecordZone *)self->_recordZone zoneID];
    id v9 = (CKRecordZoneSubscription *)[v7 initWithZoneID:v8 subscriptionID:v6];

    [(CKRecordZoneSubscription *)v9 setRecordType:self->_supportedRecordType];
    subscription = self->_subscription;
    self->_subscription = v9;
  }
  else
  {
    id v6 = self->_subscription;
    self->_subscription = 0;
  }
}

- (id)_createCloudKitContainer
{
  v2 = +[CKContainer containerWithIdentifier:@"com.apple.siri.knowledge"];
  id v3 = objc_opt_new();
  [v3 setUseZoneWidePCS:1];
  id v4 = objc_alloc((Class)CKContainer);
  id v5 = [v2 containerID];
  id v6 = [v4 initWithContainerID:v5 options:v3];

  return v6;
}

- (void)fetchAllChangesWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006964;
  v7[3] = &unk_100018890;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)fetchChangesWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006BB8;
  v7[3] = &unk_100018890;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)_fetchChangesWithRetryCount:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a3 < 2)
  {
    serverChangeToken = self->_serverChangeToken;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100006F88;
    v7[3] = &unk_100018840;
    void v7[4] = self;
    void v7[5] = a3;
    [(CKNCloudKitManager *)self _fetchChangesFrom:serverChangeToken completion:v7];
  }
  else
  {
    id v5 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[CKNCloudKitManager _fetchChangesWithRetryCount:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Exceeded fetch retry attempts for zone", buf, 0xCu);
    }
  }
}

- (void)_fetchChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);

  [(CKNCloudKitManager *)self _fetchChangesWithRetryCount:0];
}

- (void)_fetchChangesFrom:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(CKNCloudKitManager *)self _shouldSync])
  {
    id v8 = [(CKContainer *)self->_container privateCloudDatabase];
    if (v8)
    {
      id v9 = [(CKRecordZone *)self->_recordZone zoneID];

      if (v9)
      {
        uint64_t v10 = (void *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          recordZone = self->_recordZone;
          id v12 = v10;
          id v13 = [(CKRecordZone *)recordZone zoneID];
          id v14 = [v13 zoneName];
          [v8 databaseScope];
          CKDatabaseScopeString();
          id v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[CKNCloudKitManager _fetchChangesFrom:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          v47 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Fetching changes in record zone (%@) in database (%@)", buf, 0x20u);
        }
        id v16 = [(CKRecordZone *)self->_recordZone zoneID];
        v52 = v16;
        v31 = +[NSArray arrayWithObjects:&v52 count:1];

        unsigned int v17 = +[NSMutableArray array];
        uint64_t v18 = +[NSMutableArray array];
        id v19 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
        [v19 setPreviousServerChangeToken:v6];
        id v20 = [(CKRecordZone *)self->_recordZone zoneID];
        v50 = v20;
        id v51 = v19;
        v30 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v47 = sub_100007C5C;
        v48 = sub_100007C6C;
        id v49 = 0;
        id v21 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v31 configurationsByRecordZoneID:v30];
        [v21 setFetchAllChanges:1];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100007C74;
        v44[3] = &unk_1000186D8;
        id v22 = v17;
        id v45 = v22;
        [v21 setRecordChangedBlock:v44];
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100007C80;
        v42[3] = &unk_100018700;
        id v23 = v18;
        id v43 = v23;
        [v21 setRecordWithIDWasDeletedBlock:v42];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100007C8C;
        v41[3] = &unk_100018728;
        v41[4] = buf;
        [v21 setRecordZoneChangeTokensUpdatedBlock:v41];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_100007CA0;
        v40[3] = &unk_100018750;
        v40[4] = buf;
        [v21 setRecordZoneFetchCompletionBlock:v40];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100007F4C;
        v32[3] = &unk_1000187C8;
        id v24 = v8;
        id v33 = v24;
        id v25 = v22;
        id v34 = v25;
        v35 = self;
        id v37 = v7;
        id v26 = v23;
        BOOL v39 = v6 == 0;
        id v36 = v26;
        v38 = buf;
        [v21 setFetchRecordZoneChangesCompletionBlock:v32];
        [v21 setQualityOfService:17];
        [v24 addOperation:v21];

        _Block_object_dispose(buf, 8);
        goto LABEL_13;
      }
      if (v7)
      {
        uint64_t v28 = +[NSError errorWithDomain:CKErrorDomain code:26 userInfo:0];
        goto LABEL_12;
      }
    }
    else if (v7)
    {
      uint64_t v28 = +[NSError errorWithDomain:CKErrorDomain code:24 userInfo:0];
LABEL_12:
      v29 = (void *)v28;
      (*((void (**)(id, uint64_t, void, void, void, void))v7 + 2))(v7, v28, 0, 0, 0, 0);
    }
LABEL_13:

    goto LABEL_14;
  }
  __int16 v27 = +[NSError errorWithDomain:CKErrorDomain code:6 userInfo:0];
  (*((void (**)(id, void *, void, void, void, void))v7 + 2))(v7, v27, 0, 0, 0, 0);

LABEL_14:
}

- (id)_underlyingErrorForError:(id)a3 zoneID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 code] == (id)2)
  {
    if (v6)
    {
      id v7 = [v5 userInfo];
      id v8 = [v7 objectForKey:CKPartialErrorsByItemIDKey];

      id v9 = [v8 objectForKey:v6];
      uint64_t v10 = [v9 userInfo];
      id v11 = [v10 objectForKey:NSUnderlyingErrorKey];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v12 = [v5 userInfo];
    id v11 = [v12 objectForKey:NSUnderlyingErrorKey];

    if (!v11) {
      id v11 = v5;
    }
  }

  return v11;
}

- (BOOL)_shouldSync
{
  if (self->_cloudSyncEnabled)
  {
    unsigned int v2 = [(CKAccountInfo *)self->_accountInfo supportsDeviceToDeviceEncryption];
    if (v2) {
      LOBYTE(v2) = AFIsHorseman() ^ 1;
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)_setupAccountState
{
  if ([(CKAccountInfo *)self->_accountInfo supportsDeviceToDeviceEncryption]&& [(CKAccountInfo *)self->_accountInfo accountStatus] == (id)1)
  {
    [(CKNCloudKitManager *)self _cleanUpRecordZoneSubscriptionsTimers];
    if (self->_cloudSyncEnabled)
    {
      [(CKNCloudKitManager *)self _setupRecordZone];
    }
  }
  else
  {
    [(CKNCloudKitManager *)self _cleanUpRecordZonesAndSubscriptions];
  }
}

- (void)_handleAccountStatusChange:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v6 = [(CKAccountInfo *)self->_accountInfo isEqual:v5];
  id v7 = CKLogContextDaemon;
  BOOL v8 = os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v13 = 136315138;
      id v14 = "-[CKNCloudKitManager _handleAccountStatusChange:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s CloudKit account status is unchanged", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      id v9 = v7;
      [v5 accountStatus];
      uint64_t v10 = CKStringFromAccountStatus();
      unsigned int v11 = [v5 supportsDeviceToDeviceEncryption];
      CFStringRef v12 = @"Disabled";
      id v14 = "-[CKNCloudKitManager _handleAccountStatusChange:]";
      int v13 = 136315650;
      __int16 v15 = 2112;
      id v16 = v10;
      if (v11) {
        CFStringRef v12 = @"Enabled";
      }
      __int16 v17 = 2112;
      CFStringRef v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s CloudKit account status: (%@) encryption is: %@", (uint8_t *)&v13, 0x20u);
    }
    objc_storeStrong((id *)&self->_accountInfo, a3);
    [(CKNCloudKitManager *)self _setupAccountState];
  }
}

- (void)_setupAccount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  container = self->_container;
  if (!container)
  {
    id v4 = [(CKNCloudKitManager *)self _createCloudKitContainer];
    id v5 = self->_container;
    self->_container = v4;

    container = self->_container;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000870C;
  v6[3] = &unk_1000186B0;
  v6[4] = self;
  [(CKContainer *)container accountInfoWithCompletionHandler:v6];
}

- (void)_cloudSyncPreferenceDidChange
{
  id v3 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CKNCloudKitManager _cloudSyncPreferenceDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s CloudKit preferences changed", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008AA0;
  block[3] = &unk_100018A88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_cloudKitAccountStatusChanged:(id)a3
{
  id v4 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v8 = "-[CKNCloudKitManager _cloudKitAccountStatusChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008CD4;
  block[3] = &unk_100018A88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_handleCloudKitNotification:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(CKNCloudKitManager *)self _shouldSync])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unsigned int v6 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315394;
        id v14 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Received record zone notification: (%@)", (uint8_t *)&v13, 0x16u);
      }
      if ([v5 databaseScope] == (id)2)
      {
        id v7 = [v5 recordZoneID];
        BOOL v8 = [v7 zoneName];
        if (v8)
        {
          id v9 = v8;
          if ([v8 isEqualToString:@"com.apple.siri.knowledge"])
          {
            [(CKNCloudKitManager *)self _fetchChanges];
          }
          else
          {
            CFStringRef v12 = CKLogContextDaemon;
            if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              int v13 = 136315394;
              id v14 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
              __int16 v15 = 2112;
              id v16 = v7;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Unrecognized record zone notification zone name: (%@)", (uint8_t *)&v13, 0x16u);
            }
          }
        }
        else
        {
          unsigned int v11 = CKLogContextDaemon;
          if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            int v13 = 136315138;
            id v14 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Record zone notification contains no zone name", (uint8_t *)&v13, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v10 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      id v14 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Ignoring notification", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 userInfo];
  id v9 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    unsigned int v11 = [v7 topic];
    int v17 = 136315650;
    CFStringRef v18 = "-[CKNCloudKitManager connection:didReceiveIncomingMessage:]";
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s APS message received for topic (%@) on connection (%@)", (uint8_t *)&v17, 0x20u);
  }
  CFStringRef v12 = [v7 topic];
  if (self) {
    applicationIdentifier = self->_applicationIdentifier;
  }
  else {
    applicationIdentifier = 0;
  }
  id v14 = [@"com.apple.icloud-container." stringByAppendingString:applicationIdentifier];
  unsigned int v15 = [v12 isEqualToString:v14];

  if (v15)
  {
    id v16 = +[CKNotification notificationFromRemoteNotificationDictionary:v8];
    [(CKNCloudKitManager *)self _handleCloudKitNotification:v16];
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136316162;
    unsigned int v15 = "-[CKNCloudKitManager connection:didReceiveToken:forTopic:identifier:]";
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Received per-topic push token (%@) for topic (%@) identifier (%@) on connection (%@)", (uint8_t *)&v14, 0x34u);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    id v9 = "-[CKNCloudKitManager connection:didReceivePublicToken:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Received public token (%@) on connection %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_disablePush
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  sub_10000933C(self);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 _setEnabledTopics:0];
}

- (void)_enablePush
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = self->_applicationIdentifier;
  id v4 = [@"com.apple.icloud-container." stringByAppendingString:v3];

  id v7 = v4;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  id v6 = sub_10000933C(self);
  [v6 _setEnabledTopics:v5];
}

- (void)disablePushNotifications
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000095A0;
  block[3] = &unk_100018A88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)enablePushNotifications
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000961C;
  block[3] = &unk_100018A88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)dealloc
{
  [(APSConnection *)self->_pushConnection setDelegate:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CKAccountChangedNotification object:0];
  [v3 removeObserver:self name:CKIdentityUpdateNotification object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFCloudSyncPreferenceDidChangeDarwinNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)CKNCloudKitManager;
  [(CKNCloudKitManager *)&v5 dealloc];
}

- (CKNCloudKitManager)init
{
  v34.receiver = self;
  v34.super_class = (Class)CKNCloudKitManager;
  unsigned int v2 = [(CKNCloudKitManager *)&v34 init];
  if (v2)
  {
    id v3 = +[CKKnowledgeStore userDefaultsKnowledgeStore];
    id v4 = [v3 valueForKey:@"ServerChangeToken"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v5 = v4;
    }
    else {
      objc_super v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v33 = 0;
      id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:&v33];
      id v8 = v33;
      if (v8)
      {
        id v9 = CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v36 = "-[CKNCloudKitManager init]";
          __int16 v37 = 2112;
          CFStringRef v38 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s error unarchiving server change token %@", buf, 0x16u);
        }
        __int16 v10 = 0;
      }
      else
      {
        id v11 = self;
        __int16 v10 = [v7 decodeObjectOfClass:v11 forKey:NSKeyedArchiveRootObjectKey];

        [v7 finishDecoding];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v2->_serverChangeToken, v10);
        }
      }
    }
    else
    {
      __int16 v10 = 0;
    }
    __int16 v12 = [v3 valueForKey:@"HasSetUpRecordZoneSubscription"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    v2->_hasSetUpRecordZoneSubscription = [v13 BOOLValue];
    [(CKAccountInfo *)v2->_accountInfo setAccountStatus:0];
    [(CKAccountInfo *)v2->_accountInfo setSupportsDeviceToDeviceEncryption:0];
    [(CKAccountInfo *)v2->_accountInfo setAccountPartition:1];
    uint64_t v14 = [(id)objc_opt_class() getApplicationIdentifierFromEntitlements];
    applicationIdentifier = v2->_applicationIdentifier;
    v2->_applicationIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v2->_supportedRecordType, @"SiriKnowledgeKeyValueRecord");
    __int16 v16 = +[AFPreferences sharedPreferences];
    v2->_cloudSyncEnabled = [v16 cloudSyncEnabled];

    id v17 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v18 = @"enabled";
      if (!v2->_cloudSyncEnabled) {
        CFStringRef v18 = @"disabled";
      }
      *(_DWORD *)buf = 136315394;
      id v36 = "-[CKNCloudKitManager init]";
      __int16 v37 = 2112;
      CFStringRef v38 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Cloud sync is %@", buf, 0x16u);
    }
    dispatch_queue_t v19 = dispatch_queue_create("CKNCloudKitManager.Serial", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [(CKNCloudKitManager *)v2 _createCloudKitContainer];
    container = v2->_container;
    v2->_container = (CKContainer *)v21;

    id v23 = v2->_serialQueue;
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_100009B40;
    v31 = &unk_100018A88;
    id v24 = v2;
    v32 = v24;
    dispatch_async(v23, &v28);
    id v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v24 selector:"_cloudKitAccountStatusChanged:" name:CKAccountChangedNotification object:0];
    [v25 addObserver:v24 selector:"_cloudKitAccountStatusChanged:" name:CKIdentityUpdateNotification object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v24, (CFNotificationCallback)sub_100009B98, kAFCloudSyncPreferenceDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (id)getApplicationIdentifierFromEntitlements
{
  [@"application-identifier" UTF8String];
  unsigned int v2 = (void *)xpc_copy_entitlement_for_self();
  id v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_string)
  {
    id v4 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v3)];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D7C;
  block[3] = &unk_100018660;
  block[4] = a1;
  if (qword_10001DEB0 != -1) {
    dispatch_once(&qword_10001DEB0, block);
  }
  unsigned int v2 = (void *)qword_10001DEB8;

  return v2;
}

@end