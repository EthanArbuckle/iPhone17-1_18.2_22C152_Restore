@interface MSDDataRefresh
+ (void)cacheLastRefreshforHomes:(id)a3;
+ (void)clearLastRefreshTSForHomes;
- (BOOL)_shouldPreformRefresh:(id)a3;
- (BOOL)_shouldProceedWithExecution:(id)a3;
- (MSDDataRefresh)initWithReason:(unint64_t)a3;
- (MSDDataRefresh)initWithReason:(unint64_t)a3 withDelay:(double)a4;
- (double)delay;
- (unint64_t)refreshReason;
- (void)_checkDataSanity:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6;
- (void)_checkZoneAndDefaultRecordInEachHome:(id)a3 completion:(id)a4;
- (void)_createAndSaveAppleMusicRecord:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6;
- (void)_deleteRecordZone:(id)a3 completion:(id)a4;
- (void)_deleteZombieRecordZonesIfAnyInHomes:(id)a3 completion:(id)a4;
- (void)_handleCKShareError:(id)a3 home:(id)a4;
- (void)_initializeCKAndServiceInfoForHome:(id)a3 completion:(id)a4;
- (void)_performDataRefresh:(id)a3;
- (void)_refreshDatabases:(id)a3;
- (void)_saveMediaServiceConfigInfo:(id)a3 record:(id)a4 completion:(id)a5;
- (void)_setupShareForParticipant:(id)a3 home:(id)a4 completion:(id)a5;
- (void)_shareThisRecordIfApplicable:(id)a3 home:(id)a4 completion:(id)a5;
- (void)_updateDefaultService:(id)a3 record:(id)a4 completion:(id)a5;
- (void)performRefreshWithCompletion:(id)a3;
- (void)refreshDataAfterDelay;
@end

@implementation MSDDataRefresh

- (MSDDataRefresh)initWithReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSDDataRefresh;
  result = [(MSDDataRefresh *)&v5 init];
  if (result)
  {
    result->_refreshReason = a3;
    result->_delay = 0.0;
  }
  return result;
}

- (MSDDataRefresh)initWithReason:(unint64_t)a3 withDelay:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MSDDataRefresh;
  result = [(MSDDataRefresh *)&v7 init];
  if (result)
  {
    result->_refreshReason = a3;
    result->_delay = a4;
  }
  return result;
}

- (void)performRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100031A80();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = MSDDataRefreshReasonToString(self->_refreshReason);
    double delay = self->_delay;
    *(_DWORD *)buf = 136315650;
    v14 = "-[MSDDataRefresh performRefreshWithCompletion:]";
    __int16 v15 = 2112;
    v16 = v6;
    __int16 v17 = 2048;
    double v18 = delay;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s reason: %@ delay: %f", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v8 = +[MSDCloudManager sharedManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B690;
  v10[3] = &unk_10004D8A0;
  id v9 = v4;
  v10[4] = self;
  id v11 = v9;
  objc_copyWeak(&v12, (id *)buf);
  [v8 isCloudKitAccessAvailable:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)_performDataRefresh:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[MSDHomeManager sharedManager];
  v6 = [v5 allHomes];

  if (v6 && [v6 count])
  {
    objc_super v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Homes user is part of %{private}@", buf, 0xCu);
    }

    [v6 hmf_objectsPassingTest:&stru_10004D8E0];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v8 count];
    v10 = sub_100031A80();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138477827;
        id v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing update on the following homes: %{private}@", buf, 0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001BBDC;
      v16[3] = &unk_10004D958;
      id v18 = v4;
      v16[4] = self;
      id v8 = v8;
      id v17 = v8;
      [(MSDDataRefresh *)self _checkZoneAndDefaultRecordInEachHome:v8 completion:v16];

      id v12 = v18;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping CloudKit refresh. Homes do not contain valid accessories for media setup.", buf, 2u);
      }

      if (!v4) {
        goto LABEL_12;
      }
      uint64_t v14 = MSErrorDomain;
      uint64_t v19 = MSUserInfoErrorStringKey;
      CFStringRef v20 = @"Failed to perform refresh. No valid accessories in home to setup.";
      id v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      __int16 v15 = +[NSError errorWithDomain:v14 code:3 userInfo:v12];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v15);
    }
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  if (v4)
  {
    uint64_t v13 = MSErrorDomain;
    uint64_t v23 = MSUserInfoErrorStringKey;
    CFStringRef v24 = @"Failed to perform refresh. No homes available.";
    id v8 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v12 = +[NSError errorWithDomain:v13 code:3 userInfo:v8];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v12);
    goto LABEL_11;
  }
LABEL_13:
}

- (void)_checkZoneAndDefaultRecordInEachHome:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  objc_super v7 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v12 = sub_100031A80();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v33 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting refresh for Home : %{private}@", buf, 0xCu);
        }

        if ([v11 isCurrentUserRestrictedGuest])
        {
          uint64_t v13 = sub_100031A80();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = [v11 currentUser];
            __int16 v15 = [v14 uniqueIdentifier];
            *(_DWORD *)buf = 138477827;
            v33 = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Determined user (%{private}@) to be a restricted guest. Skipping setting up media in the home", buf, 0xCu);
          }
        }
        else
        {
          dispatch_group_enter(v7);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10001C384;
          v23[3] = &unk_10004D068;
          v25 = v30;
          v23[4] = v11;
          CFStringRef v24 = v7;
          [(MSDDataRefresh *)self _initializeCKAndServiceInfoForHome:v11 completion:v23];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v8);
  }

  v16 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C490;
  block[3] = &unk_10004D980;
  id v21 = v18;
  id v22 = v30;
  id v17 = v18;
  dispatch_group_notify(v7, v16, block);

  _Block_object_dispose(v30, 8);
}

- (void)_deleteZombieRecordZonesIfAnyInHomes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, void))a4;
  if ((+[MSDeviceInfo isDeviceAppleTV] & 1) != 0
    || +[MSDeviceInfo isDeviceAudioAccessory])
  {
    id v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "** Deletion of recordZones will be handled by the iOS device **", buf, 2u);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    uint64_t v9 = [v6 na_map:&stru_10004D9C0];
    v10 = +[CKContainer MSDCloudKitContainer];
    BOOL v11 = [v10 privateCloudDatabase];

    id v12 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001C708;
    v16[3] = &unk_10004DA60;
    id v21 = v7;
    id v17 = v11;
    id v18 = v9;
    id v19 = v6;
    CFStringRef v20 = self;
    id v13 = v9;
    id v14 = v11;
    [v12 setFetchRecordZonesCompletionBlock:v16];
    [v12 setQualityOfService:17];
    __int16 v15 = [v14 operationConfiguration];
    [v12 setConfiguration:v15];

    [v14 addOperation:v12];
  }
}

- (void)_deleteRecordZone:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = +[CKContainer MSDCloudKitContainer];
  id v8 = [v7 privateCloudDatabase];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D23C;
  v11[3] = &unk_10004DA88;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 deleteRecordZone:v10 withOptions:0 completion:v11];
}

- (void)_refreshDatabases:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_group_create();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10001CC80;
  v20[4] = sub_10001CC90;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  dispatch_group_enter(v4);
  id v5 = +[CKContainer MSDCloudKitContainer];
  id v6 = [v5 privateCloudDatabase];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001D54C;
  v14[3] = &unk_10004DAB0;
  v16 = v20;
  id v17 = v18;
  objc_super v7 = v4;
  __int16 v15 = v7;
  [v6 refreshDatabase:0 completion:v14];

  id v8 = dispatch_get_global_queue(2, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D5E8;
  v10[3] = &unk_10004DAD8;
  id v11 = v3;
  id v12 = v18;
  id v13 = v20;
  id v9 = v3;
  dispatch_group_notify(v7, v8, v10);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

+ (void)clearLastRefreshTSForHomes
{
  v2 = sub_100031A80();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100020628(v2);
  }

  id v3 = +[MSDDefaultsManager sharedManager];
  [v3 removeObjectForDefault:@"lastDataRefresh"];
}

+ (void)cacheLastRefreshforHomes:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDDefaultsManager sharedManager];
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v6 forDefault:@"lastDataRefresh"];

  [v3 na_map:&stru_10004DAF8];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v7 = +[MSDDefaultsManager sharedManager];
  [v7 setObject:v8 forDefault:@"homesRefreshed"];
}

- (void)refreshDataAfterDelay
{
  objc_initWeak(&location, self);
  id v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double delay = self->_delay;
    id v5 = MSDDataRefreshReasonToString(self->_refreshReason);
    *(_DWORD *)buf = 134218242;
    double v11 = delay;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scheduling Refresh task after %f with reason: %@", buf, 0x16u);
  }
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_delay * 1000000000.0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DBB4;
  v7[3] = &unk_10004C9C0;
  objc_copyWeak(&v8, &location);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_initializeCKAndServiceInfoForHome:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MSDFetchCKDataOptions);
  [(MSDFetchCKDataOptions *)v8 setCreateNewZoneIfMissing:1];
  [(MSDFetchCKDataOptions *)v8 setUserInitiatedRequest:0];
  id v9 = +[CKContainer MSDCloudKitContainer];
  id v10 = [v9 privateCloudDatabase];

  objc_initWeak(&location, self);
  double v11 = [v6 uniqueIdentifier];
  __int16 v12 = [v11 UUIDString];
  id v13 = [v6 currentUser];
  id v14 = [v13 uniqueIdentifier];
  __int16 v15 = [v14 UUIDString];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001DF14;
  void v18[3] = &unk_10004DB70;
  id v16 = v7;
  id v20 = v16;
  objc_copyWeak(&v21, &location);
  id v17 = v6;
  id v19 = v17;
  [v10 fetchRecordZoneFor:v12 user:v15 withOptions:v8 completion:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_checkDataSanity:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc((Class)CKRecordID);
  __int16 v15 = [v11 serviceID];
  id v16 = [v10 zoneID];
  id v17 = [v14 initWithRecordName:v15 zoneID:v16];

  id v18 = objc_alloc((Class)CKRecordID);
  id v19 = [v10 zoneID];
  id v20 = [v18 initWithRecordName:MSDefaultServiceRecordName zoneID:v19];

  if (v17 && v20)
  {
    objc_initWeak(&location, self);
    id v21 = +[CKContainer MSDCloudKitContainer];
    id v22 = [v21 privateCloudDatabase];

    v42[0] = v17;
    v42[1] = v20;
    uint64_t v23 = +[NSArray arrayWithObjects:v42 count:2];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001E458;
    v33[3] = &unk_10004DBC0;
    objc_copyWeak(&v40, &location);
    id v39 = v13;
    id v34 = v17;
    id v35 = v20;
    id v36 = v12;
    id v37 = v10;
    id v38 = v11;
    [v22 fetchRecordWithIDS:v23 withOptions:0 completion:v33];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  else
  {
    CFStringRef v24 = sub_100031A80();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000207FC(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    if (v13)
    {
      v32 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
      (*((void (**)(id, void *))v13 + 2))(v13, v32);
    }
  }
}

- (BOOL)_shouldProceedWithExecution:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 CKErrorHasErrorCode:11];
  id v5 = sub_100031A80();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown item error, Okay to continue, we will create new record", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100020874();
  }

  return v4;
}

- (void)_createAndSaveAppleMusicRecord:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_100031A80();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating AppleMusic Service record with PublicDB Info : %{private}@", buf, 0xCu);
  }

  __int16 v15 = [v11 serviceID];
  id v16 = +[CKRecord createRecordWithName:v15 recordType:MSServiceAccountRecordType recordZone:v10];

  id v17 = [v12 uniqueIdentifier];
  id v18 = [v17 UUIDString];

  id v19 = [v12 currentUser];
  id v20 = [v19 uniqueIdentifier];
  id v21 = [v20 UUIDString];

  id v22 = sub_100031A80();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v31 = v18;
    __int16 v32 = 2113;
    v33 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Adding Home Entries HomeID : %{private}@ HomeUserID : %{private}@", buf, 0x16u);
  }

  [v16 setRecordFieldForKey:MSHomeParticipantHomeIdentifier value:v18];
  [v16 setRecordFieldForKey:MSHomeParticipantHomeUserIdentifier value:v21];
  objc_initWeak((id *)buf, self);
  uint64_t v23 = [v11 serviceID];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001EC20;
  v26[3] = &unk_10004DBE8;
  id v24 = v13;
  id v28 = v24;
  objc_copyWeak(&v29, (id *)buf);
  id v25 = v12;
  id v27 = v25;
  [(MSDDataRefresh *)self _saveMediaServiceConfigInfo:v23 record:v16 completion:v26];

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

- (void)_shareThisRecordIfApplicable:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = sub_100031A80();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v9 isCurrentUserHomeOwner];
    CFStringRef v13 = @"NO";
    id v20 = "-[MSDDataRefresh _shareThisRecordIfApplicable:home:completion:]";
    *(_DWORD *)buf = 136315651;
    if (v12) {
      CFStringRef v13 = @"YES";
    }
    __int16 v21 = 2113;
    id v22 = v9;
    __int16 v23 = 2112;
    CFStringRef v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s %{private}@ CurrentUserOwner: %@", buf, 0x20u);
  }

  if ([v9 isCurrentUserHomeOwner]
    || [v9 isCurrentUserRestrictedGuest])
  {
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    id v14 = sub_100031A80();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [v8 recordID];
      *(_DWORD *)buf = 138477827;
      id v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting up share for participant with recordID %{private}@", buf, 0xCu);
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001F108;
    v16[3] = &unk_10004DC10;
    id v17 = v9;
    id v18 = v10;
    [(MSDDataRefresh *)self _setupShareForParticipant:v8 home:v17 completion:v16];
  }
}

- (void)_updateDefaultService:(id)a3 record:(id)a4 completion:(id)a5
{
  id v7 = a5;
  uint64_t v8 = MSDefaultServiceRecordName;
  uint64_t v9 = MSDefaultServiceRecordType;
  id v10 = a4;
  id v11 = a3;
  unsigned int v12 = [v10 recordID];
  CFStringRef v13 = [v12 zoneID];
  id v14 = +[CKRecord createRecordWithName:v8 recordType:v9 recordZone:v13];

  uint64_t v15 = MediaServiceIdentifier;
  id v16 = [v10 recordFieldForKey:MediaServiceIdentifier];

  id v17 = [v11 currentUser];

  id v18 = [v17 uniqueIdentifier];
  id v19 = [v18 UUIDString];

  id v20 = sub_100031A80();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v27 = v16;
    __int16 v28 = 2113;
    id v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Setting default service identifier %{private}@ and homeUserID %{private}@", buf, 0x16u);
  }

  [v14 setRecordFieldForKey:v15 value:v16];
  [v14 setRecordFieldForKey:MSHomeParticipantHomeUserIdentifier value:v19];
  __int16 v21 = +[CKContainer MSDCloudKitContainer];
  id v22 = [v21 privateCloudDatabase];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001F4DC;
  v24[3] = &unk_10004DC38;
  id v25 = v7;
  id v23 = v7;
  [v22 saveRecord:v14 completionHandler:v24];
}

- (void)_saveMediaServiceConfigInfo:(id)a3 record:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to save record for Apple Music with service info : %{private}@", buf, 0xCu);
  }

  [v9 setRecordFieldForKey:MediaServiceIdentifier value:v7];
  id v11 = +[CKContainer MSDCloudKitContainer];
  unsigned int v12 = [v11 privateCloudDatabase];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001F744;
  v14[3] = &unk_10004DC38;
  id v15 = v8;
  id v13 = v8;
  [v12 saveRecord:v9 withOptions:0 completion:v14];
}

- (void)_setupShareForParticipant:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[MSDHomeCloudShareCreate cloudShareForHome:v8];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001F910;
  v14[3] = &unk_10004DC60;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 setupShareForHomeParticipant:v10 completion:v14];
}

- (BOOL)_shouldPreformRefresh:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[MSDDefaultsManager sharedManager];
  id v5 = [v4 objectForDefault:@"lastDataRefresh"];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v7];
  id v9 = +[NSDate date];
  id v10 = [v8 dateByAddingTimeInterval:MSPrivateDatabaseRefreshIntervalInSecs];
  id v11 = [v9 compare:v10];

  if (v11 == (id)-1)
  {
    id v13 = +[MSDDefaultsManager sharedManager];
    id v14 = [v13 objectForDefault:@"homesRefreshed"];

    uint64_t v15 = [v3 na_map:&stru_10004DC80];
    id v16 = (void *)v15;
    LOBYTE(v12) = 1;
    if (v14 && v15)
    {
      id v17 = [objc_alloc((Class)NSSet) initWithArray:v14];
      id v18 = [objc_alloc((Class)NSSet) initWithArray:v16];
      unsigned int v12 = [v17 isEqualToSet:v18] ^ 1;
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (void)_handleCKShareError:(id)a3 home:(id)a4
{
  id v5 = (char *)a3;
  id v6 = a4;
  double v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Encountered error when trying to share recordZone with owner %@", buf, 0xCu);
  }

  id v8 = [v5 domain];
  if (![v8 isEqualToString:HMErrorDomain]) {
    goto LABEL_15;
  }
  id v9 = [v5 code];

  if (v9 == (id)8)
  {
    id v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HomeOwner device did not respond in time, hit HomeKit timeout error", buf, 2u);
    }

    id v11 = [v6 uniqueIdentifier];
    unsigned int v12 = [v11 UUIDString];
    id v8 = +[NSString stringWithFormat:@"%@_%@", @"CKShareErrorRetryCount", v12];

    id v13 = +[MSDDefaultsManager sharedManager];
    id v14 = [v13 objectForDefault:v8];
    uint64_t v15 = (char *)[v14 integerValue];

    if (v15 == (char *)MSCKShareTimeoutErrorMaxRetryCount)
    {
      id v16 = sub_100031A80();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Hit max retry count, aborting..", buf, 2u);
      }

      id v17 = [MSDBackgroundActivityTask alloc];
      id v18 = [(MSDBackgroundActivityTask *)v17 initWithIdentifier:kBackgroundActivityUserShareRetryTaskIdentifier];
      [(MSDBackgroundActivityTask *)v18 invalidate];
    }
    else
    {
      id v19 = v15 + 1;
      id v20 = sub_100031A80();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349315;
        id v25 = v19;
        __int16 v26 = 2113;
        id v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Updating value of retry count %{public}lu for %{private}@", buf, 0x16u);
      }

      __int16 v21 = +[MSDDefaultsManager sharedManager];
      id v22 = +[NSNumber numberWithUnsignedInteger:v19];
      [v21 setObject:v22 forDefault:v8];

      id v23 = [MSDBackgroundActivityTask alloc];
      id v18 = [(MSDBackgroundActivityTask *)v23 initWithIdentifier:kBackgroundActivityUserShareRetryTaskIdentifier];
      [(MSDBackgroundActivityTask *)v18 invalidate];
      [(MSDBackgroundActivityTask *)v18 setAllowBattery:1];
      [(MSDBackgroundActivityTask *)v18 setRepeats:0];
      [(MSDBackgroundActivityTask *)v18 setRequireNetworkConnection:1];
      [(MSDBackgroundActivityTask *)v18 setInterval:MSCKShareTimeoutRetryIntervalInSecs];
      [(MSDBackgroundActivityTask *)v18 setRequireInexpensiveNetworkConnection:1];
      [(MSDBackgroundActivityTask *)v18 setActivityBlock:&stru_10004DCC0];
      [(MSDBackgroundActivityTask *)v18 schedule];
    }

LABEL_15:
  }
}

- (unint64_t)refreshReason
{
  return self->_refreshReason;
}

- (double)delay
{
  return self->_delay;
}

@end