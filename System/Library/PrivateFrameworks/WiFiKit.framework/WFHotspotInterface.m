@interface WFHotspotInterface
- (BOOL)isScanning;
- (NSSet)networks;
- (OS_dispatch_queue)internalQueue;
- (SFRemoteHotspotSession)hotspotSession;
- (WFHotspotInterface)init;
- (WFHotspotInterfaceDelegate)delegate;
- (id)enableHotspot:(id)a3 error:(id *)a4;
- (void)_stopBrowsingRemoveCache:(BOOL)a3;
- (void)session:(id)a3 updatedFoundDevices:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHotspotSession:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)startBrowsing;
- (void)stopBrowsing;
- (void)updateNetworksWithHotspots:(id)a3;
@end

@implementation WFHotspotInterface

- (WFHotspotInterface)init
{
  v13.receiver = self;
  v13.super_class = (Class)WFHotspotInterface;
  v2 = [(WFHotspotInterface *)&v13 init];
  if (!v2)
  {
LABEL_12:
    v4 = 0;
LABEL_5:

    v2 = 0;
    goto LABEL_6;
  }
  id v3 = objc_alloc_init(MEMORY[0x263F6C298]);
  if (!v3)
  {
    v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_226071000, v10, v11, "failed to create SFRemoteHotspotSession", v12, 2u);
    }

    goto LABEL_12;
  }
  v4 = v3;
  [v3 setDelegate:v2];
  objc_storeStrong((id *)&v2->_hotspotSession, v4);
  uint64_t v5 = [MEMORY[0x263EFFA08] set];
  networks = v2->_networks;
  v2->_networks = (NSSet *)v5;

  if (!v2->_networks) {
    goto LABEL_5;
  }
  dispatch_queue_t v7 = dispatch_queue_create(0, 0);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v7;

  if (!v2->_internalQueue) {
    goto LABEL_5;
  }
LABEL_6:

  return v2;
}

- (void)updateNetworksWithHotspots:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        os_log_type_t v11 = [[WFHotspotDevice alloc] initWithHotspotDevice:*(void *)(*((void *)&v21 + 1) + 8 * v10)];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }

  v12 = [(WFHotspotInterface *)self networks];
  char v13 = [v5 isEqualToSet:v12];

  if (v13)
  {
    v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v14 && os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v14, v15, "Instant HS scan finished-> No new networks found.", buf, 2u);
    }
  }
  else
  {
    [(WFHotspotInterface *)self setNetworks:v5];
    v16 = WFLogForCategory(0);
    os_log_type_t v17 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v16 && os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFHotspotInterface updateNetworksWithHotspots:]";
      __int16 v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_226071000, v16, v17, "%s: new hotspots %@", buf, 0x16u);
    }

    v14 = [(WFHotspotInterface *)self delegate];
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __49__WFHotspotInterface_updateNetworksWithHotspots___block_invoke;
      v18[3] = &unk_26478E7D8;
      v14 = v14;
      v19 = v14;
      v20 = self;
      dispatch_async(MEMORY[0x263EF83A0], v18);
    }
  }
}

uint64_t __49__WFHotspotInterface_updateNetworksWithHotspots___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hotspotInterfaceDidUpdateNetworks:*(void *)(a1 + 40)];
}

- (id)enableHotspot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 hotspotDevice];

  if (v7)
  {
    *(void *)buf = 0;
    v28 = buf;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__7;
    v31 = __Block_byref_object_dispose__7;
    id v32 = 0;
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = __Block_byref_object_copy__7;
    v25 = __Block_byref_object_dispose__7;
    id v26 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v9 = [(WFHotspotInterface *)self hotspotSession];
    uint64_t v10 = [v6 hotspotDevice];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __42__WFHotspotInterface_enableHotspot_error___block_invoke;
    v17[3] = &unk_26478F8D8;
    v19 = &v21;
    v20 = buf;
    os_log_type_t v11 = v8;
    v18 = v11;
    [v9 enableRemoteHotspotForDevice:v10 withCompletionHandler:v17];

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      v12 = (void *)v22[5];
      if (v12) {
        *a4 = v12;
      }
    }
    id v13 = *((id *)v28 + 5);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v14, v15, "Cannot enable hotspot, WFHotspotDevice missing SFRemoteHotspotDevice", buf, 2u);
    }

    id v13 = 0;
  }

  return v13;
}

void __42__WFHotspotInterface_enableHotspot_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    dispatch_semaphore_t v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      int v12 = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_226071000, v8, v9, "error enabling hotspot: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    os_log_type_t v11 = a3;
  }
  else
  {
    uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    os_log_type_t v11 = a2;
  }
  objc_storeStrong(v10, v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isScanning
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__WFHotspotInterface_isScanning__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__WFHotspotInterface_isScanning__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)startBrowsing
{
  if (![(WFHotspotInterface *)self isScanning])
  {
    char v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v3, v4, "Starting hotspot browsing", buf, 2u);
    }

    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__WFHotspotInterface_startBrowsing__block_invoke;
    block[3] = &unk_26478E528;
    block[4] = self;
    dispatch_sync(internalQueue, block);
  }
}

uint64_t __35__WFHotspotInterface_startBrowsing__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) hotspotSession];
  [v2 startBrowsing];

  char v3 = *(void **)(a1 + 32);
  return [v3 setScanning:1];
}

- (void)stopBrowsing
{
}

- (void)_stopBrowsingRemoveCache:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__WFHotspotInterface__stopBrowsingRemoveCache___block_invoke;
  v4[3] = &unk_26478F418;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(internalQueue, v4);
}

uint64_t __47__WFHotspotInterface__stopBrowsingRemoveCache___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
    int v5 = *(unsigned __int8 *)(a1 + 40);
    v8[0] = 67109376;
    v8[1] = v4;
    __int16 v9 = 1024;
    int v10 = v5;
    _os_log_impl(&dword_226071000, v2, v3, "Stopping hotspot browsing (isBrowsing %d removeCache %d)", (uint8_t *)v8, 0xEu);
  }

  uint64_t v6 = [*(id *)(a1 + 32) hotspotSession];
  [v6 stopBrowsing];

  uint64_t result = [*(id *)(a1 + 32) setScanning:0];
  if (*(unsigned char *)(a1 + 40)) {
    return [*(id *)(a1 + 32) updateNetworksWithHotspots:0];
  }
  return result;
}

- (void)session:(id)a3 updatedFoundDevices:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "Found hotspots %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  [v8 addObjectsFromArray:v5];
  [(WFHotspotInterface *)self updateNetworksWithHotspots:v8];
}

- (NSSet)networks
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetworks:(id)a3
{
}

- (WFHotspotInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFHotspotInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (SFRemoteHotspotSession)hotspotSession
{
  return (SFRemoteHotspotSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHotspotSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotSession, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networks, 0);
}

@end