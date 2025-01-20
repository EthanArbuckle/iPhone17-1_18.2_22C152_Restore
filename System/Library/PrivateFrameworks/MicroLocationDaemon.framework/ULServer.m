@interface ULServer
+ (id)_createSourceForSignal:(int)a3 withBlock:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDate)stimulationDate;
- (NSMutableSet)clientConnections;
- (NSMutableSet)signals;
- (ULEnvironment)environment;
- (ULLogicAdapter)logicAdapter;
- (ULServer)initWithEnvironment:(id)a3;
- (id)_remoteProxyForToken:(id)a3;
- (id)diagnosticInfo;
- (void)_exit;
- (void)_start;
- (void)_stop;
- (void)clientConnectionSeveredConnection:(id)a3;
- (void)dealloc;
- (void)didCompleteObservationWithMetaInformation:(id)a3 toConnection:(id)a4;
- (void)didCompletePredictionWithMetaInformation:(id)a3 toConnection:(id)a4;
- (void)didCompleteRequest:(id)a3 withError:(id)a4 toConnection:(id)a5;
- (void)didCreateCustomLoiAtCurrentLocationWithError:(id)a3 forConnection:(id)a4;
- (void)didFailWithError:(id)a3 toConnection:(id)a4;
- (void)didRemoveCustomLoiWithIdentifier:(id)a3 forConnection:(id)a4 withError:(id)a5;
- (void)didSendGenericEvent:(unint64_t)a3 withDescription:(id)a4 toConnection:(id)a5;
- (void)didSendPredictionResults:(id)a3 toConnection:(id)a4;
- (void)didUpdateServiceStatus:(id)a3 toConnection:(id)a4;
- (void)locationsOfInterestDidClearNotification;
- (void)resetPrivacyWarningsNotification;
- (void)setClientConnections:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setLogicAdapter:(id)a3;
- (void)setSignals:(id)a3;
- (void)setStimulationDate:(id)a3;
@end

@implementation ULServer

- (ULServer)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [v4 queue];
  dispatch_assert_queue_not_V2(v5);

  v12.receiver = self;
  v12.super_class = (Class)ULServer;
  v6 = [(ULServer *)&v12 init];
  if (v6)
  {
    v7 = [v4 queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __32__ULServer_initWithEnvironment___block_invoke;
    v9[3] = &unk_2653F9228;
    v10 = v6;
    id v11 = v4;
    dispatch_sync(v7, v9);
  }
  return v6;
}

uint64_t __32__ULServer_initWithEnvironment___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnvironment:*(void *)(a1 + 40)];
  v2 = [MEMORY[0x263EFF9C0] set];
  [*(id *)(a1 + 32) setClientConnections:v2];

  v3 = [*(id *)(a1 + 32) environment];
  id v4 = [v3 queue];
  +[ULTimerFactory setPrimaryQueue:v4];

  v5 = [ULLogicAdapter alloc];
  v6 = [*(id *)(a1 + 32) environment];
  v7 = [(ULLogicAdapter *)v5 initWithEnvironment:v6 delegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setLogicAdapter:v7];

  v8 = [MEMORY[0x263EFF9C0] set];
  [*(id *)(a1 + 32) setSignals:v8];

  v9 = *(void **)(a1 + 32);
  return [v9 _start];
}

- (void)dealloc
{
  [(ULServer *)self _stop];
  v3.receiver = self;
  v3.super_class = (Class)ULServer;
  [(ULServer *)&v3 dealloc];
}

- (void)locationsOfInterestDidClearNotification
{
  objc_super v3 = [(ULServer *)self environment];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ULServer_locationsOfInterestDidClearNotification__block_invoke;
  block[3] = &unk_2653F91D8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __51__ULServer_locationsOfInterestDidClearNotification__block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "locationsOfInterestDidClearNotification", v4, 2u);
  }
  objc_super v3 = [*(id *)(a1 + 32) logicAdapter];
  [v3 purgeMicroLocationData];
}

- (void)resetPrivacyWarningsNotification
{
  objc_super v3 = [(ULServer *)self environment];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ULServer_resetPrivacyWarningsNotification__block_invoke;
  block[3] = &unk_2653F91D8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __44__ULServer_resetPrivacyWarningsNotification__block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "resetPrivacyWarningsNotification", v4, 2u);
  }
  objc_super v3 = [*(id *)(a1 + 32) logicAdapter];
  [v3 purgeMicroLocationData];
}

- (void)_start
{
  objc_super v3 = [(ULServer *)self environment];
  id v4 = [v3 diagnostics];
  [v4 addProvider:self];

  objc_initWeak(&location, self);
  v5 = [(ULServer *)self signals];
  v6 = objc_opt_class();
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __18__ULServer__start__block_invoke;
  id v11 = &unk_2653F9200;
  objc_copyWeak(&v12, &location);
  v7 = [v6 _createSourceForSignal:15 withBlock:&v8];
  objc_msgSend(v5, "addObject:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __18__ULServer__start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
    }
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "Handle SIGTERM", buf, 2u);
    }
    objc_super v3 = [MEMORY[0x263EFF910] date];
    [WeakRetained setStimulationDate:v3];

    id v4 = [WeakRetained environment];
    v5 = [v4 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __18__ULServer__start__block_invoke_6;
    block[3] = &unk_2653F91D8;
    block[4] = WeakRetained;
    dispatch_async(v5, block);
  }
}

uint64_t __18__ULServer__start__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exit];
}

- (void)_stop
{
  objc_super v3 = [(ULServer *)self environment];
  id v4 = [v3 diagnostics];
  [v4 removeProvider:self];

  id v5 = [(ULServer *)self signals];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_7];
}

void __17__ULServer__stop__block_invoke(int a1, dispatch_source_t source)
{
}

- (id)_remoteProxyForToken:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ULServer *)self environment];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [(ULServer *)self clientConnections];
  uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 connectionToken];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          uint64_t v8 = [v11 remoteObjectProxy];
          goto LABEL_11;
        }
      }
      uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_exit
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = [(ULServer *)self environment];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  id v5 = +[ULTransactionManager shared];
  [v5 invalidateAllTransactions];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
  }
  v6 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSNumber;
    uint64_t v8 = (void *)MEMORY[0x263EFF910];
    uint64_t v9 = v6;
    v10 = [v8 date];
    id v11 = [(ULServer *)self stimulationDate];
    [v10 timeIntervalSinceDate:v11];
    id v12 = objc_msgSend(v7, "numberWithDouble:");
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "Clean exit in: %@", (uint8_t *)&v13, 0xCu);
  }
  xpc_transaction_exit_clean();
}

+ (id)_createSourceForSignal:(int)a3 withBlock:(id)a4
{
  id v5 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  v6 = dispatch_source_create(MEMORY[0x263EF83F0], a3, 0, MEMORY[0x263EF83A0]);
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);
  return v6;
}

- (ULEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (ULLogicAdapter)logicAdapter
{
  return self->_logicAdapter;
}

- (void)setLogicAdapter:(id)a3
{
}

- (NSMutableSet)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
}

- (NSDate)stimulationDate
{
  return self->_stimulationDate;
}

- (void)setStimulationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stimulationDate, 0);
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_logicAdapter, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ULServer *)self environment];
  uint64_t v9 = [v8 queue];
  dispatch_assert_queue_not_V2(v9);

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v10 = [(ULServer *)self environment];
  id v11 = [v10 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ULServer_NSXPCListenerDelegate__listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_2653F92E8;
  id v15 = v7;
  long long v16 = self;
  long long v17 = &v18;
  id v12 = v7;
  dispatch_sync(v11, block);

  LOBYTE(v7) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v7;
}

void __70__ULServer_NSXPCListenerDelegate__listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = *(void **)(a1 + 32);
    int v23 = 138412290;
    v24 = v3;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "trying to accept connection: %@", (uint8_t *)&v23, 0xCu);
  }
  id v4 = [ULClientProcessConnection alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = [v6 logicAdapter];
  uint64_t v8 = [*(id *)(a1 + 40) logicAdapter];
  uint64_t v9 = [*(id *)(a1 + 40) logicAdapter];
  v10 = [*(id *)(a1 + 40) environment];
  id v11 = [v10 queue];
  id v12 = [(ULClientProcessConnection *)v4 initWithXPCConnection:v5 delegate:v6 serviceHandling:v7 legacyServiceHandling:v8 diagnosticsHandling:v9 queue:v11];

  if (v12)
  {
    int v13 = [(ULClientProcessConnection *)v12 signingIdentity];

    if (v13)
    {
      v14 = [*(id *)(a1 + 40) clientConnections];
      [v14 addObject:v12];

      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
      }
      id v15 = (void *)logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = v15;
        long long v17 = [(ULClientProcessConnection *)v12 signingIdentity];
        uint64_t v18 = NSNumber;
        v19 = [*(id *)(a1 + 40) clientConnections];
        uint64_t v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
        int v23 = 138412546;
        v24 = v17;
        __int16 v25 = 2112;
        v26 = v20;
        _os_log_impl(&dword_25631F000, v16, OS_LOG_TYPE_DEFAULT, "Accepting connection of: %@, number of connections: %@", (uint8_t *)&v23, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_21;
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
    }
    char v21 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      v22 = "Connection is not signed, declining";
      goto LABEL_20;
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
    }
    char v21 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      v22 = "Connection declined";
LABEL_20:
      _os_log_impl(&dword_25631F000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 2u);
    }
  }
LABEL_21:
}

- (void)clientConnectionSeveredConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULServer *)self environment];
  id v6 = [v5 queue];
  dispatch_assert_queue_not_V2(v6);

  id v7 = [(ULServer *)self environment];
  uint64_t v8 = [v7 queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__ULServer_ULClientProcessConnectionDelegate__clientConnectionSeveredConnection___block_invoke;
  v10[3] = &unk_2653F9228;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

void __81__ULServer_ULClientProcessConnectionDelegate__clientConnectionSeveredConnection___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) clientConnections];
  [v2 removeObject:*(void *)(a1 + 40)];

  objc_super v3 = [*(id *)(a1 + 32) logicAdapter];
  id v4 = [*(id *)(a1 + 40) connectionToken];
  [v3 removePendingConnectionRequestsByConnectionToken:v4];

  uint64_t v5 = [*(id *)(a1 + 40) serviceIdentifier];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) logicAdapter];
    id v7 = [*(id *)(a1 + 40) connectionToken];
    uint64_t v8 = [*(id *)(a1 + 40) signingIdentity];
    id v9 = [MEMORY[0x263F08C38] UUID];
    [v6 disconnectWithConnectionToken:v7 clientIdentifier:v8 requestIdentifier:v9];
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_134);
  }
  v10 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = *(void **)(a1 + 40);
    id v12 = v10;
    int v13 = [v11 signingIdentity];
    v14 = NSNumber;
    id v15 = [*(id *)(a1 + 32) clientConnections];
    long long v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    int v17 = 138412546;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v16;
    _os_log_impl(&dword_25631F000, v12, OS_LOG_TYPE_DEFAULT, "Connection (%@) severed, number of connections left: %@", (uint8_t *)&v17, 0x16u);
  }
}

- (id)diagnosticInfo
{
  objc_super v3 = [(ULServer *)self environment];
  id v4 = [v3 queue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [(ULServer *)self environment];
  id v6 = [v5 queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__ULServer_ULDiagnosticsProvider__diagnosticInfo__block_invoke;
  v9[3] = &unk_2653F9310;
  void v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__ULServer_ULDiagnosticsProvider__diagnosticInfo__block_invoke(uint64_t a1)
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"date";
  v2 = [MEMORY[0x263EFF910] date];
  v12[0] = v2;
  v11[1] = @"platformInfo";
  objc_super v3 = [MEMORY[0x263F55810] platformInfo];
  v12[1] = v3;
  v11[2] = @"clientConnections";
  id v4 = [*(id *)(a1 + 32) clientConnections];
  uint64_t v5 = [v4 description];
  v12[2] = v5;
  v11[3] = @"transactions";
  id v6 = +[ULTransactionManager shared];
  id v7 = [v6 dumpActiveTransactions];
  v12[3] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)didSendPredictionResults:(id)a3 toConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ULServer *)self environment];
  uint64_t v9 = [v8 queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(ULServer *)self _remoteProxyForToken:v6];

  [v10 didUpdatePrediction:v7];
}

- (void)didUpdateServiceStatus:(id)a3 toConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ULServer *)self environment];
  uint64_t v9 = [v8 queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(ULServer *)self _remoteProxyForToken:v6];

  [v10 didUpdateServiceStatus:v7];
}

- (void)didCompleteRequest:(id)a3 withError:(id)a4 toConnection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ULServer *)self environment];
  uint64_t v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(ULServer *)self _remoteProxyForToken:v8];

  [v13 didCompleteRequest:v10 withError:v9];
}

- (void)didCreateCustomLoiAtCurrentLocationWithError:(id)a3 forConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ULServer *)self environment];
  id v9 = [v8 queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(ULServer *)self _remoteProxyForToken:v6];

  [v10 didCreateCustomLocationOfInterestWithError:v7];
}

- (void)didRemoveCustomLoiWithIdentifier:(id)a3 forConnection:(id)a4 withError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ULServer *)self environment];
  uint64_t v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(ULServer *)self _remoteProxyForToken:v9];

  [v13 didRemoveCustomLocationOfInterestWithIdentifier:v10 withError:v8];
}

- (void)didFailWithError:(id)a3 toConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ULServer *)self environment];
  id v9 = [v8 queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(ULServer *)self _remoteProxyForToken:v6];

  [v10 didFailWithError:v7];
}

- (void)didSendGenericEvent:(unint64_t)a3 withDescription:(id)a4 toConnection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(ULServer *)self environment];
  id v11 = [v10 queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(ULServer *)self _remoteProxyForToken:v8];

  [v12 didSendGenericEvent:a3 withDescription:v9];
}

- (void)didCompleteObservationWithMetaInformation:(id)a3 toConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ULServer *)self environment];
  id v9 = [v8 queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(ULServer *)self _remoteProxyForToken:v6];

  [v10 didCompleteObservationWithMetaInformation:v7];
}

- (void)didCompletePredictionWithMetaInformation:(id)a3 toConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ULServer *)self environment];
  id v9 = [v8 queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(ULServer *)self _remoteProxyForToken:v6];

  [v10 didCompletePredictionWithMetaInformation:v7];
}

@end