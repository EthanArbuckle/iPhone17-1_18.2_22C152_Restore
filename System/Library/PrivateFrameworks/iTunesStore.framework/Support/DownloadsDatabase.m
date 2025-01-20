@interface DownloadsDatabase
+ (id)downloadsDatabase;
+ (void)_setupDatabase:(id)a3;
- (DownloadsDatabase)init;
- (id)_modifyUsingTransaction:(id)a3 block:(id)a4;
- (id)_newSessionDescription;
- (id)modifyExternalUsingTransactionBlock:(id)a3;
- (id)modifyUsingPurchaseTransactionBlock:(id)a3;
- (id)modifyUsingTransactionBlock:(id)a3;
- (id)newDispatchSourceWithType:(dispatch_source_type_s *)a3;
- (void)_commitExternalChangesForChangeset:(id)a3;
- (void)dealloc;
- (void)dispatchAfter:(unint64_t)a3 block:(id)a4;
- (void)dispatchBlockAsync:(id)a3;
- (void)dispatchBlockSync:(id)a3;
- (void)downloadHandlerManager:(id)a3 sessionsDidChange:(id)a4;
- (void)modifyAsyncUsingPurchaseTransactionBlock:(id)a3;
- (void)modifyAsyncUsingTransactionBlock:(id)a3;
- (void)modifyExternalAsyncUsingTransactionBlock:(id)a3;
- (void)readUsingTransactionBlock:(id)a3;
@end

@implementation DownloadsDatabase

- (id)modifyUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(DownloadsDatabase *)self _newSessionDescription];
  v6 = [(DownloadsExternalTransaction *)[DownloadsTransaction alloc] initWithSessionDescriptor:v5];
  v7 = [(DownloadsDatabase *)self _modifyUsingTransaction:v6 block:v4];

  return v7;
}

+ (id)downloadsDatabase
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C904;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401BE8 != -1) {
    dispatch_once(&qword_100401BE8, block);
  }
  v2 = (void *)qword_100401BE0;

  return v2;
}

- (id)modifyUsingPurchaseTransactionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(DownloadsDatabase *)self _newSessionDescription];
  v6 = [(DownloadsExternalTransaction *)[PurchaseDownloadsTransaction alloc] initWithSessionDescriptor:v5];
  v7 = [(DownloadsDatabase *)self _modifyUsingTransaction:v6 block:v4];

  return v7;
}

- (id)_newSessionDescription
{
  v3 = objc_alloc_init(DownloadsSessionDescriptor);
  [(DownloadsSessionDescriptor *)v3 setDatabase:self->_database];
  [(DownloadsSessionDescriptor *)v3 setExternalState:self->_externalState];
  [(DownloadsSessionDescriptor *)v3 setPipeline:self->_pipeline];
  [(DownloadsSessionDescriptor *)v3 setPolicyManager:self->_policyManager];
  return v3;
}

- (void)_commitExternalChangesForChangeset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 canceledAppDataRestoreIDs];
  if ([v4 count])
  {
    id v5 = +[Daemon daemon];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10000D06C;
    v68[3] = &unk_1003A3140;
    id v69 = v4;
    [v5 keepAliveWithAssertion:@"com.apple.itunesstored.DownloadsDatabase" block:v68];
  }
  v6 = [v3 applicationWorkspaceChanges];
  if ([v6 count])
  {
    v7 = +[ApplicationWorkspace defaultWorkspace];
    [v7 applyWorkspaceChanges:v6];
  }
  v54 = v6;
  v55 = v4;
  v8 = [v3 deletedHTTPCookies];
  v9 = [v3 HTTPCookies];
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    v10 = +[NSHTTPCookieStorage sharedHTTPCookieStorage];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v65;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v65 != v14) {
            objc_enumerationMutation(v11);
          }
          [v10 deleteCookie:*(void *)(*((void *)&v64 + 1) + 8 * (void)v15)];
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v13);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v16 = v9;
    id v17 = [v16 countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v61;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v61 != v19) {
            objc_enumerationMutation(v16);
          }
          [v10 setCookie:*(void *)(*((void *)&v60 + 1) + 8 * (void)v20)];
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v18);
    }

    [v10 _saveCookies];
  }
  v21 = [v3 IPodLibraryItems];
  if ([v21 count])
  {
    v22 = +[IPodLibrary deviceIPodLibrary];
    [v22 scheduleLibraryItems:v21];
  }
  v53 = v8;
  v23 = objc_msgSend(v3, "deletedIPodLibraryDownloadIDs", v9);
  if ([v23 count])
  {
    v24 = +[IPodLibrary deviceIPodLibrary];
    [v24 removeDownloadsWithIdentifiers:v23 canceled:0];
  }
  v25 = [v3 canceledIPodLibraryDownloadIDs];
  if ([v25 count])
  {
    v26 = +[IPodLibrary deviceIPodLibrary];
    [v26 removeDownloadsWithIdentifiers:v25 canceled:1];

    v27 = +[PurchaseController sharedController];
    [v27 cancelPurchasesForDownloadsWithIdentifiers:v25];
  }
  v28 = [v3 SSAppWakeRequests];
  if ([v28 count])
  {
    v29 = +[SpringBoardUtility sharedInstance];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v30 = v28;
    id v31 = [v30 countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v57;
      do
      {
        v34 = 0;
        do
        {
          if (*(void *)v57 != v33) {
            objc_enumerationMutation(v30);
          }
          [v29 wakeAppUsingRequest:*(void *)(*((void *)&v56 + 1) + 8 * (void)v34)];
          v34 = (char *)v34 + 1;
        }
        while (v32 != v34);
        id v32 = [v30 countByEnumeratingWithState:&v56 objects:v70 count:16];
      }
      while (v32);
    }
  }
  unsigned __int8 v35 = [v3 downloadChangeTypes];
  unsigned __int8 v36 = v35;
  if ((v35 & 0x40) != 0)
  {
    v42 = +[SpringBoardUtility sharedInstance];
    [v42 resetEnabledRemoteNotificationTypes];

    if ((v36 & 4) == 0)
    {
LABEL_39:
      if ((v36 & 0x80) == 0) {
        goto LABEL_40;
      }
LABEL_47:
      v37 = [v3 restoreReason];
      v45 = +[StoreDownloadQueue sharedDownloadQueue];
      v38 = v45;
      if (v37) {
        CFStringRef v46 = v37;
      }
      else {
        CFStringRef v46 = @"other";
      }
      [(__CFString *)v45 restoreAllRestorableDownloadsWithReason:v46];
      goto LABEL_51;
    }
  }
  else if ((v35 & 4) == 0)
  {
    goto LABEL_39;
  }
  v43 = objc_alloc_init(FinishDownloadsOperation);
  v44 = +[ISOperationQueue mainQueue];
  [v44 addOperation:v43];

  if ((v36 & 0x80) != 0) {
    goto LABEL_47;
  }
LABEL_40:
  if ((v36 & 0x20) != 0)
  {
    v37 = [v3 restorableDownloadIDs];
    v38 = [v3 restoreReason];
    v39 = +[StoreDownloadQueue sharedDownloadQueue];
    v40 = v39;
    if (v38) {
      CFStringRef v41 = v38;
    }
    else {
      CFStringRef v41 = @"other";
    }
    [v39 restoreDownloadsWithIdentifiers:v37 reason:v41];

LABEL_51:
  }
  if ((v36 & 8) != 0)
  {
    v47 = [v3 changedDownloadKinds];
    unsigned int v48 = [v47 containsObject:SSDownloadKindInAppContent];

    if (v48)
    {
      v49 = +[MicroPaymentQueue paymentQueue];
      v50 = [v3 removedPersistentDownloadIDs];
      [v49 finishDownloadsWithIdentifiers:v50];
    }
  }
  v51 = +[DownloadController controller];
  [v51 notifyClientsOfChangeset:v3];
}

- (void)readUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[Daemon daemon];
  [v5 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  database = self->_database;
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1000085EC;
  id v12 = &unk_1003A3240;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:&v9];
  v8 = +[Daemon daemon];
  [v8 releaseKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];
}

- (id)_modifyUsingTransaction:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v8 = +[Daemon daemon];
  [v8 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  database = self->_database;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_100009980;
  id v18 = &unk_1003A3290;
  v22 = &v23;
  id v10 = v7;
  id v21 = v10;
  id v11 = v6;
  id v19 = v11;
  v20 = self;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:&v15];
  if (*((unsigned char *)v24 + 24))
  {
    id v12 = objc_msgSend(v11, "changeset", v15, v16, v17, v18);
    [(DownloadsDatabase *)self _commitExternalChangesForChangeset:v12];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = +[Daemon daemon];
  [v13 releaseKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  _Block_object_dispose(&v23, 8);

  return v12;
}

+ (void)_setupDatabase:(id)a3
{
  id v3 = a3;
  [v3 executeSQL:@"PRAGMA journal_mode=WAL;"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C518;
  v5[3] = &unk_1003A3118;
  id v6 = v3;
  id v4 = v3;
  [v4 performTransactionWithBlock:v5];
}

- (DownloadsDatabase)init
{
  id v3 = +[DownloadDatabaseSchema databasePath];
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C800;
    block[3] = &unk_1003A3140;
    id v29 = v3;
    if (qword_100401BD8 != -1) {
      dispatch_once(&qword_100401BD8, block);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)DownloadsDatabase;
  id v5 = [(DownloadsDatabase *)&v27 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)SSSQLiteDatabase);
    id v7 = +[NSURL fileURLWithPath:v4];
    id v8 = [v6 initWithDatabaseURL:v7 readOnly:0 protectionType:NSFileProtectionCompleteUntilFirstUserAuthentication];
    v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    [*((id *)v5 + 1) setSetupBlock:&stru_1003A3180];
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    id v11 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v10;

    id v12 = objc_alloc_init(ExternalDownloadState);
    id v13 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v12;

    id v14 = [[DownloadPipeline alloc] initWithDownloadsDatabase:v5];
    v15 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v14;

    uint64_t v16 = [[DownloadPolicyManager alloc] initWithDownloadsDatabase:v5];
    id v17 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v16;

    id v18 = +[DownloadHandlerManager handlerManager];
    [v18 addHandlerObserver:v5];

    if (*((void *)v5 + 1))
    {
      id v19 = +[SSWeakReference weakReferenceWithObject:v5];
      id v20 = [*((id *)v5 + 1) newDispatchSourceWithType:&_dispatch_source_type_timer];
      id v21 = (void *)*((void *)v5 + 7);
      *((void *)v5 + 7) = v20;

      dispatch_source_set_timer(*((dispatch_source_t *)v5 + 7), 0, 0x2540BE400uLL, 0);
      v22 = *((void *)v5 + 7);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000BFA0;
      v25[3] = &unk_1003A3140;
      id v26 = v19;
      id v23 = v19;
      dispatch_source_set_event_handler(v22, v25);
      dispatch_resume(*((dispatch_object_t *)v5 + 7));
    }
  }

  return (DownloadsDatabase *)v5;
}

- (void)dealloc
{
  id v3 = +[DownloadHandlerManager handlerManager];
  [v3 removeHandlerObserver:self];

  progressTickTimer = self->_progressTickTimer;
  if (progressTickTimer) {
    dispatch_source_cancel((dispatch_source_t)progressTickTimer);
  }
  dirtyProgressTimer = self->_dirtyProgressTimer;
  if (dirtyProgressTimer) {
    dispatch_source_cancel((dispatch_source_t)dirtyProgressTimer);
  }
  v6.receiver = self;
  v6.super_class = (Class)DownloadsDatabase;
  [(DownloadsDatabase *)&v6 dealloc];
}

- (void)dispatchAfter:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = +[Daemon daemon];
  [v7 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  database = self->_database;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000CA10;
  v10[3] = &unk_1003A31C8;
  id v11 = v6;
  id v9 = v6;
  [(SSSQLiteDatabase *)database dispatchAfter:a3 block:v10];
}

- (void)dispatchBlockAsync:(id)a3
{
  id v4 = a3;
  id v5 = +[Daemon daemon];
  [v5 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  database = self->_database;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000CB38;
  v8[3] = &unk_1003A31C8;
  id v9 = v4;
  id v7 = v4;
  [(SSSQLiteDatabase *)database dispatchBlockAsync:v8];
}

- (void)dispatchBlockSync:(id)a3
{
}

- (void)modifyAsyncUsingPurchaseTransactionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CC34;
  v4[3] = &unk_1003A31F0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(DownloadsDatabase *)v5 dispatchBlockAsync:v4];
}

- (void)modifyAsyncUsingTransactionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CCF0;
  v4[3] = &unk_1003A31F0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(DownloadsDatabase *)v5 dispatchBlockAsync:v4];
}

- (void)modifyExternalAsyncUsingTransactionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CDAC;
  v4[3] = &unk_1003A31F0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(DownloadsDatabase *)v5 dispatchBlockAsync:v4];
}

- (id)modifyExternalUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(DownloadsDatabase *)self _newSessionDescription];
  id v6 = +[Daemon daemon];
  [v6 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  id v7 = [[DownloadsExternalTransaction alloc] initWithSessionDescriptor:v5];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  database = self->_database;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000CF80;
  v14[3] = &unk_1003A3218;
  id v17 = &v18;
  id v9 = v4;
  id v16 = v9;
  id v10 = v7;
  v15 = v10;
  [(SSSQLiteDatabase *)database dispatchBlockSync:v14];
  id v11 = +[Daemon daemon];
  [v11 releaseKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  if (*((unsigned char *)v19 + 24))
  {
    id v12 = [(DownloadsExternalTransaction *)v10 changeset];
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)newDispatchSourceWithType:(dispatch_source_type_s *)a3
{
  return [(SSSQLiteDatabase *)self->_database newDispatchSourceWithType:a3];
}

- (void)downloadHandlerManager:(id)a3 sessionsDidChange:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D05C;
  v5[3] = &unk_1003A3268;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(DownloadsDatabase *)v6 dispatchBlockAsync:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTickTimer, 0);
  objc_storeStrong((id *)&self->_policyManager, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_externalState, 0);
  objc_storeStrong((id *)&self->_dirtyProgressTimer, 0);
  objc_storeStrong((id *)&self->_dirtyProgressByID, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end