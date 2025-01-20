@interface SBSystemStatusWifiDataProvider
- (BOOL)isFallingBackToCellular;
- (BOOL)isWifiActive;
- (SBSystemStatusWifiDataProvider)init;
- (STWifiStatusDomainPublisher)wifiDataPublisher;
- (void)_queue_updateData;
- (void)_queue_updateWifiActive;
- (void)_registerForNotifications;
- (void)_updateData;
- (void)_updateWifiActive;
- (void)cellularFallbackWatcher;
- (void)dealloc;
- (void)invalidate;
- (void)setCellularFallbackWatcher:(void *)a3;
- (void)setFallingBackToCellular:(BOOL)a3;
- (void)setWifiActive:(BOOL)a3;
@end

@implementation SBSystemStatusWifiDataProvider

uint64_t __45__SBSystemStatusWifiDataProvider__updateData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateData");
}

- (BOOL)isWifiActive
{
  return self->_queue_wifiActive;
}

- (BOOL)isFallingBackToCellular
{
  return self->_queue_fallingBackToCellular;
}

- (void)_queue_updateData
{
  BSDispatchQueueAssert();
  id v6 = objc_alloc_init(MEMORY[0x1E4FA9428]);
  v3 = +[SBWiFiManager sharedInstance];
  if ([(SBSystemStatusWifiDataProvider *)self isWifiActive]) {
    uint64_t v4 = [(SBSystemStatusWifiDataProvider *)self isFallingBackToCellular] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }
  [v6 setWifiActive:v4];
  objc_msgSend(v6, "setSignalStrengthBars:", (int)objc_msgSend(v3, "signalStrengthBars"));
  objc_msgSend(v6, "setAssociatedToIOSHotspot:", objc_msgSend(v3, "isAssociatedToIOSHotspot"));
  v5 = [(SBSystemStatusWifiDataProvider *)self wifiDataPublisher];
  [v5 setData:v6];
}

- (STWifiStatusDomainPublisher)wifiDataPublisher
{
  return self->_wifiDataPublisher;
}

- (void)_updateData
{
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBSystemStatusWifiDataProvider__updateData__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

- (SBSystemStatusWifiDataProvider)init
{
  v17.receiver = self;
  v17.super_class = (Class)SBSystemStatusWifiDataProvider;
  id v2 = [(SBSystemStatusWifiDataProvider *)&v17 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA9578]);
    uint64_t v4 = [(id)SBApp systemStatusServer];
    uint64_t v5 = [v3 initWithServerHandle:v4];
    id v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = Serial;

    [v2 _registerForNotifications];
    objc_initWeak(&location, v2);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __38__SBSystemStatusWifiDataProvider_init__block_invoke;
    v14 = &unk_1E6AF4B10;
    objc_copyWeak(&v15, &location);
    v9 = (void *)MEMORY[0x1D948C7A0](&v11);
    *((void *)v2 + 4) = tcp_connection_fallback_watcher_create();
    objc_msgSend(v2, "_updateWifiActive", v11, v12, v13, v14);
    dispatch_async(*((dispatch_queue_t *)v2 + 2), v9);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return (SBSystemStatusWifiDataProvider *)v2;
}

void __38__SBSystemStatusWifiDataProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cellularFallbackWatcher];
  uint64_t v2 = tcp_fallback_watcher_fallback_inuse();
  if (v2 != [WeakRetained isFallingBackToCellular])
  {
    [WeakRetained setFallingBackToCellular:v2];
    id v3 = SBLogStatusBarish();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = @"off";
      if (v2) {
        uint64_t v4 = @"on";
      }
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "cellular fallback is %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained _updateData];
  }
}

- (void)dealloc
{
  [(SBSystemStatusWifiDataProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemStatusWifiDataProvider;
  [(SBSystemStatusWifiDataProvider *)&v3 dealloc];
}

- (void)invalidate
{
  [(STWifiStatusDomainPublisher *)self->_wifiDataPublisher invalidate];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if ([(SBSystemStatusWifiDataProvider *)self cellularFallbackWatcher])
  {
    tcp_connection_fallback_watcher_destroy();
    [(SBSystemStatusWifiDataProvider *)self setCellularFallbackWatcher:0];
  }
}

- (void)_registerForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateData name:@"SBWifiSignalStrengthChangedNotification" object:0];
  [v3 addObserver:self selector:sel__updateData name:@"SBWifiManagerLinkHotSpotnessDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__updateWifiActive name:@"SBWifiManagerPrimaryInterfaceMayHaveChangedNotification" object:0];
}

- (void)_updateWifiActive
{
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SBSystemStatusWifiDataProvider__updateWifiActive__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

uint64_t __51__SBSystemStatusWifiDataProvider__updateWifiActive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateWifiActive");
}

- (void)setWifiActive:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_wifiActive != v3) {
    self->_queue_wifiActive = v3;
  }
}

- (void)setFallingBackToCellular:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_fallingBackToCellular != v3) {
    self->_queue_fallingBackToCellular = v3;
  }
}

- (void)_queue_updateWifiActive
{
  BSDispatchQueueAssert();
  id v4 = +[SBWiFiManager sharedInstance];
  if ([v4 isPowered] && objc_msgSend(v4, "isPrimaryInterface")) {
    uint64_t v3 = [v4 isAssociated];
  }
  else {
    uint64_t v3 = 0;
  }
  [(SBSystemStatusWifiDataProvider *)self setWifiActive:v3];
  [(SBSystemStatusWifiDataProvider *)self _queue_updateData];
}

- (void)cellularFallbackWatcher
{
  return self->_cellularFallbackWatcher;
}

- (void)setCellularFallbackWatcher:(void *)a3
{
  self->_cellularFallbackWatcher = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiDataPublisher, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end