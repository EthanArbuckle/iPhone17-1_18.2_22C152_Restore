@interface CBDLocalServiceServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CBDLocalServiceServer)init;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)serviceQueue;
- (void)invalidate;
- (void)ping:(id)a3;
- (void)resume;
- (void)setConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)setProxyServer:(id)a3 completion:(id)a4;
- (void)setServiceQueue:(id)a3;
- (void)startDiagnosticsWithCompletion:(id)a3;
@end

@implementation CBDLocalServiceServer

- (CBDLocalServiceServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBDLocalServiceServer;
  v2 = [(CBDLocalServiceServer *)&v6 init];
  if (v2)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.checkerboardd"];
    listener = v2->_listener;
    v2->_listener = v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
  }
  return v2;
}

- (void)resume
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start Local XPC", v5, 2u);
  }

  v4 = [(CBDLocalServiceServer *)self listener];
  [v4 resume];
}

- (void)invalidate
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidate Local XPC", v6, 2u);
  }

  v4 = [(CBDLocalServiceServer *)self listener];

  if (v4)
  {
    v5 = [(CBDLocalServiceServer *)self listener];
    [v5 invalidate];

    [(CBDLocalServiceServer *)self setListener:0];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    v20 = "-[CBDLocalServiceServer listener:shouldAcceptNewConnection:]";
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v19, 0x16u);
  }

  v7 = [v5 valueForEntitlement:@"com.apple.checkerboardd"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 BOOLValue])
  {
    [(CBDLocalServiceServer *)self setConnection:v5];
    v8 = +[CBLocalServiceInterface clientInterface];
    v9 = [(CBDLocalServiceServer *)self connection];
    [v9 setRemoteObjectInterface:v8];

    v10 = +[CBLocalServiceInterface serverInterface];
    v11 = [(CBDLocalServiceServer *)self connection];
    [v11 setExportedInterface:v10];

    v12 = [(CBDLocalServiceServer *)self connection];
    [v12 setExportedObject:self];

    v13 = [(CBDLocalServiceServer *)self connection];
    [v13 setInterruptionHandler:&stru_1000105B0];

    v14 = [(CBDLocalServiceServer *)self connection];
    [v14 setInvalidationHandler:&stru_1000105D0];

    v15 = [(CBDLocalServiceServer *)self connection];
    [v15 resume];

    BOOL v16 = 1;
  }
  else
  {
    v17 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      v20 = @"com.apple.checkerboardd";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Incoming connection not entitled. The [%@] entitlement is required.", (uint8_t *)&v19, 0xCu);
    }

    [v5 invalidate];
    BOOL v16 = 0;
  }

  return v16;
}

- (void)ping:(id)a3
{
}

- (void)setProxyServer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CBDLocalServiceServer *)self connection];

  if (v8)
  {
    v9 = [(CBDLocalServiceServer *)self connection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100009780;
    v15[3] = &unk_1000105F8;
    id v10 = v7;
    id v16 = v10;
    v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v15];

    v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Local XPC - Pass SocksProxy info to client", buf, 2u);
    }

    [v11 setProxyServer:v6 completion:v10];
    v13 = v16;
  }
  else
  {
    v14 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Local XPC - connection is nil.", buf, 2u);
    }

    v13 = +[NSError errorWithDomain:@"com.apple.checkerboardd.localServiceDaemonXPCErrorDomain" code:2 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

- (void)startDiagnosticsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CBDLocalServiceServer *)self connection];

  if (v5)
  {
    id v6 = [(CBDLocalServiceServer *)self connection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009A00;
    v12[3] = &unk_1000105F8;
    id v7 = v4;
    id v13 = v7;
    v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

    v9 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Local XPC - send moveToDiagnosticsApp to client", buf, 2u);
    }

    [v8 moveToDiagnosticsAppWithcompletion:v7];
    id v10 = v13;
  }
  else
  {
    v11 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Local XPC - connection is nil.", buf, 2u);
    }

    id v10 = +[NSError errorWithDomain:@"com.apple.checkerboardd.localServiceDaemonXPCErrorDomain" code:2 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v10);
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end