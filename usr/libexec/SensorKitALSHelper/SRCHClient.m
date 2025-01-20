@interface SRCHClient
+ (id)_connectionToService;
+ (id)remoteInterface;
+ (void)initialize;
- (SRCHClient)initWithQueue:(id)a3 XPCConnection:(id)a4;
- (void)_fetchCustomCategoriesWithRetryAttempt:(unint64_t)a3 bundleIdentifiers:(id)a4 completion:(id)a5;
- (void)_setupConnection;
- (void)dealloc;
- (void)downloadDatabaseAssetIfNeeded:(id)a3;
- (void)fetchCustomCategoriesForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchVersion:(id)a3;
@end

@implementation SRCHClient

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10002A9C8 = (uint64_t)os_log_create("com.apple.SensorKit", "CHClient");
  }
}

+ (id)_connectionToService
{
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.SensorKit.CHSupportService"];

  return v2;
}

+ (id)remoteInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRCHSupportServiceProtocol];
}

- (void)_setupConnection
{
  v3 = qword_10002A9C8;
  if (os_log_type_enabled((os_log_t)qword_10002A9C8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Setting up connection to CH service", (uint8_t *)buf, 2u);
  }
  connection = self->_connection;
  [(NSXPCConnection *)connection _setQueue:self->_q];
  -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", [(id)objc_opt_class() remoteInterface]);
  [(NSXPCConnection *)connection setInterruptionHandler:&stru_100024818];
  objc_initWeak(buf, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003BE0;
  v5[3] = &unk_100024840;
  objc_copyWeak(&v6, buf);
  [(NSXPCConnection *)connection setInvalidationHandler:v5];
  self->_connectionDidInvalidate = 0;
  [(NSXPCConnection *)connection resume];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (SRCHClient)initWithQueue:(id)a3 XPCConnection:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SRCHClient;
  id v6 = [(SRCHClient *)&v8 init];
  if (v6)
  {
    v6->_q = (OS_dispatch_queue *)a3;
    v6->_connection = (NSXPCConnection *)a4;
    [(SRCHClient *)v6 _setupConnection];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRCHClient;
  [(SRCHClient *)&v3 dealloc];
}

- (void)_fetchCustomCategoriesWithRetryAttempt:(unint64_t)a3 bundleIdentifiers:(id)a4 completion:(id)a5
{
  v9 = (void *)sub_100003C5C((uint64_t)self);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003E74;
  v10[3] = &unk_100024868;
  v11[1] = (id)a3;
  objc_copyWeak(v11, &location);
  v10[4] = a4;
  v10[5] = a5;
  [objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v10) fetchCustomCategoriesForBundleIdentifiers:a4 completion:a5];
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)fetchCustomCategoriesForBundleIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)fetchVersion:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004070;
  v3[3] = &unk_100024890;
  v3[4] = a3;
  [objc_msgSend((id)sub_100003C5C((uint64_t)self), "remoteObjectProxyWithErrorHandler:", v3) fetchVersion:a3];
}

- (void)downloadDatabaseAssetIfNeeded:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000041D4;
  v3[3] = &unk_100024890;
  v3[4] = a3;
  [objc_msgSend((id)sub_100003C5C((uint64_t)self), "remoteObjectProxyWithErrorHandler:", v3) downloadDatabaseAssetIfNeeded:a3];
}

@end