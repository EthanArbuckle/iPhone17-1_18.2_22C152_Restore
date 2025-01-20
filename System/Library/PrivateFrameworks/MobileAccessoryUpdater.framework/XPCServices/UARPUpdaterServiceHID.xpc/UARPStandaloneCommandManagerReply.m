@interface UARPStandaloneCommandManagerReply
- (UARPStandaloneCommandManagerReply)initWithRemoteServiceEndpoint:(id)a3;
- (id)remoteObject;
- (id)xpcConnectionToRequestor;
- (void)dealloc;
@end

@implementation UARPStandaloneCommandManagerReply

- (UARPStandaloneCommandManagerReply)initWithRemoteServiceEndpoint:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UARPStandaloneCommandManagerReply;
  v6 = [(UARPStandaloneCommandManagerReply *)&v12 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_remoteEndpoint, a3),
        [(UARPStandaloneCommandManagerReply *)v7 xpcConnectionToRequestor],
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
  v3.super_class = (Class)UARPStandaloneCommandManagerReply;
  [(UARPStandaloneCommandManagerReply *)&v3 dealloc];
}

- (id)remoteObject
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    objc_super v3 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&stru_1000288F0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315394;
      v6 = "-[UARPStandaloneCommandManagerReply remoteObject]";
      __int16 v7 = 2112;
      uint64_t v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: remoteObject: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001CE08();
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
    objc_super v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UARPStandaloneCommandRequestor];
    [v2 setRemoteObjectInterface:v3];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    __int16 v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
    uint64_t v8 = [v2 remoteObjectInterface];
    [v8 setClasses:v7 forSelector:"dynamicAssetSolicitationComplete:modelNumber:" argumentIndex:0 ofReply:0];

    v9 = [v2 remoteObjectInterface];
    [v9 setClasses:v7 forSelector:"dynamicAssetSolicitationComplete:" argumentIndex:0 ofReply:0];

    [v2 resume];
    id v10 = v2;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001CF24();
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end