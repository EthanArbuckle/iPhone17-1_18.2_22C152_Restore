@interface ICNACloudOperationEventReporter
+ (id)sharedReporter;
- (id)accountDataForOperation:(id)a3;
- (id)cloudSyncableDataForOperation:(id)a3 recordsByRecordID:(id)a4;
- (id)operationDataForOperaiton:(id)a3;
- (id)partialCloudErrorDataForOperation:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5;
- (id)saltedAccountIDForOperation:(id)a3;
- (id)saltedIDForOperation:(id)a3;
- (id)saltedIDforID:(id)a3;
- (id)subTrackerForOperation:(id)a3;
- (void)cloudContext:(id)a3 reportOperationEnd:(id)a4 recordsByRecordID:(id)a5 operationError:(id)a6;
- (void)submitCloudOperationEndEventForCKOperation:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5;
@end

@implementation ICNACloudOperationEventReporter

+ (id)sharedReporter
{
  if (qword_1006AA158 != -1) {
    dispatch_once(&qword_1006AA158, &stru_1006277D0);
  }
  v2 = (void *)qword_1006AA150;

  return v2;
}

- (id)saltedIDforID:(id)a3
{
  id v3 = a3;
  v4 = +[ICNAIdentityManager sharedManager];
  v5 = [v4 saltedID:v3 forClass:objc_opt_class()];

  return v5;
}

- (id)saltedIDForOperation:(id)a3
{
  v4 = [a3 operationID];
  v5 = [(ICNACloudOperationEventReporter *)self saltedIDforID:v4];

  return v5;
}

- (id)saltedAccountIDForOperation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v5 = [v4 database];
  v6 = [v5 container];
  v7 = [v6 setupInfo];
  v8 = [v7 accountOverrideInfo];
  v9 = [v8 accountID];

  if (v9)
  {
    v10 = [(ICNACloudOperationEventReporter *)self saltedIDforID:v9];
  }
  else
  {
LABEL_4:
    v10 = @"icna_account_id_unknown";
  }

  return v10;
}

- (id)subTrackerForOperation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)ICNASubTracker);
  v6 = [(ICNACloudOperationEventReporter *)self saltedIDForOperation:v4];

  id v7 = [v5 initWithName:v6];

  return v7;
}

- (void)submitCloudOperationEndEventForCKOperation:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35 = [(ICNACloudOperationEventReporter *)self subTrackerForOperation:v8];
  uint64_t v11 = [(ICNACloudOperationEventReporter *)self accountDataForOperation:v8];
  v12 = [(ICNACloudOperationEventReporter *)self operationDataForOperaiton:v8];
  v13 = [(ICNACloudOperationEventReporter *)self cloudSyncableDataForOperation:v8 recordsByRecordID:v9];
  id v14 = objc_alloc_init((Class)NSMutableArray);
  v34 = (void *)v11;
  [v14 addObject:v11];
  [v14 addObject:v12];
  [v14 addObject:v13];
  v36 = v9;
  if (!v10)
  {
    uint64_t v18 = 1;
    goto LABEL_9;
  }
  v15 = [v10 domain];
  if (![v15 isEqualToString:CKErrorDomain])
  {

    goto LABEL_7;
  }
  id v16 = [v10 code];

  if (v16 != (id)2)
  {
LABEL_7:
    v19 = [v10 domain];
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%ld", v19, [v10 code]);

    id v20 = objc_alloc((Class)ICASFullErrorData);
    v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
    id v22 = [v20 initWithFullErrorCode:v21 errorString:v17];

    [v14 addObject:v22];
    uint64_t v18 = 3;
    goto LABEL_8;
  }
  v17 = [(ICNACloudOperationEventReporter *)self partialCloudErrorDataForOperation:v8 recordsByRecordID:v9 operationError:v10];
  [v14 addObject:v17];
  uint64_t v18 = 2;
LABEL_8:

LABEL_9:
  id v23 = [objc_alloc((Class)ICASErrorStatus) initWithErrorStatus:v18];
  id v24 = [objc_alloc((Class)ICASCloudErrorData) initWithErrorStatus:v23];
  [v14 addObject:v24];
  if (+[ICUtilities isInternalInstall])
  {
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_10008D750;
    v44 = sub_10008D760;
    v45 = @"icna_device_id_unknown";
    v26 = [v8 configuration];
    v27 = [v26 container];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10008D768;
    v37[3] = &unk_1006277F8;
    v39 = &v40;
    v28 = v25;
    v38 = v28;
    [v27 fetchCurrentDeviceIDWithCompletionHandler:v37];

    dispatch_time_t v29 = dispatch_time(0, 750000000);
    if (dispatch_semaphore_wait(v28, v29))
    {
      v30 = (void *)v41[5];
      v41[5] = @"icna_device_id_failed_to_obtain";
    }
    id v31 = objc_alloc((Class)ICASInternalUserData);
    id v32 = [v31 initWithRawUserDSID:v41[5]];
    [v14 addObject:v32];

    _Block_object_dispose(&v40, 8);
  }
  v33 = +[ICNAController sharedController];
  [v33 submitEventOfType:objc_opt_class() pushThenPopDataObjects:v14 subTracker:v35];
}

- (id)accountDataForOperation:(id)a3
{
  id v3 = [(ICNACloudOperationEventReporter *)self saltedAccountIDForOperation:a3];
  id v4 = [objc_alloc((Class)ICASAccountType) initWithAccountType:1];
  id v5 = [objc_alloc((Class)ICASAccountData) initWithAccountType:v4 accountID:v3];

  return v5;
}

- (id)operationDataForOperaiton:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = 3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = 5;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = 6;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v5 = 7;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v5 = 8;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v5 = 9;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v5 = 10;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v5 = 11;
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v5 = 1;
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      uint64_t v5 = 2;
                    }
                    else {
                      uint64_t v5 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  id v6 = objc_alloc((Class)ICASCloudOperationData);
  id v7 = [(ICNACloudOperationEventReporter *)self saltedIDForOperation:v4];
  id v8 = [objc_alloc((Class)ICASOperationType) initWithOperationType:v5];
  id v9 = [v4 group];
  id v10 = [v9 name];
  id v11 = [v6 initWithOperationID:v7 operationType:v8 operationGroupName:v10];

  return v11;
}

- (id)cloudSyncableDataForOperation:(id)a3 recordsByRecordID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 recordIDs];
    id v8 = 0;
LABEL_6:
    CFStringRef v9 = @"icna_record_type_unknown";
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = 0;
    id v7 = 0;
    goto LABEL_6;
  }
  id v7 = [v5 recordIDsToDelete];
  id v8 = [v5 recordsToSave];
  CFStringRef v9 = @"icna_record_type_deleted";
LABEL_7:
  CFStringRef v33 = v9;
  id v40 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableSet);
  if ([v6 count] || objc_msgSend(v8, "count"))
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    id v12 = objc_alloc_init((Class)NSMutableSet);
    if ([v6 count])
    {
      v13 = [v6 allValues];
      [v12 addObjectsFromArray:v13];
    }
    v37 = v7;
    id v38 = v6;
    id v39 = v5;
    if ([v8 count]) {
      [v12 addObjectsFromArray:v8];
    }
    v36 = v8;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10008DECC;
    v45[3] = &unk_100627820;
    id v14 = v11;
    id v46 = v14;
    id v47 = v10;
    v35 = v12;
    [v12 enumerateObjectsUsingBlock:v45];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v34 = v14;
    v15 = [v14 allValues];
    id v16 = [v15 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v21 = objc_alloc((Class)ICASCloudSyncableItemData);
          id v22 = [v20 syncableDataType];
          id v23 = [v20 count];
          [v23 intValue];
          id v24 = +[NSNumber numberWithInteger:ICNARoundTo2SigFigsInt()];
          id v25 = [v21 initWithSyncableDataType:v22 count:v24];

          [v40 addObject:v25];
        }
        id v17 = [v15 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v17);
    }

    id v6 = v38;
    id v5 = v39;
    id v8 = v36;
    id v7 = v37;
  }
  if ([v7 count])
  {
    id v26 = [v7 mutableCopy];
    v27 = [v10 allObjects];
    [v26 removeObjectsInArray:v27];

    if ([v26 count])
    {
      id v28 = objc_alloc((Class)ICASCloudSyncableItemData);
      [v26 count];
      dispatch_time_t v29 = +[NSNumber numberWithInteger:ICNARoundTo2SigFigsInt()];
      id v30 = [v28 initWithSyncableDataType:v33 count:v29];

      [v40 addObject:v30];
    }
  }
  id v31 = [objc_alloc((Class)ICASCloudSyncableData) initWithSyncableDataSummary:v40];

  return v31;
}

- (id)partialCloudErrorDataForOperation:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  CFStringRef v9 = [a5 userInfo];
  id v10 = [v9 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  objc_opt_class();
  id v38 = v7;
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v7 recordIDs];
    id v12 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v7 recordIDsToDelete];
      id v12 = [v7 recordsToSave];
      CFStringRef v13 = @"icna_record_type_deleted";
      goto LABEL_7;
    }
    id v12 = 0;
    id v11 = 0;
  }
  CFStringRef v13 = @"icna_record_type_unknown";
LABEL_7:
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  v37 = v8;
  [v14 addEntriesFromDictionary:v8];
  if ([v12 count])
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10008E450;
    v49[3] = &unk_100627848;
    id v50 = v14;
    [v12 enumerateObjectsUsingBlock:v49];
  }
  v35 = v12;
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10008E4B4;
  v44[3] = &unk_100627870;
  id v33 = v14;
  id v45 = v33;
  id v34 = v11;
  id v46 = v34;
  id v47 = (__CFString *)v13;
  id v16 = v15;
  id v48 = v16;
  v36 = v10;
  [v10 enumerateKeysAndObjectsUsingBlock:v44];
  id v17 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v32 = v16;
  id obj = [v16 allValues];
  id v18 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v23 = objc_alloc((Class)ICASPartialCloudErrorItemData);
        id v24 = [v22 syncableDataType];
        id v25 = [v22 errorCode];
        id v26 = [v22 count];
        [v26 intValue];
        v27 = +[NSNumber numberWithInteger:ICNARoundTo2SigFigsInt()];
        id v28 = [v22 errorString];
        id v29 = [v23 initWithSyncableDataType:v24 errorCode:v25 count:v27 errorString:v28];

        [v17 addObject:v29];
      }
      id v19 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v19);
  }

  id v30 = [objc_alloc((Class)ICASPartialCloudErrorData) initWithPartialErrorSummary:v17];

  return v30;
}

- (void)cloudContext:(id)a3 reportOperationEnd:(id)a4 recordsByRecordID:(id)a5 operationError:(id)a6
{
  id v15 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v12 = [v11 BOOLForKey:kICInternalSettingsMuteSyncHealthTracking];

  if ((v12 & 1) == 0)
  {
    CFStringRef v13 = +[ICNASamplingController sharedController];
    unsigned int v14 = [v13 shouldTrackSyncHealth];

    if (v14) {
      [(ICNACloudOperationEventReporter *)self submitCloudOperationEndEventForCKOperation:v15 recordsByRecordID:v9 operationError:v10];
    }
  }
}

@end