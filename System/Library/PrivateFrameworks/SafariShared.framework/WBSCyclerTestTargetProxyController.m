@interface WBSCyclerTestTargetProxyController
- (WBSCyclerTestTarget)testTargetProxy;
- (WBSCyclerTestTargetProxyController)init;
- (WBSCyclerTestTargetProxyController)initWithEndpoint:(id)a3;
- (id)disconnectionHandler;
- (void)dealloc;
- (void)setDisconnectionHandler:(id)a3;
@end

@implementation WBSCyclerTestTargetProxyController

- (WBSCyclerTestTargetProxyController)init
{
  return 0;
}

- (WBSCyclerTestTargetProxyController)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSCyclerTestTargetProxyController;
  v5 = [(WBSCyclerTestTargetProxyController *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC332F8];
    [(NSXPCConnection *)v5->_xpcConnection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_xpcConnection resume];
    v9 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(WBSCyclerTestTargetProxyController *)self setDisconnectionHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSCyclerTestTargetProxyController;
  [(WBSCyclerTestTargetProxyController *)&v3 dealloc];
}

- (id)disconnectionHandler
{
  return [(NSXPCConnection *)self->_xpcConnection interruptionHandler];
}

- (void)setDisconnectionHandler:(id)a3
{
  xpcConnection = self->_xpcConnection;
  id v5 = a3;
  [(NSXPCConnection *)xpcConnection setInterruptionHandler:v5];
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v5];
}

- (WBSCyclerTestTarget)testTargetProxy
{
  return (WBSCyclerTestTarget *)[(NSXPCConnection *)self->_xpcConnection remoteObjectProxy];
}

- (void).cxx_destruct
{
}

@end