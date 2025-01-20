@interface WLDSuppressionClientConnection
- (NSString)clientIdentifier;
- (NSXPCConnection)connection;
- (WLDClientConnectionDelegate)delegate;
- (WLDSuppressionClientConnection)initWithConnection:(id)a3 clientIdentifier:(id)a4;
- (void)_didInvalidate;
- (void)enableNotificationsFor:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)suppressNotificationsFor:(id)a3 completion:(id)a4;
@end

@implementation WLDSuppressionClientConnection

- (WLDSuppressionClientConnection)initWithConnection:(id)a3 clientIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WLDSuppressionClientConnection;
  v9 = [(WLDSuppressionClientConnection *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSString *)[v8 copy];
    clientIdentifier = v10->_clientIdentifier;
    v10->_clientIdentifier = v11;

    connection = v10->_connection;
    v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WLKWatchlistSuppressNotificationsXPCConnectionProtocol];
    [(NSXPCConnection *)connection setExportedInterface:v14];

    [(NSXPCConnection *)v10->_connection setExportedObject:v10];
    objc_initWeak(&location, v10);
    v15 = v10->_connection;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = __70__WLDSuppressionClientConnection_initWithConnection_clientIdentifier___block_invoke;
    v20 = &unk_100044AE0;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v15 setInvalidationHandler:&v17];
    [(NSXPCConnection *)v10->_connection resume];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __70__WLDSuppressionClientConnection_initWithConnection_clientIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _didInvalidate];
    id WeakRetained = v2;
  }
}

- (void)suppressNotificationsFor:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  id v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WLDSuppressionClientConnection - Suppress sports notification for the event %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = +[WLKSettingsStore sharedSettings];
  [v8 setSportsNotificationSuppression:1 forEventID:v5];
  v6[2](v6, 0);
}

- (void)enableNotificationsFor:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  id v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WLDSuppressionClientConnection - Enable sports notification for the event %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = +[WLKSettingsStore sharedSettings];
  [v8 setSportsNotificationSuppression:0 forEventID:v5];
  v6[2](v6, 0);
}

- (void)_didInvalidate
{
  NSLog(@"Connection invalidated for client: %@", a2, self->_clientIdentifier);
  connection = self->_connection;
  self->_connection = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 clientConnectionDidInvalidate:self];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (WLDClientConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WLDClientConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end