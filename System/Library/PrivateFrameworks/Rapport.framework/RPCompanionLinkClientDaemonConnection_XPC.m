@interface RPCompanionLinkClientDaemonConnection_XPC
- (NSXPCConnection)cnx;
- (RPCompanionLinkClientDaemonConnection_XPC)initWithConnection:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)invalidate;
- (void)setCnx:(id)a3;
@end

@implementation RPCompanionLinkClientDaemonConnection_XPC

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_cnx remoteObjectProxyWithErrorHandler:a3];
}

- (RPCompanionLinkClientDaemonConnection_XPC)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPCompanionLinkClientDaemonConnection_XPC;
  v6 = [(RPCompanionLinkClientDaemonConnection_XPC *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cnx, a3);
  }

  return v7;
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

- (id)remoteObjectProxy
{
  return [(NSXPCConnection *)self->_cnx remoteObjectProxy];
}

- (NSXPCConnection)cnx
{
  return self->_cnx;
}

- (void)setCnx:(id)a3
{
}

@end