@interface DDMain
+ (id)sharedInstance;
- (DAIDSMessageReceiver)localReceiver;
- (DDIDSService)pairedService;
- (DDMain)init;
- (NSMutableArray)connections;
- (void)addConnection:(id)a3;
- (void)availableDestinationsWithCompletion:(id)a3;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)removeConnection:(id)a3;
- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8;
- (void)setConnections:(id)a3;
- (void)setLocalReceiver:(id)a3;
- (void)setPairedService:(id)a3;
@end

@implementation DDMain

- (DDMain)init
{
  v8.receiver = self;
  v8.super_class = (Class)DDMain;
  v2 = [(DDMain *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v3;

    v5 = [[DDIDSService alloc] initWithServiceType:0];
    pairedService = v2->_pairedService;
    v2->_pairedService = v5;

    [(DDIDSService *)v2->_pairedService setReceiver:v2];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1000228D0 != -1) {
    dispatch_once(&qword_1000228D0, &stru_100018808);
  }
  v2 = (void *)qword_1000228C8;

  return v2;
}

- (void)addConnection:(id)a3
{
  id v6 = a3;
  v4 = [(DDMain *)self connections];
  objc_sync_enter(v4);
  v5 = [(DDMain *)self connections];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeConnection:(id)a3
{
  id v8 = a3;
  v4 = [(DDMain *)self connections];
  objc_sync_enter(v4);
  v5 = [(DDMain *)self connections];
  [v5 removeObject:v8];

  id v6 = [(DDMain *)self localReceiver];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(DDMain *)self setLocalReceiver:0];
  }
  objc_sync_exit(v4);
}

- (void)availableDestinationsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(DDMain *)self pairedService];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004A84;
  v9[3] = &unk_100018830;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 availableDestinationsWithCompletion:v9];
}

- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  v17 = [(DDMain *)self pairedService];
  unsigned int v18 = [v17 hasDestination:v15];

  if (v18)
  {
    v19 = [(DDMain *)self pairedService];
    [v19 sendMessage:v20 data:v14 toDestination:v15 forceLocalDelivery:v10 expectsResponse:v9 response:v16];
  }
  else
  {
    (*((void (**)(id, void, void, void, void))v16 + 2))(v16, 0, 0, 0, 0);
  }
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v29 = a4;
  id v30 = a5;
  id v13 = a7;
  id v14 = [(DDMain *)self connections];
  objc_sync_enter(v14);
  id v15 = [(DDMain *)self connections];
  objc_sync_exit(v14);

  v28 = v15;
  if ([v15 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = [(DDMain *)self connections];
    id v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v32;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = [*(id *)(*((void *)&v31 + 1) + 8 * i) remoteObjectProxyWithErrorHandler:&stru_100018850];
          v21 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v36 = v12;
            __int16 v37 = 2112;
            v38 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Routing message: %@ to remote object proxy: %@", buf, 0x16u);
          }

          [v20 receiveMessage:v12 data:v29 fromDestination:v30 expectsResponse:v8 response:v13];
        }
        id v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v22 = [(DDMain *)self localReceiver];

    if (!v22)
    {
      v23 = (void *)MGCopyAnswer();
      if ([v23 isEqualToString:@"Watch"])
      {
        v24 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Creating local receiver for Apple Watch", buf, 2u);
        }

        v25 = [[DDWatchMessageReceiver alloc] initWithDestination:v30];
        [(DDMain *)self setLocalReceiver:v25];
      }
    }
    v26 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(DDMain *)self localReceiver];
      *(_DWORD *)buf = 138412546;
      id v36 = v12;
      __int16 v37 = 2112;
      v38 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Routing message: %@ to local reciever: %@", buf, 0x16u);
    }
    id v16 = [(DDMain *)self localReceiver];
    [v16 receiveMessage:v12 data:v29 fromDestination:v30 expectsResponse:v8 response:v13];
  }
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (DDIDSService)pairedService
{
  return self->_pairedService;
}

- (void)setPairedService:(id)a3
{
}

- (DAIDSMessageReceiver)localReceiver
{
  return self->_localReceiver;
}

- (void)setLocalReceiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localReceiver, 0);
  objc_storeStrong((id *)&self->_pairedService, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

@end