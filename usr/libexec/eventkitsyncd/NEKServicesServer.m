@interface NEKServicesServer
+ (id)log;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NEKEnvironment)environment;
- (NEKServicesServer)initWithEnvironment:(id)a3;
- (void)setEnvironment:(id)a3;
@end

@implementation NEKServicesServer

+ (id)log
{
  if (qword_1000C6B40 != -1) {
    dispatch_once(&qword_1000C6B40, &stru_1000A8C28);
  }
  v2 = (void *)qword_1000C6B48;

  return v2;
}

- (NEKServicesServer)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NEKServicesServer;
  v6 = [(NEKServicesServer *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    id v8 = objc_alloc((Class)NSXPCListener);
    v9 = (NSXPCListener *)[v8 initWithMachServiceName:EKSSMachServiceName];
    listener = v7->_listener;
    v7->_listener = v9;

    [(NSXPCListener *)v7->_listener setDelegate:v7];
    [(NSXPCListener *)v7->_listener resume];
    v11 = +[NEKServicesServer log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "listening", v13, 2u);
    }
  }
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[NEKServicesClient alloc] initWithConnection:v7 andEnvironment:self->_environment];
  v9 = EKSSServiceXPCInterface();
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:v8];
  v10 = EKSSClientXPCInterface();
  [v7 setRemoteObjectInterface:v10];

  id v11 = objc_initWeak(&location, self);
  v12 = [(NEKServicesServer *)self description];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000B670;
  v20[3] = &unk_1000A8B90;
  id v13 = v12;
  id v21 = v13;
  [v7 setInterruptionHandler:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000B720;
  v18[3] = &unk_1000A8B90;
  id v14 = v13;
  id v19 = v14;
  [v7 setInvalidationHandler:v18];
  [v7 resume];
  v15 = +[NEKServicesServer log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "accepted incoming connection", v17, 2u);
  }

  objc_destroyWeak(&location);
  return 1;
}

- (NEKEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end