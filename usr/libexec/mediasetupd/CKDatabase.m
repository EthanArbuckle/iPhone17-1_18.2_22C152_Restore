@interface CKDatabase
- (BOOL)_attemptToRecordServiceRequestLapse:(id)a3 fromRecords:(id)a4;
- (id)_checkIfRecordZonePresentForUser:(id)a3;
- (id)_fetchPlaceholderRecordData:(id)a3 error:(id *)a4;
- (id)_fetchRefreshTokenForRecordZoneID:(id)a3;
- (id)_getOperationConfiguration;
- (id)_handleChangedRecords:(id)a3 andDeletedRecordIDS:(id)a4;
- (id)_handleChangesInChangedRecords:(id)a3 withDataInLocalCopy:(id)a4;
- (id)_handleDeletedRecordIDS:(id)a3 withDataInLocalCopy:(id)a4;
- (id)_handleRecordZonesChanged:(id)a3 deletedRecordZones:(id)a4;
- (id)operationConfiguration;
- (void)_addSubscriptionWithIdentifier:(id)a3 completion:(id)a4;
- (void)_checkShareStatusIfApplicable:(id)a3;
- (void)_deleteRecord:(id)a3 completion:(id)a4;
- (void)_handleCKErrorChangeTokenExpired:(id)a3 userInfo:(id)a4;
- (void)_handleManateeLossOnPrivateDatabase:(id)a3 homeUserID:(id)a4;
- (void)_handleManateeLossOnSharedDatabase:(id)a3 completion:(id)a4;
- (void)_notifyObserversDataChanged:(id)a3 cachedData:(id)a4;
- (void)_populateRecordZoneWithCachedInfo:(id)a3 cachedInfo:(id)a4;
- (void)_purgeDeletedZonesFromDefaults:(id)a3;
- (void)_saveRecordZone:(id)a3 withAttribution:(id)a4 andOptions:(id)a5 completion:(id)a6;
- (void)_serviceConfigInfoFor:(id)a3 homeUserIDS:(id)a4 serviceID:(id)a5 completion:(id)a6;
- (void)_updateDefaultService:(id)a3 serviceID:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)_updateServerChangeTokenMap:(id)a3 serverChangeToken:(id)a4;
- (void)_updateUserInfoToRecordZoneIDMap:(id)a3 userID:(id)a4;
- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6;
- (void)addSubscriptionForDatabaseWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteRecord:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)deleteRecordWithID:(id)a3 missingManateeIdentity:(BOOL)a4 withOptions:(id)a5 completion:(id)a6;
- (void)deleteRecordZone:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)fetchAllRecordsForRecordZoneID:(id)a3 userInfo:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)fetchRecordWithID:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)fetchRecordWithIDS:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 withAttribution:(id)a6 completion:(id)a7;
- (void)getAvailableServices:(id)a3 completion:(id)a4;
- (void)getDefaultMediaService:(id)a3 completion:(id)a4;
- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5;
- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserID:(id)a4;
- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserIDS:(id)a4;
- (void)modifyCKRecordWithRecordsToSave:(id)a3 recordIDSToDelete:(id)a4 missingManateeIdentity:(BOOL)a5 withAttribution:(id)a6 withOptions:(id)a7 completion:(id)a8;
- (void)refreshDatabase:(id)a3 completion:(id)a4;
- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)saveRecord:(id)a3 withAttribution:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)saveRecord:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)updateAuthRenewalForMediaService:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6;
@end

@implementation CKDatabase

- (void)addSubscriptionForDatabaseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)CKFetchSubscriptionsOperation);
  id v18 = v6;
  v9 = +[NSArray arrayWithObjects:&v18 count:1];
  id v10 = [v8 initWithSubscriptionIDs:v9];

  [v10 setQualityOfService:17];
  v11 = [(CKDatabase *)self _getOperationConfiguration];
  [v10 setConfiguration:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000029A4;
  v14[3] = &unk_10004C960;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  [v10 setFetchSubscriptionCompletionBlock:v14];
  [(CKDatabase *)self addOperation:v10];
}

- (void)_addSubscriptionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)CKNotificationInfo);
  [v8 setShouldSendContentAvailable:1];
  id v9 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:v7];

  [v9 setNotificationInfo:v8];
  if (v9)
  {
    id v10 = objc_alloc((Class)CKModifySubscriptionsOperation);
    id v17 = v9;
    v11 = +[NSArray arrayWithObjects:&v17 count:1];
    id v12 = [v10 initWithSubscriptionsToSave:v11 subscriptionIDsToDelete:0];

    [v12 setQualityOfService:17];
    id v13 = [(CKDatabase *)self _getOperationConfiguration];
    [v12 setConfiguration:v13];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100002DD0;
    v15[3] = &unk_10004C988;
    id v16 = v6;
    [v12 setModifySubscriptionsCompletionBlock:v15];
    [(CKDatabase *)self addOperation:v12];

LABEL_7:
    goto LABEL_8;
  }
  v14 = sub_100031A80();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100002F20(v14);
  }

  if (v6)
  {
    id v12 = +[NSError errorWithDomain:MSErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_getOperationConfiguration
{
  v2 = objc_opt_new();

  return v2;
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc((Class)MSServiceEvent);
  id v15 = [v10 serviceID];
  id v16 = [v14 initWithEventType:0 serviceID:v15];

  id v17 = [v16 stopwatch];
  [v17 start];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100006F48;
  v33[3] = &unk_10004CB38;
  id v34 = v16;
  id v18 = v16;
  v19 = objc_retainBlock(v33);
  v20 = +[MSDPublicDBManager shared];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100006FD0;
  v26[3] = &unk_10004CC28;
  id v31 = v19;
  id v32 = v13;
  id v27 = v10;
  id v28 = v11;
  v29 = self;
  id v30 = v12;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  v24 = v19;
  id v25 = v10;
  [v20 syncDataWithCloudKit:v26];
}

- (void)getAvailableServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = objc_alloc_init(MSDFetchCKDataOptions);
    [(MSDFetchCKDataOptions *)v8 setCreateNewZoneIfMissing:0];
    [(MSDFetchCKDataOptions *)v8 setUserInitiatedRequest:1];
    id v9 = [v6 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey];
    id v10 = [v6 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100007E50;
    v15[3] = &unk_10004CC78;
    id v18 = v7;
    void v15[4] = self;
    id v16 = v6;
    id v17 = v8;
    id v11 = v8;
    [(CKDatabase *)self fetchRecordZoneFor:v9 user:v10 withOptions:v11 completion:v15];

    id v12 = v18;
LABEL_8:

    goto LABEL_9;
  }
  id v13 = sub_100031A80();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10000DA28();
  }

  if (v7)
  {
    uint64_t v14 = MSErrorDomain;
    uint64_t v19 = MSUserInfoErrorStringKey;
    CFStringRef v20 = @"Failed to fetch available services, NIL HomeID and HomeUserID";
    id v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v12 = +[NSError errorWithDomain:v14 code:1 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    objc_initWeak(&location, self);
    id v11 = objc_alloc_init(MSDFetchCKDataOptions);
    [(MSDFetchCKDataOptions *)v11 setCreateNewZoneIfMissing:0];
    [(MSDFetchCKDataOptions *)v11 setUserInitiatedRequest:1];
    id v12 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey];
    id v13 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100008754;
    v17[3] = &unk_10004CCC8;
    id v20 = v10;
    objc_copyWeak(&v21, &location);
    id v18 = v8;
    id v19 = v9;
    [(CKDatabase *)self fetchRecordZoneFor:v12 user:v13 withOptions:v11 completion:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = sub_100031A80();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000DAD4();
    }

    if (v10)
    {
      uint64_t v23 = MSUserInfoErrorStringKey;
      CFStringRef v24 = @"Failed to update default service, NIL HomeID and HomeUserID";
      id v15 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v16 = +[NSError errorWithDomain:MSErrorDomain code:1 userInfo:v15];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
    }
  }
}

- (void)_updateDefaultService:(id)a3 serviceID:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008A44;
  v18[3] = &unk_10004CD18;
  id v14 = v10;
  id v19 = v14;
  id v15 = v13;
  id v22 = v15;
  objc_copyWeak(&v23, &location);
  id v16 = v12;
  id v20 = v16;
  id v17 = v11;
  id v21 = v17;
  [(CKDatabase *)self fetchRecordWithID:v14 completionHandler:v18];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)getDefaultMediaService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = objc_alloc((Class)NSUUID);
    id v9 = [v6 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey];
    id v10 = [v8 initWithUUIDString:v9];

    id v11 = [v6 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    objc_initWeak(&location, self);
    id v12 = objc_alloc_init(MSDFetchCKDataOptions);
    [(MSDFetchCKDataOptions *)v12 setCreateNewZoneIfMissing:0];
    [(MSDFetchCKDataOptions *)v12 setUserInitiatedRequest:1];
    id v13 = [v10 UUIDString];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000090F4;
    v17[3] = &unk_10004CD68;
    id v21 = v7;
    objc_copyWeak(&v22, &location);
    id v18 = v6;
    id v14 = v12;
    id v19 = v14;
    id v15 = v11;
    id v20 = v15;
    [(CKDatabase *)self fetchRecordZoneFor:v13 user:v15 withOptions:v14 completion:v17];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
LABEL_8:

    goto LABEL_9;
  }
  id v16 = sub_100031A80();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10000DBC8();
  }

  if (v7)
  {
    uint64_t v24 = MSUserInfoErrorStringKey;
    CFStringRef v25 = @"Failed to fetch default media service, NIL HomeID and HomeUserID";
    id v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v15 = +[NSError errorWithDomain:MSErrorDomain code:1 userInfo:v10];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    id v11 = objc_alloc_init(MSDFetchCKDataOptions);
    [(MSDFetchCKDataOptions *)v11 setCreateNewZoneIfMissing:0];
    [(MSDFetchCKDataOptions *)v11 setUserInitiatedRequest:1];
    id v12 = objc_alloc((Class)MSServiceEvent);
    id v13 = [v8 serviceID];
    id v14 = [v12 initWithEventType:1 serviceID:v13];

    id v15 = [v14 stopwatch];
    [v15 start];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100009B64;
    v30[3] = &unk_10004CB38;
    id v31 = v14;
    id v16 = v14;
    id v17 = objc_retainBlock(v30);
    id v18 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey];
    id v19 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100009BEC;
    v24[3] = &unk_10004CE30;
    id v28 = v17;
    id v29 = v10;
    v24[4] = self;
    id v25 = v9;
    v26 = v11;
    id v27 = v8;
    id v20 = v11;
    id v21 = v17;
    [(CKDatabase *)self fetchRecordZoneFor:v18 user:v19 withOptions:v20 completion:v24];

LABEL_8:
    goto LABEL_9;
  }
  id v22 = sub_100031A80();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to remove service, NIL HomeID and NIL HomeUserID", buf, 2u);
  }

  if (v10)
  {
    uint64_t v23 = MSErrorDomain;
    uint64_t v33 = MSUserInfoErrorStringKey;
    CFStringRef v34 = @"Failed to remove service, NIL HomeID and HomeUserID";
    id v16 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v20 = +[NSError errorWithDomain:v23 code:1 userInfo:v16];
    (*((void (**)(id, void, MSDFetchCKDataOptions *))v10 + 2))(v10, 0, v20);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_deleteRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315395;
    id v14 = "-[CKDatabase(MediaService) _deleteRecord:completion:]";
    __int16 v15 = 2113;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Attempting to delete record %{private}@", buf, 0x16u);
  }

  id v9 = objc_alloc_init(MSDFetchCKDataOptions);
  [(MSDFetchCKDataOptions *)v9 setUserInitiatedRequest:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A900;
  v11[3] = &unk_10004CCA0;
  id v12 = v7;
  id v10 = v7;
  [(CKDatabase *)self deleteRecord:v6 withOptions:v9 completion:v11];
}

- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12 && [v12 count])
  {
    id v14 = objc_alloc_init(MSDFetchCKDataOptions);
    [(MSDFetchCKDataOptions *)v14 setCreateNewZoneIfMissing:0];
    [(MSDFetchCKDataOptions *)v14 setUserInitiatedRequest:1];
    __int16 v15 = [v12 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey];
    id v16 = [v12 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000AB84;
    v20[3] = &unk_10004CEA8;
    id v25 = v13;
    id v21 = v10;
    id v22 = self;
    id v23 = v12;
    id v24 = v11;
    [(CKDatabase *)self fetchRecordZoneFor:v15 user:v16 withOptions:v14 completion:v20];

    id v17 = v25;
LABEL_8:

    goto LABEL_9;
  }
  id v18 = sub_100031A80();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10000DCA0();
  }

  if (v13)
  {
    uint64_t v19 = MSErrorDomain;
    uint64_t v26 = MSUserInfoErrorStringKey;
    CFStringRef v27 = @"Failed to updateProperty, NIL HomeID and HomeUserID";
    id v14 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v17 = +[NSError errorWithDomain:v19 code:1 userInfo:v14];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v17);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    id v11 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000B3B8;
    v14[3] = &unk_10004CF38;
    void v14[4] = self;
    id v15 = v8;
    id v17 = v10;
    id v16 = v9;
    [v11 setFetchRecordZonesCompletionBlock:v14];
    [v11 setQualityOfService:25];
    [(CKDatabase *)self addOperation:v11];

LABEL_6:
    goto LABEL_7;
  }
  if (v10)
  {
    uint64_t v12 = MSErrorDomain;
    uint64_t v18 = MSUserInfoErrorStringKey;
    CFStringRef v19 = @"Failed to fetch service config info, HomeUserIDS cannot be nil";
    id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v13 = +[NSError errorWithDomain:v12 code:1 userInfo:v11];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);

    goto LABEL_6;
  }
LABEL_7:
}

- (void)_serviceConfigInfoFor:(id)a3 homeUserIDS:(id)a4 serviceID:(id)a5 completion:(id)a6
{
  id v27 = a3;
  id v31 = a4;
  id v9 = a5;
  id v10 = a6;
  if (v10)
  {
    if (v9)
    {
      v47[0] = 0;
      v47[1] = v47;
      v47[2] = 0x3032000000;
      v47[3] = sub_1000075FC;
      v47[4] = sub_10000760C;
      id v48 = 0;
      id v11 = objc_opt_new();
      uint64_t v26 = v10;
      uint64_t v12 = [v9 UUIDString];
      id v29 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v12];

      id v13 = dispatch_group_create();
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v27;
      id v14 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v44;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v44 != v15) {
              objc_enumerationMutation(obj);
            }
            id v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v18 = objc_alloc((Class)CKRecordID);
            CFStringRef v19 = [v9 UUIDString];
            id v20 = [v17 zoneID];
            id v21 = [v18 initWithRecordName:v19 zoneID:v20];

            id v22 = sub_100031A80();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fetching records for recordID: %@", buf, 0xCu);
            }

            dispatch_group_enter(v13);
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_10000BABC;
            v36[3] = &unk_10004CF60;
            id v37 = v31;
            v38 = v13;
            id v39 = v9;
            id v40 = v29;
            id v41 = v11;
            v42 = v47;
            [(CKDatabase *)self fetchRecordWithID:v21 withOptions:0 completion:v36];
          }
          id v14 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v14);
      }

      id v23 = dispatch_get_global_queue(33, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000BCE0;
      block[3] = &unk_10004CF88;
      id v33 = v11;
      id v34 = v26;
      v35 = v47;
      id v24 = v11;
      dispatch_group_notify(v13, v23, block);

      _Block_object_dispose(v47, 8);
      id v10 = v26;
    }
    else
    {
      id v25 = +[NSError errorWithDomain:MSErrorDomain code:1 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v25);
    }
  }
}

- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    if (v9 && [v9 count])
    {
      id v11 = objc_alloc_init(MSDFetchCKDataOptions);
      [(MSDFetchCKDataOptions *)v11 setCreateNewZoneIfMissing:0];
      [(MSDFetchCKDataOptions *)v11 setUserInitiatedRequest:0];
      uint64_t v12 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey];
      id v13 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10000BFA8;
      v27[3] = &unk_10004CC78;
      id v31 = v10;
      id v28 = v8;
      id v29 = self;
      id v30 = v11;
      id v14 = v11;
      [(CKDatabase *)self fetchRecordZoneFor:v12 user:v13 withOptions:v14 completion:v27];

      uint64_t v15 = v31;
LABEL_13:

      goto LABEL_14;
    }
    CFStringRef v19 = sub_100031A80();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10000DDA4(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    if (v10)
    {
      uint64_t v16 = MSErrorDomain;
      uint64_t v32 = MSUserInfoErrorStringKey;
      CFStringRef v33 = @"Failed to remove services, NIL identifiers passed";
      id v17 = &v33;
      id v18 = &v32;
      goto LABEL_12;
    }
  }
  else if (v10)
  {
    uint64_t v16 = MSErrorDomain;
    uint64_t v34 = MSUserInfoErrorStringKey;
    CFStringRef v35 = @"ServiceIDs specified is nil";
    id v17 = &v35;
    id v18 = &v34;
LABEL_12:
    id v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18 count:1];
    uint64_t v15 = +[NSError errorWithDomain:v16 code:1 userInfo:v14];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
    goto LABEL_13;
  }
LABEL_14:
}

- (void)updateAuthRenewalForMediaService:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    if (v8)
    {
      id v11 = sub_100031A80();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v8 authCredential];
        id v13 = [v8 authConfiguration];
        *(_DWORD *)buf = 138478083;
        id v28 = v12;
        __int16 v29 = 2113;
        id v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating CloudKit with AuthCredential %{private}@, AuthConfig %{private}@", buf, 0x16u);
      }
      id v14 = objc_alloc_init(MSDFetchCKDataOptions);
      [(MSDFetchCKDataOptions *)v14 setCreateNewZoneIfMissing:0];
      [(MSDFetchCKDataOptions *)v14 setUserInitiatedRequest:1];
      uint64_t v15 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey];
      uint64_t v16 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000C660;
      v22[3] = &unk_10004CC78;
      id v26 = v10;
      id v23 = v8;
      uint64_t v24 = self;
      uint64_t v25 = v14;
      id v17 = v14;
      [(CKDatabase *)self fetchRecordZoneFor:v15 user:v16 withOptions:v17 completion:v22];

      id v18 = v26;
      goto LABEL_10;
    }
    if (!v10) {
      goto LABEL_11;
    }
    uint64_t v19 = MSErrorDomain;
    uint64_t v31 = MSUserInfoErrorStringKey;
    CFStringRef v32 = @"Failed to updateAuthRenewalInfo, NIL MediaService";
    uint64_t v20 = &v32;
    uint64_t v21 = &v31;
LABEL_9:
    id v17 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v21 count:1];
    id v18 = +[NSError errorWithDomain:v19 code:1 userInfo:v17];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
LABEL_10:

    goto LABEL_11;
  }
  if (v10)
  {
    uint64_t v19 = MSErrorDomain;
    uint64_t v33 = MSUserInfoErrorStringKey;
    CFStringRef v34 = @"Failed to updateAuthRenewalInfo, NIL UserInfo";
    uint64_t v20 = &v34;
    uint64_t v21 = &v33;
    goto LABEL_9;
  }
LABEL_11:
}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = sub_1000075FC;
    void v30[4] = sub_10000760C;
    id v31 = 0;
    id v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000CE8C;
    v26[3] = &unk_10004D068;
    __int16 v29 = v30;
    uint64_t v15 = v14;
    id v27 = v15;
    id v16 = v10;
    id v28 = v16;
    +[MSAuthTokenProvider fetchAuthTokensForMediaService:v16 networkActivity:0 completion:v26];
    id v17 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D01C;
    block[3] = &unk_10004D150;
    uint64_t v25 = v30;
    id v24 = v13;
    void block[4] = self;
    id v21 = v11;
    id v22 = v12;
    id v23 = v16;
    dispatch_group_notify(v15, v17, block);

    _Block_object_dispose(v30, 8);
  }
  else
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"Failed to switch User Account Info, NIL attributes provided";
    id v18 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v19 = +[NSError errorWithDomain:MSErrorDomain code:1 userInfo:v18];
    (*((void (**)(id, void *))v13 + 2))(v13, v19);
  }
}

- (void)refreshDatabase:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [(CKDatabase *)self databaseScope];
    id v9 = CKDatabaseScopeString();
    *(_DWORD *)buf = 136315395;
    NSErrorUserInfoKey v32 = "-[CKDatabase(MSDCloudDatabase) refreshDatabase:completion:]";
    __int16 v33 = 2113;
    CFStringRef v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s databaseScope %{private}@", buf, 0x16u);
  }
  if ((id)[(CKDatabase *)self databaseScope] == (id)3) {
    CFStringRef v10 = @"sharedDatabaseChangesKey";
  }
  else {
    CFStringRef v10 = @"privateDatabaseChangesKey";
  }
  id v11 = +[MSDDefaultsManager sharedManager];
  id v12 = [v11 objectForDefaultWithCustomClass:v10];

  id v13 = objc_opt_new();
  id v14 = objc_opt_new();
  id v15 = [objc_alloc((Class)CKFetchDatabaseChangesOperation) initWithPreviousServerChangeToken:v12];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100028E70;
  v26[3] = &unk_10004E1A8;
  void v26[4] = self;
  id v30 = v6;
  id v16 = v13;
  id v27 = v16;
  id v17 = v14;
  id v28 = v17;
  __int16 v29 = (__CFString *)v10;
  id v18 = v6;
  [v15 setFetchDatabaseChangesCompletionBlock:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100029098;
  v24[3] = &unk_10004E1D0;
  id v25 = v16;
  id v19 = v16;
  [v15 setRecordZoneWithIDChangedBlock:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000290A4;
  v22[3] = &unk_10004E1D0;
  id v23 = v17;
  id v20 = v17;
  [v15 setRecordZoneWithIDWasDeletedBlock:v22];
  LODWORD(v17) = [v7 userInitiatedRequest];

  if (v17)
  {
    [v15 setQualityOfService:25];
  }
  else
  {
    [v15 setQualityOfService:17];
    id v21 = [(CKDatabase *)self operationConfiguration];
    [v15 setConfiguration:v21];
  }
  [(CKDatabase *)self addOperation:v15];
}

- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 completion:(id)a6
{
}

- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 withAttribution:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void *, void))a7;
  id v17 = sub_100031A80();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v33 = v13;
    __int16 v34 = 2113;
    id v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetching Zone for HomeUserID: %{private}@, options: %{private}@", buf, 0x16u);
  }

  id v18 = [(CKDatabase *)self _checkIfRecordZonePresentForUser:v13];
  id v19 = sub_100031A80();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      id v21 = [v18 zoneID];
      *(_DWORD *)buf = 138478083;
      id v33 = v21;
      __int16 v34 = 2113;
      id v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "RecordZone %{private}@ for user %{private}@", buf, 0x16u);
    }
    if (v16) {
      v16[2](v16, v18, 0);
    }
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Possibly missing cached value on device, checking with CloudKit", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    id v22 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
    MSDUpdateCKOperationForAttribution(v22, v15);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100029440;
    v25[3] = &unk_10004E2B8;
    id v30 = v16;
    v25[4] = self;
    id v26 = v13;
    objc_copyWeak(&v31, (id *)buf);
    id v27 = v12;
    id v23 = v14;
    id v28 = v23;
    id v29 = v15;
    [v22 setFetchRecordZonesCompletionBlock:v25];
    if ([v23 userInitiatedRequest])
    {
      [v22 setQualityOfService:25];
    }
    else
    {
      [v22 setQualityOfService:17];
      id v24 = [(CKDatabase *)self operationConfiguration];
      [v22 setConfiguration:v24];
    }
    [(CKDatabase *)self addOperation:v22];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
}

- (id)_checkIfRecordZonePresentForUser:(id)a3
{
  id v3 = a3;
  v4 = +[MSDDefaultsManager sharedManager];
  v5 = [v4 objectForDefaultWithCustomClass:@"kUserIDToRecordZoneIDMap"];

  if (v5 && ([v5 objectForKey:v3], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    id v8 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_updateUserInfoToRecordZoneIDMap:(id)a3 userID:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  uint64_t v6 = +[MSDDefaultsManager sharedManager];
  id v7 = [v6 objectForDefaultWithCustomClass:@"kUserIDToRecordZoneIDMap"];
  id v8 = [v7 mutableCopy];

  if (![v8 count])
  {
    uint64_t v9 = objc_opt_new();

    id v8 = (id)v9;
  }
  [v8 setObject:v12 forKey:v5];
  CFStringRef v10 = +[MSDDefaultsManager sharedManager];
  id v11 = [v8 copy];
  [v10 setObjectWithCustomClass:v11 forDefault:@"kUserIDToRecordZoneIDMap"];
}

- (void)deleteRecordZone:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc((Class)CKModifyRecordZonesOperation);
  id v18 = v8;
  id v12 = +[NSArray arrayWithObjects:&v18 count:1];
  id v13 = [v11 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002A91C;
  v16[3] = &unk_10004C988;
  id v17 = v9;
  id v14 = v9;
  [v13 setModifyRecordZonesCompletionBlock:v16];
  LODWORD(v12) = [v10 userInitiatedRequest];

  if (v12)
  {
    [v13 setQualityOfService:25];
  }
  else
  {
    [v13 setQualityOfService:17];
    id v15 = [(CKDatabase *)self operationConfiguration];
    [v13 setConfiguration:v15];
  }
  [(CKDatabase *)self addOperation:v13];
}

- (void)fetchRecordWithID:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v17 = v8;
    id v11 = +[NSArray arrayWithObjects:&v17 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002AB68;
    v14[3] = &unk_10004E2E0;
    id v16 = v10;
    id v15 = v8;
    [(CKDatabase *)self fetchRecordWithIDS:v11 withOptions:v9 completion:v14];

    id v12 = v16;
LABEL_7:

    goto LABEL_8;
  }
  id v13 = sub_100031A80();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100031044();
  }

  if (v10)
  {
    id v12 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchRecordWithIDS:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    id v11 = [objc_alloc((Class)CKFetchRecordsOperation) initWithRecordIDs:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002ADB8;
    v14[3] = &unk_10004D660;
    id v15 = v10;
    [v11 setFetchRecordsCompletionBlock:v14];
    if ([v9 userInitiatedRequest])
    {
      [v11 setQualityOfService:25];
    }
    else
    {
      [v11 setQualityOfService:17];
      id v13 = [(CKDatabase *)self operationConfiguration];
      [v11 setConfiguration:v13];
    }
    [(CKDatabase *)self addOperation:v11];

    goto LABEL_11;
  }
  id v12 = sub_100031A80();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100031078();
  }

  if (v10)
  {
    id v11 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v11);
LABEL_11:
  }
}

- (void)fetchAllRecordsForRecordZoneID:(id)a3 userInfo:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v32 = a4;
  id v31 = a5;
  id v11 = a6;
  if (v10)
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_100029E08;
    v53[4] = sub_100029E18;
    id v54 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = sub_100029E08;
    v51[4] = sub_100029E18;
    id v52 = (id)objc_opt_new();
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = sub_100029E08;
    v49[4] = sub_100029E18;
    id v50 = (id)objc_opt_new();
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = sub_100029E08;
    v47[4] = sub_100029E18;
    id v48 = 0;
    id v12 = [objc_alloc((Class)MSServiceEvent) initWithEventType:2];
    id v13 = [v12 stopwatch];
    [v13 start];

    if ((id)[(CKDatabase *)self databaseScope] == (id)3) {
      CFStringRef v14 = @"sharedDatabaseData";
    }
    else {
      CFStringRef v14 = @"privateDatabaseData";
    }
    id v15 = -[CKDatabase _fetchRefreshTokenForRecordZoneID:](self, "_fetchRefreshTokenForRecordZoneID:", v10, v31);
    id v16 = sub_100031A80();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      v57 = "-[CKDatabase(MSDCloudDatabase) fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:]";
      __int16 v58 = 2113;
      v59 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Passing Config information %{private}@", buf, 0x16u);
    }

    id v17 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
    id v55 = v10;
    id v18 = +[NSArray arrayWithObjects:&v55 count:1];
    id v19 = [v17 initWithRecordZoneIDs:v18 configurationsByRecordZoneID:v15];

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10002B3CC;
    v36[3] = &unk_10004E3A8;
    id v20 = v12;
    long long v43 = v53;
    id v37 = v20;
    v38 = self;
    id v39 = v10;
    id v40 = v32;
    id v41 = (__CFString *)v14;
    id v42 = v11;
    long long v44 = v51;
    long long v45 = v49;
    long long v46 = v47;
    [v19 setFetchRecordZoneChangesCompletionBlock:v36];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002BD54;
    v35[3] = &unk_10004E3D0;
    v35[4] = self;
    v35[5] = v53;
    v35[6] = v51;
    v35[7] = v49;
    v35[8] = v47;
    [v19 setRecordZoneFetchCompletionBlock:v35];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10002BFD0;
    v34[3] = &unk_10004E3F8;
    v34[4] = self;
    v34[5] = v49;
    [v19 setRecordWithIDWasDeletedBlock:v34];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002C0E0;
    v33[3] = &unk_10004E420;
    void v33[4] = self;
    v33[5] = v51;
    [v19 setRecordWasChangedBlock:v33];
    if ([v31 userInitiatedRequest])
    {
      [v19 setQualityOfService:25];
    }
    else
    {
      [v19 setQualityOfService:17];
      id v30 = [(CKDatabase *)self operationConfiguration];
      [v19 setConfiguration:v30];
    }
    [(CKDatabase *)self addOperation:v19];

    _Block_object_dispose(v47, 8);
    _Block_object_dispose(v49, 8);

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    id v21 = sub_100031A80();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000310AC(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    if (v11)
    {
      id v29 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v29);
    }
  }
}

- (id)_handleRecordZonesChanged:(id)a3 deletedRecordZones:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count]) {
    [(CKDatabase *)self _purgeDeletedZonesFromDefaults:v7];
  }
  id v18 = v7;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_100029E08;
  id v31 = sub_100029E18;
  id v32 = 0;
  id v8 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    int64_t v11 = 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10002C520;
        v20[3] = &unk_10004E448;
        void v20[4] = v13;
        v20[5] = self;
        uint64_t v22 = &v27;
        CFStringRef v14 = v8;
        id v21 = v14;
        -[CKDatabase fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:](self, "fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:", v13, 0, 0, v20, v18);
        dispatch_time_t v15 = dispatch_time(0, v11);
        dispatch_group_wait(v14, v15);
      }
      id v9 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v9);
  }

  id v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

- (void)_purgeDeletedZonesFromDefaults:(id)a3
{
  id v4 = a3;
  if ((id)[(CKDatabase *)self databaseScope] == (id)3) {
    CFStringRef v5 = @"sharedDatabaseData";
  }
  else {
    CFStringRef v5 = @"privateDatabaseData";
  }
  id v6 = [v4 na_map:&stru_10004E488];
  id v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Purging recordZoneData with recordZoneNames %{private}@", buf, 0xCu);
  }

  id v8 = +[MSDDefaultsManager sharedManager];
  id v9 = [v8 objectForDefaultWithCustomClass:v5];
  id v10 = [v9 mutableCopy];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10002CAFC;
  v38[3] = &unk_10004CA98;
  id v11 = v6;
  id v39 = v11;
  id v32 = [v10 na_filter:v38];
  [v10 removeObjectsInArray:];
  id v12 = sub_100031A80();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    [(CKDatabase *)self databaseScope];
    uint64_t v13 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412547;
    id v41 = v13;
    __int16 v42 = 2113;
    id v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@] Updating Data in defaults after recordZone deleted %{private}@", buf, 0x16u);
  }
  CFStringRef v14 = +[MSDDefaultsManager sharedManager];
  [v14 setObjectWithCustomClass:v10 forDefault:v5];

  if ((id)[(CKDatabase *)self databaseScope] == (id)3) {
    CFStringRef v15 = @"sharedDatabaseKeyRefreshTokens";
  }
  else {
    CFStringRef v15 = @"privateDatabaseKeyRefreshTokens";
  }
  id v16 = +[MSDDefaultsManager sharedManager];
  id v17 = [v16 objectForDefaultWithCustomClass:v15];
  id v18 = [v17 mutableCopy];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10002CB44;
  v36[3] = &unk_10004E4B0;
  id v19 = v11;
  id v37 = v19;
  id v20 = [v18 na_map:v36];
  [v18 removeObjectsForKeys:v20];
  id v21 = sub_100031A80();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    [(CKDatabase *)self databaseScope];
    uint64_t v22 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412547;
    id v41 = v22;
    __int16 v42 = 2113;
    id v43 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%@] Updating Server tokens in defaults after recordZone deleted %{private}@", buf, 0x16u);
  }
  long long v23 = +[MSDDefaultsManager sharedManager];
  [v23 setObjectWithCustomClass:v18 forDefault:v15];

  long long v24 = +[MSDDefaultsManager sharedManager];
  long long v25 = [v24 objectForDefaultWithCustomClass:@"kUserIDToRecordZoneIDMap"];
  id v26 = [v25 mutableCopy];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10002CBA4;
  v33[3] = &unk_10004E500;
  id v34 = v4;
  id v27 = (id)objc_opt_new();
  id v35 = v27;
  id v28 = v4;
  [v26 na_each:v33];
  [v26 removeObjectsForKeys:v27];
  uint64_t v29 = sub_100031A80();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    [(CKDatabase *)self databaseScope];
    id v30 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412547;
    id v41 = v30;
    __int16 v42 = 2113;
    id v43 = v26;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%@] Updating the UserIDToRecordZoneID Map to %{private}@", buf, 0x16u);
  }
  id v31 = +[MSDDefaultsManager sharedManager];
  [v31 setObjectWithCustomClass:v26 forDefault:@"kUserIDToRecordZoneIDMap"];
}

- (void)_saveRecordZone:(id)a3 withAttribution:(id)a4 andOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    id v14 = objc_alloc((Class)CKModifyRecordZonesOperation);
    id v22 = v10;
    CFStringRef v15 = +[NSArray arrayWithObjects:&v22 count:1];
    id v16 = [v14 initWithRecordZonesToSave:v15 recordZoneIDsToDelete:0];

    MSDUpdateCKOperationForAttribution(v16, v11);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002CF5C;
    v19[3] = &unk_10004C988;
    id v20 = v13;
    [v16 setModifyRecordZonesCompletionBlock:v19];
    if ([v12 userInitiatedRequest])
    {
      [v16 setQualityOfService:25];
    }
    else
    {
      [v16 setQualityOfService:17];
      id v18 = [(CKDatabase *)self operationConfiguration];
      [v16 setConfiguration:v18];
    }
    [(CKDatabase *)self addOperation:v16];

    goto LABEL_10;
  }
  id v17 = sub_100031A80();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to save recordZone - NIL CKRecordZone", buf, 2u);
  }

  if (v13)
  {
    id v16 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v16);
LABEL_10:
  }
}

- (id)_handleChangedRecords:(id)a3 andDeletedRecordIDS:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(CKDatabase *)self databaseScope] == (id)3) {
    CFStringRef v8 = @"sharedDatabaseData";
  }
  else {
    CFStringRef v8 = @"privateDatabaseData";
  }
  id v9 = +[MSDDefaultsManager sharedManager];
  id v10 = [v9 objectForDefaultWithCustomClass:v8];

  if (v10 && [v10 count]) {
    id v11 = v10;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;
  id v13 = [v7 count];
  if (v10) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    uint64_t v15 = [(CKDatabase *)self _handleDeletedRecordIDS:v7 withDataInLocalCopy:v10];

    id v12 = (void *)v15;
  }
  if ([v6 count])
  {
    uint64_t v16 = [(CKDatabase *)self _handleChangesInChangedRecords:v6 withDataInLocalCopy:v12];

    id v12 = (void *)v16;
  }

  return v12;
}

- (id)_handleDeletedRecordIDS:(id)a3 withDataInLocalCopy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v24 = +[NSMutableArray arrayWithArray:v6];
    id v22 = v6;
    id v7 = [v6 na_dictionaryWithKeyGenerator:&stru_10004E540];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          BOOL v14 = [v13 recordName];
          uint64_t v15 = [v13 zoneID];
          uint64_t v16 = [v15 zoneName];
          id v17 = +[NSString stringWithFormat:@"%@ %@", v14, v16];

          id v18 = [v7 allKeys];
          LODWORD(v14) = [v18 containsObject:v17];

          if (v14)
          {
            id v19 = sub_100031A80();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              id v30 = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found match for %{private}@, removing obj from default", buf, 0xCu);
            }

            id v20 = [v7 objectForKey:v17];
            [v24 removeObject:v20];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v10);
    }

    id v6 = v22;
    id v5 = v23;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)_handleChangesInChangedRecords:(id)a3 withDataInLocalCopy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = +[NSMutableArray arrayWithArray:v6];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v34 = v5;
    id obj = v5;
    id v43 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
    if (v43)
    {
      uint64_t v41 = MSHomeParticipantHomeIdentifier;
      uint64_t v42 = *(void *)v52;
      uint64_t v40 = MSHomeParticipantHomeUserIdentifier;
      uint64_t v38 = MSDefaultServiceRecordType;
      id v35 = v7;
      id v36 = v6;
      while (2)
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v52 != v42) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v10 = objc_alloc((Class)NSUUID);
          uint64_t v11 = [v9 recordFieldForKey:v41];
          id v12 = [v10 initWithUUIDString:v11];

          id v13 = objc_alloc((Class)NSUUID);
          BOOL v14 = [v9 recordFieldForKey:v40];
          id v15 = [v13 initWithUUIDString:v14];

          uint64_t v16 = [v9 createMediaServiceObjectFromRecord];
          if (v16)
          {
            id v17 = [objc_alloc((Class)MSDDefaultsInfo) initWithService:v16 homeID:v12 homeUserID:v15];
            if (v17)
            {
              id v18 = [v9 recordID];
              id v19 = [v18 recordName];
              [v17 setRecordName:v19];

              id v20 = [v9 recordType];
              [v17 setRecordType:v20];

              id v21 = [v9 recordID];
              id v22 = [v21 zoneID];
              id v23 = [v22 zoneName];
              [v17 setRecordZoneName:v23];

              id v24 = [v17 recordType];
              LODWORD(v22) = [v24 isEqualToString:v38];

              if (v22)
              {
                v46[0] = _NSConcreteStackBlock;
                v46[1] = 3221225472;
                v46[2] = sub_10002D9F8;
                v46[3] = &unk_10004CB10;
                id v47 = v15;
                id v48 = v17;
                long long v25 = [v6 na_firstObjectPassingTest:v46];

                long long v26 = &v47;
              }
              else
              {
                v44[0] = _NSConcreteStackBlock;
                v44[1] = 3221225472;
                v44[2] = sub_10002DAC4;
                v44[3] = &unk_10004CA98;
                long long v45 = v17;
                long long v25 = [v6 na_firstObjectPassingTest:v44];
                long long v26 = (id *)&v45;
              }

              if (v25)
              {
                long long v28 = sub_100031A80();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v29 = [v25 recordType];
                  id v37 = [v25 service];
                  id v30 = [v37 serviceID];
                  id v31 = [v25 homeUserID];
                  *(_DWORD *)buf = 138478595;
                  v56 = v29;
                  __int16 v57 = 2113;
                  __int16 v58 = v30;
                  __int16 v59 = 2113;
                  v60 = v31;
                  __int16 v61 = 2113;
                  v62 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "A property on a known service changed (RecordType: %{private}@, ServiceID: %{private}@, homeUserID: %{private}@) | Updating cachedInfo with %{private}@", buf, 0x2Au);

                  id v6 = v36;
                  id v7 = v35;
                }
                [v7 removeObject:v25];
              }
              [v7 na_safeAddObject:v17];
              int v27 = 0;
            }
            else
            {
              long long v25 = sub_100031A80();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                sub_1000314C8(&v49, v50, v25);
              }
              int v27 = 1;
            }
          }
          else
          {
            id v17 = sub_100031A80();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100031438(v63, v9, &v64, v17);
            }
            int v27 = 1;
          }

          if (v27)
          {

            id v32 = 0;
            goto LABEL_29;
          }
        }
        id v43 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
        if (v43) {
          continue;
        }
        break;
      }
    }

    id v32 = [v7 copy];
LABEL_29:

    id v5 = v34;
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

- (void)saveRecord:(id)a3 withOptions:(id)a4 completion:(id)a5
{
}

- (void)saveRecord:(id)a3 withAttribution:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    id v19 = v10;
    BOOL v14 = +[NSArray arrayWithObjects:&v19 count:1];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002DE30;
    v17[3] = &unk_10004C988;
    id v18 = v13;
    [(CKDatabase *)self modifyCKRecordWithRecordsToSave:v14 recordIDSToDelete:0 missingManateeIdentity:0 withAttribution:v11 withOptions:v12 completion:v17];

    id v15 = v18;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v16 = sub_100031A80();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100031508();
  }

  if (v13)
  {
    id v15 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v15);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)deleteRecord:(id)a3 withOptions:(id)a4 completion:(id)a5
{
}

- (void)deleteRecordWithID:(id)a3 missingManateeIdentity:(BOOL)a4 withOptions:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    id v19 = v10;
    id v13 = +[NSArray arrayWithObjects:&v19 count:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002E090;
    v16[3] = &unk_10004C988;
    id v17 = v12;
    [(CKDatabase *)self modifyCKRecordWithRecordsToSave:0 recordIDSToDelete:v13 missingManateeIdentity:v8 withAttribution:0 withOptions:v11 completion:v16];

    BOOL v14 = v17;
LABEL_7:

    goto LABEL_8;
  }
  id v15 = sub_100031A80();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to delete record - NIL CKRecordID", buf, 2u);
  }

  if (v12)
  {
    BOOL v14 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)modifyCKRecordWithRecordsToSave:(id)a3 recordIDSToDelete:(id)a4 missingManateeIdentity:(BOOL)a5 withAttribution:(id)a6 withOptions:(id)a7 completion:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v14 count] || objc_msgSend(v15, "count"))
  {
    if (v11)
    {
      id v19 = sub_100031A80();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Creating Modify Records Operation with markAsParticipantNeedsNewInvitationToken: YES", buf, 2u);
      }
    }
    id v20 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v14 recordIDsToDelete:v15];
    MSDUpdateCKOperationForAttribution(v20, v16);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002E308;
    v23[3] = &unk_10004C988;
    id v24 = v18;
    [v20 setModifyRecordsCompletionBlock:v23];
    if ([v17 userInitiatedRequest])
    {
      [v20 setQualityOfService:25];
    }
    else
    {
      [v20 setQualityOfService:17];
      id v21 = [(CKDatabase *)self operationConfiguration];
      [v20 setConfiguration:v21];
    }
    [v20 setMarkAsParticipantNeedsNewInvitationToken:v11];
    [(CKDatabase *)self addOperation:v20];

    goto LABEL_11;
  }
  id v22 = sub_100031A80();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10003153C();
  }

  if (v18)
  {
    id v20 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
    (*((void (**)(id, void, void, id))v18 + 2))(v18, 0, 0, v20);
LABEL_11:
  }
}

- (id)_fetchPlaceholderRecordData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100029E08;
  id v24 = sub_100029E18;
  id v25 = (id)objc_opt_new();
  id v7 = objc_alloc((Class)CKRecordID);
  id v8 = [v7 initWithRecordName:MSPlaceholderRecordName zoneID:v6];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10002E62C;
  id v17 = &unk_10004E568;
  id v19 = &v20;
  id v9 = dispatch_semaphore_create(0);
  id v18 = v9;
  [(CKDatabase *)self fetchRecordWithID:v8 withOptions:0 completion:&v14];
  dispatch_time_t v10 = dispatch_time(0, 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit);
  if (dispatch_semaphore_wait(v9, v10))
  {
    BOOL v11 = sub_100031A80();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100031570();
    }

    if (a4)
    {
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSCloudKitErrorDomain, 10, 0, v14, v15, v16, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v12 = [[v21[5] copy:v14, v15, v16, v17];

  _Block_object_dispose(&v20, 8);

  return v12;
}

- (id)_fetchRefreshTokenForRecordZoneID:(id)a3
{
  id v4 = a3;
  if ((id)[(CKDatabase *)self databaseScope] == (id)3) {
    CFStringRef v5 = @"sharedDatabaseKeyRefreshTokens";
  }
  else {
    CFStringRef v5 = @"privateDatabaseKeyRefreshTokens";
  }
  id v6 = +[MSDDefaultsManager sharedManager];
  id v7 = [v6 objectForDefaultWithCustomClass:v5];

  if (v7)
  {
    id v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [(CKDatabase *)self databaseScope];
      id v9 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] There exists an entry for Change token", buf, 0xCu);
    }
    dispatch_time_t v10 = +[MSDDefaultsManager sharedManager];
    id v11 = [v10 objectForDefaultWithCustomClass:v5];

    id v12 = objc_opt_new();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002E994;
    v17[3] = &unk_10004E590;
    id v18 = v4;
    id v13 = v12;
    id v19 = v13;
    [v11 na_each:v17];
    id v14 = v19;
    id v15 = v13;
  }
  else
  {
    id v11 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
    [v11 setPreviousServerChangeToken:0];
    id v15 = (id)objc_opt_new();
    [v15 na_safeSetObject:v11 forKey:v4];
  }

  return v15;
}

- (void)_updateServerChangeTokenMap:(id)a3 serverChangeToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(CKDatabase *)self databaseScope] == (id)3) {
    CFStringRef v8 = @"sharedDatabaseKeyRefreshTokens";
  }
  else {
    CFStringRef v8 = @"privateDatabaseKeyRefreshTokens";
  }
  id v9 = +[MSDDefaultsManager sharedManager];
  dispatch_time_t v10 = [v9 objectForDefaultWithCustomClass:v8];
  id v11 = [v10 mutableCopy];

  if (!v11) {
    id v11 = (id)objc_opt_new();
  }
  id v12 = [v6 zoneName];
  [v11 na_safeSetObject:v7 forKey:v12];

  id v13 = sub_100031A80();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [(CKDatabase *)self databaseScope];
    id v14 = CKDatabaseScopeString();
    int v17 = 138412546;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] Updating Server Change Token Map %@", (uint8_t *)&v17, 0x16u);
  }
  id v15 = +[MSDDefaultsManager sharedManager];
  id v16 = [v11 copy];
  [v15 setObjectWithCustomClass:v16 forDefault:v8];
}

- (void)_handleCKErrorChangeTokenExpired:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v21 = v6;
    CFStringRef v8 = +[NSArray arrayWithObjects:&v21 count:1];
    [(CKDatabase *)self _purgeDeletedZonesFromDefaults:v8];

    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002ED68;
    block[3] = &unk_10004E128;
    void block[4] = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    dispatch_time_t v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003160C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserIDS:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    CFStringRef v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100031684();
    }
    goto LABEL_12;
  }
  if ((id)[(CKDatabase *)self databaseScope] != (id)3)
  {
    if ((id)[(CKDatabase *)self databaseScope] != (id)2) {
      goto LABEL_13;
    }
    id v9 = +[MSDDefaultsManager sharedManager];
    CFStringRef v8 = [v9 objectForDefaultWithCustomClass:@"privateDatabaseData"];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002EFC4;
    v15[3] = &unk_10004CA98;
    id v10 = v6;
    id v16 = v10;
    uint64_t v11 = [v8 na_firstObjectPassingTest:v15];
    uint64_t v12 = [v11 homeUserID];

    if (v12)
    {
      uint64_t v13 = [v12 UUIDString];
      [(CKDatabase *)self _handleManateeLossOnPrivateDatabase:v10 homeUserID:v13];

      uint64_t v14 = [[MSDDataRefresh alloc] initWithReason:7 withDelay:90.0];
      [(MSDDataRefresh *)v14 performRefreshWithCompletion:0];
    }
    else
    {
      sub_100031A80();
      uint64_t v14 = (MSDDataRefresh *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR)) {
        sub_1000316B8(v10);
      }
    }

LABEL_12:
    goto LABEL_13;
  }
  [(CKDatabase *)self _handleManateeLossOnSharedDatabase:v6 completion:&stru_10004E5B0];
LABEL_13:
}

- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = sub_100031A80();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [(CKDatabase *)self databaseScope];
      id v10 = CKDatabaseScopeString();
      int v15 = 138412290;
      uint64_t v16 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manatee loss detected on Database scope: %@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = sub_100031A80();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 zoneName];
      int v15 = 138412546;
      uint64_t v16 = (uint64_t)v12;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to recover from Manatee loss for %@ and homeUserID %@", (uint8_t *)&v15, 0x16u);
    }
    if ((id)[(CKDatabase *)self databaseScope] == (id)3)
    {
      [(CKDatabase *)self _handleManateeLossOnSharedDatabase:v6 completion:&stru_10004E5D0];
    }
    else if ((id)[(CKDatabase *)self databaseScope] == (id)2)
    {
      [(CKDatabase *)self _handleManateeLossOnPrivateDatabase:v6 homeUserID:v7];
      uint64_t v13 = sub_100031A80();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134217984;
        uint64_t v16 = 90;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Scheduling PrivateDatabase refresh after %lu sec", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v14 = [[MSDDataRefresh alloc] initWithReason:7 withDelay:90.0];
      [(MSDDataRefresh *)v14 performRefreshWithCompletion:0];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100031684();
    }
  }
}

- (void)_handleManateeLossOnSharedDatabase:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)CKShare) initWithRecordZoneID:v7];

  id v9 = sub_100031A80();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to delete shareID %@", buf, 0xCu);
  }

  id v10 = [v8 recordID];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F48C;
  v12[3] = &unk_10004DA88;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(CKDatabase *)self deleteRecordWithID:v10 missingManateeIdentity:1 withOptions:0 completion:v12];
}

- (void)_handleManateeLossOnPrivateDatabase:(id)a3 homeUserID:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002F6C4;
    v8[3] = &unk_10004E620;
    v8[4] = self;
    id v9 = v5;
    [(CKDatabase *)self deleteRecordZone:v9 withOptions:0 completion:v8];
  }
  else
  {
    id v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CKDatabase(MSDCloudDatabase) _handleManateeLossOnPrivateDatabase:homeUserID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to recover from Manatee Loss - NIL recordZoneID", buf, 0xCu);
    }
  }
}

- (void)_populateRecordZoneWithCachedInfo:(id)a3 cachedInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [v7 na_firstObjectPassingTest:&stru_10004E660];
  id v10 = v9;
  __int16 v58 = v6;
  if (v9)
  {
    long long v53 = self;
    v75[0] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    id v11 = [v9 homeUserID];
    uint64_t v12 = [v11 UUIDString];
    v76[0] = v12;
    v75[1] = kCKDatabaseAccessUserInfoHomeIDKey;
    id v13 = [v10 homeID];
    uint64_t v14 = [v13 UUIDString];
    v76[1] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];

    uint64_t v16 = MSPlaceholderRecordName;
    uint64_t v17 = MSPlaceholderRecordType;
    id v18 = [v6 zoneID];
    v56 = +[CKRecord createRecordWithName:v16 recordType:v17 recordZone:v18];

    id v19 = sub_100031A80();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v10 homeID];
      id v21 = [v10 homeUserID];
      *(_DWORD *)buf = 138412546;
      v72 = v20;
      __int16 v73 = 2112;
      v74 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Placeholder recordInfo HomeID: %@, HomeUserID: %@", buf, 0x16u);
    }
    uint64_t v22 = MSHomeParticipantHomeIdentifier;
    id v23 = [v10 homeID];
    id v24 = [v23 UUIDString];
    [v56 setRecordFieldForKey:v22 value:v24];

    uint64_t v25 = MSHomeParticipantHomeUserIdentifier;
    long long v54 = v10;
    long long v26 = [v10 homeUserID];
    int v27 = [v26 UUIDString];
    [v56 setRecordFieldForKey:v25 value:v27];

    [v8 na_safeAddObject:v56];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v55 = v7;
    id obj = v7;
    long long v28 = v6;
    uint64_t v29 = &AnalyticsSendEvent_ptr;
    id v63 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v63)
    {
      uint64_t v62 = *(void *)v67;
      uint64_t v30 = MSDefaultServiceRecordType;
      uint64_t v61 = MSServiceAccountRecordType;
      uint64_t v59 = MSDefaultServiceRecordName;
      __int16 v57 = v15;
      do
      {
        for (i = 0; i != v63; i = (char *)i + 1)
        {
          uint64_t v32 = v30;
          if (*(void *)v67 != v62) {
            objc_enumerationMutation(obj);
          }
          id v33 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          id v34 = sub_100031A80();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            id v35 = [v33 service];
            id v36 = [v35 serviceID];
            *(_DWORD *)buf = 138412290;
            v72 = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Repopulating info for %@", buf, 0xCu);
          }
          id v37 = [v33 recordType];
          uint64_t v30 = v32;
          unsigned int v38 = [v37 isEqualToString:v32];

          if (v38)
          {
            id v39 = v29[179];
            uint64_t v40 = [v28 zoneID];
            [v39 createRecordWithName:v59 recordType:v32 recordZone:v40];
            v42 = uint64_t v41 = v32;
          }
          else
          {
            id v43 = [v33 recordType];
            unsigned int v44 = [v43 isEqualToString:v61];

            if (!v44) {
              continue;
            }
            long long v45 = v29[179];
            uint64_t v40 = [v33 service];
            [v40 serviceID];
            v47 = long long v46 = v8;
            id v48 = [v47 UUIDString];
            uint8_t v49 = [v28 zoneID];
            id v50 = v45;
            uint64_t v41 = v61;
            uint64_t v42 = [v50 createRecordWithName:v48 recordType:v61 recordZone:v49];

            long long v28 = v58;
            uint64_t v29 = &AnalyticsSendEvent_ptr;

            id v8 = v46;
            id v15 = v57;
          }

          long long v51 = [v33 service];
          [v42 populateCKRecordInfo:v51 userInfo:v15 recordType:v41];

          [v8 na_safeAddObject:v42];
          uint64_t v30 = v32;
        }
        id v63 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v63);
    }

    if ([v8 count])
    {
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_100030200;
      v64[3] = &unk_10004E688;
      v65 = v8;
      [(CKDatabase *)v53 modifyCKRecordWithRecordsToSave:v65 recordIDSToDelete:0 missingManateeIdentity:0 withAttribution:0 withOptions:0 completion:v64];
      long long v52 = v65;
    }
    else
    {
      long long v52 = sub_100031A80();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_100031914();
      }
    }
    id v10 = v54;
    id v7 = v55;
  }
  else
  {
    id v15 = sub_100031A80();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "There are no cached services configured on account", buf, 2u);
    }
  }
}

- (void)_checkShareStatusIfApplicable:(id)a3
{
  id v4 = a3;
  if ((id)[(CKDatabase *)self databaseScope] == (id)2)
  {
    id v5 = +[MSDHomeManager sharedManager];
    id v6 = [v5 currentHome];

    if (v6
      && ([v6 isCurrentUserHomeOwner] & 1) == 0
      && ([v6 isCurrentUserRestrictedGuest] & 1) == 0)
    {
      objc_opt_class();
      id v7 = v4;
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
      id v9 = v8;

      id v10 = [v9 participants];
      id v11 = [v10 na_firstObjectPassingTest:&stru_10004E6A8];

      uint64_t v12 = sub_100031A80();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          [v11 invitationTokenStatus];
          uint64_t v14 = CKStringFromParticipantInvitationTokenStatus();
          *(_DWORD *)buf = 138412290;
          id v18 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There exists a participant whose invitation token status : %@", buf, 0xCu);
        }
        [v11 setWantsNewInvitationToken:1];
        [v9 addParticipant:v11];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100030590;
        v15[3] = &unk_10004E710;
        uint64_t v16 = v7;
        [(CKDatabase *)self saveRecord:v9 withOptions:0 completion:v15];
        uint64_t v12 = v16;
      }
      else if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No eligible participant on the share (NeedsNewToken - NO)", buf, 2u);
      }
    }
  }
}

- (id)operationConfiguration
{
  v2 = objc_opt_new();

  return v2;
}

- (void)_notifyObserversDataChanged:(id)a3 cachedData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Posting notification a property changed on service object", v9, 2u);
  }

  notify_post((const char *)[kMediaSetupServicesChanged UTF8String]);
  id v8 = +[MSDServicesUpdated servicesUpdated:v6 cachedData:v5];

  [v8 processChangesInServices];
}

- (BOOL)_attemptToRecordServiceRequestLapse:(id)a3 fromRecords:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MSDDefaultsManager sharedManager];
  uint64_t v8 = kMissedServiceRequestKey;
  id v9 = [v7 objectForDefault:kMissedServiceRequestKey];

  id v10 = [v9 objectForKeyedSubscript:kMissedServiceRequestServiceKey];
  id v11 = v10;
  if (v10)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100030B4C;
    v30[3] = &unk_10004CA98;
    id v12 = v10;
    id v31 = v12;
    BOOL v13 = [v5 na_firstObjectPassingTest:v30];
    if (v13)
    {
      uint64_t v14 = sub_100031A80();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Noticed a request for a missing service while adding it.", buf, 2u);
      }

      id v15 = +[MSDDefaultsManager sharedManager];
      [v15 removeObjectForDefault:v8];

      id v28 = v6;
      uint64_t v16 = [v6 na_firstObjectPassingTest:&stru_10004E730];
      uint64_t v17 = [v9 objectForKeyedSubscript:kMissedServiceRequestDateLastRequestedKey];
      id v18 = +[NSCalendar currentCalendar];
      id v19 = [v16 creationDate];
      id v20 = [v18 components:16 fromDate:v17 toDate:v19 options:0];

      uint64_t v21 = (uint64_t)[v20 day];
      BOOL v22 = v21 < 2;
      if (v21 < 2)
      {
        uint64_t v25 = [objc_alloc((Class)MSServiceRequestLapseEvent) initWithServiceID:v12];
        id v23 = [v16 creationDate];
        [v25 setRecordCreationDate:v23];

        id v24 = [v9 objectForKeyedSubscript:kMissedServiceRequestTimeLastRequestedKey];
        -[NSObject setTimeOfRequest:](v25, "setTimeOfRequest:", [v24 unsignedLongLongValue]);

        [v25 setDateOfRequest:v17];
        [v25 setEndTime:mach_absolute_time()];
        +[MSAnalytics sendServiceRequestLapseEvent:v25];
      }
      else
      {
        uint64_t v25 = sub_100031A80();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Request for service over a day old. Skipping noting it as a lapse event.", buf, 2u);
        }
      }

      id v6 = v28;
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

@end