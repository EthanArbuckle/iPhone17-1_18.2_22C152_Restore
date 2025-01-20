@interface APPostInstallActivity
- (APConfigurationRequester)configRequester;
- (APConfigurationStorage)configurationStorage;
- (APPostInstallActivity)initWithConfigurationStorage:(id)a3;
- (APXPCActivityCriteria)criteria;
- (BOOL)runActivity:(id)a3;
- (NSString)taskID;
- (id)_storefront;
- (void)_cancelConfigRequest;
- (void)deferActivity:(id)a3 completionHandler:(id)a4;
- (void)removeWaitingForNetworkDateDirectory;
- (void)setConfigRequester:(id)a3;
- (void)terminateActivity:(id)a3;
@end

@implementation APPostInstallActivity

- (APPostInstallActivity)initWithConfigurationStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APPostInstallActivity;
  v6 = [(APPostInstallActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configurationStorage, a3);
  }

  return v7;
}

- (NSString)taskID
{
  return (NSString *)@"com.apple.ap.promotedcontentd.postinstall";
}

- (BOOL)runActivity:(id)a3
{
  id v4 = a3;
  id v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Post Install Activity started.", (uint8_t *)buf, 2u);
  }

  [(APPostInstallActivity *)self removeWaitingForNetworkDateDirectory];
  v6 = [(APPostInstallActivity *)self configurationStorage];
  unsigned int v7 = [v6 resetConfigurationSystem];

  if (v7)
  {
    objc_initWeak(buf, self);
    id v8 = objc_alloc((Class)APConfigurationRequester);
    objc_super v9 = [(APPostInstallActivity *)self _storefront];
    id v10 = [v8 initWithStorefront:v9];
    [(APPostInstallActivity *)self setConfigRequester:v10];

    v11 = [(APPostInstallActivity *)self configRequester];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000098F0;
    v14[3] = &unk_10022E480;
    objc_copyWeak(&v16, buf);
    id v15 = v4;
    [v11 requestConfigurationWithCompletionHandler:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }
  else
  {
    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Reset Configuration System failed.", (uint8_t *)buf, 2u);
    }
  }
  return v7;
}

- (void)removeWaitingForNetworkDateDirectory
{
  id v2 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  [v2 removeObjectAtPath:@"w" error:0];
}

- (void)terminateActivity:(id)a3
{
  id v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Post Install Activity terminated.", v5, 2u);
  }

  [(APPostInstallActivity *)self _cancelConfigRequest];
}

- (void)deferActivity:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Post Install Activity defered.", v7, 2u);
  }

  [(APPostInstallActivity *)self _cancelConfigRequest];
  v5[2](v5, 1);
}

- (id)_storefront
{
  id v2 = +[APIDAccountProvider privateUserAccount];
  v3 = [v2 storefront];
  id v4 = [v3 componentsSeparatedByString:@"-"];

  if ([v4 count])
  {
    id v5 = [v4 firstObject];
  }
  else
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error creating storefront.", v8, 2u);
    }

    id v5 = &stru_1002392C0;
  }

  return v5;
}

- (void)_cancelConfigRequest
{
  id v4 = [(APPostInstallActivity *)self configRequester];
  if (v4) {
    [v4 cancelRequest];
  }
  v3 = [(APPostInstallActivity *)self configurationStorage];
  [v3 cancelConfigurationUpdate];
}

- (APXPCActivityCriteria)criteria
{
  return self->criteria;
}

- (APConfigurationStorage)configurationStorage
{
  return self->_configurationStorage;
}

- (APConfigurationRequester)configRequester
{
  return self->_configRequester;
}

- (void)setConfigRequester:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configRequester, 0);
  objc_storeStrong((id *)&self->_configurationStorage, 0);
  objc_storeStrong((id *)&self->criteria, 0);

  objc_storeStrong((id *)&self->taskID, 0);
}

@end