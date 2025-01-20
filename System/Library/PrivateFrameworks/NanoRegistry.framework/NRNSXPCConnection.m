@interface NRNSXPCConnection
- (NRNSXPCConnection)initWithConnection:(id)a3;
- (NRNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (NSString)processName;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (void)_setQueue:(id)a3;
- (void)invalidate;
- (void)resume;
- (void)runCompletionBlock:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
- (void)suspend;
@end

@implementation NRNSXPCConnection

- (void)setRemoteObjectInterface:(id)a3
{
}

- (void)setExportedObject:(id)a3
{
}

- (void)setExportedInterface:(id)a3
{
}

- (void)resume
{
}

- (NRNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(NRNSXPCConnection *)self init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v6 options:a4];
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v8;
  }
  return v7;
}

- (id)valueForEntitlement:(id)a3
{
  return (id)[(NSXPCConnection *)self->_connection valueForEntitlement:a3];
}

- (NSString)processName
{
  int v3 = [(NRNSXPCConnection *)self processIdentifier];
  v4 = malloc_type_malloc(0x1000uLL, 0x5C857C46uLL);
  if (v4)
  {
    v5 = v4;
    if (proc_pidpath(v3, v4, 0x1000u) > 0)
    {
      id v6 = [NSString stringWithUTF8String:v5];
      free(v5);
      goto LABEL_6;
    }
    free(v5);
  }
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"PID_%ld", -[NRNSXPCConnection processIdentifier](self, "processIdentifier"));
LABEL_6:

  return (NSString *)v6;
}

- (int)processIdentifier
{
  return [(NSXPCConnection *)self->_connection processIdentifier];
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void)_setQueue:(id)a3
{
}

- (void)runCompletionBlock:(id)a3
{
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  int v3 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:a3];
  v4 = [NRLoggingXPCProxy alloc];
  -[NRLoggingXPCProxy initWithBlahBlahBlahProxy:]((id *)&v4->super.isa, v3);

  return v4;
}

- (NRNSXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  id v6 = [(NRNSXPCConnection *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (NSXPCInterface)exportedInterface
{
  return [(NSXPCConnection *)self->_connection exportedInterface];
}

- (id)exportedObject
{
  return [(NSXPCConnection *)self->_connection exportedObject];
}

- (NSXPCInterface)remoteObjectInterface
{
  return [(NSXPCConnection *)self->_connection remoteObjectInterface];
}

- (id)remoteObjectProxy
{
  v2 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  int v3 = [NRLoggingXPCProxy alloc];
  -[NRLoggingXPCProxy initWithBlahBlahBlahProxy:]((id *)&v3->super.isa, v2);

  return v3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  int v3 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
  v4 = [NRLoggingXPCProxy alloc];
  -[NRLoggingXPCProxy initWithBlahBlahBlahProxy:]((id *)&v4->super.isa, v3);

  return v4;
}

- (id)interruptionHandler
{
  return [(NSXPCConnection *)self->_connection interruptionHandler];
}

- (id)invalidationHandler
{
  return [(NSXPCConnection *)self->_connection invalidationHandler];
}

- (void)suspend
{
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

@end