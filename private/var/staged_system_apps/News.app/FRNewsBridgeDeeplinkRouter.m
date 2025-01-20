@interface FRNewsBridgeDeeplinkRouter
- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5;
- (FRNewsBridgeDeeplinkRouter)init;
- (FRNewsBridgeDeeplinkRouter)initWithApplication:(id)a3 bridgedAppDelegate:(id)a4;
- (UIApplication)application;
- (UIApplicationDelegate)bridgedAppDelegate;
@end

@implementation FRNewsBridgeDeeplinkRouter

- (FRNewsBridgeDeeplinkRouter)initWithApplication:(id)a3 bridgedAppDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100071C9C();
  }
  v11.receiver = self;
  v11.super_class = (Class)FRNewsBridgeDeeplinkRouter;
  v8 = [(FRNewsBridgeDeeplinkRouter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_application, v6);
    objc_storeWeak((id *)&v9->_bridgedAppDelegate, v7);
  }

  return v9;
}

- (FRNewsBridgeDeeplinkRouter)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v6 = "-[FRNewsBridgeDeeplinkRouter init]";
    __int16 v7 = 2080;
    v8 = "FRNewsBridgeDeeplinkRouter.m";
    __int16 v9 = 1024;
    int v10 = 25;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRNewsBridgeDeeplinkRouter init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100071D7C();
  }
  __int16 v11 = [(FRNewsBridgeDeeplinkRouter *)self bridgedAppDelegate];
  id v12 = [(FRNewsBridgeDeeplinkRouter *)self application];
  unsigned __int8 v13 = [v11 application:v12 openURL:v8 options:v9];

  return v13;
}

- (UIApplication)application
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);

  return (UIApplication *)WeakRetained;
}

- (UIApplicationDelegate)bridgedAppDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bridgedAppDelegate);

  return (UIApplicationDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bridgedAppDelegate);

  objc_destroyWeak((id *)&self->_application);
}

@end