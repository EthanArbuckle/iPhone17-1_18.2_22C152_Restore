@interface NDURLResolutionListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NDURLResolutionListenerDelegate)init;
- (NDURLResolutionListenerDelegate)initWithURLResolutionService:(id)a3;
- (NDURLResolutionService)URLResolutionService;
@end

@implementation NDURLResolutionListenerDelegate

- (NDURLResolutionListenerDelegate)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDURLResolutionListenerDelegate init]";
    __int16 v7 = 2080;
    v8 = "NDURLResolutionListenerDelegate.m";
    __int16 v9 = 1024;
    int v10 = 26;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDURLResolutionListenerDelegate init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (NDURLResolutionListenerDelegate)initWithURLResolutionService:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100048568();
  }
  v9.receiver = self;
  v9.super_class = (Class)NDURLResolutionListenerDelegate;
  v6 = [(NDURLResolutionListenerDelegate *)&v9 init];
  __int16 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URLResolutionService, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.news-url-resolution"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v6 BOOLValue])
  {
    __int16 v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NDURLResolutionService];
    v8 = +[NSSet setWithObject:objc_opt_class()];
    [v7 setClasses:v8 forSelector:"resolveNewsURL:withCompletion:" argumentIndex:0 ofReply:0];

    objc_super v9 = +[NSSet setWithObject:objc_opt_class()];
    [v7 setClasses:v9 forSelector:"resolveWebURL:withCompletion:" argumentIndex:0 ofReply:0];

    [v5 setExportedInterface:v7];
    int v10 = [(NDURLResolutionListenerDelegate *)self URLResolutionService];
    [v5 setExportedObject:v10];

    [v5 resume];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NDURLResolutionService)URLResolutionService
{
  return self->_URLResolutionService;
}

- (void).cxx_destruct
{
}

@end