@interface DIIOClientDelegate
- (BOOL)setupNewConnection:(id)a3;
- (DIIOClientDelegate)initWithIODaemon:(id)a3;
- (DIIODaemonDelegate)weakDaemon;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (void)addToRefCountWithReply:(id)a3;
- (void)createListener;
- (void)setWeakDaemon:(id)a3;
@end

@implementation DIIOClientDelegate

- (DIIOClientDelegate)initWithIODaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DIIOClientDelegate;
  v5 = [(DIBaseServiceDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakDaemon, v4);
  }

  return v6;
}

- (void)addToRefCountWithReply:(id)a3
{
  v3 = (void (**)(id, void))a3;
  int v4 = *__error();
  if (sub_1000D29A0())
  {
    v5 = sub_1000D2920();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v9 = 45;
    __int16 v10 = 2080;
    v11 = "-[DIIOClientDelegate addToRefCountWithReply:]";
    v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf(__stderrp, "%s\n", v6);
      free(v6);
    }
  }
  else
  {
    v7 = sub_1000D2920();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v9 = 45;
      __int16 v10 = 2080;
      v11 = "-[DIIOClientDelegate addToRefCountWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Reached, keeping connection alive", buf, 0x12u);
    }
  }
  *__error() = v4;
  v3[2](v3, 0);
}

- (BOOL)setupNewConnection:(id)a3
{
  id v4 = a3;
  int v5 = *__error();
  if (sub_1000D29A0())
  {
    id location = 0;
    v6 = sub_1000D2920();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v34 = 41;
    __int16 v35 = 2080;
    v36 = "-[DIIOClientDelegate setupNewConnection:]";
    LODWORD(v23) = 18;
    v22 = buf;
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    objc_super v8 = sub_1000D2920();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v34 = 41;
      __int16 v35 = 2080;
      v36 = "-[DIIOClientDelegate setupNewConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s: A new client has connected to the clients listener", buf, 0x12u);
    }
  }
  *__error() = v5;
  int v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DIIOClientProtocol];
  [v4 setExportedInterface:v9];

  [v4 setExportedObject:self];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000821C;
  v28[3] = &unk_100191610;
  objc_copyWeak(&v29, &location);
  objc_copyWeak(&v30, &from);
  [v4 setInvalidationHandler:v28];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000083EC;
  v25[3] = &unk_100191610;
  objc_copyWeak(&v26, &location);
  objc_copyWeak(&v27, &from);
  [v4 setInterruptionHandler:v25];
  __int16 v10 = [(DIIOClientDelegate *)self weakDaemon];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
    objc_sync_enter(v12);
    v13 = [v12 activeConnections];
    [v13 addObject:v4];

    int v24 = *__error();
    if (sub_1000D29A0())
    {
      v14 = sub_1000D2920();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      v15 = [v12 activeConnections:v22, v23];
      id v16 = [v15 count];
      *(_DWORD *)buf = 68158210;
      int v34 = 41;
      __int16 v35 = 2080;
      v36 = "-[DIIOClientDelegate setupNewConnection:]";
      __int16 v37 = 2048;
      id v38 = v16;
      v17 = (char *)_os_log_send_and_compose_impl();

      if (v17)
      {
        fprintf(__stderrp, "%s\n", v17);
        free(v17);
      }
    }
    else
    {
      v18 = sub_1000D2920();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v12 activeConnections];
        id v20 = [v19 count];
        *(_DWORD *)buf = 68158210;
        int v34 = 41;
        __int16 v35 = 2080;
        v36 = "-[DIIOClientDelegate setupNewConnection:]";
        __int16 v37 = 2048;
        id v38 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%.*s: # of active connections: %lu", buf, 0x1Cu);
      }
    }
    *__error() = v24;
    objc_sync_exit(v12);
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)createListener
{
  id v3 = +[NSXPCListener anonymousListener];
  [(DIBaseServiceDelegate *)self setListener:v3];
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  v2 = [(DIBaseServiceDelegate *)self listener];
  id v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (DIIODaemonDelegate)weakDaemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDaemon);

  return (DIIODaemonDelegate *)WeakRetained;
}

- (void)setWeakDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end