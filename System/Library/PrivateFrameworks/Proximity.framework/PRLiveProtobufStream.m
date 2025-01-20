@interface PRLiveProtobufStream
- (OS_dispatch_queue)delegateQueue;
- (PRLiveProtobufStream)init;
- (PRLiveProtobufStreamDelegate)delegate;
- (id)server;
- (void)consumeProtobufBytes:(id)a3;
- (void)getUniqueClientIdentifier:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PRLiveProtobufStream

- (PRLiveProtobufStream)init
{
  v16.receiver = self;
  v16.super_class = (Class)PRLiveProtobufStream;
  v2 = [(PRLiveProtobufStream *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uniqueId = v2->_uniqueId;
    v2->_uniqueId = (NSUUID *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nearbyd.xpc.diagnostics" options:4096];
    conn = v2->_conn;
    v2->_conn = (NSXPCConnection *)v5;

    id inited = objc_initWeak(&location, v2);
    v8 = v2->_conn;
    id v9 = inited;
    [(NSXPCConnection *)v8 setExportedObject:v2];

    v10 = v2->_conn;
    v11 = PRMakeProtobufClientXPCInterface();
    [(NSXPCConnection *)v10 setExportedInterface:v11];

    v12 = v2->_conn;
    v13 = PRMakeProtobufServerXPCInterface();
    [(NSXPCConnection *)v12 setRemoteObjectInterface:v13];

    [(NSXPCConnection *)v2->_conn resume];
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)invalidate
{
}

- (id)server
{
  return [(NSXPCConnection *)self->_conn synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_70];
}

void __30__PRLiveProtobufStream_server__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)start
{
  v4 = [(PRLiveProtobufStream *)self delegate];

  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PRDiagnostics.m" lineNumber:439 description:@"Must set the delegate property before calling start."];
  }
  uint64_t v5 = [(PRLiveProtobufStream *)self delegateQueue];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PRDiagnostics.m" lineNumber:440 description:@"Must set the delegateQueue property before calling start."];
  }
  id v8 = [(PRLiveProtobufStream *)self server];
  [v8 startStreamingProtobufDataForClientId:self->_uniqueId reply:&__block_literal_global_85];
}

void __29__PRLiveProtobufStream_start__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    NSLog(&cfstr_FailedToStartS.isa);
  }
}

- (void)stop
{
  id v3 = [(PRLiveProtobufStream *)self server];
  [v3 stopStreamingProtobufDataForClientId:self->_uniqueId reply:&__block_literal_global_90];
}

void __28__PRLiveProtobufStream_stop__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    NSLog(&cfstr_FailedToStopSt.isa);
  }
}

- (void)consumeProtobufBytes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PRLiveProtobufStream *)self delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PRLiveProtobufStream_consumeProtobufBytes___block_invoke;
  v7[3] = &unk_1E5999CF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__PRLiveProtobufStream_consumeProtobufBytes___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 stream:*(void *)(a1 + 32) handleData:*(void *)(a1 + 40)];
}

- (void)getUniqueClientIdentifier:(id)a3
{
}

- (PRLiveProtobufStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRLiveProtobufStreamDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end