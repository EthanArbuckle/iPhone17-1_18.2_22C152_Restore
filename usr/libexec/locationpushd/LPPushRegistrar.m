@interface LPPushRegistrar
+ (id)bundleIdFromTopic:(id)a3;
+ (id)sharedInstance;
+ (id)topicFromBundleId:(id)a3;
- (APSConnection)developmentAPSConnection;
- (APSConnection)productionAPSConnection;
- (BOOL)_setTopicEnabled:(BOOL)a3 forConnection:(id)a4 appBundleIdentifier:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (LPPushRegistrar)init;
- (NSMutableDictionary)bundleIdentifierToApplication;
- (NSXPCListener)locationPushRegistrationServer;
- (OS_dispatch_queue)apsdQueue;
- (OS_dispatch_queue)dictionaryMutationQueue;
- (id)_apsConnectionForEnvironment:(id)a3;
- (id)_findOrCreateApplicationWithBundleIdentifier:(id)a3;
- (id)_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:(id)a3;
- (void)_addOrMoveTopic:(id)a3 forConnection:(id)a4 toList:(unint64_t)a5;
- (void)_invalidateTokenForTopic:(id)a3 fromConnection:(id)a4;
- (void)_removeTopic:(id)a3 forConnection:(id)a4;
- (void)_removeUnneededSandboxTopicsFromDevelopmentConnection;
- (void)_unregisterLocationPushApplication:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)connectionDidReconnect:(id)a3;
- (void)handleApplicationUninstalledNotification:(id)a3;
- (void)registerForPushToken:(id)a3 completion:(id)a4;
- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5;
@end

@implementation LPPushRegistrar

+ (id)sharedInstance
{
  if (qword_100010EA0 != -1) {
    dispatch_once(&qword_100010EA0, &stru_10000C3B8);
  }
  v2 = (void *)qword_100010EA8;

  return v2;
}

- (LPPushRegistrar)init
{
  v26.receiver = self;
  v26.super_class = (Class)LPPushRegistrar;
  v2 = [(LPPushRegistrar *)&v26 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.locationpushd", 0);
    apsdQueue = v2->_apsdQueue;
    v2->_apsdQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.locationpushd.ivar", 0);
    dictionaryMutationQueue = v2->_dictionaryMutationQueue;
    v2->_dictionaryMutationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIdentifierToApplication = v2->_bundleIdentifierToApplication;
    v2->_bundleIdentifierToApplication = v7;

    v9 = [(LPPushRegistrar *)v2 apsdQueue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000058E0;
    handler[3] = &unk_10000C3E0;
    v10 = v2;
    v25 = v10;
    xpc_set_event_stream_handler("com.apple.distnoted.matching", v9, handler);

    id v11 = objc_alloc((Class)APSConnection);
    uint64_t v12 = APSEnvironmentProduction;
    v13 = [v10 apsdQueue];
    id v14 = [v11 initWithEnvironmentName:v12 namedDelegatePort:@"com.apple.aps.locationpushd.production" queue:v13];
    id v15 = v10[2];
    v10[2] = v14;

    [v10[2] setDelegate:v10];
    id v16 = objc_alloc((Class)APSConnection);
    uint64_t v17 = APSEnvironmentDevelopment;
    v18 = [v10 apsdQueue];
    id v19 = [v16 initWithEnvironmentName:v17 namedDelegatePort:@"com.apple.aps.locationpushd.development" queue:v18];
    id v20 = v10[3];
    v10[3] = v19;

    [v10[3] setDelegate:v10];
    id v21 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.locationpushd.pushregistration"];
    id v22 = v10[1];
    v10[1] = v21;

    [v10[1] setDelegate:v10];
    [v10[1] resume];
  }
  return v2;
}

- (id)_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:(id)a3
{
  id v3 = a3;
  id v17 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    uint64_t v7 = APSEnvironmentDevelopment;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v10 = [(id)objc_opt_class() bundleIdFromTopic:v9];
        id v11 = objc_alloc((Class)LSApplicationRecord);
        id v19 = 0;
        id v12 = [v11 initWithBundleIdentifier:v10 allowPlaceholder:1 error:&v19];
        id v13 = v19;
        id v14 = [v12 entitlements];
        id v15 = [v14 objectForKey:@"aps-environment" ofClass:objc_opt_class()];
        if (([v15 isEqualToString:v7] & 1) == 0) {
          [v17 addObject:v9];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  return v17;
}

- (void)_removeUnneededSandboxTopicsFromDevelopmentConnection
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [self->_developmentAPSConnection opportunisticTopics];
  id v5 = [self->_developmentAPSConnection ignoredTopics];
  uint64_t v6 = [(LPPushRegistrar *)self _topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:v4];
  [v3 addObjectsFromArray:v6];

  uint64_t v7 = [(LPPushRegistrar *)self _topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:v5];
  [v3 addObjectsFromArray:v7];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v12);
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        id v14 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing topic from sandbox environment %{public}@", buf, 0xCu);
        }
        [(LPPushRegistrar *)self _removeTopic:v13 forConnection:self->_developmentAPSConnection];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v10);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LPPushTokenServerProtocol];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  uint64_t v7 = [v5 valueForEntitlement:@"com.apple.private.locationpushd.pushtokenregistration"];
  unsigned __int8 v8 = [v7 BOOLValue];

  if (v8) {
    [v5 resume];
  }
  else {
    [v5 invalidate];
  }

  return v8;
}

- (void)connectionDidReconnect:(id)a3
{
  id v4 = a3;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v5 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "APSConnection: %{public}@ did reconnect", (uint8_t *)&v6, 0xCu);
  }
  [(LPPushRegistrar *)self _removeUnneededSandboxTopicsFromDevelopmentConnection];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v7 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "APSConnection: %{public}@ did receive publicToken", (uint8_t *)&v8, 0xCu);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v14 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138544130;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "for connection: %{public}@ token: %{public}@ topic: %{public}@ identifier: %{public}@", (uint8_t *)&v19, 0x2Au);
  }
  long long v15 = [(id)objc_opt_class() bundleIdFromTopic:v12];
  long long v16 = [(LPPushRegistrar *)self _findOrCreateApplicationWithBundleIdentifier:v15];
  long long v17 = v16;
  if (v16)
  {
    [v16 deliverToken:v11];
  }
  else
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    long long v18 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not find installed app for %{public}@, maybe it was offloaded?", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = [v5 topic];
  id v7 = [v5 userInfo];

  int v8 = [(id)objc_opt_class() bundleIdFromTopic:v6];
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v9 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138543875;
    long long v18 = v6;
    __int16 v19 = 2114;
    *(void *)id v20 = v8;
    *(_WORD *)&v20[8] = 2113;
    __int16 v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Incoming message has topic: %{public}@ bundleID: %{public}@ userInfo %{private}@", (uint8_t *)&v17, 0x20u);
  }
  id v10 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];
  if ([v10 isPlaceholder])
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    id v11 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      long long v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Dropping push on the floor because it seems like the app is in the midst of updating or has been offloaded. bundleID: %{public}@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    id v12 = [(LPPushRegistrar *)self _findOrCreateApplicationWithBundleIdentifier:v8];
    unsigned int v13 = [v12 hasLocationPushEntitlement];
    unsigned int v14 = [v12 hasLocationPushServiceExtension];
    unsigned int v15 = v14;
    if (v13 && v14)
    {
      [v12 deliverLocationPayloadToExtension:v7];
    }
    else
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      long long v16 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543874;
        long long v18 = v6;
        __int16 v19 = 1026;
        *(_DWORD *)id v20 = v13;
        *(_WORD *)&v20[4] = 1026;
        *(_DWORD *)&v20[6] = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Incoming message for %{public}@ caused push token deregistration because entitlement is %{public}d or extension is %{public}d", (uint8_t *)&v17, 0x18u);
      }
      [(LPPushRegistrar *)self _unregisterLocationPushApplication:v8];
    }
  }
}

- (id)_findOrCreateApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unsigned int v15 = sub_1000066D4;
  long long v16 = sub_1000066E4;
  id v17 = 0;
  id v5 = [(LPPushRegistrar *)self dictionaryMutationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000066EC;
  block[3] = &unk_10000C408;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)registerForPushToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  int v8 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to register bundle ID %{public}@ for location pushes", buf, 0xCu);
  }
  if (v6)
  {
    id v9 = [(LPPushRegistrar *)self _findOrCreateApplicationWithBundleIdentifier:v6];
    id v10 = v9;
    if (v9)
    {
      if ([v9 hasLocationPushEntitlement])
      {
        if ([v10 hasLocationPushServiceExtension])
        {
          id v11 = [v10 apsEnvironment];
          if (v11)
          {
            uint64_t v12 = [(LPPushRegistrar *)self _apsConnectionForEnvironment:v11];
            unsigned int v13 = [(id)objc_opt_class() topicFromBundleId:v6];
            [v10 addPendingTokenReply:v7];
            uint64_t v14 = [(LPPushRegistrar *)self apsdQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100006D78;
            block[3] = &unk_10000C330;
            block[4] = self;
            id v15 = v12;
            id v25 = v15;
            id v26 = v6;
            dispatch_sync(v14, block);

            if (qword_100010D10 != -1) {
              dispatch_once(&qword_100010D10, &stru_10000C450);
            }
            long long v16 = qword_100010D18;
            if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v28 = v13;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Requesting token for topic %@", buf, 0xCu);
            }
            [v15 requestTokenForTopic:v13 identifier:&stru_10000C630];
          }
          else
          {
            if (qword_100010D10 != -1) {
              dispatch_once(&qword_100010D10, &stru_10000C450);
            }
            __int16 v23 = qword_100010D18;
            if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v28 = v6;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Ignoring registerBundleIdentifier: request because no valid aps-environment present for %@", buf, 0xCu);
            }
            id v15 = +[NSError errorWithDomain:CLLocationPushServiceErrorDomain code:2 userInfo:0];
            v7[2](v7, 0, v15);
          }

          goto LABEL_36;
        }
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        id v22 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignoring registerBundleIdentifier: request because no Location Push Service Extension present for %@", buf, 0xCu);
        }
        NSErrorDomain v19 = CLLocationPushServiceErrorDomain;
        uint64_t v20 = 1;
      }
      else
      {
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        __int16 v21 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          id v28 = v6;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Ignoring registerBundleIdentifier: request because location push entitlement is missing from  %{public}@", buf, 0xCu);
        }
        NSErrorDomain v19 = CLLocationPushServiceErrorDomain;
        uint64_t v20 = 3;
      }
    }
    else
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      long long v18 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignoring registerBundleIdentifier: request because application is not valid", buf, 2u);
      }
      NSErrorDomain v19 = NSPOSIXErrorDomain;
      uint64_t v20 = 22;
    }
    id v11 = +[NSError errorWithDomain:v19 code:v20 userInfo:0];
    v7[2](v7, 0, v11);
LABEL_36:

    goto LABEL_37;
  }
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v17 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ignoring registerBundleIdentifier: request because bundle identifier is nil", buf, 2u);
  }
  id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  v7[2](v7, 0, v10);
LABEL_37:
}

- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(LPPushRegistrar *)self _findOrCreateApplicationWithBundleIdentifier:v8];
  id v11 = [v10 apsEnvironment];
  uint64_t v12 = [(LPPushRegistrar *)self _apsConnectionForEnvironment:v11];

  unsigned int v13 = [(LPPushRegistrar *)self apsdQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006ECC;
  block[3] = &unk_10000C430;
  id v18 = v12;
  NSErrorDomain v19 = self;
  BOOL v22 = a3;
  id v20 = v8;
  id v21 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v12;
  dispatch_async(v13, block);
}

- (void)handleApplicationUninstalledNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(LPPushRegistrar *)self apsdQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006FDC;
  v7[3] = &unk_10000C2E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_unregisterLocationPushApplication:(id)a3
{
  id v4 = a3;
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v5 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Unregistering application %{public}@ from Location Pushes", buf, 0xCu);
  }
  id v6 = [(id)objc_opt_class() topicFromBundleId:v4];
  id v7 = [(LPPushRegistrar *)self _findOrCreateApplicationWithBundleIdentifier:v4];
  id v8 = [v7 apsEnvironment];
  id v9 = [(LPPushRegistrar *)self _apsConnectionForEnvironment:v8];

  if (v9)
  {
    [(LPPushRegistrar *)self _invalidateTokenForTopic:v6 fromConnection:v9];
  }
  else
  {
    id v10 = [(LPPushRegistrar *)self productionAPSConnection];
    [(LPPushRegistrar *)self _invalidateTokenForTopic:v6 fromConnection:v10];

    id v11 = [(LPPushRegistrar *)self developmentAPSConnection];
    [(LPPushRegistrar *)self _invalidateTokenForTopic:v6 fromConnection:v11];
  }
  uint64_t v12 = [(LPPushRegistrar *)self dictionaryMutationQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000737C;
  v14[3] = &unk_10000C2E0;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_sync(v12, v14);
}

- (void)_invalidateTokenForTopic:(id)a3 fromConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(LPPushRegistrar *)self _removeTopic:v7 forConnection:v6];
  [v6 invalidateTokenForTopic:v7 identifier:&stru_10000C630];
}

- (void)_removeTopic:(id)a3 forConnection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 opportunisticTopics];
  id v10 = [v7 mutableCopy];

  [v10 removeObject:v6];
  [v5 _setOpportunisticTopics:v10];
  id v8 = [v5 ignoredTopics];
  id v9 = [v8 mutableCopy];

  [v9 removeObject:v6];
  [v5 _setIgnoredTopics:v9];
}

- (void)_addOrMoveTopic:(id)a3 forConnection:(id)a4 toList:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 opportunisticTopics];
  unsigned int v10 = [v9 containsObject:v7];

  if (v10)
  {
    if (a5 == 1)
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      id v11 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 68289282;
        int v35 = 0;
        __int16 v36 = 2082;
        v37 = "";
        __int16 v38 = 2114;
        unint64_t v39 = (unint64_t)v7;
        uint64_t v12 = "{\"msg%{public}.0s\":\"Not adding to OpportunisticTopics since it's already an added topic\", \"topic\":%{"
              "public, location:escape_only}@}";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v34, 0x1Cu);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    id v15 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 68289794;
      int v35 = 0;
      __int16 v36 = 2082;
      v37 = "";
      __int16 v38 = 2114;
      unint64_t v39 = (unint64_t)v7;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2050;
      unint64_t v43 = a5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Moving topic from opportunisitic list connection\", \"topic\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@, \"toList\":%{public}lu}", (uint8_t *)&v34, 0x30u);
    }
    id v16 = v8;
    id v17 = v7;
    uint64_t v18 = 1;
LABEL_33:
    [v16 moveTopic:v17 fromList:v18 toList:a5];
    goto LABEL_42;
  }
  id v13 = [v8 ignoredTopics];
  unsigned int v14 = [v13 containsObject:v7];

  if (!v14)
  {
    if (a5 == 2)
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      v27 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 68289538;
        int v35 = 0;
        __int16 v36 = 2082;
        v37 = "";
        __int16 v38 = 2114;
        unint64_t v39 = (unint64_t)v7;
        __int16 v40 = 2114;
        id v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Adding topic to ignored list\", \"topic\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@}", (uint8_t *)&v34, 0x26u);
      }
      id v20 = objc_alloc_init((Class)NSMutableSet);
      uint64_t v28 = [v8 ignoredTopics];
      v29 = (void *)v28;
      v30 = &__NSArray0__struct;
      if (v28) {
        v30 = (void *)v28;
      }
      id v31 = v30;

      [v20 addObjectsFromArray:v31];
      [v20 addObject:v7];
      id v25 = [v20 allObjects];
      [v8 _setIgnoredTopics:v25];
    }
    else
    {
      if (a5 != 1)
      {
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        v32 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_FAULT))
        {
          int v34 = 68289282;
          int v35 = 0;
          __int16 v36 = 2082;
          v37 = "";
          __int16 v38 = 2050;
          unint64_t v39 = a5;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Not adding topic due to unknown list\", \"toList\":%{public}lu}", (uint8_t *)&v34, 0x1Cu);
        }
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C450);
        }
        v33 = qword_100010D18;
        if (os_signpost_enabled((os_log_t)qword_100010D18))
        {
          int v34 = 68289282;
          int v35 = 0;
          __int16 v36 = 2082;
          v37 = "";
          __int16 v38 = 2050;
          unint64_t v39 = a5;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Not adding topic due to unknown list", "{\"msg%{public}.0s\":\"Not adding topic due to unknown list\", \"toList\":%{public}lu}", (uint8_t *)&v34, 0x1Cu);
        }
        goto LABEL_42;
      }
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      NSErrorDomain v19 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 68289538;
        int v35 = 0;
        __int16 v36 = 2082;
        v37 = "";
        __int16 v38 = 2114;
        unint64_t v39 = (unint64_t)v7;
        __int16 v40 = 2114;
        id v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Adding topic to opportunistic list\", \"topic\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@}", (uint8_t *)&v34, 0x26u);
      }
      id v20 = objc_alloc_init((Class)NSMutableSet);
      uint64_t v21 = [v8 opportunisticTopics];
      BOOL v22 = (void *)v21;
      __int16 v23 = &__NSArray0__struct;
      if (v21) {
        __int16 v23 = (void *)v21;
      }
      id v24 = v23;

      [v20 addObjectsFromArray:v24];
      [v20 addObject:v7];
      id v25 = [v20 allObjects];
      [v8 _setOpportunisticTopics:v25];
    }

    goto LABEL_42;
  }
  if (a5 != 2)
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    id v26 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 68289794;
      int v35 = 0;
      __int16 v36 = 2082;
      v37 = "";
      __int16 v38 = 2114;
      unint64_t v39 = (unint64_t)v7;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2050;
      unint64_t v43 = a5;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Moving topic from ignored list connection\", \"topic\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@, \"toList\":%{public}lu}", (uint8_t *)&v34, 0x30u);
    }
    id v16 = v8;
    id v17 = v7;
    uint64_t v18 = 2;
    goto LABEL_33;
  }
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  id v11 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 68289282;
    int v35 = 0;
    __int16 v36 = 2082;
    v37 = "";
    __int16 v38 = 2114;
    unint64_t v39 = (unint64_t)v7;
    uint64_t v12 = "{\"msg%{public}.0s\":\"Not adding to IgnoredTopics since it's already an added topic\", \"topic\":%{public, lo"
          "cation:escape_only}@}";
    goto LABEL_13;
  }
LABEL_42:
}

- (BOOL)_setTopicEnabled:(BOOL)a3 forConnection:(id)a4 appBundleIdentifier:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [(id)objc_opt_class() topicFromBundleId:v9];
  id v11 = [(LPPushRegistrar *)self _findOrCreateApplicationWithBundleIdentifier:v9];
  uint64_t v12 = v11;
  if (v11)
  {
    if ([v11 hasLocationPushEntitlement])
    {
      if (v6) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 2;
      }
      [(LPPushRegistrar *)self _addOrMoveTopic:v10 forConnection:v8 toList:v13];
    }
    else
    {
      [(LPPushRegistrar *)self _removeTopic:v10 forConnection:v8];
    }
  }
  else
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    unsigned int v14 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138543362;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Ignoring setLocationPushesActive: request because application %{public}@ is not valid", (uint8_t *)&v16, 0xCu);
    }
  }

  return v12 != 0;
}

- (id)_apsConnectionForEnvironment:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:APSEnvironmentProduction])
  {
    uint64_t v5 = [(LPPushRegistrar *)self productionAPSConnection];
LABEL_5:
    BOOL v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:APSEnvironmentDevelopment])
  {
    uint64_t v5 = [(LPPushRegistrar *)self developmentAPSConnection];
    goto LABEL_5;
  }
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

+ (id)bundleIdFromTopic:(id)a3
{
  id v3 = a3;
  id v4 = [v3 substringWithRange:0, (char *)[v3 length] + ~(unint64_t)[@"location-query" length]];

  return v4;
}

+ (id)topicFromBundleId:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@", a3, @"location-query"];
}

- (NSXPCListener)locationPushRegistrationServer
{
  return self->_locationPushRegistrationServer;
}

- (APSConnection)productionAPSConnection
{
  return self->_productionAPSConnection;
}

- (APSConnection)developmentAPSConnection
{
  return self->_developmentAPSConnection;
}

- (OS_dispatch_queue)apsdQueue
{
  return self->_apsdQueue;
}

- (NSMutableDictionary)bundleIdentifierToApplication
{
  return self->_bundleIdentifierToApplication;
}

- (OS_dispatch_queue)dictionaryMutationQueue
{
  return self->_dictionaryMutationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryMutationQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToApplication, 0);
  objc_storeStrong((id *)&self->_apsdQueue, 0);
  objc_storeStrong((id *)&self->_developmentAPSConnection, 0);
  objc_storeStrong((id *)&self->_productionAPSConnection, 0);

  objc_storeStrong((id *)&self->_locationPushRegistrationServer, 0);
}

@end