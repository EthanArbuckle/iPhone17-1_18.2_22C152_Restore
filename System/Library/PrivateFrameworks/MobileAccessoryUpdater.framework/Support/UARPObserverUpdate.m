@interface UARPObserverUpdate
- (UARPObserverUpdate)initWithRemoteServiceEndpoint:(id)a3;
- (id)remoteObject;
- (id)xpcConnectionToRequestor;
- (void)dealloc;
@end

@implementation UARPObserverUpdate

- (UARPObserverUpdate)initWithRemoteServiceEndpoint:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UARPObserverUpdate;
  v6 = [(UARPObserverUpdate *)&v12 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_remoteEndpoint, a3),
        [(UARPObserverUpdate *)v7 xpcConnectionToRequestor],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        xpcConnection = v7->_xpcConnection,
        v7->_xpcConnection = (NSXPCConnection *)v8,
        xpcConnection,
        !v7->_xpcConnection))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UARPObserverUpdate;
  [(UARPObserverUpdate *)&v3 dealloc];
}

- (id)remoteObject
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    objc_super v3 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&stru_10007CF30];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EFFC();
    }
    objc_super v3 = 0;
  }
  return v3;
}

- (id)xpcConnectionToRequestor
{
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:self->_remoteEndpoint];
  if (v2)
  {
    objc_super v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AUObserverXPCClient];
    [v2 setRemoteObjectInterface:v3];
    [v2 resume];
    id v4 = v2;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004F118();
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end