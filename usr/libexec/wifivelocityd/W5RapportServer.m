@interface W5RapportServer
- (BOOL)_configureCompaionLinkClient;
- (NSArray)listeners;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)rapportClient;
- (W5RapportServer)initWithRequestListeners:(id)a3;
- (void)_registerRequestsForListener:(id)a3 rapportClient:(id)a4;
- (void)invalidateDiscoveryClient;
- (void)setListeners:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRapportClient:(id)a3;
@end

@implementation W5RapportServer

- (W5RapportServer)initWithRequestListeners:(id)a3
{
  id v5 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v9 = sub_10009756C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v12 = 136315650;
    v13 = "-[W5RapportServer initWithRequestListeners:]";
    __int16 v14 = 2080;
    v15 = "W5RapportServer.m";
    __int16 v16 = 1024;
    int v17 = 43;
LABEL_16:
    _os_log_send_and_compose_impl();
    goto LABEL_17;
  }
  if (!+[W5FeatureAvailability diagnosticsModeEnabled])
  {
    v9 = sub_10009756C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v12 = 136315650;
    v13 = "-[W5RapportServer initWithRequestListeners:]";
    __int16 v14 = 2080;
    v15 = "W5RapportServer.m";
    __int16 v16 = 1024;
    int v17 = 44;
    goto LABEL_16;
  }
  v11.receiver = self;
  v11.super_class = (Class)W5RapportServer;
  self = [(W5RapportServer *)&v11 init];
  if (!self) {
    goto LABEL_18;
  }
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifi.W5RapportServer", 0);
  queue = self->_queue;
  self->_queue = v6;

  if (!self->_queue) {
    goto LABEL_18;
  }
  objc_storeStrong((id *)&self->_listeners, a3);
  if (self->_listeners)
  {
    if ([(W5RapportServer *)self _configureCompaionLinkClient]) {
      goto LABEL_7;
    }
    v9 = sub_10009756C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v12 = 136315650;
    v13 = "-[W5RapportServer initWithRequestListeners:]";
    __int16 v14 = 2080;
    v15 = "W5RapportServer.m";
    __int16 v16 = 1024;
    int v17 = 56;
    goto LABEL_16;
  }
  v9 = sub_10009756C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[W5RapportServer initWithRequestListeners:]";
    __int16 v14 = 2080;
    v15 = "W5RapportServer.m";
    __int16 v16 = 1024;
    int v17 = 54;
    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  v10 = sub_10009756C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[W5RapportServer initWithRequestListeners:]";
    __int16 v14 = 2080;
    v15 = "W5RapportServer.m";
    __int16 v16 = 1024;
    int v17 = 63;
    _os_log_send_and_compose_impl();
  }

  self = 0;
LABEL_7:

  return self;
}

- (BOOL)_configureCompaionLinkClient
{
  id v3 = objc_alloc_init((Class)RPCompanionLinkClient);
  v4 = v3;
  if (v3)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008BB6C;
    v18[3] = &unk_1000DD230;
    v18[4] = self;
    [v3 setInvalidationHandler:v18];
    [v4 setDispatchQueue:self->_queue];
    [v4 setServiceType:@"com.apple.wifivelocityd.rapportWake"];
    id v5 = sub_10009756C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315650;
      v21 = "-[W5RapportServer _configureCompaionLinkClient]";
      __int16 v22 = 2080;
      v23 = "W5RapportServer.m";
      __int16 v24 = 1024;
      int v25 = 87;
      LODWORD(v13) = 28;
      int v12 = &v20;
      _os_log_send_and_compose_impl();
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = [(W5RapportServer *)self listeners];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          -[W5RapportServer _registerRequestsForListener:rapportClient:](self, "_registerRequestsForListener:rapportClient:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v10), v4, v12, v13);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }

    [(W5RapportServer *)self setRapportClient:v4];
  }

  return v4 != 0;
}

- (void)_registerRequestsForListener:(id)a3 rapportClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    v10 = sub_10009756C();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v15) = 0;
LABEL_13:
    _os_log_send_and_compose_impl();
    goto LABEL_14;
  }
  if (!v7)
  {
    v10 = sub_10009756C();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v15) = 0;
    goto LABEL_13;
  }
  unsigned __int8 v9 = [v6 conformsToProtocol:&OBJC_PROTOCOL___W5PeerRequestListener];
  v10 = sub_10009756C();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (!v11) {
      goto LABEL_14;
    }
    int v15 = 138543362;
    id v16 = v6;
    goto LABEL_13;
  }
  if (v11)
  {
    [v6 identifier];
    int v15 = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }
  int v12 = [v6 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008BEE4;
  v13[3] = &unk_1000DF410;
  long long v14 = v6;
  [v8 registerRequestID:v12 options:0 handler:v13];

  [(RPCompanionLinkClient *)self->_rapportClient activateWithCompletion:&stru_1000DF430];
  v10 = v14;
LABEL_14:
}

- (void)invalidateDiscoveryClient
{
  [(RPCompanionLinkClient *)self->_rapportClient invalidate];
  rapportClient = self->_rapportClient;
  self->_rapportClient = 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RPCompanionLinkClient)rapportClient
{
  return self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end