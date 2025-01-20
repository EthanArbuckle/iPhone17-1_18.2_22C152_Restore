@interface StoreDownloadQueue
+ (id)sharedDownloadQueue;
+ (void)cancelRedownloadsWithMessage:(id)a3 connection:(id)a4;
+ (void)getAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)reloadFromServerWithMessage:(id)a3 connection:(id)a4;
+ (void)setAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4;
+ (void)synchronizeAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4;
+ (void)triggerDownloadsWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_ignoreVideos;
- (BOOL)cancelAllRedownloads;
- (BOOL)checkQueuesWithReason:(id)a3 accountID:(id)a4;
- (NSSet)automaticDownloadKinds;
- (NSSet)downloadKindsBeingChecked;
- (NSSet)enabledDownloadKinds;
- (StoreDownloadQueue)init;
- (id)_automaticDownloadsQueryWithDatabase:(id)a3 accountID:(id)a4;
- (id)_downloadQueryWithQueueRequest:(id)a3 database:(id)a4;
- (id)_newCheckQueueOperationForQueueRequest:(id)a3;
- (id)_newLoadQueueOperationForQueueRequest:(id)a3;
- (id)_newOperationByCommitingAutomaticDownloadKinds:(id)a3 account:(id)a4;
- (id)_newQueueRequestsWithReason:(id)a3 accountID:(id)a4 session:(id)a5;
- (id)_newSetAutomaticDownloadKindsOperationWithDownloadKinds:(id)a3 account:(id)a4;
- (id)_restorableDownloadsQueryInDatabase:(id)a3;
- (id)_validQueueIdentifiersForDaemon;
- (id)_validQueueIdentifiersForPlatform;
- (void)_accountAuthenticatedNotification:(id)a3;
- (void)_accountStoreChangedNotification:(id)a3;
- (void)_addOperationsForRequests:(id)a3 reason:(id)a4;
- (void)_checkAutomaticDownloadQueue:(id)a3;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_retryCanceledRestoreDownloads;
- (void)_retrySoftFailedRestoreDownloads;
- (void)_setLastCheckedAccountID:(id)a3;
- (void)_synchronizeAutomaticDownloadKinds:(id)a3;
- (void)checkAutomaticDownloadQueue;
- (void)checkQueuesWithRequest:(id)a3;
- (void)commitAutomaticDownloadKinds:(id)a3 markAsDirty:(BOOL)a4;
- (void)dealloc;
- (void)disableAutomaticDownloadsWithReason:(id)a3;
- (void)enableAutomaticDownloadsWithReason:(id)a3;
- (void)restoreAllRestorableDownloadsWithReason:(id)a3;
- (void)restoreDownloadsWithIdentifiers:(id)a3 reason:(id)a4;
- (void)setAutomaticDownloadKinds:(id)a3;
- (void)setAutomaticDownloadKinds:(id)a3 account:(id)a4;
- (void)synchronizeAutomaticDownloadKinds;
@end

@implementation StoreDownloadQueue

- (StoreDownloadQueue)init
{
  v33.receiver = self;
  v33.super_class = (Class)StoreDownloadQueue;
  v2 = [(StoreDownloadQueue *)&v33 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_automaticDownloadsAreDisabled = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.itunesstored.StoreDownloadQueue", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    activeRestoreIDs = v3->_activeRestoreIDs;
    v3->_activeRestoreIDs = v6;

    v8 = +[SSAccountStore defaultStore];
    v9 = [v8 activeAccount];
    uint64_t v10 = [v9 uniqueIdentifier];
    lastCheckedAccountID = v3->_lastCheckedAccountID;
    v3->_lastCheckedAccountID = (NSNumber *)v10;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    storeQueueRequests = v3->_storeQueueRequests;
    v3->_storeQueueRequests = v12;

    v14 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v14;

    [(ISOperationQueue *)v3->_operationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v3->_operationQueue setMaxConcurrentOperationCount:3];
    v16 = +[Daemon daemon];
    [v16 addKeepAliveOperationQueue:v3->_operationQueue];

    v17 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    restoreOperationQueue = v3->_restoreOperationQueue;
    v3->_restoreOperationQueue = v17;

    [(ISOperationQueue *)v3->_restoreOperationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v3->_restoreOperationQueue setMaxConcurrentOperationCount:1];
    v19 = +[Daemon daemon];
    [v19 addKeepAliveOperationQueue:v3->_restoreOperationQueue];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v3 selector:"_accountAuthenticatedNotification:" name:kSSNotificationAuthenticateFinished object:0];
    [v20 addObserver:v3 selector:"_accountStoreChangedNotification:" name:SSAccountStoreChangedNotification object:0];
    [v20 addObserver:v3 selector:"_networkTypeChangedNotification:" name:ISNetworkTypeChangedNotification object:0];
    v21 = +[SSWeakReference weakReferenceWithObject:v3];
    v22 = +[Daemon daemon];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000A2578;
    v31[3] = &unk_1003A54C0;
    id v23 = v21;
    id v32 = v23;
    id v24 = [v22 addObserverForBackgroundTaskWithIdentifierPrefix:@"com.apple.itunesstored.RetryCanceledRestoreDownloads" withBlock:v31];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000A25BC;
    v29[3] = &unk_1003A54C0;
    id v30 = v23;
    id v25 = v23;
    id v26 = [v22 addObserverForBackgroundTaskWithIdentifierPrefix:@"com.apple.itunesstored.RetrySoftFailedRestoreDownloads" withBlock:v29];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_1000A2600, kSSNotificationAutomaticDownloadSettingsChanged, 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_1000A2670, kSSNotificationTriggerDownloads, 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:kSSNotificationAuthenticateFinished object:0];
  [v3 removeObserver:self name:SSAccountStoreChangedNotification object:0];
  [v3 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kSSNotificationAutomaticDownloadSettingsChanged, 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kSSNotificationTriggerDownloads, 0);
  [(LoadDownloadQueueOperation *)self->_loadAutomaticDownloadQueueOperation setCompletionBlock:0];
  v5 = +[Daemon daemon];
  [v5 removeKeepAliveOperationQueue:self->_operationQueue];

  v6 = +[Daemon daemon];
  [v6 removeKeepAliveOperationQueue:self->_restoreOperationQueue];

  v7.receiver = self;
  v7.super_class = (Class)StoreDownloadQueue;
  [(StoreDownloadQueue *)&v7 dealloc];
}

+ (id)sharedDownloadQueue
{
  if (qword_100401D30 != -1) {
    dispatch_once(&qword_100401D30, &stru_1003A54E0);
  }
  v2 = (void *)qword_100401D28;

  return v2;
}

- (NSSet)automaticDownloadKinds
{
  v2 = +[SSAccountStore defaultStore];
  v3 = [v2 activeAccount];

  dispatch_queue_t v4 = [v3 automaticDownloadKinds];
  if (v4) {
    +[NSSet setWithArray:v4];
  }
  else {
  v5 = +[NSSet set];
  }

  return (NSSet *)v5;
}

- (BOOL)cancelAllRedownloads
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v2 = +[DownloadsDatabase downloadsDatabase];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A2B80;
  v5[3] = &unk_1003A5530;
  v5[4] = &v6;
  id v3 = [v2 modifyUsingTransactionBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)checkAutomaticDownloadQueue
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A2DD4;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)checkQueuesWithReason:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1000A38E8;
  id v24 = sub_1000A38F8;
  id v25 = 0;
  uint64_t v8 = +[DownloadsDatabase downloadsDatabase];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A3900;
  v16[3] = &unk_1003A5558;
  v19 = &v20;
  v16[4] = self;
  id v9 = v6;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  [v8 readUsingTransactionBlock:v16];

  if (v21[5])
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A3950;
    block[3] = &unk_1003A5580;
    block[4] = self;
    v15 = &v20;
    id v14 = v9;
    dispatch_async(dispatchQueue, block);
  }
  _Block_object_dispose(&v20, 8);

  return 1;
}

- (void)checkQueuesWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A3A00;
  v7[3] = &unk_1003A3268;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)commitAutomaticDownloadKinds:(id)a3 markAsDirty:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[SSAccountStore defaultStore];
  id v7 = [v6 activeAccount];
  uint64_t v8 = +[SSLogConfig sharedDaemonConfig];
  id v9 = (id)v8;
  if (!v7)
  {
    if (!v8)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    id v30 = [v9 OSLogObject];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      v29 &= 2u;
    }
    if (v29)
    {
      int v36 = 138543362;
      id v37 = (id)objc_opt_class();
      id v31 = v37;
      LODWORD(v34) = 12;
      id v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32) {
        goto LABEL_42;
      }
      id v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v36, v34);
      free(v32);
      SSFileLog();
    }

    goto LABEL_42;
  }
  if (!v8)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v36 = 138412546;
    id v37 = (id)objc_opt_class();
    __int16 v38 = 2112;
    id v39 = v5;
    id v13 = v37;
    LODWORD(v34) = 22;
    objc_super v33 = &v36;
    id v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_13;
    }
    v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v36, v34);
    free(v14);
    objc_super v33 = (int *)v12;
    SSFileLog();
  }

LABEL_13:
  v15 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v4) {
    v15 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFStringRef v16 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"DirtyAutoDownloadKinds", *v15, kSSUserDefaultsIdentifier);
  id v17 = [v5 allObjects];
  [v7 setAutomaticDownloadKinds:v17];

  id v35 = 0;
  unsigned __int8 v18 = [v6 saveAccount:v7 verifyCredentials:0 error:&v35];
  id v9 = v35;
  if (v18) {
    goto LABEL_28;
  }
  v19 = +[SSLogConfig sharedDaemonConfig];
  if (!v19)
  {
    v19 = +[SSLogConfig sharedConfig];
  }
  unsigned int v20 = objc_msgSend(v19, "shouldLog", v33);
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  uint64_t v22 = [v19 OSLogObject];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    v21 &= 2u;
  }
  if (!v21) {
    goto LABEL_26;
  }
  id v23 = objc_opt_class();
  int v36 = 138543618;
  id v37 = v23;
  __int16 v38 = 2114;
  id v39 = v9;
  id v24 = v23;
  LODWORD(v34) = 22;
  objc_super v33 = &v36;
  id v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    uint64_t v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v36, v34);
    free(v25);
    objc_super v33 = (int *)v22;
    SSFileLog();
LABEL_26:
  }
LABEL_28:
  if (objc_msgSend(v5, "count", v33)) {
    +[SSDevice setPromptWithIdentifier:SSDevicePromptIdentifierAutomaticDownloadsAvailable needsDisplay:0];
  }
  CFPreferencesAppSynchronize(v16);
  id v26 = +[NSNotificationCenter defaultCenter];
  [v26 postNotificationName:SSDeviceAutomaticDownloadKindsChangedNotification object:0];

  v27 = +[DistributedNotificationCenter defaultCenter];
  [v27 postNotificationName:kSSNotificationAutomaticDownloadKindsChanged];

LABEL_42:
}

- (NSSet)downloadKindsBeingChecked
{
  id v3 = +[NSMutableSet set];
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A4048;
  v9[3] = &unk_1003A3268;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(dispatchQueue, v9);
  id v6 = v10;
  id v7 = (NSSet *)v5;

  return v7;
}

- (void)disableAutomaticDownloadsWithReason:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A4208;
  v7[3] = &unk_1003A3268;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)enableAutomaticDownloadsWithReason:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A443C;
  v7[3] = &unk_1003A3268;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (NSSet)enabledDownloadKinds
{
  id v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(StoreDownloadQueue *)self automaticDownloadKinds];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    id v8 = (void *)SSDownloadKindAudiobook;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((SSDownloadKindIsSoftwareKind() & 1) == 0
          && (!_os_feature_enabled_impl()
           || (SSDownloadKindIsEBookKind() & 1) == 0
           && ([v8 isEqualToString:v10] & 1) == 0))
        {
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 copy];

  return (NSSet *)v11;
}

- (void)restoreAllRestorableDownloadsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v6 = +[DownloadsDatabase downloadsDatabase];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_1000A486C;
  id v11 = &unk_1003A55A8;
  v12 = self;
  id v7 = v5;
  id v13 = v7;
  [v6 readUsingTransactionBlock:&v8];

  if (objc_msgSend(v7, "count", v8, v9, v10, v11, v12)) {
    [(StoreDownloadQueue *)self restoreDownloadsWithIdentifiers:v7 reason:v4];
  }
}

- (void)restoreDownloadsWithIdentifiers:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4A58;
  block[3] = &unk_1003A4298;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)setAutomaticDownloadKinds:(id)a3
{
  id v4 = a3;
  id v6 = +[SSAccountStore defaultStore];
  id v5 = [v6 activeAccount];
  [(StoreDownloadQueue *)self setAutomaticDownloadKinds:v4 account:v5];
}

- (void)setAutomaticDownloadKinds:(id)a3 account:(id)a4
{
  id v5 = [(StoreDownloadQueue *)self _newOperationByCommitingAutomaticDownloadKinds:a3 account:a4];
  if (v5)
  {
    id v4 = +[ISOperationQueue mainQueue];
    [v4 addOperation:v5];
  }
}

- (void)synchronizeAutomaticDownloadKinds
{
}

+ (void)cancelRedownloadsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[StoreDownloadQueue sharedDownloadQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A5174;
  v8[3] = &unk_1003A3140;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [v7 _handleMessage:v6 connection:v5 usingBlock:v8];
}

+ (void)getAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[StoreDownloadQueue sharedDownloadQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A526C;
  v10[3] = &unk_1003A4298;
  id v11 = v5;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v6;
  id v7 = v6;
  id v8 = v12;
  id v9 = v5;
  [v8 _handleMessage:v9 connection:v7 usingBlock:v10];
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"cancelRedownloadsWithMessage:connection:" forMessage:187];
  [v4 addObserver:a1 selector:"getAutomaticDownloadKindsWithMessage:connection:" forMessage:74];
  [v4 addObserver:a1 selector:"reloadFromServerWithMessage:connection:" forMessage:5];
  [v4 addObserver:a1 selector:"setAutomaticDownloadKindsWithMessage:connection:" forMessage:75];
  [v4 addObserver:a1 selector:"synchronizeAutomaticDownloadKindsWithMessage:connection:" forMessage:76];
  [v4 addObserver:a1 selector:"triggerDownloadsWithMessage:connection:" forMessage:41];
}

+ (void)reloadFromServerWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[StoreDownloadQueue sharedDownloadQueue];
  id v8 = +[SSAccountStore defaultStore];
  id v9 = [v8 activeAccount];
  id v10 = [v9 uniqueIdentifier];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A54DC;
  v13[3] = &unk_1003A3268;
  id v14 = v7;
  id v15 = v10;
  id v11 = v10;
  id v12 = v7;
  [v12 _handleMessage:v6 connection:v5 usingBlock:v13];
}

+ (void)setAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[StoreDownloadQueue sharedDownloadQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A5854;
  v10[3] = &unk_1003A4298;
  id v11 = v5;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v6;
  id v7 = v6;
  id v8 = v12;
  id v9 = v5;
  [v8 _handleMessage:v9 connection:v7 usingBlock:v10];
}

+ (void)synchronizeAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = (_xpc_connection_s *)a4;
  xpc_object_t message = xpc_dictionary_create_reply(a3);
  id v6 = +[StoreDownloadQueue sharedDownloadQueue];
  [v6 synchronizeAutomaticDownloadKinds];

  xpc_connection_send_message(v5, message);
}

+ (void)triggerDownloadsWithMessage:(id)a3 connection:(id)a4
{
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  LODWORD(v15) = 138412290;
  *(void *)((char *)&v15 + 4) = objc_opt_class();
  id v8 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  id v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v15, v14, v15);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  id v10 = +[SSAccountStore defaultStore];
  id v11 = [v10 activeAccount];
  id v12 = [v11 uniqueIdentifier];

  id v13 = +[StoreDownloadQueue sharedDownloadQueue];
  [v13 checkQueuesWithReason:@"trigger-download" accountID:v12];
}

- (void)_accountAuthenticatedNotification:(id)a3
{
  id v4 = +[SSAccountStore defaultStore];
  unsigned int v5 = [v4 activeAccount];

  if ([v5 isAuthenticated]
    && CFPreferencesGetAppBooleanValue(@"DirtyAutoDownloadKinds", kSSUserDefaultsIdentifier, 0))
  {
    int v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      int v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (v8)
    {
      LODWORD(v16) = 138412290;
      *(void *)((char *)&v16 + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&v16 + 4);
      LODWORD(v15) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_14:

        id v12 = [(StoreDownloadQueue *)self automaticDownloadKinds];
        id v13 = [(StoreDownloadQueue *)self _newSetAutomaticDownloadKindsOperationWithDownloadKinds:v12 account:v5];

        [v13 setRunsOnlyIfKindsAreDirty:1];
        uint64_t v14 = +[ISOperationQueue mainQueue];
        [v14 addOperation:v13];

        goto LABEL_15;
      }
      id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v16, v15, v16);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (void)_accountStoreChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A60D8;
  block[3] = &unk_1003A3140;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_networkTypeChangedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned int v5 = [v4 objectForKey:NSKeyValueChangeOldKey];

  if (![v5 integerValue])
  {
    int v6 = +[DownloadsDatabase downloadsDatabase];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A6568;
    v7[3] = &unk_1003A5648;
    void v7[4] = self;
    [v6 modifyAsyncUsingTransactionBlock:v7];
  }
}

- (void)_addOperationsForRequests:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v6;
  id v9 = v7;
  id v10 = [(StoreDownloadQueue *)self _validQueueIdentifiersForDaemon];
  [v8 minusSet:self->_storeQueueRequests];
  [(NSMutableSet *)self->_storeQueueRequests unionSet:v8];
  v53 = v9;
  unsigned int v11 = [v9 isEqualToString:@"trigger-download"];
  uint64_t v12 = +[SSLogConfig sharedDaemonConfig];
  id v13 = (void *)v12;
  v52 = v8;
  if (v11)
  {
    if (!v12)
    {
      id v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    long long v16 = [v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (v17)
    {
      unsigned __int8 v18 = objc_opt_class();
      id v19 = v18;
      int v64 = 138412802;
      v65 = v18;
      __int16 v66 = 2048;
      id v67 = [v8 count];
      __int16 v68 = 2112;
      v69 = v53;
      LODWORD(v51) = 32;
      v50 = &v64;
      unsigned int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_14;
      }
      long long v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v64, v51);
      free(v20);
      v50 = (int *)v16;
      SSFileLog();
    }

LABEL_14:
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v21 = v8;
    id v22 = [v21 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v59;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v59 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v27 = objc_msgSend(v26, "queueIdentifier", v50);
          unsigned int v28 = [v10 containsObject:v27];

          if (v28)
          {
            id v29 = [(StoreDownloadQueue *)self _newLoadQueueOperationForQueueRequest:v26];
            [(ISOperationQueue *)self->_operationQueue addOperation:v29];
          }
          else
          {
            id v30 = [v26 queueIdentifier];
            unsigned int v31 = [v30 isEqualToString:@"apps"];

            if (v31)
            {
              [(NSMutableSet *)self->_storeQueueRequests removeObject:v26];
              +[AppStoreUtility checkDownloadQueue];
            }
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v23);
    }
    goto LABEL_49;
  }
  if (!v12)
  {
    id v13 = +[SSLogConfig sharedConfig];
  }
  unsigned int v32 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v33 = v32 | 2;
  }
  else {
    int v33 = v32;
  }
  uint64_t v34 = [v13 OSLogObject];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
    int v35 = v33;
  }
  else {
    int v35 = v33 & 2;
  }
  if (v35)
  {
    int v36 = objc_opt_class();
    id v37 = v36;
    int v64 = 138412802;
    v65 = v36;
    __int16 v66 = 2048;
    id v67 = [v8 count];
    __int16 v68 = 2112;
    v69 = v53;
    LODWORD(v51) = 32;
    v50 = &v64;
    __int16 v38 = (void *)_os_log_send_and_compose_impl();

    if (!v38) {
      goto LABEL_38;
    }
    uint64_t v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v64, v51);
    free(v38);
    v50 = (int *)v34;
    SSFileLog();
  }

LABEL_38:
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v39 = v8;
  id v40 = [v39 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v55;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v55 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
        v45 = objc_msgSend(v44, "queueIdentifier", v50);
        unsigned int v46 = [v10 containsObject:v45];

        if (v46)
        {
          id v47 = [(StoreDownloadQueue *)self _newCheckQueueOperationForQueueRequest:v44];
          [(ISOperationQueue *)self->_operationQueue addOperation:v47];
        }
        else
        {
          v48 = [v44 queueIdentifier];
          unsigned int v49 = [v48 isEqualToString:@"apps"];

          if (v49)
          {
            [(NSMutableSet *)self->_storeQueueRequests removeObject:v44];
            +[AppStoreUtility checkDownloadQueue];
          }
        }
      }
      id v41 = [v39 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v41);
  }
LABEL_49:
}

- (id)_automaticDownloadsQueryWithDatabase:(id)a3 accountID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_automatic" equalToLongLong:1];
  int v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_from_store" equalToLongLong:1];
  id v9 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"store_account_id" equalToValue:v5];

  id v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, v9, 0);
  unsigned int v11 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  uint64_t v12 = +[DownloadEntity queryWithDatabase:v6 predicate:v11];

  return v12;
}

- (id)_downloadQueryWithQueueRequest:(id)a3 database:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 queueIdentifier];
  int v8 = sub_1000AAD90((uint64_t)v7);

  id v9 = +[SSSQLiteCompoundPredicate predicateWithProperty:@"kind" values:v8 comparisonType:1];
  id v10 = [v6 accountIdentifier];

  unsigned int v11 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"store_account_id" equalToValue:v10];

  uint64_t v12 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_store_queued" equalToLongLong:1];
  id v13 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")" value:SSDownloadPhaseFinished comparisonType:2];
  unsigned int v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v11, v13, v9, 0);
  int v15 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v14];

  long long v16 = +[DownloadEntity queryWithDatabase:v5 predicate:v15];

  return v16;
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  if (SSXPCConnectionHasEntitlement())
  {
    unsigned int v11 = +[Daemon daemon];
    [v11 takeKeepAliveAssertion:@"com.apple.itunesstore.StoreDownloadQueue"];

    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A6F38;
    block[3] = &unk_1003A31C8;
    id v15 = v10;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (reply) {
      xpc_connection_send_message(v9, reply);
    }
  }
}

- (void)_checkAutomaticDownloadQueue:(id)a3
{
  id v4 = a3;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (v7)
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = (id)objc_opt_class();
    id v9 = *(id *)((char *)location + 4);
    LODWORD(v14) = 12;
    id v10 = (void *)_os_log_send_and_compose_impl();

    if (v10)
    {
      unsigned int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, location, v14);
      free(v10);
      SSFileLog();
    }
  }
  else
  {
  }
  id v12 = +[LoadDownloadQueueOperation newLoadAutomaticDownloadQueueOperation];
  [v12 setAccountIdentifier:v4];
  objc_initWeak(location, v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A7220;
  v15[3] = &unk_1003A5698;
  v15[4] = self;
  objc_copyWeak(&v17, location);
  id v13 = v4;
  id v16 = v13;
  [v12 setCompletionBlock:v15];
  objc_storeStrong((id *)&self->_loadAutomaticDownloadQueueOperation, v12);
  [(ISOperationQueue *)self->_operationQueue addOperation:self->_loadAutomaticDownloadQueueOperation];

  objc_destroyWeak(&v17);
  objc_destroyWeak(location);
}

- (BOOL)_ignoreVideos
{
  id v3 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.tv"];
  id v4 = [v3 applicationType];
  if ([v4 isEqualToString:LSSystemApplicationType])
  {
    id v5 = [v3 appState];
    unsigned int v6 = [v5 isInstalled] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  if (v3) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_newCheckQueueOperationForQueueRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[CheckDownloadQueueOperation alloc] initWithDownloadQueueRequest:v4];
  objc_initWeak(&location, v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A7C08;
  v8[3] = &unk_1003A5620;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  [(CheckDownloadQueueOperation *)v5 setCompletionBlock:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_newLoadQueueOperationForQueueRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  id v6 = [v4 queueContentsURLBagKey];
  [v5 setURLBagKey:v6];

  BOOL v7 = [[LoadDownloadQueueOperation alloc] initWithRequestProperties:v5];
  id v8 = [v4 accountIdentifier];
  [(LoadDownloadQueueOperation *)v7 setAccountIdentifier:v8];

  [(LoadDownloadQueueOperation *)v7 setNeedsAuthentication:0];
  objc_initWeak(&location, v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A8830;
  v11[3] = &unk_1003A5738;
  v11[4] = self;
  id v9 = v4;
  id v12 = v9;
  objc_copyWeak(&v13, &location);
  [(LoadDownloadQueueOperation *)v7 setCompletionBlock:v11];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v7;
}

- (id)_newOperationByCommitingAutomaticDownloadKinds:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(StoreDownloadQueue *)self automaticDownloadKinds];
  if ([v6 isEqualToSet:v8])
  {
    id v9 = 0;
  }
  else
  {
    [(StoreDownloadQueue *)self commitAutomaticDownloadKinds:v6 markAsDirty:1];
    id v9 = [(StoreDownloadQueue *)self _newSetAutomaticDownloadKindsOperationWithDownloadKinds:v6 account:v7];
    [v9 setPreviousDownloadKinds:v8];
  }

  return v9;
}

- (id)_newQueueRequestsWithReason:(id)a3 accountID:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableSet);
  id v35 = v10;
  if (([v8 isEqualToString:@"account-change"] & 1) == 0)
  {
    uint64_t v34 = self;
    unsigned int v31 = [(StoreDownloadQueue *)self _validQueueIdentifiersForDaemon];
    id v12 = objc_alloc_init((Class)SSSQLiteQueryDescriptor);
    [v12 setEntityClass:objc_opt_class()];
    [v12 setReturnsDistinctEntities:1];
    uint64_t v13 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_store_queued" equalToLongLong:1];
    uint64_t v14 = +[SSSQLiteNullPredicate isNotNullPredicateWithProperty:@"store_transaction_id"];
    id v15 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(download_state.is_server_finished, 0)" equalToLongLong:0];
    unsigned int v32 = (void *)v14;
    int v33 = (void *)v13;
    id v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v13, v14, v15, 0);
    id v17 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v16];

    [v12 setPredicate:v17];
    id v18 = objc_alloc((Class)SSSQLiteQuery);
    id v19 = [v10 database];
    id v20 = [v18 initWithDatabase:v19 descriptor:v12];

    v45[0] = @"kind";
    v45[1] = @"store_account_id";
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000A95A4;
    v40[3] = &unk_1003A4A88;
    id v21 = v31;
    id v41 = v21;
    id v42 = v8;
    id v43 = v11;
    [v20 enumeratePersistentIDsAndProperties:v45 count:2 usingBlock:v40];

    for (uint64_t i = 1; i != -1; --i)
    self = v34;
  }
  if (v9)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = [(StoreDownloadQueue *)self _validQueueIdentifiersForPlatform];
    id v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v37;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v36 + 1) + 8 * (void)j);
          id v29 = objc_alloc_init(StoreDownloadQueueRequest);
          [(StoreDownloadQueueRequest *)v29 setAccountIdentifier:v9];
          [(StoreDownloadQueueRequest *)v29 setQueueIdentifier:v28];
          [(StoreDownloadQueueRequest *)v29 setReason:v8];
          [v11 addObject:v29];
        }
        id v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v25);
    }

    id v10 = v35;
  }

  return v11;
}

- (id)_newSetAutomaticDownloadKindsOperationWithDownloadKinds:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SetAutomaticDownloadKindsOperation alloc] initWithDownloadKinds:v6];

  id v8 = [objc_alloc((Class)SSAuthenticationContext) initWithAccount:v5];
  [(SetAutomaticDownloadKindsOperation *)v7 setAuthenticationContext:v8];

  return v7;
}

- (void)_retryCanceledRestoreDownloads
{
  v2 = +[SSLogConfig sharedDaemonConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v11) = 138412290;
  *(void *)((char *)&v11 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    id v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v11, v10, v11);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  +[RestoreDownloadsOperation resetShouldSuppressTermsAndConditionsDialogs];
  id v8 = +[DownloadsDatabase downloadsDatabase];
  id v9 = [v8 modifyUsingTransactionBlock:&stru_1003A5778];
}

- (void)_retrySoftFailedRestoreDownloads
{
  v2 = +[SSLogConfig sharedDaemonConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v11) = 138412290;
  *(void *)((char *)&v11 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    id v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v11, v10, v11);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  +[RestoreDownloadsOperation resetShouldSuppressTermsAndConditionsDialogs];
  id v8 = +[DownloadsDatabase downloadsDatabase];
  id v9 = [v8 modifyUsingTransactionBlock:&stru_1003A5798];
}

- (id)_restorableDownloadsQueryInDatabase:(id)a3
{
  id v3 = a3;
  int v4 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_restore" equalToLongLong:1];
  id v5 = +[NSNumber numberWithInteger:0];
  id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(download.store_item_id, 0)" value:v5 comparisonType:2];

  id v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_purchase" equalToLongLong:0];
  id v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_from_store" equalToLongLong:0];
  id v9 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(download_state.restore_state, 0)" equalToLongLong:0];
  uint64_t v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v6, v7, v8, v9, 0);
  long long v11 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  id v12 = +[NSArray arrayWithObject:@"order_key"];
  uint64_t v13 = +[DownloadEntity queryWithDatabase:v3 predicate:v11 orderingProperties:v12];

  return v13;
}

- (void)_setLastCheckedAccountID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A9DD8;
  v7[3] = &unk_1003A3268;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)_synchronizeAutomaticDownloadKinds:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(GetAutomaticDownloadKindsOperation);
  objc_initWeak(&location, v5);
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_1000A9F70;
  uint64_t v14 = &unk_1003A57C0;
  objc_copyWeak(&v17, &location);
  id v15 = self;
  id v6 = v4;
  id v16 = v6;
  [(GetAutomaticDownloadKindsOperation *)v5 setCompletionBlock:&v11];
  id v7 = objc_alloc((Class)SSAuthenticationContext);
  id v8 = +[SSAccountStore defaultStore];
  id v9 = [v8 activeAccount];
  id v10 = [v7 initWithAccount:v9];

  [(GetAutomaticDownloadKindsOperation *)v5 setAuthenticationContext:v10];
  [(ISOperationQueue *)self->_operationQueue addOperation:v5];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)_validQueueIdentifiersForDaemon
{
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(StoreDownloadQueue *)self _validQueueIdentifiersForPlatform];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isEqualToString:@"apps"] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (id)_validQueueIdentifiersForPlatform
{
  if (MGGetSInt32Answer() == 4)
  {
    CFStringRef v8 = @"apps";
    v2 = &v8;
    uint64_t v3 = 1;
  }
  else
  {
    v7[0] = @"apps";
    v7[1] = @"books";
    v7[2] = @"media";
    v2 = (const __CFString **)v7;
    uint64_t v3 = 3;
  }
  id v4 = +[NSArray arrayWithObjects:v2 count:v3];
  id v5 = +[NSSet setWithArray:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPurchaseDownloadIDs, 0);
  objc_storeStrong((id *)&self->_storeQueueRequests, 0);
  objc_storeStrong((id *)&self->_restoreOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadAutomaticDownloadQueueOperation, 0);
  objc_storeStrong((id *)&self->_lastCheckedAccountID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_activeRestoreIDs, 0);
}

@end