@interface FRVanityURLRouterManager
- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5;
- (FCVanityURLRedirectService)redirectService;
- (FRURLAnalyticsReferralFactory)analyticsReferralFactory;
- (FRURLRouterManagerType)routerManager;
- (FRVanityURLRouterManager)init;
- (FRVanityURLRouterManager)initWithAnalyticsReferralFactory:(id)a3 redirectService:(id)a4 routerManager:(id)a5;
- (void)addRoutable:(id)a3;
@end

@implementation FRVanityURLRouterManager

- (FRVanityURLRouterManager)initWithAnalyticsReferralFactory:(id)a3 redirectService:(id)a4 routerManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100076438();
    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100076374();
  }
LABEL_6:
  if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000762B0();
  }
  v15.receiver = self;
  v15.super_class = (Class)FRVanityURLRouterManager;
  v12 = [(FRVanityURLRouterManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_analyticsReferralFactory, a3);
    objc_storeStrong((id *)&v13->_redirectService, a4);
    objc_storeStrong((id *)&v13->_routerManager, a5);
  }

  return v13;
}

- (void)addRoutable:(id)a3
{
  id v4 = a3;
  id v5 = [(FRVanityURLRouterManager *)self routerManager];
  [v5 addRoutable:v4];
}

- (FRURLRouterManagerType)routerManager
{
  return self->_routerManager;
}

- (FRVanityURLRouterManager)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRVanityURLRouterManager init]";
    __int16 v7 = 2080;
    v8 = "FRVanityURLRouterManager.m";
    __int16 v9 = 1024;
    int v10 = 25;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRVanityURLRouterManager init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(FRVanityURLRouterManager *)self redirectService];
  id v12 = [v11 destinationURLForURL:v8];

  v13 = FRNavigationLog;
  if (os_log_type_enabled((os_log_t)FRNavigationLog, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543618;
    v22 = v12;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "VanityURL manager has destination URL <%{public}@> for URL <%{public}@>", (uint8_t *)&v21, 0x16u);
  }
  if (v12)
  {
    id v14 = v12;
    objc_super v15 = [(FRVanityURLRouterManager *)self analyticsReferralFactory];
    v16 = [v9 objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
    id v17 = [v15 analyticsReferralForURL:v14 sourceApplication:v16];
  }
  else
  {
    id v14 = v8;
    id v17 = v10;
  }
  v18 = [(FRVanityURLRouterManager *)self routerManager];
  unsigned __int8 v19 = [v18 handleOpenURL:v14 options:v9 analyticsReferral:v17];

  return v19;
}

- (FRURLAnalyticsReferralFactory)analyticsReferralFactory
{
  return self->_analyticsReferralFactory;
}

- (FCVanityURLRedirectService)redirectService
{
  return self->_redirectService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routerManager, 0);
  objc_storeStrong((id *)&self->_redirectService, 0);

  objc_storeStrong((id *)&self->_analyticsReferralFactory, 0);
}

@end