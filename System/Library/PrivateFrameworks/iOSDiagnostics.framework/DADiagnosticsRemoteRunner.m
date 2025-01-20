@interface DADiagnosticsRemoteRunner
- (BOOL)_establishConnection;
- (DADiagnosticsRemoteRunner)initWithDelegate:(id)a3;
- (DADiagnosticsRemoteRunnerDelegate)delegate;
- (DARemoteRunnerServerProtocol)remoteRunnerServer;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)diagsAliveCheckQueue;
- (void)cancelTestWithID:(id)a3 completion:(id)a4;
- (void)createRemoteRunnerDeviceWithSerialNumber:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)destroyRemoteRunnerDeviceWithCompletion:(id)a3;
- (void)getReportWithCompletion:(id)a3;
- (void)getReportWithComponents:(id)a3 completion:(id)a4;
- (void)ping:(id)a3;
- (void)remoteRunnerDeviceEnded;
- (void)requestAsset:(id)a3 completion:(id)a4;
- (void)requestUploadAssets:(id)a3 completion:(id)a4;
- (void)runTestWithID:(id)a3 name:(id)a4 description:(id)a5 parameters:(id)a6 completion:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setDiagsAliveCheckQueue:(id)a3;
- (void)setRemoteRunnerServer:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation DADiagnosticsRemoteRunner

- (DADiagnosticsRemoteRunner)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DADiagnosticsRemoteRunner;
  v5 = [(DADiagnosticsRemoteRunner *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(DADiagnosticsRemoteRunner *)v5 setDelegate:v4];
    if (![(DADiagnosticsRemoteRunner *)v6 _establishConnection])
    {

      v6 = 0;
    }
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(DADiagnosticsRemoteRunner *)self xpcConnection];

  if (v3)
  {
    id v4 = [(DADiagnosticsRemoteRunner *)self xpcConnection];
    [v4 suspend];

    v5 = [(DADiagnosticsRemoteRunner *)self xpcConnection];
    [v5 invalidate];

    [(DADiagnosticsRemoteRunner *)self setXpcConnection:0];
  }
  [(DADiagnosticsRemoteRunner *)self setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)DADiagnosticsRemoteRunner;
  [(DADiagnosticsRemoteRunner *)&v6 dealloc];
}

- (BOOL)_establishConnection
{
  v41[6] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.diagnostics.remote-runner-service" options:4096];
  v21 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ED24878];
  v3 = (void *)MEMORY[0x263EFFA08];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v41[2] = objc_opt_class();
  v41[3] = objc_opt_class();
  v41[4] = objc_opt_class();
  v41[5] = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:6];
  v5 = [v3 setWithArray:v4];
  [v21 setClasses:v5 forSelector:sel_runTestWithID_name_description_parameters_completion_ argumentIndex:3 ofReply:0];

  objc_super v6 = (void *)MEMORY[0x263EFFA08];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v40[2] = objc_opt_class();
  v40[3] = objc_opt_class();
  v40[4] = objc_opt_class();
  v40[5] = objc_opt_class();
  v40[6] = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:7];
  objc_super v8 = [v6 setWithArray:v7];
  [v21 setClasses:v8 forSelector:sel_runTestWithID_name_description_parameters_completion_ argumentIndex:0 ofReply:1];

  [v2 setRemoteObjectInterface:v21];
  v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ED24930];
  [v2 setExportedInterface:v9];
  [v2 setExportedObject:self];
  [v2 activate];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  objc_initWeak(&location, self);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke;
  v31[3] = &unk_264DB5A70;
  v31[4] = &v34;
  objc_copyWeak(&v32, &location);
  v10 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v31];
  if (v10 && !v35[5])
  {
    v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Diagnostics.RemoteRunnerCheckQueue", MEMORY[0x263EF83A8]);
    diagsAliveCheckQueue = self->_diagsAliveCheckQueue;
    self->_diagsAliveCheckQueue = v12;

    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
    v14 = self->_diagsAliveCheckQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke_2;
    block[3] = &unk_264DB5AC0;
    id v15 = v10;
    id v23 = v15;
    v24 = &v25;
    dispatch_async(v14, block);
    v16 = v26[5];
    dispatch_time_t v17 = dispatch_time(0, 2000000000);
    intptr_t v18 = dispatch_semaphore_wait(v16, v17);
    BOOL v11 = v18 == 0;
    if (!v18)
    {
      [(DADiagnosticsRemoteRunner *)self setXpcConnection:v2];
      [(DADiagnosticsRemoteRunner *)self setRemoteRunnerServer:v15];
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v34, 8);

  return v11;
}

void __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v6 = [WeakRetained delegate];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v4);
    objc_super v8 = [v7 delegate];
    [v8 remoteRunnerConnectionEndedWithError:v10];

    id v9 = objc_loadWeakRetained(v4);
    [v9 setXpcConnection:0];
  }
}

uint64_t __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke_3;
  v3[3] = &unk_264DB5A98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 ping:v3];
}

intptr_t __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (void)cancelTestWithID:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];

  if (v7)
  {
    objc_super v8 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];
    [v8 cancelTestWithID:v9 completion:v6];
  }
}

- (void)createRemoteRunnerDeviceWithSerialNumber:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];

  if (v7)
  {
    objc_super v8 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];
    [v8 createRemoteRunnerDeviceWithSerialNumber:v9 completion:v6];
  }
}

- (void)destroyRemoteRunnerDeviceWithCompletion:(id)a3
{
  id v6 = a3;
  id v4 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];

  if (v4)
  {
    v5 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];
    [v5 destroyRemoteRunnerDeviceWithCompletion:v6];
  }
}

- (void)getReportWithComponents:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];

  if (v6 && v7)
  {
    objc_super v8 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];
    [v8 getReportWithComponents:v9 completion:v6];
  }
}

- (void)getReportWithCompletion:(id)a3
{
  id v6 = a3;
  id v4 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];

  if (v6 && v4)
  {
    v5 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];
    [v5 getReportWithCompletion:v6];
  }
}

- (void)runTestWithID:(id)a3 name:(id)a4 description:(id)a5 parameters:(id)a6 completion:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];

  if (v18 && v16)
  {
    dispatch_time_t v17 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];
    [v17 runTestWithID:v18 name:v12 description:v13 parameters:v14 completion:v15];
  }
}

- (void)ping:(id)a3
{
  id v6 = a3;
  id v4 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];

  if (v4)
  {
    v5 = [(DADiagnosticsRemoteRunner *)self remoteRunnerServer];
    [v5 ping:v6];
  }
}

- (void)remoteRunnerDeviceEnded
{
  v3 = [(DADiagnosticsRemoteRunner *)self delegate];

  if (v3)
  {
    id v4 = [(DADiagnosticsRemoteRunner *)self delegate];
    [v4 remoteRunnerDeviceEnded];
  }
}

- (void)requestAsset:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = [(DADiagnosticsRemoteRunner *)self delegate];

  if (v7)
  {
    objc_super v8 = [(DADiagnosticsRemoteRunner *)self delegate];
    [v8 requestAsset:v9 completion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)requestUploadAssets:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void *, void *))a4;
  id v7 = [(DADiagnosticsRemoteRunner *)self delegate];

  if (v7)
  {
    objc_super v8 = [(DADiagnosticsRemoteRunner *)self delegate];
    [v8 requestUploadAssets:v9 completion:v6];
  }
  else
  {
    objc_super v8 = [MEMORY[0x263F087E8] errorWithDomain:@"DADiagnosticsRemoteRunner" code:-6 userInfo:0];
    v6[2](v6, &unk_26ED23570, v8);
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (DARemoteRunnerServerProtocol)remoteRunnerServer
{
  return (DARemoteRunnerServerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoteRunnerServer:(id)a3
{
}

- (DADiagnosticsRemoteRunnerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DADiagnosticsRemoteRunnerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)diagsAliveCheckQueue
{
  return self->_diagsAliveCheckQueue;
}

- (void)setDiagsAliveCheckQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagsAliveCheckQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteRunnerServer, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end