@interface PushNotificationController
+ (BOOL)_amsHandleNotification:(id)a3 urlBag:(id)a4;
+ (id)_newPushHandlerWithURLBag:(id)a3;
+ (id)sharedInstance;
+ (id)soundFilesDirectoryPath;
- (BOOL)_isPushEnabled;
- (BOOL)_isValidEnvironment:(id)a3;
- (BOOL)_shouldAggressivelySendToken;
- (PushNotificationController)init;
- (id)_bag;
- (id)_clientForIdentifier:(id)a3 createIfNeeded:(BOOL)a4 inContext:(id)a5;
- (id)_enabledTopics;
- (id)_environmentForName:(id)a3 createIfNeeded:(BOOL)a4 inContext:(id)a5;
- (id)_environmentNameForConnection:(id)a3;
- (id)_newAPSConnectionWithEnvironment:(id)a3;
- (id)_newPostTokenOperationForEnvironment:(id)a3 account:(id)a4;
- (id)_portNameForEnvironmentName:(id)a3;
- (int64_t)_numberOfClientsInContext:(id)a3;
- (void)_accountStoreChangedNotification:(id)a3;
- (void)_addNotificationWithUserInfo:(id)a3 client:(id)a4 context:(id)a5;
- (void)_closeEnvironment:(id)a3 inContext:(id)a4;
- (void)_deviceNameChanged;
- (void)_fireRegisterBlocksAfterOperation:(id)a3;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_loadConnectionsInContext:(id)a3;
- (void)_networkTypeChanged:(id)a3;
- (void)_openConnectionForEnvironment:(id)a3;
- (void)_postNotificationsAvailableForClient:(id)a3 inContext:(id)a4;
- (void)_postTokenForEnvironment:(id)a3;
- (void)_postTokensIfNecessaryInContext:(id)a3;
- (void)_postTokensInContext:(id)a3 force:(BOOL)a4;
- (void)_reloadActiveEnvironmentInContext:(id)a3;
- (void)_reloadDaemonClientInContext:(id)a3;
- (void)_reloadPushStateInContext:(id)a3;
- (void)_resetLastRegisterAttemptTime;
- (void)_setShouldAggressivelySendToken:(BOOL)a3;
- (void)_storeFrontChangedNotification:(id)a3;
- (void)_updateEnvironmentAfterTokenPost:(id)a3;
- (void)_updatePushEnabledState;
- (void)_urlBagDidLoadNotification:(id)a3;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)observeXPCServer:(id)a3;
- (void)popRemoteNotificationWithMessage:(id)a3 connection:(id)a4;
- (void)postClientNotificationWithUserInfo:(id)a3;
- (void)postPushTokens;
- (void)registerNotificationClientWithMessage:(id)a3 connection:(id)a4;
- (void)registerTokenForEnvironmentName:(id)a3 accountIdentifier:(id)a4 completionBlock:(id)a5;
- (void)showLocalNotificationWithMessage:(id)a3 connection:(id)a4;
- (void)unregisterNotificationClientWithMessage:(id)a3 connection:(id)a4;
@end

@implementation PushNotificationController

- (PushNotificationController)init
{
  v22.receiver = self;
  v22.super_class = (Class)PushNotificationController;
  v2 = [(PushNotificationController *)&v22 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connections = v2->_connections;
    v2->_connections = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.PushNotificationController", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesstored.PushNotificationController.notify", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    v9 = v2->_notificationQueue;
    v10 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v9, v10);

    [(PushNotificationController *)v2 _resetLastRegisterAttemptTime];
    v11 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v11;

    [(ISOperationQueue *)v2->_operationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    v13 = +[Daemon daemon];
    [v13 addKeepAliveOperationQueue:v2->_operationQueue];

    v14 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008C780;
    block[3] = &unk_1003A3140;
    v15 = v2;
    v21 = v15;
    dispatch_async(v14, block);
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v15 selector:"_networkTypeChanged:" name:ISNetworkTypeChangedNotification object:0];
    [v16 addObserver:v15 selector:"_urlBagDidLoadNotification:" name:ISURLBagDidLoadNotification object:0];
    [v16 addObserver:v15 selector:"_accountStoreChangedNotification:" name:SSAccountStoreChangedNotification object:0];
    [v16 addObserver:v15 selector:"_storeFrontChangedNotification:" name:SSDeviceStoreFrontChangedNotification object:0];
    objc_initWeak(&location, v15);
    CFStringRef v23 = @"UserAssignedDeviceName";
    +[NSArray arrayWithObjects:&v23 count:1];
    objc_copyWeak(&v18, &location);
    v15->_deviceNameChangedToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
  [v3 removeObserver:self name:ISURLBagDidLoadNotification object:0];
  [v3 removeObserver:self name:SSAccountStoreChangedNotification object:0];
  [v3 removeObserver:self name:SSDeviceStoreFrontChangedNotification object:0];
  MGCancelNotifications();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_connections;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 setDelegate:0];
        [v9 removeFromRunLoop];
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = +[Daemon daemon];
  [v10 removeKeepAliveOperationQueue:self->_operationQueue];

  [(NSMutableArray *)self->_tokenOperations makeObjectsPerformSelector:"setCompletionBlock:" withObject:0];
  v11.receiver = self;
  v11.super_class = (Class)PushNotificationController;
  [(PushNotificationController *)&v11 dealloc];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CABC;
  block[3] = &unk_1003A31A0;
  void block[4] = a1;
  if (qword_100401D08 != -1) {
    dispatch_once(&qword_100401D08, block);
  }
  v2 = (void *)qword_100401D00;

  return v2;
}

+ (id)soundFilesDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v3, @"com.apple.itunesstored", @"APNS_Sounds", 0);
  id v5 = +[NSString pathWithComponents:v4];

  return v5;
}

- (void)postClientNotificationWithUserInfo:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008CC48;
  v7[3] = &unk_1003A3268;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)postPushTokens
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D1D4;
  block[3] = &unk_1003A3140;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)registerTokenForEnvironmentName:(id)a3 accountIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008D468;
  v15[3] = &unk_1003A4F70;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self selector:"popRemoteNotificationWithMessage:connection:" forMessage:79];
  [v4 addObserver:self selector:"registerNotificationClientWithMessage:connection:" forMessage:80];
  [v4 addObserver:self selector:"showLocalNotificationWithMessage:connection:" forMessage:78];
  [v4 addObserver:self selector:"unregisterNotificationClientWithMessage:connection:" forMessage:81];
}

- (void)popRemoteNotificationWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008D860;
  v7[3] = &unk_1003A4F98;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PushNotificationController *)v8 _handleMessage:v6 connection:v5 usingBlock:v7];
}

- (void)registerNotificationClientWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008DB6C;
  v7[3] = &unk_1003A4F98;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PushNotificationController *)v8 _handleMessage:v6 connection:v5 usingBlock:v7];
}

- (void)showLocalNotificationWithMessage:(id)a3 connection:(id)a4
{
  id v7 = a3;
  if (SSXPCConnectionHasEntitlement())
  {
    objc_opt_class();
    id v5 = (void *)SSXPCDictionaryCopyObjectWithClass();
    id v6 = [[PushNotificationDisplayOperation alloc] initWithNotificationUserInfo:v5];
    [(ISOperationQueue *)self->_operationQueue addOperation:v6];
  }
}

- (void)unregisterNotificationClientWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008DF28;
  v7[3] = &unk_1003A4F98;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PushNotificationController *)v8 _handleMessage:v6 connection:v5 usingBlock:v7];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E360;
  block[3] = &unk_1003A4298;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E698;
  block[3] = &unk_1003A4298;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)_accountStoreChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008ED78;
  block[3] = &unk_1003A3140;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_deviceNameChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008EE60;
  block[3] = &unk_1003A3140;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_networkTypeChanged:(id)a3
{
  id v4 = +[ISNetworkObserver sharedInstance];
  id v5 = [v4 networkType];

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008F0B8;
    block[3] = &unk_1003A3140;
    void block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_storeFrontChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F1C0;
  block[3] = &unk_1003A3140;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_urlBagDidLoadNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F2E4;
  block[3] = &unk_1003A3140;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
  id v4 = objc_alloc_init(PushNotificationSoundsSyncOperation);
  id v5 = +[ISOperationQueue mainQueue];
  [v5 addOperation:v4];
}

- (void)_addNotificationWithUserInfo:(id)a3 client:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = +[PushNotification entityFromContext:v7];
  id v10 = [[PushNotification alloc] initWithEntity:v12 insertIntoManagedObjectContext:v7];

  [(PushNotification *)v10 setClient:v8];
  id v11 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:0];

  [(PushNotification *)v10 setUserInfo:v11];
}

+ (BOOL)_amsHandleNotification:(id)a3 urlBag:(id)a4
{
  id v6 = a3;
  if (!a4)
  {
    a4 = +[SSLogConfig sharedDaemonConfig];
    if (!a4)
    {
      a4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [a4 shouldLog];
    if ([a4 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [a4 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      int v15 = 138412290;
      id v16 = a1;
      LODWORD(v14) = 12;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_17:

        LOBYTE(a4) = 0;
        goto LABEL_18;
      }
      id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v15, v14);
      free(v12);
      SSFileLog();
    }

    goto LABEL_17;
  }
  id v7 = [a1 _newPushHandlerWithURLBag:a4];
  LODWORD(a4) = [v7 shouldHandleNotification:v6];
  if (a4) {
    [v7 handleNotification:v6];
  }

LABEL_18:
  return (char)a4;
}

- (id)_bag
{
  id v2 = objc_alloc((Class)ISLoadURLBagOperation);
  v3 = +[SSURLBagContext contextWithBagType:0];
  id v4 = [v2 initWithBagContext:v3];

  [v4 run];
  id v5 = [v4 URLBag];

  return v5;
}

- (id)_clientForIdentifier:(id)a3 createIfNeeded:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  int v9 = +[PushNotificationClient entityFromContext:v8];
  id v10 = objc_alloc_init((Class)NSFetchRequest);
  [v10 setEntity:v9];
  int v11 = +[NSPredicate predicateWithFormat:@"clientIdentifier=%@", v7];
  [v10 setPredicate:v11];

  id v38 = 0;
  id v12 = [v8 executeFetchRequest:v10 error:&v38];
  id v13 = v38;
  uint64_t v14 = v13;
  if (!v12)
  {
    id v32 = v7;
    id v16 = v13;
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    v20 = [v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      int v21 = v19;
    }
    else {
      int v21 = v19 & 2;
    }
    if (v21)
    {
      objc_super v22 = objc_opt_class();
      int v40 = 138412546;
      v41 = v22;
      __int16 v42 = 2112;
      id v43 = v16;
      id v23 = v22;
      LODWORD(v31) = 22;
      v24 = (void *)_os_log_send_and_compose_impl();

      uint64_t v14 = v16;
      id v7 = v32;
      if (!v24)
      {
LABEL_28:

        int v15 = 0;
        goto LABEL_29;
      }
      v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v40, v31);
      free(v24);
      SSFileLog();
    }
    else
    {
      uint64_t v14 = v16;
      id v7 = v32;
    }

    goto LABEL_28;
  }
  if ([v12 count] == (id)1)
  {
    int v15 = [v12 objectAtIndex:0];
  }
  else
  {
    v33 = v14;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v12;
    id v26 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
          [v8 deleteObject:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        }
        id v27 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v27);
    }

    if (v6)
    {
      int v15 = [[PushNotificationClient alloc] initWithEntity:v9 insertIntoManagedObjectContext:v8];
      [(PushNotificationClient *)v15 setClientIdentifier:v7];
    }
    else
    {
      int v15 = 0;
    }
    uint64_t v14 = v33;
    sub_10004BBA0(v8);
  }
LABEL_29:

  return v15;
}

- (void)_closeEnvironment:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 environmentName];
  int v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    int v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  id v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    v11 &= 2u;
  }
  if (v11)
  {
    *(_DWORD *)id v25 = 138412546;
    *(void *)&v25[4] = objc_opt_class();
    *(_WORD *)&v25[12] = 2112;
    *(void *)&v25[14] = v6;
    id v13 = *(id *)&v25[4];
    LODWORD(v24) = 22;
    id v23 = v25;
    uint64_t v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_12;
    }
    id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v25, v24, *(_OWORD *)v25, *(void *)&v25[16]);
    free(v14);
    id v23 = v12;
    SSFileLog();
  }

LABEL_12:
  [v7 deleteObject:v6];

  int v15 = [(NSMutableDictionary *)self->_connections objectForKey:v8];
  if (v15)
  {
    id v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      id v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = objc_msgSend(v16, "shouldLog", v23);
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    int v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v18 &= 2u;
    }
    if (v18)
    {
      v20 = objc_opt_class();
      *(_DWORD *)id v25 = 138412546;
      *(void *)&v25[4] = v20;
      *(_WORD *)&v25[12] = 2112;
      *(void *)&v25[14] = v8;
      id v21 = v20;
      LODWORD(v24) = 22;
      objc_super v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_24:

        [v15 setDelegate:0];
        [v15 setEnabledTopics:0];
        [v15 removeFromRunLoop];
        [(NSMutableDictionary *)self->_connections removeObjectForKey:v8];
        goto LABEL_25;
      }
      int v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, v25, v24);
      free(v22);
      SSFileLog();
    }

    goto LABEL_24;
  }
LABEL_25:
}

- (id)_enabledTopics
{
  if ([(PushNotificationController *)self _isPushEnabled])
  {
    id v2 = +[NSArray arrayWithObject:@"com.apple.itunesstored"];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)_environmentForName:(id)a3 createIfNeeded:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  int v9 = +[PushNotificationEnvironment entityFromContext:v8];
  id v10 = objc_alloc_init((Class)NSFetchRequest);
  [v10 setEntity:v9];
  int v11 = +[NSPredicate predicateWithFormat:@"environmentName = %@", v7];
  [v10 setPredicate:v11];

  id v39 = 0;
  id v12 = [v8 executeFetchRequest:v10 error:&v39];
  id v13 = v39;
  uint64_t v14 = v13;
  if (!v12)
  {
    id v33 = v7;
    id v16 = v13;
    unsigned int v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      unsigned int v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    v20 = [v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      int v21 = v19;
    }
    else {
      int v21 = v19 & 2;
    }
    if (v21)
    {
      objc_super v22 = objc_opt_class();
      int v41 = 138412546;
      __int16 v42 = v22;
      __int16 v43 = 2112;
      id v44 = v16;
      id v23 = v22;
      LODWORD(v32) = 22;
      uint64_t v24 = (void *)_os_log_send_and_compose_impl();

      uint64_t v14 = v16;
      id v7 = v33;
      if (!v24)
      {
LABEL_28:

        int v15 = 0;
        goto LABEL_29;
      }
      v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v41, v32);
      free(v24);
      SSFileLog();
    }
    else
    {
      uint64_t v14 = v16;
      id v7 = v33;
    }

    goto LABEL_28;
  }
  if ([v12 count] == (id)1)
  {
    int v15 = [v12 objectAtIndex:0];
  }
  else
  {
    long long v34 = v14;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = v12;
    id v26 = [v25 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          [v8 deleteObject:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        }
        id v27 = [v25 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v27);
    }

    if (v6)
    {
      int v15 = [[PushNotificationEnvironment alloc] initWithEntity:v9 insertIntoManagedObjectContext:v8];
      [(PushNotificationEnvironment *)v15 setEnvironmentName:v7];
      v30 = +[NSNumber numberWithInteger:0];
      [(PushNotificationEnvironment *)v15 setLastAccountIdentifier:v30];
    }
    else
    {
      int v15 = 0;
    }
    sub_10004BBA0(v8);
    uint64_t v14 = v34;
  }
LABEL_29:

  return v15;
}

- (id)_environmentNameForConnection:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_connections;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        -[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", v10, (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)_fireRegisterBlocksAfterOperation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [v4 authenticationContext];
  id v7 = [v6 requiredUniqueIdentifier];

  id v26 = v4;
  uint64_t v8 = [v4 environmentName];
  uint64_t v9 = (uint64_t)[(NSMutableArray *)self->_registerBlocks count];
  if (v9 >= 1)
  {
    unint64_t v10 = v9 + 1;
    do
    {
      id v11 = [(NSMutableArray *)self->_registerBlocks objectAtIndex:v10 - 2];
      id v12 = [v11 accountIdentifier];
      if ([v12 isEqualToNumber:v7])
      {
        id v13 = [v11 environmentName];
        unsigned int v14 = [v13 isEqualToString:v8];

        if (v14)
        {
          long long v15 = [v11 block];
          [v5 insertObject:v15 atIndex:0];

          [(NSMutableArray *)self->_registerBlocks removeObjectAtIndex:v10 - 2];
        }
      }
      else
      {
      }
      --v10;
    }
    while (v10 > 1);
  }
  if ([v5 count])
  {
    long long v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      long long v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    int v19 = [v16 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      int v21 = objc_opt_class();
      id v22 = v21;
      int v29 = 138412546;
      v30 = v21;
      __int16 v31 = 2048;
      id v32 = [v5 count];
      LODWORD(v25) = 22;
      id v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_21:

        notificationQueue = self->_notificationQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000905B8;
        block[3] = &unk_1003A3140;
        id v28 = v5;
        dispatch_async(notificationQueue, block);

        goto LABEL_22;
      }
      int v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v29, v25);
      free(v23);
      SSFileLog();
    }

    goto LABEL_21;
  }
LABEL_22:
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  id v11 = [[XPCClient alloc] initWithInputConnection:v9];
  if ([(XPCClient *)v11 hasEntitlements])
  {
    id v12 = +[Daemon daemon];
    [v12 takeKeepAliveAssertion:@"com.apple.itunesstore.PushNotificationController"];

    dispatchQueue = self->_dispatchQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000907EC;
    v15[3] = &unk_1003A4FC0;
    id v17 = v10;
    long long v16 = v11;
    dispatch_async(dispatchQueue, v15);
  }
  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    xpc_connection_send_message(v9, reply);
  }
}

- (BOOL)_isPushEnabled
{
  return self->_pushEnabledState != 0;
}

- (BOOL)_isValidEnvironment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 isEqualToString:APSEnvironmentProduction]) {
      unsigned __int8 v4 = 1;
    }
    else {
      unsigned __int8 v4 = [v3 isEqualToString:APSEnvironmentDevelopment];
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_loadConnectionsInContext:(id)a3
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
    *(_DWORD *)v57 = 138412290;
    *(void *)&v57[4] = objc_opt_class();
    id v9 = *(id *)&v57[4];
    LODWORD(v49) = 12;
    v47 = v57;
    id v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v57, v49);
    free(v10);
    v47 = v8;
    SSFileLog();
  }

LABEL_12:
  id v11 = objc_alloc_init((Class)NSFetchRequest);
  id v12 = +[PushNotificationEnvironment entityFromContext:v4];
  [v11 setEntity:v12];

  id v55 = 0;
  id v13 = [v4 executeFetchRequest:v11 error:&v55];
  id v14 = v55;
  uint64_t v15 = +[SSLogConfig sharedDaemonConfig];
  long long v16 = (void *)v15;
  v50 = v14;
  if (!v13)
  {
    if (!v15)
    {
      long long v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v30 = objc_msgSend(v16, "shouldLog", v47);
    if ([v16 shouldLogToDisk]) {
      int v31 = v30 | 2;
    }
    else {
      int v31 = v30;
    }
    id v32 = [v16 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      int v33 = v31;
    }
    else {
      int v33 = v31 & 2;
    }
    if (v33)
    {
      long long v34 = objc_opt_class();
      *(_DWORD *)v57 = 138412546;
      *(void *)&v57[4] = v34;
      *(_WORD *)&v57[12] = 2112;
      *(void *)&v57[14] = v14;
      id v35 = v34;
      LODWORD(v49) = 22;
      v48 = v57;
      long long v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_45:

        goto LABEL_46;
      }
      id v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, v57, v49);
      free(v36);
      v48 = v32;
      SSFileLog();
    }

    goto LABEL_45;
  }
  if (!v15)
  {
    long long v16 = +[SSLogConfig sharedConfig];
  }
  unsigned int v17 = objc_msgSend(v16, "shouldLog", v47);
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  int v19 = [v16 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
    int v20 = v18;
  }
  else {
    int v20 = v18 & 2;
  }
  if (!v20) {
    goto LABEL_24;
  }
  int v21 = objc_opt_class();
  id v22 = v21;
  id v23 = [v13 count];
  *(_DWORD *)v57 = 138412546;
  *(void *)&v57[4] = v21;
  *(_WORD *)&v57[12] = 2048;
  *(void *)&v57[14] = v23;
  LODWORD(v49) = 22;
  v48 = v57;
  uint64_t v24 = (void *)_os_log_send_and_compose_impl();

  if (v24)
  {
    int v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, v57, v49);
    free(v24);
    v48 = v19;
    SSFileLog();
LABEL_24:
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v25 = v13;
  id v26 = [v25 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v52;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v52 != v28) {
          objc_enumerationMutation(v25);
        }
        -[PushNotificationController _openConnectionForEnvironment:](self, "_openConnectionForEnvironment:", *(void *)(*((void *)&v51 + 1) + 8 * i), v48);
      }
      id v27 = [v25 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v27);
  }

  sub_10004BBA0(v4);
LABEL_46:
  *(void *)v57 = APSEnvironmentProduction;
  id v37 = APSEnvironmentDevelopment;
  uint64_t v38 = 0;
  *(void *)&v57[8] = v37;
  char v39 = 1;
  do
  {
    char v40 = v39;
    uint64_t v41 = *(void *)&v57[8 * v38];
    __int16 v42 = -[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", v41, v48);

    if (!v42)
    {
      id v43 = objc_alloc((Class)APSConnection);
      id v44 = [(PushNotificationController *)self _portNameForEnvironmentName:v41];
      id v45 = [v43 initWithEnvironmentName:v41 namedDelegatePort:v44];

      [v45 setEnabledTopics:0];
    }
    char v39 = 0;
    uint64_t v38 = 1;
  }
  while ((v40 & 1) != 0);
  for (uint64_t j = 8; j != -8; j -= 8)
}

- (id)_newAPSConnectionWithEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)APSConnection);
  unsigned int v6 = [(PushNotificationController *)self _portNameForEnvironmentName:v4];
  id v7 = [v5 initWithEnvironmentName:v4 namedDelegatePort:v6];

  [v7 setDelegate:self];
  id v8 = [(PushNotificationController *)self _enabledTopics];
  [v7 setEnabledTopics:v8];

  id v9 = +[NSRunLoop mainRunLoop];
  [v7 scheduleInRunLoop:v9];

  return v7;
}

- (id)_newPostTokenOperationForEnvironment:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [PostPushNotificationTokenOperation alloc];
  id v8 = [v6 environmentName];
  id v9 = [v6 tokenData];

  id v10 = [(PostPushNotificationTokenOperation *)v7 initWithEnvironmentName:v8 tokenData:v9];
  id v11 = [objc_alloc((Class)SSAuthenticationContext) initWithAccount:v5];

  [(PostPushNotificationTokenOperation *)v10 setAuthenticationContext:v11];
  return v10;
}

+ (id)_newPushHandlerWithURLBag:(id)a3
{
  CFStringRef v10 = @"4";
  CFStringRef v11 = @"22";
  CFStringRef v12 = @"25";
  id v3 = a3;
  id v4 = +[NSArray arrayWithObjects:&v10 count:3];
  id v5 = +[NSSet setWithArray:](NSSet, "setWithArray:", v4, v10, v11, v12);

  id v6 = [objc_alloc((Class)AMSPushConfiguration) initWithEnabledActionTypes:v5];
  [v6 setUserNotificationExtensionId:@"mst-notification-category"];
  id v7 = [objc_alloc((Class)ISAMSBagShim) initWithURLBag:v3];

  id v8 = [objc_alloc((Class)AMSPushHandler) initWithConfiguration:v6 bag:v7];
  return v8;
}

- (int64_t)_numberOfClientsInContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSFetchRequest);
  id v5 = +[PushNotificationClient entityFromContext:v3];
  [v4 setEntity:v5];

  id v6 = [v3 countForFetchRequest:v4 error:0];
  return (int64_t)v6;
}

- (void)_openConnectionForEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [v4 environmentName];
  if (![(PushNotificationController *)self _isValidEnvironment:v5]) {
    goto LABEL_18;
  }
  id v6 = [(NSMutableDictionary *)self->_connections objectForKey:v5];
  if (!v6)
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    CFStringRef v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      *(_DWORD *)int v20 = 138412546;
      *(void *)&v20[4] = objc_opt_class();
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v4;
      id v11 = *(id *)&v20[4];
      LODWORD(v19) = 22;
      int v18 = v20;
      CFStringRef v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_14:

        id v6 = [(PushNotificationController *)self _newAPSConnectionWithEnvironment:v5];
        [(NSMutableDictionary *)self->_connections setObject:v6 forKey:v5];
        goto LABEL_15;
      }
      CFStringRef v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v20, v19, *(_OWORD *)v20, *(void *)&v20[16]);
      free(v12);
      int v18 = v10;
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:
  id v13 = objc_msgSend(v6, "publicToken", v18);
  id v14 = [v4 tokenData];
  unsigned __int8 v15 = [v13 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    long long v16 = +[NSNumber numberWithInteger:0];
    [v4 setLastAccountIdentifier:v16];

    unsigned int v17 = [v6 publicToken];
    [v4 setTokenData:v17];
  }
LABEL_18:
}

- (id)_portNameForEnvironmentName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:APSEnvironmentProduction])
  {
    CFStringRef v4 = @"com.apple.itunesstored.aps";
  }
  else if ([v3 isEqualToString:APSEnvironmentDevelopment])
  {
    CFStringRef v4 = @"com.apple.itunesstored.aps.dev";
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return (id)v4;
}

- (void)_postNotificationsAvailableForClient:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSFetchRequest);
  unsigned int v8 = +[PushNotification entityFromContext:v6];
  [v7 setEntity:v8];

  int v9 = +[NSPredicate predicateWithFormat:@"client=%@", v5];
  [v7 setPredicate:v9];

  uint64_t v10 = (uint64_t)[v6 countForFetchRequest:v7 error:0];
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
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    v13 &= 2u;
  }
  if (v13)
  {
    unsigned __int8 v15 = objc_opt_class();
    id v16 = v15;
    [v5 clientIdentifier];
    int v19 = 138412802;
    int v20 = v15;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 32;
    unsigned int v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_12;
    }
    id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v19, v18);
    free(v17);
    SSFileLog();
  }

LABEL_12:
  if (v10 >= 1) {
    notify_post(kSSNotificationReceivedPushNotification);
  }
}

- (void)_postTokenForEnvironment:(id)a3
{
  id v4 = a3;
  if ([(PushNotificationController *)self _isPushEnabled])
  {
    [(PushNotificationController *)self _setShouldAggressivelySendToken:1];
    id v5 = [v4 environmentName];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = self->_tokenOperations;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v33;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
        id v11 = [v10 environmentName];
        unsigned __int8 v12 = [v11 isEqualToString:v5];

        if (v12) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v21 = v10;

      if (v21) {
        goto LABEL_25;
      }
    }
    else
    {
LABEL_10:
    }
    uint64_t v22 = +[SSAccountStore defaultStore];
    __int16 v23 = [v22 activeAccount];
    id v21 = [(PushNotificationController *)self _newPostTokenOperationForEnvironment:v4 account:v23];

    objc_initWeak((id *)location, v21);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100091B2C;
    v30[3] = &unk_1003A5010;
    v30[4] = self;
    objc_copyWeak(&v31, (id *)location);
    [v21 setCompletionBlock:v30];
    tokenOperations = self->_tokenOperations;
    if (!tokenOperations)
    {
      id v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      id v27 = self->_tokenOperations;
      p_tokenOperations = &self->_tokenOperations;
      *p_tokenOperations = v25;

      tokenOperations = *p_tokenOperations;
    }
    [(NSMutableArray *)tokenOperations addObject:v21];
    uint64_t v28 = +[ISOperationQueue mainQueue];
    [v28 addOperation:v21];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)location);
LABEL_25:
  }
  else
  {
    id v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    unsigned __int8 v15 = [v5 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    if (v14)
    {
      id v16 = objc_opt_class();
      int64_t pushEnabledState = self->_pushEnabledState;
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v16;
      __int16 v37 = 2048;
      int64_t v38 = pushEnabledState;
      id v18 = v16;
      LODWORD(v29) = 22;
      int v19 = (void *)_os_log_send_and_compose_impl();

      if (v19)
      {
        int v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, location, v29);
        free(v19);
        SSFileLog();
      }
    }
    else
    {
    }
  }
}

- (void)_postTokensIfNecessaryInContext:(id)a3
{
}

- (void)_postTokensInContext:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(PushNotificationController *)self _shouldAggressivelySendToken])
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v60 = 138543362;
      id v61 = (id)objc_opt_class();
      id v11 = v61;
      LODWORD(v51) = 12;
      uint64_t v49 = &v60;
      unsigned __int8 v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        BOOL v4 = 1;
        goto LABEL_14;
      }
      uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v60, v51);
      free(v12);
      uint64_t v49 = (int *)v10;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if ([(PushNotificationController *)self _isPushEnabled])
  {
    unsigned int v13 = +[SSAccountStore defaultStore];
    int v14 = [v13 activeAccount];

    unsigned __int8 v15 = objc_alloc_init((Class)NSFetchRequest);
    id v16 = +[PushNotificationEnvironment entityFromContext:v6];
    [v15 setEntity:v16];

    if (!v4)
    {
      unsigned int v17 = [v14 uniqueIdentifier];
      id v18 = +[NSPredicate predicateWithFormat:@"(tokenData != nil) AND (lastAccountIdentifier != %@)", v17];
      [v15 setPredicate:v18];
    }
    id v58 = 0;
    int v19 = [v6 executeFetchRequest:v15 error:&v58];
    id v20 = v58;
    uint64_t v21 = +[SSLogConfig sharedDaemonConfig];
    id v22 = (id)v21;
    if (v19)
    {
      id v53 = v6;
      if (!v21)
      {
        id v22 = +[SSLogConfig sharedConfig];
      }
      unsigned int v23 = [v22 shouldLog];
      if ([v22 shouldLogToDisk]) {
        int v24 = v23 | 2;
      }
      else {
        int v24 = v23;
      }
      id v25 = [v22 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
        int v26 = v24;
      }
      else {
        int v26 = v24 & 2;
      }
      if (v26)
      {
        id v27 = v20;
        uint64_t v28 = objc_opt_class();
        id v52 = v28;
        id v29 = [v19 count];
        int v60 = 138543874;
        id v61 = v28;
        id v20 = v27;
        __int16 v62 = 2048;
        id v63 = v29;
        __int16 v64 = 1024;
        BOOL v65 = v4;
        LODWORD(v51) = 28;
        v50 = &v60;
        unsigned int v30 = (void *)_os_log_send_and_compose_impl();

        id v6 = v53;
        if (!v30) {
          goto LABEL_53;
        }
        id v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v60, v51);
        free(v30);
        v50 = (int *)v25;
        SSFileLog();
      }
      else
      {
        id v6 = v53;
      }

LABEL_53:
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v22 = v19;
      id v44 = [v22 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v44)
      {
        id v45 = v44;
        id v46 = v20;
        uint64_t v47 = *(void *)v55;
        do
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(void *)v55 != v47) {
              objc_enumerationMutation(v22);
            }
            -[PushNotificationController _postTokenForEnvironment:](self, "_postTokenForEnvironment:", *(void *)(*((void *)&v54 + 1) + 8 * i), v50);
          }
          id v45 = [v22 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v45);
        id v20 = v46;
      }
      goto LABEL_61;
    }
    if (!v21)
    {
      id v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v36 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v37 = v36 | 2;
    }
    else {
      int v37 = v36;
    }
    int64_t v38 = [v22 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
      int v39 = v37;
    }
    else {
      int v39 = v37 & 2;
    }
    if (v39)
    {
      id v40 = v6;
      uint64_t v41 = objc_opt_class();
      int v60 = 138412546;
      id v61 = v41;
      __int16 v62 = 2112;
      id v63 = v20;
      id v42 = v41;
      LODWORD(v51) = 22;
      id v43 = (void *)_os_log_send_and_compose_impl();

      if (!v43)
      {
        id v6 = v40;
        goto LABEL_61;
      }
      int64_t v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v60, v51);
      free(v43);
      SSFileLog();
      id v6 = v40;
    }

LABEL_61:
    goto LABEL_62;
  }
  int v14 = +[SSLogConfig sharedDaemonConfig];
  if (!v14)
  {
    int v14 = +[SSLogConfig sharedConfig];
  }
  unsigned int v31 = [v14 shouldLog];
  if ([v14 shouldLogToDisk]) {
    v31 |= 2u;
  }
  unsigned __int8 v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    int v32 = v31;
  }
  else {
    int v32 = v31 & 2;
  }
  if (!v32) {
    goto LABEL_62;
  }
  long long v33 = objc_opt_class();
  int v60 = 138543362;
  id v61 = v33;
  id v34 = v33;
  LODWORD(v51) = 12;
  long long v35 = (void *)_os_log_send_and_compose_impl();

  if (v35)
  {
    unsigned __int8 v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v60, v51);
    free(v35);
    SSFileLog();
LABEL_62:
  }
}

- (void)_reloadActiveEnvironmentInContext:(id)a3
{
  id v4 = a3;
  int64_t pushEnabledState = self->_pushEnabledState;
  if (pushEnabledState != -1)
  {
    if (pushEnabledState == 1)
    {
      id v6 = [(PushNotificationController *)self _bag];
      id v7 = [v6 valueForKey:@"push-notifications"];
      unsigned int v8 = [v7 objectForKey:@"environment"];
      if (![(PushNotificationController *)self _isValidEnvironment:v8])
      {
        int v9 = (__CFString *)APSEnvironmentProduction;

        unsigned int v8 = v9;
      }
    }
    else
    {
      unsigned int v8 = 0;
    }
    if (![(PushNotificationController *)self _numberOfClientsInContext:v4])
    {

      unsigned int v8 = 0;
    }
    uint64_t v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      uint64_t v10 = +[SSLogConfig sharedConfig];
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
      int v48 = 138412546;
      id v49 = (id)objc_opt_class();
      __int16 v50 = 2112;
      uint64_t v51 = v8;
      id v14 = v49;
      LODWORD(v41) = 22;
      unsigned __int8 v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15) {
        goto LABEL_20;
      }
      unsigned int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v48, v41);
      free(v15);
      SSFileLog();
    }

LABEL_20:
    id v16 = objc_alloc_init((Class)NSFetchRequest);
    unsigned int v17 = +[PushNotificationEnvironment entityFromContext:v4];
    [v16 setEntity:v17];

    CFStringRef v18 = @"nil";
    if (v8) {
      CFStringRef v18 = v8;
    }
    int v19 = +[NSPredicate predicateWithFormat:@"environmentName != %@", v18];
    [v16 setPredicate:v19];

    id v46 = 0;
    id v20 = [v4 executeFetchRequest:v16 error:&v46];
    uint64_t v21 = (__CFString *)v46;
    if (v20)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v22 = v20;
      id v23 = [v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v43;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(v22);
            }
            [(PushNotificationController *)self _closeEnvironment:*(void *)(*((void *)&v42 + 1) + 8 * i) inContext:v4];
          }
          id v24 = [v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v24);
      }
LABEL_42:

      if (v8)
      {
        long long v33 = [(PushNotificationController *)self _environmentForName:v8 createIfNeeded:1 inContext:v4];
        [(PushNotificationController *)self _openConnectionForEnvironment:v33];
        [(PushNotificationController *)self _postTokensIfNecessaryInContext:v4];
LABEL_55:

        goto LABEL_56;
      }
      long long v33 = +[SSLogConfig sharedDaemonConfig];
      if (!v33)
      {
        long long v33 = +[SSLogConfig sharedConfig];
      }
      unsigned int v34 = objc_msgSend(v33, "shouldLog", v40);
      if ([v33 shouldLogToDisk]) {
        int v35 = v34 | 2;
      }
      else {
        int v35 = v34;
      }
      unsigned int v36 = [v33 OSLogObject];
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
        v35 &= 2u;
      }
      if (v35)
      {
        int v37 = objc_opt_class();
        int v48 = 138543362;
        id v49 = v37;
        id v38 = v37;
        LODWORD(v41) = 12;
        int v39 = (void *)_os_log_send_and_compose_impl();

        if (!v39) {
          goto LABEL_55;
        }
        unsigned int v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v48, v41);
        free(v39);
        SSFileLog();
      }

      goto LABEL_55;
    }
    id v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22)
    {
      id v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    id v29 = [v22 OSLogObject];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      v28 &= 2u;
    }
    if (v28)
    {
      unsigned int v30 = objc_opt_class();
      int v48 = 138412546;
      id v49 = v30;
      __int16 v50 = 2112;
      uint64_t v51 = v21;
      id v31 = v30;
      LODWORD(v41) = 22;
      id v40 = &v48;
      int v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32) {
        goto LABEL_42;
      }
      id v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v48, v41);
      free(v32);
      id v40 = (int *)v29;
      SSFileLog();
    }

    goto LABEL_42;
  }
LABEL_56:
}

- (void)_reloadDaemonClientInContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PushNotificationController *)self _bag];
  id v6 = [v5 valueForKey:@"automatic-downloads2"];
  if (!v6)
  {
    id v6 = [v5 valueForKey:@"automatic-downloads"];
  }
  id v7 = [v6 objectForKey:@"downloads-url"];

  if (!v7)
  {
    unsigned __int8 v15 = [(PushNotificationController *)self _clientForIdentifier:@"com.apple.itunesstored" createIfNeeded:0 inContext:v4];
    if (!v15)
    {
LABEL_29:

      goto LABEL_30;
    }
    id v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      id v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    int v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v18 &= 2u;
    }
    if (v18)
    {
      LODWORD(v23) = 138412290;
      *(void *)((char *)&v23 + 4) = objc_opt_class();
      id v20 = *(id *)((char *)&v23 + 4);
      LODWORD(v22) = 12;
      uint64_t v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_28:

        [v4 deleteObject:v15];
        goto LABEL_29;
      }
      int v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v23, v22, v23);
      free(v21);
      SSFileLog();
    }

    goto LABEL_28;
  }
  unsigned int v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8)
  {
    unsigned int v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  unsigned int v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_14;
  }
  LODWORD(v23) = 138412290;
  *(void *)((char *)&v23 + 4) = objc_opt_class();
  id v12 = *(id *)((char *)&v23 + 4);
  LODWORD(v22) = 12;
  unsigned int v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    unsigned int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v23, v22, v23);
    free(v13);
    SSFileLog();
LABEL_14:
  }
  id v14 = [(PushNotificationController *)self _clientForIdentifier:@"com.apple.itunesstored" createIfNeeded:1 inContext:v4];
LABEL_30:
}

- (void)_reloadPushStateInContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PushNotificationController *)self _isPushEnabled];
  [(PushNotificationController *)self _updatePushEnabledState];
  [(PushNotificationController *)self _reloadDaemonClientInContext:v4];
  [(PushNotificationController *)self _reloadActiveEnvironmentInContext:v4];
  unsigned int v6 = [(PushNotificationController *)self _isPushEnabled];
  if (v5 == v6) {
    goto LABEL_31;
  }
  unsigned int v7 = v6;
  unsigned int v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8)
  {
    unsigned int v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  unsigned int v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_12;
  }
  id v12 = objc_opt_class();
  int64_t pushEnabledState = self->_pushEnabledState;
  int v44 = 138412546;
  long long v45 = v12;
  __int16 v46 = 2048;
  int64_t v47 = pushEnabledState;
  id v14 = v12;
  LODWORD(v33) = 22;
  int v32 = &v44;
  unsigned __int8 v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    unsigned int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v44, v33);
    free(v15);
    int v32 = (int *)v11;
    SSFileLog();
LABEL_12:
  }
  id v16 = [(PushNotificationController *)self _enabledTopics];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unsigned int v17 = self->_connections;
  id v18 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = -[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", *(void *)(*((void *)&v38 + 1) + 8 * i), v32);
        [v22 setEnabledTopics:v16];
      }
      id v19 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v19);
  }

  if (v7)
  {
    [(PushNotificationController *)self _postTokensIfNecessaryInContext:v4];
  }
  else
  {
    id v23 = objc_alloc_init((Class)NSFetchRequest);
    id v24 = +[PushNotificationEnvironment entityFromContext:v4];
    [v23 setEntity:v24];

    uint64_t v25 = [v4 executeFetchRequest:v23 error:0];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v27; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
          unsigned int v30 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
          id v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0, v32);
          [v30 setLastAccountIdentifier:v31];
        }
        id v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v27);
    }
  }
LABEL_31:
}

- (void)_resetLastRegisterAttemptTime
{
  self->_lastRegisterAttemptTime = CFAbsoluteTimeGetCurrent() + -3600.0;
}

- (void)_setShouldAggressivelySendToken:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    id v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFStringRef v4 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"ShouldForcePushTokenRequest", *v3, kSSUserDefaultsIdentifier);

  CFPreferencesAppSynchronize(v4);
}

- (BOOL)_shouldAggressivelySendToken
{
  return CFPreferencesGetAppBooleanValue(@"ShouldForcePushTokenRequest", kSSUserDefaultsIdentifier, 0) != 0;
}

- (void)_updateEnvironmentAfterTokenPost:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSThread beginPrivateManagedContextSession];
  unsigned int v6 = [v4 environmentName];
  unsigned int v7 = [(PushNotificationController *)self _environmentForName:v6 createIfNeeded:0 inContext:v5];

  if (v7)
  {
    unsigned int v8 = [v4 authenticationContext];
    unsigned int v9 = [v8 requiredUniqueIdentifier];

    int v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      int v10 = +[SSLogConfig sharedConfig];
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
      id v14 = objc_opt_class();
      id v15 = v14;
      id v16 = [v4 environmentName];
      int v20 = 138412802;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      LODWORD(v19) = 32;
      id v18 = &v20;
      unsigned int v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_13:

        [v7 setLastAccountIdentifier:v9];
        sub_10004BBA0(v5);

        goto LABEL_14;
      }
      unsigned int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v20, v19);
      free(v17);
      id v18 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  +[NSThread endPrivateManagedContextSession];
}

- (void)_updatePushEnabledState
{
  id v3 = [(PushNotificationController *)self _bag];
  id v4 = +[SSAccountStore defaultStore];
  unsigned int v5 = [v4 activeAccount];

  if (v5)
  {
    if (v3)
    {
      unsigned int v6 = [v3 valueForKey:@"push-notifications"];

      if (v6)
      {
        self->_int64_t pushEnabledState = 1;
        unsigned int v7 = +[SSLogConfig sharedDaemonConfig];
        if (!v7)
        {
          unsigned int v7 = +[SSLogConfig sharedConfig];
        }
        unsigned int v8 = [v7 shouldLog];
        if ([v7 shouldLogToDisk]) {
          int v9 = v8 | 2;
        }
        else {
          int v9 = v8;
        }
        int v10 = [v7 OSLogObject];
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          v9 &= 2u;
        }
        if (!v9) {
          goto LABEL_41;
        }
      }
      else
      {
        self->_int64_t pushEnabledState = 0;
        unsigned int v7 = +[SSLogConfig sharedDaemonConfig];
        if (!v7)
        {
          unsigned int v7 = +[SSLogConfig sharedConfig];
        }
        unsigned int v15 = [v7 shouldLog];
        if ([v7 shouldLogToDisk]) {
          int v16 = v15 | 2;
        }
        else {
          int v16 = v15;
        }
        int v10 = [v7 OSLogObject];
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          v16 &= 2u;
        }
        if (!v16) {
          goto LABEL_41;
        }
      }
    }
    else
    {
      self->_int64_t pushEnabledState = -1;
      unsigned int v7 = +[SSLogConfig sharedDaemonConfig];
      if (!v7)
      {
        unsigned int v7 = +[SSLogConfig sharedConfig];
      }
      unsigned int v13 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      int v10 = [v7 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        v14 &= 2u;
      }
      if (!v14) {
        goto LABEL_41;
      }
    }
  }
  else
  {
    self->_int64_t pushEnabledState = 0;
    unsigned int v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      unsigned int v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (!v12) {
      goto LABEL_41;
    }
  }
  unsigned int v17 = objc_opt_class();
  int64_t pushEnabledState = self->_pushEnabledState;
  *(_DWORD *)__int16 v22 = 138543618;
  *(void *)&v22[4] = v17;
  *(_WORD *)&v22[12] = 2048;
  *(void *)&v22[14] = pushEnabledState;
  id v19 = v17;
  LODWORD(v21) = 22;
  int v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16]);
    free(v20);
    SSFileLog();
LABEL_41:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenOperations, 0);
  objc_storeStrong((id *)&self->_registerBlocks, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

@end