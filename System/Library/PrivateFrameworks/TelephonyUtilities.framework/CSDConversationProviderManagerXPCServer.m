@interface CSDConversationProviderManagerXPCServer
- (CSDClientManager)clientManager;
- (CSDConversationProviderManager)providerManager;
- (CSDConversationProviderManagerXPCServer)initWithConversationProviderManager:(id)a3;
- (OS_dispatch_queue)queue;
- (TUConversationManager)conversationManager;
- (TUFeatureFlags)featureFlags;
- (int)clientsShouldConnectToken;
- (void)conversationProviderForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6;
- (void)invalidate;
- (void)notifyClientsToConnectIfNecessary;
- (void)registerClient:(id)a3;
- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4;
- (void)registerForCallbacksForProvider:(id)a3 completionHandler:(id)a4;
- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6;
- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)setClientsShouldConnectToken:(int)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation CSDConversationProviderManagerXPCServer

- (CSDConversationProviderManagerXPCServer)initWithConversationProviderManager:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSDConversationProviderManagerXPCServer;
  v6 = [(CSDConversationProviderManagerXPCServer *)&v19 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.conversationprovidermanagerxpcserver", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_providerManager, a3);
    v9 = [[CSDClientManager alloc] initWithSerialQueue:v6->_queue];
    clientManager = v6->_clientManager;
    v6->_clientManager = v9;

    v11 = v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000771AC;
    block[3] = &unk_100504EC0;
    v12 = v6;
    v18 = v12;
    dispatch_sync(v11, block);
    v13 = [(CSDConversationProviderManagerXPCServer *)v12 queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100077718;
    v15[3] = &unk_100504EC0;
    v16 = v12;
    dispatch_async(v13, v15);
  }
  return v6;
}

- (void)dealloc
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "deallocing ProviderManagerXPCServer", buf, 2u);
  }

  notify_cancel(self->_clientsShouldConnectToken);
  v4.receiver = self;
  v4.super_class = (Class)CSDConversationProviderManagerXPCServer;
  [(CSDConversationProviderManagerXPCServer *)&v4 dealloc];
}

- (void)invalidate
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidating ProviderManagerXPCServer", buf, 2u);
  }

  objc_super v4 = [(CSDConversationProviderManagerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000778F0;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)notifyClientsToConnectIfNecessary
{
  v3 = [(CSDConversationProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NOTIFYING CLIENTS TO CONNECT", v5, 2u);
  }

  notify_set_state(self->_clientsShouldConnectToken, 1uLL);
  notify_post("CSDConversationProviderManagerClientsShouldConnectNotification");
}

- (TUFeatureFlags)featureFlags
{
  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    objc_super v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    id v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }

  return featureFlags;
}

- (TUConversationManager)conversationManager
{
  conversationManager = self->_conversationManager;
  if (!conversationManager)
  {
    objc_super v4 = (TUConversationManager *)objc_alloc_init((Class)TUConversationManager);
    id v5 = self->_conversationManager;
    self->_conversationManager = v4;

    conversationManager = self->_conversationManager;
  }

  return conversationManager;
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationProviderManagerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077B28;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationProviderManagerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077C30;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)conversationProviderForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationProviderManagerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077D5C;
  block[3] = &unk_100505EA0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [(CSDConversationProviderManagerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077F68;
  block[3] = &unk_100505EC8;
  id v18 = v11;
  objc_super v19 = self;
  double v22 = a4;
  id v20 = v10;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v13, block);
}

- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CSDConversationProviderManagerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078170;
  block[3] = &unk_100505EF0;
  id v20 = v10;
  id v21 = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDConversationProviderManagerXPCServer *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007833C;
  v15[3] = &unk_100505F18;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDConversationProviderManagerXPCServer *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100078504;
  v15[3] = &unk_100505F18;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)registerForCallbacksForProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(CSDConversationProviderManagerXPCServer *)self clientManager];
  id v9 = [v8 currentClient];

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "registerForCallbacksForProvider received over XPC with providerIdentifier: %@ client: %@", (uint8_t *)&v12, 0x16u);
  }

  id v11 = +[CSDConversationProviderManager sharedInstance];
  [v11 startTrackingClient:v9 forProviderIdentifier:v6];

  if (v7) {
    v7[2](v7, 0);
  }
}

- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationProviderManagerXPCServer *)self clientManager];
  id v9 = [v8 currentClient];

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "registerConversationProvider received over XPC with provider: %@", buf, 0xCu);
  }

  id v11 = [(CSDConversationProviderManagerXPCServer *)self providerManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100078894;
  v15[3] = &unk_100505F40;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v12 = v7;
  id v13 = v9;
  id v14 = v6;
  [v11 registerConversationProvider:v14 completionHandler:v15];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDConversationProviderManager)providerManager
{
  return self->_providerManager;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void)setClientsShouldConnectToken:(int)a3
{
  self->_clientsShouldConnectToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientManager, 0);
  objc_storeStrong((id *)&self->_providerManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);

  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end