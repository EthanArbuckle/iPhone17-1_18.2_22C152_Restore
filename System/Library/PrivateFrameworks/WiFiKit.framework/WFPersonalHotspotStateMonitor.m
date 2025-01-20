@interface WFPersonalHotspotStateMonitor
- (NSRunLoop)callbackRunLoop;
- (NSThread)callbackThread;
- (OS_dispatch_queue)internalQueue;
- (WFClient)client;
- (WFPersonalHotspotStateMonitor)init;
- (int64_t)clientConnections;
- (void)_runManagerCallbackThread;
- (void)_spawnManagerCallbackThread;
- (void)asyncMISDiscoveryState:(id)a3;
- (void)dealloc;
- (void)setCallbackRunLoop:(id)a3;
- (void)setCallbackThread:(id)a3;
- (void)setClient:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setMISDiscoveryState:(BOOL)a3 immediateDisable:(BOOL)a4;
@end

@implementation WFPersonalHotspotStateMonitor

- (WFPersonalHotspotStateMonitor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)WFPersonalHotspotStateMonitor;
  v2 = [(WFPersonalHotspotStateMonitor *)&v12 init];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifikit.personal-hotspot", 0);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v3;

  v5 = v2->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WFPersonalHotspotStateMonitor_init__block_invoke;
  block[3] = &unk_26478E528;
  v6 = v2;
  v11 = v6;
  dispatch_async(v5, block);
  v7 = WFLogForCategory(4uLL);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[WFPersonalHotspotStateMonitor init]";
    _os_log_impl(&dword_226071000, v7, v8, "%s", buf, 0xCu);
  }

  return v6;
}

void __37__WFPersonalHotspotStateMonitor_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _spawnManagerCallbackThread];
  v2 = [WFClient alloc];
  id v6 = [*(id *)(a1 + 32) callbackRunLoop];
  uint64_t v3 = [(WFClient *)v2 initWithCallbackRunLoop:v6];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;
}

- (void)dealloc
{
  uint64_t v3 = [(WFPersonalHotspotStateMonitor *)self callbackThread];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)WFPersonalHotspotStateMonitor;
  [(WFPersonalHotspotStateMonitor *)&v4 dealloc];
}

- (int64_t)clientConnections
{
  int64_t result = (int64_t)_NETRBClientCreate(MEMORY[0x263EF83A0], &__block_literal_global_8, 0);
  unsigned int v5 = 0;
  if (result)
  {
    int64_t v3 = result;
    int v4 = 0;
    _NETRBClientGetHostCount(result, &v4, &v5);
    _NETRBClientDestroy(v3);
    return v5;
  }
  return result;
}

uint64_t __50__WFPersonalHotspotStateMonitor_clientConnections__block_invoke()
{
  return 0;
}

- (void)_spawnManagerCallbackThread
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08B88]) initWithTarget:self selector:sel__runManagerCallbackThread object:0];
  [v3 start];
  int v4 = WFLogForCategory(4uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    v7 = "-[WFPersonalHotspotStateMonitor _spawnManagerCallbackThread]";
    __int16 v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: thread %@", (uint8_t *)&v6, 0x16u);
  }

  [(WFPersonalHotspotStateMonitor *)self setCallbackThread:v3];
  [(WFPersonalHotspotStateMonitor *)self performSelector:sel_class onThread:v3 withObject:0 waitUntilDone:1];
}

- (void)_runManagerCallbackThread
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t v3 = (void *)MEMORY[0x22A645F80](self, a2);
  int v4 = [MEMORY[0x263F08B88] currentThread];
  [v4 setName:@"WFPersonalHotspotStateMonitor callback thread"];

  self->_callbackRunLoop = (NSRunLoop *)(id)[MEMORY[0x263EFF9F0] currentRunLoop];
  os_log_type_t v5 = [MEMORY[0x263EFF968] port];
  int v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v5 scheduleInRunLoop:v6 forMode:*MEMORY[0x263EFF588]];

  v7 = WFLogForCategory(4uLL);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    callbackRunLoop = self->_callbackRunLoop;
    int v11 = 136315394;
    objc_super v12 = "-[WFPersonalHotspotStateMonitor _runManagerCallbackThread]";
    __int16 v13 = 2112;
    v14 = callbackRunLoop;
    _os_log_impl(&dword_226071000, v7, v8, "%s: runLoop %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v10 run];
}

- (void)setMISDiscoveryState:(BOOL)a3 immediateDisable:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  v7 = WFLogForCategory(4uLL);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[WFPersonalHotspotStateMonitor setMISDiscoveryState:immediateDisable:]";
    __int16 v16 = 1024;
    BOOL v17 = v5;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    _os_log_impl(&dword_226071000, v7, v8, "%s: state %d immediateDisable: %d", buf, 0x18u);
  }

  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__WFPersonalHotspotStateMonitor_setMISDiscoveryState_immediateDisable___block_invoke;
  v10[3] = &unk_26478F888;
  objc_copyWeak(&v11, (id *)buf);
  BOOL v12 = v5;
  BOOL v13 = v4;
  dispatch_async(internalQueue, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __71__WFPersonalHotspotStateMonitor_setMISDiscoveryState_immediateDisable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v3 = [WeakRetained client];
  [v3 setMISDiscoveryState:*(unsigned __int8 *)(a1 + 40) immediateDisable:*(unsigned __int8 *)(a1 + 41)];

  if (objc_opt_class())
  {
    id v4 = [MEMORY[0x263F31E08] sharedInstance];
    [v4 reloadControlsForExtension:@"com.apple.WiFiKit.PersonalHotspotControl" kind:@"PersonalHotspotControl" reason:@"Connectivity module triggered MIS state change"];
  }
}

- (void)asyncMISDiscoveryState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__WFPersonalHotspotStateMonitor_asyncMISDiscoveryState___block_invoke;
    block[3] = &unk_26478F490;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(internalQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __56__WFPersonalHotspotStateMonitor_asyncMISDiscoveryState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v3 = [WeakRetained client];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__WFPersonalHotspotStateMonitor_asyncMISDiscoveryState___block_invoke_2;
  v4[3] = &unk_26478F8B0;
  id v5 = *(id *)(a1 + 32);
  [v3 asyncMISDiscoveryState:v4];
}

uint64_t __56__WFPersonalHotspotStateMonitor_asyncMISDiscoveryState___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = WFLogForCategory(4uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    id v8 = "-[WFPersonalHotspotStateMonitor asyncMISDiscoveryState:]_block_invoke_2";
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_226071000, v4, v5, "%s: MIS discovery state: %d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSRunLoop)callbackRunLoop
{
  return self->_callbackRunLoop;
}

- (void)setCallbackRunLoop:(id)a3
{
  self->_callbackRunLoop = (NSRunLoop *)a3;
}

- (NSThread)callbackThread
{
  return self->_callbackThread;
}

- (void)setCallbackThread:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end