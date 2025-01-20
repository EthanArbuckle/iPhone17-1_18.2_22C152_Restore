@interface GKCloudKitMultiplayerUtils
+ (BOOL)isCloudDriveEnabledForBundleID:(id)a3;
+ (BOOL)shouldRetryForError:(id)a3 andRetryCount:(int)a4;
+ (id)cloudKitOperationConfigurationForContainer:(id)a3;
+ (id)cloudKitOperationConfigurationForSocialGamingSessionsContainer;
+ (id)privateDatabase;
+ (id)sharedDatabase;
+ (void)createZoneWithName:(id)a3 handler:(id)a4;
+ (void)fetchShareRecordsWithRecordIDs:(id)a3 inDatabase:(id)a4 handler:(id)a5;
+ (void)fetchUserRecordIDWithHandler:(id)a3;
+ (void)saveInviteRecord:(id)a3 database:(id)a4 retryCount:(int)a5 completionHandler:(id)a6;
@end

@implementation GKCloudKitMultiplayerUtils

+ (BOOL)isCloudDriveEnabledForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)TCCAccessCopyInformation();
  if (![v4 count])
  {

    v4 = &__NSArray0__struct;
  }
  v5 = (void *)TCCAccessCopyInformation();
  if (![v5 count])
  {

    v5 = &__NSArray0__struct;
  }
  [v4 arrayByAddingObjectsFromArray:v5];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    v19 = v5;
    v20 = v4;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v11 objectForKeyedSubscript:kTCCInfoBundle, v19, v20, (void)v21];
        v12 = (__CFBundle *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = CFBundleGetIdentifier(v12);
          if ([v14 isEqualToString:v3])
          {
            v15 = [v11 objectForKeyedSubscript:kTCCInfoGranted];
            unsigned int v16 = [v15 BOOLValue];

            if (!v16)
            {

              BOOL v17 = 0;
              goto LABEL_18;
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    BOOL v17 = 1;
LABEL_18:
    v5 = v19;
    v4 = v20;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

+ (void)createZoneWithName:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v7 ownerName:CKCurrentUserDefaultName];
  id v9 = [objc_alloc((Class)CKRecordZone) initWithZoneName:v7];

  [v9 setZoneID:v8];
  id v10 = objc_alloc((Class)CKModifyRecordZonesOperation);
  v11 = +[NSArray arrayWithObject:v9];
  id v12 = [v10 initWithRecordZonesToSave:v11 recordZoneIDsToDelete:0];

  v13 = +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer];
  [v12 setConfiguration:v13];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10011B13C;
  v16[3] = &unk_1002DB558;
  id v17 = v6;
  id v14 = v6;
  [v12 setModifyRecordZonesCompletionBlock:v16];
  v15 = [a1 privateDatabase];
  [v15 addOperation:v12];
}

+ (id)cloudKitOperationConfigurationForContainer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CKOperationConfiguration);
  [v4 setContainer:v3];

  [v4 setDiscretionaryNetworkBehavior:0];
  [v4 setAutomaticallyRetryNetworkFailures:0];
  [v4 setQualityOfService:17];

  return v4;
}

+ (id)cloudKitOperationConfigurationForSocialGamingSessionsContainer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B274;
  block[3] = &unk_1002DADF0;
  block[4] = a1;
  if (qword_100329890 != -1) {
    dispatch_once(&qword_100329890, block);
  }
  v2 = (void *)qword_100329888;

  return v2;
}

+ (void)fetchShareRecordsWithRecordIDs:(id)a3 inDatabase:(id)a4 handler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v12 count])
  {
    id v10 = [objc_alloc((Class)CKFetchRecordsOperation) initWithRecordIDs:v12];
    v11 = [a1 cloudKitOperationConfigurationForSocialGamingSessionsContainer];
    [v10 setConfiguration:v11];

    [v10 setFetchRecordsCompletionBlock:v9];
    [v8 addOperation:v10];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

+ (void)fetchUserRecordIDWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[CKContainer containerWithIdentifier:@"com.apple.socialgaming.sessions"];
  [v4 fetchUserRecordIDWithCompletionHandler:v3];
}

+ (id)privateDatabase
{
  v2 = +[CKContainer containerWithIdentifier:@"com.apple.socialgaming.sessions"];
  id v3 = [v2 privateCloudDatabase];

  return v3;
}

+ (id)sharedDatabase
{
  v2 = +[CKContainer containerWithIdentifier:@"com.apple.socialgaming.sessions"];
  id v3 = [v2 sharedCloudDatabase];

  return v3;
}

+ (void)saveInviteRecord:(id)a3 database:(id)a4 retryCount:(int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc((Class)CKModifyRecordsOperation);
  id v35 = v10;
  id v14 = +[NSArray arrayWithObjects:&v35 count:1];
  id v15 = [v13 initWithRecordsToSave:v14 recordIDsToDelete:0];

  unsigned int v16 = +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer];
  [v15 setConfiguration:v16];

  [v15 setSavePolicy:0];
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKCloudKitMultiplayerUtils.m", 131, "+[GKCloudKitMultiplayerUtils saveInviteRecord:database:retryCount:completionHandler:]");
  v18 = +[GKDispatchGroup dispatchGroupWithName:v17];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10011B7A4;
  v27[3] = &unk_1002DB620;
  id v19 = v15;
  id v28 = v19;
  id v20 = v18;
  id v29 = v20;
  id v21 = v10;
  id v30 = v21;
  id v22 = v11;
  id v31 = v22;
  id v33 = a1;
  int v34 = a5;
  id v23 = v12;
  id v32 = v23;
  [v20 perform:v27];
  if (v23)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10011BEEC;
    v24[3] = &unk_1002D3930;
    id v26 = v23;
    id v25 = v20;
    [v25 notifyOnMainQueueWithBlock:v24];
  }
}

+ (BOOL)shouldRetryForError:(id)a3 andRetryCount:(int)a4
{
  id v5 = a3;
  id v6 = [v5 domain];
  unsigned int v7 = [v6 isEqualToString:CKErrorDomain];

  BOOL v8 = 0;
  if (a4 < 1 || !v7) {
    goto LABEL_26;
  }
  id v9 = [v5 code];
  if (v9 == (id)2)
  {
    id v12 = [v5 userInfo];
    id v13 = [v12 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = [v13 allValues];
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v19 code] == (id)23 || objc_msgSend(v19, "code") == (id)7)
          {
            if (!os_log_GKGeneral) {
              id v22 = (id)GKOSLoggers();
            }
            id v23 = os_log_GKMatch;
            if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v31 = v19;
              __int16 v32 = 1024;
              int v33 = a4;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "should retry for partialError: %@. retryCount: %d", buf, 0x12u);
            }

            BOOL v8 = 1;
            goto LABEL_26;
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    goto LABEL_20;
  }
  if (v9 != (id)23 && v9 != (id)7)
  {
LABEL_20:
    id v20 = [v5 userInfo];
    id v21 = [v20 objectForKeyedSubscript:CKErrorRetryAfterKey];
    BOOL v8 = v21 != 0;

    goto LABEL_26;
  }
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  id v11 = os_log_GKMatch;
  BOOL v8 = 1;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v5;
    __int16 v32 = 1024;
    int v33 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "should retry for error: %@. retryCount: %d", buf, 0x12u);
  }
LABEL_26:

  return v8;
}

@end