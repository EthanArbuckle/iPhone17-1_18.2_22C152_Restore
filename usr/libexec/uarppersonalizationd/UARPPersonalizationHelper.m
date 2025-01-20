@interface UARPPersonalizationHelper
- (NSMutableArray)tssRequests;
- (NSURL)serverURL;
- (UARPPersonalizationHelper)initWithMachServiceName:(id)a3 updaterName:(id)a4;
- (void)completedTssResponse:(id)a3;
- (void)dealloc;
- (void)queryOutstandingTssRequests;
- (void)start;
@end

@implementation UARPPersonalizationHelper

- (UARPPersonalizationHelper)initWithMachServiceName:(id)a3 updaterName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UARPPersonalizationHelper;
  v8 = [(UARPPersonalizationHelper *)&v18 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    serviceName = v8->_serviceName;
    v8->_serviceName = v9;

    v11 = (NSString *)[v7 copy];
    updaterName = v8->_updaterName;
    v8->_updaterName = v11;

    os_log_t v13 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
    log = v8->_log;
    v8->_log = (OS_os_log *)v13;

    uint64_t v15 = objc_opt_new();
    pendingRequests = v8->_pendingRequests;
    v8->_pendingRequests = (NSMutableArray *)v15;
  }
  return v8;
}

- (void)start
{
  v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:self->_serviceName options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UARPPersonalizationProtocol];
  xpcInterface = self->_xpcInterface;
  self->_xpcInterface = v5;

  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  id v7 = +[NSArray arrayWithObjects:v15 count:5];
  v8 = +[NSSet setWithArray:v7];

  [(NSXPCInterface *)self->_xpcInterface setClasses:v8 forSelector:"getOutstandingPersonalizationRequests:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)self->_xpcInterface setClasses:v8 forSelector:"personalizationResponse:updaterName:" argumentIndex:0 ofReply:0];
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:self->_xpcInterface];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004B50;
  v14[3] = &unk_100008288;
  v14[4] = self;
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004BB4;
  v13[3] = &unk_100008288;
  v13[4] = self;
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v13];
  [(NSXPCConnection *)self->_xpcConnection resume];
  v9 = self->_xpcConnection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004C18;
  v12[3] = &unk_1000082B0;
  v12[4] = self;
  v10 = [(NSXPCConnection *)v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id proxy = self->_proxy;
  self->_id proxy = v10;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UARPPersonalizationHelper;
  [(UARPPersonalizationHelper *)&v3 dealloc];
}

- (void)queryOutstandingTssRequests
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_100004E88;
  v12 = sub_100004E98;
  id v13 = 0;
  id proxy = self->_proxy;
  updaterName = self->_updaterName;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004EA0;
  v7[3] = &unk_1000082D8;
  v7[4] = self;
  v7[5] = &v8;
  [proxy getOutstandingPersonalizationRequests:updaterName reply:v7];
  [(NSMutableArray *)self->_pendingRequests addObjectsFromArray:v9[5]];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    pendingRequests = self->_pendingRequests;
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = pendingRequests;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Pending Tatsu Requests are %@", buf, 0xCu);
  }
  _Block_object_dispose(&v8, 8);
}

- (NSMutableArray)tssRequests
{
  id v2 = [(NSMutableArray *)self->_pendingRequests copy];

  return (NSMutableArray *)v2;
}

- (void)completedTssResponse:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[UARPPersonalizationHelper completedTssResponse:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%s: Tatsu Response is %@", (uint8_t *)&v6, 0x16u);
  }
  [self->_proxy personalizationResponse:v4 updaterName:self->_updaterName];
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_proxy, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_updaterName, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end