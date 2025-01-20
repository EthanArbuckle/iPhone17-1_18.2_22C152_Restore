@interface ResourceManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)processMonitors;
- (NSMutableDictionary)resourceHints;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)mainQueue;
- (OS_os_transaction)transaction;
- (ResourceManager)init;
- (void)createResourceHint:(id)a3 withReply:(id)a4;
- (void)evaluatePowerModes;
- (void)handleProcessExit:(id)a3;
- (void)monitorProcessExit:(int)a3;
- (void)removeResourceHint:(id)a3;
- (void)removeState:(id)a3;
- (void)restoreResourceHints:(id)a3;
- (void)restoreState;
- (void)saveState:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setProcessMonitors:(id)a3;
- (void)setResourceHints:(id)a3;
- (void)setTransaction:(id)a3;
- (void)start;
- (void)updateResourceHint:(id)a3 withReply:(id)a4;
@end

@implementation ResourceManager

- (void)evaluatePowerModes
{
  id v2 = +[PowerModesManager sharedInstance];
  [v2 evaluatePowerModes];
}

- (void)updateResourceHint:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSXPCConnection currentConnection];
  v9 = [(ResourceManager *)self mainQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000244C;
  v13[3] = &unk_100014570;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v9, v13);
}

- (void)setTransaction:(id)a3
{
}

- (void)saveState:(id)a3
{
  id v4 = a3;
  v5 = [(ResourceManager *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [v4 uuid];
  v8 = [v7 UUIDString];
  [v6 setObject:v8 forKeyedSubscript:@"uuid"];

  v9 = [v4 pid];
  [v6 setObject:v9 forKeyedSubscript:@"pid"];

  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 state]);
  [v6 setObject:v10 forKeyedSubscript:@"state"];

  id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 resourceType]);
  [v6 setObject:v11 forKeyedSubscript:@"type"];

  id v12 = [(ResourceManager *)self defaults];
  v13 = [v12 objectForKey:@"resources"];

  id v14 = [v13 mutableCopy];
  if (!v14) {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v15 = [v4 description];
  [v14 setObject:v6 forKeyedSubscript:v15];

  id v16 = qword_10001BE48;
  if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_DEBUG)) {
    sub_10000CD3C((uint64_t)v14, v16);
  }
  v17 = [(ResourceManager *)self defaults];
  [v17 setValue:v14 forKey:@"resources"];
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)resourceHints
{
  return self->_resourceHints;
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)restoreResourceHints:(id)a3
{
  id v4 = a3;
  v5 = [(ResourceManager *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006D80;
  v7[3] = &unk_100014520;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createResourceHint:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = +[NSXPCConnection currentConnection];
  v9 = (void *)os_transaction_create();
  [(ResourceManager *)self setTransaction:v9];

  id v10 = +[NSUUID UUID];
  [v6 setUuid:v10];
  v7[2](v7, v10);

  id v11 = [(ResourceManager *)self mainQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007128;
  v15[3] = &unk_100014548;
  id v16 = v8;
  id v17 = v6;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v6;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)removeResourceHint:(id)a3
{
  id v4 = a3;
  v5 = qword_10001BE48;
  if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_DEBUG)) {
    sub_10000CCC4((uint64_t)v4, v5);
  }
  id v6 = [(ResourceManager *)self resourceHints];
  [v6 removeObjectForKey:v4];

  [(ResourceManager *)self evaluatePowerModes];
  [(ResourceManager *)self removeState:v4];
}

- (void)monitorProcessExit:(int)a3
{
  id v5 = [objc_alloc((Class)NSNumber) initWithInt:*(void *)&a3];
  id v6 = [(ResourceManager *)self processMonitors];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    id v8 = [(ResourceManager *)self mainQueue];
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a3, 0x80000000uLL, v8);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000074D8;
    v11[3] = &unk_100014598;
    v11[4] = self;
    int v12 = a3;
    dispatch_source_set_event_handler(v9, v11);
    id v10 = [(ResourceManager *)self processMonitors];
    [v10 setObject:v9 forKeyedSubscript:v5];

    dispatch_resume(v9);
  }
}

- (void)handleProcessExit:(id)a3
{
  id v4 = a3;
  id v5 = qword_10001BE48;
  if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "process %@ exiting. Releasing resouce hints for this process", buf, 0xCu);
  }
  id v6 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = [(ResourceManager *)self resourceHints];
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v11);
        id v13 = [(ResourceManager *)self resourceHints];
        id v14 = [v13 objectForKeyedSubscript:v12];

        id v15 = [v14 pid];

        if (v15 == v4) {
          [v6 addObject:v12];
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = *(void *)v27;
    *(void *)&long long v18 = 138412290;
    long long v25 = v18;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v21);
        v23 = qword_10001BE48;
        if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v25;
          id v37 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Removing resource hint %@", buf, 0xCu);
        }
        -[ResourceManager removeResourceHint:](self, "removeResourceHint:", v22, v25, (void)v26);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  v24 = [(ResourceManager *)self processMonitors];
  [v24 removeObjectForKey:v4];

  [(ResourceManager *)self evaluatePowerModes];
}

- (void)removeState:(id)a3
{
  id v4 = a3;
  id v5 = [(ResourceManager *)self defaults];
  id v8 = [v5 objectForKey:@"resources"];

  id v6 = [v8 mutableCopy];
  [v6 removeObjectForKey:v4];

  id v7 = [(ResourceManager *)self defaults];
  [v7 setValue:v6 forKey:@"resources"];
}

- (void)restoreState
{
  id v2 = qword_10001BE48;
  if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "restoring state on init", buf, 2u);
  }
  v3 = [(ResourceManager *)self defaults];
  id v4 = [v3 objectForKey:@"resources"];

  id v5 = qword_10001BE48;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restoring %@", buf, 0xCu);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [v4 allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v23;
      *(void *)&long long v8 = 138412290;
      long long v19 = v8;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v13 = qword_10001BE48;
          if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            long long v28 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "restoring resource with uuid %@", buf, 0xCu);
          }
          id v14 = [v4 objectForKey:v12, v19];
          id v15 = [[ResourceHintWithProperties alloc] initWithProperties:v14];
          if (v15)
          {
            id v16 = [(ResourceManager *)self resourceHints];
            id v17 = [(ResourceHintWithProperties *)v15 description];
            [v16 setObject:v15 forKeyedSubscript:v17];
          }
        }
        id v9 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "no resources to restore", buf, 2u);
  }
  long long v18 = [(ResourceManager *)self mainQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007BEC;
  block[3] = &unk_1000145C0;
  block[4] = self;
  dispatch_async(v18, block);
}

- (ResourceManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)ResourceManager;
  id v2 = [(ResourceManager *)&v19 initWithMachServiceName:@"com.apple.powerexperienced.resourceusage"];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resourceHints = v2->_resourceHints;
    v2->_resourceHints = v3;

    uint64_t v5 = sub_100003E44();
    mainQueue = v2->_mainQueue;
    v2->_mainQueue = (OS_dispatch_queue *)v5;

    os_log_t v7 = os_log_create("com.apple.powerexperienced", "resourcemanager");
    long long v8 = (void *)qword_10001BE48;
    qword_10001BE48 = (uint64_t)v7;

    id v9 = qword_10001BE48;
    if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Listening for resource usage connections", buf, 2u);
    }
    uint64_t v10 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.powerexperienced.resourcemanager"];
    defaults = v2->_defaults;
    v2->_defaults = v10;

    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    processMonitors = v2->_processMonitors;
    v2->_processMonitors = v12;

    [(ResourceManager *)v2 setDelegate:v2];
    if (MKBDeviceUnlockedSinceBoot()) {
      [(ResourceManager *)v2 restoreState];
    }
    id v14 = (void *)qword_10001BE48;
    if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
    {
      id v15 = v14;
      id v16 = [(ResourceManager *)v2 mainQueue];
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Initialized ResourceManager with queue %@", buf, 0xCu);
    }
  }
  else
  {
    id v17 = qword_10001BE48;
    if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_ERROR)) {
      sub_10000CDB4(v17);
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10001BE58 != -1) {
    dispatch_once(&qword_10001BE58, &stru_1000145E0);
  }
  id v2 = (void *)qword_10001BE50;

  return v2;
}

- (void)start
{
  v3 = qword_10001BE48;
  if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "starting service", v4, 2u);
  }
  [(ResourceManager *)self activate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____ResourceManagerProtocol];
  [v5 setExportedInterface:v6];

  os_log_t v7 = (void *)qword_10001BE48;
  if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
  {
    long long v8 = v7;
    v10[0] = 67109120;
    v10[1] = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "ResourceManager: listener: accepted new connection from pid %d", (uint8_t *)v10, 8u);
  }
  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)setResourceHints:(id)a3
{
}

- (void)setMainQueue:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)processMonitors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProcessMonitors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitors, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);

  objc_storeStrong((id *)&self->_resourceHints, 0);
}

@end