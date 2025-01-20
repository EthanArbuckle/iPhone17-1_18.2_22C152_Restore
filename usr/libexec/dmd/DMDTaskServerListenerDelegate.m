@interface DMDTaskServerListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CATTaskServer)taskServer;
- (DMDTaskServerListenerDelegate)initWithTaskServer:(id)a3;
@end

@implementation DMDTaskServerListenerDelegate

- (DMDTaskServerListenerDelegate)initWithTaskServer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMDTaskServerListenerDelegate;
  v6 = [(DMDTaskServerListenerDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskServer, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.dmd-access"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 BOOLValue])
  {
    id v7 = [objc_alloc((Class)CATXPCTransport) initWithXPCConnection:v5];
    v8 = [(DMDTaskServerListenerDelegate *)self taskServer];
    [v8 connectWithClientTransport:v7];

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (CATTaskServer)taskServer
{
  return self->_taskServer;
}

- (void).cxx_destruct
{
}

@end