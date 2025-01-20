@interface FRUnrecognizedURLRouter
- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5;
- (FCVanityURLRedirectService)redirectService;
- (FRURLAnalyticsReferralFactory)analyticsReferralFactory;
- (FRURLRouterManagerType)retryHandler;
- (FRUnrecognizedURLRouter)init;
- (FRUnrecognizedURLRouter)initWithAnalyticsReferralFactory:(id)a3 redirectService:(id)a4;
- (void)setRetryHandler:(id)a3;
@end

@implementation FRUnrecognizedURLRouter

- (FRUnrecognizedURLRouter)initWithAnalyticsReferralFactory:(id)a3 redirectService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10006F810();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006F730();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRUnrecognizedURLRouter;
  v9 = [(FRUnrecognizedURLRouter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_analyticsReferralFactory, a3);
    objc_storeStrong((id *)&v10->_redirectService, a4);
  }

  return v10;
}

- (void)setRetryHandler:(id)a3
{
}

- (FRUnrecognizedURLRouter)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRUnrecognizedURLRouter init]";
    __int16 v7 = 2080;
    id v8 = "FRUnrecognizedURLRouter.m";
    __int16 v9 = 1024;
    int v10 = 28;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRUnrecognizedURLRouter init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  __int16 v9 = [(FRUnrecognizedURLRouter *)self redirectService];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001BEC4;
  v12[3] = &unk_1000C57C0;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  [v9 resolveURL:v8 withQualityOfService:25 completion:v12];

  return 1;
}

- (FRURLRouterManagerType)retryHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_retryHandler);

  return (FRURLRouterManagerType *)WeakRetained;
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
  objc_storeStrong((id *)&self->_redirectService, 0);
  objc_storeStrong((id *)&self->_analyticsReferralFactory, 0);

  objc_destroyWeak((id *)&self->_retryHandler);
}

@end