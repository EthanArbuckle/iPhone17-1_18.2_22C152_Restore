@interface VSKeepAliveServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (VSKeepAliveServer)init;
- (void)dealloc;
- (void)resume;
@end

@implementation VSKeepAliveServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAliveManager, 0);
  objc_storeStrong((id *)&self->_keepAliveListener, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = objc_alloc_init(VSKeepAliveClient);
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VSRemoteKeepAlive];
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:v5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000EFC40;
  v9[3] = &unk_1000FEA88;
  v10 = v5;
  v7 = v5;
  [v4 setInvalidationHandler:v9];
  [v4 resume];

  return 1;
}

- (void)resume
{
}

- (void)dealloc
{
  [(NSXPCListener *)self->_keepAliveListener setDelegate:0];
  [(NSXPCListener *)self->_keepAliveListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VSKeepAliveServer;
  [(VSKeepAliveServer *)&v3 dealloc];
}

- (VSKeepAliveServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)VSKeepAliveServer;
  v2 = [(VSKeepAliveServer *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSXPCListener);
    id v4 = (NSXPCListener *)[v3 initWithMachServiceName:VSKeepAliveMachServiceName];
    keepAliveListener = v2->_keepAliveListener;
    v2->_keepAliveListener = v4;

    [(NSXPCListener *)v2->_keepAliveListener setDelegate:v2];
    v6 = objc_alloc_init(VSServerKeepAliveManager);
    keepAliveManager = v2->_keepAliveManager;
    v2->_keepAliveManager = v6;
  }
  return v2;
}

@end