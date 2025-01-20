@interface MIBUXPCListener
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MIBUXPCListener)init;
- (NSXPCListener)listener;
- (void)setListener:(id)a3;
- (void)start;
- (void)terminate;
@end

@implementation MIBUXPCListener

+ (id)sharedInstance
{
  if (qword_10006C918 != -1) {
    dispatch_once(&qword_10006C918, &stru_10005B828);
  }
  v2 = (void *)qword_10006C910;

  return v2;
}

- (MIBUXPCListener)init
{
  v16.receiver = self;
  v16.super_class = (Class)MIBUXPCListener;
  v2 = [(MIBUXPCListener *)&v16 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.inboxupdaterd"];
  [(MIBUXPCListener *)v2 setListener:v3];

  v4 = [(MIBUXPCListener *)v2 listener];

  if (v4)
  {
    v5 = [(MIBUXPCListener *)v2 listener];
    [v5 setDelegate:v2];

LABEL_4:
    v6 = v2;
    goto LABEL_10;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B848);
  }
  v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_100040710(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (void)start
{
  id v2 = [(MIBUXPCListener *)self listener];
  [v2 resume];
}

- (void)terminate
{
  id v2 = [(MIBUXPCListener *)self listener];
  [v2 invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B868);
  }
  v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received a new xpc connection!", v18, 2u);
  }
  uint64_t v8 = [v6 valueForEntitlement:@"com.apple.private.mobileinboxupdater.xpc"];
  if (!v8)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B888);
    }
    uint64_t v13 = qword_10006C950;
    if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)v18 = 136315138;
    *(void *)&v18[4] = "-[MIBUXPCListener listener:shouldAcceptNewConnection:]";
    uint64_t v14 = "%s: connection does not have entitlements needed.";
    v15 = v13;
    uint32_t v16 = 12;
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, v18, v16);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B8A8);
    }
    uint64_t v17 = qword_10006C950;
    if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)v18 = 136315394;
    *(void *)&v18[4] = "-[MIBUXPCListener listener:shouldAcceptNewConnection:]";
    *(_WORD *)&v18[12] = 2112;
    *(void *)&v18[14] = v8;
    uint64_t v14 = "%s: format not correct: %@";
    v15 = v17;
    uint32_t v16 = 22;
    goto LABEL_18;
  }
  if (![v8 BOOLValue])
  {
LABEL_19:
    [v6 invalidate:*(_OWORD *)v18, *(void *)&v18[16]];
    BOOL v11 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MIBUXPCProtocol];
  [v6 setExportedInterface:v9];

  uint64_t v10 = objc_alloc_init(MIBUXPCResponder);
  [(MIBUXPCResponder *)v10 setXpcConnection:v6];
  [v6 setExportedObject:v10];
  [v6 resume];

  BOOL v11 = 1;
LABEL_9:

  return v11;
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
}

@end