@interface MXCore
+ (id)sharedCore;
- (BOOL)_canSetupXpcListenerForSourceData;
- (BOOL)_shouldDeliverToClientForBundleID:(id)a3;
- (BOOL)isAppExtension:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MXBundleUtilProtocol)bundleUtil;
- (MXCleanUtil)cleanUtil;
- (MXClientUtilProtocol)clientUtil;
- (MXCore)init;
- (MXCoreHandler)handler;
- (MXDeliveryDataCacherProtocol)deliveryDataCacher;
- (MXDeliveryPathUtilProtocol)deliveryPathUtil;
- (MXSource)source;
- (NSString)currentDataActivityDate;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)iVarQueue;
- (OS_dispatch_queue)requestQueue;
- (OS_os_log)MXCoreLogHandle;
- (OS_os_log)MXCoreXcodeSupportLogHandle;
- (id)_getDailyActivityCriteria;
- (id)_getDummyDiagnosticPayloadForClient:(id)a3 dateString:(id)a4;
- (id)_getDummyPayloadForClient:(id)a3 dateString:(id)a4;
- (void)_canSetupXpcListenerForSourceData;
- (void)_deliverDummyPayloadForXcodeClient:(id)a3;
- (void)_initIvar;
- (void)_initLogHandle;
- (void)_initQueue;
- (void)_performDataActivity;
- (void)_registerClient;
- (void)_registerClientAndTeam;
- (void)_registerXpcActivityForCore;
- (void)_scheduleDataActivity;
- (void)_setupDailyActivityCriteriaForDataActivity:(id)a3;
- (void)_setupExportedInterfaceForConnection:(id)a3;
- (void)_setupHandlersForConnection:(id)a3;
- (void)_setupRemoteInterfaceForConnection:(id)a3;
- (void)_startListenClientXPC;
- (void)_writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6;
- (void)clientDidRegisterForBundleID:(id)a3;
- (void)clientIsAvailableForPreparingDataActivity;
- (void)clientIsNotAvailable;
- (void)metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics:(id)a3;
- (void)retrieveDiagnostics;
- (void)retrieveMetrics;
- (void)setBundleUtil:(id)a3;
- (void)setCleanUtil:(id)a3;
- (void)setClientUtil:(id)a3;
- (void)setCurrentDataActivityDate:(id)a3;
- (void)setDeliveryDataCacher:(id)a3;
- (void)setDeliveryPathUtil:(id)a3;
- (void)setIVarQueue:(id)a3;
- (void)setMXCoreLogHandle:(id)a3;
- (void)setMXCoreXcodeSupportLogHandle:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setSource:(id)a3;
- (void)setXpcListener:(id)a3;
@end

@implementation MXCore

void __31__MXCore__scheduleDataActivity__block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  v3 = (void *)MEMORY[0x230F4EDA0]();
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    [*(id *)(a1 + 32) _performDataActivity];
  }
  else if (!state)
  {
    [*(id *)(a1 + 32) _setupDailyActivityCriteriaForDataActivity:activity];
  }
}

- (void)_setupDailyActivityCriteriaForDataActivity:(id)a3
{
  v4 = (_xpc_activity_s *)a3;
  xpc_object_t v5 = xpc_activity_copy_criteria(v4);
  if (!v5)
  {
    v6 = [(MXCore *)self MXCoreLogHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22BB49000, v6, OS_LOG_TYPE_DEFAULT, "Setting daily activity criteria", v8, 2u);
    }

    v7 = [(MXCore *)self _getDailyActivityCriteria];
    xpc_activity_set_criteria(v4, v7);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  requestQueue = self->_requestQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__MXCore_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_2648F6368;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(requestQueue, v9);

  return 1;
}

void __38__MXCore__setupHandlersForConnection___block_invoke_29(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) MXCoreLogHandle];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v2 = [MEMORY[0x263F08D68] currentConnection];
    v3[0] = 67109120;
    v3[1] = [v2 processIdentifier];
    _os_log_impl(&dword_22BB49000, v1, OS_LOG_TYPE_INFO, "Connection to %d invalidated\n", (uint8_t *)v3, 8u);
  }
}

uint64_t __45__MXCore_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) MXCoreLogHandle];
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

- (void)_setupRemoteInterfaceForConnection:(id)a3
{
  int v3 = (void *)MEMORY[0x263F08D80];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_26DF25F68];
  [v4 setRemoteObjectInterface:v5];

  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 remoteObjectInterface];
  [v11 setClasses:v13 forSelector:sel_deliverMetricPayload_ argumentIndex:0 ofReply:0];

  v12 = [v4 remoteObjectInterface];

  [v12 setClasses:v10 forSelector:sel_deliverDiagnosticPayload_ argumentIndex:0 ofReply:0];
}

- (void)_setupHandlersForConnection:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__MXCore__setupHandlersForConnection___block_invoke;
  v6[3] = &unk_2648F6340;
  v6[4] = self;
  id v4 = a3;
  [v4 setInterruptionHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __38__MXCore__setupHandlersForConnection___block_invoke_29;
  v5[3] = &unk_2648F6340;
  v5[4] = self;
  [v4 setInvalidationHandler:v5];
}

- (void)_setupExportedInterfaceForConnection:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08D80];
  id v6 = a3;
  id v5 = [v4 interfaceWithProtocol:&unk_26DF236F8];
  [v6 setExportedInterface:v5];

  [v6 setExportedObject:self];
}

- (void)_registerClient
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_22BB49000, log, OS_LOG_TYPE_ERROR, "Bundle %@ is not codesigned", (uint8_t *)&v1, 0xCu);
}

- (MXCoreHandler)handler
{
  return (MXCoreHandler *)objc_getProperty(self, a2, 64, 1);
}

- (void)retrieveMetrics
{
  uint64_t v3 = [MEMORY[0x263F08D68] currentConnection];
  id v4 = [(MXCore *)self bundleUtil];
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  id v5 = [v4 bundleIDFromAuditToken:v9];

  if ([(MXCore *)self _shouldDeliverToClientForBundleID:v5])
  {
    id v6 = [(MXCore *)self handler];
    uint64_t v7 = [v6 metricsForBundleID:v5];

    if (v7)
    {
      v8 = [v3 remoteObjectProxy];
      [v8 deliverMetricPayload:v7];
    }
  }
  else
  {
    [v3 invalidate];
  }
}

- (void)retrieveDiagnostics
{
  int v1 = [a1 bundleUtil];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_22BB49000, v2, v3, "Bundle Util: %@", v4, v5, v6, v7, v8);
}

- (OS_os_log)MXCoreLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)_shouldDeliverToClientForBundleID:(id)a3
{
  return [(MXCoreHandler *)self->_handler shouldDeliverDataForBundleID:a3];
}

- (MXSource)source
{
  return (MXSource *)objc_getProperty(self, a2, 104, 1);
}

- (void)clientIsAvailableForPreparingDataActivity
{
  if ([(MXCore *)self _canSetupXpcListenerForSourceData])
  {
    [(MXCore *)self _scheduleDataActivity];
  }
}

- (void)_scheduleDataActivity
{
  MXCoreLogHandle = self->_MXCoreLogHandle;
  if (os_log_type_enabled(MXCoreLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22BB49000, MXCoreLogHandle, OS_LOG_TYPE_DEFAULT, "Scheduling data activity\n", buf, 2u);
  }
  uint64_t v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __31__MXCore__scheduleDataActivity__block_invoke;
  handler[3] = &unk_2648F6400;
  handler[4] = self;
  xpc_activity_register("com.apple.metrickitd.data", v4, handler);
}

- (BOOL)_canSetupXpcListenerForSourceData
{
  uint64_t v3 = +[MXSource sharedSource];
  source = self->_source;
  self->_source = v3;

  MXCoreLogHandle = self->_MXCoreLogHandle;
  if (os_log_type_enabled(MXCoreLogHandle, OS_LOG_TYPE_DEBUG)) {
    [(MXCore *)(uint64_t)&self->_source _canSetupXpcListenerForSourceData];
  }
  v12 = self->_source;
  if (!v12 && os_log_type_enabled((os_log_t)self->_MXCoreLogHandle, OS_LOG_TYPE_ERROR)) {
    -[MXCore _canSetupXpcListenerForSourceData]();
  }
  return v12 != 0;
}

+ (id)sharedCore
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__MXCore_sharedCore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCore_onceToken != -1) {
    dispatch_once(&sharedCore_onceToken, block);
  }
  uint64_t v2 = (void *)sharedCore_result;

  return v2;
}

uint64_t __20__MXCore_sharedCore__block_invoke(uint64_t a1)
{
  sharedCore_result = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (MXCore)init
{
  v11.receiver = self;
  v11.super_class = (Class)MXCore;
  uint64_t v2 = [(MXCore *)&v11 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(MXCore *)v2 _initLogHandle];
    [(MXCore *)v3 _initQueue];
    [(MXCore *)v3 _initIvar];
    [(MXCore *)v3 _startListenClientXPC];
    if (![(MXCore *)v3 _canSetupXpcListenerForSourceData])
    {
      uint64_t v7 = 0;
      goto LABEL_8;
    }
    uint64_t v4 = [(MXCore *)v3 clientUtil];
    int v5 = [v4 hasAnyClient];

    if (v5)
    {
      iVarQueue = v3->_iVarQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __14__MXCore_init__block_invoke;
      block[3] = &unk_2648F6340;
      uint64_t v10 = v3;
      dispatch_async(iVarQueue, block);
    }
    [(MXCore *)v3 _registerXpcActivityForCore];
  }
  uint64_t v7 = v3;
LABEL_8:

  return v7;
}

uint64_t __14__MXCore_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleDataActivity];
}

- (void)_initLogHandle
{
  uint64_t v3 = (OS_os_log *)os_log_create("com.apple.metrickit.core", "");
  p_MXCoreLogHandle = (os_log_t *)&self->_MXCoreLogHandle;
  MXCoreLogHandle = self->_MXCoreLogHandle;
  self->_MXCoreLogHandle = v3;

  if (!self->_MXCoreLogHandle) {
    objc_storeStrong((id *)&self->_MXCoreLogHandle, &_os_log_internal);
  }
  os_log_t v6 = os_log_create("com.apple.metrickit.core.xcodesupport", "");
  MXCoreXcodeSupportLogHandle = self->_MXCoreXcodeSupportLogHandle;
  p_MXCoreXcodeSupportLogHandle = (id *)&self->_MXCoreXcodeSupportLogHandle;
  id *p_MXCoreXcodeSupportLogHandle = v6;

  if (!*p_MXCoreXcodeSupportLogHandle) {
    objc_storeStrong(p_MXCoreXcodeSupportLogHandle, &_os_log_internal);
  }
  uint64_t v9 = *p_MXCoreLogHandle;
  if (os_log_type_enabled(*p_MXCoreLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_22BB49000, v9, OS_LOG_TYPE_DEFAULT, "Initializing MXCore\n", v10, 2u);
  }
}

- (void)_initQueue
{
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metrickitd.requestqueue", v3);
  requestQueue = self->_requestQueue;
  self->_requestQueue = v4;

  uint64_t v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  os_log_t v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metrickitd.ivarqueue", v8);
  iVarQueue = self->_iVarQueue;
  self->_iVarQueue = v6;
}

- (void)_startListenClientXPC
{
  iVarQueue = self->_iVarQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__MXCore__startListenClientXPC__block_invoke;
  block[3] = &unk_2648F6340;
  void block[4] = self;
  dispatch_async(iVarQueue, block);
}

void __31__MXCore__startListenClientXPC__block_invoke(uint64_t a1)
{
  int v1 = (id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) MXCoreLogHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31__MXCore__startListenClientXPC__block_invoke_cold_2();
  }

  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.metrickit.xpc"];
  [*v1 setXpcListener:v3];

  uint64_t v4 = [*v1 MXCoreLogHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __31__MXCore__startListenClientXPC__block_invoke_cold_1(v1);
  }

  id v5 = *v1;
  os_log_t v6 = [*v1 xpcListener];
  [v6 setDelegate:v5];

  uint64_t v7 = [*v1 xpcListener];
  [v7 resume];
}

- (void)_initIvar
{
  uint64_t v3 = +[MXDependencyFactory shared];
  uint64_t v4 = [v3 bundleUtil];
  bundleUtil = self->_bundleUtil;
  self->_bundleUtil = v4;

  os_log_t v6 = +[MXDependencyFactory shared];
  uint64_t v7 = [v6 deliveryPathUtil];
  deliveryPathUtil = self->_deliveryPathUtil;
  self->_deliveryPathUtil = v7;

  uint64_t v9 = +[MXDependencyFactory shared];
  uint64_t v10 = [v9 deliveryDataCacher];
  deliveryDataCacher = self->_deliveryDataCacher;
  self->_deliveryDataCacher = v10;

  v12 = +[MXDependencyFactory shared];
  id v13 = [v12 clientUtil];
  clientUtil = self->_clientUtil;
  self->_clientUtil = v13;

  v15 = +[MXDependencyFactory shared];
  v16 = [v15 cleanUtil];
  cleanUtil = self->_cleanUtil;
  self->_cleanUtil = v16;

  id v20 = +[MXDependencyFactory shared];
  v18 = [v20 handlerForMXCoreWithDelegate:self];
  handler = self->_handler;
  self->_handler = v18;
}

- (void)_registerXpcActivityForCore
{
}

void __38__MXCore__setupHandlersForConnection___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v1 = [*(id *)(a1 + 32) MXCoreLogHandle];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = [MEMORY[0x263F08D68] currentConnection];
    v3[0] = 67109120;
    v3[1] = [v2 processIdentifier];
    _os_log_impl(&dword_22BB49000, v1, OS_LOG_TYPE_INFO, "Connection to %d interrupted\n", (uint8_t *)v3, 8u);
  }
}

- (void)_registerClientAndTeam
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22BB49000, v0, OS_LOG_TYPE_ERROR, "Bundle %@ is not codesigned", v1, 0xCu);
}

uint64_t __32__MXCore__registerClientAndTeam__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    int v1 = (void *)result;
    uint64_t v2 = [*(id *)(result + 40) handler];
    [v2 registerClientAndTeamForBundleID:v1[6] andTeamID:v1[7]];

    uint64_t v3 = (void *)v1[4];
    return [v3 invalidate];
  }
  return result;
}

- (id)_getDailyActivityCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF8180], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82A0], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF8198], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF8230], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82D8], 1);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81B8], *MEMORY[0x263EF8210]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E8]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF81F0]);

  return v2;
}

- (void)_performDataActivity
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MXCore *)self MXCoreLogHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "com.apple.metrickitd.data";
    _os_log_impl(&dword_22BB49000, v3, OS_LOG_TYPE_DEFAULT, "%s running\n", (uint8_t *)&v4, 0xCu);
  }

  [(MXCoreHandler *)self->_handler performDataActivity];
}

- (void)metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics:(id)a3
{
  id v4 = a3;
  id v5 = [(MXCore *)self iVarQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__MXCore_metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics___block_invoke;
  v7[3] = &unk_2648F6368;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __92__MXCore_metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = [*(id *)(a1 + 32) MXCoreLogHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __92__MXCore_metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics___block_invoke_cold_1();
  }

  [*(id *)(*(void *)(a1 + 32) + 64) saveMetricPayloadsToDeliveryDirectoryAndReportSuccessForClientMetrics:*(void *)(a1 + 40)];
  return [*(id *)(*(void *)(a1 + 32) + 48) cleanStaleData];
}

- (void)clientIsNotAvailable
{
}

- (void)clientDidRegisterForBundleID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08D68] currentConnection];
  id v6 = [v5 remoteObjectProxy];
  [v6 registrationProcessed];

  uint64_t v7 = [(MXCore *)self MXCoreLogHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_22BB49000, v7, OS_LOG_TYPE_DEFAULT, "New client: %@\n", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)isAppExtension:(id)a3
{
  return [(MXBundleUtilProtocol *)self->_bundleUtil isAppExtensionFromBundleID:a3];
}

- (id)_getDummyPayloadForClient:(id)a3 dateString:(id)a4
{
  return +[MXCorePayloadConstructor buildDummyPayloadForClient:a3 withDateString:a4];
}

- (id)_getDummyDiagnosticPayloadForClient:(id)a3 dateString:(id)a4
{
  return +[MXCorePayloadConstructor buildDummyDiagnosticPayloadForClient:a3 withDateString:a4];
}

- (void)_deliverDummyPayloadForXcodeClient:(id)a3
{
  id v4 = a3;
  char v5 = [(MXClientUtilProtocol *)self->_clientUtil hasClientForBundleID:v4];
  id v6 = [(MXCore *)self MXCoreXcodeSupportLogHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[MXCore _deliverDummyPayloadForXcodeClient:]();
    }

    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
    int v8 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v6 setLocale:v8];
    [v6 setDateFormat:@"yyyy-MM-dd"];
    id v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-86400.0];
    uint64_t v10 = [v6 stringFromDate:v9];

    objc_super v11 = [(MXDeliveryPathUtilProtocol *)self->_deliveryPathUtil applicationContainerPathForBundleID:v4];
    if (v11)
    {
      deliveryPathUtil = self->_deliveryPathUtil;
      id v35 = 0;
      char v13 = [(MXDeliveryPathUtilProtocol *)deliveryPathUtil createMetricDirectoryAtPath:v11 forClient:v4 withError:&v35];
      id v14 = v35;
      if ((v13 & 1) == 0)
      {
        v25 = [(MXCore *)self MXCoreXcodeSupportLogHandle];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[MXCore _deliverDummyPayloadForXcodeClient:]();
        }

        goto LABEL_22;
      }
      deliveryDataCacher = self->_deliveryDataCacher;
      v16 = [(MXCore *)self _getDummyPayloadForClient:v4 dateString:v10];
      id v34 = v14;
      char v17 = [(MXDeliveryDataCacherProtocol *)deliveryDataCacher writeMetricReport:v16 atAppContainerPath:v11 forClient:v4 withError:&v34];
      id v18 = v34;

      if ((v17 & 1) == 0)
      {
        v19 = [(MXCore *)self MXCoreXcodeSupportLogHandle];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MXCore _deliverDummyPayloadForXcodeClient:]();
        }
      }
      id v20 = [(MXCore *)self _getDummyDiagnosticPayloadForClient:v4 dateString:v10];
      if (v20)
      {
        v21 = self->_deliveryPathUtil;
        id v33 = v18;
        int v22 = [(MXDeliveryPathUtilProtocol *)v21 createDiagnosticDirectoryAtPath:v11 forClient:v4 withError:&v33];
        id v23 = v33;

        if (v22)
        {
          id v32 = v23;
          [(MXCore *)self _writeDiagnosticReport:v20 atAppContainerPath:v11 forClient:v4 withError:&v32];
          id v18 = v32;
        }
        else
        {
          id v18 = v23;
        }
      }
    }
    else
    {
      iVarQueue = self->_iVarQueue;
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      v28 = __45__MXCore__deliverDummyPayloadForXcodeClient___block_invoke;
      v29 = &unk_2648F6368;
      v30 = self;
      id v31 = v4;
      dispatch_async(iVarQueue, &v26);
    }
    [(MXDeliveryDataCacherProtocol *)self->_deliveryDataCacher notifyDataAvailableForDelivery];
LABEL_22:

    goto LABEL_23;
  }
  if (v7) {
    -[MXCore _deliverDummyPayloadForXcodeClient:].cold.4();
  }
LABEL_23:
}

void __45__MXCore__deliverDummyPayloadForXcodeClient___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientUtil];
  [v2 removeClientFromPersistenceForBundleID:*(void *)(a1 + 40)];
}

- (void)_writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  char v13 = +[MXSource sharedSource];
  char v14 = [v13 writeDiagnosticReport:v12 atAppContainerPath:v11 forClient:v10 withError:a6];

  if ((v14 & 1) == 0)
  {
    v15 = [(MXCore *)self MXCoreXcodeSupportLogHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MXCore _writeDiagnosticReport:atAppContainerPath:forClient:withError:]();
    }
  }
}

- (void)setMXCoreLogHandle:(id)a3
{
}

- (OS_os_log)MXCoreXcodeSupportLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMXCoreXcodeSupportLogHandle:(id)a3
{
}

- (void)setBundleUtil:(id)a3
{
}

- (MXDeliveryPathUtilProtocol)deliveryPathUtil
{
  return (MXDeliveryPathUtilProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeliveryPathUtil:(id)a3
{
}

- (MXDeliveryDataCacherProtocol)deliveryDataCacher
{
  return (MXDeliveryDataCacherProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeliveryDataCacher:(id)a3
{
}

- (MXCleanUtil)cleanUtil
{
  return (MXCleanUtil *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCleanUtil:(id)a3
{
}

- (MXClientUtilProtocol)clientUtil
{
  return self->_clientUtil;
}

- (void)setClientUtil:(id)a3
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

- (NSString)currentDataActivityDate
{
  return self->_currentDataActivityDate;
}

- (void)setCurrentDataActivityDate:(id)a3
{
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_currentDataActivityDate, 0);
  objc_storeStrong((id *)&self->_iVarQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);
  objc_storeStrong((id *)&self->_cleanUtil, 0);
  objc_storeStrong((id *)&self->_deliveryDataCacher, 0);
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);
  objc_storeStrong((id *)&self->_MXCoreXcodeSupportLogHandle, 0);

  objc_storeStrong((id *)&self->_MXCoreLogHandle, 0);
}

void __31__MXCore__startListenClientXPC__block_invoke_cold_1(id *a1)
{
  int v1 = [*a1 xpcListener];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_22BB49000, v2, v3, "XPC Listener: %@", v4, v5, v6, v7, v8);
}

void __31__MXCore__startListenClientXPC__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Initializing XPC Listener", v2, v3, v4, v5, v6);
}

- (void)_canSetupXpcListenerForSourceData
{
}

void __92__MXCore_metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Starting payload delivery", v2, v3, v4, v5, v6);
}

- (void)_deliverDummyPayloadForXcodeClient:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Dummy metric payload delivery: Failed to write metric report for %@ with error: %@");
}

- (void)_deliverDummyPayloadForXcodeClient:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Dummy payload delivery: Failed to create file directory for %@ with error: %@");
}

- (void)_deliverDummyPayloadForXcodeClient:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Starting xcode dummy payload delivery", v2, v3, v4, v5, v6);
}

- (void)_deliverDummyPayloadForXcodeClient:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Client %@ not found, ending dummy payload delivery", v2, v3, v4, v5, v6);
}

- (void)_writeDiagnosticReport:atAppContainerPath:forClient:withError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Dummy diagnostic payload delivery: Failed to write diagnostic report for %@ with error: %@");
}

@end