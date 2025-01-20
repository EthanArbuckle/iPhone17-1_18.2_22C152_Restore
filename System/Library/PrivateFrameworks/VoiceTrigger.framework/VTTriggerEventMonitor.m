@interface VTTriggerEventMonitor
+ (id)sharedMonitor;
- (VTTriggerEventMonitor)init;
- (void)_attemptConnection;
- (void)_attemptConnectionInQueue;
- (void)_earlyDetected;
- (void)_enableTriggerEventXPCNotification:(BOOL)a3;
- (void)_invalidateConnection;
- (void)_voiceTriggered;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)earlyDetected;
- (void)removeObserver:(id)a3;
- (void)voiceTriggered;
@end

@implementation VTTriggerEventMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)earlyDetected
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3585;
  v17 = __Block_byref_object_dispose__3586;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__VTTriggerEventMonitor_earlyDetected__block_invoke;
  block[3] = &unk_264325F50;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)v14[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "earlyDetected", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __38__VTTriggerEventMonitor_earlyDetected__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (void)voiceTriggered
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3585;
  v17 = __Block_byref_object_dispose__3586;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__VTTriggerEventMonitor_voiceTriggered__block_invoke;
  block[3] = &unk_264325F50;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)v14[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "voiceTriggered", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __39__VTTriggerEventMonitor_voiceTriggered__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (void)_earlyDetected
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_observers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "earlyDetected", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_voiceTriggered
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_observers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "voiceTriggered", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__VTTriggerEventMonitor_removeObserver___block_invoke;
  v7[3] = &unk_264325FF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __40__VTTriggerEventMonitor_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _enableTriggerEventXPCNotification:0];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__VTTriggerEventMonitor_addObserver___block_invoke;
  v7[3] = &unk_264325FF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __37__VTTriggerEventMonitor_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _enableTriggerEventXPCNotification:1];
}

- (void)_enableTriggerEventXPCNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v4 enableTriggerEventXPCNotification:v3];
}

- (void)_invalidateConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__VTTriggerEventMonitor__invalidateConnection__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__VTTriggerEventMonitor__invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (void)_attemptConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    BOOL v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.voicetrigger.voicetriggerservice" options:4096];
    connection = self->_connection;
    self->_connection = v3;

    uint64_t v5 = self->_connection;
    id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9B1EB8];
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    v7 = self->_connection;
    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9AF010];
    [(NSXPCConnection *)v7 setExportedInterface:v8];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    long long v9 = self->_connection;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __43__VTTriggerEventMonitor__attemptConnection__block_invoke;
    uint64_t v13 = &unk_264325CD0;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:&v10];
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_93, v10, v11, v12, v13);
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __43__VTTriggerEventMonitor__attemptConnection__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);

  if (v1)
  {
    id v2 = objc_loadWeakRetained(&to);
    [v2 _invalidateConnection];
  }
  objc_destroyWeak(&to);
}

- (void)_attemptConnectionInQueue
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__VTTriggerEventMonitor__attemptConnectionInQueue__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__VTTriggerEventMonitor__attemptConnectionInQueue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attemptConnection];
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  int notifyTokenLegacyTrigger = self->_notifyTokenLegacyTrigger;
  if (notifyTokenLegacyTrigger != -1) {
    notify_cancel(notifyTokenLegacyTrigger);
  }
  int notifyTokenLegacyEarlyDetect = self->_notifyTokenLegacyEarlyDetect;
  if (notifyTokenLegacyEarlyDetect != -1) {
    notify_cancel(notifyTokenLegacyEarlyDetect);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTTriggerEventMonitor;
  [(VTTriggerEventMonitor *)&v6 dealloc];
}

- (VTTriggerEventMonitor)init
{
  v21.receiver = self;
  v21.super_class = (Class)VTTriggerEventMonitor;
  id v2 = [(VTTriggerEventMonitor *)&v21 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VTTriggerEventMonitor Connection Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_int notifyToken = -1;
    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    objc_initWeak(&location, v2);
    v7 = v2->_queue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __29__VTTriggerEventMonitor_init__block_invoke;
    handler[3] = &unk_2643257C8;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch("com.apple.voicetrigger.XPCRestarted", &v2->_notifyToken, v7, handler);
    v2->_int notifyTokenLegacyTrigger = -1;
    id v8 = v2->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __29__VTTriggerEventMonitor_init__block_invoke_2;
    v16[3] = &unk_2643257C8;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch("com.apple.coreaudio.borealisTrigger", &v2->_notifyTokenLegacyTrigger, v8, v16);
    v2->_int notifyTokenLegacyEarlyDetect = -1;
    long long v9 = v2->_queue;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __29__VTTriggerEventMonitor_init__block_invoke_3;
    id v14 = &unk_2643257C8;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.voicetrigger.EarlyDetect", &v2->_notifyTokenLegacyEarlyDetect, v9, &v11);
    [(VTTriggerEventMonitor *)v2 _attemptConnectionInQueue];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__VTTriggerEventMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _attemptConnection];
  [WeakRetained _enableTriggerEventXPCNotification:1];
}

void __29__VTTriggerEventMonitor_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _voiceTriggered];
}

void __29__VTTriggerEventMonitor_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _earlyDetected];
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_3601);
  }
  id v2 = (void *)sharedMonitor_sharedMonitor;

  return v2;
}

uint64_t __38__VTTriggerEventMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor_sharedMonitor = objc_alloc_init(VTTriggerEventMonitor);

  return MEMORY[0x270F9A758]();
}

@end