@interface DownloadController
+ (id)controller;
- (BOOL)_cancelDownloads:(id)a3 client:(id)a4;
- (BOOL)_pauseDownloads:(id)a3 isForced:(BOOL)a4 client:(id)a5;
- (BOOL)_prioritizeDownload:(id)a3 aboveDownload:(id)a4 client:(id)a5 error:(id *)a6;
- (BOOL)_restartDownloads:(id)a3 client:(id)a4;
- (BOOL)_resumeDownloads:(id)a3 client:(id)a4;
- (DownloadController)init;
- (id)_downloadPersistentIDsFromBundleIDs:(id)a3;
- (id)_managerClientForConnection:(id)a3;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_dispatchAsync:(id)a3;
- (void)_filterAndTranslateProperties:(id)a3 usingBlock:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_handleSessionMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_handleSessionMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_rescueStuckPlaceholderWithBundleID:(id)a3;
- (void)_retryRestoreIfNecessaryForTransaction:(id)a3;
- (void)_sendDownloadKindsUsingNetwork:(id)a3;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)beginUsingNetworkForDownloadKind:(id)a3;
- (void)cancelAllDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)cancelDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)connectDownloadHandlerWithMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)endUsingNetworkForDownloadKind:(id)a3;
- (void)finishDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)finishSessionWithMessage:(id)a3 connection:(id)a4;
- (void)getActiveDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)getCellularNetworkAllowed:(id)a3 connection:(id)a4;
- (void)getDownloadAssetPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)getDownloadAssetsWithMessage:(id)a3 connection:(id)a4;
- (void)getDownloadKindsUsingNetworkWithMessage:(id)a3 connection:(id)a4;
- (void)getDownloadPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)getDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)getEntityExistsWithMessage:(id)a3 connection:(id)a4;
- (void)getSessionPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)insertDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)moveDownloadWithMessage:(id)a3 connection:(id)a4;
- (void)notifyClientsOfChangeset:(id)a3;
- (void)notifyClientsOfExternalPropertyChanges:(id)a3 connection:(id)a4;
- (void)notifyClientsOfExternalPropertyChanges:(id)a3 forDownloadID:(int64_t)a4 downloadKind:(id)a5;
- (void)notifyClientsOfExternalStateChanges:(id)a3 connection:(id)a4;
- (void)notifyClientsOfPropertyChanges:(id)a3 forDownloadID:(int64_t)a4 downloadKind:(id)a5;
- (void)observeXPCServer:(id)a3;
- (void)pauseDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)prioritizeDownloadWithMessage:(id)a3 connection:(id)a4;
- (void)registerClientDownloadManager:(id)a3 connection:(id)a4;
- (void)removePersistenceIDWithMessage:(id)a3 connection:(id)a4;
- (void)resetDisavowedSessionsWithMessage:(id)a3 connection:(id)a4;
- (void)restartDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)resumeDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)retryRestoreDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)setAssetPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)setCellularNetworkAllowed:(id)a3 connection:(id)a4;
- (void)setClientDownloadHandlerWithMessage:(id)a3 connection:(id)a4;
- (void)setDownloadHandlerWithMessage:(id)a3 connection:(id)a4;
- (void)setDownloadPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)setDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)setHandlerPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)setSessionProgressWithMessage:(id)a3 connection:(id)a4;
- (void)setSessionPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)setSessionStatusDescriptionWithMessage:(id)a3 connection:(id)a4;
- (void)start;
@end

@implementation DownloadController

- (void)getDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000632C;
  v6[3] = &unk_1003A7610;
  v7 = self;
  id v8 = a3;
  id v5 = v8;
  [(DownloadController *)v7 _handleMessage:v5 connection:a4 usingReplyBlock:v6];
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000040E4;
  v9[3] = &unk_1003A7A70;
  id v10 = a4;
  id v11 = a5;
  v9[4] = self;
  id v7 = v10;
  id v8 = v11;
  [(DownloadController *)self _dispatchAsync:v9];
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004500;
  v11[3] = &unk_1003A72D8;
  id v12 = a3;
  v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v14;
  id v9 = v15;
  id v10 = v12;
  [(DownloadController *)self _dispatchAsync:v11];
}

- (void)registerClientDownloadManager:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)SSXPCConnectionCopyClientIdentifier();
  id v9 = xpc_dictionary_get_value(v6, "2");
  id v10 = v9;
  if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_endpoint)
  {
    if (v8)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000071E4;
      v20[3] = &unk_1003A7858;
      id v21 = v10;
      v22 = self;
      id v23 = v8;
      id v24 = v6;
      [(DownloadController *)self _handleMessage:v24 connection:v7 usingBlock:v20];

      id v11 = v21;
      goto LABEL_15;
    }
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    id v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (!v18) {
      goto LABEL_14;
    }
    int v25 = 138412290;
    id v26 = (id)objc_opt_class();
    id v15 = v26;
    LODWORD(v19) = 12;
  }
  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (!v13) {
      goto LABEL_14;
    }
    int v25 = 138412546;
    id v26 = (id)objc_opt_class();
    __int16 v27 = 2112;
    v28 = v8;
    id v15 = v26;
    LODWORD(v19) = 22;
  }
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v25, v19);
    free(v16);
    SSFileLog();
LABEL_14:
  }
LABEL_15:
}

- (id)_managerClientForConnection:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_managerClients;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "copyInputConnection", (void)v14);
        if (v11 == v4)
        {
          unsigned int v12 = v10;

          if (v12)
          {

            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  unsigned int v12 = [[DownloadManagerClient alloc] initWithInputConnection:v4];
  [(NSMutableArray *)self->_managerClients addObject:v12];
LABEL_13:

  return v12;
}

- (void)notifyClientsOfChangeset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 changedDownloadKinds];
  if ([v5 count])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10013A6B8;
    v19[3] = &unk_1003A4298;
    v19[4] = self;
    id v20 = v5;
    id v21 = v4;
    [(DownloadController *)self _dispatchAsync:v19];
  }
  id v6 = [v4 finishedDownloadKinds];
  if ([v6 count])
  {
    long long v14 = v5;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        unsigned int v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"com.apple.itunesstored.SSDownloadManager.downloadCompleted.%@", *(void *)(*((void *)&v15 + 1) + 8 * (void)v12)];
          CFNotificationCenterPostNotification(DarwinNotifyCenter, v13, 0, 0, 1u);

          unsigned int v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v10);
    }

    id v5 = v14;
  }
}

- (void)_filterAndTranslateProperties:(id)a3 usingBlock:(id)a4
{
  id v5 = (void (**)(id, id, id))a4;
  id v6 = a3;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  unsigned int v12 = sub_10000AB7C;
  int v13 = &unk_1003A7A48;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = objc_alloc_init((Class)NSMutableIndexSet);
  id v7 = v15;
  id v8 = v14;
  [v6 enumerateObjectsUsingBlock:&v10];

  id v9 = objc_msgSend(v8, "copy", v10, v11, v12, v13);
  v5[2](v5, v7, v9);
}

+ (id)controller
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013A44C;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401ED0 != -1) {
    dispatch_once(&qword_100401ED0, block);
  }
  v2 = (void *)qword_100401EC8;

  return v2;
}

- (void)_dispatchAsync:(id)a3
{
  id v4 = a3;
  id v5 = +[Daemon daemon];
  [v5 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadController"];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B988;
  block[3] = &unk_1003A31C8;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, block);
}

- (DownloadController)init
{
  v14.receiver = self;
  v14.super_class = (Class)DownloadController;
  v2 = [(DownloadController *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.DownloadController", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.DownloadController.external", 0);
    externalQueue = v2->_externalQueue;
    v2->_externalQueue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    managerClients = v2->_managerClients;
    v2->_managerClients = v7;

    if ((SSDebugShouldUseAppstored() & 1) == 0)
    {
      id v9 = objc_alloc_init(WorkspaceDownloadObserver);
      workspaceDownloadObserver = v2->_workspaceDownloadObserver;
      v2->_workspaceDownloadObserver = v9;

      [(WorkspaceDownloadObserver *)v2->_workspaceDownloadObserver setDelegate:v2];
    }
    uint64_t v11 = +[ApplicationWorkspace defaultWorkspace];
    [v11 replayIncompleteOperations];

    unsigned int v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  [(WorkspaceDownloadObserver *)self->_workspaceDownloadObserver setDelegate:0];
  [(WorkspaceDownloadObserver *)self->_workspaceDownloadObserver stopObserving];

  v4.receiver = self;
  v4.super_class = (Class)DownloadController;
  [(DownloadController *)&v4 dealloc];
}

- (void)beginUsingNetworkForDownloadKind:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013A520;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)endUsingNetworkForDownloadKind:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013A648;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)notifyClientsOfExternalPropertyChanges:(id)a3 forDownloadID:(int64_t)a4 downloadKind:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    dispatchQueue = self->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10013A8C8;
    v11[3] = &unk_1003A7580;
    void v11[4] = self;
    id v12 = v9;
    int64_t v14 = a4;
    id v13 = v8;
    dispatch_async(dispatchQueue, v11);
  }
}

- (void)notifyClientsOfPropertyChanges:(id)a3 forDownloadID:(int64_t)a4 downloadKind:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    dispatchQueue = self->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10013AADC;
    v11[3] = &unk_1003A7580;
    void v11[4] = self;
    id v12 = v9;
    int64_t v14 = a4;
    id v13 = v8;
    dispatch_async(dispatchQueue, v11);
  }
}

- (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self selector:"cancelAllDownloadsWithMessage:connection:" forMessage:0];
  [v4 addObserver:self selector:"cancelDownloadsWithMessage:connection:" forMessage:1];
  [v4 addObserver:self selector:"finishDownloadsWithMessage:connection:" forMessage:7];
  [v4 addObserver:self selector:"getActiveDownloadsWithMessage:connection:" forMessage:8];
  [v4 addObserver:self selector:"getDownloadAssetPropertiesWithMessage:connection:" forMessage:26];
  [v4 addObserver:self selector:"getDownloadAssetPropertiesWithMessage:connection:" forMessage:10];
  [v4 addObserver:self selector:"getDownloadAssetsWithMessage:connection:" forMessage:11];
  [v4 addObserver:self selector:"getDownloadKindsUsingNetworkWithMessage:connection:" forMessage:29];
  [v4 addObserver:self selector:"getDownloadPropertiesWithMessage:connection:" forMessage:27];
  [v4 addObserver:self selector:"getDownloadPropertiesWithMessage:connection:" forMessage:13];
  [v4 addObserver:self selector:"getDownloadsWithMessage:connection:" forMessage:14];
  [v4 addObserver:self selector:"getEntityExistsWithMessage:connection:" forMessage:53];
  [v4 addObserver:self selector:"getEntityExistsWithMessage:connection:" forMessage:52];
  [v4 addObserver:self selector:"insertDownloadsWithMessage:connection:" forMessage:15];
  [v4 addObserver:self selector:"moveDownloadWithMessage:connection:" forMessage:16];
  [v4 addObserver:self selector:"notifyClientsOfExternalPropertyChanges:connection:" forMessage:176];
  [v4 addObserver:self selector:"notifyClientsOfExternalStateChanges:connection:" forMessage:177];
  [v4 addObserver:self selector:"pauseDownloadsWithMessage:connection:" forMessage:17];
  [v4 addObserver:self selector:"prioritizeDownloadWithMessage:connection:" forMessage:28];
  [v4 addObserver:self selector:"registerClientDownloadManager:connection:" forMessage:18];
  [v4 addObserver:self selector:"removePersistenceIDWithMessage:connection:" forMessage:6];
  [v4 addObserver:self selector:"resumeDownloadsWithMessage:connection:" forMessage:19];
  [v4 addObserver:self selector:"restartDownloadsWithMessage:connection:" forMessage:20];
  [v4 addObserver:self selector:"retryRestoreDownloadsWithMessage:connection:" forMessage:37];
  [v4 addObserver:self selector:"setAssetPropertiesWithMessage:connection:" forMessage:21];
  [v4 addObserver:self selector:"setDownloadHandlerWithMessage:connection:" forMessage:23];
  [v4 addObserver:self selector:"setDownloadPropertiesWithMessage:connection:" forMessage:24];
  [v4 addObserver:self selector:"setDownloadPropertiesWithMessage:connection:" forMessage:32];
  [v4 addObserver:self selector:"setDownloadsWithMessage:connection:" forMessage:39];
  [v4 addObserver:self selector:"getCellularNetworkAllowed:connection:" forMessage:87];
  [v4 addObserver:self selector:"setCellularNetworkAllowed:connection:" forMessage:88];
  [v4 addObserver:self selector:"finishSessionWithMessage:connection:" forMessage:2];
  [v4 addObserver:self selector:"getSessionPropertiesWithMessage:connection:" forMessage:12];
  [v4 addObserver:self selector:"connectDownloadHandlerWithMessage:connection:" forMessage:3];
  [v4 addObserver:self selector:"resetDisavowedSessionsWithMessage:connection:" forMessage:40];
  [v4 addObserver:self selector:"setClientDownloadHandlerWithMessage:connection:" forMessage:22];
  [v4 addObserver:self selector:"setSessionProgressWithMessage:connection:" forMessage:4];
  [v4 addObserver:self selector:"setHandlerPropertiesWithMessage:connection:" forMessage:31];
  [v4 addObserver:self selector:"setSessionPropertiesWithMessage:connection:" forMessage:30];
  [v4 addObserver:self selector:"setSessionStatusDescriptionWithMessage:connection:" forMessage:51];
}

- (void)start
{
  id v4 = +[DownloadsDatabase downloadsDatabase];
  [v4 modifyAsyncUsingTransactionBlock:&stru_1003A75A0];
  dispatch_queue_t v3 = +[StoreDownloadQueue sharedDownloadQueue];
  [v3 restoreAllRestorableDownloadsWithReason:@"other"];
  [v4 dispatchBlockAsync:&stru_1003A75C0];
  [(WorkspaceDownloadObserver *)self->_workspaceDownloadObserver startObserving];
}

- (void)applicationInstallsDidPause:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) applicationIdentifier];
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013B340;
  v13[3] = &unk_1003A3268;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [(DownloadController *)self _dispatchAsync:v13];
}

- (void)applicationInstallsDidResume:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) applicationIdentifier];
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013B580;
  v13[3] = &unk_1003A3268;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [(DownloadController *)self _dispatchAsync:v13];
}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) applicationIdentifier];
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013B7DC;
  v13[3] = &unk_1003A3268;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [(DownloadController *)self _dispatchAsync:v13];
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) applicationIdentifier];
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013BA18;
  v13[3] = &unk_1003A3268;
  id v14 = v5;
  long long v15 = self;
  id v12 = v5;
  [(DownloadController *)self _dispatchAsync:v13];
}

- (void)cancelAllDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013C350;
  v7[3] = &unk_1003A7610;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)cancelDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013C718;
  v7[3] = &unk_1003A7610;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)finishDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013C87C;
  v7[3] = &unk_1003A7610;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)getActiveDownloadsWithMessage:(id)a3 connection:(id)a4
{
}

- (void)getDownloadAssetPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013CFE8;
  v7[3] = &unk_1003A76A0;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)getDownloadAssetsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013D414;
  v7[3] = &unk_1003A76A0;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)getDownloadKindsUsingNetworkWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10013D760;
  v4[3] = &unk_1003A76A0;
  v4[4] = self;
  [(DownloadController *)self _handleMessage:a3 connection:a4 usingReplyBlock:v4];
}

- (void)getDownloadPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013D86C;
  v7[3] = &unk_1003A76A0;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)getEntityExistsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013E050;
  v7[3] = &unk_1003A76A0;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)insertDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10013E30C;
  v6[3] = &unk_1003A7610;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  [(DownloadController *)v7 _handleMessage:v5 connection:a4 usingReplyBlock:v6];
}

- (void)moveDownloadWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013F28C;
  v7[3] = &unk_1003A76A0;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)notifyClientsOfExternalStateChanges:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013F50C;
  v7[3] = &unk_1003A7610;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)notifyClientsOfExternalPropertyChanges:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013FAA8;
  v7[3] = &unk_1003A7610;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)pauseDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013FC48;
  v7[3] = &unk_1003A7610;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)prioritizeDownloadWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013FDC0;
  v7[3] = &unk_1003A7610;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)removePersistenceIDWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013FF90;
  v7[3] = &unk_1003A7880;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingBlock:v7];
}

- (void)resumeDownloadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = xpc_dictionary_get_value(v6, "1");
  uint64_t v9 = v8;
  if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_array)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100140214;
    applier[3] = &unk_1003A4180;
    id v10 = objc_alloc_init((Class)NSMutableOrderedSet);
    id v15 = v10;
    xpc_array_apply(v9, applier);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100140294;
    v12[3] = &unk_1003A7610;
    v12[4] = self;
    id v13 = v10;
    id v11 = v10;
    [(DownloadController *)self _handleMessage:v6 connection:v7 usingReplyBlock:v12];
  }
}

- (void)restartDownloadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = xpc_dictionary_get_value(v6, "1");
  uint64_t v9 = v8;
  if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_array)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100140474;
    applier[3] = &unk_1003A4180;
    id v10 = objc_alloc_init((Class)NSMutableOrderedSet);
    id v15 = v10;
    xpc_array_apply(v9, applier);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001404F4;
    v12[3] = &unk_1003A7610;
    v12[4] = self;
    id v13 = v10;
    id v11 = v10;
    [(DownloadController *)self _handleMessage:v6 connection:v7 usingReplyBlock:v12];
  }
}

- (void)retryRestoreDownloadsWithMessage:(id)a3 connection:(id)a4
{
}

- (void)setAssetPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014076C;
  v7[3] = &unk_1003A76A0;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)setDownloadHandlerWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100140B10;
  v8[3] = &unk_1003A7910;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(DownloadController *)self _handleMessage:v7 connection:v6 usingBlock:v8];
}

- (void)setDownloadPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100141280;
  v7[3] = &unk_1003A76A0;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)setDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001416DC;
  v6[3] = &unk_1003A7610;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  [(DownloadController *)v7 _handleMessage:v5 connection:a4 usingReplyBlock:v6];
}

- (void)getCellularNetworkAllowed:(id)a3 connection:(id)a4
{
  xpc_object_t original = a3;
  id v5 = (_xpc_connection_s *)a4;
  if (SSXPCConnectionHasEntitlement())
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", kSSUserDefaultsIdentifier, 0);
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_dictionary_set_BOOL(reply, "1", AppBooleanValue != 0);
    xpc_connection_send_message(v5, reply);
  }
}

- (void)setCellularNetworkAllowed:(id)a3 connection:(id)a4
{
  xpc_object_t xdict = a3;
  if (SSXPCConnectionHasEntitlement())
  {
    CFStringRef v5 = (const __CFString *)kSSUserDefaultsIdentifier;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", kSSUserDefaultsIdentifier, 0);
    BOOL v7 = xpc_dictionary_get_BOOL(xdict, "1");
    if (AppBooleanValue != v7)
    {
      CFPreferencesSetAppValue(@"AllowAutoDownloadOnCellular", +[NSNumber numberWithBool:v7], v5);
      CFPreferencesAppSynchronize(v5);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, kSSNotificationAutomaticDownloadSettingsChanged, 0, 0, 1u);
      dispatch_async((dispatch_queue_t)self->_externalQueue, &stru_1003A79A8);
    }
  }
}

- (void)connectDownloadHandlerWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100142DC4;
  v8[3] = &unk_1003A4298;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(DownloadController *)self _handleSessionMessage:v7 connection:v6 usingBlock:v8];
}

- (void)finishSessionWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100143314;
  v7[3] = &unk_1003A3268;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleSessionMessage:v6 connection:a4 usingBlock:v7];
}

- (void)getSessionPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100143904;
  v7[3] = &unk_1003A5DE8;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleSessionMessage:v6 connection:a4 usingReplyBlock:v7];
}

- (void)resetDisavowedSessionsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100143C64;
  v7[3] = &unk_1003A3140;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleSessionMessage:v6 connection:a4 usingBlock:v7];
}

- (void)setClientDownloadHandlerWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100143D94;
  v9[3] = &unk_1003A3268;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(DownloadController *)self _handleSessionMessage:v7 connection:v8 usingBlock:v9];
}

- (void)setHandlerPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100143EE4;
  v7[3] = &unk_1003A3268;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  [(DownloadController *)self _handleSessionMessage:v6 connection:a4 usingBlock:v7];
}

- (void)setSessionProgressWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100144374;
  v7[3] = &unk_1003A3140;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleSessionMessage:v6 connection:a4 usingBlock:v7];
}

- (void)setSessionPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001444F0;
  v7[3] = &unk_1003A3140;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleSessionMessage:v6 connection:a4 usingBlock:v7];
}

- (void)setSessionStatusDescriptionWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001447C8;
  v7[3] = &unk_1003A3140;
  id v8 = a3;
  id v6 = v8;
  [(DownloadController *)self _handleSessionMessage:v6 connection:a4 usingBlock:v7];
}

- (void)_clientDisconnectNotification:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10014492C;
  v5[3] = &unk_1003A3268;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(DownloadController *)self _dispatchAsync:v5];
}

- (BOOL)_cancelDownloads:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  if ([v6 count])
  {
    id v8 = +[DownloadsDatabase downloadsDatabase];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100144CE0;
    v12[3] = &unk_1003A7A20;
    id v13 = v6;
    id v15 = self;
    long long v16 = &v17;
    id v14 = v7;
    id v9 = [v8 modifyUsingTransactionBlock:v12];
  }
  char v10 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (id)_downloadPersistentIDsFromBundleIDs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v5 = +[DownloadsDatabase downloadsDatabase];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10014524C;
  v11[3] = &unk_1003A55A8;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [v5 readUsingTransactionBlock:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)_handleSessionMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100145610;
  v7[3] = &unk_1003A31C8;
  id v8 = a5;
  id v6 = v8;
  [(DownloadController *)self _dispatchAsync:v7];
}

- (void)_handleSessionMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100145704;
  v12[3] = &unk_1003A4850;
  id v14 = a4;
  id v15 = a5;
  id v13 = v8;
  id v9 = v14;
  id v10 = v15;
  id v11 = v8;
  [(DownloadController *)self _dispatchAsync:v12];
}

- (BOOL)_pauseDownloads:(id)a3 isForced:(BOOL)a4 client:(id)a5
{
  unsigned int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  id v10 = [v8 count];
  if (v6) {
    unsigned int v6 = [v9 hasEntitlements];
  }
  id v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    id v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  unsigned int v13 = [v11 shouldLogToDisk];
  id v14 = [v11 OSLogObject];
  id v15 = v14;
  if (v13) {
    v12 |= 2u;
  }
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_12;
  }
  long long v16 = objc_opt_class();
  int v37 = 138413058;
  v38 = v16;
  __int16 v39 = 2048;
  id v40 = v10;
  __int16 v41 = 2112;
  id v42 = v9;
  __int16 v43 = 1024;
  unsigned int v44 = v6;
  id v17 = v16;
  LODWORD(v25) = 38;
  long long v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    id v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v37, v25);
    free(v18);
    SSFileLog();
LABEL_12:
  }
  uint64_t v19 = +[DownloadsDatabase downloadsDatabase];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100145A74;
  v26[3] = &unk_1003A7A98;
  id v20 = v8;
  id v27 = v20;
  id v21 = v9;
  id v28 = v21;
  v29 = self;
  v30 = &v33;
  id v31 = v10;
  char v32 = v6;
  id v22 = [v19 modifyUsingTransactionBlock:v26];

  BOOL v23 = *((unsigned char *)v34 + 24) != 0;
  _Block_object_dispose(&v33, 8);

  return v23;
}

- (BOOL)_prioritizeDownload:(id)a3 aboveDownload:(id)a4 client:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_10013E8DC;
  char v36 = sub_10013E8EC;
  id v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  unsigned int v13 = +[DownloadsDatabase downloadsDatabase];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100146258;
  v21[3] = &unk_1003A7AC0;
  id v14 = v10;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  id v24 = self;
  id v26 = &v32;
  id v27 = &v28;
  id v16 = v11;
  id v25 = v16;
  id v17 = [v13 modifyUsingTransactionBlock:v21];

  if (a6)
  {
    long long v18 = (void *)v33[5];
    if (v18) {
      *a6 = v18;
    }
  }
  char v19 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

- (void)_rescueStuckPlaceholderWithBundleID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    unsigned __int8 v5 = [(NSMutableSet *)self->_rescuingBundleIdentifiers containsObject:v4];
    uint64_t v6 = +[SSLogConfig sharedDaemonConfig];
    id v7 = (RescueAbandonedPlaceholderOperation *)v6;
    if (v5)
    {
      if (!v6)
      {
        id v7 = +[SSLogConfig sharedConfig];
      }
      unsigned int v8 = [(RescueAbandonedPlaceholderOperation *)v7 shouldLog];
      if ([(RescueAbandonedPlaceholderOperation *)v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      id v10 = [(RescueAbandonedPlaceholderOperation *)v7 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        v9 &= 2u;
      }
      if (v9)
      {
        int v29 = 138412546;
        id v30 = (id)objc_opt_class();
        __int16 v31 = 2112;
        id v32 = v4;
        id v11 = v30;
        LODWORD(v24) = 22;
        id v12 = (void *)_os_log_send_and_compose_impl();

        if (!v12)
        {
LABEL_30:

          goto LABEL_31;
        }
        id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v29, v24);
        free(v12);
        SSFileLog();
      }

      goto LABEL_30;
    }
    if (!v6)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [(RescueAbandonedPlaceholderOperation *)v7 shouldLog];
    if ([(RescueAbandonedPlaceholderOperation *)v7 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    id v15 = [(RescueAbandonedPlaceholderOperation *)v7 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      int v16 = v14;
    }
    else {
      int v16 = v14 & 2;
    }
    if (v16)
    {
      int v29 = 138412290;
      id v30 = v4;
      LODWORD(v24) = 12;
      id v23 = &v29;
      id v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_27:

        rescuingBundleIdentifiers = self->_rescuingBundleIdentifiers;
        if (!rescuingBundleIdentifiers)
        {
          char v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          id v20 = self->_rescuingBundleIdentifiers;
          self->_rescuingBundleIdentifiers = v19;

          rescuingBundleIdentifiers = self->_rescuingBundleIdentifiers;
        }
        -[NSMutableSet addObject:](rescuingBundleIdentifiers, "addObject:", v4, v23);
        id v7 = [[RescueAbandonedPlaceholderOperation alloc] initWithBundleIdentifier:v4];
        +[SSWeakReference weakReferenceWithObject:self];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1001468F8;
        v25[3] = &unk_1003A7B10;
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        id v27 = v4;
        uint64_t v28 = self;
        id v21 = v26;
        [(RescueAbandonedPlaceholderOperation *)v7 setOutputBlock:v25];
        id v22 = +[ISOperationQueue mainQueue];
        [v22 addOperation:v7];

        goto LABEL_30;
      }
      id v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v29, v24);
      free(v17);
      id v23 = (int *)v15;
      SSFileLog();
    }

    goto LABEL_27;
  }
LABEL_31:
}

- (BOOL)_resumeDownloads:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v6 count];
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    unsigned int v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v24 = 138412802;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2048;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      id v29 = v7;
      id v14 = v25;
      LODWORD(v19) = 32;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        int v16 = +[DownloadsDatabase downloadsDatabase];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100146DF8;
        v20[3] = &unk_1003A4D58;
        id v21 = v6;
        id v22 = v7;
        id v23 = self;
        id v17 = [v16 modifyUsingTransactionBlock:v20];

        goto LABEL_14;
      }
      unsigned int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v24, v19);
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return 1;
}

- (BOOL)_restartDownloads:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v6 count];
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    unsigned int v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v24 = 138412802;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2048;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      id v29 = v7;
      id v14 = v25;
      LODWORD(v19) = 32;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        int v16 = +[DownloadsDatabase downloadsDatabase];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10014737C;
        v20[3] = &unk_1003A4D58;
        id v21 = v6;
        id v22 = v7;
        id v23 = self;
        id v17 = [v16 modifyUsingTransactionBlock:v20];

        goto LABEL_14;
      }
      unsigned int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v24, v19);
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return 1;
}

- (void)_retryRestoreIfNecessaryForTransaction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 changeset];
  unsigned __int8 v5 = [v4 downloadChangeTypes];

  if ((v5 & 0x20) != 0)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (v8)
    {
      LODWORD(v15) = 138412290;
      *(void *)((char *)&v15 + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&v15 + 4);
      LODWORD(v14) = 12;
      unsigned int v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        +[RestoreDownloadsOperation resetShouldSuppressTermsAndConditionsDialogs];
        int v12 = +[NSNumber numberWithInteger:0];
        unsigned int v13 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_state.restore_state" value:v12 comparisonType:2];

        [v3 resetDownloadsMatchingPredicate:v13];
        [v3 addDownloadChangeTypes:128];

        goto LABEL_14;
      }
      uint64_t v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v14, v15);
      free(v11);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_sendDownloadKindsUsingNetwork:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned __int8 v5 = self->_managerClients;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        unsigned int v11 = objc_msgSend(v4, "allObjects", (void)v12);
        [v10 sendDownloadKindsUsingNetwork:v11];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspaceDownloadObserver, 0);
  objc_storeStrong((id *)&self->_thumbnailRequestsByDownloadID, 0);
  objc_storeStrong((id *)&self->_thumbnailOperationQueue, 0);
  objc_storeStrong((id *)&self->_rescuingBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_networkKinds, 0);
  objc_storeStrong((id *)&self->_managerClients, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end