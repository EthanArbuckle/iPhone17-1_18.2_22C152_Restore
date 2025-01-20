@interface WCDPushKitManager
+ (id)bundleIDFromTopic:(id)a3;
+ (id)bundleIDsFromTopics:(id)a3;
+ (id)sharedPushKitManager;
+ (id)topicFromBundleId:(id)a3;
+ (id)topicsFromBundleIDs:(id)a3;
- (APSConnection)developmentConnection;
- (APSConnection)productionConnection;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSHashTable)clientsDeniedComplicationRegister;
- (NSMutableDictionary)bundleIDToClient;
- (NSString)state;
- (NSXPCListener)xpcListener;
- (WCDPushKitManager)init;
- (void)clientRequestingComplicationRegister:(id)a3;
- (void)clientRequestingComplicationUnregister:(id)a3;
- (void)clientXPCConnectionDidDisconnect:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)launchClient:(id)a3;
- (void)releaseAssertionForBundleID:(id)a3;
- (void)releaseAssertionForClient:(id)a3;
- (void)setUpInitialState;
- (void)systemObserverActiveComplicationsChanged;
- (void)systemObserverComplicationsInstalledChanged;
@end

@implementation WCDPushKitManager

+ (id)sharedPushKitManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000273CC;
  block[3] = &unk_100044E28;
  block[4] = a1;
  if (qword_100051730 != -1) {
    dispatch_once(&qword_100051730, block);
  }
  v2 = (void *)qword_100051728;

  return v2;
}

- (WCDPushKitManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)WCDPushKitManager;
  v2 = [(WCDPushKitManager *)&v24 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    clientsDeniedComplicationRegister = v2->_clientsDeniedComplicationRegister;
    v2->_clientsDeniedComplicationRegister = (NSHashTable *)v3;

    uint64_t v5 = objc_opt_new();
    bundleIDToClient = v2->_bundleIDToClient;
    v2->_bundleIDToClient = (NSMutableDictionary *)v5;

    v7 = +[WCDSystemMonitor sharedSystemMonitor];
    [v7 addObserver:v2];

    v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.watchconnectivity.complication"];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v8;

    v10 = [(WCDPushKitManager *)v2 xpcListener];
    [v10 _setQueue:&_dispatch_main_q];

    v11 = [(WCDPushKitManager *)v2 xpcListener];
    [v11 setDelegate:v2];

    v12 = [(WCDPushKitManager *)v2 xpcListener];
    [v12 resume];

    id v13 = objc_alloc((Class)APSConnection);
    v14 = (APSConnection *)[v13 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.watchconnectivity.complication.push" queue:&_dispatch_main_q];
    productionConnection = v2->_productionConnection;
    v2->_productionConnection = v14;

    v16 = [(WCDPushKitManager *)v2 productionConnection];
    [v16 setDelegate:v2];

    id v17 = objc_alloc((Class)APSConnection);
    v18 = (APSConnection *)[v17 initWithEnvironmentName:APSEnvironmentDevelopment namedDelegatePort:@"com.apple.watchconnectivity.complication.push.development" queue:&_dispatch_main_q];
    developmentConnection = v2->_developmentConnection;
    v2->_developmentConnection = v18;

    v20 = [(WCDPushKitManager *)v2 developmentConnection];
    [v20 setDelegate:v2];

    [(WCDPushKitManager *)v2 setUpInitialState];
    v21 = wc_pushkit_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Notifying any clients listening to reconnect", v23, 2u);
    }

    notify_post("com.apple.pushkit.launch.complication");
  }
  return v2;
}

- (NSString)state
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  NSAppendPrintF();
  id v5 = v4;

  v12 = [(WCDPushKitManager *)self productionConnection];
  NSAppendPrintF();
  id v6 = v5;

  id v13 = [(WCDPushKitManager *)self developmentConnection];
  NSAppendPrintF();
  id v7 = v6;

  v14 = [(WCDPushKitManager *)self bundleIDToClient];
  NSAppendPrintF();
  id v8 = v7;

  v15 = [(WCDPushKitManager *)self clientsDeniedComplicationRegister];
  NSAppendPrintF();
  id v9 = v8;

  return (NSString *)v9;
}

- (void)setUpInitialState
{
  [(WCDPushKitManager *)self systemObserverComplicationsInstalledChanged];

  [(WCDPushKitManager *)self systemObserverActiveComplicationsChanged];
}

- (void)dealloc
{
  uint64_t v3 = [(WCDPushKitManager *)self developmentConnection];
  [v3 setDelegate:0];

  id v4 = [(WCDPushKitManager *)self productionConnection];
  [v4 setDelegate:0];

  id v5 = [(WCDPushKitManager *)self xpcListener];
  [v5 invalidate];

  id v6 = +[WCDSystemMonitor sharedSystemMonitor];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)WCDPushKitManager;
  [(WCDPushKitManager *)&v7 dealloc];
}

- (void)systemObserverActiveComplicationsChanged
{
  uint64_t v3 = +[WCDSystemMonitor sharedSystemMonitor];
  id v4 = [v3 iOSApplicationsContainingActiveComplications];

  [(id)objc_opt_class() topicsFromBundleIDs:v4];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100027A7C;
  v18[3] = &unk_1000453D0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v5;
  id v6 = objc_retainBlock(v18);
  objc_super v7 = [(WCDPushKitManager *)self productionConnection];
  ((void (*)(void *, void *))v6[2])(v6, v7);

  id v8 = [(WCDPushKitManager *)self developmentConnection];
  ((void (*)(void *, void *))v6[2])(v6, v8);

  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100027C3C;
  v16 = &unk_1000453D0;
  id v17 = v5;
  id v9 = v5;
  v10 = objc_retainBlock(&v13);
  v11 = [(WCDPushKitManager *)self productionConnection];
  ((void (*)(void ***, void *))v10[2])(v10, v11);

  v12 = [(WCDPushKitManager *)self developmentConnection];
  ((void (*)(void ***, void *))v10[2])(v10, v12);
}

- (void)systemObserverComplicationsInstalledChanged
{
  uint64_t v3 = +[WCDSystemMonitor sharedSystemMonitor];
  id v4 = [v3 applicationWorkspace];
  id v5 = [v4 iOSApplicationsContainingComplications];
  id v6 = [v5 bs_map:&stru_1000453F0];

  [(id)objc_opt_class() topicsFromBundleIDs:v6];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000280BC;
  v25[3] = &unk_1000453D0;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v20;
  objc_super v7 = objc_retainBlock(v25);
  id v8 = [(WCDPushKitManager *)self productionConnection];
  ((void (*)(void *, void *))v7[2])(v7, v8);

  id v9 = [(WCDPushKitManager *)self developmentConnection];
  id v19 = v7;
  ((void (*)(void *, void *))v7[2])(v7, v9);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = [(WCDPushKitManager *)self clientsDeniedComplicationRegister];
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = [v15 bundleID];
        unsigned int v17 = [v6 containsObject:v16];

        if (v17)
        {
          v18 = wc_pushkit_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "replaying client requesting complication register for client %{public}@", buf, 0xCu);
          }

          [(WCDPushKitManager *)self clientRequestingComplicationRegister:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v12);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 wc_connectionBundleID];
  objc_super v7 = [v5 valueForEntitlement:@"aps-environment"];
  uint64_t v8 = APSEnvironmentProduction;
  if (([v7 isEqual:APSEnvironmentProduction] & 1) != 0
    || ([v7 isEqual:APSEnvironmentDevelopment] & 1) != 0)
  {
    id v9 = [(WCDPushKitManager *)self bundleIDToClient];
    v10 = [v9 objectForKeyedSubscript:v6];

    if (!v10)
    {
      v10 = [[WCDPKClient alloc] initWithBundleID:v6];
      [(WCDPKClient *)v10 setDelegate:self];
      id v11 = [(WCDPushKitManager *)self bundleIDToClient];
      [v11 setObject:v10 forKeyedSubscript:v6];
    }
    -[WCDPKClient setProductionEnvironment:](v10, "setProductionEnvironment:", [v7 isEqual:v8]);
    [(WCDPKClient *)v10 setConnection:v5];
    id v12 = wc_pushkit_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Accepting new connection from client: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    BOOL v13 = 1;
  }
  else
  {
    wc_pushkit_log();
    v10 = (WCDPKClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      sub_10002CB98();
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (void)clientXPCConnectionDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = wc_pushkit_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(WCDPushKitManager *)self releaseAssertionForClient:v4];
  id v6 = [(WCDPushKitManager *)self bundleIDToClient];
  objc_super v7 = [v4 bundleID];
  [v6 removeObjectForKey:v7];
}

- (void)clientRequestingComplicationRegister:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isProductionEnvironment];
  id v6 = @"Development";
  if (v5) {
    id v6 = @"Production";
  }
  objc_super v7 = v6;
  int v8 = +[WCDSystemMonitor sharedSystemMonitor];
  id v9 = [v8 applicationWorkspace];
  v10 = [v4 bundleID];
  id v11 = [v9 applicationInfoForBundleIdentifier:v10 type:1];

  if ([v11 hasComplications])
  {
    id v12 = objc_opt_class();
    BOOL v13 = [v4 bundleID];
    uint64_t v14 = [v12 topicFromBundleId:v13];

    if ([v4 isProductionEnvironment]) {
      [(WCDPushKitManager *)self productionConnection];
    }
    else {
    v16 = [(WCDPushKitManager *)self developmentConnection];
    }
    unsigned int v17 = wc_pushkit_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "token %{public}@", buf, 0xCu);
    }
    v28 = v7;

    [v16 requestTokenForTopic:v14 identifier:0];
    v18 = [v16 enabledTopics];
    id v19 = +[NSMutableArray arrayWithArray:v18];

    [v19 removeObject:v14];
    id v20 = [v16 ignoredTopics];
    long long v21 = +[NSMutableArray arrayWithArray:v20];

    [v21 removeObject:v14];
    long long v22 = +[WCDSystemMonitor sharedSystemMonitor];
    long long v23 = [v22 iOSApplicationsContainingActiveComplications];
    long long v24 = [v4 bundleID];
    unsigned int v25 = [v23 containsObject:v24];

    if (v25)
    {
      [v19 addObject:v14];
      id v26 = wc_pushkit_log();
      objc_super v7 = v28;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v30 = v28;
        __int16 v31 = 2114;
        v32 = v14;
        v27 = "%{public}@ Topic added to Enabled list: %{public}@.";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);
      }
    }
    else
    {
      [v21 addObject:v14];
      id v26 = wc_pushkit_log();
      objc_super v7 = v28;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v30 = v28;
        __int16 v31 = 2114;
        v32 = v14;
        v27 = "%{public}@ Topic added to Ignored list: %{public}@.";
        goto LABEL_16;
      }
    }

    [v16 setEnabledTopics:v19 ignoredTopics:v21];
    goto LABEL_18;
  }
  int v15 = [(WCDPushKitManager *)self clientsDeniedComplicationRegister];
  [v15 addObject:v4];

  uint64_t v14 = wc_pushkit_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10002CC00();
  }
LABEL_18:
}

- (void)clientRequestingComplicationUnregister:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(WCDPushKitManager *)self clientsDeniedComplicationRegister];
  [v5 removeObject:v4];

  unsigned int v6 = [v4 isProductionEnvironment];
  objc_super v7 = @"Development";
  if (v6) {
    objc_super v7 = @"Production";
  }
  int v8 = v7;
  id v9 = objc_opt_class();
  uint64_t v10 = [v4 bundleID];
  id v11 = [v9 topicFromBundleId:v10];

  LOBYTE(v10) = [v4 isProductionEnvironment];
  if (v10) {
    [(WCDPushKitManager *)self productionConnection];
  }
  else {
  id v12 = [(WCDPushKitManager *)self developmentConnection];
  }
  BOOL v13 = wc_pushkit_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    int v15 = v8;
    __int16 v16 = 2114;
    unsigned int v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "invalidating %{public}@ token for topic %{public}@", (uint8_t *)&v14, 0x16u);
  }

  [v12 invalidateTokenForTopic:v11 identifier:0];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = wc_pushkit_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connection: %{public}@, publicToken: %{public}@", buf, 0x16u);
  }

  id v9 = [(WCDPushKitManager *)self productionConnection];
  unsigned int v10 = [v6 isEqual:v9];

  id v11 = (id *)&APSEnvironmentDevelopment;
  if (v10) {
    id v11 = (id *)&APSEnvironmentProduction;
  }
  id v12 = *v11;
  BOOL v13 = [(WCDPushKitManager *)self bundleIDToClient];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100028CFC;
  v16[3] = &unk_100045418;
  v16[4] = self;
  id v17 = v12;
  id v18 = v6;
  id v14 = v6;
  id v15 = v12;
  [v13 enumerateKeysAndObjectsUsingBlock:v16];
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = wc_pushkit_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138544130;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v12;
    __int16 v24 = 2114;
    id v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "connection: %{public}@, token: %{public}@, topic: %{public}@, identifier: %{public}@", (uint8_t *)&v18, 0x2Au);
  }

  id v15 = [(id)objc_opt_class() bundleIDFromTopic:v12];
  __int16 v16 = [(WCDPushKitManager *)self bundleIDToClient];
  id v17 = [v16 objectForKeyedSubscript:v15];

  [v17 deliverToken:v11];
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = wc_pushkit_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connection: %{public}@, message: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  id v9 = [v7 topic];
  id v10 = [v7 userInfo];
  id v11 = [(id)objc_opt_class() bundleIDFromTopic:v9];
  id v12 = wc_pushkit_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "topic: %{public}@ bundleID: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  id v13 = [(WCDPushKitManager *)self bundleIDToClient];
  id v14 = [v13 objectForKeyedSubscript:v11];

  if (!v14)
  {
    id v14 = [[WCDPKClient alloc] initWithBundleID:v11];
    [(WCDPKClient *)v14 setDelegate:self];
    id v15 = [(WCDPushKitManager *)self bundleIDToClient];
    [v15 setObject:v14 forKeyedSubscript:v11];
  }
  [(WCDPKClient *)v14 deliverPayload:v10];
  if ([(WCDPKClient *)v14 isRunning])
  {
    __int16 v16 = wc_pushkit_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "bundleID: %{public}@, not launching as it's already running", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    [(WCDPushKitManager *)self launchClient:v14];
  }
}

- (void)releaseAssertionForBundleID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = wc_pushkit_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(WCDPushKitManager *)self bundleIDToClient];
  id v7 = [v6 objectForKeyedSubscript:v4];

  [(WCDPushKitManager *)self releaseAssertionForClient:v7];
}

- (void)launchClient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleID];
  unsigned int v5 = wc_pushkit_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[FBSSystemService sharedService];
  uint64_t v34 = FBSOpenApplicationOptionKeyActivateSuspended;
  v35 = &__kCFBooleanTrue;
  int v8 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000297EC;
  v27[3] = &unk_100045440;
  p_long long buf = &buf;
  id v9 = v4;
  id v28 = v9;
  id v10 = v6;
  v29 = v10;
  [v7 openApplication:v9 options:v8 withResult:v27];

  dispatch_time_t v11 = dispatch_time(0, 20000000000);
  intptr_t v12 = dispatch_semaphore_wait(v10, v11);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    id v13 = wc_pushkit_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002CCD0();
    }
  }
  else if (v12)
  {
    id v13 = wc_pushkit_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002CC68();
    }
  }
  else
  {
    id v14 = wc_pushkit_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138543362;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "bundleID: %{public}@, successfully launched the app", v32, 0xCu);
    }

    id v13 = [(id)objc_opt_class() topicFromBundleId:v9];
    objc_initWeak((id *)v32, v3);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002994C;
    v24[3] = &unk_100045468;
    id v15 = v9;
    id v25 = v15;
    objc_copyWeak(&v26, (id *)v32);
    __int16 v16 = objc_retainBlock(v24);
    [v3 setAssertionInvalidationHandler:v16];
    id v17 = objc_alloc((Class)RBSAssertion);
    id v18 = +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:v15];
    __int16 v19 = +[RBSTarget targetWithProcessIdentity:v18];
    id v20 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.watchconnectivity" name:@"BackgroundDownload"];
    __int16 v31 = v20;
    id v21 = +[NSArray arrayWithObjects:&v31 count:1];
    id v22 = [v17 initWithExplanation:v13 target:v19 attributes:v21];
    [v3 setAssertion:v22];

    id v23 = [v3 assertion];
    [v23 acquireWithInvalidationHandler:v16];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)v32);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)releaseAssertionForClient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 assertion];

  if (v4)
  {
    unsigned int v5 = wc_pushkit_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "invalidating assertion for client %{public}@", (uint8_t *)&v8, 0xCu);
    }

    dispatch_semaphore_t v6 = [v3 assertion];
    id v7 = [v3 assertionInvalidationHandler];
    ((void (**)(void, void *, void))v7)[2](v7, v6, 0);
    [v6 invalidate];
  }
}

+ (id)bundleIDFromTopic:(id)a3
{
  id v3 = a3;
  id v4 = [v3 substringWithRange:0, (char *)[v3 length] + ~(unint64_t)["complication" length]];

  return v4;
}

+ (id)bundleIDsFromTopics:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        dispatch_time_t v11 = [a1 bundleIDFromTopic:*(void *)(*((void *)&v13 + 1) + 8 * i) :v13];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)topicFromBundleId:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@", a3, @"complication"];
}

+ (id)topicsFromBundleIDs:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        dispatch_time_t v11 = [a1 topicFromBundleId:*(void *)(*((void *)&v13 + 1) + 8 * i) :v13];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (APSConnection)productionConnection
{
  return self->_productionConnection;
}

- (APSConnection)developmentConnection
{
  return self->_developmentConnection;
}

- (NSMutableDictionary)bundleIDToClient
{
  return self->_bundleIDToClient;
}

- (NSHashTable)clientsDeniedComplicationRegister
{
  return self->_clientsDeniedComplicationRegister;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsDeniedComplicationRegister, 0);
  objc_storeStrong((id *)&self->_bundleIDToClient, 0);
  objc_storeStrong((id *)&self->_developmentConnection, 0);
  objc_storeStrong((id *)&self->_productionConnection, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end