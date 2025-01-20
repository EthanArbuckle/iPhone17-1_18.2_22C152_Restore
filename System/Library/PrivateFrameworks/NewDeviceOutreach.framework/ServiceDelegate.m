@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_bundleForPID:(int)a3;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = sub_1000014A0(@"com.apple.private.ndoagent", v5);
  if (v6)
  {
    v7 = -[ServiceDelegate _bundleForPID:](self, "_bundleForPID:", [v5 processIdentifier]);
    v8 = [v7 bundleIdentifier];

    v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      unsigned int v20 = [v5 processIdentifier];
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "connection added from %d with calling process: %@", buf, 0x12u);
    }

    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NDOAgentProtocol];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    [v10 setClasses:v13 forSelector:"getDeviceListForLocalDevices:sessionID:params:withReply:" argumentIndex:0 ofReply:0];

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    [v10 setClasses:v16 forSelector:"getDeviceListForLocalDevices:sessionID:params:withReply:" argumentIndex:0 ofReply:1];

    [v5 setExportedInterface:v10];
    v17 = [[NDOAgent alloc] initWithCallingProcessBundleID:v8];
    [v5 setExportedObject:v17];
    [v5 resume];
  }
  else
  {
    v8 = _NDOLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100011508(v8);
    }
  }

  return v6;
}

- (id)_bundleForPID:(int)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", buffer, proc_pidpath(a3, buffer, 0x1000u), 4);
  v4 = +[NSURL fileURLWithPath:v3];

  if (v4)
  {
    id v5 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    BOOL v6 = +[NSBundle bundleWithURL:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end