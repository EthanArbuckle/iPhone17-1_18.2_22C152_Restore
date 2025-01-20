@interface MXSource
+ (id)sharedSource;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6;
- (MXBundleUtilProtocol)bundleUtil;
- (MXPayloadValidator)payloadValidator;
- (MXSource)init;
- (MXSourceHandler)handler;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)iVarQueue;
- (OS_dispatch_queue)requestQueue;
- (OS_os_log)MXSourceLogHandle;
- (void)_initIvar;
- (void)_initLogHandle;
- (void)_initQueue;
- (void)_invalidateConnection;
- (void)_setupExportedInterfaceForConnection:(id)a3;
- (void)_setupHandlersForConnection:(id)a3;
- (void)_setupRemoteInterfaceForConnection:(id)a3;
- (void)_startListenClientXPC;
- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3;
- (void)deliverDummyPayloadForClient:(id)a3;
- (void)metricPayloadDidCacheToSourceDirectory;
- (void)setBundleUtil:(id)a3;
- (void)setIVarQueue:(id)a3;
- (void)setMXSourceLogHandle:(id)a3;
- (void)setPayloadValidator:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)writeDiagnosticDataWithPayload:(id)a3;
- (void)writeMetricDataWithPayload:(id)a3;
@end

@implementation MXSource

void __56__MXSource_cleanServiceDiagnosticsDirectoriesForClient___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  [v2 cleanServiceDiagnosticsDirectoriesForClient:*(void *)(a1 + 40)];
}

- (MXSourceHandler)handler
{
  return (MXSourceHandler *)objc_getProperty(self, a2, 32, 1);
}

- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3
{
  id v4 = a3;
  iVarQueue = self->_iVarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__MXSource_cleanServiceDiagnosticsDirectoriesForClient___block_invoke;
  v7[3] = &unk_2648F6368;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(iVarQueue, v7);
}

+ (id)sharedSource
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__MXSource_sharedSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSource_onceToken != -1) {
    dispatch_once(&sharedSource_onceToken, block);
  }
  id v2 = (void *)sharedSource_result;

  return v2;
}

uint64_t __24__MXSource_sharedSource__block_invoke(uint64_t a1)
{
  sharedSource_result = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (MXSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)MXSource;
  id v2 = [(MXSource *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MXSource *)v2 _initLogHandle];
    [(MXSource *)v3 _initQueue];
    [(MXSource *)v3 _initIvar];
    [(MXSource *)v3 _startListenClientXPC];
  }
  return v3;
}

- (void)_initLogHandle
{
  os_log_t v3 = os_log_create("com.apple.metrickit.source", "");
  MXSourceLogHandle = self->_MXSourceLogHandle;
  p_MXSourceLogHandle = (id *)&self->_MXSourceLogHandle;
  id *p_MXSourceLogHandle = v3;

  id v6 = *p_MXSourceLogHandle;
  if (!*p_MXSourceLogHandle)
  {
    objc_storeStrong(p_MXSourceLogHandle, &_os_log_internal);
    id v6 = *p_MXSourceLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22BB49000, v6, OS_LOG_TYPE_DEFAULT, "Initializing MXSource\n", v7, 2u);
  }
}

- (void)_initQueue
{
  os_log_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metrickit.source.requestqueue", v3);
  requestQueue = self->_requestQueue;
  self->_requestQueue = v4;

  id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metrickit.source.ivarqueue", v8);
  iVarQueue = self->_iVarQueue;
  self->_iVarQueue = v6;
}

- (void)_initIvar
{
  os_log_t v3 = +[MXDependencyFactory shared];
  id v4 = [v3 payloadValidator];
  payloadValidator = self->_payloadValidator;
  self->_payloadValidator = v4;

  id v6 = +[MXDependencyFactory shared];
  v7 = [v6 bundleUtil];
  bundleUtil = self->_bundleUtil;
  self->_bundleUtil = v7;

  id v11 = +[MXDependencyFactory shared];
  v9 = [v11 handlerForMXSourceWithDelegate:self];
  handler = self->_handler;
  self->_handler = v9;
}

- (void)_startListenClientXPC
{
  iVarQueue = self->_iVarQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__MXSource__startListenClientXPC__block_invoke;
  block[3] = &unk_2648F6340;
  block[4] = self;
  dispatch_async(iVarQueue, block);
}

void __33__MXSource__startListenClientXPC__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) MXSourceLogHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_22BB49000, v2, OS_LOG_TYPE_DEFAULT, "Initializing XPC Listener", (uint8_t *)&v9, 2u);
  }

  os_log_t v3 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.metrickitsource.xpc"];
  [*(id *)(a1 + 32) setXpcListener:v3];

  id v4 = [*(id *)(a1 + 32) MXSourceLogHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = [*(id *)(a1 + 32) xpcListener];
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_22BB49000, v4, OS_LOG_TYPE_DEFAULT, "XPC Listener: %@", (uint8_t *)&v9, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  v7 = [v6 xpcListener];
  [v7 setDelegate:v6];

  id v8 = [*(id *)(a1 + 32) xpcListener];
  [v8 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  requestQueue = self->_requestQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__MXSource_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_2648F6368;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(requestQueue, v9);

  return 1;
}

uint64_t __47__MXSource_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) MXSourceLogHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 40) processIdentifier];
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_22BB49000, v2, OS_LOG_TYPE_DEFAULT, "Received connection request from %d\n", (uint8_t *)v5, 8u);
  }

  [*(id *)(a1 + 32) _setupExportedInterfaceForConnection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setupRemoteInterfaceForConnection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setupHandlersForConnection:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 40) resume];
}

- (void)_setupExportedInterfaceForConnection:(id)a3
{
  int v3 = (void *)MEMORY[0x263F08D80];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_26DF22F00];
  [v4 setExportedInterface:v5];

  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v4 exportedInterface];
  [v11 setClasses:v22 forSelector:sel_writeMetricDataWithPayload_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  v20 = [v4 exportedInterface];
  [v20 setClasses:v19 forSelector:sel_writeDiagnosticDataWithPayload_ argumentIndex:0 ofReply:0];

  [v4 setExportedObject:self];
}

- (void)_setupRemoteInterfaceForConnection:(id)a3
{
  int v3 = (void *)MEMORY[0x263F08D80];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_26DF25E90];
  [v4 setRemoteObjectInterface:v5];
}

- (void)_setupHandlersForConnection:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__MXSource__setupHandlersForConnection___block_invoke;
  v6[3] = &unk_2648F6340;
  v6[4] = self;
  id v4 = a3;
  [v4 setInterruptionHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __40__MXSource__setupHandlersForConnection___block_invoke_27;
  v5[3] = &unk_2648F6340;
  v5[4] = self;
  [v4 setInvalidationHandler:v5];
}

void __40__MXSource__setupHandlersForConnection___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) MXSourceLogHandle];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    id v2 = [MEMORY[0x263F08D68] currentConnection];
    v3[0] = 67109120;
    v3[1] = [v2 processIdentifier];
    _os_log_impl(&dword_22BB49000, v1, OS_LOG_TYPE_INFO, "Connection to %d interrupted\n", (uint8_t *)v3, 8u);
  }
}

void __40__MXSource__setupHandlersForConnection___block_invoke_27(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) MXSourceLogHandle];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    id v2 = [MEMORY[0x263F08D68] currentConnection];
    v3[0] = 67109120;
    v3[1] = [v2 processIdentifier];
    _os_log_impl(&dword_22BB49000, v1, OS_LOG_TYPE_INFO, "Connection to %d invalidated\n", (uint8_t *)v3, 8u);
  }
}

- (void)writeMetricDataWithPayload:(id)a3
{
  id v4 = a3;
  if ([(MXPayloadValidator *)self->_payloadValidator validatePayload:v4])
  {
    id v5 = [(MXSource *)self MXSourceLogHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[MXSource writeMetricDataWithPayload:](v4);
    }

    iVarQueue = self->_iVarQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__MXSource_writeMetricDataWithPayload___block_invoke;
    v7[3] = &unk_2648F6368;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(iVarQueue, v7);
  }
}

void __39__MXSource_writeMetricDataWithPayload___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  [v2 handleMetricDataWithPayload:*(void *)(a1 + 40)];
}

- (void)writeDiagnosticDataWithPayload:(id)a3
{
  id v4 = a3;
  if ([(MXPayloadValidator *)self->_payloadValidator validatePayload:v4])
  {
    id v5 = [(MXSource *)self MXSourceLogHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[MXSource writeDiagnosticDataWithPayload:](v4);
    }

    iVarQueue = self->_iVarQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__MXSource_writeDiagnosticDataWithPayload___block_invoke;
    v7[3] = &unk_2648F6368;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(iVarQueue, v7);
  }
}

void __43__MXSource_writeDiagnosticDataWithPayload___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  [v2 handleDiagnosticDataWithPayload:*(void *)(a1 + 40)];
}

- (BOOL)writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  return [(MXSourceHandler *)self->_handler writeDiagnosticReport:a3 atAppContainerPath:a4 forClient:a5 withError:a6];
}

- (void)metricPayloadDidCacheToSourceDirectory
{
  [(MXSource *)self _invalidateConnection];
  id v2 = +[MXCore sharedCore];
  [v2 performDataActivity];
}

- (void)_invalidateConnection
{
  id v2 = [MEMORY[0x263F08D68] currentConnection];
  if (v2)
  {
    id v3 = v2;
    [v2 invalidate];
    id v2 = v3;
  }
}

- (void)deliverDummyPayloadForClient:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08D68] currentConnection];
  iVarQueue = self->_iVarQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__MXSource_deliverDummyPayloadForClient___block_invoke;
  block[3] = &unk_2648F6390;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(iVarQueue, block);
}

void __41__MXSource_deliverDummyPayloadForClient___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) MXSourceLogHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_3(v2, a1, v3);
  }

  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "bundleIDFromPid:", objc_msgSend(*(id *)(a1 + 40), "processIdentifier"));
  int v5 = [v4 isEqualToString:@"com.apple.dt.instruments.DVTInstrumentsFoundation"];

  uint64_t v6 = [*(id *)(a1 + 32) MXSourceLogHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_1(a1, v6);
    }

    id v8 = +[MXCore sharedCore];
    [v8 deliverDummyPayloadForXcodeClient:*(void *)(a1 + 48)];
  }
  else
  {
    if (v7) {
      __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_2(v6);
    }

    [*(id *)(a1 + 40) invalidate];
  }
}

- (OS_os_log)MXSourceLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMXSourceLogHandle:(id)a3
{
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleUtil:(id)a3
{
}

- (MXPayloadValidator)payloadValidator
{
  return (MXPayloadValidator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPayloadValidator:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (OS_dispatch_queue)iVarQueue
{
  return self->_iVarQueue;
}

- (void)setIVarQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iVarQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_payloadValidator, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);

  objc_storeStrong((id *)&self->_MXSourceLogHandle, 0);
}

- (void)writeMetricDataWithPayload:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 sourceIDString];
  id v3 = [a1 metrics];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22BB49000, v4, v5, "source : %@, metrics : %@", v6, v7, v8, v9, v10);
}

- (void)writeDiagnosticDataWithPayload:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 sourceIDString];
  id v3 = [a1 metrics];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22BB49000, v4, v5, "source : %@, diagnostics : %@", v6, v7, v8, v9, v10);
}

void __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22BB49000, a2, OS_LOG_TYPE_DEBUG, "Commencing dummy delivery per request from DTServiceHub for: %@", (uint8_t *)&v3, 0xCu);
}

void __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22BB49000, log, OS_LOG_TYPE_DEBUG, "Rejecting dummy payload delivery request", v1, 2u);
}

void __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(*(id *)(*(void *)a1 + 16), "bundleIDFromPid:", objc_msgSend(*(id *)(a2 + 40), "processIdentifier"));
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_22BB49000, a3, OS_LOG_TYPE_DEBUG, "Received dummy delivery request from: %@", (uint8_t *)&v5, 0xCu);
}

@end