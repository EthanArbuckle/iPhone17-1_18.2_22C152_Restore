@interface TYATypologyAccessServer
+ (id)sharedServer;
- (BOOL)_checkEntitlementForAddEntryStringWithAuditToken:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (TYATypologyAccessServer)init;
- (void)dealloc;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TYATypologyAccessServer

+ (id)sharedServer
{
  if (qword_100026E58 != -1) {
    dispatch_once(&qword_100026E58, &stru_10001CAD8);
  }
  v2 = (void *)qword_100026E50;
  return v2;
}

- (TYATypologyAccessServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)TYATypologyAccessServer;
  v2 = [(TYATypologyAccessServer *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TextInput.typologyAccess", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.TextInput.typologyAccess"];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener _setQueue:v2->_queue];
    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TYATypologyAccessServer;
  [(TYATypologyAccessServer *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  BOOL v9 = [(TYATypologyAccessServer *)self _checkEntitlementForAddEntryStringWithAuditToken:v17];
  if (v9)
  {
    objc_super v10 = TYALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = [v8 processIdentifier];
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Server is accepting new connection to client (pid=%d).", buf, 8u);
    }

    v12 = [TYATypologyAccessSession alloc];
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v16, 0, sizeof(v16));
    }
    v13 = [(TYATypologyAccessSession *)v12 initWithAuditToken:v16];
    [v8 setExportedObject:v13];
    v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TYATypologyAccessProtocol_WithTestSupport];
    [v8 setExportedInterface:v14];

    [v8 resume];
  }
  else
  {
    [v8 invalidate];
    v13 = TYALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100011280(v13);
    }
  }

  return v9;
}

- (BOOL)_checkEntitlementForAddEntryStringWithAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &cf);
  if (!v4) {
    return 0;
  }
  dispatch_queue_t v5 = v4;
  *(void *)cf.val = 0;
  CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, @"com.apple.TextInput.typologyAccess", (CFErrorRef *)&cf);
  if (v6)
  {
    CFBooleanRef v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }
  else
  {
    if (*(void *)cf.val)
    {
      objc_super v10 = TYALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000112C4((uint64_t *)&cf, v10);
      }

      CFRelease(*(CFTypeRef *)cf.val);
    }
    BOOL v9 = 0;
  }
  CFRelease(v5);
  return v9;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end