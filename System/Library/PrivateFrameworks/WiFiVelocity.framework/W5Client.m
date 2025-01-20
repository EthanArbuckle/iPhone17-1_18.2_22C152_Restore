@interface W5Client
+ (id)sharedClient;
- (BOOL)__tarballWithSource:(id)a3 destination:(id)a4 error:(id *)a5;
- (BOOL)registerRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (BOOL)setDebugConfiguration:(id)a3 peer:(id)a4 error:(id *)a5;
- (BOOL)startMonitoringFaultEventsForPeer:(id)a3 eventHandler:(id)a4 error:(id *)a5;
- (BOOL)stopMonitoringFaultEventsForPeer:(id)a3 error:(id *)a4;
- (BOOL)submitFaultEvent:(id)a3 error:(id *)a4;
- (BOOL)unregisterRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (W5Client)init;
- (id)__collectBusyFallbackLogsWithReason:(id)a3 compress:(BOOL)a4;
- (id)__collectJetsamFallbackLogsWithReason:(id)a3 compress:(BOOL)a4;
- (id)__eventCallbackSignatureForEventID:(int64_t)a3 peer:(id)a4;
- (id)__mostRecentInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6;
- (id)collectLogs:(id)a3 configuration:(id)a4 update:(id)a5 receipts:(id *)a6 error:(id *)a7;
- (id)collectLogs:(id)a3 configuration:(id)a4 update:(id)a5 reply:(id)a6;
- (id)collectLogsDiagnosticMode:(id)a3 update:(id)a4 receipts:(id *)a5 error:(id *)a6;
- (id)collectLogsDiagnosticMode:(id)a3 update:(id)a4 reply:(id)a5;
- (id)eventCallback;
- (id)faultEventCacheForPeer:(id)a3 error:(id *)a4;
- (id)localPeer;
- (id)peers;
- (id)queryDebugConfigurationForPeer:(id)a3 error:(id *)a4;
- (id)queryDiagnosticsModeForPeer:(id)a3 info:(id)a4 reply:(id)a5;
- (id)queryStatusForPeer:(id)a3 error:(id *)a4;
- (id)runDiagnostics:(id)a3 configuration:(id)a4 update:(id)a5 error:(id *)a6;
- (id)runDiagnostics:(id)a3 configuration:(id)a4 update:(id)a5 reply:(id)a6;
- (id)runDiagnosticsForPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 reply:(id)a6;
- (id)runWiFiPerformanceLoggingWithConfiguration:(id)a3 error:(id *)a4;
- (id)runWiFiPerformanceLoggingWithConfiguration:(id)a3 reply:(id)a4;
- (id)runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 peer:(id)a5 error:(id *)a6;
- (id)runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6;
- (id)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6;
- (id)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 snifferErrors:(id *)a6 error:(id *)a7;
- (id)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 error:(id *)a6;
- (id)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6;
- (id)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4;
- (id)startPeerDiscoveryWithConfiguration:(id)a3 reply:(id)a4;
- (id)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5;
- (void)__cancelAllRequestsAndReply:(id)a3;
- (void)__cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)__log:(id)a3 timestamp:(BOOL)a4 reply:(id)a5;
- (void)__logsCollectedWithTemporaryURL:(id)a3 outputURL:(id)a4 keepParent:(BOOL)a5 compress:(BOOL)a6 reply:(id)a7;
- (void)__purgeFilesInDirectory:(id)a3 matching:(id)a4 maxAge:(unint64_t)a5 maxCount:(unint64_t)a6;
- (void)__queryLocalPeerAndReply:(id)a3;
- (void)__startMonitoringEvents:(id)a3 reply:(id)a4;
- (void)__stopMonitoringEvents:(id)a3 reply:(id)a4;
- (void)cancelAllRequests;
- (void)cancelRequestWithUUID:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 peer:(id)a4 type:(int64_t)a5 reply:(id)a6;
- (void)dealloc;
- (void)listFilesFromPeer:(id)a3 remoteDirPath:(id)a4 reply:(id)a5;
- (void)log:(id)a3 timestamp:(BOOL)a4;
- (void)queryDatabaseForPeer:(id)a3 fetch:(id)a4 reply:(id)a5;
- (void)queryDebugConfigurationForPeer:(id)a3 reply:(id)a4;
- (void)queryRegisteredDiagnosticsPeersWithReply:(id)a3;
- (void)queryStatusForPeer:(id)a3 reply:(id)a4;
- (void)receivedEvent:(id)a3;
- (void)receivedPeerDiscoveryEvent:(id)a3;
- (void)requestFileFromPeer:(id)a3 remoteFilePath:(id)a4 reply:(id)a5;
- (void)setDebugConfiguration:(id)a3 peer:(id)a4 reply:(id)a5;
- (void)setEventCallback:(id)a3;
- (void)startMonitoringEvents:(id)a3;
- (void)stopMonitoringEvents:(id)a3;
- (void)stopPeerDiscoveryWithUUID:(id)a3;
@end

@implementation W5Client

void __16__W5Client_init__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __16__W5Client_init__block_invoke_2;
  block[3] = &unk_2641FE7D8;
  block[4] = v1;
  dispatch_async(v1, block);
}

void __16__W5Client_init__block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    v20 = "-[W5Client init]_block_invoke_2";
    __int16 v21 = 2080;
    v22 = "W5Client.m";
    __int16 v23 = 1024;
    int v24 = 92;
    LODWORD(v13) = 28;
    v12 = &v19;
    _os_log_send_and_compose_impl();
  }
  context = dispatch_get_context(*(dispatch_object_t *)(a1 + 32));
  if (context)
  {
    v5 = context;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    if (v6 - *((double *)v5 + 3) >= 10.0)
    {
      *((double *)v5 + 3) = v6;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v7 = (void *)*((void *)v5 + 8);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v5, "startMonitoringFaultEventsForPeer:eventHandler:error:", *(void *)(*((void *)&v14 + 1) + 8 * i), objc_msgSend(*((id *)v5 + 6), "objectForKeyedSubscript:", objc_msgSend(v5, "__eventCallbackSignatureForEventID:peer:", 38, *(void *)(*((void *)&v14 + 1) + 8 * i), v12, v13)), 0);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
      if (objc_msgSend(*((id *)v5 + 4), "count", v12, v13)) {
        objc_msgSend(v5, "__startMonitoringEvents:reply:", (id)objc_msgSend(*((id *)v5 + 4), "copy"), 0);
      }
    }
  }
}

+ (id)sharedClient
{
  if (qword_26AB09F90 != -1) {
    dispatch_once(&qword_26AB09F90, &__block_literal_global_2);
  }
  return (id)_MergedGlobals_2;
}

W5Client *__24__W5Client_sharedClient__block_invoke()
{
  result = objc_alloc_init(W5Client);
  _MergedGlobals_2 = (uint64_t)result;
  return result;
}

- (W5Client)init
{
  v16.receiver = self;
  v16.super_class = (Class)W5Client;
  v2 = [(W5Client *)&v16 init];
  if (!v2) {
    goto LABEL_11;
  }
  v3 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"com.apple.wifivelocity.client.%@", objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString")), "UTF8String"];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = dispatch_queue_create(v3, v4);
  v2->_queue = (OS_dispatch_queue *)v5;
  if (!v5) {
    goto LABEL_11;
  }
  dispatch_queue_set_specific(v5, &v2->_queue, (void *)1, 0);
  double v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_mutableEventIDs = v6;
  if (!v6) {
    goto LABEL_11;
  }
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_mutableUUIDs = v7;
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  v2->_mutableFaultEventMonitoringPeers = v8;
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_mutableEventCallbackMap = v9;
  if (v9
    && (uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]),
        (v2->_mutablePeerEventCallbackMap = v10) != 0)
    && (uint64_t v11 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.wifivelocityd" options:4096], (v2->_conn = (NSXPCConnection *)v11) != 0))
  {
    [(NSXPCConnection *)v2->_conn setRemoteObjectInterface:W5XPCRequestDelegateInterface()];
    [(NSXPCConnection *)v2->_conn setExportedInterface:W5XPCEventDelegateInterface()];
    dispatch_set_context((dispatch_object_t)v2->_queue, v2);
    queue = v2->_queue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __16__W5Client_init__block_invoke;
    v15[3] = &unk_2641FE7D8;
    v15[4] = queue;
    [(NSXPCConnection *)v2->_conn setInterruptionHandler:v15];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __16__W5Client_init__block_invoke_13;
    v14[3] = &unk_2641FE7D8;
    v14[4] = queue;
    [(NSXPCConnection *)v2->_conn setInvalidationHandler:v14];
    [(NSXPCConnection *)v2->_conn resume];
  }
  else
  {
LABEL_11:

    return 0;
  }
  return v2;
}

void __16__W5Client_init__block_invoke_13(uint64_t a1)
{
}

void __16__W5Client_init__block_invoke_2_14()
{
  v0 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_conn setInvalidationHandler:0];
  [(NSXPCConnection *)self->_conn setInterruptionHandler:0];
  [(NSXPCConnection *)self->_conn invalidate];

  queue = self->_queue;
  if (queue)
  {
    label = dispatch_queue_get_label(0);
    v5 = dispatch_queue_get_label(queue);
    if (label && v5 && !strcmp(label, v5))
    {
      block[10] = MEMORY[0x263EF8330];
      block[11] = 3221225472;
      block[12] = __19__W5Client_dealloc__block_invoke;
      block[13] = &unk_2641FE7D8;
      block[14] = self;
      void block[5] = MEMORY[0x263EF8330];
      block[6] = 3221225472;
      block[7] = __19__W5Client_dealloc__block_invoke_2;
      block[8] = &unk_2641FE7D8;
      block[9] = self;
      dispatch_set_context(queue, 0);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __19__W5Client_dealloc__block_invoke_3;
      block[3] = &unk_2641FE7D8;
      block[4] = self;
      dispatch_sync(queue, block);
    }
  }

  double v6 = self->_queue;
  if (v6) {
    dispatch_release(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)W5Client;
  [(W5Client *)&v7 dealloc];
}

void __19__W5Client_dealloc__block_invoke(uint64_t a1)
{
}

void __19__W5Client_dealloc__block_invoke_2(uint64_t a1)
{
}

void __19__W5Client_dealloc__block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21669CC20]();
  dispatch_set_context(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16), 0);
}

void __19__W5Client_dealloc__block_invoke_4(uint64_t a1)
{
}

void __19__W5Client_dealloc__block_invoke_5(uint64_t a1)
{
}

- (void)setEventCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_eventCallback = (id)[a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __29__W5Client_setEventCallback___block_invoke;
    v6[3] = &unk_2641FE800;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

void __29__W5Client_setEventCallback___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21669CC20]();

  *(void *)(*(void *)(a1 + 32) + 72) = [*(id *)(a1 + 40) copy];
}

- (void)__startMonitoringEvents:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke;
  block[3] = &unk_2641FE8A0;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21669CC20]();
  if ([*(id *)(a1 + 32) count]
    && ![*(id *)(*(void *)(a1 + 40) + 32) count]
    && ![*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "setExportedObject:");
  }
  [*(id *)(*(void *)(a1 + 40) + 32) addObjectsFromArray:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(v3 + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_2;
  v11[3] = &unk_2641FE828;
  uint64_t v5 = *(void *)(a1 + 32);
  v11[4] = v3;
  v11[5] = v5;
  v11[6] = *(void *)(a1 + 48);
  double v6 = (void *)[v4 remoteObjectProxyWithErrorHandler:v11];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_5;
  v8[3] = &unk_2641FE828;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  uint64_t v10 = *(void *)(a1 + 48);
  [v6 startMonitoringEvents:v7.i64[0] reply:v8];
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_2(int8x16_t *a1, uint64_t a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  int8x16_t v2 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v3 = *(NSObject **)(a1[2].i64[0] + 16);
  v5[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_3;
  v5[3] = &unk_2641FE940;
  int8x16_t v6 = v2;
  uint64_t v4 = a1[3].i64[0];
  uint64_t v7 = a2;
  uint64_t v8 = v4;
  dispatch_async(v3, v5);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int8x16_t v2 = (void *)MEMORY[0x21669CC20]();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*(void *)(a1 + 40) + 32) removeObjectIdenticalTo:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  if (![*(id *)(*(void *)(a1 + 40) + 32) count]
    && ![*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_4;
  v9[3] = &unk_2641FE800;
  long long v10 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v9);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_4(uint64_t a1)
{
  int8x16_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_5(int8x16_t *a1, uint64_t a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  int8x16_t v2 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v3 = *(NSObject **)(a1[2].i64[0] + 16);
  v4[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_6;
  v4[3] = &unk_2641FE940;
  v4[4] = a2;
  int8x16_t v5 = v2;
  uint64_t v6 = a1[3].i64[0];
  dispatch_async(v3, v4);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_6(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int8x16_t v2 = (void *)MEMORY[0x21669CC20]();
  if (a1[4])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v3 = (void *)a1[5];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(a1[6] + 32) removeObjectIdenticalTo:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v5);
    }
    if (![*(id *)(a1[6] + 32) count] && !objc_msgSend(*(id *)(a1[6] + 40), "count")) {
      [*(id *)(a1[6] + 8) setExportedObject:0];
    }
    OSLog = W5GetOSLog();
    BOOL v9 = os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT);
    uint64_t v10 = a1[4];
    if (v9)
    {
      uint64_t v11 = a1[5];
      int v19 = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      _os_log_send_and_compose_impl();
      uint64_t v10 = a1[4];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_20;
  block[3] = &unk_2641FE800;
  uint64_t v13 = a1[7];
  block[4] = v10;
  void block[5] = v13;
  dispatch_async(global_queue, block);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_20(uint64_t a1)
{
  int8x16_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (void)startMonitoringEvents:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__W5Client_startMonitoringEvents___block_invoke;
  v7[3] = &unk_2641FE850;
  v7[4] = v5;
  [(W5Client *)self __startMonitoringEvents:a3 reply:v7];
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v9 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __34__W5Client_startMonitoringEvents___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)__stopMonitoringEvents:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke;
  block[3] = &unk_2641FE8A0;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke(uint64_t a1)
{
  int8x16_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_2;
  v7[3] = &unk_2641FE878;
  v7[4] = *(void *)(a1 + 48);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_4;
  v5[3] = &unk_2641FE828;
  void v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  [v4 stopMonitoringEvents:(void)v6 reply:v5];
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke_3(uint64_t a1)
{
  int8x16_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

__n128 __41__W5Client___stopMonitoringEvents_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_5;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke_5(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectsInArray:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 32) count]
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_6;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (void)stopMonitoringEvents:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__W5Client_stopMonitoringEvents___block_invoke;
  v7[3] = &unk_2641FE850;
  v7[4] = v5;
  [(W5Client *)self __stopMonitoringEvents:a3 reply:v7];
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v9 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __33__W5Client_stopMonitoringEvents___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)__queryLocalPeerAndReply:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke;
  v4[3] = &unk_2641FE800;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke_2;
  v6[3] = &unk_2641FE878;
  void v6[4] = *(void *)(a1 + 40);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke_4;
  v5[3] = &unk_2641FE8C8;
  void v5[4] = *(void *)(a1 + 40);
  [v4 queryLocalPeerAndReply:v5];
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke_5;
  block[3] = &unk_2641FE8A0;
  uint64_t v7 = *(void *)(a1 + 32);
  void block[5] = a3;
  void block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke_5(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (id)localPeer
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  long long v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  uint64_t v14 = 0;
  uint64_t v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __21__W5Client_localPeer__block_invoke;
  v8[3] = &unk_2641FE8F0;
  void v8[4] = v3;
  v8[5] = &v9;
  [(W5Client *)self __queryLocalPeerAndReply:v8];
  dispatch_time_t v4 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v3, v4) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v16 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v5 = (id)v10[5];
  dispatch_time_t v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

intptr_t __21__W5Client_localPeer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a3 copy];
  dispatch_time_t v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

- (id)peers
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)queryStatusForPeer:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke;
  block[3] = &unk_2641FE8A0;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(a1[4] + 32) count] && !objc_msgSend(*(id *)(a1[4] + 40), "count")) {
    objc_msgSend(*(id *)(a1[4] + 8), "setExportedObject:");
  }
  uint64_t v3 = a1[4];
  dispatch_time_t v4 = *(void **)(v3 + 8);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_2;
  v10[3] = &unk_2641FE918;
  uint64_t v5 = a1[6];
  v10[4] = v3;
  v10[5] = v5;
  dispatch_time_t v6 = (void *)[v4 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_5;
  v9[3] = &unk_2641FE968;
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  void v9[4] = a1[4];
  v9[5] = v8;
  [v6 queryStatusForPeer:v7 reply:v9];
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_3;
  block[3] = &unk_2641FE8A0;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a2;
  void block[6] = v4;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 32) count]
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, v4);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_6;
  v6[3] = &unk_2641FE940;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = v3;
  void v6[5] = a2;
  void v6[6] = a3;
  v6[7] = v5;
  dispatch_async(v4, v6);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 32) count]
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_7;
  block[3] = &unk_2641FE8A0;
  uint64_t v6 = *(void *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, block);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_7(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (id)queryStatusForPeer:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  uint64_t v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000;
  long long v18 = __Block_byref_object_copy__0;
  int v19 = __Block_byref_object_dispose__0;
  uint64_t v20 = 0;
  uint64_t v7 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__W5Client_queryStatusForPeer_error___block_invoke;
  v14[3] = &unk_2641FE990;
  void v14[5] = &v15;
  v14[6] = &v21;
  v14[4] = v7;
  [(W5Client *)self queryStatusForPeer:a3 reply:v14];
  dispatch_time_t v8 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v7, v8) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v28 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v9 = (id)v16[5];
  id v10 = (id)v22[5];
  if (a4)
  {
    uint64_t v11 = (void *)v16[5];
    if (v11) {
      *a4 = v11;
    }
  }
  long long v12 = (void *)v22[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

intptr_t __37__W5Client_queryStatusForPeer_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a3 copy];
  long long v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

- (void)queryDatabaseForPeer:(id)a3 fetch:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke;
  v6[3] = &unk_2641FE940;
  void v6[4] = self;
  void v6[5] = a3;
  void v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(a1[4] + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_2;
  v8[3] = &unk_2641FE878;
  void v8[4] = a1[7];
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_4;
  v7[3] = &unk_2641FE9B8;
  v7[4] = a1[7];
  [v4 queryDatabaseForPeer:v5 fetch:v6 reply:v7];
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_5;
  block[3] = &unk_2641FE8A0;
  uint64_t v7 = *(void *)(a1 + 32);
  void block[5] = a3;
  void block[6] = v7;
  void block[4] = a2;
  dispatch_async(global_queue, block);
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_5(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (void)requestFileFromPeer:(id)a3 remoteFilePath:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke;
  v6[3] = &unk_2641FE940;
  void v6[4] = self;
  void v6[5] = a3;
  void v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(a1[4] + 40) count] && !objc_msgSend(*(id *)(a1[4] + 32), "count")) {
    objc_msgSend(*(id *)(a1[4] + 8), "setExportedObject:");
  }
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_2;
  v11[3] = &unk_2641FE918;
  uint64_t v5 = a1[7];
  v11[4] = v3;
  v11[5] = v5;
  uint64_t v6 = (void *)[v4 remoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_5;
  v10[3] = &unk_2641FEC08;
  uint64_t v9 = a1[7];
  v10[4] = a1[4];
  v10[5] = v9;
  [v6 requestFileFromPeer:v7 remoteFilePath:v8 reply:v10];
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_3;
  block[3] = &unk_2641FE8A0;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a2;
  void block[6] = v4;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, v4);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_6;
  v6[3] = &unk_2641FE940;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = v3;
  void v6[5] = a2;
  void v6[6] = a3;
  v6[7] = v5;
  dispatch_async(v4, v6);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_7;
  block[3] = &unk_2641FE8A0;
  uint64_t v6 = *(void *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, block);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_7(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (void)listFilesFromPeer:(id)a3 remoteDirPath:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke;
  v6[3] = &unk_2641FE940;
  void v6[4] = self;
  void v6[5] = a3;
  void v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(a1[4] + 40) count] && !objc_msgSend(*(id *)(a1[4] + 32), "count")) {
    objc_msgSend(*(id *)(a1[4] + 8), "setExportedObject:");
  }
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_2;
  v11[3] = &unk_2641FE918;
  uint64_t v5 = a1[7];
  v11[4] = v3;
  v11[5] = v5;
  uint64_t v6 = (void *)[v4 remoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_5;
  v10[3] = &unk_2641FE9E0;
  uint64_t v9 = a1[7];
  v10[4] = a1[4];
  v10[5] = v9;
  [v6 listFilesFromPeer:v7 remoteDirPath:v8 reply:v10];
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_3;
  block[3] = &unk_2641FE8A0;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a2;
  void block[6] = v4;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, v4);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_6;
  v6[3] = &unk_2641FE940;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = v3;
  void v6[5] = a2;
  void v6[6] = a3;
  v6[7] = v5;
  dispatch_async(v4, v6);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_7;
  block[3] = &unk_2641FE8A0;
  uint64_t v6 = *(void *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, block);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_7(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (void)queryDebugConfigurationForPeer:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke;
  block[3] = &unk_2641FE8A0;
  void block[5] = a3;
  void block[6] = a4;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(a1[4] + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_2;
  v7[3] = &unk_2641FE878;
  v7[4] = a1[6];
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_4;
  v6[3] = &unk_2641FEA08;
  uint64_t v5 = a1[5];
  void v6[4] = a1[6];
  [v4 queryDebugConfigurationForPeer:v5 reply:v6];
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_5;
  block[3] = &unk_2641FE8A0;
  uint64_t v7 = *(void *)(a1 + 32);
  void block[5] = a3;
  void block[6] = v7;
  void block[4] = a2;
  dispatch_async(global_queue, block);
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_5(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (id)queryDebugConfigurationForPeer:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  uint64_t v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000;
  long long v18 = __Block_byref_object_copy__0;
  int v19 = __Block_byref_object_dispose__0;
  uint64_t v20 = 0;
  uint64_t v7 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__W5Client_queryDebugConfigurationForPeer_error___block_invoke;
  v14[3] = &unk_2641FEA30;
  void v14[5] = &v15;
  v14[6] = &v21;
  v14[4] = v7;
  [(W5Client *)self queryDebugConfigurationForPeer:a3 reply:v14];
  dispatch_time_t v8 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v7, v8) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v28 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v9 = (id)v16[5];
  id v10 = (id)v22[5];
  if (a4)
  {
    uint64_t v11 = (void *)v16[5];
    if (v11) {
      *a4 = v11;
    }
  }
  long long v12 = (void *)v22[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

intptr_t __49__W5Client_queryDebugConfigurationForPeer_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a3 copy];
  uint64_t v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

- (void)setDebugConfiguration:(id)a3 peer:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke;
  v6[3] = &unk_2641FE940;
  void v6[4] = self;
  void v6[5] = a3;
  void v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(a1[4] + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_2;
  v8[3] = &unk_2641FE878;
  void v8[4] = a1[7];
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_4;
  v7[3] = &unk_2641FE878;
  v7[4] = a1[7];
  [v4 setDebugConfiguration:v5 peer:v6 reply:v7];
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_5;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (BOOL)setDebugConfiguration:(id)a3 peer:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  uint64_t v22 = 0;
  id v9 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__W5Client_setDebugConfiguration_peer_error___block_invoke;
  v16[3] = &unk_2641FEA58;
  v16[4] = v9;
  v16[5] = &v17;
  [(W5Client *)self setDebugConfiguration:a3 peer:a4 reply:v16];
  dispatch_time_t v10 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v9, v10) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v24 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v11 = (id)v18[5];
  long long v12 = v18;
  uint64_t v13 = (void *)v18[5];
  if (a5 && v13)
  {
    *a5 = v13;
    uint64_t v13 = (void *)v12[5];
  }
  BOOL v14 = v13 == 0;
  _Block_object_dispose(&v17, 8);
  return v14;
}

intptr_t __45__W5Client_setDebugConfiguration_peer_error___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  uint64_t v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

- (id)runDiagnostics:(id)a3 configuration:(id)a4 update:(id)a5 reply:(id)a6
{
  id v11 = (void *)[MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke;
  v14[3] = &unk_2641FECA8;
  v14[4] = self;
  void v14[5] = v11;
  v14[8] = a5;
  v14[9] = a6;
  v14[6] = a4;
  void v14[7] = a3;
  dispatch_async(queue, v14);
  return v11;
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v4, objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    if (![*(id *)(a1 + 48) objectForKeyedSubscript:@"IncludeEvents"])
    {
      uint64_t v5 = *(void **)(a1 + 48);
      if (v5) {
        id v6 = (id)[v5 mutableCopy];
      }
      else {
        id v6 = (id)[MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v7 = v6;
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IncludeEvents"];
      id v3 = (id)[v7 copy];
    }
  }
  v11[0] = MEMORY[0x263EF8330];
  long long v8 = *(_OWORD *)(a1 + 32);
  id v9 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[1] = 3221225472;
  v11[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_2;
  v11[3] = &unk_2641FE828;
  long long v12 = v8;
  uint64_t v13 = *(void *)(a1 + 72);
  dispatch_time_t v10 = (void *)[v9 remoteObjectProxyWithErrorHandler:v11];
  objc_msgSend(v10, "runDiagnostics:configuration:uuid:reply:", *(void *)(a1 + 56), v3, MEMORY[0x263EF8330], 3221225472, __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_5, &unk_2641FEA80, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 72));
}

__n128 __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

__n128 __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_6;
  block[3] = &unk_2641FEDB8;
  long long v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_7;
  block[3] = &unk_2641FE8A0;
  uint64_t v6 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_7(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (id)runDiagnostics:(id)a3 configuration:(id)a4 update:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = __Block_byref_object_copy__0;
  uint64_t v29 = __Block_byref_object_dispose__0;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  uint64_t v24 = 0;
  uint64_t v11 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__W5Client_runDiagnostics_configuration_update_error___block_invoke;
  v18[3] = &unk_2641FEAA8;
  v18[5] = &v19;
  v18[6] = &v25;
  v18[4] = v11;
  [(W5Client *)self runDiagnostics:a3 configuration:a4 update:a5 reply:v18];
  dispatch_time_t v12 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v11, v12) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v32 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v13 = (id)v20[5];
  id v14 = (id)v26[5];
  if (a6)
  {
    uint64_t v15 = (void *)v20[5];
    if (v15) {
      *a6 = v15;
    }
  }
  uint64_t v16 = (void *)v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

intptr_t __54__W5Client_runDiagnostics_configuration_update_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a3 copy];
  long long v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

- (id)runDiagnosticsForPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 reply:(id)a6
{
  uint64_t v11 = (void *)[MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke;
  v14[3] = &unk_2641FEAD0;
  v14[4] = self;
  void v14[5] = v11;
  v14[6] = a3;
  void v14[7] = a4;
  v14[8] = a5;
  v14[9] = a6;
  dispatch_async(queue, v14);
  return v11;
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  v6[0] = MEMORY[0x263EF8330];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[1] = 3221225472;
  v6[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_2;
  v6[3] = &unk_2641FE828;
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 72);
  long long v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), MEMORY[0x263EF8330], 3221225472, __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_5, &unk_2641FEA80, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 72));
}

__n128 __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

__n128 __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_6;
  block[3] = &unk_2641FEDB8;
  long long v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_7;
  block[3] = &unk_2641FE8A0;
  uint64_t v6 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_7(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (BOOL)registerRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  uint64_t v26 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke;
  block[3] = &unk_2641FE7D8;
  void block[4] = self;
  dispatch_async(queue, block);
  conn = self->_conn;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_2;
  v19[3] = &unk_2641FEAF8;
  v19[4] = &v21;
  id v11 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_3;
  v18[3] = &unk_2641FEAF8;
  v18[4] = &v21;
  [v11 registerRemoteDiagnosticEventsForPeer:a3 configuration:a4 reply:v18];
  id v12 = (id)v22[5];
  id v13 = v22;
  if (v22[5])
  {
    id v14 = self->_queue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_4;
    v17[3] = &unk_2641FE7D8;
    v17[4] = self;
    dispatch_async(v14, v17);
    id v13 = v22;
    if (a5) {
      *a5 = (id)v22[5];
    }
  }
  BOOL v15 = v13[5] == 0;
  _Block_object_dispose(&v21, 8);
  return v15;
}

void __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 32) count]
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
}

uint64_t __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
}

- (BOOL)unregisterRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  uint64_t v26 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke;
  block[3] = &unk_2641FE7D8;
  void block[4] = self;
  dispatch_async(queue, block);
  conn = self->_conn;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_2;
  v19[3] = &unk_2641FEAF8;
  v19[4] = &v21;
  id v11 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_3;
  v18[3] = &unk_2641FEAF8;
  v18[4] = &v21;
  [v11 unregisterRemoteDiagnosticEventsForPeer:a3 configuration:a4 reply:v18];
  id v12 = (id)v22[5];
  id v13 = v22;
  if (v22[5])
  {
    id v14 = self->_queue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_4;
    v17[3] = &unk_2641FE7D8;
    v17[4] = self;
    dispatch_async(v14, v17);
    id v13 = v22;
    if (a5) {
      *a5 = (id)v22[5];
    }
  }
  BOOL v15 = v13[5] == 0;
  _Block_object_dispose(&v21, 8);
  return v15;
}

void __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 32) count]
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
}

uint64_t __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
}

- (void)queryRegisteredDiagnosticsPeersWithReply:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke;
  v4[3] = &unk_2641FE800;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_2;
  v6[3] = &unk_2641FE878;
  void v6[4] = *(void *)(a1 + 40);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_4;
  v5[3] = &unk_2641FE9B8;
  void v5[4] = *(void *)(a1 + 40);
  [v4 queryRegisteredDiagnosticsPeersWithReply:v5];
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_5;
  block[3] = &unk_2641FE8A0;
  uint64_t v7 = *(void *)(a1 + 32);
  void block[5] = a3;
  void block[6] = v7;
  void block[4] = a2;
  dispatch_async(global_queue, block);
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_5(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (id)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4
{
  uint64_t v7 = (void *)[MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke;
  v10[3] = &unk_2641FE940;
  v10[4] = self;
  v10[5] = v7;
  void v10[6] = a3;
  v10[7] = a4;
  dispatch_async(queue, v10);
  return v7;
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 32) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  v10[0] = MEMORY[0x263EF8330];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[1] = 3221225472;
  v10[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_2;
  v10[3] = &unk_2641FE828;
  long long v11 = v3;
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v10];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_5;
  v7[3] = &unk_2641FEB20;
  long long v8 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  [v5 startDiagnosticsModeWithConfiguration:v6 reply:v7];
}

__n128 __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, *(void *)(a1 + 32));
  }
}

__n128 __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_6;
  block[3] = &unk_2641FEDB8;
  long long v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_7;
  block[3] = &unk_2641FE8A0;
  uint64_t v6 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_7(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (id)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5
{
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke;
  block[3] = &unk_2641FEDB8;
  void block[4] = self;
  void block[5] = v9;
  void block[7] = a4;
  block[8] = a5;
  void block[6] = a3;
  dispatch_async(queue, block);
  return a3;
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 32) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  v11[0] = MEMORY[0x263EF8330];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[1] = 3221225472;
  v11[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_2;
  v11[3] = &unk_2641FE828;
  long long v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  long long v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v11];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_5;
  v8[3] = &unk_2641FE828;
  long long v9 = *(_OWORD *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  [v5 stopDiagnosticsModeWithUUID:v6 info:v7 reply:v8];
}

__n128 __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

__n128 __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_6;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_7;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_7(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (id)queryDiagnosticsModeForPeer:(id)a3 info:(id)a4 reply:(id)a5
{
  uint64_t v9 = (void *)[MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke;
  block[3] = &unk_2641FEDB8;
  void block[4] = self;
  void block[5] = v9;
  void block[7] = a4;
  block[8] = a5;
  void block[6] = a3;
  dispatch_async(queue, block);
  return v9;
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 32) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  v11[0] = MEMORY[0x263EF8330];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[1] = 3221225472;
  v11[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_2;
  v11[3] = &unk_2641FE828;
  long long v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  long long v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v11];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_5;
  v8[3] = &unk_2641FEA80;
  long long v9 = *(_OWORD *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 64);
  [v5 queryDiagnosticsModeForPeer:v6 info:v7 reply:v8];
}

__n128 __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

__n128 __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_6;
  block[3] = &unk_2641FEDB8;
  long long v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_7;
  block[3] = &unk_2641FE8A0;
  uint64_t v6 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_7(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (void)__purgeFilesInDirectory:(id)a3 matching:(id)a4 maxAge:(unint64_t)a5 maxCount:(unint64_t)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)[MEMORY[0x263EFF980] array];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v11 = v10;
  uint64_t v33 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    double v16 = (double)a5;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", v18), 0), "fileCreationDate"), "timeIntervalSinceReferenceDate");
        double v20 = v19;
        if (!a4
          || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length")))
        {
          uint64_t v21 = [a3 stringByAppendingPathComponent:v18];
          if (v11 - v20 <= v16) {
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v21, objc_msgSend(NSNumber, "numberWithDouble:", v20));
          }
          else {
            [v9 addObject:v21];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v14);
  }
  id v22 = (id)objc_msgSend((id)objc_msgSend(v33, "allKeys"), "mutableCopy");
  [v22 sortUsingComparator:&__block_literal_global_34];
  if ([v22 count] > a6 && objc_msgSend(v22, "count") != a6)
  {
    unint64_t v23 = 0;
    do
      objc_msgSend(v9, "addObject:", objc_msgSend(v33, "objectForKeyedSubscript:", objc_msgSend(v22, "objectAtIndexedSubscript:", v23++)));
    while (v23 < [v22 count] - a6);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v24 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v9);
        }
        uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        OSLog = W5GetOSLog();
        if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
        {
          int v42 = 138543362;
          uint64_t v43 = v28;
          LODWORD(v31) = 12;
          uint64_t v30 = &v42;
          _os_log_send_and_compose_impl();
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager", v30, v31), "removeItemAtPath:error:", v28, 0);
      }
      uint64_t v25 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v25);
  }
}

uint64_t __61__W5Client___purgeFilesInDirectory_matching_maxAge_maxCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)__mostRecentInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v31 = (void *)[MEMORY[0x263EFF980] array];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v11 = v10;
  long long v37 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v38 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = a3;
  uint64_t v34 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v44;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v12;
        uint64_t v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
        context = (void *)MEMORY[0x21669CC20]();
        uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "contentsOfDirectoryAtPath:error:", v13, 0);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v40 != v17) {
                objc_enumerationMutation(v14);
              }
              double v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              double v20 = (void *)MEMORY[0x21669CC20]();
              uint64_t v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(v13, "stringByAppendingPathComponent:", v19), 0);
              objc_msgSend((id)objc_msgSend(v21, "fileCreationDate"), "timeIntervalSinceReferenceDate");
              double v23 = v22;
              objc_msgSend((id)objc_msgSend(v21, "fileModificationDate"), "timeIntervalSinceReferenceDate");
              double v25 = v24;
              double v26 = v11 - v23;
              double v27 = v11 - v25;
              BOOL v28 = v11 - v23 > a6 && v27 > a6;
              if (!v28
                && (!a4
                 || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length", v26, v27)))&& (!a5|| !objc_msgSend(a5, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length", v26, v27)))&& (objc_msgSend(v38, "containsObject:", v19, v26, v27) & 1) == 0)
              {
                if (v23 <= v25) {
                  double v29 = v25;
                }
                else {
                  double v29 = v23;
                }
                objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v29), objc_msgSend(v13, "stringByAppendingPathComponent:", v19));
                [v38 addObject:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v16);
        }
        uint64_t v12 = v36 + 1;
      }
      while (v36 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v34);
  }
  objc_msgSend(v31, "addObjectsFromArray:", objc_msgSend(v37, "keysSortedByValueUsingComparator:", &__block_literal_global_36));
  return (id)[v31 copy];
}

uint64_t __61__W5Client___mostRecentInDirectories_include_exclude_maxAge___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (BOOL)__tarballWithSource:(id)a3 destination:(id)a4 error:(id *)a5
{
  return W5CreateTarball(a3, a4, a5);
}

- (id)__collectJetsamFallbackLogsWithReason:(id)a3 compress:(BOOL)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263F08790]);
  [v7 setDateFormat:@"yyyy-MM-dd_HH.mm.ss.SSS"];
  uint64_t v8 = objc_msgSend(v7, "stringFromDate:", objc_msgSend(MEMORY[0x263EFF910], "date"));
  if (!a3) {
    a3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.WiFiVelocity"), "localizedStringForKey:value:table:", @"kW5LocWiFiDiagnosticsName", @"WiFiDiagnostics", 0);
  }
  uint64_t v9 = [NSString stringWithFormat:@"%@_%@", a3, v8];
  double v10 = objc_msgSend(NSURL, "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", @"com.apple.wifivelocity"), "stringByAppendingPathComponent:", v9));
  double v11 = (void *)[MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = 0;
  if (objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v10, "path"), 1, 0, 0))
  {
    [v11 createFileAtPath:objc_msgSend((id)objc_msgSend(v10, "path"), "stringByAppendingPathComponent:", @"__CRASH__", objc_msgSend(@"This file was generated because the XPC call to collect WiFi diagnostics/logs was interrupted or invalidated (most likely jetsam'd). When we detect this condition, we will collect basic WiFi logs inline and try to capture the corresponding crash report for wifivelocityd.", "dataUsingEncoding:", 4), 0 contents attributes];
    -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", [NSURL fileURLWithPath:@"/Library/Logs/wifi.log"], objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", @"wifi.log"), "URLByAppendingPathExtension:", @"tgz"), 0);
    id v13 = [(W5Client *)self __mostRecentInDirectories:&unk_26C50A0D0 include:0 exclude:0 maxAge:86400.0];
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v15 = (unint64_t)[v13 count] > 5 ? 6 : objc_msgSend(v13, "count");
      if (i >= v15) {
        break;
      }
      uint64_t v16 = (void *)[v13 objectAtIndexedSubscript:i];
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", [NSURL fileURLWithPath:v16], objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v16, "lastPathComponent")), "URLByAppendingPathExtension:", @"tgz"), 0);
    }
    id v17 = [(W5Client *)self __mostRecentInDirectories:&unk_26C50A0E8 include:0 exclude:0 maxAge:86400.0];
    for (unint64_t j = 0; ; ++j)
    {
      unint64_t v19 = (unint64_t)[v17 count] > 5 ? 6 : objc_msgSend(v17, "count");
      if (j >= v19) {
        break;
      }
      double v20 = (void *)[v17 objectAtIndexedSubscript:j];
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", [NSURL fileURLWithPath:v20], objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v20, "lastPathComponent")), "URLByAppendingPathExtension:", @"tgz"), 0);
    }
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi.plist"), objc_msgSend(v10, "URLByAppendingPathComponent:", @"com.apple.wifi.plist"), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist"), objc_msgSend(v10, "URLByAppendingPathComponent:", @"LEGACY_com.apple.wifi-networks.plist"), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist"), objc_msgSend(v10, "URLByAppendingPathComponent:", @"com.apple.wifi-private-mac-networks.plist"), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", @"/Library/Preferences/com.apple.wifi.known-networks.plist"), objc_msgSend(v10, "URLByAppendingPathComponent:", @"com.apple.wifi.known-networks.plist"), 0);
    id v21 = -[W5Client __mostRecentInDirectories:include:exclude:maxAge:](self, "__mostRecentInDirectories:include:exclude:maxAge:", &unk_26C50A100, objc_msgSend(MEMORY[0x263F08AE8], "regularExpressionWithPattern:options:error:", objc_msgSend(MEMORY[0x263F08AE8], "escapedPatternForString:", @"wifivelocityd"), 0, 0), 0, 86400.0);
    for (unint64_t k = 0; ; ++k)
    {
      unint64_t v23 = (unint64_t)[v21 count] > 2 ? 3 : objc_msgSend(v21, "count");
      if (k >= v23) {
        break;
      }
      double v24 = (void *)[v21 objectAtIndexedSubscript:k];
      objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", v24), objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v24, "lastPathComponent")), 0);
    }
    if (a4)
    {
      uint64_t v25 = [v10 URLByAppendingPathExtension:@"tgz"];
      [(W5Client *)self __tarballWithSource:v10 destination:v25 error:0];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v10, 0);
      double v10 = (void *)v25;
    }
    dispatch_time_t v26 = dispatch_time(0, 120000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__W5Client___collectJetsamFallbackLogsWithReason_compress___block_invoke;
    block[3] = &unk_2641FE7D8;
    void block[4] = v10;
    dispatch_after(v26, global_queue, block);
    uint64_t v12 = v10;
  }
  [(W5Client *)self __purgeFilesInDirectory:[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"com.apple.wifivelocity"] matching:0 maxAge:28800 maxCount:10];
  return v12;
}

void __59__W5Client___collectJetsamFallbackLogsWithReason_compress___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v2 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) path];
    v7[0] = 67109378;
    v7[1] = 120;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    LODWORD(v6) = 18;
    long long v5 = v7;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager", v5, v6), "removeItemAtURL:error:", *(void *)(a1 + 32), 0);
}

- (id)__collectBusyFallbackLogsWithReason:(id)a3 compress:(BOOL)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263F08790]);
  [v7 setDateFormat:@"yyyy-MM-dd_HH.mm.ss.SSS"];
  uint64_t v8 = objc_msgSend(v7, "stringFromDate:", objc_msgSend(MEMORY[0x263EFF910], "date"));
  if (!a3) {
    a3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.WiFiVelocity"), "localizedStringForKey:value:table:", @"kW5LocWiFiDiagnosticsName", @"WiFiDiagnostics", 0);
  }
  uint64_t v9 = [NSString stringWithFormat:@"%@_%@", a3, v8];
  uint64_t v10 = objc_msgSend(NSURL, "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", @"com.apple.wifivelocity"), "stringByAppendingPathComponent:", v9));
  double v11 = (void *)[MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = 0;
  if (objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v10, "path"), 1, 0, 0))
  {
    [v11 createFileAtPath:objc_msgSend((id)objc_msgSend(v10, "path"), "stringByAppendingPathComponent:", @"__BUSY__", objc_msgSend(@"This file was generated because a log collection request is already in progress. When we detect this condition, we will attempt to collect basic WiFi logs inline.", "dataUsingEncoding:", 4), 0 contents attributes];
    -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", [NSURL fileURLWithPath:@"/Library/Logs/wifi.log"], objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", @"wifi.log"), "URLByAppendingPathExtension:", @"tgz"), 0);
    id v13 = [(W5Client *)self __mostRecentInDirectories:&unk_26C50A118 include:0 exclude:0 maxAge:86400.0];
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v15 = (unint64_t)[v13 count] > 5 ? 6 : objc_msgSend(v13, "count");
      if (i >= v15) {
        break;
      }
      uint64_t v16 = (void *)[v13 objectAtIndexedSubscript:i];
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", [NSURL fileURLWithPath:v16], objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v16, "lastPathComponent")), "URLByAppendingPathExtension:", @"tgz"), 0);
    }
    id v17 = [(W5Client *)self __mostRecentInDirectories:&unk_26C50A130 include:0 exclude:0 maxAge:86400.0];
    for (unint64_t j = 0; ; ++j)
    {
      unint64_t v19 = (unint64_t)[v17 count] > 5 ? 6 : objc_msgSend(v17, "count");
      if (j >= v19) {
        break;
      }
      double v20 = (void *)[v17 objectAtIndexedSubscript:j];
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", [NSURL fileURLWithPath:v20], objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v20, "lastPathComponent")), "URLByAppendingPathExtension:", @"tgz"), 0);
    }
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi.plist"), objc_msgSend(v10, "URLByAppendingPathComponent:", @"com.apple.wifi.plist"), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist"), objc_msgSend(v10, "URLByAppendingPathComponent:", @"LEGACY_com.apple.wifi-networks.plist"), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist"), objc_msgSend(v10, "URLByAppendingPathComponent:", @"com.apple.wifi-private-mac-networks.plist"), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(NSURL, "fileURLWithPath:", @"/Library/Preferences/com.apple.wifi.known-networks.plist"), objc_msgSend(v10, "URLByAppendingPathComponent:", @"com.apple.wifi.known-networks.plist"), 0);
    if (a4)
    {
      uint64_t v21 = [v10 URLByAppendingPathExtension:@"tgz"];
      [(W5Client *)self __tarballWithSource:v10 destination:v21 error:0];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v10, 0);
      uint64_t v10 = (void *)v21;
    }
    dispatch_time_t v22 = dispatch_time(0, 120000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__W5Client___collectBusyFallbackLogsWithReason_compress___block_invoke;
    block[3] = &unk_2641FE7D8;
    void block[4] = v10;
    dispatch_after(v22, global_queue, block);
    uint64_t v12 = v10;
  }
  [(W5Client *)self __purgeFilesInDirectory:[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"com.apple.wifivelocity"] matching:0 maxAge:28800 maxCount:10];
  return v12;
}

void __57__W5Client___collectBusyFallbackLogsWithReason_compress___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v2 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) path];
    v7[0] = 67109378;
    v7[1] = 120;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    LODWORD(v6) = 18;
    long long v5 = v7;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager", v5, v6), "removeItemAtURL:error:", *(void *)(a1 + 32), 0);
}

- (void)__logsCollectedWithTemporaryURL:(id)a3 outputURL:(id)a4 keepParent:(BOOL)a5 compress:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v40 = 0;
  uint64_t v12 = (void *)[MEMORY[0x263F08850] defaultManager];
  char v39 = 0;
  if ((objc_msgSend(v12, "fileExistsAtPath:isDirectory:", objc_msgSend(a4, "path"), &v39) & 1) == 0)
  {
    [v12 createDirectoryAtURL:a4 withIntermediateDirectories:1 attributes:0 error:&v40];
    if (!objc_msgSend(v12, "fileExistsAtPath:isDirectory:", objc_msgSend(a4, "path"), &v39))
    {
      if (!a7) {
        return;
      }
      uint64_t v25 = v40;
      goto LABEL_22;
    }
  }
  if (!v39)
  {
    if (!a7) {
      return;
    }
    uint64_t v24 = *MEMORY[0x263F08438];
    uint64_t v41 = *MEMORY[0x263F08338];
    long long v42 = @"ENOENT";
    uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v24, 2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
LABEL_22:
    (*((void (**)(id, uint64_t, void))a7 + 2))(a7, v25, 0);
    return;
  }
  if (a5 || v8)
  {
    a4 = (id)objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent"));
    char v15 = [v12 copyItemAtURL:a3 toURL:a4 error:&v40];
    if (v40)
    {
      OSLog = W5GetOSLog();
      if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [a3 path];
        uint64_t v28 = [a4 path];
        int v44 = 138543874;
        uint64_t v45 = v27;
        __int16 v46 = 2114;
        uint64_t v47 = v28;
        __int16 v48 = 2114;
        uint64_t v49 = v40;
        _os_log_send_and_compose_impl();
      }
    }
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obunint64_t j = (id)objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", objc_msgSend(a3, "path"), &v40);
    uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v33 = a7;
      char v15 = 0;
      uint64_t v16 = *(void *)v36;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * v17);
          id v19 = a4;
          char v20 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", objc_msgSend(a3, "URLByAppendingPathComponent:", v18, v30, v31), objc_msgSend(a4, "URLByAppendingPathComponent:", v18), &v40);
          if (v40)
          {
            uint64_t v21 = W5GetOSLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = objc_msgSend((id)objc_msgSend(a3, "URLByAppendingPathComponent:", v18), "path");
              uint64_t v22 = objc_msgSend((id)objc_msgSend(v19, "URLByAppendingPathComponent:", v18), "path");
              int v44 = 138543874;
              uint64_t v45 = v32;
              __int16 v46 = 2114;
              uint64_t v47 = v22;
              __int16 v48 = 2114;
              uint64_t v49 = v40;
              LODWORD(v31) = 32;
              uint64_t v30 = &v44;
              _os_log_send_and_compose_impl();
            }
          }
          v15 |= v20;
          ++v17;
          a4 = v19;
        }
        while (v14 != v17);
        uint64_t v23 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
        uint64_t v14 = v23;
      }
      while (v23);
      a7 = v33;
    }
    else
    {
      char v15 = 0;
    }
  }
  if (a7)
  {
    if (v15) {
      id v29 = a4;
    }
    else {
      id v29 = 0;
    }
    (*((void (**)(id, uint64_t, id))a7 + 2))(a7, v40, v29);
  }
}

- (id)collectLogs:(id)a3 configuration:(id)a4 update:(id)a5 reply:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v11 = (void *)[MEMORY[0x263F08C38] UUID];
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316418;
    uint64_t v17 = "-[W5Client collectLogs:configuration:update:reply:]";
    __int16 v18 = 2080;
    id v19 = "W5Client.m";
    __int16 v20 = 1024;
    int v21 = 1488;
    __int16 v22 = 2114;
    uint64_t v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processName");
    __int16 v24 = 1024;
    int v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processIdentifier");
    __int16 v26 = 2114;
    uint64_t v27 = objc_msgSend((id)objc_msgSend(v11, "UUIDString"), "substringToIndex:", 5);
    _os_log_send_and_compose_impl();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke;
  block[3] = &unk_2641FECA8;
  void block[4] = self;
  void block[5] = v11;
  void block[6] = a4;
  void block[7] = a3;
  block[8] = a5;
  void block[9] = a6;
  dispatch_async(queue, block);
  return v11;
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  uint64_t v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"OutputDirectory"];
  char v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"KeepParent"), "BOOLValue");
  char v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"Compress"), "BOOLValue");
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6) {
    id v7 = (id)[v6 mutableCopy];
  }
  else {
    id v7 = (id)[MEMORY[0x263EFF9A0] dictionary];
  }
  BOOL v8 = v7;
  BOOL v9 = [*(id *)(a1 + 56) count] == 1
    && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 54;
  BOOL v10 = [*(id *)(a1 + 56) count] == 1
     && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 60;
  BOOL v11 = [*(id *)(a1 + 56) count] == 1
     && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 59;
  if ([*(id *)(a1 + 56) count] == 1
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 56
     || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 79))
  {
    if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"Timeout"), "integerValue") < 1) {
      goto LABEL_25;
    }
    uint64_t v12 = @"AllowCachedSysdiagnose";
  }
  else
  {
    if (!v10 && !v11 && !v9) {
      goto LABEL_25;
    }
    uint64_t v12 = @"CacheSysdiagnose";
  }
  if (![v8 objectForKeyedSubscript:v12]) {
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v12];
  }
LABEL_25:
  uint64_t v13 = *(void *)(a1 + 64);
  if (v13)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v13, objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    if (![v8 objectForKeyedSubscript:@"IncludeEvents"]) {
      [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IncludeEvents"];
    }
  }
  v25[0] = MEMORY[0x263EF8330];
  long long v14 = *(_OWORD *)(a1 + 32);
  char v15 = *(void **)(*(void *)(a1 + 32) + 8);
  v25[1] = 3221225472;
  v25[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_2;
  v25[3] = &unk_2641FEBE0;
  long long v26 = v14;
  char v30 = v5;
  uint64_t v27 = v8;
  uint64_t v28 = v3;
  char v31 = v4;
  uint64_t v29 = *(void *)(a1 + 72);
  int v16 = (void *)[v15 remoteObjectProxyWithErrorHandler:v25];
  uint64_t v17 = *(void *)(a1 + 56);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_6;
  v19[3] = &unk_2641FEC80;
  v19[4] = *(void *)(a1 + 32);
  long long v20 = *(_OWORD *)(a1 + 40);
  char v23 = v5;
  char v24 = v4;
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v21 = v3;
  uint64_t v22 = v18;
  [v16 collectLogs:v17 configuration:v8 uuid:(void)v20 reply:v19];
}

__n128 __51__W5Client_collectLogs_configuration_update_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 48);
  char v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_3;
  block[3] = &unk_2641FEBB8;
  __int16 v12 = *(_WORD *)(a1 + 72);
  long long v8 = v2;
  long long v9 = v3;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v10 = a2;
  uint64_t v11 = v5;
  dispatch_async(v4, block);
  return result;
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  v5[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_4;
  v5[3] = &unk_2641FEB90;
  void v5[4] = *(void *)(a1 + 32);
  __int16 v8 = *(_WORD *)(a1 + 80);
  long long v7 = v4;
  dispatch_async(global_queue, v5);
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "__collectJetsamFallbackLogsWithReason:compress:", objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"Reason"), *(unsigned __int8 *)(a1 + 72));
  if (v3 && (uint64_t v4 = *(void *)(a1 + 48)) != 0)
  {
    uint64_t v5 = v3;
    long long v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 73);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_5;
    v10[3] = &unk_2641FEB68;
    void v10[4] = *(void *)(a1 + 64);
    objc_msgSend(v6, "__logsCollectedWithTemporaryURL:outputURL:keepParent:compress:reply:", v5, v4, v7, v8, v10);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9) {
      (*(void (**)(uint64_t, void, void, void))(v9 + 16))(v9, *(void *)(a1 + 56), 0, 0);
    }
  }
}

uint64_t __51__W5Client_collectLogs_configuration_update_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(result + 16))(result, a2, 0, a3);
  }
  return result;
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  long long v8 = *(_OWORD *)(a1 + 32);
  block[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_7;
  block[3] = &unk_2641FEC58;
  uint64_t v9 = a4;
  uint64_t v10 = a2;
  __int16 v14 = *(_WORD *)(a1 + 72);
  long long v11 = v4;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v12 = a3;
  uint64_t v13 = v6;
  dispatch_async(v5, block);
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_7(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  v5[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_8;
  v5[3] = &unk_2641FEC30;
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v10 = *(_WORD *)(a1 + 96);
  long long v8 = v4;
  long long v9 = *(_OWORD *)(a1 + 80);
  dispatch_async(global_queue, v5);
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_8(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    goto LABEL_2;
  }
  if ([*(id *)(a1 + 40) code] != 16)
  {
    uint64_t v3 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 48), "__collectBusyFallbackLogsWithReason:compress:", objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", @"Reason"), *(unsigned __int8 *)(a1 + 88));
  if (v3)
  {
LABEL_2:
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 48);
      uint64_t v6 = *(unsigned __int8 *)(a1 + 89);
      uint64_t v7 = *(unsigned __int8 *)(a1 + 88);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_9;
      v9[3] = &unk_2641FEC08;
      long long v10 = *(_OWORD *)(a1 + 72);
      objc_msgSend(v5, "__logsCollectedWithTemporaryURL:outputURL:keepParent:compress:reply:", v3, v4, v6, v7, v9);
      goto LABEL_10;
    }
  }
LABEL_8:
  uint64_t v8 = *(void *)(a1 + 80);
  if (v8) {
    (*(void (**)(uint64_t, void, void, uint64_t))(v8 + 16))(v8, *(void *)(a1 + 40), *(void *)(a1 + 72), v3);
  }
LABEL_10:
}

uint64_t __51__W5Client_collectLogs_configuration_update_reply___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(result + 16))(result, a2, *(void *)(a1 + 32), a3);
  }
  return result;
}

- (id)collectLogs:(id)a3 configuration:(id)a4 update:(id)a5 receipts:(id *)a6 error:(id *)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3052000000;
  long long v38 = __Block_byref_object_copy__0;
  char v39 = __Block_byref_object_dispose__0;
  uint64_t v40 = 0;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x3052000000;
  uint64_t v32 = __Block_byref_object_copy__0;
  id v33 = __Block_byref_object_dispose__0;
  uint64_t v34 = 0;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3052000000;
  long long v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  uint64_t v28 = 0;
  uint64_t v13 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__W5Client_collectLogs_configuration_update_receipts_error___block_invoke;
  v22[3] = &unk_2641FECD0;
  v22[6] = &v29;
  v22[7] = &v35;
  v22[4] = v13;
  v22[5] = &v23;
  [(W5Client *)self collectLogs:a3 configuration:a4 update:a5 reply:v22];
  dispatch_time_t v14 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v13, v14) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v42 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v15 = (id)v24[5];
  id v16 = (id)v30[5];
  id v17 = (id)v36[5];
  if (a7)
  {
    uint64_t v18 = (void *)v24[5];
    if (v18) {
      *a7 = v18;
    }
  }
  if (a6)
  {
    id v19 = (void *)v30[5];
    if (v19) {
      *a6 = v19;
    }
  }
  long long v20 = (void *)v36[5];
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v20;
}

intptr_t __60__W5Client_collectLogs_configuration_update_receipts_error___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a3 copy];
  *(void *)(*(void *)(a1[7] + 8) + 40) = [a4 copy];
  uint64_t v7 = a1[4];
  return dispatch_semaphore_signal(v7);
}

- (id)collectLogsDiagnosticMode:(id)a3 update:(id)a4 reply:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v9 = (void *)[MEMORY[0x263F08C38] UUID];
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136316418;
    id v15 = "-[W5Client collectLogsDiagnosticMode:update:reply:]";
    __int16 v16 = 2080;
    id v17 = "W5Client.m";
    __int16 v18 = 1024;
    int v19 = 1659;
    __int16 v20 = 2114;
    uint64_t v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processName");
    __int16 v22 = 1024;
    int v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processIdentifier");
    __int16 v24 = 2114;
    uint64_t v25 = objc_msgSend((id)objc_msgSend(v9, "UUIDString"), "substringToIndex:", 5);
    _os_log_send_and_compose_impl();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke;
  block[3] = &unk_2641FECF8;
  void block[4] = self;
  void block[5] = v9;
  void block[6] = a3;
  void block[7] = a4;
  block[8] = a5;
  dispatch_async(queue, block);
  return v9;
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  uint64_t v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"OutputDirectory"];
  char v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"KeepParent"), "BOOLValue");
  char v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"Compress"), "BOOLValue");
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6) {
    id v7 = (id)[v6 mutableCopy];
  }
  else {
    id v7 = (id)[MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v9, objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    if (![v8 objectForKeyedSubscript:@"IncludeEvents"]) {
      [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IncludeEvents"];
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  long long v10 = *(_OWORD *)(a1 + 32);
  long long v11 = *(void **)(*(void *)(a1 + 32) + 8);
  v20[1] = 3221225472;
  v20[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_2;
  v20[3] = &unk_2641FEBE0;
  long long v21 = v10;
  char v25 = v5;
  __int16 v22 = v8;
  uint64_t v23 = v3;
  char v26 = v4;
  uint64_t v24 = *(void *)(a1 + 64);
  uint64_t v12 = (void *)[v11 remoteObjectProxyWithErrorHandler:v20];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_6;
  v14[3] = &unk_2641FEC80;
  v14[4] = *(void *)(a1 + 32);
  long long v15 = *(_OWORD *)(a1 + 40);
  char v18 = v5;
  char v19 = v4;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v16 = v3;
  uint64_t v17 = v13;
  [v12 collectLogsDiagnosticMode:v8 uuid:(void)v15 reply:v14];
}

__n128 __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 48);
  char v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_3;
  block[3] = &unk_2641FEBB8;
  __int16 v12 = *(_WORD *)(a1 + 72);
  long long v8 = v2;
  long long v9 = v3;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v10 = a2;
  uint64_t v11 = v5;
  dispatch_async(v4, block);
  return result;
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  v5[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_4;
  v5[3] = &unk_2641FEB90;
  void v5[4] = *(void *)(a1 + 32);
  __int16 v8 = *(_WORD *)(a1 + 80);
  long long v7 = v4;
  dispatch_async(global_queue, v5);
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "__collectJetsamFallbackLogsWithReason:compress:", objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"Reason"), *(unsigned __int8 *)(a1 + 72));
  if (v3 && (uint64_t v4 = *(void *)(a1 + 48)) != 0)
  {
    uint64_t v5 = v3;
    long long v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 73);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_5;
    v10[3] = &unk_2641FEB68;
    void v10[4] = *(void *)(a1 + 64);
    objc_msgSend(v6, "__logsCollectedWithTemporaryURL:outputURL:keepParent:compress:reply:", v5, v4, v7, v8, v10);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9) {
      (*(void (**)(uint64_t, void, void, void))(v9 + 16))(v9, *(void *)(a1 + 56), 0, 0);
    }
  }
}

uint64_t __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(result + 16))(result, a2, 0, a3);
  }
  return result;
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  long long v8 = *(_OWORD *)(a1 + 32);
  block[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_7;
  block[3] = &unk_2641FEC58;
  uint64_t v9 = a4;
  uint64_t v10 = a2;
  __int16 v14 = *(_WORD *)(a1 + 72);
  long long v11 = v4;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v12 = a3;
  uint64_t v13 = v6;
  dispatch_async(v5, block);
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_7(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  v5[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_8;
  v5[3] = &unk_2641FEC30;
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v10 = *(_WORD *)(a1 + 96);
  long long v8 = v4;
  long long v9 = *(_OWORD *)(a1 + 80);
  dispatch_async(global_queue, v5);
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_8(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    goto LABEL_2;
  }
  if ([*(id *)(a1 + 40) code] != 16)
  {
    uint64_t v3 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 48), "__collectBusyFallbackLogsWithReason:compress:", objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", @"Reason"), *(unsigned __int8 *)(a1 + 88));
  if (v3)
  {
LABEL_2:
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 48);
      uint64_t v6 = *(unsigned __int8 *)(a1 + 89);
      uint64_t v7 = *(unsigned __int8 *)(a1 + 88);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_9;
      v9[3] = &unk_2641FEC08;
      long long v10 = *(_OWORD *)(a1 + 72);
      objc_msgSend(v5, "__logsCollectedWithTemporaryURL:outputURL:keepParent:compress:reply:", v3, v4, v6, v7, v9);
      goto LABEL_10;
    }
  }
LABEL_8:
  uint64_t v8 = *(void *)(a1 + 80);
  if (v8) {
    (*(void (**)(uint64_t, void, void, uint64_t))(v8 + 16))(v8, *(void *)(a1 + 40), *(void *)(a1 + 72), v3);
  }
LABEL_10:
}

uint64_t __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(result + 16))(result, a2, *(void *)(a1 + 32), a3);
  }
  return result;
}

- (id)collectLogsDiagnosticMode:(id)a3 update:(id)a4 receipts:(id *)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3052000000;
  long long v36 = __Block_byref_object_copy__0;
  uint64_t v37 = __Block_byref_object_dispose__0;
  uint64_t v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  char v30 = __Block_byref_object_copy__0;
  uint64_t v31 = __Block_byref_object_dispose__0;
  uint64_t v32 = 0;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  char v25 = __Block_byref_object_dispose__0;
  uint64_t v26 = 0;
  long long v11 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__W5Client_collectLogsDiagnosticMode_update_receipts_error___block_invoke;
  v20[3] = &unk_2641FECD0;
  v20[6] = &v27;
  v20[7] = &v33;
  void v20[4] = v11;
  v20[5] = &v21;
  [(W5Client *)self collectLogsDiagnosticMode:a3 update:a4 reply:v20];
  dispatch_time_t v12 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v11, v12) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v40 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v13 = (id)v22[5];
  id v14 = (id)v28[5];
  id v15 = (id)v34[5];
  if (a6)
  {
    uint64_t v16 = (void *)v22[5];
    if (v16) {
      *a6 = v16;
    }
  }
  if (a5)
  {
    uint64_t v17 = (void *)v28[5];
    if (v17) {
      *a5 = v17;
    }
  }
  char v18 = (void *)v34[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v18;
}

intptr_t __60__W5Client_collectLogsDiagnosticMode_update_receipts_error___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a3 copy];
  *(void *)(*(void *)(a1[7] + 8) + 40) = [a4 copy];
  uint64_t v7 = a1[4];
  return dispatch_semaphore_signal(v7);
}

- (id)startPeerDiscoveryWithConfiguration:(id)a3 reply:(id)a4
{
  uint64_t v7 = (void *)[MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke;
  v10[3] = &unk_2641FE940;
  void v10[4] = self;
  void v10[5] = v7;
  void v10[6] = a3;
  v10[7] = a4;
  dispatch_async(queue, v10);
  return v7;
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setObject:forKey:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  v6[0] = MEMORY[0x263EF8330];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[1] = 3221225472;
  v6[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_2;
  v6[3] = &unk_2641FE828;
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "startPeerDiscoveryWithConfiguration:uuid:reply:", *(void *)(a1 + 48), MEMORY[0x263EF8330], 3221225472, __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_5, &unk_2641FE828, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56));
}

__n128 __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

__n128 __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_6;
  v5[3] = &unk_2641FE940;
  void v5[4] = a2;
  long long v6 = v2;
  uint64_t v7 = *(void *)(a1 + 48);
  dispatch_async(v3, v5);
  return result;
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 48), "UUIDString"));
    if (![*(id *)(*(void *)(a1 + 40) + 40) count]
      && ![*(id *)(*(void *)(a1 + 40) + 32) count])
    {
      [*(id *)(*(void *)(a1 + 40) + 8) setExportedObject:0];
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 48), "UUIDString"));
    global_queue = dispatch_get_global_queue(0, 0);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_7;
    v5[3] = &unk_2641FE800;
    uint64_t v4 = *(void *)(a1 + 56);
    void v5[4] = *(void *)(a1 + 32);
    void v5[5] = v4;
    dispatch_async(global_queue, v5);
  }
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_7(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

- (void)stopPeerDiscoveryWithUUID:(id)a3
{
  if (a3)
  {
    id v5 = [(NSXPCConnection *)self->_conn remoteObjectProxyWithErrorHandler:&__block_literal_global_169];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__W5Client_stopPeerDiscoveryWithUUID___block_invoke_2;
    v6[3] = &unk_2641FED68;
    void v6[4] = self;
    void v6[5] = a3;
    [v5 stopPeerDiscoveryWithUUID:a3 reply:v6];
  }
}

void __38__W5Client_stopPeerDiscoveryWithUUID___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  long long v1 = *(_OWORD *)(a1 + 32);
  long long v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v3[2] = __38__W5Client_stopPeerDiscoveryWithUUID___block_invoke_3;
  v3[3] = &unk_2641FED40;
  long long v4 = v1;
  dispatch_async(v2, v3);
}

void __38__W5Client_stopPeerDiscoveryWithUUID___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
}

- (id)runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6
{
  v14[1] = *MEMORY[0x263EF8340];
  v14[0] = a3;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__W5Client_runWiFiSnifferOnChannel_duration_peer_reply___block_invoke;
  v13[3] = &unk_2641FED90;
  v13[4] = a3;
  v13[5] = a6;
  return [(W5Client *)self runWiFiSnifferOnChannels:v11 duration:a5 peer:v13 reply:a4];
}

uint64_t __56__W5Client_runWiFiSnifferOnChannel_duration_peer_reply___block_invoke(uint64_t result, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(result + 40);
  if (a2)
  {
    if (!v4) {
      return result;
    }
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v6 = *(void *)(result + 40);
    uint64_t v7 = 0;
  }
  else
  {
    if (!v4) {
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = [a3 objectForKey:*(void *)(result + 32)];
    uint64_t v7 = [a4 objectForKey:*(void *)(v9 + 32)];
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v6 = v4;
    a2 = v10;
  }
  return v5(v6, a2, v7);
}

- (id)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6
{
  uint64_t v11 = (void *)[MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke;
  v14[3] = &unk_2641FEE30;
  v14[4] = self;
  void v14[5] = v11;
  void v14[7] = a5;
  v14[8] = a6;
  *(double *)&v14[9] = a4;
  v14[6] = a3;
  dispatch_async(queue, v14);
  return v11;
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  v6[0] = MEMORY[0x263EF8330];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[1] = 3221225472;
  v6[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_2;
  v6[3] = &unk_2641FE828;
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 64);
  id v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 72), MEMORY[0x263EF8330], 3221225472, __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_5, &unk_2641FEE08, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 64));
}

__n128 __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0, 0, 0);
  }
}

__n128 __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_6;
  block[3] = &unk_2641FEDE0;
  long long v10 = v5;
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v14 = a5;
  uint64_t v15 = v7;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  dispatch_async(v6, block);
  return result;
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_7;
  block[3] = &unk_2641FEDB8;
  uint64_t v8 = *(void *)(a1 + 80);
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v7 = v4;
  dispatch_async(global_queue, block);
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_7(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void, void))(v3 + 16))(v3, a1[4], a1[5], a1[6], a1[7]);
  }
}

- (id)runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 peer:(id)a5 error:(id *)a6
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  v8[0] = a3;
  return (id)objc_msgSend(-[W5Client runWiFiSnifferOnChannels:duration:peer:snifferErrors:error:](self, "runWiFiSnifferOnChannels:duration:peer:snifferErrors:error:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v8, 1), a5, &v7, a6, a4), "objectForKey:", a3);
}

- (id)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 snifferErrors:(id *)a6 error:(id *)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3052000000;
  long long v36 = __Block_byref_object_copy__0;
  uint64_t v37 = __Block_byref_object_dispose__0;
  uint64_t v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  char v30 = __Block_byref_object_copy__0;
  uint64_t v31 = __Block_byref_object_dispose__0;
  uint64_t v32 = 0;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  char v25 = __Block_byref_object_dispose__0;
  uint64_t v26 = 0;
  uint64_t v12 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __71__W5Client_runWiFiSnifferOnChannels_duration_peer_snifferErrors_error___block_invoke;
  v20[3] = &unk_2641FEE58;
  v20[6] = &v33;
  v20[7] = &v21;
  void v20[4] = v12;
  v20[5] = &v27;
  [(W5Client *)self runWiFiSnifferOnChannels:a3 duration:a5 peer:v20 reply:a4];
  dispatch_time_t v13 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v12, v13) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v40 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v14 = (id)v28[5];
  id v15 = (id)v34[5];
  id v16 = (id)v22[5];
  if (a7)
  {
    uint64_t v17 = (void *)v28[5];
    if (v17) {
      *a7 = v17;
    }
  }
  char v18 = (void *)v34[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v18;
}

intptr_t __71__W5Client_runWiFiSnifferOnChannels_duration_peer_snifferErrors_error___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a4 copy];
  *(void *)(*(void *)(a1[7] + 8) + 40) = [a3 copy];
  uint64_t v7 = a1[4];
  return dispatch_semaphore_signal(v7);
}

- (id)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6
{
  uint64_t v11 = (void *)[MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke;
  v14[3] = &unk_2641FEE30;
  v14[4] = self;
  void v14[5] = v11;
  void v14[7] = a5;
  v14[8] = a6;
  *(double *)&v14[9] = a4;
  v14[6] = a3;
  dispatch_async(queue, v14);
  return v11;
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  v6[0] = MEMORY[0x263EF8330];
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[1] = 3221225472;
  v6[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_2;
  v6[3] = &unk_2641FE828;
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 72), MEMORY[0x263EF8330], 3221225472, __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_5, &unk_2641FEA80, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 64));
}

__n128 __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
}

__n128 __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_6;
  block[3] = &unk_2641FEDB8;
  long long v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_7;
  block[3] = &unk_2641FE8A0;
  uint64_t v6 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_7(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

- (id)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = __Block_byref_object_copy__0;
  uint64_t v29 = __Block_byref_object_dispose__0;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3052000000;
  __int16 v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  uint64_t v24 = 0;
  uint64_t v11 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_error___block_invoke;
  v18[3] = &unk_2641FEAA8;
  void v18[5] = &v19;
  v18[6] = &v25;
  v18[4] = v11;
  [(W5Client *)self runWiFiSnifferWithTCPDumpOnChannels:a3 duration:a5 peer:v18 reply:a4];
  dispatch_time_t v12 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v11, v12) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v32 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v13 = (id)v20[5];
  id v14 = (id)v26[5];
  if (a6)
  {
    id v15 = (void *)v20[5];
    if (v15) {
      *a6 = v15;
    }
  }
  id v16 = (void *)v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

intptr_t __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a3 copy];
  long long v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

- (id)runWiFiPerformanceLoggingWithConfiguration:(id)a3 reply:(id)a4
{
  long long v7 = (void *)[MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke;
  v10[3] = &unk_2641FE940;
  void v10[4] = self;
  void v10[5] = v7;
  void v10[6] = a3;
  v10[7] = a4;
  dispatch_async(queue, v10);
  return v7;
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == 1
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  v6[0] = MEMORY[0x263EF8330];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[1] = 3221225472;
  v6[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_2;
  v6[3] = &unk_2641FE828;
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 56);
  long long v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "runWiFiPerformanceLoggingWithConfiguration:uuid:reply:", *(void *)(a1 + 48), MEMORY[0x263EF8330], 3221225472, __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_5, &unk_2641FE828, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56));
}

__n128 __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_3;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_4;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

__n128 __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_6;
  v6[3] = &unk_2641FE940;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (![*(id *)(*(void *)(a1 + 32) + 40) count]
    && ![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_7;
  v4[3] = &unk_2641FE800;
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_7(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (id)runWiFiPerformanceLoggingWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3052000000;
  __int16 v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  uint64_t v22 = 0;
  long long v7 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_error___block_invoke;
  v16[3] = &unk_2641FEA58;
  v16[4] = v7;
  v16[5] = &v17;
  id v8 = [(W5Client *)self runWiFiPerformanceLoggingWithConfiguration:a3 reply:v16];
  dispatch_time_t v9 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v7, v9) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v24 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v10 = (id)v18[5];
  id v11 = v8;
  dispatch_time_t v12 = v18;
  id v13 = (void *)v18[5];
  if (a4 && v13)
  {
    *a4 = v13;
    id v13 = (void *)v12[5];
  }
  if (v13) {
    id v14 = 0;
  }
  else {
    id v14 = v8;
  }
  _Block_object_dispose(&v17, 8);
  return v14;
}

intptr_t __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  uint64_t v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

- (void)__cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke;
  block[3] = &unk_2641FE8A0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(queue, block);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (objc_msgSend(*(id *)(a1[4] + 40), "containsObject:", objc_msgSend((id)a1[5], "UUIDString")))
  {
    uint64_t v3 = *(void **)(a1[4] + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_2;
    v9[3] = &unk_2641FE878;
    void v9[4] = a1[6];
    uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v9];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_4;
    v8[3] = &unk_2641FE878;
    uint64_t v5 = a1[5];
    void v8[4] = a1[6];
    [v4 cancelRequestWithUUID:v5 reply:v8];
  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_6;
    block[3] = &unk_2641FEE80;
    void block[4] = a1[6];
    dispatch_async(global_queue, block);
  }
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_5;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_5(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_6(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x263F08338];
    v5[0] = @"W5ParamErr";
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, &v4, 1)));
  }
}

- (void)cancelRequestWithUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __34__W5Client_cancelRequestWithUUID___block_invoke;
  v7[3] = &unk_2641FE850;
  void v7[4] = v5;
  [(W5Client *)self __cancelRequestWithUUID:a3 reply:v7];
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v9 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __34__W5Client_cancelRequestWithUUID___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)__cancelAllRequestsAndReply:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke;
  v4[3] = &unk_2641FE800;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke_2;
  v6[3] = &unk_2641FE878;
  void v6[4] = *(void *)(a1 + 40);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke_4;
  v5[3] = &unk_2641FE878;
  void v5[4] = *(void *)(a1 + 40);
  [v4 cancelAllRequestsAndReply:v5];
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke_5;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke_5(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (void)cancelAllRequests
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __29__W5Client_cancelAllRequests__block_invoke;
  v5[3] = &unk_2641FE850;
  void v5[4] = v3;
  [(W5Client *)self __cancelAllRequestsAndReply:v5];
  dispatch_time_t v4 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v3, v4) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v7 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __29__W5Client_cancelAllRequests__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)cancelRequestWithUUID:(id)a3 peer:(id)a4 type:(int64_t)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke;
  block[3] = &unk_2641FEEA8;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = a6;
  block[8] = a5;
  dispatch_async(queue, block);
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke(void *a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(a1[4] + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_2;
  v9[3] = &unk_2641FE878;
  void v9[4] = a1[7];
  dispatch_time_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_4;
  v8[3] = &unk_2641FE878;
  uint64_t v7 = a1[8];
  void v8[4] = a1[7];
  [v4 cancelRequestWithUUID:v5 OnPeer:v6 OfType:v7 reply:v8];
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_5;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_5(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (void)__log:(id)a3 timestamp:(BOOL)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__W5Client___log_timestamp_reply___block_invoke;
  v6[3] = &unk_2641FEED0;
  void v6[5] = a3;
  void v6[6] = a5;
  void v6[4] = self;
  BOOL v7 = a4;
  dispatch_async(queue, v6);
}

void __34__W5Client___log_timestamp_reply___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __34__W5Client___log_timestamp_reply___block_invoke_2;
  v8[3] = &unk_2641FE878;
  void v8[4] = *(void *)(a1 + 48);
  dispatch_time_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __34__W5Client___log_timestamp_reply___block_invoke_4;
  v7[3] = &unk_2641FE878;
  uint64_t v6 = *(void *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 48);
  [v4 log:v6 timestamp:v5 reply:v7];
}

void __34__W5Client___log_timestamp_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__W5Client___log_timestamp_reply___block_invoke_3;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __34__W5Client___log_timestamp_reply___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void __34__W5Client___log_timestamp_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__W5Client___log_timestamp_reply___block_invoke_5;
  v6[3] = &unk_2641FE800;
  uint64_t v5 = *(void *)(a1 + 32);
  void v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __34__W5Client___log_timestamp_reply___block_invoke_5(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (void)log:(id)a3 timestamp:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v7 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __26__W5Client_log_timestamp___block_invoke;
  v9[3] = &unk_2641FE850;
  void v9[4] = v7;
  [(W5Client *)self __log:a3 timestamp:v4 reply:v9];
  dispatch_time_t v8 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v7, v8) >= 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v11 = 0x4010000000000000;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __26__W5Client_log_timestamp___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)__eventCallbackSignatureForEventID:(int64_t)a3 peer:(id)a4
{
  return (id)[NSString stringWithFormat:@"%ld/%@", a3, objc_msgSend(a4, "peerID")];
}

- (BOOL)startMonitoringFaultEventsForPeer:(id)a3 eventHandler:(id)a4 error:(id *)a5
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__0;
  uint64_t v24 = __Block_byref_object_dispose__0;
  uint64_t v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke;
  block[3] = &unk_2641FE8A0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(queue, block);
  conn = self->_conn;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_182;
  v18[3] = &unk_2641FEAF8;
  v18[4] = &v20;
  id v10 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_2;
  v17[3] = &unk_2641FEAF8;
  v17[4] = &v20;
  [v10 startMonitoringFaultEventsForPeer:a3 reply:v17];
  id v11 = (id)v21[5];
  uint64_t v12 = v21;
  if (v21[5])
  {
    id v13 = self->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_3;
    v16[3] = &unk_2641FED40;
    v16[4] = a3;
    v16[5] = self;
    dispatch_async(v13, v16);
    uint64_t v12 = v21;
    if (a5) {
      *a5 = (id)v21[5];
    }
  }
  BOOL v14 = v12[5] == 0;
  _Block_object_dispose(&v20, 8);
  return v14;
}

void __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (![*(id *)(*(void *)(a1 + 32) + 32) count]
    && ![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
  }
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:&unk_26C50A0B8];
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "addObject:");
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "__eventCallbackSignatureForEventID:peer:", 38, v3));
}

uint64_t __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "removeObject:");
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", 0, objc_msgSend(*(id *)(a1 + 40), "__eventCallbackSignatureForEventID:peer:", 38, v3));
  [*(id *)(*(void *)(a1 + 40) + 32) removeObject:&unk_26C50A0B8];
  if (![*(id *)(*(void *)(a1 + 40) + 32) count]
    && ![*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setExportedObject:0];
  }
}

- (BOOL)stopMonitoringFaultEventsForPeer:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  uint64_t v23 = 0;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke;
  v17[3] = &unk_2641FEAF8;
  v17[4] = &v18;
  id v8 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke_2;
  v16[3] = &unk_2641FEAF8;
  v16[4] = &v18;
  [v8 stopMonitoringFaultEventsForPeer:a3 reply:v16];
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke_3;
  v15[3] = &unk_2641FED40;
  v15[4] = a3;
  void v15[5] = self;
  dispatch_async(queue, v15);
  id v10 = (id)v19[5];
  id v11 = v19;
  uint64_t v12 = (void *)v19[5];
  if (a4 && v12)
  {
    *a4 = v12;
    uint64_t v12 = (void *)v11[5];
  }
  BOOL v13 = v12 == 0;
  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "removeObject:");
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", 0, objc_msgSend(*(id *)(a1 + 40), "__eventCallbackSignatureForEventID:peer:", 38, v3));
  [*(id *)(*(void *)(a1 + 40) + 32) removeObject:&unk_26C50A0B8];
  if (![*(id *)(*(void *)(a1 + 40) + 32) count]
    && ![*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setExportedObject:0];
  }
}

- (BOOL)submitFaultEvent:(id)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3052000000;
  uint64_t v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  uint64_t v20 = 0;
  conn = self->_conn;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __35__W5Client_submitFaultEvent_error___block_invoke;
  v14[3] = &unk_2641FEAF8;
  v14[4] = &v15;
  id v7 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__W5Client_submitFaultEvent_error___block_invoke_2;
  v13[3] = &unk_2641FEAF8;
  v13[4] = &v15;
  [v7 submitFaultEvent:a3 reply:v13];
  id v8 = (id)v16[5];
  uint64_t v9 = v16;
  id v10 = (void *)v16[5];
  if (a4 && v10)
  {
    *a4 = v10;
    id v10 = (void *)v9[5];
  }
  BOOL v11 = v10 == 0;
  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t __35__W5Client_submitFaultEvent_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __35__W5Client_submitFaultEvent_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)faultEventCacheForPeer:(id)a3 error:(id *)a4
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__0;
  uint64_t v26 = __Block_byref_object_dispose__0;
  uint64_t v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  uint64_t v21 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__W5Client_faultEventCacheForPeer_error___block_invoke;
  v15[3] = &unk_2641FEAF8;
  v15[4] = &v16;
  id v7 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __41__W5Client_faultEventCacheForPeer_error___block_invoke_2;
  v14[3] = &unk_2641FEEF8;
  v14[4] = &v16;
  void v14[5] = &v22;
  [v7 queryFaultEventCacheForPeer:a3 reply:v14];
  id v8 = (id)v17[5];
  id v9 = (id)v23[5];
  id v10 = v17;
  BOOL v11 = (void *)v17[5];
  if (a4 && v11)
  {
    *a4 = v11;
    BOOL v11 = (void *)v10[5];
  }
  if (v11) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = (void *)v23[5];
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v12;
}

uint64_t __41__W5Client_faultEventCacheForPeer_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __41__W5Client_faultEventCacheForPeer_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];
  uint64_t result = [a3 copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)receivedEvent:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__W5Client_receivedEvent___block_invoke;
  v4[3] = &unk_2641FED40;
  void v4[4] = a3;
  void v4[5] = self;
  dispatch_async(queue, v4);
}

void __26__W5Client_receivedEvent___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x21669CC20]();
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "info"), "objectForKeyedSubscript:", @"UUID"), "UUIDString"));
  if (v3
    || (uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "__eventCallbackSignatureForEventID:peer:", objc_msgSend(*(id *)(a1 + 32), "eventID"), objc_msgSend(*(id *)(a1 + 32), "peer")))) != 0)
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(v4 + 72)
    && objc_msgSend(*(id *)(v4 + 32), "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "eventID"))))
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 72) + 16))();
  }
}

- (void)receivedPeerDiscoveryEvent:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__W5Client_receivedPeerDiscoveryEvent___block_invoke;
  v4[3] = &unk_2641FED40;
  void v4[4] = a3;
  void v4[5] = self;
  dispatch_async(queue, v4);
}

void __39__W5Client_receivedPeerDiscoveryEvent___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v2 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 136315906;
    id v9 = "-[W5Client receivedPeerDiscoveryEvent:]_block_invoke";
    __int16 v10 = 2080;
    BOOL v11 = "W5Client.m";
    __int16 v12 = 1024;
    int v13 = 2478;
    __int16 v14 = 2114;
    uint64_t v15 = v4;
    LODWORD(v7) = 38;
    uint64_t v6 = &v8;
    _os_log_send_and_compose_impl();
  }
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "info", v6, v7), "objectForKeyedSubscript:", @"UUID"), "UUIDString"));
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, *(void *)(a1 + 32));
  }
}

- (id)eventCallback
{
  return self->_eventCallback;
}

@end