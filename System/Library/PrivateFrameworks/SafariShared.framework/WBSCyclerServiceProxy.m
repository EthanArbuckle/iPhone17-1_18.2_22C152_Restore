@interface WBSCyclerServiceProxy
- (WBSCyclerServiceProxy)init;
- (id)_cyclerProxy;
- (id)connectionInvalidationHandler;
- (id)errorHandler;
- (void)dealloc;
- (void)fetchLastErrorWithReply:(id)a3;
- (void)fetchLogsWithReply:(id)a3;
- (void)fetchStatusWithReply:(id)a3;
- (void)sendRequestToTestSuite:(id)a3 reply:(id)a4;
- (void)setConnectionInvalidationHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setTestTargetEndpoint:(id)a3 reply:(id)a4;
- (void)setValue:(id)a3 forConfigurationKey:(id)a4 reply:(id)a5;
- (void)startCyclingFromBeginning:(BOOL)a3 reply:(id)a4;
- (void)stopCyclingWithReply:(id)a3;
@end

@implementation WBSCyclerServiceProxy

- (WBSCyclerServiceProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBSCyclerServiceProxy;
  v2 = [(WBSCyclerServiceProxy *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.internal.safaricyclerd" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC31F80];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_xpcConnection resume];
    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSCyclerServiceProxy;
  [(WBSCyclerServiceProxy *)&v3 dealloc];
}

- (id)connectionInvalidationHandler
{
  return [(NSXPCConnection *)self->_xpcConnection invalidationHandler];
}

- (void)setConnectionInvalidationHandler:(id)a3
{
}

- (void)setTestTargetEndpoint:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WBSCyclerServiceProxy *)self _cyclerProxy];
  [v8 setTestTargetEndpoint:v7 reply:v6];
}

- (void)setValue:(id)a3 forConfigurationKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WBSCyclerServiceProxy *)self _cyclerProxy];
  [v11 setValue:v10 forConfigurationKey:v9 reply:v8];
}

- (void)startCyclingFromBeginning:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(WBSCyclerServiceProxy *)self _cyclerProxy];
  [v7 startCyclingFromBeginning:v4 reply:v6];
}

- (void)stopCyclingWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSCyclerServiceProxy *)self _cyclerProxy];
  [v5 stopCyclingWithReply:v4];
}

- (void)sendRequestToTestSuite:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WBSCyclerServiceProxy *)self _cyclerProxy];
  [v8 sendRequestToTestSuite:v7 reply:v6];
}

- (void)fetchStatusWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSCyclerServiceProxy *)self _cyclerProxy];
  [v5 fetchStatusWithReply:v4];
}

- (void)fetchLogsWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSCyclerServiceProxy *)self _cyclerProxy];
  [v5 fetchLogsWithReply:v4];
}

- (void)fetchLastErrorWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSCyclerServiceProxy *)self _cyclerProxy];
  [v5 fetchLastErrorWithReply:v4];
}

- (id)_cyclerProxy
{
  p_xpcConnection = &self->_xpcConnection;
  xpcConnection = self->_xpcConnection;
  if (p_xpcConnection[1]) {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:");
  }
  else {
  id v4 = [(NSXPCConnection *)xpcConnection remoteObjectProxy];
  }
  return v4;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end