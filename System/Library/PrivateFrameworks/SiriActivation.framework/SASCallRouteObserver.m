@interface SASCallRouteObserver
- (BOOL)isCallAudioRouteAllowed;
- (SASCallRouteObserver)init;
- (void)_updateCallAudioRouteAllowedForRoute:(id)a3;
- (void)routesChangedForRouteController:(id)a3;
- (void)setIsCallAudioRouteAllowed:(BOOL)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation SASCallRouteObserver

- (SASCallRouteObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)SASCallRouteObserver;
  v2 = [(SASCallRouteObserver *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SASCallRouteObserverQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isCallAudioRouteAllowed = [MEMORY[0x1E4F4E488] isBlushingPhantomEnabled] ^ 1;
  }
  return v2;
}

- (void)startObserving
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SASCallRouteObserver startObserving]";
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ([MEMORY[0x1E4F4E488] isBlushingPhantomEnabled])
  {
    objc_initWeak((id *)buf, self);
    v5 = [MEMORY[0x1E4FADA98] sharedInstance];
    objc_super v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__SASCallRouteObserver_startObserving__block_invoke;
    block[3] = &unk_1E6B675D8;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[SASCallRouteObserver startObserving]";
      _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s SIC not enabled, not observing call route", buf, 0xCu);
    }
  }
}

void __38__SASCallRouteObserver_startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4FADA98] sharedInstance];
    v2 = [v1 routeController];

    [v2 addDelegate:WeakRetained];
    dispatch_queue_t v3 = [v2 pickedRoute];
    [WeakRetained _updateCallAudioRouteAllowedForRoute:v3];
  }
}

- (void)stopObserving
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SASCallRouteObserver stopObserving]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ([MEMORY[0x1E4F4E488] isBlushingPhantomEnabled])
  {
    objc_initWeak((id *)buf, self);
    v4 = [MEMORY[0x1E4FADA98] sharedInstance];
    v5 = [v4 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SASCallRouteObserver_stopObserving__block_invoke;
    block[3] = &unk_1E6B675D8;
    objc_copyWeak(&v7, (id *)buf);
    dispatch_async(v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __37__SASCallRouteObserver_stopObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4FADA98] sharedInstance];
    v2 = [v1 routeController];

    [v2 removeDelegate:WeakRetained];
    [WeakRetained _updateCallAudioRouteAllowedForRoute:0];
  }
}

- (void)routesChangedForRouteController:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FADA98];
  id v5 = a3;
  objc_super v6 = [v4 sharedInstance];
  id v7 = [v6 queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 pickedRoute];

  [(SASCallRouteObserver *)self _updateCallAudioRouteAllowedForRoute:v8];
}

- (void)_updateCallAudioRouteAllowedForRoute:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SASCallRouteObserver__updateCallAudioRouteAllowedForRoute___block_invoke;
  block[3] = &unk_1E6B676F8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__SASCallRouteObserver__updateCallAudioRouteAllowedForRoute___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((([*(id *)(a1 + 32) isSpeaker] & 1) != 0
       || [*(id *)(a1 + 32) isReceiver])
      && MEMORY[0x1E0164740]())
    {
      dispatch_queue_t v3 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SASCallRouteObserver _updateCallAudioRouteAllowedForRoute:]_block_invoke";
        _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s built-in route in-call with echo cancellation", buf, 0xCu);
      }
      int v4 = 1;
      uint64_t v5 = 1;
      if ([WeakRetained isCallAudioRouteAllowed]) {
        goto LABEL_28;
      }
    }
    else if ([*(id *)(a1 + 32) isBluetooth] {
           && [*(id *)(a1 + 32) bluetoothEndpointType] == 1)
    }
    {
      id v6 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
      id v7 = [v6 pickableRoutesForCategory:*MEMORY[0x1E4F4E6C0] andMode:@"SpeechRecognition"];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v7;
      uint64_t v5 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v5)
      {
        uint64_t v9 = *(void *)v20;
        uint64_t v10 = (void *)MEMORY[0x1E4F74DE0];
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            v13 = objc_msgSend(v12, "objectForKeyedSubscript:", *v10, (void)v19);
            int v14 = [v13 BOOLValue];

            if (v14)
            {
              v15 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F74D78]];
              uint64_t v5 = v15 != 0;

              goto LABEL_23;
            }
          }
          uint64_t v5 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_23:

      v16 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[SASCallRouteObserver _updateCallAudioRouteAllowedForRoute:]_block_invoke";
        __int16 v25 = 1024;
        int v26 = v5;
        _os_log_impl(&dword_1D9588000, v16, OS_LOG_TYPE_DEFAULT, "%s bluetooth route in-call, supportsDoAP=%i", buf, 0x12u);
      }
      int v4 = v5;

      if (v5 == [WeakRetained isCallAudioRouteAllowed]) {
        goto LABEL_28;
      }
    }
    else
    {
      int v4 = 0;
      uint64_t v5 = 0;
      if (([WeakRetained isCallAudioRouteAllowed] & 1) == 0)
      {
LABEL_28:
        objc_msgSend(WeakRetained, "setIsCallAudioRouteAllowed:", v5, (void)v19);
        goto LABEL_29;
      }
    }
    v17 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v24 = "-[SASCallRouteObserver _updateCallAudioRouteAllowedForRoute:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = v4;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s Updating isCallAudioRouteAllowed: %i for route %@", buf, 0x1Cu);
    }
    goto LABEL_28;
  }
LABEL_29:
}

- (BOOL)isCallAudioRouteAllowed
{
  return self->_isCallAudioRouteAllowed;
}

- (void)setIsCallAudioRouteAllowed:(BOOL)a3
{
  self->_isCallAudioRouteAllowed = a3;
}

- (void).cxx_destruct
{
}

@end