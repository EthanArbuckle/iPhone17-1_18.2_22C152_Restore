@interface NDURLResolutionService
- (FCContentContext)contentContext;
- (FCWebURLResolutionEndpointConnection)endpointConnection;
- (NDURLResolutionService)init;
- (NDURLResolutionService)initWithContentContext:(id)a3;
- (void)_determineWhetherResolutionIsAllowedWithCompletion:(id)a3;
- (void)fetchWebURLBloomFilterInfoWithCompletion:(id)a3;
- (void)resolveNewsURL:(id)a3 withCompletion:(id)a4;
- (void)resolveWebURL:(id)a3 withCompletion:(id)a4;
@end

@implementation NDURLResolutionService

- (NDURLResolutionService)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDURLResolutionService init]";
    __int16 v7 = 2080;
    v8 = "NDURLResolutionService.m";
    __int16 v9 = 1024;
    int v10 = 27;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDURLResolutionService init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (NDURLResolutionService)initWithContentContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NDURLResolutionService;
  v6 = [(NDURLResolutionService *)&v16 init];
  __int16 v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentContext, a3);
    v8 = [v5 contentDirectory];
    __int16 v9 = +[NSURL fileURLWithPath:v8];

    id v10 = objc_alloc((Class)FCWebURLResolutionEndpointConnection);
    __int16 v11 = [v5 configurationManager];
    id v12 = +[FCNetworkReachability sharedNetworkReachability];
    v13 = (FCWebURLResolutionEndpointConnection *)[v10 initWithConfigurationManager:v11 cachesDirectoryURL:v9 networkReachability:v12];
    endpointConnection = v7->_endpointConnection;
    v7->_endpointConnection = v13;
  }
  return v7;
}

- (void)resolveNewsURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000EBC8;
  v9[3] = &unk_100061C68;
  __int16 v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(NDURLResolutionService *)self _determineWhetherResolutionIsAllowedWithCompletion:v9];
}

- (void)resolveWebURL:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EF88;
  v8[3] = &unk_100061C68;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(NDURLResolutionService *)self _determineWhetherResolutionIsAllowedWithCompletion:v8];
}

- (void)fetchWebURLBloomFilterInfoWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F25C;
  v4[3] = &unk_100061CB8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NDURLResolutionService *)v5 _determineWhetherResolutionIsAllowedWithCompletion:v4];
}

- (void)_determineWhetherResolutionIsAllowedWithCompletion:(id)a3
{
  id v3 = a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004847C();
  }
  id v4 = [objc_alloc((Class)FCNewsAvailabilityMonitor) initWithProcessVariant:1];
  if ([v4 isNewsAvailable])
  {
    id v5 = +[FCNetworkReachability sharedNetworkReachability];
    unsigned __int8 v6 = [v5 isCloudKitReachable];

    if (v6)
    {
      +[FCAppleAccount sharedAccount];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000F5A8;
      v8[3] = &unk_100061A20;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = v3;
      id v7 = v9;
      [v7 loadStoreFrontWithCompletionHandler:v8];
    }
    else
    {
      __int16 v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      v13 = sub_10000F594;
      v14 = &unk_1000616D0;
      v15 = (void (**)(id, void))v3;
      v15[2](v15, 0);
      id v7 = v15;
    }
  }
  else
  {
    objc_super v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_10000F580;
    v19 = &unk_1000616D0;
    v20 = (void (**)(id, void))v3;
    v20[2](v20, 0);
    id v7 = v20;
  }
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (FCWebURLResolutionEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointConnection, 0);

  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end