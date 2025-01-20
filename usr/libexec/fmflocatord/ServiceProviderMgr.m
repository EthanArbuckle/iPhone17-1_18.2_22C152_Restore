@interface ServiceProviderMgr
+ (id)sharedInstance;
- (NSDictionary)accountTypeToServiceProviderType;
- (NSMutableDictionary)accountUUIDToServiceProvider;
- (ServiceProviderMgr)init;
- (id)buddyCompletionObserverToken;
- (id)initSingleton;
- (id)serviceProviderForAccount:(id)a3;
- (void)accountListDidChange;
- (void)dealloc;
- (void)setAccountUUIDToServiceProvider:(id)a3;
- (void)setBuddyCompletionObserverToken:(id)a3;
- (void)start;
- (void)startGlobalManagers;
- (void)stop;
- (void)stopGlobalManagers;
@end

@implementation ServiceProviderMgr

- (void)dealloc
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100036CAC(self, v3);
  }

  v4 = (void *)qword_10006D3E8;
  qword_10006D3E8 = 0;

  v5.receiver = self;
  v5.super_class = (Class)ServiceProviderMgr;
  [(ServiceProviderMgr *)&v5 dealloc];
}

+ (id)sharedInstance
{
  if (qword_10006D3F0 != -1) {
    dispatch_once(&qword_10006D3F0, &stru_100059398);
  }
  v2 = (void *)qword_10006D3E8;
  if (!qword_10006D3E8)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The ServiceProviderMgr singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10006D3E8;
  }

  return v2;
}

- (ServiceProviderMgr)init
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100036D88(v3);
  }

  return 0;
}

- (id)initSingleton
{
  v13.receiver = self;
  v13.super_class = (Class)ServiceProviderMgr;
  v2 = [(ServiceProviderMgr *)&v13 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    v16 = v4;
    uint64_t v17 = objc_opt_class();
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    accountTypeToServiceProviderType = v2->_accountTypeToServiceProviderType;
    v2->_accountTypeToServiceProviderType = (NSDictionary *)v5;

    if (+[FMFGainsboroughServiceProvider isSimulationActive])
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v14 = v8;
      uint64_t v15 = objc_opt_class();
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      v10 = v2->_accountTypeToServiceProviderType;
      v2->_accountTypeToServiceProviderType = (NSDictionary *)v9;
    }
    v11 = +[NSMutableDictionary dictionary];
    [(ServiceProviderMgr *)v2 setAccountUUIDToServiceProvider:v11];

    objc_storeStrong((id *)&qword_10006D3E8, v2);
  }
  return v2;
}

- (void)start
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = +[AccountManager sharedInstance];
  [v4 loadExistingAccounts];

  uint64_t v5 = +[AccountManager sharedInstance];
  v6 = [v5 accounts];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007BCC;
  v11[3] = &unk_1000593C0;
  v11[4] = self;
  [v6 enumerateObjectsUsingBlock:v11];
  [(ServiceProviderMgr *)self startGlobalManagers];
  v7 = [(ServiceProviderMgr *)self accountUUIDToServiceProvider];
  [v7 enumerateKeysAndObjectsUsingBlock:&stru_100059400];

  v8 = sub_10001B6D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(ServiceProviderMgr *)self accountUUIDToServiceProvider];
    id v10 = [v9 count];
    *(_DWORD *)buf = 134217984;
    id v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Total %ld service providers at startup", buf, 0xCu);
  }
  [v3 addObserver:self selector:"accountListDidChange" name:@"AccountListDidChangeNotification" object:0];
}

- (void)stop
{
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"AccountListDidChangeNotification" object:0];
  v3 = [(ServiceProviderMgr *)self accountUUIDToServiceProvider];
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_100059420];

  v4 = [(ServiceProviderMgr *)self accountUUIDToServiceProvider];
  [v4 removeAllObjects];

  [(ServiceProviderMgr *)self stopGlobalManagers];
}

- (void)startGlobalManagers
{
  v2 = +[AppleAccountManager sharedInstance];
  [v2 syncFMFAccountInfo];

  id v3 = +[FMFFencesMgr sharedInstance];
  [v3 start];
}

- (void)stopGlobalManagers
{
  id v2 = +[FMFFencesMgr sharedInstance];
  [v2 stop];
}

- (void)accountListDidChange
{
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Account list changed. Recalculating service providers...", buf, 2u);
  }

  v4 = +[AccountManager sharedInstance];
  id v5 = [v4 accounts];

  v6 = [(ServiceProviderMgr *)self accountUUIDToServiceProvider];
  id v7 = [v6 mutableCopy];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008050;
  v13[3] = &unk_100059448;
  id v8 = v7;
  id v14 = v8;
  uint64_t v15 = self;
  [v5 enumerateObjectsUsingBlock:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008250;
  v12[3] = &unk_100059470;
  v12[4] = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v9 = sub_10001B6D4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(ServiceProviderMgr *)self accountUUIDToServiceProvider];
    id v11 = [v10 count];
    *(_DWORD *)buf = 134217984;
    id v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Total %ld service providers now", buf, 0xCu);
  }
}

- (id)serviceProviderForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceProviderMgr *)self accountUUIDToServiceProvider];
  v6 = [v4 uuid];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (NSDictionary)accountTypeToServiceProviderType
{
  return self->_accountTypeToServiceProviderType;
}

- (NSMutableDictionary)accountUUIDToServiceProvider
{
  return self->_accountUUIDToServiceProvider;
}

- (void)setAccountUUIDToServiceProvider:(id)a3
{
}

- (id)buddyCompletionObserverToken
{
  return self->_buddyCompletionObserverToken;
}

- (void)setBuddyCompletionObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buddyCompletionObserverToken, 0);
  objc_storeStrong((id *)&self->_accountUUIDToServiceProvider, 0);

  objc_storeStrong((id *)&self->_accountTypeToServiceProviderType, 0);
}

@end