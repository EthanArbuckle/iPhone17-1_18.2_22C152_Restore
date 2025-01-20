@interface PRXPCServicesManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PRXPCServicesManager)init;
- (void)createServices;
- (void)setupXPCListeners;
- (void)startServices;
@end

@implementation PRXPCServicesManager

- (PRXPCServicesManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PRXPCServicesManager;
  v2 = [(PRXPCServicesManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nearbyd.xpcQueue", 0);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v3;

    [(PRXPCServicesManager *)v2 createServices];
    [(PRXPCServicesManager *)v2 setupXPCListeners];
  }
  return v2;
}

- (void)createServices
{
  dispatch_queue_t v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  machServices = self->_machServices;
  self->_machServices = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  listeners = self->_listeners;
  self->_listeners = v5;

  v7 = +[PRBeaconRangingService serviceWithQueue:self->_xpcQueue];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v8 = [v7 machServicesNames];
  id v9 = [v8 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v65;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v65 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NSMutableDictionary *)self->_machServices setObject:v7 forKey:*(void *)(*((void *)&v64 + 1) + 8 * (void)v12)];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v10);
  }

  v13 = +[PRCompanionRangingService serviceWithQueue:self->_xpcQueue];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v14 = [v13 machServicesNames];
  id v15 = [v14 countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v61;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v61 != v17) {
          objc_enumerationMutation(v14);
        }
        [(NSMutableDictionary *)self->_machServices setObject:v13 forKey:*(void *)(*((void *)&v60 + 1) + 8 * (void)v18)];
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v60 objects:v72 count:16];
    }
    while (v16);
  }

  v19 = +[PRBTRangingService serviceWithQueue:self->_xpcQueue];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v20 = [v19 machServicesNames];
  id v21 = [v20 countByEnumeratingWithState:&v56 objects:v71 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v57;
    do
    {
      v24 = 0;
      do
      {
        if (*(void *)v57 != v23) {
          objc_enumerationMutation(v20);
        }
        [(NSMutableDictionary *)self->_machServices setObject:v19 forKey:*(void *)(*((void *)&v56 + 1) + 8 * (void)v24)];
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v56 objects:v71 count:16];
    }
    while (v22);
  }
  v43 = v7;

  v25 = objc_alloc_init(PRDiagnosticsService);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v26 = [(PRDiagnosticsService *)v25 machServicesNames];
  id v27 = [v26 countByEnumeratingWithState:&v52 objects:v70 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v53;
    do
    {
      v30 = 0;
      do
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(v26);
        }
        [(NSMutableDictionary *)self->_machServices setObject:v25 forKey:*(void *)(*((void *)&v52 + 1) + 8 * (void)v30)];
        v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      id v28 = [v26 countByEnumeratingWithState:&v52 objects:v70 count:16];
    }
    while (v28);
  }

  v31 = +[PRRangingService serviceWithQueue:self->_xpcQueue];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v32 = [v31 machServicesNames];
  id v33 = [v32 countByEnumeratingWithState:&v48 objects:v69 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v49;
    do
    {
      v36 = 0;
      do
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v32);
        }
        [(NSMutableDictionary *)self->_machServices setObject:v31 forKey:*(void *)(*((void *)&v48 + 1) + 8 * (void)v36)];
        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      id v34 = [v32 countByEnumeratingWithState:&v48 objects:v69 count:16];
    }
    while (v34);
  }

  v37 = +[PRNearbyInteractionService serviceWithQueue:self->_xpcQueue];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v38 = [v37 machServicesNames];
  id v39 = [v38 countByEnumeratingWithState:&v44 objects:v68 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v45;
    do
    {
      v42 = 0;
      do
      {
        if (*(void *)v45 != v41) {
          objc_enumerationMutation(v38);
        }
        [(NSMutableDictionary *)self->_machServices setObject:v37 forKey:*(void *)(*((void *)&v44 + 1) + 8 * (void)v42)];
        v42 = (char *)v42 + 1;
      }
      while (v40 != v42);
      id v40 = [v38 countByEnumeratingWithState:&v44 objects:v68 count:16];
    }
    while (v40);
  }
}

- (void)setupXPCListeners
{
  dispatch_queue_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PRXPCServicesManager] setting up XPC listeners", buf, 2u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(NSMutableDictionary *)self->_machServices allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
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
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PRXPCServicesManager] setting up XPC listener for mach service: %@", buf, 0xCu);
        }
        id v11 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v9];
        [v11 setDelegate:self];
        [(NSMutableArray *)self->_listeners addObject:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)startServices
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_listeners;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&long long v4 = 138412290;
    long long v12 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v7);
        uint64_t v9 = (void *)qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v9;
          id v11 = [v8 serviceName];
          *(_DWORD *)buf = v12;
          v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PRXPCServicesManager] resuming listener for mach service: %@", buf, 0xCu);
        }
        [v8 resume:v12];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[PRXPCServicesManager] listener shouldAcceptNewConnection. Connection: %@", (uint8_t *)&v15, 0xCu);
  }
  machServices = self->_machServices;
  id v10 = [v7 serviceName];
  id v11 = [(NSMutableDictionary *)machServices objectForKey:v10];

  if (v11)
  {
    unsigned __int8 v12 = [v11 shouldAcceptNewConnection:v7];
  }
  else
  {
    long long v13 = (void *)qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040ED54(v13, v7);
    }
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_machServices, 0);
}

@end