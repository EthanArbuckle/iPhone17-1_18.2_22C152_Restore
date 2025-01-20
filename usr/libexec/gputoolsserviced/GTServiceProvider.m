@interface GTServiceProvider
- (BOOL)waitForService:(id)a3 error:(id *)a4;
- (GTServiceProvider)init;
- (id)allServices;
- (unint64_t)registerObserver:(id)a3;
- (void)_registerService:(id)a3 forProcess:(id)a4 forPort:(unint64_t)a5;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)deregisterService:(unint64_t)a3;
- (void)disconnectServicePorts:(id)a3;
- (void)notifyServiceListChanged:(id)a3;
- (void)registerDefaultServiceProvider:(id)a3 forProcess:(id)a4;
- (void)registerService:(id)a3 forProcess:(id)a4;
- (void)waitForService:(id)a3 completionHandler:(id)a4;
@end

@implementation GTServiceProvider

- (GTServiceProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)GTServiceProvider;
  v2 = [(GTServiceProvider *)&v12 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.gputools.transport", "ServiceProvider");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    services = v2->_services;
    v2->_services = v5;

    v2->_nextServiceID = 1;
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    waiting = v2->_waiting;
    v2->_waiting = v7;

    uint64_t v9 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (GTObservableService *)v9;
  }
  return v2;
}

- (void)_registerService:(id)a3 forProcess:(id)a4 forPort:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 deviceUDID];

  if (!v10)
  {
    v11 = +[GTDeviceProperties uniqueDeviceID];
    [v8 setDeviceUDID:v11];
  }
  [v8 setServicePort:a5];
  objc_super v12 = [[GTProcessService alloc] initWithService:v8 processInfo:v9];
  services = self->_services;
  v14 = +[NSNumber numberWithUnsignedInteger:a5];
  [(NSMutableDictionary *)services setObject:v12 forKeyedSubscript:v14];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v16 = log;
    id v17 = [v8 protocolName];
    id v18 = [v17 UTF8String];
    v19 = [v8 deviceUDID];
    *(_DWORD *)buf = 136315650;
    id v37 = v18;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    __int16 v40 = 2112;
    v41 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Service Registered name:%s port:%lu udid:%@", buf, 0x20u);
  }
  v20 = [(NSMutableDictionary *)self->_services allValues];
  [(GTServiceProvider *)self notifyServiceListChanged:v20];

  waiting = self->_waiting;
  v22 = [v8 protocolName];
  v23 = [(NSMutableDictionary *)waiting objectForKeyedSubscript:v22];

  if (v23)
  {
    v24 = self->_waiting;
    v25 = [v8 protocolName];
    [(NSMutableDictionary *)v24 removeObjectForKey:v25];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v23;
    id v27 = [v26 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v26);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v31 + 1) + 8 * i));
        }
        id v28 = [v26 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v28);
    }
  }
}

- (void)registerDefaultServiceProvider:(id)a3 forProcess:(id)a4
{
}

- (void)registerService:(id)a3 forProcess:(id)a4
{
}

- (id)allServices
{
  return [(NSMutableDictionary *)self->_services allValues];
}

- (void)waitForService:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    v24 = (void (**)(void, void))v7;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = self->_services;
    id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * (void)v13)];
          v15 = [v14 serviceProperties];
          v16 = [v15 protocolName];
          unsigned int v17 = [v16 isEqualToString:v6];

          if (v17)
          {
            id v8 = v24;
            v24[2](v24, 0);
            goto LABEL_15;
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v18 = [(NSMutableDictionary *)self->_waiting objectForKeyedSubscript:v6];

    if (!v18)
    {
      id v19 = objc_alloc_init((Class)NSMutableArray);
      [(NSMutableDictionary *)self->_waiting setObject:v19 forKeyedSubscript:v6];
    }
    id v9 = [(NSMutableDictionary *)self->_waiting objectForKeyedSubscript:v6];
    id v8 = v24;
    id v20 = [v24 copy];
    id v21 = objc_retainBlock(v20);
    [(NSMutableDictionary *)v9 addObject:v21];
  }
  else
  {
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    v22 = +[NSString stringWithFormat:@"Invalid protocol name"];
    long long v31 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v9 = +[NSError errorWithDomain:@"com.apple.gputools.serviceprovider" code:0 userInfo:v23];

    ((void (**)(void, NSMutableDictionary *))v8)[2](v8, v9);
  }
LABEL_15:
}

- (BOOL)waitForService:(id)a3 error:(id *)a4
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100014FE0;
  unsigned int v17 = sub_100014FF0;
  id v18 = 0;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014FF8;
  v10[3] = &unk_100034A70;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v12 = &v13;
  id v7 = v11;
  [(GTServiceProvider *)self waitForService:v6 completionHandler:v10];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v8 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)deregisterService:(unint64_t)a3
{
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v6 = v4;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(GTServiceProvider *)self disconnectServicePorts:v5];
}

- (void)deregisterObserver:(unint64_t)a3
{
}

- (unint64_t)registerObserver:(id)a3
{
  return [(GTObservableService *)self->_observers registerObserver:a3];
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
}

- (void)disconnectServicePorts:(id)a3
{
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 136315394;
    long long v20 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        dispatch_semaphore_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v10, v20);
        uint64_t v12 = [v11 serviceProperties];
        id v13 = [v12 protocolName];
        v14 = (const char *)[v13 UTF8String];

        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          if (v14) {
            v16 = v14;
          }
          else {
            v16 = "";
          }
          unsigned int v17 = log;
          id v18 = [v10 unsignedLongValue];
          *(_DWORD *)buf = v20;
          long long v26 = v16;
          __int16 v27 = 2048;
          id v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Service Unregistered name:%s port:%lu", buf, 0x16u);
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->_services removeObjectsForKeys:v4];
  id v19 = [(NSMutableDictionary *)self->_services allValues];
  [(GTServiceProvider *)self notifyServiceListChanged:v19];
}

- (void)notifyServiceListChanged:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015394;
  v7[3] = &unk_100034C48;
  id v8 = v4;
  id v6 = v4;
  [(GTObservableService *)observers notifyAll:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_waiting, 0);
  objc_storeStrong((id *)&self->_services, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end