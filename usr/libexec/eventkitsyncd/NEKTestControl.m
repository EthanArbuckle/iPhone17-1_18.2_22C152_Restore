@interface NEKTestControl
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NEKEnvironment)environment;
- (NEKTestControl)initWithEnvironment:(id)a3;
- (NSXPCListener)listener;
- (void)setEnvironment:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation NEKTestControl

- (NEKTestControl)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEKTestControl;
  v5 = [(NEKTestControl *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.internal.eventkitsync.testcontrol"];
    listener = v6->_listener;
    v6->_listener = v7;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    v9 = v6->_listener;
    v10 = sub_100006A20("com.apple.NEKTestControl.xpc");
    [(NSXPCListener *)v9 _setQueue:v10];

    [(NSXPCListener *)v6->_listener resume];
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEKTestControlProtocol];
  [v5 setExportedInterface:v6];

  v7 = [(NEKTestControl *)self environment];
  v8 = [v7 syncController];
  [v5 setExportedObject:v8];

  [v5 resume];
  return 1;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NEKEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (NEKEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end