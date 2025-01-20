@interface CSDCallProviderManagerXPCServer
- (CSDCallProviderManager)providerManager;
- (CSDCallProviderManagerXPCServer)initWithProviderManager:(id)a3;
- (CSDClientManager)clientManager;
- (OS_dispatch_queue)queue;
- (id)localProvidersByIdentifierForClient:(id)a3;
- (id)pairedHostDeviceProvidersByIdentifierForClient:(id)a3;
- (id)providersByIdentifierForClient:(id)a3;
- (void)defaultAppProvider:(id)a3;
- (void)donateUserIntentForProviderWithIdentifier:(id)a3;
- (void)invalidate;
- (void)launchAppForDialRequest:(id)a3 reply:(id)a4;
- (void)providersByIdentifier:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)registerClient:(id)a3;
- (void)sortedProviders:(id)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation CSDCallProviderManagerXPCServer

- (id)providersByIdentifierForClient:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDCallProviderManagerXPCServer *)self providerManager];
  id v7 = [v4 isRemote];

  v8 = [v6 providersByIdentifierForRemoteClients:v7];

  return v8;
}

- (id)localProvidersByIdentifierForClient:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDCallProviderManagerXPCServer *)self providerManager];
  id v7 = [v4 isRemote];

  v8 = [v6 localProvidersByIdentifierForRemoteClients:v7];

  return v8;
}

- (id)pairedHostDeviceProvidersByIdentifierForClient:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDCallProviderManagerXPCServer *)self providerManager];
  id v7 = [v4 isRemote];

  v8 = [v6 pairedHostDeviceProvidersByIdentifierForRemoteClients:v7];

  return v8;
}

- (void)providersByIdentifier:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void *))a3;
  v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDCallProviderManagerXPCServer *)self clientManager];
  id v10 = [v6 currentClient];

  id v7 = [(CSDCallProviderManagerXPCServer *)self providersByIdentifierForClient:v10];
  v8 = [(CSDCallProviderManagerXPCServer *)self localProvidersByIdentifierForClient:v10];
  v9 = [(CSDCallProviderManagerXPCServer *)self pairedHostDeviceProvidersByIdentifierForClient:v10];
  v4[2](v4, v7, v8, v9);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallProviderManager)providerManager
{
  return self->_providerManager;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (CSDCallProviderManagerXPCServer)initWithProviderManager:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSDCallProviderManagerXPCServer;
  v6 = [(CSDCallProviderManagerXPCServer *)&v19 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callprovidermanagerxpcserver", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_providerManager, a3);
    [(CSDCallProviderManager *)v6->_providerManager addDelegate:v6 queue:v6->_queue];
    v9 = [[CSDClientManager alloc] initWithSerialQueue:v6->_queue];
    clientManager = v6->_clientManager;
    v6->_clientManager = v9;

    v11 = v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007AA14;
    block[3] = &unk_100504EC0;
    v12 = v6;
    v18 = v12;
    dispatch_sync(v11, block);
    v13 = [(CSDCallProviderManagerXPCServer *)v12 queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10007ACF8;
    v15[3] = &unk_100504EC0;
    v16 = v12;
    dispatch_async(v13, v15);
  }
  return v6;
}

- (void)invalidate
{
  v3 = [(CSDCallProviderManagerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007ADCC;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callProviderIdentifier: %@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_queue_t v7 = [(CSDCallProviderManagerXPCServer *)self providerManager];
  [v7 donateUserIntentForProviderWithIdentifier:v4];
}

- (void)launchAppForDialRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "dialRequest: %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(CSDCallProviderManagerXPCServer *)self providerManager];
  [v10 launchAppForDialRequest:v6 completion:v7];
}

- (void)sortedProviders:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching sortedProviders", v11, 2u);
  }

  id v7 = [(CSDCallProviderManagerXPCServer *)self providerManager];
  int v8 = [(CSDCallProviderManagerXPCServer *)self clientManager];
  id v9 = [v8 currentClient];
  id v10 = [v7 sortedProvidersForRemoteClients:v9 != 0];
  v4[2](v4, v10);
}

- (void)defaultAppProvider:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching default app provider", v11, 2u);
  }

  id v7 = [(CSDCallProviderManagerXPCServer *)self providerManager];
  int v8 = [(CSDCallProviderManagerXPCServer *)self clientManager];
  id v9 = [v8 currentClient];
  id v10 = [v7 defaultAppProviderForRemoteClients:v9 != 0];
  v4[2](v4, v10);
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007B2C0;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallProviderManagerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007B3C8;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = [(CSDCallProviderManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDCallProviderManagerXPCServer *)self clientManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007B4DC;
  v7[3] = &unk_100506018;
  v7[4] = self;
  id v6 = NSStringFromSelector("updateProvidersByIdentifier:localProvidersByIdentifier:pairedHostDeviceProvidersByIdentifier:");
  [v5 performBlockOnClients:v7 coalescedByIdentifier:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_clientManager, 0);
}

@end