@interface GKRerankNetworkRequester
- (GKClientProxy)clientProxy;
- (GKFriendSuggesterSettings)settings;
- (GKNetworkRequestManager)networkManager;
- (GKRerankNetworkRequester)initWithClientProxy:(id)a3 networkManager:(id)a4 transactionGroupProvider:(id)a5;
- (id)transactionGroupProvider;
- (void)requestSortedContactAssociationIDs:(id)a3 handler:(id)a4;
- (void)setClientProxy:(id)a3;
- (void)setNetworkManager:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTransactionGroupProvider:(id)a3;
@end

@implementation GKRerankNetworkRequester

- (GKRerankNetworkRequester)initWithClientProxy:(id)a3 networkManager:(id)a4 transactionGroupProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GKRerankNetworkRequester;
  v12 = [(GKRerankNetworkRequester *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_networkManager, a4);
    objc_storeStrong((id *)&v13->_clientProxy, a3);
    id v14 = objc_retainBlock(v11);
    id transactionGroupProvider = v13->_transactionGroupProvider;
    v13->_id transactionGroupProvider = v14;
  }
  return v13;
}

- (void)requestSortedContactAssociationIDs:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_10015B010((uint64_t)v6, v9);
  }
  CFStringRef v20 = @"contact-association-ids";
  id v21 = v6;
  id v10 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  objc_initWeak(&location, self);
  id v11 = [(GKRerankNetworkRequester *)self networkManager];
  v12 = [(GKRerankNetworkRequester *)self clientProxy];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10015A238;
  v15[3] = &unk_1002DC818;
  objc_copyWeak(&v18, &location);
  id v13 = v7;
  id v17 = v13;
  id v14 = v6;
  id v16 = v14;
  [v11 issueRequest:v10 bagKey:@"gk-get-suggested-friends" clientProxy:v12 handler:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (GKNetworkRequestManager)networkManager
{
  return self->_networkManager;
}

- (void)setNetworkManager:(id)a3
{
}

- (GKClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (id)transactionGroupProvider
{
  return self->_transactionGroupProvider;
}

- (void)setTransactionGroupProvider:(id)a3
{
}

- (GKFriendSuggesterSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong(&self->_transactionGroupProvider, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);

  objc_storeStrong((id *)&self->_networkManager, 0);
}

@end