@interface WFTrafficEngManager
- (BOOL)__configureRapportDiscoveryClient;
- (WFTrafficEngDelegate)trafficEngDelegate;
- (WFTrafficEngManager)initWithTrafficEngDelegate:(id)a3;
- (id)__collectCriticalAppInfo;
- (void)__activateDiscovery;
- (void)__configureRapportSessionClient:(id)a3;
- (void)__invalidateDiscovery;
- (void)__invalidateSession;
- (void)__registerCallbacksAndActivate;
- (void)__registerRequestHandler;
- (void)__requestCriticalAppInfo:(id)a3 completionBlock:(id)a4;
- (void)__sendEventToPeers;
- (void)__sendKeepAliveEvent:(id)a3 dictionary:(id)a4;
- (void)__sendPeriodicEvent:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)setTrafficEngDelegate:(id)a3;
@end

@implementation WFTrafficEngManager

- (WFTrafficEngManager)initWithTrafficEngDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFTrafficEngManager;
  v5 = [(WFTrafficEngManager *)&v19 init];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  if (!v5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s self alloc failed", "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifi.trafficEngineering", 0);
  traffic_engr_queue = v5->_traffic_engr_queue;
  v5->_traffic_engr_queue = (OS_dispatch_queue *)v9;

  if (!v5->_traffic_engr_queue)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s Dispatch Queue Creation Failed", "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(WFTrafficEngManager *)v5 setTrafficEngDelegate:v4];
    goto LABEL_13;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%s Invalid trafficEngDelegate", "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
LABEL_11:
    v12 = NSString;
    id v11 = v11;
    objc_msgSend(v12, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v11, "UTF8String"));
    id v13 = objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = v14;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
LABEL_12:

  v5 = 0;
LABEL_13:
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
    id v16 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = v17;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager dealloc]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  traffic_engr_queue = self->_traffic_engr_queue;
  if (traffic_engr_queue)
  {
    self->_traffic_engr_queue = 0;
  }
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager dealloc]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  v9.receiver = self;
  v9.super_class = (Class)WFTrafficEngManager;
  [(WFTrafficEngManager *)&v9 dealloc];
}

- (BOOL)__configureRapportDiscoveryClient
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  self->_BOOL configured = 0;
  objc_initWeak(&location, self);
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  id v4 = MEMORY[0x1E4F14500];
  id v5 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v36 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Rapport discovery session Started", "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  objc_super v9 = MEMORY[0x1E4F14500];
  id v10 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String"));
    id v11 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v36 = v12;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  if (objc_opt_class())
  {
    id v13 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x1E4F946D8]);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v13;
  }
  v15 = self->_discoveryClient;
  if (v15)
  {
    [(RPCompanionLinkClient *)v15 setDispatchQueue:self->_traffic_engr_queue];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke;
    v32[3] = &unk_1E69BCBA0;
    objc_copyWeak(&v33, &location);
    [(RPCompanionLinkClient *)self->_discoveryClient setInvalidationHandler:v32];
    [(RPCompanionLinkClient *)self->_discoveryClient setControlFlags:[(RPCompanionLinkClient *)self->_discoveryClient controlFlags] | 0x801006];
    [(RPCompanionLinkClient *)self->_discoveryClient setTargetUserSession:1];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_41;
    v30[3] = &unk_1E69BDA10;
    objc_copyWeak(&v31, &location);
    [(RPCompanionLinkClient *)self->_discoveryClient setDeviceFoundHandler:v30];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_46;
    v28[3] = &unk_1E69BDA10;
    objc_copyWeak(&v29, &location);
    [(RPCompanionLinkClient *)self->_discoveryClient setDeviceLostHandler:v28];
    [(WFTrafficEngManager *)self __activateDiscovery];
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s Rapport discovery session Ended", "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
    uint64_t v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
      id v19 = objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v36 = v20;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    self->_BOOL configured = 1;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
  }
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  uint64_t v22 = MEMORY[0x1E4F14500];
  id v23 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v21, "UTF8String"));
    id v24 = objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v36 = v25;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  BOOL configured = self->_configured;
  objc_destroyWeak(&location);
  return configured;
}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s Rapport discovery session invalidated", "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
    id v3 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v6 = [v3 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__invalidateDiscovery");
}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"%s Rapport discovery session found device:%@", "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke", v4];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v5, "UTF8String"));
    id v6 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__configureRapportSessionClient:", v4);
}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"%s Rapport discovery session lost device:%@", "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke", a2];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__tearDownRapportDataSession");
}

- (void)__activateDiscovery
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __activateDiscovery]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  [(WFTrafficEngManager *)self __registerCallbacksAndActivate];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __activateDiscovery]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v5, "UTF8String"));
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)__registerCallbacksAndActivate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __registerCallbacksAndActivate]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  traffic_engr_queue = self->_traffic_engr_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke;
  block[3] = &unk_1E69BC8D8;
  block[4] = self;
  dispatch_async(traffic_engr_queue, block);
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __registerCallbacksAndActivate]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

uint64_t __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__registerRequestHandler");
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_2;
  v5[3] = &unk_1E69BD5D8;
  v5[4] = v2;
  return [v3 activateWithCompletion:v5];
}

void __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = [NSString stringWithFormat:@"%s Activation of rapport disovery client failed, error: %@", "-[WFTrafficEngManager __registerCallbacksAndActivate]_block_invoke_2", a2];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
      id v3 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = [v3 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_56;
    v6[3] = &unk_1E69BDA38;
    v6[4] = v4;
    [v5 registerEventID:@"com.apple.wifi.trafficeng.event" options:0 handler:v6];
  }
}

void __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_56(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) trafficEngDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) trafficEngDelegate];
    [v5 handleCriticalAppEvent:v6];
  }
}

- (void)__registerRequestHandler
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __registerRequestHandler]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  discoveryClient = self->_discoveryClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__WFTrafficEngManager___registerRequestHandler__block_invoke;
  v9[3] = &unk_1E69BDA60;
  v9[4] = self;
  [(RPCompanionLinkClient *)discoveryClient registerRequestID:@"com.apple.wifi.trafficEngineering" options:0 handler:v9];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __registerRequestHandler]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

void __47__WFTrafficEngManager___registerRequestHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  id v5 = [*(id *)(a1 + 32) trafficEngDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) trafficEngDelegate];
    uint64_t v8 = [v7 retrieveCurrentLinkHealth];

    (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, v8, 0, 0);
  }
}

- (void)__invalidateDiscovery
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __invalidateDiscovery]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  [(WFTrafficEngManager *)self __tearDownRapportDataSession];
  [(RPCompanionLinkClient *)self->_discoveryClient invalidate];
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = 0;

  self->_BOOL configured = 0;
  [(WFTrafficEngManager *)self cleanup];
  char v6 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __invalidateDiscovery]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)cleanup
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager cleanup]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = 0;

  char v6 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager cleanup]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)__configureRapportSessionClient:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __configureRapportSessionClient:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __configureRapportSessionClient:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v5, "UTF8String"));
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)__invalidateSession
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __invalidateSession]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
    id v3 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = [v3 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __invalidateSession]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v4, "UTF8String"));
    id v5 = objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)__sendEventToPeers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFTrafficEngManager *)self trafficEngDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFTrafficEngManager *)self trafficEngDelegate];
    uint64_t v6 = (void *)[v5 retrieveEventDetails];

    if (v6)
    {
      uint64_t v7 = NSString;
      id v8 = v6;
      uint64_t v9 = [v7 stringWithFormat:@"[TrafficEngineering]: EventData %@", v8];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v9, "UTF8String"));
        id v10 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        uint64_t v12 = [v10 UTF8String];
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
      }
      [(WFTrafficEngManager *)self __sendPeriodicEvent:v8];
    }
  }
}

- (void)__sendPeriodicEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          traffic_engr_queue = self->_traffic_engr_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __43__WFTrafficEngManager___sendPeriodicEvent___block_invoke;
          block[3] = &unk_1E69BCEC8;
          block[4] = self;
          void block[5] = v12;
          id v17 = v4;
          dispatch_async(traffic_engr_queue, block);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"No active clients, Returning"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = NSString;
      id v7 = v7;
      objc_msgSend(v14, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v7, "UTF8String"));
      id v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v24 = [v15 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __43__WFTrafficEngManager___sendPeriodicEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__sendKeepAliveEvent:dictionary:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)__sendKeepAliveEvent:(id)a3 dictionary:(id)a4
{
}

void __55__WFTrafficEngManager___sendKeepAliveEvent_dictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = [NSString stringWithFormat:@"[TrafficEngineering]: Failed to send event %@", a2];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
      id v3 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v5 = [v3 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)__requestCriticalAppInfo:(id)a3 completionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v7, "UTF8String"));
    id v8 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = [v8 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  if (objc_opt_class())
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F946D8]);
    id v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setControlFlags:", objc_msgSend(v9, "controlFlags") | 0x1004);
      [v10 setDestinationDevice:v5];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke;
      v20[3] = &unk_1E69BC8D8;
      id v21 = v5;
      [v10 setInvalidationHandler:v20];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_72;
      id v17 = &unk_1E69BDAB0;
      id v19 = v6;
      id v10 = v10;
      id v18 = v10;
      [v10 activateWithCompletion:&v14];
    }
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]", v14, v15, v16, v17);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v11, "UTF8String"));
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

void __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = [NSString stringWithFormat:@"%s Session client with device %@ invalidated", "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]_block_invoke", *(void *)(a1 + 32)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v1, "UTF8String"));
    id v2 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v4 = [v2 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

void __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_72(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [NSString stringWithFormat:@"%s Session client falied to activate, error: %@", "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]_block_invoke", a2];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
      id v4 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v12 = [v4 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F94778];
    uint64_t v10 = MEMORY[0x1E4F1CC38];
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_77;
    v7[3] = &unk_1E69BDA88;
    id v6 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v6 sendRequestID:@"com.apple.wifi.trafficEngineering" request:MEMORY[0x1E4F1CC08] options:v5 responseHandler:v7];
  }
}

uint64_t __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)__collectCriticalAppInfo
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager __collectCriticalAppInfo]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
    id v3 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v62 = [v3 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  group = dispatch_group_create();
  id v4 = NSString;
  uint64_t v5 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
  id v6 = objc_msgSend(v4, "stringWithFormat:", @"Number of Peers %lu", objc_msgSend(v5, "count"));

  id v7 = MEMORY[0x1E4F14500];
  id v8 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    id v9 = objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v62 = v10;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  uint64_t v11 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    uint64_t v25 = [NSString stringWithFormat:@"No active clients, Returning"];
    v41 = MEMORY[0x1E4F14500];
    id v42 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", -[NSObject UTF8String](v25, "UTF8String"));
      id v43 = objc_claimAutoreleasedReturnValue();
      uint64_t v44 = [v43 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v62 = v44;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v13 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v77 count:16];
    if (v14)
    {
      uint64_t v45 = 0;
      uint64_t v15 = *(void *)v54;
      do
      {
        uint64_t v16 = 0;
        v45 += v14;
        do
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * v16);
          dispatch_group_enter(group);
          traffic_engr_queue = self->_traffic_engr_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke;
          block[3] = &unk_1E69BDB00;
          block[4] = self;
          void block[5] = v17;
          v52 = &v57;
          id v50 = v47;
          v51 = group;
          dispatch_async(traffic_engr_queue, block);

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v77 count:16];
      }
      while (v14);
    }
    else
    {
      uint64_t v45 = 0;
    }

    dispatch_time_t v19 = dispatch_time(0, 60000000000);
    if (dispatch_group_wait(group, v19))
    {
      long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d Sec timeout waiting for Critical App Info from peers", 60);
      id v21 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v20, "UTF8String"));
        id v23 = objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [v23 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v62 = v24;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
      }
    }
    uint64_t v25 = MEMORY[0x1E4F14500];
    id v26 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/TrafficEngineering/WFTrafficEngManager.m"];
      id v28 = [v27 lastPathComponent];
      uint64_t v29 = [v28 UTF8String];
      v30 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
      uint64_t v31 = [v30 count];
      uint64_t v32 = v58[3];
      *(_DWORD *)buf = 141559810;
      uint64_t v62 = 1752392040;
      __int16 v63 = 2080;
      uint64_t v64 = v29;
      __int16 v65 = 2160;
      uint64_t v66 = 1752392040;
      __int16 v67 = 1024;
      int v68 = 384;
      __int16 v69 = 2048;
      uint64_t v70 = v31;
      __int16 v71 = 2048;
      uint64_t v72 = v45;
      __int16 v73 = 2048;
      uint64_t v74 = v32;
      __int16 v75 = 2112;
      id v76 = v47;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[TrafficEngineering] (%{mask.hash}s:%{mask.hash}d) active peers %lu, requested peers %lu,  responses %lu, diagnostics log %@", buf, 0x4Eu);

      uint64_t v25 = MEMORY[0x1E4F14500];
    }
  }

  id v33 = self;
  objc_sync_enter(v33);
  v34 = (void *)[v47 copy];
  objc_sync_exit(v33);

  v35 = objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager __collectCriticalAppInfo]");
  uint64_t v36 = MEMORY[0x1E4F14500];
  id v37 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v35, "UTF8String"));
    id v38 = objc_claimAutoreleasedReturnValue();
    uint64_t v39 = [v38 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v62 = v39;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
  _Block_object_dispose(&v57, 8);

  return v34;
}

void __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke_2;
  v7[3] = &unk_1E69BDAD8;
  uint64_t v4 = *(void *)(a1 + 64);
  void v7[4] = v2;
  uint64_t v11 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "__requestCriticalAppInfo:completionBlock:", v3, v7);
}

void __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v5 = [*(id *)(a1 + 40) count];
    objc_sync_exit(v4);

    uint64_t v6 = NSString;
    id v7 = [*(id *)(a1 + 48) model];
    id v8 = [v6 stringWithFormat:@"%s Response from peer %@: %@, total responses %lu", "-[WFTrafficEngManager __collectCriticalAppInfo]_block_invoke_2", v7, v3, v5];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String"));
      id v9 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v11 = [v9 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (WFTrafficEngDelegate)trafficEngDelegate
{
  return self->_trafficEngDelegate;
}

- (void)setTrafficEngDelegate:(id)a3
{
  self->_trafficEngDelegate = (WFTrafficEngDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryClient, 0);

  objc_storeStrong((id *)&self->_traffic_engr_queue, 0);
}

@end