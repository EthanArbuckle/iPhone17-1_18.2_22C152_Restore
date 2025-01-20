@interface TUReportingControllerXPCClient
+ (NSXPCInterface)reportingControllerServerXPCInterface;
+ (TUReportingControllerXPCServer)asynchronousServer;
+ (TUReportingControllerXPCServer)synchronousServer;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUReportingControllerXPCClient)init;
- (id)serverWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)didCleanUpForStream:(int64_t)a3 reply:(id)a4;
- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5;
- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5;
- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4 reply:(id)a5;
- (void)setXpcConnection:(id)a3;
@end

@implementation TUReportingControllerXPCClient

+ (TUReportingControllerXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_3);

  return (TUReportingControllerXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUReportingControllerXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_3);

  return (TUReportingControllerXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

- (TUReportingControllerXPCClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUReportingControllerXPCClient;
  v2 = [(TUReportingControllerXPCClient *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.reportingcontrollerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUReportingControllerXPCClient;
  [(TUReportingControllerXPCClient *)&v3 dealloc];
}

- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4 reply:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v17 = a3;
    __int16 v18 = 2048;
    uint64_t v19 = a4;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "registeredStream: %ld withAvailability: %ld", buf, 0x16u);
  }

  v10 = [(TUReportingControllerXPCClient *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__TUReportingControllerXPCClient_registeredStream_withAvailability_reply___block_invoke;
  v12[3] = &unk_1E58E7938;
  id v13 = v8;
  int64_t v14 = a3;
  int v15 = a4;
  v12[4] = self;
  id v11 = v8;
  dispatch_async(v10, v12);
}

void __74__TUReportingControllerXPCClient_registeredStream_withAvailability_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverWithErrorHandler:&__block_literal_global_36];
  [v2 registeredStream:*(void *)(a1 + 48) withAvailability:*(unsigned int *)(a1 + 56) reply:*(void *)(a1 + 40)];
}

void __74__TUReportingControllerXPCClient_registeredStream_withAvailability_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __74__TUReportingControllerXPCClient_registeredStream_withAvailability_reply___block_invoke_2_cold_1();
  }
}

- (void)didCleanUpForStream:(int64_t)a3 reply:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v14 = a3;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "didCleanUpForStream: %ld", buf, 0xCu);
  }

  id v8 = [(TUReportingControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TUReportingControllerXPCClient_didCleanUpForStream_reply___block_invoke;
  block[3] = &unk_1E58E7960;
  id v11 = v6;
  int64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __60__TUReportingControllerXPCClient_didCleanUpForStream_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverWithErrorHandler:&__block_literal_global_6_0];
  [v2 didCleanUpForStream:*(void *)(a1 + 48) reply:*(void *)(a1 + 40)];
}

void __60__TUReportingControllerXPCClient_didCleanUpForStream_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__TUReportingControllerXPCClient_didCleanUpForStream_reply___block_invoke_2_cold_1();
  }
}

- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v19 = a3;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "didStartRequestForStream: %ld transactionID: %@", buf, 0x16u);
  }

  id v11 = [(TUReportingControllerXPCClient *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__TUReportingControllerXPCClient_didStartRequestForStream_withTransactionID_reply___block_invoke;
  v14[3] = &unk_1E58E62E8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

void __83__TUReportingControllerXPCClient_didStartRequestForStream_withTransactionID_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverWithErrorHandler:&__block_literal_global_8];
  [v2 didStartRequestForStream:*(void *)(a1 + 56) withTransactionID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __83__TUReportingControllerXPCClient_didStartRequestForStream_withTransactionID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__TUReportingControllerXPCClient_didCleanUpForStream_reply___block_invoke_2_cold_1();
  }
}

- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v19 = a3;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "didReceiveResultsForStream: %ld transactionID: %@", buf, 0x16u);
  }

  id v11 = [(TUReportingControllerXPCClient *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__TUReportingControllerXPCClient_didReceiveResultsForStream_withTransactionID_reply___block_invoke;
  v14[3] = &unk_1E58E62E8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

void __85__TUReportingControllerXPCClient_didReceiveResultsForStream_withTransactionID_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverWithErrorHandler:&__block_literal_global_10_1];
  [v2 didReceiveResultsForStream:*(void *)(a1 + 56) withTransactionID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __85__TUReportingControllerXPCClient_didReceiveResultsForStream_withTransactionID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__TUReportingControllerXPCClient_didCleanUpForStream_reply___block_invoke_2_cold_1();
  }
}

- (NSXPCConnection)xpcConnection
{
  objc_super v3 = [(TUReportingControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.reportingcontroller" options:0];
    id v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    v7 = +[TUReportingControllerXPCClient reportingControllerServerXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__TUReportingControllerXPCClient_xpcConnection__block_invoke;
    v11[3] = &unk_1E58E5C50;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__TUReportingControllerXPCClient_xpcConnection__block_invoke_13;
    v9[3] = &unk_1E58E5C50;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v9];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __47__TUReportingControllerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__TUReportingControllerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __47__TUReportingControllerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "reporting controller xpc connection invalidated (client side)", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;
}

void __47__TUReportingControllerXPCClient_xpcConnection__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained queue];
    dispatch_async(v2, &__block_literal_global_16_2);

    id WeakRetained = v3;
  }
}

void __47__TUReportingControllerXPCClient_xpcConnection__block_invoke_2_14()
{
  v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "reporting controller provider XPC connection interrupted (client side)", v1, 2u);
  }
}

- (id)serverWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TUReportingControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_3);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v9 = [(TUReportingControllerXPCClient *)self xpcConnection];
    id v8 = [v9 remoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TUReportingControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_3);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v9 = [(TUReportingControllerXPCClient *)self xpcConnection];
    id v8 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

+ (NSXPCInterface)reportingControllerServerXPCInterface
{
  if (reportingControllerServerXPCInterface_onceToken != -1) {
    dispatch_once(&reportingControllerServerXPCInterface_onceToken, &__block_literal_global_18_0);
  }
  id v2 = (void *)reportingControllerServerXPCInterface_reportingControllerServerXPCInterface;

  return (NSXPCInterface *)v2;
}

uint64_t __71__TUReportingControllerXPCClient_reportingControllerServerXPCInterface__block_invoke()
{
  reportingControllerServerXPCInterface_reportingControllerServerXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED3FFB0];

  return MEMORY[0x1F41817F8]();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __74__TUReportingControllerXPCClient_registeredStream_withAvailability_reply___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error reporting captured stream token: %@", v2, v3, v4, v5, v6);
}

void __60__TUReportingControllerXPCClient_didCleanUpForStream_reply___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error reporting moments stream token: %@", v2, v3, v4, v5, v6);
}

@end