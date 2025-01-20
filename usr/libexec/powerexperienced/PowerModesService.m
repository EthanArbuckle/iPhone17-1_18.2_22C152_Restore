@interface PowerModesService
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)clients;
- (OS_dispatch_queue)queue;
- (PowerModesService)init;
- (void)registerWithIdentifier:(id)a3 forModes:(id)a4;
- (void)setClients:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)updateClientsforMode:(id)a3 withState:(BOOL)a4;
@end

@implementation PowerModesService

+ (id)sharedInstance
{
  if (qword_10001BE88 != -1) {
    dispatch_once(&qword_10001BE88, &stru_100014648);
  }
  v2 = (void *)qword_10001BE80;

  return v2;
}

- (PowerModesService)init
{
  v9.receiver = self;
  v9.super_class = (Class)PowerModesService;
  v2 = [(PowerModesService *)&v9 initWithMachServiceName:@"com.apple.powerexperienced.powermodesservice"];
  if (v2)
  {
    v3 = qword_10001BE90;
    if (os_log_type_enabled((os_log_t)qword_10001BE90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "starting service", v8, 2u);
    }
    [(PowerModesService *)v2 setDelegate:v2];
    v4 = +[NSMutableArray array];
    [(PowerModesService *)v2 setClients:v4];

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.powerexperienced.powermodesservice", v5);
    [(PowerModesService *)v2 setQueue:v6];
  }
  return v2;
}

- (void)start
{
  [(PowerModesService *)self activate];

  notify_post("com.apple.powerexperienced.restart");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_queue_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____ContextualPowerModesProtocol];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____ContextualPowerModesCallbackProtocol];
  [v5 setRemoteObjectInterface:v7];

  v8 = (void *)qword_10001BE90;
  if (os_log_type_enabled((os_log_t)qword_10001BE90, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = v8;
    v11[0] = 67109120;
    v11[1] = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PowerModesManager: listener: accepted new connection from pid %d", (uint8_t *)v11, 8u);
  }
  [v5 resume];

  return 1;
}

- (void)updateClientsforMode:(id)a3 withState:(BOOL)a4
{
  id v6 = a3;
  v7 = [(PowerModesService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008D2C;
  block[3] = &unk_100014698;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerWithIdentifier:(id)a3 forModes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  objc_super v9 = [(PowerModesService *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000090D4;
  v13[3] = &unk_100014548;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  v17 = self;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v13);
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end