@interface AUHelperInstance
+ (AUHelperInstance)sharedInstance;
+ (id)xpcConnectionToHelper;
- (AUHelperInstance)init;
- (AUHelperServiceProtocol)remoteObject;
@end

@implementation AUHelperInstance

- (AUHelperInstance)init
{
  v6.receiver = self;
  v6.super_class = (Class)AUHelperInstance;
  v2 = [(AUHelperInstance *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AUHelperInstance xpcConnectionToHelper];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;
  }
  return v2;
}

+ (AUHelperInstance)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F85C;
  block[3] = &unk_100031748;
  block[4] = a1;
  if (qword_100041EB8 != -1) {
    dispatch_once(&qword_100041EB8, block);
  }
  v2 = (void *)qword_100041EB0;
  return (AUHelperInstance *)v2;
}

- (AUHelperServiceProtocol)remoteObject
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpcConnection = [xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&stru_100031788];
  }
  return (AUHelperServiceProtocol *)xpcConnection;
}

+ (id)xpcConnectionToHelper
{
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.accessoryupdater.launchauhelper" options:4096];
  if (v2)
  {
    uint64_t v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AUHelperServiceProtocol];
    [v2 setRemoteObjectInterface:v3];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
    v11 = [v2 remoteObjectInterface];
    [v11 setClasses:v10 forSelector:"userPreferenceSetObject:forSuite:withKey:" argumentIndex:0 ofReply:0];

    v12 = [v2 remoteObjectInterface];
    [v12 setClasses:v10 forSelector:"userPreferenceObjectForSuite:withKey:withReply:" argumentIndex:0 ofReply:1];

    [v2 resume];
    id v13 = v2;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001B818();
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end