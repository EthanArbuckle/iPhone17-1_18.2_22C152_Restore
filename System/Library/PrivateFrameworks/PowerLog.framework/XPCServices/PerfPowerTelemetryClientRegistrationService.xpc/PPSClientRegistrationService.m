@interface PPSClientRegistrationService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)checkPermissionForSubsystem:(id)a3 category:(id)a4 withReply:(id)a5;
@end

@implementation PPSClientRegistrationService

- (void)checkPermissionForSubsystem:(id)a3 category:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, BOOL))a5;
  BOOL v10 = +[PPSClientPermissions checkWritePermissionForSubsystem:v7 category:v8];
  if (qword_1000087A0 != -1) {
    dispatch_once(&qword_1000087A0, &stru_100004168);
  }
  v11 = qword_100008798;
  if (os_log_type_enabled((os_log_t)qword_100008798, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 1024;
    BOOL v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Subsystem/Category: %@/%@ Permission: %d", (uint8_t *)&v12, 0x1Cu);
  }
  v9[2](v9, v10);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PPSClientRegistrationProtocol];
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  [v4 setExportedObject:v6];
  [v4 resume];

  return 1;
}

@end