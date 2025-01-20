@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.private.userfsd.UVFSService"];
  v6 = v5;
  if (v5 && [v5 BOOLValue])
  {
    v7 = objc_opt_new();
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UVFSServiceProtocol];
    [v4 setExportedInterface:v8];

    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UVFSServiceCallbackProtocol];
    [v4 setRemoteObjectInterface:v9];

    [v4 setExportedObject:v7];
    [(id)UVFSServiceConnections addObject:v4];
    [v4 resume];
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v10) {
      sub_1000218F8(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    BOOL v18 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000218B0();
    }
    [v4 invalidate];
    BOOL v18 = 0;
  }

  return v18;
}

@end