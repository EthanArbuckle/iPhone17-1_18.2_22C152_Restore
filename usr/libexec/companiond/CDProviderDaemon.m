@interface CDProviderDaemon
- (CDProviderDaemon)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activated;
- (void)_foundDeviceWithIdentifier:(id)a3 discoveryType:(int64_t)a4;
- (void)_invalidated;
- (void)_startDeviceDiscovery;
- (void)_startIDSService;
- (void)_startServiceListener;
- (void)activate;
- (void)invalidate;
- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4;
- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6;
- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4;
- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDProviderDaemon

- (CDProviderDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)CDProviderDaemon;
  v2 = [(CDProviderDaemon *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000207D8;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020860;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(CDProviderDaemon *)self _startServiceListener];
  [(CDProviderDaemon *)self _startDeviceDiscovery];

  [(CDProviderDaemon *)self _startIDSService];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    [(CDServiceListener *)self->_serviceListener invalidate];
    serviceListener = self->_serviceListener;
    self->_serviceListener = 0;

    [(CDProviderSession *)self->_currentSession invalidate];
    currentSession = self->_currentSession;
    self->_currentSession = 0;

    currentSessionConnection = self->_currentSessionConnection;
    self->_currentSessionConnection = 0;

    [(CDDeviceDiscovery *)self->_deviceDiscovery invalidate];
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

    [(CDIDSService *)self->_idsService invalidate];
    idsService = self->_idsService;
    self->_idsService = 0;

    self->_invalidateDone = 1;
  }
}

- (void)_startServiceListener
{
  v3 = objc_alloc_init(CDServiceListener);
  serviceListener = self->_serviceListener;
  self->_serviceListener = v3;

  [(CDServiceListener *)self->_serviceListener setDispatchQueue:self->_dispatchQueue];
  [(CDServiceListener *)self->_serviceListener setDelegate:self];
  objc_super v5 = self->_serviceListener;

  [(CDServiceListener *)v5 activate];
}

- (void)_foundDeviceWithIdentifier:(id)a3 discoveryType:(int64_t)a4
{
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"?";
    if (a4 == 2) {
      v7 = @"LegacyAppSignIn";
    }
    if (a4 == 1) {
      v7 = @"CompanionAuthentication";
    }
    v8 = v7;
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FoundDevice, device=%@, type=%@", buf, 0x16u);
  }
  if (!self->_currentSession)
  {
    v9 = [[CDProviderSession alloc] initWithDeviceIdentifier:v6 discoveryType:a4];
    currentSession = self->_currentSession;
    self->_currentSession = v9;

    [(CDProviderSession *)self->_currentSession setDispatchQueue:self->_dispatchQueue];
    v11 = self->_currentSession;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100020B38;
    v12[3] = &unk_1000347D8;
    v12[4] = self;
    [(CDProviderSession *)v11 setInvalidationHandler:v12];
    [(CDProviderSession *)self->_currentSession activate];
  }
}

- (void)_startDeviceDiscovery
{
  v3 = objc_alloc_init(CDDeviceDiscovery);
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = v3;

  [(CDDeviceDiscovery *)self->_deviceDiscovery setDispatchQueue:self->_dispatchQueue];
  objc_super v5 = self->_deviceDiscovery;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020BF0;
  v6[3] = &unk_100034E18;
  v6[4] = self;
  [(CDDeviceDiscovery *)v5 setDeviceFoundHandler:v6];
  [(CDDeviceDiscovery *)self->_deviceDiscovery activate];
}

- (void)_startIDSService
{
  v3 = objc_alloc_init(CDIDSService);
  idsService = self->_idsService;
  self->_idsService = v3;

  [(CDIDSService *)self->_idsService setDispatchQueue:self->_dispatchQueue];
  objc_super v5 = self->_idsService;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020CA8;
  v6[3] = &unk_1000351F8;
  v6[4] = self;
  [(CDIDSService *)v5 setMessageReceivedHandler:v6];
  [(CDIDSService *)self->_idsService activate];
}

- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4
{
  id v4 = a4;
  objc_super v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    v7 = [[CDProviderSession alloc] initWithLocalAuthenticationRequest:v4];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  +[BSDescriptionBuilder builderWithObject:self];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020E38;
  v8[3] = &unk_100034800;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CDProviderDaemon *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(CDProviderDaemon *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_currentSession)
  {
    __int16 v15 = +[NSError errorWithDomain:CPSErrorDomain code:102 userInfo:0];
    v14[2](v14, v15);
  }
  else
  {
    v16 = [(CDProviderDaemon *)self _authenticationSessionWithClient:v12 request:v13];
    currentSession = self->_currentSession;
    self->_currentSession = v16;

    v18 = self->_currentSession;
    if (v18)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100021264;
      v29[3] = &unk_100034850;
      id v19 = v11;
      id v30 = v19;
      [(CDProviderSession *)v18 setSessionFinishedHandler:v29];
      v20 = self->_currentSession;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100021270;
      v27[3] = &unk_100034878;
      id v28 = v19;
      [(CDProviderSession *)v20 setSessionFailedHandler:v27];
      v21 = self->_currentSession;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10002127C;
      v26[3] = &unk_1000347D8;
      v26[4] = self;
      [(CDProviderSession *)v21 setInvalidationHandler:v26];
      [(CDProviderSession *)self->_currentSession setDispatchQueue:self->_dispatchQueue];
      objc_storeStrong((id *)&self->_currentSessionConnection, a3);
      [(CDProviderSession *)self->_currentSession activate];
    }
    else
    {
      uint64_t v22 = CPSErrorDomain;
      NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
      v23 = +[NSString stringWithFormat:@"Invalid authentication request: %@", v13];
      v32 = v23;
      v24 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v25 = +[NSError errorWithDomain:v22 code:101 userInfo:v24];
      v14[2](v14, v25);
    }
  }
}

- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(CDProviderDaemon *)self descriptionWithMultilinePrefix:0];
  (*((void (**)(id, id, void))a4 + 2))(v6, v7, 0);
}

- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4
{
}

- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentSessionConnection, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end