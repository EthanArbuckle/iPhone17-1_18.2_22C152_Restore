@interface PRBeacon
- (OS_dispatch_queue)queue;
- (PRBeacon)initWithDelegate:(id)a3 queue:(id)a4;
- (PRBeaconDelegate)delegate;
- (id).cxx_construct;
- (unint64_t)state;
- (void)_updateState:(unint64_t)a3;
- (void)dealloc;
- (void)deamonConnectionInterrupted;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)startBeaconingWithOptions:(id)a3;
- (void)stopBeaconing;
@end

@implementation PRBeacon

- (PRBeacon)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PRBeacon;
  v8 = [(PRRangingDevice *)&v25 init];
  v9 = v8;
  if (v8)
  {
    id v18 = v7;
    v8->_state = 0;
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_initWeak(&location, v9);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __35__PRBeacon_initWithDelegate_queue___block_invoke;
    v22[3] = &unk_1E5999DA8;
    objc_copyWeak(&v23, &location);
    v10 = (void *)MEMORY[0x19F3B9AF0](v22);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__PRBeacon_initWithDelegate_queue___block_invoke_2;
    v20[3] = &unk_1E5999DA8;
    objc_copyWeak(&v21, &location);
    v11 = (void *)MEMORY[0x19F3B9AF0](v20);
    v12 = [[PRRangingClientExportedObject alloc] initWithRangingClient:v9];
    v13 = PRMakeRangingClientXPCInterface();
    v14 = PRMakeBeaconRangingServerXPCInterface();
    DaemonBackedService::connect((id *)&v9->_service._connection, @"com.apple.nearbyd.xpc.beacon", 4096, v12, v13, v14, v9->_queue, v10, v11, 1);

    v15 = [(NSXPCConnection *)v9->_service._connection remoteObjectProxyWithErrorHandler:&__block_literal_global_3];
    v19.receiver = v9;
    v19.super_class = (Class)PRBeacon;
    v16 = [(PRRangingDevice *)&v19 clientInfo];
    [v15 connectWithClientInfo:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    id v7 = v18;
  }

  return v9;
}

void __35__PRBeacon_initWithDelegate_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained deamonConnectionInvalidated];
}

void __35__PRBeacon_initWithDelegate_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained deamonConnectionInterrupted];
}

- (void)startBeaconingWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(NSXPCConnection *)self->_service._connection remoteObjectProxyWithErrorHandler:&__block_literal_global_3];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PRBeacon_startBeaconingWithOptions___block_invoke;
  v6[3] = &unk_1E599A1F0;
  objc_copyWeak(&v7, &location);
  [v5 startBeaconing:1 options:v4 reply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__PRBeacon_startBeaconingWithOptions___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v9 = v5;
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained(WeakRetained + 4);
      [v8 beacon:v7 didFailWithError:v9];
    }
    id v5 = v9;
  }
}

- (void)stopBeaconing
{
  v3 = [(NSXPCConnection *)self->_service._connection remoteObjectProxyWithErrorHandler:&__block_literal_global_3];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__PRBeacon_stopBeaconing__block_invoke;
  v4[3] = &unk_1E599A1F0;
  objc_copyWeak(&v5, &location);
  [v3 stopBeaconing:1 reply:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __25__PRBeacon_stopBeaconing__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v9 = v5;
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained(WeakRetained + 4);
      [v8 beacon:v7 didFailWithError:v9];
    }
    id v5 = v9;
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_service._connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRBeacon;
  [(PRBeacon *)&v3 dealloc];
}

- (void)deamonConnectionInterrupted
{
  objc_super v3 = [(NSXPCConnection *)self->_service._connection remoteObjectProxyWithErrorHandler:&__block_literal_global_3];
  v5.receiver = self;
  v5.super_class = (Class)PRBeacon;
  id v4 = [(PRRangingDevice *)&v5 clientInfo];
  [v3 connectWithClientInfo:v4];
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PRBeacon_didFailWithError___block_invoke;
  v7[3] = &unk_1E5999E20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatchAsyncOnQueue(queue, v7);
}

void __29__PRBeacon_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained beacon:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  if (a3 <= 4) {
    -[PRBeacon _updateState:](self, "_updateState:", qword_19E02CE78[a3], a4);
  }
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  kdebug_trace();
  if (objc_opt_respondsToSelector()) {
    [WeakRetained beacon:self didOutputRangeResults:v5];
  }
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  if (a3 <= 3) {
    [(PRBeacon *)self _updateState:qword_19E02CEA0[a3]];
  }
}

- (void)_updateState:(unint64_t)a3
{
  self->_state = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained beacon:self didChangeState:a3];
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (PRBeaconDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRBeaconDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  connection = self->_service._connection;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end