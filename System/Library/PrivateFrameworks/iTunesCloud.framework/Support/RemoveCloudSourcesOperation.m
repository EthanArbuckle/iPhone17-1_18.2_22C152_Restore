@interface RemoveCloudSourcesOperation
+ (id)_icCloudSourceToMLCloudSourceMap;
+ (id)_icCloudSourceToMLCloudSourceMapDescription;
- (BOOL)deleteDB;
- (BOOL)disableActiveLockerAccount;
- (NSSet)removeCloudSouceAttributes;
- (id)_mlRemoveSourceAttributeFromICRemoveSource;
- (id)_removeCloudSourcesDescription;
- (void)main;
- (void)setDeleteDB:(BOOL)a3;
- (void)setDisableActiveLockerAccount:(BOOL)a3;
- (void)setRemoveCloudSouceAttributes:(id)a3;
@end

@implementation RemoveCloudSourcesOperation

- (void).cxx_destruct
{
}

- (void)setRemoveCloudSouceAttributes:(id)a3
{
}

- (NSSet)removeCloudSouceAttributes
{
  return self->_removeCloudSouceAttributes;
}

- (void)setDisableActiveLockerAccount:(BOOL)a3
{
  self->_disableActiveLockerAccount = a3;
}

- (BOOL)disableActiveLockerAccount
{
  return self->_disableActiveLockerAccount;
}

- (void)setDeleteDB:(BOOL)a3
{
  self->_deleteDB = a3;
}

- (BOOL)deleteDB
{
  return self->_deleteDB;
}

- (id)_removeCloudSourcesDescription
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000E1950;
  v11 = sub_1000E1960;
  id v12 = +[NSMutableString string];
  v3 = [(RemoveCloudSourcesOperation *)self removeCloudSouceAttributes];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E1968;
  v6[3] = &unk_1001BD618;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_mlRemoveSourceAttributeFromICRemoveSource
{
  v3 = +[NSMutableSet set];
  id v4 = [(RemoveCloudSourcesOperation *)self removeCloudSouceAttributes];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E1B48;
  v11[3] = &unk_1001BD5F0;
  id v5 = v3;
  id v12 = v5;
  [v4 enumerateObjectsUsingBlock:v11];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  id v7 = [v6 sagaOnDiskDatabaseRevision];

  if (v7)
  {
    v8 = +[RemoveCloudSourcesOperation _icCloudSourceToMLCloudSourceMap];
    uint64_t v9 = [v8 objectForKeyedSubscript:&off_1001CC290];
    [v5 addObject:v9];
  }

  return v5;
}

- (void)main
{
  if (sub_100010724())
  {
    [(CloudLibraryOperation *)self setStatus:1];
    v3 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v71 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Not running RemoveCloudSourcesOperation on non standalone wOS platform", buf, 0xCu);
    }
  }
  else
  {
    id v4 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(RemoveCloudSourcesOperation *)self deleteDB];
      unsigned int v6 = [(RemoveCloudSourcesOperation *)self disableActiveLockerAccount];
      id v7 = [(RemoveCloudSourcesOperation *)self _removeCloudSourcesDescription];
      *(_DWORD *)buf = 138544130;
      v71 = self;
      __int16 v72 = 1024;
      *(_DWORD *)v73 = v5;
      *(_WORD *)&v73[4] = 1024;
      *(_DWORD *)&v73[6] = v6;
      *(_WORD *)v74 = 2114;
      *(void *)&v74[2] = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Starting deleteDB=%{BOOL}u, disableActiveLockerAccount=%{BOOL}u, removeSources=%{public}@", buf, 0x22u);
    }
    v3 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"RemoveCloudSourcesOperation"];
    [v3 beginTransaction];
    v8 = [(CloudLibraryOperation *)self musicLibrary];
    uint64_t v9 = [(CloudLibraryOperation *)self clientIdentity];
    [v8 setClientIdentity:v9];

    +[NSDate timeIntervalSinceReferenceDate];
    double v11 = v10;
    id v12 = [(CloudLibraryOperation *)self musicLibrary];
    v13 = v12;
    v14 = &OBJC_INSTANCE_METHODS_UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation;
    if (self->_deleteDB)
    {
      v15 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v71 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Deleting database for deauthentication request", buf, 0xCu);
      }

      [v13 emptyAllTables];
      v16 = +[NSFileManager defaultManager];
      v17 = [v13 originalArtworkDirectory];
      [v16 removeItemAtPath:v17 error:0];

      v18 = [v13 rootArtworkCacheDirectory];
      [v16 removeItemAtPath:v18 error:0];
    }
    else
    {
      v16 = [v12 sagaCloudLibraryCUID];
      v18 = [v13 sagaCloudLibraryTroveID];
      if ([v16 length] && objc_msgSend(v18, "length"))
      {
        v19 = [CloudLibraryOptOutOperation alloc];
        v20 = [(CloudLibraryOperation *)self configuration];
        v21 = [(CloudLibraryOptOutOperation *)v19 initWithConfiguration:v20 CUID:v16 troveID:v18];

        [(CloudLibraryOptOutOperation *)v21 setName:@"com.apple.itunescloudd.DisableCloudLibrary.optOutOperation"];
        v22 = +[ICDServer server];
        [v22 addOperation:v21 priority:1];
      }
      uint64_t v23 = [(CloudLibraryOperation *)self userIdentity];
      v24 = [(CloudLibraryOperation *)self userIdentityStore];
      id v67 = 0;
      v25 = [v24 getPropertiesForUserIdentity:v23 error:&v67];
      v55 = v24;
      id v56 = v67;
      v54 = (void *)v23;
      v57 = v25;
      if (v56 || !v25)
      {
        v33 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v71 = self;
          __int16 v72 = 2114;
          *(void *)v73 = v56;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ - Error (%{public}@) loading account properties. Not removing locker bit from account", buf, 0x16u);
        }
      }
      else
      {
        unsigned int v26 = [v25 isActiveLocker];
        v27 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = [v25 DSID];
          v29 = ICCreateLoggableValueForDSID();
          *(_DWORD *)buf = 138543874;
          v71 = self;
          __int16 v72 = 2114;
          *(void *)v73 = v29;
          *(_WORD *)&v73[8] = 1024;
          *(_DWORD *)v74 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ - DSID=%{public}@, isActiveLocker=%{BOOL}u", buf, 0x1Cu);

          v14 = &OBJC_INSTANCE_METHODS_UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation;
        }

        if (self->_disableActiveLockerAccount) {
          unsigned int v30 = v26;
        }
        else {
          unsigned int v30 = 0;
        }
        if (v30 == 1)
        {
          dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
          v32 = [v57 DSID];
          v63[0] = _NSConcreteStackBlock;
          v63[1] = v14[77];
          v63[2] = sub_1000E25BC;
          v63[3] = &unk_1001BD580;
          v33 = v31;
          v64 = v33;
          v65 = self;
          id v66 = v57;
          [v24 disableLockerAccountWithDSID:v32 completionHandler:v63];

          dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
          ICSiriPostDynamiteClientStateChangedNotification();
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, ICCloudClientIsAuthenticatedDidChangeNotification, 0, 0, 1u);
          v35 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v71 = self;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%{public}@ - Posting notification [ICCloudClientIsAuthenticatedDidChangeNotification]", buf, 0xCu);
          }
        }
        else
        {
          v33 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v36 = [v57 DSID];
            v37 = ICCreateLoggableValueForDSID();
            BOOL disableActiveLockerAccount = self->_disableActiveLockerAccount;
            *(_DWORD *)buf = 138544130;
            v71 = self;
            __int16 v72 = 2114;
            *(void *)v73 = v37;
            *(_WORD *)&v73[8] = 1024;
            *(_DWORD *)v74 = disableActiveLockerAccount;
            *(_WORD *)&v74[4] = 1024;
            *(_DWORD *)&v74[6] = v26;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ - Not disabling locker account=%{public}@, _disableActiveLockerAccount=%{BOOL}u, isActiveLocker=%{BOOL}u", buf, 0x22u);

            v14 = &OBJC_INSTANCE_METHODS_UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation;
          }
        }
      }

      v39 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v71 = self;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cancelling any outstanding saga track downloads.", buf, 0xCu);
      }

      sub_10007C934(v13);
      v40 = [(RemoveCloudSourcesOperation *)self _mlRemoveSourceAttributeFromICRemoveSource];
      uint64_t v68 = MLDatabaseOperationAttributeRemoveCloudSourcesKey;
      v69 = v40;
      v41 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = v14[77];
      v61[2] = sub_1000E26B8;
      v61[3] = &unk_1001BDE80;
      dispatch_semaphore_t v62 = v42;
      v43 = v14;
      v44 = v42;
      [v13 removeCloudSourcesWithAttributes:v41 completionHandler:v61];
      dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);

      v14 = v43;
    }

    dispatch_semaphore_t v45 = dispatch_semaphore_create(0);
    v46 = [v13 databasePath];
    v47 = +[MLMediaLibraryService sharedMediaLibraryService];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = v14[77];
    v58[2] = sub_1000E26C0;
    v58[3] = &unk_1001BD5A8;
    v48 = v45;
    v59 = v48;
    v60 = self;
    [v47 performMaintenanceTasksForDatabaseAtPath:v46 withCompletionHandler:v58];

    dispatch_semaphore_wait(v48, 0xFFFFFFFFFFFFFFFFLL);
    [v13 notifyContentsDidChange];
    id v49 = objc_alloc_init((Class)CSSearchableIndex);
    [v49 deleteInteractionsWithGroupIdentifiers:&off_1001CCD30 bundleID:@"com.apple.Music" protectionClass:0 completionHandler:&stru_1001BD5C8];

    v50 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 138543618;
      v71 = self;
      __int16 v72 = 2048;
      *(double *)v73 = v51 - v11;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ - Completed disabling cloud library in %.2f seconds", buf, 0x16u);
    }

    v52 = [(CloudLibraryOperation *)self musicLibrary];
    v53 = MSVTCCIdentityForCurrentProcess();
    [v52 setClientIdentity:v53];

    [v3 endTransaction];
  }
}

+ (id)_icCloudSourceToMLCloudSourceMapDescription
{
  if (qword_1001F39A8 != -1) {
    dispatch_once(&qword_1001F39A8, &stru_1001BD638);
  }
  v2 = (void *)qword_1001F39A0;

  return v2;
}

+ (id)_icCloudSourceToMLCloudSourceMap
{
  v4[0] = &off_1001CC2A8;
  v4[1] = &off_1001CC2C0;
  v5[0] = MLDatabaseOperationAttributeRemovePurchaseHistoryKey;
  v5[1] = MLDatabaseOperationAttributeRemovePurchaseHistoryForMediaItemsKey;
  v4[2] = &off_1001CC2D8;
  v4[3] = &off_1001CC290;
  v5[2] = MLDatabaseOperationAttributeRemoveSubscriptionContentKey;
  v5[3] = MLDatabaseOperationAttributeRemoveMatchKey;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];

  return v2;
}

@end