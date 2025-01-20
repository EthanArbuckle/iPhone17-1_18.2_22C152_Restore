@interface FROpenInNewsManager
- (FCCoreConfigurationManager)configurationManager;
- (FCNetworkReachabilityType)networkReachability;
- (FROpenInNewsManager)init;
- (FROpenInNewsManager)initWithConfigurationManager:(id)a3 networkReachability:(id)a4;
- (void)openArticleWithURL:(id)a3 completion:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setNetworkReachability:(id)a3;
@end

@implementation FROpenInNewsManager

- (FROpenInNewsManager)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FROpenInNewsManager init]";
    __int16 v7 = 2080;
    v8 = "FROpenInNewsManager.m";
    __int16 v9 = 1024;
    int v10 = 35;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FROpenInNewsManager init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FROpenInNewsManager)initWithConfigurationManager:(id)a3 networkReachability:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FROpenInNewsManager;
  __int16 v9 = [(FROpenInNewsManager *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationManager, a3);
    objc_storeStrong((id *)&v10->_networkReachability, a4);
  }

  return v10;
}

- (void)openArticleWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)FCWebURLResolutionEndpointConnection);
  __int16 v9 = [(FROpenInNewsManager *)self configurationManager];
  int v10 = FCURLForContainerizedUserAccountCachesDirectory();
  __int16 v11 = [(FROpenInNewsManager *)self networkReachability];
  id v12 = [v8 initWithConfigurationManager:v9 cachesDirectoryURL:v10 networkReachability:v11];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000042C8;
  v15[3] = &unk_100008418;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v12 resolveWebURL:v14 withQualityOfService:25 completion:v15];
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (void)setNetworkReachability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);

  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end