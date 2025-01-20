@interface NRXPCServer
- (BOOL)hasEntitlement:(id)a3 withBitmask:(unsigned int)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NRXPCServer)initWithProxyClass:(Class)a3 xpcListenerClass:(Class)a4 serverDelegate:(id)a5 xpcTarget:(id)a6 services:(id)a7;
- (OS_dispatch_queue)managementQueue;
- (id)_currentAppsPredicates;
- (unsigned)scanForEntitlementsWithConnection:(id)a3;
- (void)_addAppToMonitorWithProxy:(id)a3;
- (void)_proxyDidDisconnect:(id)a3;
- (void)_removeAppFromMonitorWithProxy:(id)a3;
- (void)_resume;
- (void)_suspend;
- (void)_updatedFromMonitor:(id)a3 forProcess:(id)a4 withUpdate:(id)a5;
- (void)enumerateClientProxies:(id)a3;
- (void)invalidate;
- (void)resume;
- (void)shouldMonitorProxy:(id)a3 forSuspension:(BOOL)a4;
- (void)suspend;
@end

@implementation NRXPCServer

- (NRXPCServer)initWithProxyClass:(Class)a3 xpcListenerClass:(Class)a4 serverDelegate:(id)a5 xpcTarget:(id)a6 services:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v52.receiver = self;
  v52.super_class = (Class)NRXPCServer;
  v16 = [(NRXPCServer *)&v52 init];
  v17 = v16;
  if (v16)
  {
    v44 = a4;
    id v45 = v15;
    id v46 = v14;
    id v47 = v13;
    v16->_proxyClass = a3;
    objc_storeStrong((id *)&v16->_serverDelegate, a5);
    objc_storeStrong(&v17->_xpcTarget, a6);
    objc_storeStrong(&v17->_services, a7);
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.nanoregistry.nrxpcserver.managementqueue", v19);
    managementQueue = v17->_managementQueue;
    v17->_managementQueue = (OS_dispatch_queue *)v20;

    v41 = v19;
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.nanoregistry.nrxpcserver.incomingmessagequeue", v19);
    xpcIncomingMessageQueue = v17->_xpcIncomingMessageQueue;
    v17->_xpcIncomingMessageQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = [(objc_class *)a3 machServiceName];
    machServiceName = v17->_machServiceName;
    v17->_machServiceName = (NSString *)v24;

    Class v43 = a3;
    v26 = [(objc_class *)a3 entitlements];
    v27 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v26 count]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v28 = v26;
    id v29 = [v28 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = 0;
      uint64_t v32 = *(void *)v49;
      do
      {
        v33 = 0;
        do
        {
          if (*(void *)v49 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = *(void *)(*((void *)&v48 + 1) + 8 * (void)v33);
          v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v33 + v31, v41);
          [v27 setObject:v35 forKeyedSubscript:v34];

          v33 = (char *)v33 + 1;
        }
        while (v30 != v33);
        id v30 = [v28 countByEnumeratingWithState:&v48 objects:v53 count:16];
        v31 += (uint64_t)v33;
      }
      while (v30);
    }

    if ([v27 count]) {
      objc_storeStrong((id *)&v17->_entitlements, v27);
    }
    v17->_entitlementRequired = [(objc_class *)v43 requireAnEntitlement];
    uint64_t v36 = +[NSMutableArray array];
    proxies = v17->_proxies;
    v17->_proxies = (NSMutableArray *)v36;

    v38 = (NRNSXPCListenerProtocol *)[[v44 alloc] initWithMachServiceName:v17->_machServiceName];
    xpcListener = v17->_xpcListener;
    v17->_xpcListener = v38;

    [(NRNSXPCListenerProtocol *)v17->_xpcListener setDelegate:v17];
    v17->_listenerSuspended = 1;

    id v14 = v46;
    id v13 = v47;
    id v15 = v45;
  }

  return v17;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054EC;
  block[3] = &unk_100165508;
  block[4] = self;
  id v10 = v5;
  v11 = &v12;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)managementQueue, block);
  LOBYTE(managementQueue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)managementQueue;
}

- (unsigned)scanForEntitlementsWithConnection:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_entitlements;
  id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = [(NSMutableDictionary *)self->_entitlements objectForKeyedSubscript:v10];
        unsigned __int8 v12 = [v11 integerValue];
        id v13 = [v4 valueForEntitlement:v10];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 BOOLValue]) {
          v7 |= 1 << v12;
        }
      }
      id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (BOOL)hasEntitlement:(id)a3 withBitmask:(unsigned int)a4
{
  id v5 = [(NSMutableDictionary *)self->_entitlements objectForKeyedSubscript:a3];
  id v6 = v5;
  if (v5) {
    unsigned int v7 = (a4 >> (char)[v5 integerValue]) & 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)shouldMonitorProxy:(id)a3 forSuspension:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  managementQueue = self->_managementQueue;
  if (v4)
  {
    uint64_t v8 = v12;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v9 = sub_100005C90;
  }
  else
  {
    uint64_t v8 = v11;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v9 = sub_100005C9C;
  }
  v8[2] = v9;
  v8[3] = &unk_100165530;
  v8[4] = self;
  id v10 = v6;
  v8[5] = v10;
  dispatch_sync((dispatch_queue_t)managementQueue, v8);
}

- (void)_addAppToMonitorWithProxy:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pid];
  if (objc_opt_respondsToSelector()) {
    char v6 = 0;
  }
  else {
    char v6 = objc_opt_respondsToSelector() ^ 1;
  }
  processMonitor = self->_processMonitor;
  if (!processMonitor && (v6 & 1) == 0)
  {
    if (!self->_bundleIDToProxy)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      bundleIDToProxy = self->_bundleIDToProxy;
      self->_bundleIDToProxy = v8;
    }
    id v10 = +[RBSProcessStateDescriptor descriptor];
    [v10 setValues:1];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100005FEC;
    v31[3] = &unk_100165580;
    id v32 = v10;
    v33 = self;
    id v11 = v10;
    unsigned __int8 v12 = +[RBSProcessMonitor monitorWithConfiguration:v31];
    id v13 = self->_processMonitor;
    self->_processMonitor = v12;

    processMonitor = self->_processMonitor;
  }
  if (processMonitor)
  {
    uint64_t v14 = +[RBSProcessIdentifier identifierWithPid:v5];
    if (v14)
    {
      id v30 = 0;
      char v15 = +[RBSProcessHandle handleForIdentifier:v14 error:&v30];
      id v16 = v30;
      long long v17 = [v15 bundle];
      long long v18 = [v17 identifier];

      if (v18)
      {
        [(NSMutableDictionary *)self->_bundleIDToProxy setObject:v4 forKeyedSubscript:v18];
        long long v19 = nr_daemon_log();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          v21 = nr_daemon_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            machServiceName = self->_machServiceName;
            v23 = [(NSMutableDictionary *)self->_bundleIDToProxy allKeys];
            uint64_t v24 = [v23 componentsJoinedByString:@", "];
            *(_DWORD *)buf = 138412802;
            v35 = machServiceName;
            __int16 v36 = 2112;
            v37 = v18;
            __int16 v38 = 2112;
            v39 = v24;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NRXPCServer: %@ starts monitoring %@; new monitoring bundle IDs: [%@]",
              buf,
              0x20u);
          }
        }
        v25 = [(NRXPCServer *)self _currentAppsPredicates];
        v26 = v25;
        if (v25)
        {
          v27 = self->_processMonitor;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_1000060A0;
          v28[3] = &unk_1001655A8;
          id v29 = v25;
          [(RBSProcessMonitor *)v27 updateConfiguration:v28];
        }
      }
    }
  }
}

- (void)_removeAppFromMonitorWithProxy:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_managementQueue);
  bundleIDToProxy = self->_bundleIDToProxy;
  if (bundleIDToProxy && self->_processMonitor)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    char v6 = bundleIDToProxy;
    id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v12 = [(NSMutableDictionary *)self->_bundleIDToProxy objectForKeyedSubscript:v11];
          if (v12 == v4)
          {
            id v13 = nr_daemon_log();
            BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

            if (v14)
            {
              char v15 = nr_daemon_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                machServiceName = self->_machServiceName;
                *(_DWORD *)buf = 138412802;
                uint64_t v34 = machServiceName;
                __int16 v35 = 2112;
                uint64_t v36 = v11;
                __int16 v37 = 2112;
                id v38 = v4;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NRXPCServer: %@ is no longer monitoring %@ (%@)", buf, 0x20u);
              }
            }
            [(NSMutableDictionary *)self->_bundleIDToProxy removeObjectForKey:v11];
            long long v17 = [(NRXPCServer *)self _currentAppsPredicates];
            long long v18 = v17;
            if (v17)
            {
              processMonitor = self->_processMonitor;
              v27[0] = _NSConcreteStackBlock;
              v27[1] = 3221225472;
              v27[2] = sub_100006420;
              v27[3] = &unk_1001655A8;
              id v28 = v17;
              [(RBSProcessMonitor *)processMonitor updateConfiguration:v27];
            }
            goto LABEL_19;
          }
        }
        id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_19:

    BOOL v20 = self->_bundleIDToProxy;
    if (v20 && ![(NSMutableDictionary *)v20 count])
    {
      v21 = nr_daemon_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        v23 = nr_daemon_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = self->_machServiceName;
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "NRXPCServer: %@ is no longer monitoring any apps", buf, 0xCu);
        }
      }
      v25 = self->_bundleIDToProxy;
      self->_bundleIDToProxy = 0;

      [(RBSProcessMonitor *)self->_processMonitor invalidate];
      v26 = self->_processMonitor;
      self->_processMonitor = 0;
    }
  }
}

- (id)_currentAppsPredicates
{
  v2 = [(NSMutableDictionary *)self->_bundleIDToProxy allKeys];
  v3 = +[NSSet setWithArray:v2];

  if ([v3 count])
  {
    id v4 = +[RBSProcessPredicate predicateMatchingBundleIdentifiers:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updatedFromMonitor:(id)a3 forProcess:(id)a4 withUpdate:(id)a5
{
  id v7 = a5;
  id v8 = [a4 bundle];
  uint64_t v9 = [v8 identifier];

  id v10 = [v7 previousState];
  uint64_t v11 = [v7 state];

  if (([v10 isEqual:v11] & 1) == 0)
  {
    id v12 = nr_daemon_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      BOOL v14 = nr_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v24 = v9;
        __int16 v25 = 2112;
        v26 = v10;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NRXPCServer: updated from monitor for process %@ with update %@ -> %@", buf, 0x20u);
      }
    }
    if (v11) {
      unsigned int v15 = [v11 taskState];
    }
    else {
      unsigned int v15 = 0;
    }
    BOOL v17 = v15 == 2 || v15 == 4;
    managementQueue = self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006734;
    block[3] = &unk_1001655D0;
    block[4] = self;
    id v20 = v9;
    BOOL v21 = v17;
    char v22 = v15;
    dispatch_async((dispatch_queue_t)managementQueue, block);
  }
}

- (void)enumerateClientProxies:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_managementQueue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_proxies;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_proxyDidDisconnect:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_managementQueue);
  [v4 _invalidate];
  [(NSMutableArray *)self->_proxies removeObject:v4];
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      machServiceName = self->_machServiceName;
      uint64_t v9 = [v4 appPath];
      int v11 = 138413058;
      long long v12 = machServiceName;
      __int16 v13 = 2114;
      BOOL v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = (int)[v4 pid];
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NRXPCServer: %@ connection from %{public}@.%ld disconnected (%@)", (uint8_t *)&v11, 0x2Au);
    }
  }
  [(NRXPCServer *)self _removeAppFromMonitorWithProxy:v4];
  long long v10 = self->_serverDelegate;
  if (objc_opt_respondsToSelector()) {
    [(NRXPCServerDelegate *)v10 xpcServer:self proxyDidDisconnect:v4];
  }
}

- (void)resume
{
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006C44;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)managementQueue, block);
}

- (void)suspend
{
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006CC0;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)managementQueue, block);
}

- (void)_resume
{
  if (self->_listenerSuspended && !self->_listenerInvalidated)
  {
    self->_listenerSuspended = 0;
    [(NRNSXPCListenerProtocol *)self->_xpcListener resume];
  }
}

- (void)_suspend
{
  if (!self->_listenerSuspended && !self->_listenerInvalidated)
  {
    self->_listenerSuspended = 1;
    [(NRNSXPCListenerProtocol *)self->_xpcListener suspend];
  }
}

- (void)invalidate
{
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006D80;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)managementQueue, block);
}

- (OS_dispatch_queue)managementQueue
{
  return self->_managementQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_xpcIncomingMessageQueue, 0);
  objc_storeStrong(&self->_services, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong(&self->_xpcTarget, 0);
  objc_storeStrong((id *)&self->_serverDelegate, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_bundleIDToProxy, 0);
  objc_storeStrong((id *)&self->_proxies, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end