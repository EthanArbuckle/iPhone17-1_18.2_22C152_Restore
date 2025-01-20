@interface TIAutofillServer
+ (id)sharedAutofillServer;
- (BOOL)checkEntitlementForAddEntryStringWithAuditToken:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (TIAutofillServer)init;
- (void)dealloc;
@end

@implementation TIAutofillServer

+ (id)sharedAutofillServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008D00;
  block[3] = &unk_10001C7E8;
  block[4] = a1;
  if (qword_100026E18 != -1) {
    dispatch_once(&qword_100026E18, block);
  }
  v2 = (void *)qword_100026E10;
  return v2;
}

- (TIAutofillServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)TIAutofillServer;
  v2 = [(TIAutofillServer *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TextInput.autofill-server", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc((Class)NSXPCListener);
    v7 = (NSXPCListener *)[v6 initWithMachServiceName:TIAutofillServiceName];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener _setQueue:v2->_dispatchQueue];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TIAutofillServer;
  [(TIAutofillServer *)&v3 dealloc];
}

- (BOOL)checkEntitlementForAddEntryStringWithAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  dispatch_queue_t v4 = SecTaskCreateWithAuditToken(0, &cf);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  *(void *)cf.val = 0;
  CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, @"com.apple.TextInput.autofill-action", (CFErrorRef *)&cf);
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
      if (TICanLogMessageAtLevel())
      {
        objc_super v10 = TIOSLogFacility();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_100010E64(&cf, v10);
        }
      }
      CFRelease(*(CFTypeRef *)cf.val);
    }
    BOOL v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFTypeID v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  BOOL v9 = [(TIAutofillServer *)self checkEntitlementForAddEntryStringWithAuditToken:v14];
  if (v9)
  {
    objc_super v10 = objc_alloc_init(TIAutofillDataHandler);
    [v8 setExportedObject:v10];
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TIAutofillReportCandidateSelectiontHandler];
    [v8 setExportedInterface:v11];

    v12 = [(TIAutofillServer *)self dispatchQueue];
    [v8 _setQueue:v12];

    [v8 resume];
  }
  else
  {
    [v8 invalidate];
  }

  return v9;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end