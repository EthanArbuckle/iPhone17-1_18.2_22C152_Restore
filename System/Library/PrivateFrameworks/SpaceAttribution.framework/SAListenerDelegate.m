@interface SAListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation SAListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.spaceattribution.private"];
  v6 = v5;
  if (v5 && [v5 BOOLValue])
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SpaceAttribProtocol];
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SAReplyProtocol];
    [v7 setInterface:v8 forSelector:"addAppSizerHandler:reply:" argumentIndex:0 ofReply:0];
    [v7 setInterface:v8 forSelector:"addURLSizerHandler:withURLs:reply:" argumentIndex:0 ofReply:0];
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    [v7 setClasses:v10 forSelector:"registerPaths:reply:" argumentIndex:0 ofReply:0];
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
    [v7 setClasses:v12 forSelector:"unregisterPaths:reply:" argumentIndex:0 ofReply:0];
    uint64_t v13 = objc_opt_class();
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
    [v7 setClasses:v14 forSelector:"addURLSizerHandler:withURLs:reply:" argumentIndex:1 ofReply:0];
    [v4 setExportedInterface:v7];
    v15 = objc_opt_new();
    [v4 setExportedObject:v15];

    [v4 resume];
    v16 = SALog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000329D8();
    }

    BOOL v17 = 1;
  }
  else
  {
    v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000329A4();
    }
    BOOL v17 = 0;
  }

  return v17;
}

@end