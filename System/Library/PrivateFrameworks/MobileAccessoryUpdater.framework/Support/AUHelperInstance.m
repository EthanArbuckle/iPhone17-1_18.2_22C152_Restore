@interface AUHelperInstance
+ (AUHelperInstance)sharedInstance;
+ (id)xpcConnectionToHelper;
- (AUHelperInstance)init;
- (AUHelperServiceProtocol)remoteObject;
@end

@implementation AUHelperInstance

- (AUHelperInstance)init
{
  v4.receiver = self;
  v4.super_class = (Class)AUHelperInstance;
  v2 = [(AUHelperInstance *)&v4 init];
  if (v2) {
    v2->_xpcConnection = (NSXPCConnection *)+[AUHelperInstance xpcConnectionToHelper];
  }
  return v2;
}

+ (AUHelperInstance)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000519C;
  block[3] = &unk_10007CF58;
  block[4] = a1;
  if (qword_100096328 != -1) {
    dispatch_once(&qword_100096328, block);
  }
  return (AUHelperInstance *)qword_100096320;
}

- (AUHelperServiceProtocol)remoteObject
{
  result = (AUHelperServiceProtocol *)self->_xpcConnection;
  if (result) {
    return (AUHelperServiceProtocol *)[(AUHelperServiceProtocol *)result synchronousRemoteObjectProxyWithErrorHandler:&stru_10007CF78];
  }
  return result;
}

+ (id)xpcConnectionToHelper
{
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.accessoryupdater.launchauhelper" options:4096];
  if (v2)
  {
    objc_msgSend(v2, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___AUHelperServiceProtocol));
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
    objc_msgSend(objc_msgSend(v2, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v9, "userPreferenceSetObject:forSuite:withKey:", 0, 0);
    objc_msgSend(objc_msgSend(v2, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v9, "userPreferenceObjectForSuite:withKey:withReply:", 0, 1);
    [v2 resume];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004F234();
  }
  return v2;
}

@end