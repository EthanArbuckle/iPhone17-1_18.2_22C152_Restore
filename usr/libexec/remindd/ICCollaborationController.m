@interface ICCollaborationController
- (ICCloudContext)cloudContext;
- (ICCollaborationController)initWithCloudContext:(id)a3;
- (NSManagedObjectContext)objectContext;
- (id)containerForAccountID:(id)a3;
- (id)containerForUserRecordID:(id)a3;
- (id)existingShareForObject:(id)a3;
- (id)fetchShareForObjectWithManagedObjectID:(id)a3;
- (id)newShareForObject:(id)a3;
- (id)objectForShare:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)rootRecordForObject:(id)a3;
- (void)acceptShareWithMetadata:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)acceptShareWithMetadata:(id)a3 container:(id)a4 accountID:(id)a5 fetchObjectWithCompletionHandler:(id)a6;
- (void)createShareForObjectWithManagedObjectID:(id)a3 appIconData:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)didSaveShare:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)didStopSharing:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)didStopSharing:(id)a3 recordID:(id)a4 accountID:(id)a5 queue:(id)a6 completionHandler:(id)a7;
- (void)didStopSharingRecordID:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)fetchShareIfNecessaryForObject:(id)a3 completionHandler:(id)a4;
- (void)populateShare:(id)a3 withObject:(id)a4;
- (void)prepareShare:(id)a3 forObject:(id)a4 completionHandler:(id)a5;
- (void)saveServerShare:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
- (void)saveShare:(id)a3 forObject:(id)a4 completionHandler:(id)a5;
- (void)saveShare:(id)a3 withRootRecord:(id)a4 object:(id)a5 completionHandler:(id)a6;
- (void)setCloudContext:(id)a3;
- (void)setObjectContext:(id)a3;
@end

@implementation ICCollaborationController

- (ICCollaborationController)initWithCloudContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCollaborationController;
  v5 = [(ICCollaborationController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICCollaborationController *)v5 setCloudContext:v4];
  }

  return v6;
}

- (id)fetchShareForObjectWithManagedObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10005EBB8;
  v20 = sub_10005EBC8;
  id v21 = 0;
  v5 = [(ICCollaborationController *)self cloudContext];
  id v6 = [v5 newBackgroundContext];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005EBD0;
  v11[3] = &unk_1008B0118;
  id v7 = v4;
  id v12 = v7;
  id v8 = v6;
  v14 = self;
  v15 = &v16;
  id v13 = v8;
  [v8 performBlockAndWait:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

- (void)createShareForObjectWithManagedObjectID:(id)a3 appIconData:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(ICCollaborationController *)self cloudContext];
  id v15 = [v14 newBackgroundContext];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005EDFC;
  v21[3] = &unk_1008B01D0;
  id v22 = v10;
  id v23 = v15;
  v24 = self;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  id v19 = v15;
  id v20 = v10;
  [v19 performBlockAndWait:v21];
}

- (id)rootRecordForObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 ckServerRecord];
  id v5 = [v4 copy];

  if (!v5)
  {
    id v6 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100753660(v3);
    }

    id v5 = [v3 newlyCreatedRecord];
  }

  return v5;
}

- (id)newShareForObject:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCollaborationController *)self rootRecordForObject:v4];
  id v6 = [v4 ckServerRecord];
  id v7 = [v6 share];
  id v8 = [v7 recordID];

  id v9 = objc_alloc((Class)CKShare);
  if (v8)
  {
    id v10 = [v9 initWithRootRecord:v5 shareID:v8];
    id v11 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v10 ic_loggingDescription];
      id v13 = [v4 shortLoggingDescription];
      int v18 = 138412546;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v13;
      v14 = "Created share %@ with existing share reference for %@";
      id v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    id v10 = [v9 initWithRootRecord:v5];
    id v11 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v10 ic_loggingDescription];
      id v13 = [v4 shortLoggingDescription];
      int v18 = 138412546;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v13;
      v14 = "Created share %@ for %@";
      id v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_6;
    }
  }

  [(ICCollaborationController *)self populateShare:v10 withObject:v4];
  return v10;
}

- (void)populateShare:(id)a3 withObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 shareTitle];
  [v5 setObject:v7 forKeyedSubscript:CKShareTitleKey];

  id v8 = [v6 shareType];
  [v5 setObject:v8 forKeyedSubscript:CKShareTypeKey];

  id v9 = [v6 recordID];
  if (v9)
  {
    id v10 = [objc_alloc((Class)CKReference) initWithRecordID:v9 action:0];
    [v5 setObject:v10 forKeyedSubscript:@"RootRecord"];
  }
  else
  {
    id v11 = [v5 ic_loggingDescription];
    id v12 = [v6 shortLoggingDescription];
    id v10 = +[NSString stringWithFormat:@"Trying to populate share %@ with no record ID for %@", v11, v12];

    [(id)objc_opt_class() faultAndPromptToFileRadarWithICTap2RadarType:5 title:@"populateShare with nil recordID" description:&stru_1008D0E58 logMessage:v10];
  }

  id v13 = [v6 recordType];

  if (v13)
  {
    v14 = [v6 recordType];
    [v5 setObject:v14 forKeyedSubscript:@"RootRecordType"];
  }
  else
  {
    v14 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1007536E4();
    }
  }
}

- (id)existingShareForObject:(id)a3
{
  id v4 = a3;
  id v5 = INDateRelevanceProvider_ptr;
  id v6 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Checking for an existing share for %@", buf, 0xCu);
  }
  id v8 = v4;
  v41 = v8;
  if (v8)
  {
    v40 = self;
    for (i = v8; ; i = v23)
    {
      id v10 = [v5[201] cloudkitCollaboration];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [i shortLoggingDescription];
        id v12 = [i ckServerShare];
        [v12 ic_loggingDescription];
        v14 = id v13 = v5;
        id v15 = [i ckServerRecord];
        os_log_type_t v16 = [v15 share];
        id v17 = [v16 recordID];
        int v18 = [v17 ic_loggingDescription];
        *(_DWORD *)buf = 138412802;
        v44 = v11;
        __int16 v45 = 2112;
        v46 = v14;
        __int16 v47 = 2112;
        v48 = v18;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Checking for share on %@ serverShare=%@ serverRecord.share=%@", buf, 0x20u);

        id v5 = v13;
      }

      uint64_t v19 = [i ckServerShare];
      if (v19)
      {
        v29 = (void *)v19;
        [(ICCollaborationController *)v40 populateShare:v19 withObject:i];
        goto LABEL_21;
      }
      __int16 v20 = [i ckServerRecord];
      id v21 = [v20 share];

      if (v21) {
        break;
      }
      id v22 = [i parentCloudObject];
      id v23 = v22;
      if (!v22) {
        goto LABEL_19;
      }
      v24 = [v22 recordID];
      id v25 = [v24 zoneID];
      id v26 = [i recordID];
      id v27 = [v26 zoneID];
      unsigned __int8 v28 = [v25 isEqual:v27];

      if ((v28 & 1) == 0)
      {
        v31 = [v5[201] cloudkitCollaboration];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          v33 = [v23 shortLoggingDescription];
          v34 = [i shortLoggingDescription];
          v42 = [v23 recordID];
          v35 = [v42 zoneID];
          v36 = [v35 ic_loggingDescription];
          v37 = [i recordID];
          v38 = [v37 zoneID];
          v39 = [v38 ic_loggingDescription];
          *(_DWORD *)buf = 138413058;
          v44 = v33;
          __int16 v45 = 2112;
          v46 = v34;
          __int16 v47 = 2112;
          v48 = v36;
          __int16 v49 = 2112;
          v50 = v39;
          _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Not checking parent object %@ for %@ because it's not in the same zone (object in %@ and parent in %@)", buf, 0x2Au);
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    v30 = [v5[201] cloudkitCollaboration];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100753784(buf, v41, &v44, v30);
    }
  }
LABEL_20:
  i = 0;
  v29 = 0;
LABEL_21:

  return v29;
}

- (void)prepareShare:(id)a3 forObject:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 ic_loggingDescription];
    id v13 = [v9 shortLoggingDescription];
    *(_DWORD *)buf = 138412546;
    id v26 = v12;
    __int16 v27 = 2112;
    unsigned __int8 v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Preparing share %@ for %@", buf, 0x16u);
  }
  v14 = [v9 managedObjectContext];
  [(ICCollaborationController *)self setObjectContext:v14];

  id v15 = [(ICCollaborationController *)self cloudContext];
  os_log_type_t v16 = [v9 recordID];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005FDB4;
  v20[3] = &unk_1008AEC28;
  id v21 = v9;
  id v22 = self;
  id v23 = v8;
  id v24 = v10;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  [v15 finishOperationsForRecordID:v16 completionHandler:v20];
}

- (void)saveShare:(id)a3 forObject:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v15 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10075384C(v15, v16, v17);
    }
  }
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = sub_10005EBB8;
  unsigned __int8 v28 = sub_10005EBC8;
  id v29 = [(ICCollaborationController *)self rootRecordForObject:v9];
  uint64_t v11 = v25[5];
  if (v11)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000602CC;
    v18[3] = &unk_1008B0220;
    id v19 = v9;
    __int16 v20 = self;
    id v21 = v8;
    id v23 = &v24;
    id v22 = v10;
    [(ICCollaborationController *)self saveShare:v21 withRootRecord:v11 object:v19 completionHandler:v18];

    id v12 = v19;
  }
  else
  {
    id v13 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = [v9 shortLoggingDescription];
      sub_1007537FC(v14, (uint64_t)v30, v13);
    }

    id v12 = +[NSError errorWithDomain:@"com.apple.reminders" code:208 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v12);
  }

  _Block_object_dispose(&v24, 8);
}

- (void)saveShare:(id)a3 withRootRecord:(id)a4 object:(id)a5 completionHandler:(id)a6
{
  id v31 = a3;
  id v32 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v10 accountCKIdentifier];
  if ([v12 length])
  {
    v30 = [(ICCollaborationController *)self containerForAccountID:v12];
    id v13 = objc_alloc((Class)CKModifyRecordsOperation);
    v49[0] = v31;
    v49[1] = v32;
    v14 = +[NSArray arrayWithObjects:v49 count:2];
    id v15 = [v13 initWithRecordsToSave:v14 recordIDsToDelete:0];

    [v15 setQualityOfService:17];
    uint64_t v16 = [v30 privateCloudDatabase];
    [v15 setDatabase:v16];

    objc_initWeak(&location, v15);
    uint64_t v17 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      [v31 ic_loggingDescription];
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      [v32 ic_loggingDescription];
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = objc_loadWeakRetained(&location);
      [v20 ic_loggingDescription];
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = [v10 ckIdentifier];
      *(_DWORD *)buf = 138413058;
      id v42 = v18;
      __int16 v43 = 2112;
      id v44 = v19;
      __int16 v45 = 2114;
      id v46 = v21;
      __int16 v47 = 2114;
      v48 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Saving Share: %@ with root record: %@ %{public}@ %{public}@", buf, 0x2Au);
    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10006098C;
    v33[3] = &unk_1008B02D8;
    objc_copyWeak(&v39, &location);
    id v34 = v10;
    id v35 = v32;
    id v36 = v12;
    id v37 = v31;
    id v38 = v11;
    [v15 setModifyRecordsCompletionBlock:v33];
    id v23 = objc_alloc_init((Class)CKOperationGroup);
    [v23 setName:@"SaveShare"];
    [v23 setQuantity:1];
    [v23 setExpectedSendSize:1];
    [v23 setExpectedReceiveSize:1];
    [v15 setGroup:v23];
    uint64_t v24 = [v15 database];
    [v24 addOperation:v15];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

    goto LABEL_9;
  }
  id v25 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = [v10 ckIdentifier];
    __int16 v27 = [v31 ic_loggingDescription];
    unsigned __int8 v28 = [v32 recordID];
    id v29 = [v28 ic_loggingDescription];
    *(_DWORD *)buf = 138543874;
    id v42 = v26;
    __int16 v43 = 2112;
    id v44 = v27;
    __int16 v45 = 2112;
    id v46 = v29;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Trying to saveShare with nil or empty accountID: ckIdentifier: %{public}@, share: %@, rootRecordID: %@", buf, 0x20u);
  }
  if (v11)
  {
    v30 = ICGenericError();
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v30);
LABEL_9:
  }
}

- (void)fetchShareIfNecessaryForObject:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountCKIdentifier];
  if ([v8 length])
  {
    id v9 = [v6 ckServerRecord];
    id v10 = [v9 share];
    id v11 = [v10 recordID];

    if (v11
      && ([v6 ckServerShare], id v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
    {
      v14 = +[REMLog cloudkitCollaboration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [v6 ckServerRecord];
        id v15 = [v30 share];
        uint64_t v16 = [v15 recordID];
        uint64_t v17 = [v16 ic_loggingDescription];
        id v18 = [v6 shortLoggingDescription];
        *(_DWORD *)buf = 138412546;
        id v41 = v17;
        __int16 v42 = 2112;
        __int16 v43 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Need to fetch share %@ for %@", buf, 0x16u);
      }
      id v19 = [(ICCollaborationController *)self cloudContext];
      id v20 = [v19 containerForAccountID:v8];

      id v21 = objc_alloc((Class)CKFetchRecordsOperation);
      id v39 = v11;
      id v22 = +[NSArray arrayWithObjects:&v39 count:1];
      id v23 = [v21 initWithRecordIDs:v22];

      uint64_t v24 = [v20 databaseWithDatabaseScope:[v11 rd_ckDatabaseScope]];
      [v23 setDatabase:v24];

      [v23 setQueuePriority:8];
      [v23 setQualityOfService:17];
      objc_initWeak(&location, v23);
      id v25 = +[REMLog cloudkitCollaboration];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        [v11 ic_loggingDescription];
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v27 = [v23 ic_loggingDescription];
        *(_DWORD *)buf = 138412546;
        id v41 = v26;
        __int16 v42 = 2112;
        __int16 v43 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Fetching share %@ with %@", buf, 0x16u);
      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10006173C;
      v31[3] = &unk_1008B0300;
      id v11 = v11;
      id v32 = v11;
      objc_copyWeak(&v37, &location);
      id v33 = v6;
      id v34 = self;
      id v35 = v8;
      id v36 = v7;
      [v23 setFetchRecordsCompletionBlock:v31];
      id v28 = objc_alloc_init((Class)CKOperationGroup);
      [v28 setName:@"FetchShare"];
      [v28 setQuantity:1];
      [v28 setExpectedSendSize:1];
      [v28 setExpectedReceiveSize:1];
      [v23 setGroup:v28];
      id v29 = [v23 database];
      [v29 addOperation:v23];

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    goto LABEL_14;
  }
  id v13 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100753C8C(v6);
  }

  if (v7)
  {
    id v11 = +[NSError errorWithDomain:@"com.apple.reminders" code:214 userInfo:0];
    (*((void (**)(id, id))v7 + 2))(v7, v11);
LABEL_14:
  }
}

- (void)didSaveShare:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100061A7C;
  v12[3] = &unk_1008AED80;
  id v13 = a5;
  id v14 = a6;
  id v10 = v14;
  id v11 = v13;
  [(ICCollaborationController *)self saveServerShare:a3 accountID:a4 completionHandler:v12];
}

- (void)saveServerShare:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICCollaborationController *)self cloudContext];
  id v12 = [v11 newBackgroundContext];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100061C60;
  v17[3] = &unk_1008AEE98;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v12;
  id v21 = v10;
  id v13 = v10;
  id v14 = v12;
  id v15 = v9;
  id v16 = v8;
  [v14 performBlockAndWait:v17];
}

- (id)objectForShare:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"RootRecord"];
  id v12 = [v11 recordID];
  if (v12)
  {
    id v13 = [v8 objectForKeyedSubscript:@"RootRecordType"];
    if (!v13)
    {
      id v14 = +[REMLog cloudkitCollaboration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_100753DA0(v8, v14);
      }
    }
    id v15 = [(ICCollaborationController *)self cloudContext];
    id v16 = [v15 existingCloudObjectForRecordID:v12 recordType:v13 accountID:v9 context:v10];
  }
  else
  {
    id v13 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100753D14(v8, v13);
    }
    id v16 = 0;
  }

  return v16;
}

- (void)didStopSharing:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
}

- (void)didStopSharingRecordID:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
}

- (void)didStopSharing:(id)a3 recordID:(id)a4 accountID:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12 | v13)
  {
    uint64_t v17 = [(ICCollaborationController *)self cloudContext];
    id v18 = [v17 newBackgroundContext];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10006215C;
    v20[3] = &unk_1008B0328;
    id v21 = (id)v12;
    id v22 = self;
    id v23 = v14;
    id v24 = v18;
    id v25 = (id)v13;
    id v26 = v15;
    id v27 = v16;
    id v19 = v18;
    [v19 performBlockAndWait:v20];
  }
  else
  {
    id v19 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "didStopSharing: Invalid arguments, share or recordID must be non-nil.", buf, 2u);
    }
  }
}

- (void)acceptShareWithMetadata:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Accepting share for metadata %@", (uint8_t *)&buf, 0xCu);
  }

  unint64_t v12 = [(ICCollaborationController *)self cloudContext];
  id v13 = [v12 newBackgroundContext];

  id v14 = [v8 callingParticipant];
  id v15 = [v14 userIdentity];
  id v16 = [v15 userRecordID];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000;
  v57 = sub_10005EBB8;
  v58 = sub_10005EBC8;
  id v59 = 0;
  uint64_t v17 = [(ICCollaborationController *)self cloudContext];
  id v18 = [v17 containersByAccountID];
  BOOL v19 = [v18 count] == 0;

  if (v19) {
    goto LABEL_7;
  }
  id v20 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v51 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Accepting share: Accounts detected. Fetching container and accountID.", v51, 2u);
  }

  id v21 = +[RDDispatchQueue_ObjC utilityQueue];
  dispatch_assert_queue_not_V2(v21);

  id v22 = +[RDDispatchQueue_ObjC xpcDefaultQueue];
  dispatch_assert_queue_not_V2(v22);

  id v23 = [(ICCollaborationController *)self containerForUserRecordID:v16];
  id v24 = [v23 options];
  id v25 = [v24 accountOverrideInfo];
  uint64_t v26 = [v25 accountID];
  id v27 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v26;

  if (!v23)
  {
LABEL_7:
    id v28 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Accepting share: Single account or unable to fetch container. Using containerWithIdentifier.", v51, 2u);
    }

    id v29 = [v8 containerIdentifier];
    id v23 = +[CKContainer containerWithIdentifier:v29];

    v30 = [v23 options];
    id v31 = [v30 accountOverrideInfo];
    uint64_t v32 = [v31 accountID];
    id v33 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v32;
  }
  if (![*(id *)(*((void *)&buf + 1) + 40) length])
  {
    id v34 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      id v39 = [v16 recordName];
      v40 = [(ICCollaborationController *)self cloudContext];
      id v37 = [v40 containersByAccountID];
      id v38 = [v37 count];
      *(_DWORD *)v51 = 138543618;
      v52 = v39;
      __int16 v53 = 2048;
      id v54 = v38;
      _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Accepting share: Unable to fetch account ID. Using primaryCloudKitAccountInContext. userRecordName=%{public}@, containers.count=%lu", v51, 0x16u);
    }
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100062A84;
    v48[3] = &unk_1008ADD28;
    p_long long buf = &buf;
    v48[4] = self;
    id v49 = v13;
    [v49 performBlockAndWait:v48];
  }
  if (!v23)
  {
    id v35 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_100753E2C();
    }
    goto LABEL_22;
  }
  if (![*(id *)(*((void *)&buf + 1) + 40) length])
  {
    id v35 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_100753EA0();
    }
LABEL_22:

    id v36 = ICGenericError();
    (*((void (**)(id, void *, void, void))v10 + 2))(v10, v36, 0, 0);

    goto LABEL_23;
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100062B18;
  v41[3] = &unk_1008B03F0;
  v41[4] = self;
  id v42 = v8;
  __int16 v47 = &buf;
  id v43 = v13;
  id v44 = v9;
  id v46 = v10;
  id v45 = v23;
  [v43 performBlockAndWait:v41];

LABEL_23:
  _Block_object_dispose(&buf, 8);
}

- (id)containerForUserRecordID:(id)a3
{
  id v4 = [a3 recordName];
  id v5 = [(ICCollaborationController *)self cloudContext];
  id v6 = [v5 containersByAccountID];
  id v7 = [v6 allValues];

  id v8 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(ICCollaborationController *)self cloudContext];
    id v10 = [v9 containersByAccountID];
    id v11 = [v10 allKeys];
    *(_DWORD *)long long buf = 138543362;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "containerForUserRecordID accountIDs=%{public}@", buf, 0xCu);
  }
  unint64_t v12 = +[RDDispatchQueue_ObjC utilityQueue];
  dispatch_assert_queue_not_V2(v12);

  id v13 = +[RDDispatchQueue_ObjC xpcDefaultQueue];
  dispatch_assert_queue_not_V2(v13);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v7;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v17 = *(void *)v25;
    *(void *)&long long v16 = 138543362;
    long long v23 = v16;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        BOOL v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v20 = +[ICCloudContext userRecordNameForContainer:](ICCloudContext, "userRecordNameForContainer:", v19, v23, (void)v24);
        id v21 = +[REMLog cloudkitCollaboration];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v23;
          v30 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "containerForUserRecordID containerUserRecordName=%{public}@", buf, 0xCu);
        }

        if ([v20 isEqualToString:v4])
        {
          id v15 = v19;

          goto LABEL_15;
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v15;
}

- (id)containerForAccountID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(ICCollaborationController *)self cloudContext];
    id v6 = [v5 containersByAccountID];
    id v7 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    id v8 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100753F14(v8);
    }

    id v7 = 0;
  }

  return v7;
}

- (void)acceptShareWithMetadata:(id)a3 container:(id)a4 accountID:(id)a5 fetchObjectWithCompletionHandler:(id)a6
{
  id v10 = a3;
  id v33 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 share];
  id v34 = [v13 URL];

  if (!v34)
  {
    id v29 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      sub_100753F58(v29, v30, v31);
    }
  }
  id v14 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v48 = v34;
    __int16 v49 = 2114;
    id v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Accepting shared object at URL: %@, account ID = %{public}@", buf, 0x16u);
  }

  id v35 = [(ICCollaborationController *)self cloudContext];
  id v15 = objc_alloc((Class)CKAcceptSharesOperation);
  id v46 = v10;
  long long v16 = +[NSArray arrayWithObjects:&v46 count:1];
  id v17 = [v15 initWithShareMetadatas:v16];

  [v17 setQualityOfService:17];
  [v17 setQueuePriority:8];
  id v18 = [v17 configuration];
  [v18 setContainer:v33];

  objc_initWeak(&location, v17);
  +[NSMutableDictionary dictionary];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100063870;
  v43[3] = &unk_1008B0418;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v44 = v19;
  [v17 setPerShareCompletionBlock:v43];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000638D8;
  v36[3] = &unk_1008B0490;
  id v20 = v10;
  id v37 = v20;
  objc_copyWeak(&v42, &location);
  id v21 = v12;
  id v41 = v21;
  id v32 = v11;
  id v38 = v32;
  id v39 = self;
  id v22 = v19;
  id v40 = v22;
  [v17 setAcceptSharesCompletionBlock:v36];
  id v23 = objc_alloc_init((Class)CKOperationGroup);
  [v23 setName:@"AcceptShare"];
  [v23 setQuantity:1];
  [v23 setExpectedSendSize:1];
  [v23 setExpectedReceiveSize:1];
  [v17 setGroup:v23];
  long long v24 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    long long v25 = [v20 share];
    [v25 ic_loggingDescription];
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    long long v27 = [v17 ic_loggingDescription];
    *(_DWORD *)long long buf = 138412546;
    id v48 = v26;
    __int16 v49 = 2112;
    id v50 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Accepting %@ with %@", buf, 0x16u);
  }
  id v28 = [v35 operationQueue];
  [v28 addOperation:v17];

  [v35 errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary];
  objc_destroyWeak(&v42);

  objc_destroyWeak(&location);
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
}

- (NSManagedObjectContext)objectContext
{
  return self->_objectContext;
}

- (void)setObjectContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectContext, 0);

  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end