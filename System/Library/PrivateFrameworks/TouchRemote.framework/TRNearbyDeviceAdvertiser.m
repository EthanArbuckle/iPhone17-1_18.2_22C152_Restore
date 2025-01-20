@interface TRNearbyDeviceAdvertiser
+ (void)initialize;
- (NSMapTable)sessionsTable;
- (OS_dispatch_queue)advertiserQ;
- (OS_dispatch_queue)sessionsTableQ;
- (SFService)service;
- (TRNearbyDeviceAdvertiser)init;
- (TRNearbyDeviceAdvertiserDelegate)delegate;
- (unint64_t)requestedService;
- (unint64_t)state;
- (void)_handleActivationWithError:(id)a3;
- (void)_handleEventMessage:(id)a3;
- (void)_handleInterruption;
- (void)_handleInvalidation;
- (void)_handleNewConnectionFromPeerDevice:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleRequestMessage:(id)a3;
- (void)_requestSessionForMessage:(id)a3 withCallback:(id)a4;
- (void)_respondToRequest:(id)a3 withError:(id)a4;
- (void)pauseAdvertising;
- (void)resumeAdvertising;
- (void)setAdvertiserQ:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequestedService:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setSessionsTable:(id)a3;
- (void)setSessionsTableQ:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)startAdvertisingWithService:(unint64_t)a3;
- (void)stopAdvertising;
@end

@implementation TRNearbyDeviceAdvertiser

+ (void)initialize
{
  _TRLogEnabled = 1;
  _TRLogVerboseEnabled = 1;
}

- (TRNearbyDeviceAdvertiser)init
{
  v10.receiver = self;
  v10.super_class = (Class)TRNearbyDeviceAdvertiser;
  v2 = [(TRNearbyDeviceAdvertiser *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TRNearbyDeviceAdvertiser.advertiserQ", 0);
    advertiserQ = v2->_advertiserQ;
    v2->_advertiserQ = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    sessionsTable = v2->_sessionsTable;
    v2->_sessionsTable = (NSMapTable *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.TRNearbyDeviceAdvertiser.sessionsTableQ", MEMORY[0x263EF83A8]);
    sessionsTableQ = v2->_sessionsTableQ;
    v2->_sessionsTableQ = (OS_dispatch_queue *)v7;

    v2->_state = 1;
  }
  return v2;
}

- (void)startAdvertisingWithService:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TRNearbyDeviceAdvertiser *)self delegate];

  if (!v5)
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"TRNearbyDeviceAdvertiser requires a delegate." userInfo:0];
    objc_exception_throw(v8);
  }
  if (_TRLogEnabled == 1)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[TRNearbyDeviceAdvertiser startAdvertisingWithService:]";
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "%s Start advertising with service: %lu.", buf, 0x16u);
    }
  }
  advertiserQ = self->_advertiserQ;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke;
  v9[3] = &unk_2642207E0;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(advertiserQ, v9);
}

void __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2[2] == 1)
  {
    v2[2] = 2;
    [*(id *)(a1 + 32) setRequestedService:*(void *)(a1 + 40)];
    id v3 = objc_alloc_init(MEMORY[0x263F6C2B0]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.TRNearbyDeviceAdvertiser.serviceQ", 0);
    [*(id *)(*(void *)(a1 + 32) + 24) setDispatchQueue:v6];

    if (*(void *)(a1 + 40) == 1)
    {
      [*(id *)(*(void *)(a1 + 32) + 24) setNeedsSetup:1];
      [*(id *)(*(void *)(a1 + 32) + 24) setIdentifier:*MEMORY[0x263F6C388]];
      [*(id *)(*(void *)(a1 + 32) + 24) setDeviceActionType:1];
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_16;
    v21[3] = &unk_264220E38;
    v21[4] = *(void *)(a1 + 32);
    dispatch_queue_t v7 = (void *)MEMORY[0x2166AC110](v21);
    [*(id *)(*(void *)(a1 + 32) + 24) setEventMessageHandler:v7];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_2;
    v20[3] = &unk_264220E60;
    v20[4] = *(void *)(a1 + 32);
    id v8 = (void *)MEMORY[0x2166AC110](v20);
    [*(id *)(*(void *)(a1 + 32) + 24) setRequestMessageHandler:v8];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_3;
    v19[3] = &unk_264220858;
    v19[4] = *(void *)(a1 + 32);
    v9 = (void *)MEMORY[0x2166AC110](v19);
    [*(id *)(*(void *)(a1 + 32) + 24) setInvalidationHandler:v9];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_4;
    v18[3] = &unk_264220858;
    v18[4] = *(void *)(a1 + 32);
    objc_super v10 = (void *)MEMORY[0x2166AC110](v18);
    [*(id *)(*(void *)(a1 + 32) + 24) setInterruptionHandler:v10];
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = *(void **)(v11 + 24);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_5;
    v17[3] = &unk_264220E88;
    v17[4] = v11;
    [v12 activateWithCompletion:v17];

    goto LABEL_11;
  }
  if (_TRLogEnabled == 1)
  {
    unint64_t v13 = TRLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[TRNearbyDeviceAdvertiser startAdvertisingWithService:]_block_invoke";
      _os_log_impl(&dword_2149BE000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to start advertising. Advertiser is not stopped.", buf, 0xCu);
    }

    v2 = *(void **)(a1 + 32);
  }
  uint64_t v14 = [v2 delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = *MEMORY[0x263F08338];
    v22[0] = *MEMORY[0x263F08320];
    v22[1] = v16;
    v23[0] = @"Failed to start advertising.";
    v23[1] = @"Advertiser is not stopped.";
    dispatch_queue_t v7 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9300 userInfo:v7];
    v9 = [*(id *)(a1 + 32) delegate];
    [v9 nearbyDeviceAdvertiser:*(void *)(a1 + 32) didFailToStartAdvertisingWithError:v8];
LABEL_11:
  }
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_16(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEventMessage:a2];
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleRequestMessage:a2];
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInvalidation];
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInterruption];
}

uint64_t __56__TRNearbyDeviceAdvertiser_startAdvertisingWithService___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleActivationWithError:a2];
}

- (void)pauseAdvertising
{
  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TRNearbyDeviceAdvertiser_pauseAdvertising__block_invoke;
  block[3] = &unk_264220858;
  block[4] = self;
  dispatch_async(advertiserQ, block);
}

void __44__TRNearbyDeviceAdvertiser_pauseAdvertising__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  if (v3 == 5)
  {
    if (_TRLogEnabled != 1) {
      return;
    }
    uint64_t v5 = TRLogHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v7 = 136315138;
    id v8 = "-[TRNearbyDeviceAdvertiser pauseAdvertising]_block_invoke";
    dispatch_queue_t v6 = "%s Advertiser already paused.";
LABEL_16:
    _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
LABEL_17:

    return;
  }
  if (v3 != 3)
  {
    if (_TRLogEnabled != 1) {
      return;
    }
    uint64_t v5 = TRLogHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v7 = 136315138;
    id v8 = "-[TRNearbyDeviceAdvertiser pauseAdvertising]_block_invoke";
    dispatch_queue_t v6 = "%s Failed to pause advertising. Advertiser is not started.";
    goto LABEL_16;
  }
  if (_TRLogEnabled == 1)
  {
    uint64_t v4 = TRLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[TRNearbyDeviceAdvertiser pauseAdvertising]_block_invoke";
      _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, "%s Pausing advertiser.", (uint8_t *)&v7, 0xCu);
    }

    v2 = *(void **)(a1 + 32);
  }
  if ([v2 requestedService] == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setDeviceActionType:0];
    [*(id *)(*(void *)(a1 + 32) + 24) setNeedsSetup:0];
  }
  *(void *)(*(void *)(a1 + 32) + 16) = 5;
}

- (void)resumeAdvertising
{
  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__TRNearbyDeviceAdvertiser_resumeAdvertising__block_invoke;
  block[3] = &unk_264220858;
  block[4] = self;
  dispatch_async(advertiserQ, block);
}

void __45__TRNearbyDeviceAdvertiser_resumeAdvertising__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  if (v3 != 5)
  {
    if (v3 == 3)
    {
      if (_TRLogEnabled != 1) {
        return;
      }
      uint64_t v4 = TRLogHandle();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v7 = 136315138;
      id v8 = "-[TRNearbyDeviceAdvertiser resumeAdvertising]_block_invoke";
      uint64_t v5 = "%s Advertiser already running.";
    }
    else
    {
      if (_TRLogEnabled != 1) {
        return;
      }
      uint64_t v4 = TRLogHandle();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v7 = 136315138;
      id v8 = "-[TRNearbyDeviceAdvertiser resumeAdvertising]_block_invoke";
      uint64_t v5 = "%s Failed to resume advertising. Advertiser is not started.";
    }
    _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
LABEL_17:

    return;
  }
  if (_TRLogEnabled == 1)
  {
    dispatch_queue_t v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[TRNearbyDeviceAdvertiser resumeAdvertising]_block_invoke";
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "%s Resuming advertiser.", (uint8_t *)&v7, 0xCu);
    }

    v2 = *(void **)(a1 + 32);
  }
  if ([v2 requestedService] == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setDeviceActionType:1];
    [*(id *)(*(void *)(a1 + 32) + 24) setNeedsSetup:1];
  }
  *(void *)(*(void *)(a1 + 32) + 16) = 3;
}

- (void)stopAdvertising
{
  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__TRNearbyDeviceAdvertiser_stopAdvertising__block_invoke;
  block[3] = &unk_264220858;
  block[4] = self;
  dispatch_async(advertiserQ, block);
}

void __43__TRNearbyDeviceAdvertiser_stopAdvertising__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  if (v3 == 5 || v3 == 3)
  {
    if (_TRLogEnabled == 1)
    {
      uint64_t v5 = TRLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TRNearbyDeviceAdvertiser stopAdvertising]_block_invoke";
        _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Stopping advertiser.", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    v2[2] = 4;
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  }
  else if (v3 == 1)
  {
    if (_TRLogEnabled == 1)
    {
      dispatch_queue_t v6 = TRLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TRNearbyDeviceAdvertiser stopAdvertising]_block_invoke";
        _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "%s Advertiser stopped.", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    int v7 = [v2 delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) delegate];
      [v9 nearbyDeviceAdvertiserDidStopAdvertising:*(void *)(a1 + 32)];
LABEL_24:
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      objc_super v10 = TRLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TRNearbyDeviceAdvertiser stopAdvertising]_block_invoke";
        _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to stop advertising. Advertiser is not started.", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    uint64_t v11 = [v2 delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      uint64_t v13 = *MEMORY[0x263F08338];
      v16[0] = *MEMORY[0x263F08320];
      v16[1] = v13;
      v17[0] = @"Failed to stop advertising.";
      v17[1] = @"Advertiser is not started.";
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9301 userInfo:v9];
      char v15 = [*(id *)(a1 + 32) delegate];
      [v15 nearbyDeviceAdvertiser:*(void *)(a1 + 32) didFailToStopAdvertisingWithError:v14];

      goto LABEL_24;
    }
  }
}

- (void)_handleActivationWithError:(id)a3
{
  id v4 = a3;
  advertiserQ = self->_advertiserQ;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__TRNearbyDeviceAdvertiser__handleActivationWithError___block_invoke;
  v7[3] = &unk_264220880;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(advertiserQ, v7);
}

void __55__TRNearbyDeviceAdvertiser__handleActivationWithError___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    if (_TRLogEnabled == 1)
    {
      v2 = TRLogHandle();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 24);
        int v14 = 138412546;
        uint64_t v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = v3;
        _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "<%@> activation error %@", (uint8_t *)&v14, 0x16u);
      }
    }
    *(void *)(*(void *)(a1 + 40) + 16) = 1;
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;

    int v7 = [*(id *)(a1 + 40) delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 40) delegate];
      [v9 nearbyDeviceAdvertiser:*(void *)(a1 + 40) didFailToStartAdvertisingWithError:*(void *)(a1 + 32)];
LABEL_14:
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      objc_super v10 = TRLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 24);
        int v14 = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "SFService activation completed <%@>", (uint8_t *)&v14, 0xCu);
      }
    }
    *(void *)(*(void *)(a1 + 40) + 16) = 3;
    char v12 = [*(id *)(a1 + 40) delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v9 = [*(id *)(a1 + 40) delegate];
      [v9 nearbyDeviceAdvertiserDidStartAdvertising:*(void *)(a1 + 40)];
      goto LABEL_14;
    }
  }
}

- (void)_handleInvalidation
{
  advertiserQ = self->_advertiserQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TRNearbyDeviceAdvertiser__handleInvalidation__block_invoke;
  block[3] = &unk_264220858;
  block[4] = self;
  dispatch_async(advertiserQ, block);
}

void __47__TRNearbyDeviceAdvertiser__handleInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    v2 = TRLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v12 = "-[TRNearbyDeviceAdvertiser _handleInvalidation]_block_invoke";
      _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "%s SFService invalidated", buf, 0xCu);
    }
  }
  *(void *)(*(void *)(a1 + 32) + 16) = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TRNearbyDeviceAdvertiser__handleInvalidation__block_invoke_33;
  block[3] = &unk_264220858;
  block[4] = v5;
  dispatch_barrier_sync(v6, block);
  int v7 = [*(id *)(a1 + 32) delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) delegate];
    [v9 nearbyDeviceAdvertiserDidStopAdvertising:*(void *)(a1 + 32)];
  }
}

void __47__TRNearbyDeviceAdvertiser__handleInvalidation__block_invoke_33(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionsTable", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        char v8 = [*(id *)(a1 + 32) sessionsTable];
        uint64_t v9 = [v8 objectForKey:v7];

        [v9 disconnect];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  objc_super v10 = [*(id *)(a1 + 32) sessionsTable];
  [v10 removeAllObjects];
}

- (void)_handleInterruption
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    uint64_t v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[TRNearbyDeviceAdvertiser _handleInterruption]";
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s SFService interrupted", (uint8_t *)&v4, 0xCu);
    }
  }
  [(TRNearbyDeviceAdvertiser *)self _handleInvalidation];
}

- (void)_handleEventMessage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__TRNearbyDeviceAdvertiser__handleEventMessage___block_invoke;
  v6[3] = &unk_264220EB0;
  id v7 = v4;
  id v5 = v4;
  [(TRNearbyDeviceAdvertiser *)self _requestSessionForMessage:v5 withCallback:v6];
}

void __48__TRNearbyDeviceAdvertiser__handleEventMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 connection];
    char v8 = [v7 eventMessageHandler];
    v8[2](v8, *(void *)(a1 + 32));
  }
  else if (_TRLogEnabled == 1)
  {
    uint64_t v9 = TRLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      long long v11 = "-[TRNearbyDeviceAdvertiser _handleEventMessage:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, "%s Error fetching session: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_handleRequestMessage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__TRNearbyDeviceAdvertiser__handleRequestMessage___block_invoke;
  v6[3] = &unk_264220ED8;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [(TRNearbyDeviceAdvertiser *)self _requestSessionForMessage:v5 withCallback:v6];
}

void __50__TRNearbyDeviceAdvertiser__handleRequestMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    id v8 = [a2 connection];
    id v4 = [v8 requestMessageHandler];
    v4[2](v4, *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    [v6 _respondToRequest:v7 withError:a3];
  }
}

- (void)_requestSessionForMessage:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 peerDevice];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  sessionsTableQ = self->_sessionsTableQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__TRNearbyDeviceAdvertiser__requestSessionForMessage_withCallback___block_invoke;
  block[3] = &unk_264220F00;
  uint64_t v17 = &v18;
  block[4] = self;
  id v10 = v8;
  id v16 = v10;
  dispatch_sync(sessionsTableQ, block);
  long long v11 = (void *)v19[5];
  if (!v11)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __67__TRNearbyDeviceAdvertiser__requestSessionForMessage_withCallback___block_invoke_2;
    v13[3] = &unk_264220F28;
    id v14 = v7;
    [(TRNearbyDeviceAdvertiser *)self _handleNewConnectionFromPeerDevice:v10 withCompletionHandler:v13];
    __int16 v12 = v14;
LABEL_6:

    goto LABEL_7;
  }
  if (([v11 isConnected] & 1) == 0)
  {
    __int16 v12 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9101 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_6;
  }
  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, v19[5], 0);
LABEL_7:

  _Block_object_dispose(&v18, 8);
}

void __67__TRNearbyDeviceAdvertiser__requestSessionForMessage_withCallback___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) sessionsTable];
  v2 = [*(id *)(a1 + 40) identifier];
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __67__TRNearbyDeviceAdvertiser__requestSessionForMessage_withCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleNewConnectionFromPeerDevice:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_TRLogEnabled == 1)
  {
    id v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 identifier];
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[TRNearbyDeviceAdvertiser _handleNewConnectionFromPeerDevice:withCompletionHandler:]";
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s New connection request from device: %@", buf, 0x16u);
    }
  }
  id v10 = [[TRNearbyDevice alloc] initWithRepresentedDevice:v6 supportedService:[(TRNearbyDeviceAdvertiser *)self requestedService]];
  long long v11 = [(TRNearbyDeviceAdvertiser *)self delegate];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__TRNearbyDeviceAdvertiser__handleNewConnectionFromPeerDevice_withCompletionHandler___block_invoke;
  v14[3] = &unk_264220F50;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [v11 nearbyDeviceAdvertiser:self didReceiveConnectionRequestFromDevice:v10 requestHandler:v14];
}

void __85__TRNearbyDeviceAdvertiser__handleNewConnectionFromPeerDevice_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    if (!v5)
    {
      id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Must provide a valid session object to accept the connection" userInfo:0];
      objc_exception_throw(v14);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 56);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__TRNearbyDeviceAdvertiser__handleNewConnectionFromPeerDevice_withCompletionHandler___block_invoke_2;
    block[3] = &unk_2642209E8;
    block[4] = v7;
    id v9 = v5;
    id v16 = v9;
    id v17 = *(id *)(a1 + 40);
    dispatch_barrier_async(v8, block);
    id v10 = [TRServerConnection alloc];
    long long v11 = [*(id *)(a1 + 32) service];
    id v12 = [(TRServerConnection *)v10 initWithService:v11];

    [v9 setConnection:v12];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9100 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __85__TRNearbyDeviceAdvertiser__handleNewConnectionFromPeerDevice_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) sessionsTable];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) identifier];
  [v4 setObject:v2 forKey:v3];
}

- (void)_respondToRequest:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v11 = objc_alloc_init(TRErrorResponse);
  [(TRErrorResponse *)v11 setError:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F6C2A8]) initWithRequestMessage:v7];
  id v9 = +[TRMessageEncoder encodeMessage:v11];
  [v8 setBodyData:v9];

  id v10 = [v7 peerDevice];

  [v8 setPeerDevice:v10];
  [(SFService *)self->_service sendResponse:v8];
}

- (TRNearbyDeviceAdvertiserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRNearbyDeviceAdvertiserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (SFService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)advertiserQ
{
  return self->_advertiserQ;
}

- (void)setAdvertiserQ:(id)a3
{
}

- (unint64_t)requestedService
{
  return self->_requestedService;
}

- (void)setRequestedService:(unint64_t)a3
{
  self->_requestedService = a3;
}

- (NSMapTable)sessionsTable
{
  return self->_sessionsTable;
}

- (void)setSessionsTable:(id)a3
{
}

- (OS_dispatch_queue)sessionsTableQ
{
  return self->_sessionsTableQ;
}

- (void)setSessionsTableQ:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionsTableQ, 0);
  objc_storeStrong((id *)&self->_sessionsTable, 0);
  objc_storeStrong((id *)&self->_advertiserQ, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end