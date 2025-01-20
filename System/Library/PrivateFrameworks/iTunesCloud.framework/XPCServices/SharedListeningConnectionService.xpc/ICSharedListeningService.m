@interface ICSharedListeningService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)controllers;
- (void)dealloc;
- (void)setControllers:(id)a3;
@end

@implementation ICSharedListeningService

- (void).cxx_destruct
{
}

- (void)setControllers:(id)a3
{
}

- (NSMutableArray)controllers
{
  return self->_controllers;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    [v6 auditToken];
  }
  else
  {
    long long v30 = 0u;
    long long v29 = 0u;
  }
  v8 = MSVBundleIDForAuditToken();
  id v9 = [v8 length];
  if (v9)
  {
    v10 = [(ICSharedListeningService *)self controllers];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      v12 = objc_opt_new();
      [(ICSharedListeningService *)self setControllers:v12];
    }
    v13 = sub_100001348();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v32 = self;
      __int16 v33 = 2112;
      v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ICSharedListeningService: %p: accepting new connection %@.", buf, 0x16u);
    }

    v14 = [[ICHostedSharedListeningConnectionController alloc] initWithConnection:v7 bundleID:v8];
    v15 = [(ICSharedListeningService *)self controllers];
    [v15 addObject:v14];

    v20 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICSharedListeningConnectionServiceProtocol];
    [v7 setExportedObject:v14];
    [v7 setExportedInterface:v20];
    v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICSharedListeningConnectionClientProtocol];
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    [v16 setClasses:v17 forSelector:"receiveConnectionError:" argumentIndex:0 ofReply:0];

    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    [v16 setClasses:v18 forSelector:"receiveFatalError:" argumentIndex:0 ofReply:0];

    [v7 setRemoteObjectInterface:v16];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v14);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000139C;
    v25[3] = &unk_100004198;
    objc_copyWeak(&v26, (id *)buf);
    objc_copyWeak(&v27, &location);
    v25[4] = self;
    [v7 setInvalidationHandler:v25];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100001504;
    v22[3] = &unk_100004198;
    objc_copyWeak(&v23, (id *)buf);
    objc_copyWeak(&v24, &location);
    v22[4] = self;
    [v7 setInterruptionHandler:v22];
    [v7 resume];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [v7 invalidate];
  }

  return v9 != 0;
}

- (void)dealloc
{
  v3 = sub_100001348();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICSharedListeningService: %p: deallocating.", buf, 0xCu);
  }

  v4 = [(ICSharedListeningService *)self controllers];
  [v4 removeAllObjects];

  v5.receiver = self;
  v5.super_class = (Class)ICSharedListeningService;
  [(ICSharedListeningService *)&v5 dealloc];
}

@end