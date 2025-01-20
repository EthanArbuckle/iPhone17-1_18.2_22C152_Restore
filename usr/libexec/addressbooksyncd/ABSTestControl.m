@interface ABSTestControl
- (ABSTestControl)initWithSyncInterface:(id)a3;
- (ABSyncInterface)syncInterface;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (void)setListener:(id)a3;
- (void)setSyncInterface:(id)a3;
@end

@implementation ABSTestControl

- (ABSTestControl)initWithSyncInterface:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ABSTestControl;
  v5 = [(ABSTestControl *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_syncInterface, v4);
    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.internal.addressbooksync.testcontrol"];
    listener = v6->_listener;
    v6->_listener = v7;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    [(NSXPCListener *)v6->_listener resume];
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(ABSTestControl *)self syncInterface];
  if (v6)
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ABSTestControlProtocol];
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:v6];
    [v5 resume];
  }

  return v6 != 0;
}

- (ABSyncInterface)syncInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncInterface);

  return (ABSyncInterface *)WeakRetained;
}

- (void)setSyncInterface:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_destroyWeak((id *)&self->_syncInterface);
}

@end