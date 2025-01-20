@interface MSDPublicDBManager
+ (id)_getMatchingObjectForBundleID:(id)a3 bundleID:(id)a4;
+ (id)_getMatchingObjectForServiceID:(id)a3 serviceID:(id)a4;
+ (id)_getMatchingObjectForServiceName:(id)a3 serviceName:(id)a4;
+ (id)getCachedPublicInfo;
+ (id)getCachedPublicInfoForBundleID:(id)a3;
+ (id)getCachedPublicInfoForServiceID:(id)a3;
+ (id)getCachedPublicInfoForServiceName:(id)a3;
+ (id)shared;
+ (void)_fetchData:(id)a3;
+ (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4;
+ (void)getPublicInfoForServiceID:(id)a3 completion:(id)a4;
+ (void)getPublicInfoForServiceName:(id)a3 completion:(id)a4;
- (BOOL)isCurrentlySyncing;
- (BOOL)shouldUseCloudKit;
- (MSDPublicDBManager)init;
- (NSMutableArray)queuedPendingRequests;
- (id)_fetchPreviousChangeToken:(id)a3;
- (id)_handleChangedRecords:(id)a3 localCachedCopy:(id)a4 error:(id *)a5;
- (id)_handleDeletedRecordIDS:(id)a3 localCachedCopy:(id)a4;
- (id)_handleRecordsChanged:(id)a3 deletedRecordIDS:(id)a4 error:(id *)a5;
- (id)createPublicDBInfoObject:(id)a3;
- (id)createPublicDBInfoObjectFromDictionary:(id)a3;
- (unint64_t)retryCount;
- (void)_clearAllDefaultsData;
- (void)_syncDataWithCloudKitWithCompletion:(id)a3;
- (void)_updateDefaultsWithChangeToken:(id)a3 serverChangeToken:(id)a4;
- (void)_updateLastRefreshTS;
- (void)_withLock:(id)a3;
- (void)executePendingRequests:(id)a3 forPublicDBInfo:(id)a4 error:(id)a5;
- (void)setIsCurrentlySyncing:(BOOL)a3;
- (void)setQueuedPendingRequests:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)syncDataWithCloudKit:(id)a3;
@end

@implementation MSDPublicDBManager

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000251B0;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_1000567E0 != -1) {
    dispatch_once(&qword_1000567E0, block);
  }
  v2 = (void *)qword_1000567D8;

  return v2;
}

- (MSDPublicDBManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSDPublicDBManager;
  v2 = [(MSDPublicDBManager *)&v10 init];
  if (v2)
  {
    v3 = sub_100031A80();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[MSDPublicDBManager init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v2->_retryCount = 0;
    v2->_isCurrentlySyncing = 0;
    uint64_t v4 = objc_opt_new();
    queuedPendingRequests = v2->_queuedPendingRequests;
    v2->_queuedPendingRequests = (NSMutableArray *)v4;

    v2->_syncLock._os_unfair_lock_opaque = 0;
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediasetup.publicdb-notify-queue", v6);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)syncDataWithCloudKit:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000253AC;
  v5[3] = &unk_10004D558;
  id v6 = a3;
  id v4 = v6;
  [(MSDPublicDBManager *)self _syncDataWithCloudKitWithCompletion:v5];
}

+ (void)getPublicInfoForServiceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100025480;
  v9[3] = &unk_10004DF90;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v6;
  id v8 = v11;
  [a1 _fetchData:v9];
}

+ (void)getPublicInfoForServiceID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000255F4;
  v9[3] = &unk_10004DF90;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v6;
  id v8 = v11;
  [a1 _fetchData:v9];
}

+ (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100025768;
  v9[3] = &unk_10004DF90;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v6;
  id v8 = v11;
  [a1 _fetchData:v9];
}

+ (id)getCachedPublicInfoForServiceName:(id)a3
{
  id v4 = a3;
  v5 = +[MSDDefaultsManager sharedManager];
  id v6 = [v5 objectForDefaultWithCustomClass:@"publicDBData"];

  id v7 = [a1 _getMatchingObjectForServiceName:v6 serviceName:v4];

  return v7;
}

+ (id)getCachedPublicInfoForServiceID:(id)a3
{
  id v4 = a3;
  v5 = +[MSDDefaultsManager sharedManager];
  id v6 = [v5 objectForDefaultWithCustomClass:@"publicDBData"];

  id v7 = [a1 _getMatchingObjectForServiceID:v6 serviceID:v4];

  return v7;
}

+ (id)getCachedPublicInfoForBundleID:(id)a3
{
  id v4 = a3;
  v5 = +[MSDDefaultsManager sharedManager];
  id v6 = [v5 objectForDefaultWithCustomClass:@"publicDBData"];

  id v7 = [a1 _getMatchingObjectForBundleID:v6 bundleID:v4];

  return v7;
}

+ (id)getCachedPublicInfo
{
  v2 = +[MSDDefaultsManager sharedManager];
  v3 = [v2 objectForDefaultWithCustomClass:@"publicDBData"];

  return v3;
}

- (id)createPublicDBInfoObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:MediaServiceName];
  v5 = [v3 objectForKey:MediaServiceIdentifier];
  id v6 = [objc_alloc((Class)MSPublicDBInfo) initWithServiceName:v4 serviceID:v5];
  if (v6)
  {
    id v7 = [v3 recordID];
    id v8 = [v7 recordName];
    [v6 setRecordName:v8];

    v9 = [v3 objectForKey:MediaServiceType];
    [v6 setServiceType:v9];

    id v10 = [v3 objectForKey:MediaServiceBundleIdentifier];
    [v6 setBundleIDS:v10];

    id v11 = [v3 objectForKey:MediaServiceIconPath];
    id v12 = +[NSURL URLWithString:v11];
    [v6 setServiceIconPath:v12];

    v13 = [v3 objectForKey:MediaServiceConfigurationPublicKey];
    [v6 setConfigurationPublicKey:v13];

    id v14 = v6;
  }
  else
  {
    v15 = sub_100031A80();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002867C();
    }
  }

  return v6;
}

- (id)createPublicDBInfoObjectFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:MediaServiceName];
  v5 = [v3 objectForKey:MediaServiceIdentifier];
  id v6 = [objc_alloc((Class)MSPublicDBInfo) initWithServiceName:v4 serviceID:v5];
  if (v6)
  {
    id v7 = [v3 objectForKey:MediaServiceType];
    [v6 setServiceType:v7];

    id v8 = [v3 objectForKey:MediaServiceBundleIdentifier];
    [v6 setBundleIDS:v8];

    v9 = [v3 objectForKey:MediaServiceIconPath];
    id v10 = +[NSURL URLWithString:v9];
    [v6 setServiceIconPath:v10];

    id v11 = [v3 objectForKey:MediaServiceConfigurationPublicKey];
    [v6 setConfigurationPublicKey:v11];

    id v12 = v6;
  }
  else
  {
    v13 = sub_100031A80();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      v16 = v4;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to create MSPublicDBInfo object with serviceName %@ service ID: %@", (uint8_t *)&v15, 0x16u);
    }
  }

  return v6;
}

- (void)_syncDataWithCloudKitWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100031A80();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[MSDPublicDBManager _syncDataWithCloudKitWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10002662C;
  v38[3] = &unk_10004DFB8;
  v38[4] = self;
  v40 = &v41;
  id v6 = v4;
  id v39 = v6;
  [(MSDPublicDBManager *)self _withLock:v38];
  if (v6 && !*((unsigned char *)v42 + 24))
  {
    id v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "A sync with the public db is already underway. Suspending request to sync with CloudKit until sync is complete.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_25;
  }
  id v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting sync with public db", (uint8_t *)&buf, 2u);
  }

  id v9 = objc_alloc((Class)CKRecordZoneID);
  id v10 = [v9 initWithZoneName:MSPublicInfoRecordZoneName ownerName:CKCurrentUserDefaultName];
  id v7 = v10;
  if (v10)
  {
    id v11 = [v10 zoneName];
    id v12 = [(MSDPublicDBManager *)self _fetchPreviousChangeToken:v11];

    v13 = objc_opt_new();
    [v13 setPreviousServerChangeToken:v12];
    if (v13)
    {
      v51 = v7;
      v52 = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      int v15 = sub_100031A80();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138477827;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Public] Passing Configuration for recordZoneID %{private}@", (uint8_t *)&buf, 0xCu);
      }

      id v16 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
      v50 = v7;
      __int16 v17 = +[NSArray arrayWithObjects:&v50 count:1];
      id v18 = [v16 initWithRecordZoneIDs:v17 configurationsByRecordZoneID:v14];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v46 = 0x3032000000;
      v47 = sub_1000266C8;
      v48 = sub_1000266D8;
      id v49 = 0;
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = sub_1000266C8;
      v36[4] = sub_1000266D8;
      id v37 = (id)objc_opt_new();
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = sub_1000266C8;
      v34[4] = sub_1000266D8;
      id v35 = (id)objc_opt_new();
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x3032000000;
      v32[3] = sub_1000266C8;
      v32[4] = sub_1000266D8;
      id v33 = (id)objc_opt_new();
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000266E0;
      v31[3] = &unk_10004DFE0;
      v31[4] = v34;
      [v18 setRecordWithIDWasDeletedBlock:v31];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000267AC;
      v30[3] = &unk_10004E008;
      v30[4] = v36;
      [v18 setRecordWasChangedBlock:v30];
      objc_initWeak(&location, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000268D8;
      v24[3] = &unk_10004E098;
      objc_copyWeak(&v28, &location);
      v24[4] = self;
      v26 = v32;
      p_long long buf = &buf;
      id v25 = v6;
      [v18 setFetchRecordZoneChangesCompletionBlock:v24];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100026FB4;
      v23[3] = &unk_10004E0C0;
      v23[6] = v36;
      v23[7] = v34;
      v23[4] = self;
      v23[5] = &buf;
      [v18 setRecordZoneFetchCompletionBlock:v23];
      [v18 setQualityOfService:17];
      v19 = +[CKContainer MSDPublicCloudKitContainer];
      v20 = [v19 publicCloudDatabase];
      [v20 addOperation:v18];

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      _Block_object_dispose(v32, 8);

      _Block_object_dispose(v34, 8);
      _Block_object_dispose(v36, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v22 = sub_100031A80();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100028734(v22);
      }

      if (!v6) {
        goto LABEL_23;
      }
      id v14 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v14);
    }

LABEL_23:
    goto LABEL_24;
  }
  v21 = sub_100031A80();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1000286F0(v21);
  }

  if (v6)
  {
    id v12 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
LABEL_24:
  }
LABEL_25:

  _Block_object_dispose(&v41, 8);
}

- (id)_handleRecordsChanged:(id)a3 deletedRecordIDS:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MSDDefaultsManager sharedManager];
  id v11 = [v10 objectForDefaultWithCustomClass:@"publicDBData"];

  id v12 = [(MSDPublicDBManager *)self _handleDeletedRecordIDS:v9 localCachedCopy:v11];

  if (!v12 || ![v12 count])
  {
    uint64_t v13 = objc_opt_new();

    id v12 = (void *)v13;
  }
  id v14 = [(MSDPublicDBManager *)self _handleChangedRecords:v8 localCachedCopy:v12 error:a5];

  return v14;
}

- (id)_handleDeletedRecordIDS:(id)a3 localCachedCopy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] && objc_msgSend(v5, "count"))
  {
    id v7 = [v6 na_dictionaryWithKeyGenerator:&stru_10004E100];
    id v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138477827;
      id v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Public] RecordIDS deleted on device: %{private}@", buf, 0xCu);
    }

    id v26 = v6;
    id v9 = +[NSMutableArray arrayWithArray:v6];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v27 = v5;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v16 = [v7 allKeys];
          __int16 v17 = [v15 recordName];
          unsigned int v18 = [v16 containsObject:v17];

          if (v18)
          {
            v19 = sub_100031A80();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = [v15 recordName];
              *(_DWORD *)long long buf = 138477827;
              id v34 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Public] Found match for %{private}@, removing obj from local copy", buf, 0xCu);
            }
            v21 = [v15 recordName];
            v22 = [v7 objectForKey:v21];

            [v9 removeObject:v22];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }

    id v23 = [v9 copy];
    id v6 = v26;
    id v5 = v27;
  }
  else
  {
    v24 = sub_100031A80();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Public] Deleted recordIDS or cachedData is nil, skipping update", buf, 2u);
    }

    id v23 = v6;
  }

  return v23;
}

- (id)_handleChangedRecords:(id)a3 localCachedCopy:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    id v9 = +[NSMutableArray arrayWithArray:v8];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v27 = v7;
    id obj = v7;
    id v10 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    id v11 = v8;
    id v28 = v9;
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v37;
      uint64_t v29 = MSErrorDomain;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          int v15 = -[MSDPublicDBManager createPublicDBInfoObject:](self, "createPublicDBInfoObject:", *(void *)(*((void *)&v36 + 1) + 8 * i), v27);
          id v16 = v15;
          if (v15)
          {
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100027A3C;
            v32[3] = &unk_10004CB60;
            id v17 = v15;
            id v33 = v17;
            unsigned int v18 = [v11 na_firstObjectPassingTest:v32];
            if (v18)
            {
              uint64_t v19 = v13;
              v20 = sub_100031A80();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                [v17 serviceID];
                v22 = v21 = v11;
                *(_DWORD *)long long buf = 138477827;
                uint64_t v41 = v22;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "A property on a known service (%{private}@) changed", buf, 0xCu);

                id v11 = v21;
                id v9 = v28;
              }

              [v9 removeObject:v18];
              uint64_t v13 = v19;
            }
            [v9 na_safeAddObject:v17];
          }
          else
          {
            id v23 = sub_100031A80();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              sub_10002898C(&v34, v35, v23);
            }

            if (a5)
            {
              *a5 = +[NSError errorWithDomain:v29 code:1 userInfo:0];
            }
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v12);
    }

    v24 = v11;
    id v7 = v27;
  }
  else
  {
    v24 = v8;
    id v25 = sub_100031A80();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[Public] Changed records is nil, skipping update", buf, 2u);
    }

    id v28 = v24;
  }

  return v28;
}

- (void)_clearAllDefaultsData
{
  v2 = +[MSDDefaultsManager sharedManager];
  [v2 clearObjectForDefault:@"publicDBData"];

  id v3 = +[MSDDefaultsManager sharedManager];
  [v3 clearObjectForDefault:@"publicDBChangeTokenMap"];
}

- (void)_updateLastRefreshTS
{
  id v4 = +[MSDDefaultsManager sharedManager];
  v2 = +[NSDate date];
  [v2 timeIntervalSinceReferenceDate];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v3 forDefault:@"publicDBLastRefreshTS"];
}

- (BOOL)shouldUseCloudKit
{
  v2 = +[MSDDefaultsManager sharedManager];
  id v3 = [v2 objectForDefault:@"publicDBLastRefreshTS"];
  [v3 doubleValue];
  double v5 = v4;

  id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v5];
  id v7 = +[NSDate date];
  id v8 = [v6 dateByAddingTimeInterval:MSPublicDatabaseRefreshIntervalInSecs];
  BOOL v9 = [v7 compare:v8] != (id)-1;

  return v9;
}

- (id)_fetchPreviousChangeToken:(id)a3
{
  id v3 = a3;
  double v4 = +[MSDDefaultsManager sharedManager];
  double v5 = [v4 objectForDefaultWithCustomClass:@"publicDBChangeTokenMap"];

  if (v5)
  {
    id v6 = [v5 objectForKey:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_updateDefaultsWithChangeToken:(id)a3 serverChangeToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MSDDefaultsManager sharedManager];
  id v8 = [v7 objectForDefaultWithCustomClass:@"publicDBChangeTokenMap"];
  id v9 = [v8 mutableCopy];

  if (!v9) {
    id v9 = (id)objc_opt_new();
  }
  [v9 na_safeSetObject:v6 forKey:v5];
  id v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138477827;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Public] Updating value of serverChangeToken %{private}@", (uint8_t *)&v13, 0xCu);
  }

  id v11 = +[MSDDefaultsManager sharedManager];
  id v12 = [v9 copy];
  [v11 setObjectWithCustomClass:v12 forDefault:@"publicDBChangeTokenMap"];
}

+ (void)_fetchData:(id)a3
{
  id v3 = a3;
  double v4 = +[MSDPublicDBManager shared];
  unsigned __int8 v5 = [v4 shouldUseCloudKit];

  if (v5)
  {
    id v6 = +[MSDPublicDBManager shared];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100027FD4;
    v10[3] = &unk_10004D558;
    id v11 = v3;
    [v6 syncDataWithCloudKit:v10];

    id v7 = v11;
LABEL_7:

    goto LABEL_8;
  }
  id v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Public] Returning data from cached copy, last refresh was less than 24 hours back", buf, 2u);
  }

  if (v3)
  {
    id v7 = +[MSDDefaultsManager sharedManager];
    id v9 = [v7 objectForDefaultWithCustomClass:@"publicDBData"];
    (*((void (**)(id, void *, void))v3 + 2))(v3, v9, 0);

    goto LABEL_7;
  }
LABEL_8:
}

+ (id)_getMatchingObjectForServiceID:(id)a3 serviceID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028118;
  v8[3] = &unk_10004CB60;
  id v9 = a4;
  id v5 = v9;
  id v6 = [a3 na_firstObjectPassingTest:v8];

  return v6;
}

+ (id)_getMatchingObjectForBundleID:(id)a3 bundleID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002820C;
  v8[3] = &unk_10004CB60;
  id v9 = a4;
  id v5 = v9;
  id v6 = [a3 na_firstObjectPassingTest:v8];

  return v6;
}

+ (id)_getMatchingObjectForServiceName:(id)a3 serviceName:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028300;
  v8[3] = &unk_10004CB60;
  id v9 = a4;
  id v5 = v9;
  id v6 = [a3 na_firstObjectPassingTest:v8];

  return v6;
}

- (void)executePendingRequests:(id)a3 forPublicDBInfo:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028428;
  block[3] = &unk_10004E128;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(notifyQueue, block);
}

- (void)_withLock:(id)a3
{
  p_syncLock = &self->_syncLock;
  double v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_syncLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_syncLock);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)isCurrentlySyncing
{
  return self->_isCurrentlySyncing;
}

- (void)setIsCurrentlySyncing:(BOOL)a3
{
  self->_isCurrentlySyncing = a3;
}

- (NSMutableArray)queuedPendingRequests
{
  return self->_queuedPendingRequests;
}

- (void)setQueuedPendingRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedPendingRequests, 0);

  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end