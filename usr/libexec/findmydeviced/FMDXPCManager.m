@interface FMDXPCManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FMDXPCManager)init;
- (FMNanoIDSManager)protectedIDSManager;
- (NSXPCListener)fmdUserAgentXPCListener;
- (NSXPCListener)fmdXPCListener;
- (id)initSingleton;
- (void)dealloc;
- (void)initializeXPC;
- (void)setFmdUserAgentXPCListener:(id)a3;
- (void)setFmdXPCListener:(id)a3;
- (void)setProtectedIDSManager:(id)a3;
@end

@implementation FMDXPCManager

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received new XPC connection %@", (uint8_t *)&v14, 0xCu);
  }

  id v9 = [(FMDXPCManager *)self fmdXPCListener];

  if (v9 == v7)
  {
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FMDFMIPProtocol];
    [v6 setExportedInterface:v10];

    v11 = objc_opt_new();
    v12 = [(FMDXPCManager *)self protectedIDSManager];
    [v11 setProtectedIDSManager:v12];

    [v6 setExportedObject:v11];
  }
  [v6 resume];

  return 1;
}

- (FMNanoIDSManager)protectedIDSManager
{
  return self->_protectedIDSManager;
}

- (NSXPCListener)fmdXPCListener
{
  return self->_fmdXPCListener;
}

+ (id)sharedInstance
{
  if (qword_10031E800 != -1) {
    dispatch_once(&qword_10031E800, &stru_1002DA538);
  }
  v2 = (void *)qword_10031E7F8;
  if (!qword_10031E7F8)
  {
    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The FMDXPCManager singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10031E7F8;
  }

  return v2;
}

- (FMDXPCManager)init
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10023CFDC(v3);
  }

  return 0;
}

- (id)initSingleton
{
  v5.receiver = self;
  v5.super_class = (Class)FMDXPCManager;
  v2 = [(FMDXPCManager *)&v5 init];
  if (v2)
  {
    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10023D020(v3);
    }

    objc_storeStrong((id *)&qword_10031E7F8, v2);
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10023AFC4(self, v3);
  }

  v4 = (void *)qword_10031E7F8;
  qword_10031E7F8 = 0;

  v5.receiver = self;
  v5.super_class = (Class)FMDXPCManager;
  [(FMDXPCManager *)&v5 dealloc];
}

- (void)initializeXPC
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing XPC...", v11, 2u);
  }

  v4 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v5 = [objc_alloc((Class)FMNanoIDSManager) initWithServiceId:@"com.apple.private.alloy.findmydeviced.aoverc" minimumVersion:3];
  [v5 start];
  [(FMDXPCManager *)self setProtectedIDSManager:v5];
  id v6 = objc_alloc((Class)NSXPCListener);
  id v7 = [v4 serviceName];
  id v8 = [v6 initWithMachServiceName:v7];
  [(FMDXPCManager *)self setFmdXPCListener:v8];

  id v9 = [(FMDXPCManager *)self fmdXPCListener];
  [v9 setDelegate:self];

  v10 = [(FMDXPCManager *)self fmdXPCListener];
  [v10 resume];
}

- (void)setFmdXPCListener:(id)a3
{
}

- (NSXPCListener)fmdUserAgentXPCListener
{
  return self->_fmdUserAgentXPCListener;
}

- (void)setFmdUserAgentXPCListener:(id)a3
{
}

- (void)setProtectedIDSManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedIDSManager, 0);
  objc_storeStrong((id *)&self->_fmdUserAgentXPCListener, 0);

  objc_storeStrong((id *)&self->_fmdXPCListener, 0);
}

@end