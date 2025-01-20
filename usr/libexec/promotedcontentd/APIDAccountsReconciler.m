@interface APIDAccountsReconciler
+ (void)forceReconcile:(id)a3;
@end

@implementation APIDAccountsReconciler

+ (void)forceReconcile:(id)a3
{
  id v3 = a3;
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Going to forceReconcile.", buf, 2u);
  }

  id v5 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.ap.adprivacyd.idmanager" options:4096];
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___APIDAccountsReconciler_XPC];
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  v7 = [v5 remoteObjectProxy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100084C48;
  v10[3] = &unk_100234BA0;
  id v11 = v5;
  id v12 = v3;
  id v8 = v5;
  id v9 = v3;
  [v7 forceReconcile:v10];
}

@end