@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = PPSLogReaderService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100003118((uint64_t)v5, (uint64_t)v6, v7);
  }

  int v8 = [v6 processIdentifier];
  v9 = [v6 valueForEntitlement:@"com.apple.PerfPowerServices.data-read-xpc"];
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v9 BOOLValue])
  {
    v10 = PPSLogReaderService();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100003028(v8, v10);
    }

    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PerfPowerServicesReaderProtocol];
    [v6 setExportedInterface:v11];

    [v6 setInterruptionHandler:&stru_100004200];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100002C34;
    v29[3] = &unk_100004220;
    int v30 = v8;
    [v6 setInvalidationHandler:v29];
    v12 = objc_opt_new();
    [v6 setExportedObject:v12];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = [v6 exportedInterface];
    [v18 setClasses:v28 forSelector:"dataForRequest:withReply:" argumentIndex:0 ofReply:0];

    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    v24 = [v6 exportedInterface];
    BOOL v25 = 1;
    [v24 setClasses:v22 forSelector:"dataForRequest:withReply:" argumentIndex:0 ofReply:1];

    v26 = [v6 exportedInterface];
    [v26 setClasses:v23 forSelector:"dataForRequest:withReply:" argumentIndex:1 ofReply:1];

    [v6 resume];
  }
  else
  {
    [v6 invalidate];
    v12 = PPSLogReaderService();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000030A0(v8, v12);
    }
    BOOL v25 = 0;
  }

  return v25;
}

@end