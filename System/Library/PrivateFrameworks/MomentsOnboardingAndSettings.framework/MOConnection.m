@interface MOConnection
- (BOOL)runBlockCompleted:(id)a3;
- (MOConnection)initWithName:(id)a3;
- (id)onConnectionInterrupted;
- (id)runBlockStarted:(id)a3 withConnectionError:(id)a4;
- (void)callBlock:(id)a3 onInterruption:(id)a4;
@end

@implementation MOConnection

- (MOConnection)initWithName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MOConnection;
  v6 = [(MOConnection *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingRequests = v6->_pendingRequests;
    v6->_pendingRequests = v7;

    v6->_pendingRequestCounter = 0;
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v6;
}

- (void)callBlock:(id)a3 onInterruption:(id)a4
{
  v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  v8 = [(MOConnection *)self runBlockStarted:v6 withConnectionError:v7];
  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__MOConnection_callBlock_onInterruption___block_invoke;
    v9[3] = &unk_265424FA8;
    objc_copyWeak(&v11, &location);
    id v10 = v8;
    v6[2](v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

uint64_t __41__MOConnection_callBlock_onInterruption___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained runBlockCompleted:*(void *)(a1 + 32)];

  return v3;
}

- (id)runBlockStarted:(id)a3 withConnectionError:(id)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = self;
    objc_sync_enter(v8);
    ++v8->_pendingRequestCounter;
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    v14[0] = @"requestBlock";
    id v10 = _Block_copy(v6);
    v14[1] = @"interruptionBlock";
    v15[0] = v10;
    id v11 = _Block_copy(v7);
    v15[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    [(NSMutableDictionary *)v8->_pendingRequests setObject:v12 forKeyedSubscript:v9];

    objc_sync_exit(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)runBlockCompleted:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)v5->_pendingRequests objectForKeyedSubscript:v4];

    [(NSMutableDictionary *)v5->_pendingRequests removeObjectForKey:v4];
    BOOL v7 = v6 != 0;
    objc_sync_exit(v5);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)onConnectionInterrupted
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__MOConnection_onConnectionInterrupted__block_invoke;
  v5[3] = &unk_265424AC0;
  objc_copyWeak(&v6, &location);
  v2 = _Block_copy(v5);
  uint64_t v3 = _Block_copy(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __39__MOConnection_onConnectionInterrupted__block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v19 = [WeakRetained[1] count];
    uint64_t v3 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    id v4 = v3;
    if (v19)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        __39__MOConnection_onConnectionInterrupted__block_invoke_cold_1((uint64_t)v2, v19, v4);
      }
    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __39__MOConnection_onConnectionInterrupted__block_invoke_cold_2((uint64_t)v2, v4);
    }

    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"remote process execution was interrupted";
    id v6 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    BOOL v7 = [v5 errorWithDomain:@"MOErrorDomain" code:4097 userInfo:v6];

    obj = v2;
    objc_sync_enter(obj);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = [v2[1] allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x25A2AFA80]();
          v14 = [v2[1] objectForKeyedSubscript:v12];
          [v2[1] removeObjectForKey:v12];
          v15 = [v14 objectForKeyedSubscript:@"interruptionBlock"];
          ((void (**)(void, void *))v15)[2](v15, v7);
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    objc_sync_exit(obj);
    v16 = +[MODiagnosticReporter defaultReporter];
    BOOL v17 = v19 == 0;
    if (!v16) {
      BOOL v17 = 1;
    }
    if (!v17)
    {
      v18 = [NSString stringWithFormat:@"XPC Connection with %@ ended prematurely", obj[4]];
      [v16 reportIncident:@"XPCInterruption" subtype:@"Other" context:v18];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_proxy, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

void __39__MOConnection_onConnectionInterrupted__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) UTF8String];
  int v6 = 136315394;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_256D32000, a3, OS_LOG_TYPE_FAULT, "[%s] The connection has been interrupted with %lu pending tasks", (uint8_t *)&v6, 0x16u);
}

void __39__MOConnection_onConnectionInterrupted__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) UTF8String];
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_256D32000, a2, OS_LOG_TYPE_ERROR, "[%s] The connection has been interrupted with zero pending tasks", (uint8_t *)&v4, 0xCu);
}

@end