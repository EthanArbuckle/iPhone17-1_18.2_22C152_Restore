@interface OSADiagnosticMonitor
+ (OSADiagnosticMonitor)sharedMonitor;
- (OSADiagnosticMonitor)init;
- (id)q_serverConnection;
- (void)addEventObserver:(id)a3 forTypes:(id)a4;
- (void)addWriteObserver:(id)a3 forTypes:(id)a4;
- (void)didWriteLog:(id)a3;
- (void)q_addEventObserver:(id)a3 forTypes:(id)a4;
- (void)q_addWriteObserver:(id)a3 forTypes:(id)a4;
- (void)q_computeEventObserverTypes;
- (void)q_computeWriteObserverTypes;
- (void)q_registerForEventTypes;
- (void)q_registerForWriteTypes;
- (void)q_removeEventObserver:(id)a3 andComputeObservedTypes:(BOOL)a4;
- (void)q_removeWriteObserver:(id)a3 andComputeObservedTypes:(BOOL)a4;
- (void)q_teardownServerConnectionIfNoMoreObservers;
- (void)receivedLogEvent:(id)a3;
- (void)removeEventObserver:(id)a3;
- (void)removeWriteObserver:(id)a3;
- (void)willWriteLog:(id)a3;
@end

@implementation OSADiagnosticMonitor

+ (OSADiagnosticMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedMonitor__shared;
  return (OSADiagnosticMonitor *)v2;
}

uint64_t __37__OSADiagnosticMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor__shared = objc_alloc_init(OSADiagnosticMonitor);
  return MEMORY[0x1F41817F8]();
}

- (OSADiagnosticMonitor)init
{
  v16.receiver = self;
  v16.super_class = (Class)OSADiagnosticMonitor;
  v2 = [(OSADiagnosticMonitor *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.osanalytics.diagnosticsmonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.osanalytics.diagnosticmonitor.calloutqueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    eventObservers = v2->_eventObservers;
    v2->_eventObservers = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    writeObservers = v2->_writeObservers;
    v2->_writeObservers = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    observedEventTypes = v2->_observedEventTypes;
    v2->_observedEventTypes = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    observedWriteTypes = v2->_observedWriteTypes;
    v2->_observedWriteTypes = (NSMutableSet *)v13;
  }
  return v2;
}

- (void)addEventObserver:(id)a3 forTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__OSADiagnosticMonitor_addEventObserver_forTypes___block_invoke;
  block[3] = &unk_1E60C45C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __50__OSADiagnosticMonitor_addEventObserver_forTypes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addEventObserver:forTypes:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removeEventObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__OSADiagnosticMonitor_removeEventObserver___block_invoke;
  v7[3] = &unk_1E60C4580;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __44__OSADiagnosticMonitor_removeEventObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_removeEventObserver:andComputeObservedTypes:", *(void *)(a1 + 40), 1);
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "q_teardownServerConnectionIfNoMoreObservers");
}

- (void)addWriteObserver:(id)a3 forTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__OSADiagnosticMonitor_addWriteObserver_forTypes___block_invoke;
  block[3] = &unk_1E60C45C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __50__OSADiagnosticMonitor_addWriteObserver_forTypes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addWriteObserver:forTypes:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removeWriteObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__OSADiagnosticMonitor_removeWriteObserver___block_invoke;
  v7[3] = &unk_1E60C4580;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __44__OSADiagnosticMonitor_removeWriteObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_removeWriteObserver:andComputeObservedTypes:", *(void *)(a1 + 40), 1);
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "q_teardownServerConnectionIfNoMoreObservers");
}

- (void)q_addEventObserver:(id)a3 forTypes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(OSADiagnosticMonitor *)self q_removeEventObserver:v7 andComputeObservedTypes:0];
  eventObservers = self->_eventObservers;
  id v9 = [[EventObserver alloc] initWithObserver:v7 bugTypes:v6];

  [(NSMutableArray *)eventObservers addObject:v9];
  [(OSADiagnosticMonitor *)self q_computeEventObserverTypes];
}

- (void)q_removeEventObserver:(id)a3 andComputeObservedTypes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  eventObservers = self->_eventObservers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__OSADiagnosticMonitor_q_removeEventObserver_andComputeObservedTypes___block_invoke;
  v10[3] = &unk_1E60C45F0;
  id v8 = v6;
  id v11 = v8;
  uint64_t v9 = [(NSMutableArray *)eventObservers indexOfObjectPassingTest:v10];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_eventObservers removeObjectAtIndex:v9];
    if (v4) {
      [(OSADiagnosticMonitor *)self q_computeEventObserverTypes];
    }
  }
}

uint64_t __70__OSADiagnosticMonitor_q_removeEventObserver_andComputeObservedTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matches:*(void *)(a1 + 32)];
}

- (void)q_addWriteObserver:(id)a3 forTypes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(OSADiagnosticMonitor *)self q_removeWriteObserver:v7 andComputeObservedTypes:0];
  writeObservers = self->_writeObservers;
  uint64_t v9 = [[WriteObserver alloc] initWithObserver:v7 bugTypes:v6];

  [(NSMutableArray *)writeObservers addObject:v9];
  [(OSADiagnosticMonitor *)self q_computeWriteObserverTypes];
}

- (void)q_removeWriteObserver:(id)a3 andComputeObservedTypes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  writeObservers = self->_writeObservers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__OSADiagnosticMonitor_q_removeWriteObserver_andComputeObservedTypes___block_invoke;
  v10[3] = &unk_1E60C4618;
  id v8 = v6;
  id v11 = v8;
  uint64_t v9 = [(NSMutableArray *)writeObservers indexOfObjectPassingTest:v10];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_writeObservers removeObjectAtIndex:v9];
    if (v4) {
      [(OSADiagnosticMonitor *)self q_computeWriteObserverTypes];
    }
  }
}

uint64_t __70__OSADiagnosticMonitor_q_removeWriteObserver_andComputeObservedTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matches:*(void *)(a1 + 32)];
}

- (void)q_computeEventObserverTypes
{
  [*a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B507E000, v1, v2, "Client: with %ld event observers, observed event types = %@", v3, v4, v5, v6, v7);
}

- (void)q_computeWriteObserverTypes
{
  [*a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B507E000, v1, v2, "Client: with %ld write observers, observed write types = %@", v3, v4, v5, v6, v7);
}

- (void)q_registerForEventTypes
{
  uint64_t v3 = [(OSADiagnosticMonitor *)self q_serverConnection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_44];

  [v4 registerForEvents:self->_observedEventTypes replyHandler:&__block_literal_global_44];
}

void __47__OSADiagnosticMonitor_q_registerForEventTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = DiagnosticMonitorLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__OSADiagnosticMonitor_q_registerForEventTypes__block_invoke_cold_1(v2);
    }
  }
}

- (void)q_registerForWriteTypes
{
  uint64_t v3 = [(OSADiagnosticMonitor *)self q_serverConnection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_46];

  [v4 registerForWrites:self->_observedWriteTypes replyHandler:&__block_literal_global_46];
}

void __47__OSADiagnosticMonitor_q_registerForWriteTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = DiagnosticMonitorLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__OSADiagnosticMonitor_q_registerForWriteTypes__block_invoke_cold_1(v2);
    }
  }
}

- (void)receivedLogEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = DiagnosticMonitorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[OSADiagnosticMonitor receivedLogEvent:](v4, v5);
    }

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_eventObservers;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "deliverEvent:on:", v4, self->_calloutQueue, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)willWriteLog:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = DiagnosticMonitorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[OSADiagnosticMonitor willWriteLog:](v4);
    }

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_writeObservers;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "deliverWillWrite:on:", v4, self->_calloutQueue, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)didWriteLog:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = DiagnosticMonitorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[OSADiagnosticMonitor didWriteLog:](v4, v5);
    }

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_writeObservers;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "deliverDidWrite:on:", v4, self->_calloutQueue, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)q_serverConnection
{
  serverConnection = self->_serverConnection;
  if (!serverConnection)
  {
    id v4 = DiagnosticMonitorLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B507E000, v4, OS_LOG_TYPE_DEFAULT, "Client: creating server connection.", (uint8_t *)buf, 2u);
    }

    uint64_t v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.osanalytics.diagnosticmonitor" options:4096];
    uint64_t v6 = self->_serverConnection;
    self->_serverConnection = v5;

    uint64_t v7 = self->_serverConnection;
    uint64_t v8 = OSADiagnosticMonitorServerInterface();
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    uint64_t v9 = self->_serverConnection;
    uint64_t v10 = OSADiagnosticMonitorClientInterface();
    [(NSXPCConnection *)v9 setExportedInterface:v10];

    [(NSXPCConnection *)self->_serverConnection setExportedObject:self];
    [(NSXPCConnection *)self->_serverConnection _setQueue:self->_queue];
    objc_initWeak(buf, self);
    long long v11 = self->_serverConnection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__OSADiagnosticMonitor_q_serverConnection__block_invoke;
    v13[3] = &unk_1E60C4660;
    objc_copyWeak(&v14, buf);
    [(NSXPCConnection *)v11 setInterruptionHandler:v13];
    [(NSXPCConnection *)self->_serverConnection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
    serverConnection = self->_serverConnection;
  }
  return serverConnection;
}

void __42__OSADiagnosticMonitor_q_serverConnection__block_invoke(uint64_t a1)
{
  id v2 = DiagnosticMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1B507E000, v2, OS_LOG_TYPE_DEFAULT, "Client: reconnecting to server after connection interruption.", v6, 2u);
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "q_registerForEventTypes");

  id v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "q_registerForWriteTypes");
}

- (void)q_teardownServerConnectionIfNoMoreObservers
{
  if (![(NSMutableArray *)self->_eventObservers count]
    && ![(NSMutableArray *)self->_writeObservers count])
  {
    uint64_t v3 = DiagnosticMonitorLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B507E000, v3, OS_LOG_TYPE_DEFAULT, "Client: tearing down server connection after removing last observer.", v5, 2u);
    }

    [(NSXPCConnection *)self->_serverConnection invalidate];
    serverConnection = self->_serverConnection;
    self->_serverConnection = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_observedWriteTypes, 0);
  objc_storeStrong((id *)&self->_observedEventTypes, 0);
  objc_storeStrong((id *)&self->_writeObservers, 0);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __47__OSADiagnosticMonitor_q_registerForEventTypes__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_2(&dword_1B507E000, v2, v3, "Error registering event types with the diagnostic monitor server: %@", v4, v5, v6, v7, 2u);
}

void __47__OSADiagnosticMonitor_q_registerForWriteTypes__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_2(&dword_1B507E000, v2, v3, "Error registering write types with the diagnostic monitor server: %@", v4, v5, v6, v7, 2u);
}

- (void)receivedLogEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 identity];
  uint64_t v5 = [v4 incidentID];
  uint64_t v6 = [a1 identity];
  uint64_t v7 = [v6 bugType];
  int v8 = 138543618;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  _os_log_debug_impl(&dword_1B507E000, a2, OS_LOG_TYPE_DEBUG, "Received log event %{public}@ of type %{public}@", (uint8_t *)&v8, 0x16u);
}

- (void)willWriteLog:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 incidentID];
  uint64_t v9 = [a1 bugType];
  OUTLINED_FUNCTION_0(&dword_1B507E000, v3, v4, "Will write log %{public}@ of type %{public}@", v5, v6, v7, v8, 2u);
}

- (void)didWriteLog:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 identity];
  uint64_t v5 = [v4 incidentID];
  uint64_t v6 = [a1 identity];
  uint64_t v7 = [v6 bugType];
  uint64_t v8 = [a1 filePath];
  uint64_t v9 = @"succeeded";
  int v10 = 138543874;
  long long v11 = v5;
  __int16 v12 = 2114;
  if (!v8) {
    uint64_t v9 = @"failed";
  }
  long long v13 = v7;
  __int16 v14 = 2114;
  v15 = v9;
  _os_log_debug_impl(&dword_1B507E000, a2, OS_LOG_TYPE_DEBUG, "Did write log %{public}@ of type %{public}@ (result: %{public}@)", (uint8_t *)&v10, 0x20u);
}

@end