@interface PRGenericRangingSession
- (BOOL)startP2PRanging:(id)a3 error:(id *)a4;
- (BOOL)stopP2PRanging:(id)a3 error:(id *)a4;
- (PRGenericRangingSession)initWithDelegate:(id)a3 queue:(id)a4;
- (PRGenericRangingSessionDelegate)delegate;
- (id)remoteObject;
- (id)synchronousRemoteObject;
- (void)configureForP2PRanging:(id)a3 options:(id)a4;
- (void)connectToDaemon;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)handleInterruption;
- (void)handleInvalidation;
- (void)invalidate;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PRGenericRangingSession

- (PRGenericRangingSession)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PRGenericRangingSession.m", 27, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PRGenericRangingSession;
  v9 = [(PRRangingDevice *)&v16 init];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.nearbyd", "client");
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    if (v8) {
      dispatch_queue_t v12 = (dispatch_queue_t)v8;
    }
    else {
      dispatch_queue_t v12 = dispatch_queue_create("com.apple.nearbyd.daemonSession", 0);
    }
    sessionQueue = v9->_sessionQueue;
    v9->_sessionQueue = (OS_dispatch_queue *)v12;

    [(PRGenericRangingSession *)v9 connectToDaemon];
  }

  return v9;
}

- (void)invalidate
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
}

- (void)connectToDaemon
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nearbyd.xpc.ranging" options:4096];
  connection = self->_connection;
  self->_connection = v3;

  v5 = self->_connection;
  v6 = PRMakeRangingClientXPCInterface();
  [(NSXPCConnection *)v5 setExportedInterface:v6];

  id v7 = self->_connection;
  id v8 = [[PRRangingClientExportedObject alloc] initWithRangingClient:self];
  [(NSXPCConnection *)v7 setExportedObject:v8];

  v9 = self->_connection;
  os_log_t v10 = PRMakeRangingServerXPCInterface();
  [(NSXPCConnection *)v9 setRemoteObjectInterface:v10];

  [(NSXPCConnection *)self->_connection _setQueue:self->_sessionQueue];
  objc_initWeak(&location, self);
  v11 = self->_connection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__PRGenericRangingSession_connectToDaemon__block_invoke;
  v18[3] = &unk_1E5999CA0;
  objc_copyWeak(&v19, &location);
  [(NSXPCConnection *)v11 setInterruptionHandler:v18];
  dispatch_queue_t v12 = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__PRGenericRangingSession_connectToDaemon__block_invoke_2;
  v16[3] = &unk_1E5999CA0;
  objc_copyWeak(&v17, &location);
  [(NSXPCConnection *)v12 setInvalidationHandler:v16];
  [(NSXPCConnection *)self->_connection resume];
  v13 = [(PRGenericRangingSession *)self remoteObject];
  v15.receiver = self;
  v15.super_class = (Class)PRGenericRangingSession;
  v14 = [(PRRangingDevice *)&v15 clientInfo];
  [v13 connectWithClientInfo:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __42__PRGenericRangingSession_connectToDaemon__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleInterruption];
}

void __42__PRGenericRangingSession_connectToDaemon__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleInvalidation];
}

- (void)handleInterruption
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_DaemonInterrup.isa, a2);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v5 = logger;
    v6 = [(NSXPCConnection *)connection debugDescription];
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19DFF5000, v5, OS_LOG_TYPE_DEFAULT, "connection was interrupted: %@", buf, 0xCu);
  }
  id v7 = [(PRGenericRangingSession *)self remoteObject];
  v9.receiver = self;
  v9.super_class = (Class)PRGenericRangingSession;
  id v8 = [(PRRangingDevice *)&v9 clientInfo];
  [v7 connectWithClientInfo:v8];
}

- (void)handleInvalidation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_DaemonInvalida.isa, a2);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v5 = logger;
    v6 = [(NSXPCConnection *)connection debugDescription];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_19DFF5000, v5, OS_LOG_TYPE_DEFAULT, "connection was invalidated: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)remoteObject
{
  connection = self->_connection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PRGenericRangingSession_remoteObject__block_invoke;
  v5[3] = &unk_1E5999CC8;
  v5[4] = self;
  v3 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];
  return v3;
}

void __39__PRGenericRangingSession_remoteObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  NSLog(&cfstr_Remoteobjectpr.isa, v3);
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19DFF5000, v4, OS_LOG_TYPE_DEFAULT, "Error getting remote object proxy %@", buf, 0xCu);
  }
}

- (id)synchronousRemoteObject
{
  connection = self->_connection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PRGenericRangingSession_synchronousRemoteObject__block_invoke;
  v5[3] = &unk_1E5999CC8;
  v5[4] = self;
  id v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v5];
  return v3;
}

void __50__PRGenericRangingSession_synchronousRemoteObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  NSLog(&cfstr_Synchronousrem.isa, v3);
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19DFF5000, v4, OS_LOG_TYPE_DEFAULT, "Error getting synchronous remote object proxy %@", buf, 0xCu);
  }
}

- (void)didFailWithError:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained didFailWithError:v4];
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained didReceiveNewSolutions:v5];
  }
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained remoteDevice:v7 didChangeState:a4];
  }
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained rangingRequestDidUpdateStatus:a3];
  }
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained rangingServiceDidUpdateState:a3 cause:a4];
  }
}

- (void)configureForP2PRanging:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(PRGenericRangingSession *)self remoteObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PRGenericRangingSession_configureForP2PRanging_options___block_invoke;
  v9[3] = &unk_1E5999C50;
  objc_copyWeak(&v10, &location);
  [v8 configureForP2PRanging:v6 options:v7 reply:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__PRGenericRangingSession_configureForP2PRanging_options___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v9 = v5;
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained(WeakRetained + 5);
      [v8 didFailWithError:v9];
    }
    id v5 = v9;
  }
}

- (BOOL)startP2PRanging:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  objc_super v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  id v7 = [(PRGenericRangingSession *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PRGenericRangingSession_startP2PRanging_error___block_invoke;
  v10[3] = &unk_1E5999E48;
  v10[4] = &v11;
  v10[5] = &v17;
  [v7 startP2PRanging:v6 reply:v10];

  if (a4) {
    *a4 = (id) v12[5];
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __49__PRGenericRangingSession_startP2PRanging_error___block_invoke(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)stopP2PRanging:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  objc_super v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  id v7 = [(PRGenericRangingSession *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__PRGenericRangingSession_stopP2PRanging_error___block_invoke;
  v10[3] = &unk_1E5999E48;
  v10[4] = &v11;
  v10[5] = &v17;
  [v7 stopP2PRanging:v6 reply:v10];

  if (a4) {
    *a4 = (id) v12[5];
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __48__PRGenericRangingSession_stopP2PRanging_error___block_invoke(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (PRGenericRangingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRGenericRangingSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end