@interface WCDPKClient
- (BOOL)isEqual:(id)a3;
- (BOOL)isProductionEnvironment;
- (BOOL)isRunning;
- (NSData)token;
- (NSMutableArray)pendingPayloads;
- (NSString)bundleID;
- (NSString)description;
- (NSXPCConnection)connection;
- (RBSAssertion)assertion;
- (WCDPKClient)initWithBundleID:(id)a3;
- (WCDPKClientDelegate)delegate;
- (id)assertionInvalidationHandler;
- (id)remoteObjectProxy;
- (unint64_t)hash;
- (void)complicationRegister;
- (void)complicationUnregister;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)deliverPayload:(id)a3;
- (void)deliverPendingItems;
- (void)deliverToken:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setAssertionInvalidationHandler:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingPayloads:(id)a3;
- (void)setProductionEnvironment:(BOOL)a3;
- (void)setToken:(id)a3;
- (void)setupBundleIDMonitoring;
- (void)systemObserverAppDidSuspendForBundleID:(id)a3;
@end

@implementation WCDPKClient

- (WCDPKClient)initWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(WCDPKClient *)self init];
  v6 = v5;
  if (v5)
  {
    [(WCDPKClient *)v5 setBundleID:v4];
    v7 = objc_opt_new();
    [(WCDPKClient *)v6 setPendingPayloads:v7];

    [(WCDPKClient *)v6 setupBundleIDMonitoring];
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[WCDSystemMonitor sharedSystemMonitor];
  id v4 = [(WCDPKClient *)self bundleID];
  [v3 stopMonitoringBundleID:v4];

  v5 = +[WCDSystemMonitor sharedSystemMonitor];
  [v5 removeObserver:self];

  v6 = [(WCDPKClient *)self assertion];
  [v6 invalidate];
  uint64_t v7 = [(WCDPKClient *)self assertionInvalidationHandler];
  v8 = (void *)v7;
  if (v6 && v7) {
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v6, 0);
  }

  v9.receiver = self;
  v9.super_class = (Class)WCDPKClient;
  [(WCDPKClient *)&v9 dealloc];
}

- (void)setupBundleIDMonitoring
{
  id v4 = +[WCDSystemMonitor sharedSystemMonitor];
  v3 = [(WCDPKClient *)self bundleID];
  [v4 startMonitoringBundleID:v3];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(WCDPKClient *)self bundleID];
  if ([(WCDPKClient *)self isProductionEnvironment]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  uint64_t v7 = [(WCDPKClient *)self connection];
  v8 = [(WCDPKClient *)self token];
  objc_super v9 = [(WCDPKClient *)self pendingPayloads];
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p bundleID: %@, production: %s, connection: %@, token: %@, pendingPayloadCount: %lu>", v4, self, v5, v6, v7, v8, [v9 count]);

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WCDPKClient *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(WCDPKClient *)self bundleID];
      uint64_t v7 = [(WCDPKClient *)v5 bundleID];
      if ([v6 isEqual:v7])
      {
        v8 = [(WCDPKClient *)self connection];
        objc_super v9 = [(WCDPKClient *)v5 connection];
        unsigned __int8 v10 = [v8 isEqual:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(WCDPKClient *)self bundleID];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(WCDPKClient *)self connection];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (void)setConnection:(id)a3
{
  id v5 = a3;
  p_connection = &self->_connection;
  if (([(NSXPCConnection *)self->_connection isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_connection, a3);
    [(NSXPCConnection *)self->_connection setDelegate:self];
    uint64_t v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PKComplicationXPCServer];
    [(NSXPCConnection *)self->_connection setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PKComplicationXPCClient];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001D308;
    v11[3] = &unk_100044B98;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v11];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001D414;
    v9[3] = &unk_100044B98;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)*p_connection setInvalidationHandler:v9];
    [(NSXPCConnection *)*p_connection resume];
    [(WCDPKClient *)self deliverPendingItems];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isRunning
{
  v3 = +[WCDSystemMonitor sharedSystemMonitor];
  unint64_t v4 = [(WCDPKClient *)self bundleID];
  unsigned int v5 = [v3 applicationStateForBundleID:v4];

  return (v5 < 0x21) & (0x100000110uLL >> v5);
}

- (void)systemObserverAppDidSuspendForBundleID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(WCDPKClient *)self bundleID];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = wc_pushkit_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: invalidating connection", (uint8_t *)&v9, 0xCu);
    }

    v8 = [(WCDPKClient *)self connection];
    [v8 invalidate];
  }
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v5 = a4;
  [v5 retainArguments];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D7EC;
  block[3] = &unk_100044A68;
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)deliverPendingItems
{
  v3 = [(WCDPKClient *)self token];

  if (v3)
  {
    id v4 = [(WCDPKClient *)self token];
    [(WCDPKClient *)self deliverToken:v4];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(WCDPKClient *)self pendingPayloads];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WCDPKClient *)self deliverPayload:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  id v10 = [(WCDPKClient *)self pendingPayloads];
  [v10 removeAllObjects];
}

- (void)deliverToken:(id)a3
{
  id v4 = a3;
  [(WCDPKClient *)self setToken:v4];
  id v5 = [(WCDPKClient *)self connection];

  id v6 = wc_pushkit_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [(WCDPKClient *)self bundleID];
      int v10 = 138543618;
      long long v11 = v8;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: delivering token %{public}@", (uint8_t *)&v10, 0x16u);
    }
    id v6 = [(WCDPKClient *)self remoteObjectProxy];
    [v6 complicationRegistrationSucceededWithDeviceToken:v4];
  }
  else if (v7)
  {
    int v9 = [(WCDPKClient *)self bundleID];
    int v10 = 138543362;
    long long v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: pending until a connection exists", (uint8_t *)&v10, 0xCu);
  }
}

- (void)deliverPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(WCDPKClient *)self connection];

  id v6 = wc_pushkit_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [(WCDPKClient *)self bundleID];
      int v11 = 138543618;
      __int16 v12 = v8;
      __int16 v13 = 2048;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: delivering payload %p", (uint8_t *)&v11, 0x16u);
    }
    int v9 = [(WCDPKClient *)self remoteObjectProxy];
    [v9 complicationPayloadReceived:v4];
  }
  else
  {
    if (v7)
    {
      int v10 = [(WCDPKClient *)self bundleID];
      int v11 = 138543362;
      __int16 v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: pending until a connection exists", (uint8_t *)&v11, 0xCu);
    }
    int v9 = [(WCDPKClient *)self pendingPayloads];
    [v9 addObject:v4];
  }
}

- (void)complicationRegister
{
  id v3 = [(WCDPKClient *)self delegate];
  [v3 clientRequestingComplicationRegister:self];
}

- (void)complicationUnregister
{
  id v3 = [(WCDPKClient *)self delegate];
  [v3 clientRequestingComplicationUnregister:self];
}

- (id)remoteObjectProxy
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001DD40;
  v5[3] = &unk_100044C88;
  v5[4] = self;
  id v3 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];

  return v3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isProductionEnvironment
{
  return self->_productionEnvironment;
}

- (void)setProductionEnvironment:(BOOL)a3
{
  self->_productionEnvironment = a3;
}

- (WCDPKClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCDPKClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (id)assertionInvalidationHandler
{
  return self->_assertionInvalidationHandler;
}

- (void)setAssertionInvalidationHandler:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSMutableArray)pendingPayloads
{
  return self->_pendingPayloads;
}

- (void)setPendingPayloads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPayloads, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong(&self->_assertionInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end