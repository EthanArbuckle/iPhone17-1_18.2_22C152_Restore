@interface XPCManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)nsxpcListener;
- (XPCManager)init;
- (id)initSingleton;
- (void)dealloc;
- (void)initializeXPC;
- (void)setNsxpcListener:(id)a3;
@end

@implementation XPCManager

+ (id)sharedInstance
{
  if (qword_10006D630 != -1) {
    dispatch_once(&qword_10006D630, &stru_10005A5B0);
  }
  v2 = (void *)qword_10006D628;
  if (!qword_10006D628)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The XPCManager singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10006D628;
  }

  return v2;
}

- (XPCManager)init
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100038D10(v3);
  }

  return 0;
}

- (id)initSingleton
{
  v5.receiver = self;
  v5.super_class = (Class)XPCManager;
  v2 = [(XPCManager *)&v5 init];
  if (v2)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100038D54(v3);
    }

    objc_storeStrong((id *)&qword_10006D628, v2);
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100036CAC(self, v3);
  }

  v4 = (void *)qword_10006D628;
  qword_10006D628 = 0;

  v5.receiver = self;
  v5.super_class = (Class)XPCManager;
  [(XPCManager *)&v5 dealloc];
}

- (void)initializeXPC
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing XPC...", v8, 2u);
  }

  id v4 = objc_alloc((Class)NSXPCListener);
  id v5 = [v4 initWithMachServiceName:off_10006CDD8];
  [(XPCManager *)self setNsxpcListener:v5];

  v6 = [(XPCManager *)self nsxpcListener];
  [v6 setDelegate:self];

  v7 = [(XPCManager *)self nsxpcListener];
  [v7 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received new XPC connection %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = &OBJC_PROTOCOL___XPCServerProtocol;
  v7 = objc_opt_new();
  v8 = +[NSXPCInterface interfaceWithProtocol:v6];
  [v4 setExportedInterface:v8];

  [v4 setExportedObject:v7];
  [v4 resume];

  return 1;
}

- (NSXPCListener)nsxpcListener
{
  return self->_nsxpcListener;
}

- (void)setNsxpcListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end