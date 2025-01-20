@interface WFScanManager
- (BOOL)_canResumeScanning;
- (BOOL)_isScanning;
- (BOOL)doUnFilteredScanning;
- (BOOL)hotspotHelperScanning;
- (BOOL)supportsHotspotHelper;
- (BOOL)supportsUnfilteredScanning;
- (NSMutableArray)scanQueue;
- (NSMutableSet)hotspotPluginNetworks;
- (NSMutableSet)networks;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)scanDispatchQueue;
- (WFScanManager)init;
- (WFScanManager)initWithScanProxy:(id)a3 delegate:(id)a4;
- (WFScanManagerDelegate)delegate;
- (WFScanManagerScanProxy)scanProxy;
- (double)scanInterval;
- (double)setTwentyPercentSkew:(double)a3;
- (id)_knownHiddenNetworkNames;
- (id)hotspotHelperForScanRecord:(id)a3;
- (id)singleScanBlock;
- (int64_t)numberOfScansPerformed;
- (int64_t)state;
- (unint64_t)consecutiveZeroFilteredScanResults;
- (unint64_t)consecutiveZeroUnFilteredScanResults;
- (void)_cancelQueuedScan;
- (void)_checkForNoNetworksFound;
- (void)_processNextScan;
- (void)_queueScan;
- (void)_removeQueuedScans;
- (void)_resetNoNetworksFoundCounters;
- (void)_scan;
- (void)_scanningDidFinishWithError:(id)a3;
- (void)_scanningWillStart;
- (void)_startHotspotPluginScan;
- (void)_stopNetworkPluginScan;
- (void)_updatePartialScanResults:(id)a3;
- (void)pause;
- (void)resume;
- (void)setConsecutiveZeroFilteredScanResults:(unint64_t)a3;
- (void)setConsecutiveZeroUnFilteredScanResults:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDoUnFilteredScanning:(BOOL)a3;
- (void)setHotspotHelperScanning:(BOOL)a3;
- (void)setHotspotPluginNetworks:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setNumberOfScansPerformed:(int64_t)a3;
- (void)setScanDispatchQueue:(id)a3;
- (void)setScanInterval:(double)a3;
- (void)setScanProxy:(id)a3;
- (void)setScanQueue:(id)a3;
- (void)setSingleScanBlock:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportsHotspotHelper:(BOOL)a3;
- (void)setSupportsUnfilteredScanning:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation WFScanManager

- (WFScanManager)initWithScanProxy:(id)a3 delegate:(id)a4
{
  *(void *)&v31[5] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  [v7 scanInterval];
  if (v9 < 1.0)
  {
    v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_25;
    }
    int v30 = 67109120;
    v31[0] = 1;
    v25 = "Minimum scan interval is %d";
    v26 = v23;
    os_log_type_t v27 = v24;
    uint32_t v28 = 8;
    goto LABEL_24;
  }
  [v7 scanInterval];
  self->_scanInterval = v10;
  if (!v8)
  {
LABEL_26:
    p_super = &self->super;
    self = 0;
    goto LABEL_15;
  }
  objc_storeWeak((id *)&self->_delegate, v8);
  self->_state = 0;
  if (!v7)
  {
    v23 = WFLogForCategory(0);
    os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v29)) {
      goto LABEL_25;
    }
    int v30 = 136315138;
    *(void *)v31 = "-[WFScanManager initWithScanProxy:delegate:]";
    v25 = "%s: nil wifiClient";
    v26 = v23;
    os_log_type_t v27 = v29;
    uint32_t v28 = 12;
LABEL_24:
    _os_log_impl(&dword_226071000, v26, v27, v25, (uint8_t *)&v30, v28);
LABEL_25:

    goto LABEL_26;
  }
  objc_storeStrong((id *)&self->_scanProxy, a3);
  v11 = (OS_dispatch_queue *)dispatch_queue_create(0, MEMORY[0x263EF83A8]);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v11;

  if (!self->_internalQueue) {
    goto LABEL_26;
  }
  v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifikit.scanmanager", 0);
  scanDispatchQueue = self->_scanDispatchQueue;
  self->_scanDispatchQueue = v13;

  if (!self->_scanDispatchQueue) {
    goto LABEL_26;
  }
  self->_doUnFilteredScanning = 0;
  self->_consecutiveZeroFilteredScanResults = 0;
  self->_consecutiveZeroUnFilteredScanResults = 0;
  char v15 = objc_opt_respondsToSelector();
  char v16 = 0;
  if (v15) {
    char v16 = [v8 scanManagerShouldSupportUnfilteredScanning:self];
  }
  self->_BOOL supportsUnfilteredScanning = v16;
  if (objc_opt_respondsToSelector()) {
    char v17 = [v8 scanManagerShouldSupportHotspotHelper:self];
  }
  else {
    char v17 = 0;
  }
  self->_BOOL supportsHotspotHelper = v17;
  self->_hotspotHelperScanning = 0;
  p_super = WFLogForCategory(6uLL);
  os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && p_super && os_log_type_enabled(p_super, v19))
  {
    BOOL supportsUnfilteredScanning = self->_supportsUnfilteredScanning;
    BOOL supportsHotspotHelper = self->_supportsHotspotHelper;
    int v30 = 67109376;
    v31[0] = supportsUnfilteredScanning;
    LOWORD(v31[1]) = 1024;
    *(_DWORD *)((char *)&v31[1] + 2) = supportsHotspotHelper;
    _os_log_impl(&dword_226071000, p_super, v19, "initiliazed scan manager (unfilteredScanning=%d, hotspot helper supported=%d)", (uint8_t *)&v30, 0xEu);
  }
LABEL_15:

  return self;
}

- (WFScanManager)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFScanManager init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (void)start
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = WFLogForCategory(6uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      unint64_t v6 = [(WFScanManager *)self state];
      if (v6 > 3) {
        id v7 = 0;
      }
      else {
        id v7 = off_26478F840[v6];
      }
      int v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_226071000, v5, v4, "starting scan manager (current state='%@')", (uint8_t *)&v17, 0xCu);
    }
  }
  id v8 = [(WFScanManager *)self scanProxy];
  char v9 = [v8 isScanningAllowed];

  if (v9)
  {
    if ([(WFScanManager *)self state])
    {
      double v10 = WFLogForCategory(6uLL);
      os_log_type_t v11 = OSLogForWFLogLevel(2uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 2 && v10)
      {
        v12 = v10;
        if (os_log_type_enabled(v12, v11))
        {
          unint64_t v13 = [(WFScanManager *)self state];
          if (v13 > 3) {
            v14 = 0;
          }
          else {
            v14 = off_26478F840[v13];
          }
          int v17 = 138412290;
          v18 = v14;
          _os_log_impl(&dword_226071000, v12, v11, "scanning is already started (state='%@').", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    else
    {
      [(WFScanManager *)self setState:1];
      self->_numberOfScansPerformed = 0;
      [(WFScanManager *)self _scan];
      [(WFScanManager *)self _startHotspotPluginScan];
    }
  }
  else
  {
    char v15 = WFLogForCategory(6uLL);
    os_log_type_t v16 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v15 && os_log_type_enabled(v15, v16))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_226071000, v15, v16, "interface is powered OFF, pausing scan state.", (uint8_t *)&v17, 2u);
    }

    [(WFScanManager *)self setState:3];
  }
}

- (void)stop
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t v3 = [(WFScanManager *)self state];
  os_log_type_t v4 = WFLogForCategory(6uLL);
  if (v3)
  {
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      unint64_t v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        unint64_t v7 = [(WFScanManager *)self state];
        if (v7 > 3) {
          id v8 = 0;
        }
        else {
          id v8 = off_26478F840[v7];
        }
        int v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_226071000, v6, v5, "stopping scan manager (current state='%@')", (uint8_t *)&v13, 0xCu);
      }
    }
    [(WFScanManager *)self setState:0];
    [(WFScanManager *)self setNetworks:0];
    [(WFScanManager *)self _removeQueuedScans];
    [(WFScanManager *)self _cancelQueuedScan];
    [(WFScanManager *)self _stopNetworkPluginScan];
    self->_numberOfScansPerformed = 0;
  }
  else
  {
    uint64_t v9 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v4)
    {
      double v10 = v4;
      if (os_log_type_enabled(v10, (os_log_type_t)v9))
      {
        unint64_t v11 = [(WFScanManager *)self state];
        if (v11 > 3) {
          v12 = 0;
        }
        else {
          v12 = off_26478F840[v11];
        }
        int v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_226071000, v10, (os_log_type_t)v9, "unable to stop scan manager, already paused (current state='%@')", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)pause
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t v3 = [(WFScanManager *)self state];
  os_log_type_t v4 = WFLogForCategory(6uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (v3 == 3)
  {
    if (v7)
    {
      id v8 = v4;
      if (os_log_type_enabled(v8, v5))
      {
        unint64_t v9 = [(WFScanManager *)self state];
        if (v9 > 3) {
          double v10 = 0;
        }
        else {
          double v10 = off_26478F840[v9];
        }
        int v14 = 138412290;
        uint64_t v15 = v10;
        _os_log_impl(&dword_226071000, v8, v5, "unable to pause scan manager, already paused (current state='%@')", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    if (v7)
    {
      unint64_t v11 = v4;
      if (os_log_type_enabled(v11, v5))
      {
        unint64_t v12 = [(WFScanManager *)self state];
        if (v12 > 3) {
          int v13 = 0;
        }
        else {
          int v13 = off_26478F840[v12];
        }
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_impl(&dword_226071000, v11, v5, "pausing scan manager (current state='%@')", (uint8_t *)&v14, 0xCu);
      }
    }
    [(WFScanManager *)self setState:3];
    [(WFScanManager *)self setNetworks:0];
    [(WFScanManager *)self _removeQueuedScans];
    [(WFScanManager *)self _cancelQueuedScan];
    [(WFScanManager *)self _stopNetworkPluginScan];
  }
}

- (void)resume
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFScanManager *)self _canResumeScanning];
  os_log_type_t v4 = WFLogForCategory(6uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (v3)
  {
    if (v7)
    {
      id v8 = v4;
      if (os_log_type_enabled(v8, v5))
      {
        unint64_t v9 = [(WFScanManager *)self state];
        if (v9 > 3) {
          double v10 = 0;
        }
        else {
          double v10 = off_26478F840[v9];
        }
        int v17 = 138412290;
        v18 = v10;
        _os_log_impl(&dword_226071000, v8, v5, "resuming scan manager (current state='%@')", (uint8_t *)&v17, 0xCu);
      }
    }
    int v14 = [(WFScanManager *)self scanProxy];
    int v15 = [v14 isScanningAllowed];

    if (v15)
    {
      [(WFScanManager *)self setState:1];
      [(WFScanManager *)self _scan];
      [(WFScanManager *)self _startHotspotPluginScan];
      return;
    }
    os_log_type_t v4 = WFLogForCategory(6uLL);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v16))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_226071000, v4, v16, "can't resume scanning, power is off.", (uint8_t *)&v17, 2u);
    }
  }
  else if (v7)
  {
    unint64_t v11 = v4;
    if (os_log_type_enabled(v11, v5))
    {
      unint64_t v12 = [(WFScanManager *)self state];
      if (v12 > 3) {
        int v13 = 0;
      }
      else {
        int v13 = off_26478F840[v12];
      }
      int v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_226071000, v11, v5, "unable to resume scan manager, already resumed (current state='%@')", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)setScanInterval:(double)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_scanInterval != a3)
  {
    os_log_type_t v5 = WFLogForCategory(6uLL);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      double scanInterval = self->_scanInterval;
      int v8 = 134218240;
      double v9 = scanInterval;
      __int16 v10 = 2048;
      double v11 = a3;
      _os_log_impl(&dword_226071000, v5, v6, "scan interval changed from %f to %f", (uint8_t *)&v8, 0x16u);
    }

    self->_double scanInterval = a3;
    if ([(WFScanManager *)self state] == 1)
    {
      [(WFScanManager *)self _cancelQueuedScan];
      [(WFScanManager *)self _queueScan];
    }
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(WFScanManager *)self state] != a3)
  {
    unint64_t v5 = [(WFScanManager *)self state];
    internalQueue = self->_internalQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __26__WFScanManager_setState___block_invoke;
    v12[3] = &unk_26478E500;
    v12[4] = self;
    v12[5] = a3;
    dispatch_barrier_async(internalQueue, v12);
    int v7 = WFLogForCategory(6uLL);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      if (v5 > 3) {
        double v9 = 0;
      }
      else {
        double v9 = off_26478F840[v5];
      }
      if ((unint64_t)a3 > 3) {
        __int16 v10 = 0;
      }
      else {
        __int16 v10 = off_26478F840[a3];
      }
      *(_DWORD *)buf = 138412546;
      int v14 = v9;
      __int16 v15 = 2112;
      os_log_type_t v16 = v10;
      _os_log_impl(&dword_226071000, v7, v8, "scan manager state changed from %@ to %@", buf, 0x16u);
    }

    double v11 = [(WFScanManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v11 scanManager:self stateDidChange:a3];
    }
  }
}

uint64_t __26__WFScanManager_setState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(result + 40);
  return result;
}

- (int64_t)state
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__WFScanManager_state__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__WFScanManager_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (double)setTwentyPercentSkew:(double)a3
{
  double v3 = a3 - a3 * 0.1;
  double v4 = a3 * 0.1 + a3;
  uint32_t v5 = arc4random();
  return v3 + (double)(v5 + ((v5 / 0x7FFFFFFF) | ((v5 / 0x7FFFFFFF) << 31))) / 2147483650.0 * (v4 - v3);
}

- (void)_queueScan
{
  v19[2] = *(id *)MEMORY[0x263EF8340];
  if ([(WFScanManager *)self state] == 1)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3042000000;
    uint64_t v17 = __Block_byref_object_copy__6;
    v18 = __Block_byref_object_dispose__6;
    objc_initWeak(v19, self);
    if (self->_singleScanBlock)
    {
      double v11 = WFLogForCategory(6uLL);
      os_log_type_t v12 = OSLogForWFLogLevel(2uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 2 && v11 && os_log_type_enabled(v11, v12))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_226071000, v11, v12, "Won't dispatch another scan 'timer'(dispatch_after now) as there's already one waiting to execute", v14, 2u);
      }
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __27__WFScanManager__queueScan__block_invoke;
      block[3] = &unk_26478E338;
      block[4] = &buf;
      dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(WFScanManager *)self setSingleScanBlock:v3];

      [(WFScanManager *)self setTwentyPercentSkew:self->_scanInterval];
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      dispatch_after(v5, (dispatch_queue_t)self->_scanDispatchQueue, self->_singleScanBlock);
    }
    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(v19);
  }
  else
  {
    uint64_t v6 = WFLogForCategory(6uLL);
    os_log_type_t v7 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v6)
    {
      uint64_t v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        unint64_t v9 = [(WFScanManager *)self state];
        if (v9 > 3) {
          __int16 v10 = 0;
        }
        else {
          __int16 v10 = off_26478F840[v9];
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_226071000, v8, v7, "can't queue scan, scanning state is not Idle, it's %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

void __27__WFScanManager__queueScan__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [WeakRetained _scan];
}

- (void)_cancelQueuedScan
{
  scanDispatchQueue = self->_scanDispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WFScanManager__cancelQueuedScan__block_invoke;
  block[3] = &unk_26478E528;
  block[4] = self;
  dispatch_async(scanDispatchQueue, block);
}

void __34__WFScanManager__cancelQueuedScan__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) singleScanBlock];

  if (v2)
  {
    dispatch_block_t v3 = [*(id *)(a1 + 32) singleScanBlock];
    dispatch_block_cancel(v3);

    double v4 = *(void **)(a1 + 32);
    [v4 setSingleScanBlock:0];
  }
}

- (void)_scan
{
  dispatch_block_t v3 = [(WFScanManager *)self scanProxy];
  char v4 = [v3 isScanningAllowed];

  if (v4)
  {
    dispatch_time_t v5 = [MEMORY[0x263EFF9C0] set];
    [(WFScanManager *)self setNetworks:v5];

    [(WFScanManager *)self _scanningWillStart];
    scanDispatchQueue = self->_scanDispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __22__WFScanManager__scan__block_invoke;
    block[3] = &unk_26478E528;
    block[4] = self;
    dispatch_async(scanDispatchQueue, block);
  }
  else
  {
    os_log_type_t v7 = WFLogForCategory(6uLL);
    os_log_type_t v8 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v7 && os_log_type_enabled(v7, v8))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_226071000, v7, v8, "stopping scan, power is OFF", buf, 2u);
    }
  }
}

void __22__WFScanManager__scan__block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) scanProxy];
  dispatch_block_t v3 = [v2 scannableChannels];

  if (v3)
  {
    v46 = v3;
    char v4 = WFSplitChannelsBetweenBands(v3);
    uint64_t v43 = a1;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 112);
    if (v6 >= 4)
    {
      *(void *)(v5 + 112) = 0;
      os_log_type_t v7 = WFLogForCategory(6uLL);
      os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_226071000, v7, v8, "resetting scan count for low priority", buf, 2u);
      }
    }
    unint64_t v9 = v6 - 1;
    __int16 v10 = [MEMORY[0x263EFF980] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v60 count:16];
    id v44 = v11;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v17 = +[WFScanRequest scanRequestForChannels:v16];
          [v17 setIncludeBSSList:1];
          [v17 setLowPriorityScan:v9 < 3];
          v18 = WFLogForCategory(6uLL);
          if (v17)
          {
            os_log_type_t v19 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v18 && os_log_type_enabled(v18, v19))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v56 = (uint64_t)v17;
              _os_log_impl(&dword_226071000, v18, v19, "created scan request: %@", buf, 0xCu);
            }

            [v10 addObject:v17];
          }
          else
          {
            os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v20))
            {
              *(_DWORD *)long long buf = 138543362;
              uint64_t v56 = (uint64_t)v16;
              _os_log_impl(&dword_226071000, v18, v20, "Unable to create scan request from channels %{public}@", buf, 0xCu);
            }

            id v11 = v44;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v13);
    }

    v21 = [*(id *)(v43 + 32) _knownHiddenNetworkNames];
    v22 = v21;
    v45 = v10;
    if (v21)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v48;
        do
        {
          v26 = v22;
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(v26);
            }
            uint32_t v28 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            os_log_type_t v29 = +[WFScanRequest scanRequestForSSID:v28 channels:v46];
            [v29 setIncludeBSSList:1];
            [v29 setLowPriorityScan:v9 < 3];
            int v30 = WFLogForCategory(6uLL);
            if (v29)
            {
              os_log_type_t v31 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v30 && os_log_type_enabled(v30, v31))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v56 = (uint64_t)v28;
                _os_log_impl(&dword_226071000, v30, v31, "created directed scan for %@", buf, 0xCu);
              }

              [v45 addObject:v29];
            }
            else
            {
              os_log_type_t v32 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v32))
              {
                *(_DWORD *)long long buf = 138412546;
                uint64_t v56 = (uint64_t)v28;
                __int16 v57 = 2114;
                v58 = v46;
                _os_log_impl(&dword_226071000, v30, v32, "Unable to create scan request for ssid %@ from channels %{public}@", buf, 0x16u);
              }
            }
          }
          v22 = v26;
          uint64_t v24 = [v26 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v24);
      }
    }
    else
    {
      v37 = WFLogForCategory(6uLL);
      os_log_type_t v38 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v37 && os_log_type_enabled(v37, v38))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_226071000, v37, v38, "no hidden networks to scan", buf, 2u);
      }
    }
    v39 = WFLogForCategory(6uLL);
    os_log_type_t v40 = OSLogForWFLogLevel(1uLL);
    dispatch_block_t v3 = v46;
    if (WFCurrentLogLevel() && v39)
    {
      v41 = v39;
      if (os_log_type_enabled(v41, v40))
      {
        uint64_t v42 = [v45 count];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v56 = v42;
        _os_log_impl(&dword_226071000, v41, v40, "queuing scans: %lu", buf, 0xCu);
      }
    }
    [*(id *)(v43 + 32) setScanQueue:v45];
    [*(id *)(v43 + 32) _processNextScan];

    v36 = v44;
  }
  else
  {
    v33 = WFLogForCategory(6uLL);
    os_log_type_t v34 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v33 && os_log_type_enabled(v33, v34))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_226071000, v33, v34, "device scan channels are nil", buf, 2u);
    }

    v35 = *(void **)(a1 + 32);
    v36 = [MEMORY[0x263F087E8] scanErrorWithReason:4];
    [v35 _scanningDidFinishWithError:v36];
  }
}

- (void)_processNextScan
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  dispatch_block_t v3 = [(WFScanManager *)self scanQueue];
  if ([v3 count])
  {
    BOOL v4 = [(WFScanManager *)self _isScanning];

    if (v4)
    {
      uint64_t v5 = [(WFScanManager *)self scanQueue];
      uint64_t v6 = [v5 firstObject];

      os_log_type_t v7 = WFLogForCategory(6uLL);
      os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_226071000, v7, v8, "{SCAN+} starting scan: %@", (uint8_t *)&buf, 0xCu);
      }

      unint64_t v9 = [(WFScanManager *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = [(WFScanManager *)self delegate];
        [v11 scanManager:self willStartScanRequest:v6];
      }
      if ([(WFScanManager *)self supportsUnfilteredScanning]
        && self->_doUnFilteredScanning)
      {
        uint64_t v12 = WFLogForCategory(6uLL);
        os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_226071000, v12, v13, "removing scan filter", (uint8_t *)&buf, 2u);
        }

        [v6 setApplyRssiThresholdFilter:0];
      }
      uint64_t v14 = [MEMORY[0x263EFF910] date];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v27 = 0x2020000000;
      BOOL v28 = 0;
      __int16 v15 = [v6 ssid];
      BOOL v16 = v15 != 0;

      BOOL v28 = v16;
      objc_initWeak(&location, self);
      uint64_t v17 = [(WFScanManager *)self scanProxy];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __33__WFScanManager__processNextScan__block_invoke;
      v20[3] = &unk_26478F7D8;
      objc_copyWeak(&v24, &location);
      id v18 = v14;
      id v21 = v18;
      id v19 = v6;
      id v22 = v19;
      p_long long buf = &buf;
      [v17 performScanWithRequest:v19 reply:v20];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);

      return;
    }
  }
  else
  {
  }
  [(WFScanManager *)self _scanningDidFinishWithError:0];
}

void __33__WFScanManager__processNextScan__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  os_log_type_t v8 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v9 = [WeakRetained scanDispatchQueue];

    if (v9)
    {
      char v10 = [v8 scanDispatchQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __33__WFScanManager__processNextScan__block_invoke_2;
      v11[3] = &unk_26478F7B0;
      id v12 = *(id *)(a1 + 32);
      id v13 = v5;
      id v14 = *(id *)(a1 + 40);
      id v15 = v6;
      BOOL v16 = v8;
      uint64_t v17 = *(void *)(a1 + 48);
      dispatch_async(v10, v11);
    }
  }
}

void __33__WFScanManager__processNextScan__block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v3 = -v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = WFLogForCategory(6uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (v4)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v32 = 134218498;
      double v33 = v3;
      __int16 v34 = 2112;
      *(void *)v35 = v9;
      *(_WORD *)&v35[8] = 2112;
      *(void *)&v35[10] = v10;
      _os_log_impl(&dword_226071000, v5, v6, "{SCAN-} %f sec, scan error %@ for request: %@", (uint8_t *)&v32, 0x20u);
    }
  }
  else if (v8)
  {
    id v11 = v5;
    if (os_log_type_enabled(v11, v6))
    {
      int v12 = [*(id *)(a1 + 56) count];
      uint64_t v13 = *(void *)(a1 + 48);
      int v32 = 134218498;
      double v33 = v3;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = v12;
      *(_WORD *)&v35[4] = 2112;
      *(void *)&v35[6] = v13;
      _os_log_impl(&dword_226071000, v11, v6, "{SCAN-} %f sec, networks found %d for request: %@", (uint8_t *)&v32, 0x1Cu);
    }
  }
  id v14 = [*(id *)(a1 + 64) scanQueue];
  char v15 = [v14 containsObject:*(void *)(a1 + 48)];

  if ((v15 & 1) == 0)
  {
    id v19 = WFLogForCategory(6uLL);
    os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
    {
      double v21 = *(double *)(a1 + 48);
      int v32 = 138412290;
      double v33 = v21;
      _os_log_impl(&dword_226071000, v19, v20, "scan request='%@' was cancelled, disregarding result", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_45;
  }
  BOOL v16 = *(void **)(a1 + 40);
  if (v16 && [v16 code])
  {
    uint64_t v17 = WFLogForCategory(6uLL);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_226071000, v17, v18, "deferring scans until device is available", (uint8_t *)&v32, 2u);
    }

    [*(id *)(a1 + 64) _removeQueuedScans];
    [*(id *)(a1 + 64) _scanningDidFinishWithError:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 64) _isScanning])
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) && ![*(id *)(a1 + 56) count])
    {
      uint64_t v25 = WFLogForCategory(6uLL);
      os_log_type_t v26 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v25)
      {
        uint64_t v27 = v25;
        if (os_log_type_enabled(v27, v26))
        {
          double v28 = [*(id *)(a1 + 48) ssid];
          int v32 = 138412290;
          double v33 = v28;
          _os_log_impl(&dword_226071000, v27, v26, "no result for hidden network %@", (uint8_t *)&v32, 0xCu);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 64) _updatePartialScanResults:*(void *)(a1 + 56)];
    }
    uint64_t v29 = [*(id *)(a1 + 64) scanQueue];
    [v29 removeObject:*(void *)(a1 + 48)];

    [*(id *)(a1 + 64) _processNextScan];
  }
  else
  {
    id v22 = WFLogForCategory(6uLL);
    os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
    {
      double v24 = *(double *)(a1 + 48);
      int v32 = 138412290;
      double v33 = v24;
      _os_log_impl(&dword_226071000, v22, v23, "discarding results from: %@, this request was cancelled.", (uint8_t *)&v32, 0xCu);
    }
  }
  int v30 = [*(id *)(a1 + 64) delegate];
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    id v19 = [*(id *)(a1 + 64) delegate];
    [v19 scanManager:*(void *)(a1 + 64) didFinishScanRequest:*(void *)(a1 + 48) results:*(void *)(a1 + 56) error:*(void *)(a1 + 40) timeElapsed:v3];
LABEL_45:
  }
}

- (void)_updatePartialScanResults:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFScanManager *)self networks];

  if (v5)
  {
    os_log_type_t v6 = [(WFScanManager *)self networks];
    BOOL v7 = (void *)[v6 mutableCopy];

    [v7 intersectSet:v4];
    if ([v7 count])
    {
      int v8 = WFLogForCategory(6uLL);
      os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8)
      {
        uint64_t v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          int v11 = [v7 count];
          int v12 = [v7 logStringWithScanRecords];
          *(_DWORD *)long long buf = 67109378;
          int v44 = v11;
          __int16 v45 = 2112;
          v46 = v12;
          _os_log_impl(&dword_226071000, v10, v9, "found duplicate (%d networks): %@", buf, 0x12u);
        }
      }
    }
    uint64_t v13 = (void *)[v4 mutableCopy];
    id v14 = [(WFScanManager *)self networks];
    [v13 minusSet:v14];

    if (v13)
    {
      char v15 = WFLogForCategory(6uLL);
      os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15)
      {
        uint64_t v17 = v15;
        if (os_log_type_enabled(v17, v16))
        {
          int v18 = [v13 count];
          id v19 = [v13 logStringWithScanRecords];
          *(_DWORD *)long long buf = 67109378;
          int v44 = v18;
          __int16 v45 = 2112;
          v46 = v19;
          _os_log_impl(&dword_226071000, v17, v16, "found new networks (%d networks): %@", buf, 0x12u);
        }
      }
    }
  }
  os_log_type_t v20 = [(WFScanManager *)self networks];
  [v20 compareAndUpdateDuplicateScanRecords:v4];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  double v21 = [(WFScanManager *)self networks];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v21);
        }
        os_log_type_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v27 = [(WFScanManager *)self hotspotHelperForScanRecord:v26];
        double v28 = v27;
        if (v27)
        {
          uint64_t v29 = [v27 label];
          [v26 setHotspotPluginLabel:v29];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v23);
  }

  int v30 = [(WFScanManager *)self networks];
  char v31 = (void *)[v30 mutableCopy];

  [v31 intersectSet:v4];
  int v32 = WFLogForCategory(6uLL);
  os_log_type_t v33 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v32)
  {
    __int16 v34 = v32;
    if (os_log_type_enabled(v34, v33))
    {
      int v35 = [v31 count];
      uint64_t v36 = [v31 logStringWithScanRecords];
      *(_DWORD *)long long buf = 67109378;
      int v44 = v35;
      __int16 v45 = 2112;
      v46 = v36;
      _os_log_impl(&dword_226071000, v34, v33, "partial scan results (%d networks): %@", buf, 0x12u);
    }
  }

  v37 = [(WFScanManager *)self delegate];
  [v37 scanManager:self updatedPartialResults:v31];
}

- (void)_scanningWillStart
{
  double v3 = WFLogForCategory(6uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "scanning will start", v6, 2u);
  }

  [(WFScanManager *)self setState:2];
  id v5 = [(WFScanManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 scanManagerScanningWillStart:self];
  }
}

- (void)_scanningDidFinishWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(6uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    BOOL v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      unint64_t v8 = [(WFScanManager *)self state];
      if (v8 > 3) {
        os_log_type_t v9 = 0;
      }
      else {
        os_log_type_t v9 = off_26478F840[v8];
      }
      uint64_t v10 = [(WFScanManager *)self networks];
      *(_DWORD *)long long buf = 138412802;
      os_log_type_t v20 = v9;
      __int16 v21 = 2048;
      uint64_t v22 = [v10 count];
      __int16 v23 = 1024;
      BOOL v24 = [(WFScanManager *)self supportsUnfilteredScanning];
      _os_log_impl(&dword_226071000, v7, v6, "scanning did finish (current state='%@'), results=%lu, supportsUnfilteredScanning=%u", buf, 0x1Cu);
    }
  }

  ++self->_numberOfScansPerformed;
  if ([(WFScanManager *)self supportsUnfilteredScanning])
  {
    if (v4) {
      [(WFScanManager *)self _resetNoNetworksFoundCounters];
    }
    else {
      [(WFScanManager *)self _checkForNoNetworksFound];
    }
  }
  int v11 = [(WFScanManager *)self delegate];
  int v12 = [(WFScanManager *)self networks];
  [v11 scanManagerScanningDidFinish:self withResults:v12 error:v4];

  uint64_t v13 = [(WFScanManager *)self networks];
  if (v13)
  {
    id v14 = (void *)v13;
    char v15 = [(WFScanManager *)self hotspotPluginNetworks];

    if (v15)
    {
      if (objc_opt_respondsToSelector())
      {
        os_log_type_t v16 = [(WFScanManager *)self hotspotPluginNetworks];
        [v11 scanManager:self didFindHotspotHelperNetworks:v16];
      }
    }
  }
  if ([(WFScanManager *)self state] != 3 && [(WFScanManager *)self state])
  {
    [(WFScanManager *)self setState:1];
    id singleScanBlock = self->_singleScanBlock;
    self->_id singleScanBlock = 0;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__WFScanManager__scanningDidFinishWithError___block_invoke;
    block[3] = &unk_26478E528;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __45__WFScanManager__scanningDidFinishWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueScan];
}

- (void)_checkForNoNetworksFound
{
  double v3 = [(WFScanManager *)self networks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(WFScanManager *)self _resetNoNetworksFoundCounters];
  }
  else
  {
    if (self->_doUnFilteredScanning)
    {
      unint64_t v5 = self->_consecutiveZeroUnFilteredScanResults + 1;
      self->_consecutiveZeroUnFilteredScanResults = v5;
      if (v5 < 2) {
        return;
      }
    }
    else
    {
      ++self->_consecutiveZeroFilteredScanResults;
      self->_doUnFilteredScanning = 1;
    }
    id v6 = [(WFScanManager *)self scanProxy];
    [v6 initiateNoNetworksSoftError];
  }
}

- (void)_resetNoNetworksFoundCounters
{
  self->_doUnFilteredScanning = 0;
  self->_consecutiveZeroFilteredScanResults = 0;
  self->_consecutiveZeroUnFilteredScanResults = 0;
}

- (BOOL)_isScanning
{
  return [(WFScanManager *)self state] == 2;
}

- (void)_startHotspotPluginScan
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(WFScanManager *)self supportsHotspotHelper])
  {
    double v3 = WFLogForCategory(6uLL);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v5))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_226071000, v3, v5, "hotspot helper is not supported", (uint8_t *)buf, 2u);
    }
    goto LABEL_7;
  }
  if ([(WFScanManager *)self hotspotHelperScanning])
  {
    double v3 = WFLogForCategory(6uLL);
    os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_226071000, v3, v4, "hotspot helper is already scanning", (uint8_t *)buf, 2u);
    }
LABEL_7:

    return;
  }
  objc_initWeak(buf, self);
  id v6 = MEMORY[0x263EF83A0];
  objc_copyWeak(&v12, buf);
  int v7 = CNScanListFilterStart();

  unint64_t v8 = WFLogForCategory(6uLL);
  os_log_type_t v9 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v8 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)id v14 = 67109120;
    int v15 = v7;
    _os_log_impl(&dword_226071000, v8, v9, "starting hotspot helper scanning success=%d", v14, 8u);
  }

  if (v7)
  {
    [(WFScanManager *)self setHotspotHelperScanning:1];
  }
  else
  {
    uint64_t v10 = WFLogForCategory(6uLL);
    int v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, (os_log_type_t)v11))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_226071000, v10, (os_log_type_t)v11, "unable to register for CN scan list filtering", v14, 2u);
    }
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

void __40__WFScanManager__startHotspotPluginScan__block_invoke(uint64_t a1, WFHotspotHelperNetwork *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v29 = [MEMORY[0x263EFF9C0] set];
  os_log_type_t v5 = WFLogForCategory(6uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v36 = a2;
    __int16 v37 = 2112;
    long long v38 = a3;
    _os_log_impl(&dword_226071000, v5, v6, "CN Callback(%@): %@", buf, 0x16u);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = a3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = CNNetworkGetSSIDString();
        int v11 = CNNetworkGetPassword();
        id v12 = CNNetworkGetPluginBundleID();
        uint64_t v13 = (void *)CNNetworkCopyPluginNames();
        if (v13)
        {
          id v14 = v13;
          int v15 = (void *)MEMORY[0x263F089D8];
          uint64_t v16 = [v13 objectAtIndex:0];
          uint64_t v17 = [v15 stringWithString:v16];

          if ((unint64_t)[v14 count] >= 2)
          {
            unsigned int v18 = 2;
            uint64_t v19 = 1;
            do
            {
              os_log_type_t v20 = [v14 objectAtIndex:v19];
              [v17 appendFormat:@", %@", v20];

              uint64_t v19 = v18;
            }
            while ([v14 count] > (unint64_t)v18++);
          }
          CFRelease(v14);
        }
        else
        {
          uint64_t v17 = 0;
        }
        uint64_t v22 = [[WFHotspotHelperNetwork alloc] initWithSSID:v10 bundleIdentifier:v12 password:v11 label:v17];
        [v29 addObject:v22];
        __int16 v23 = WFLogForCategory(6uLL);
        os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v36 = v22;
          _os_log_impl(&dword_226071000, v23, v24, "found hotspot helper network=%@", buf, 0xCu);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHotspotPluginNetworks:v29];
}

- (void)_stopNetworkPluginScan
{
  if ([(WFScanManager *)self supportsHotspotHelper])
  {
    BOOL v3 = [(WFScanManager *)self hotspotHelperScanning];
    os_log_type_t v4 = WFLogForCategory(6uLL);
    if (v3)
    {
      os_log_type_t v5 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_226071000, v4, v5, "stopping hotspot helper scanning", v7, 2u);
      }

      CNScanListFilterStop();
      [(WFScanManager *)self setHotspotHelperScanning:0];
    }
    else
    {
      os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v6))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_226071000, v4, v6, "hotspot helper is not scanning", buf, 2u);
      }
    }
  }
}

- (id)hotspotHelperForScanRecord:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = [(WFScanManager *)self hotspotPluginNetworks];
  if (v5)
  {
    os_log_type_t v6 = [(WFScanManager *)self hotspotPluginNetworks];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [(WFScanManager *)self hotspotPluginNetworks];
      os_log_type_t v9 = (void *)MEMORY[0x263F08A98];
      uint64_t v10 = [v4 ssid];
      int v11 = [v9 predicateWithFormat:@"ssid == %@", v10];
      id v12 = [v8 filteredSetUsingPredicate:v11];

      if ([v12 count])
      {
        uint64_t v13 = [v12 allObjects];
        os_log_type_t v5 = [v13 firstObject];

        id v14 = WFLogForCategory(6uLL);
        os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v14)
        {
          uint64_t v16 = v14;
          if (os_log_type_enabled(v16, v15))
          {
            uint64_t v17 = [v4 ssid];
            *(_DWORD *)long long buf = 138412546;
            os_log_type_t v20 = v17;
            __int16 v21 = 2112;
            uint64_t v22 = v5;
            _os_log_impl(&dword_226071000, v16, v15, "found hotspot network for %@ (helper %@)", buf, 0x16u);
          }
        }
      }
      else
      {
        os_log_type_t v5 = 0;
      }
    }
    else
    {
      os_log_type_t v5 = 0;
    }
  }

  return v5;
}

- (id)_knownHiddenNetworkNames
{
  BOOL v3 = [(WFScanManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    os_log_type_t v5 = [(WFScanManager *)self delegate];
    os_log_type_t v6 = [v5 scanManagerKnownHiddenNetworkNames:self];
  }
  else
  {
    os_log_type_t v6 = 0;
  }
  return v6;
}

- (BOOL)_canResumeScanning
{
  return [(WFScanManager *)self state] == 3 || [(WFScanManager *)self state] == 0;
}

- (void)_removeQueuedScans
{
  objc_initWeak(&location, self);
  scanDispatchQueue = self->_scanDispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__WFScanManager__removeQueuedScans__block_invoke;
  v4[3] = &unk_26478E3E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(scanDispatchQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __35__WFScanManager__removeQueuedScans__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WFLogForCategory(6uLL);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2)
  {
    char v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      id v5 = [WeakRetained scanQueue];
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_226071000, v4, v3, "removing scan queue contents: %@", (uint8_t *)&v7, 0xCu);
    }
  }

  os_log_type_t v6 = [WeakRetained scanQueue];
  [v6 removeAllObjects];
}

- (unint64_t)consecutiveZeroFilteredScanResults
{
  return self->_consecutiveZeroFilteredScanResults;
}

- (void)setConsecutiveZeroFilteredScanResults:(unint64_t)a3
{
  self->_consecutiveZeroFilteredScanResults = a3;
}

- (unint64_t)consecutiveZeroUnFilteredScanResults
{
  return self->_consecutiveZeroUnFilteredScanResults;
}

- (void)setConsecutiveZeroUnFilteredScanResults:(unint64_t)a3
{
  self->_consecutiveZeroUnFilteredScanResults = a3;
}

- (BOOL)doUnFilteredScanning
{
  return self->_doUnFilteredScanning;
}

- (void)setDoUnFilteredScanning:(BOOL)a3
{
  self->_doUnFilteredScanning = a3;
}

- (WFScanManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFScanManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)scanInterval
{
  return self->_scanInterval;
}

- (WFScanManagerScanProxy)scanProxy
{
  return self->_scanProxy;
}

- (void)setScanProxy:(id)a3
{
}

- (NSMutableSet)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
}

- (NSMutableArray)scanQueue
{
  return self->_scanQueue;
}

- (void)setScanQueue:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)scanDispatchQueue
{
  return self->_scanDispatchQueue;
}

- (void)setScanDispatchQueue:(id)a3
{
}

- (id)singleScanBlock
{
  return self->_singleScanBlock;
}

- (void)setSingleScanBlock:(id)a3
{
}

- (NSMutableSet)hotspotPluginNetworks
{
  return self->_hotspotPluginNetworks;
}

- (void)setHotspotPluginNetworks:(id)a3
{
}

- (BOOL)supportsHotspotHelper
{
  return self->_supportsHotspotHelper;
}

- (void)setSupportsHotspotHelper:(BOOL)a3
{
  self->_BOOL supportsHotspotHelper = a3;
}

- (BOOL)supportsUnfilteredScanning
{
  return self->_supportsUnfilteredScanning;
}

- (void)setSupportsUnfilteredScanning:(BOOL)a3
{
  self->_BOOL supportsUnfilteredScanning = a3;
}

- (BOOL)hotspotHelperScanning
{
  return self->_hotspotHelperScanning;
}

- (void)setHotspotHelperScanning:(BOOL)a3
{
  self->_hotspotHelperScanning = a3;
}

- (int64_t)numberOfScansPerformed
{
  return self->_numberOfScansPerformed;
}

- (void)setNumberOfScansPerformed:(int64_t)a3
{
  self->_numberOfScansPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotPluginNetworks, 0);
  objc_storeStrong(&self->_singleScanBlock, 0);
  objc_storeStrong((id *)&self->_scanDispatchQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_scanQueue, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_scanProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end