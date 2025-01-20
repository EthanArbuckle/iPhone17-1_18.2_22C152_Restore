@interface IXATestAppRelayServer
+ (id)sharedServer;
- (BOOL)_checkEntitlement:(id)a3 withAuditToken:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IXATestAppRelayServer)init;
- (NSMutableDictionary)registrations;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)fetchEndpointForServiceName:(id)a3 completion:(id)a4;
- (void)registerEndpoint:(id)a3 forServiceName:(id)a4 withEntitlement:(id)a5 canReplace:(BOOL)a6 completion:(id)a7;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegistrations:(id)a3;
- (void)unregisterEndpointForServiceName:(id)a3 completion:(id)a4;
@end

@implementation IXATestAppRelayServer

+ (id)sharedServer
{
  if (qword_100026DC0 != -1) {
    dispatch_once(&qword_100026DC0, &stru_10001C7A0);
  }
  v2 = (void *)qword_100026DB8;
  return v2;
}

- (IXATestAppRelayServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)IXATestAppRelayServer;
  v2 = [(IXATestAppRelayServer *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.inputanalytics.testAppRelay", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.inputanalytics.testAppRelay"];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener _setQueue:v2->_queue];
    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    uint64_t v9 = +[NSMutableDictionary dictionary];
    registrations = v2->_registrations;
    v2->_registrations = (NSMutableDictionary *)v9;

    v11 = IXATestAppRelayLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "The service was initialized.", v13, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  registrations = self->_registrations;
  self->_registrations = 0;

  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v4.receiver = self;
  v4.super_class = (Class)IXATestAppRelayServer;
  [(IXATestAppRelayServer *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if ((TI_IS_INTERNAL_INSTALL() & 1) == 0)
  {
    [v5 invalidate];
    v6 = IXATestAppRelayLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100010B70();
    }
    goto LABEL_13;
  }
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  if (![(IXATestAppRelayServer *)self _checkEntitlement:@"com.apple.inputanalytics.testAppRelay" withAuditToken:v12])
  {
    [v5 invalidate];
    v6 = IXATestAppRelayLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100010B3C();
    }
LABEL_13:

    BOOL v10 = 0;
    goto LABEL_14;
  }
  v7 = IXATestAppRelayLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v5 processIdentifier];
    *(_DWORD *)buf = 67109120;
    unsigned int v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Accepting connection from client (pid=%d).", buf, 8u);
  }

  [v5 setExportedObject:self];
  uint64_t v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___IXATestAppRelayProtocol];
  [v5 setExportedInterface:v9];

  [v5 resume];
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (void)registerEndpoint:(id)a3 forServiceName:(id)a4 withEntitlement:(id)a5 canReplace:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, void))a7;
  if ((TI_IS_INTERNAL_INSTALL() & 1) == 0)
  {
    v21 = IXATestAppRelayLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100010B70();
    }
    goto LABEL_14;
  }
  if (!v12 || ![v13 length] || !objc_msgSend(v14, "length"))
  {
    v21 = IXATestAppRelayLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100010BA4();
    }
LABEL_14:

    v15[2](v15, 0);
    goto LABEL_15;
  }
  v16 = [(IXATestAppRelayServer *)self registrations];
  v17 = [v16 objectForKey:v13];

  if (v17 && ([v17 canReplace] & 1) == 0)
  {
    v22 = IXATestAppRelayLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100010BD8((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
    }

    v15[2](v15, 0);
  }
  else
  {
    v18 = [[IXATestAppRelayRegistration alloc] initWithEndpoint:v12 andEntitlement:v14 canReplace:v8];
    v19 = [(IXATestAppRelayServer *)self registrations];
    [v19 setObject:v18 forKey:v13];

    v20 = IXATestAppRelayLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412290;
      id v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Registered endpoint for service name '%@'.", (uint8_t *)&v29, 0xCu);
    }

    v15[2](v15, 1);
  }

LABEL_15:
}

- (void)unregisterEndpointForServiceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (TI_IS_INTERNAL_INSTALL())
  {
    BOOL v8 = [(IXATestAppRelayServer *)self registrations];
    uint64_t v9 = [v8 objectForKey:v6];

    if (v9)
    {
      BOOL v10 = [v9 entitlement];
      v11 = +[NSXPCConnection currentConnection];
      id v12 = v11;
      if (v11) {
        [v11 auditToken];
      }
      else {
        memset(v23, 0, sizeof(v23));
      }
      unsigned __int8 v21 = [(IXATestAppRelayServer *)self _checkEntitlement:v10 withAuditToken:v23];

      if (v21)
      {
        v22 = [(IXATestAppRelayServer *)self registrations];
        [v22 removeObjectForKey:v6];

        id v14 = IXATestAppRelayLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unregistered endpoint for service name '%@'.", buf, 0xCu);
        }
      }
      else
      {
        id v14 = IXATestAppRelayLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100010CB0();
        }
      }
    }
    else
    {
      id v14 = IXATestAppRelayLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100010C44((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      }
    }

    v7[2](v7);
  }
  else
  {
    id v13 = IXATestAppRelayLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100010B70();
    }

    v7[2](v7);
  }
}

- (void)fetchEndpointForServiceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (TI_IS_INTERNAL_INSTALL())
  {
    BOOL v8 = [(IXATestAppRelayServer *)self registrations];
    uint64_t v9 = [v8 objectForKey:v6];

    if (v9)
    {
      BOOL v10 = [v9 entitlement];
      v11 = +[NSXPCConnection currentConnection];
      id v12 = v11;
      if (v11) {
        [v11 auditToken];
      }
      else {
        memset(v24, 0, sizeof(v24));
      }
      unsigned __int8 v21 = [(IXATestAppRelayServer *)self _checkEntitlement:v10 withAuditToken:v24];

      v22 = IXATestAppRelayLog();
      id v14 = v22;
      if (v21)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fetched endpoint for service name '%@'.", buf, 0xCu);
        }

        uint64_t v23 = [v9 endpoint];
        v7[2](v7, v23);

        goto LABEL_18;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100010CB0();
      }
    }
    else
    {
      id v14 = IXATestAppRelayLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100010C44((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      }
    }

    v7[2](v7, 0);
LABEL_18:

    goto LABEL_19;
  }
  id v13 = IXATestAppRelayLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100010B70();
  }

  v7[2](v7, 0);
LABEL_19:
}

- (BOOL)_checkEntitlement:(id)a3 withAuditToken:(id *)a4
{
  id v5 = (__CFString *)a3;
  long long v6 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&cf.val[4] = v6;
  v7 = SecTaskCreateWithAuditToken(0, &cf);
  if (v7)
  {
    BOOL v8 = v7;
    *(void *)cf.val = 0;
    CFBooleanRef v9 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v7, v5, (CFErrorRef *)&cf);
    if (v9)
    {
      CFBooleanRef v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      BOOL v12 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue(v10) != 0;
      CFRelease(v10);
    }
    else
    {
      if (*(void *)cf.val)
      {
        id v13 = IXATestAppRelayLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100010CE4((uint64_t)&cf, v13, v14, v15, v16, v17, v18, v19);
        }

        CFRelease(*(CFTypeRef *)cf.val);
      }
      BOOL v12 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end