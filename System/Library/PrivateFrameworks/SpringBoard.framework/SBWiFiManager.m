@interface SBWiFiManager
+ (id)sharedInstance;
- (BOOL)_cachedIsAssociated;
- (BOOL)isAssociatedToIOSHotspot;
- (BOOL)isPowered;
- (BOOL)isPrimaryInterface;
- (BOOL)wiFiEnabled;
- (SBWiFiManager)init;
- (__CFRunLoop)wifiRunLoopRef;
- (__WiFiManagerClient)_lock_manager;
- (id)_wifiInterface;
- (id)currentNetworkName;
- (int)signalStrengthBars;
- (int)signalStrengthRSSI;
- (void)_linkDidChange;
- (void)_lock_setWiFiDevice:(__WiFiDeviceClient *)a3;
- (void)_lock_spawnManagerCallbackThread;
- (void)_powerStateDidChange;
- (void)_primaryInterfaceChanged:(BOOL)a3;
- (void)_runManagerCallbackThread;
- (void)_updateCurrentNetwork;
- (void)_updateDevicePresence;
- (void)_updateSignalStrength;
- (void)_updateSignalStrengthFromRawRSSI:(int)a3 andScaledRSSI:(float)a4;
- (void)_updateWiFiDevice;
- (void)_updateWiFiState;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPowered:(BOOL)a3;
- (void)setWiFiEnabled:(BOOL)a3;
@end

@implementation SBWiFiManager

- (void)_updateSignalStrengthFromRawRSSI:(int)a3 andScaledRSSI:(float)a4
{
  [(NSRecursiveLock *)self->_lock lock];
  if ([(SBWiFiManager *)self _cachedIsAssociated])
  {
    int v7 = (int)fminf(fmaxf(ceilf(a4 * 3.0), 1.0), 3.0);
  }
  else
  {
    a3 = 0;
    int v7 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__SBWiFiManager__updateSignalStrengthFromRawRSSI_andScaledRSSI___block_invoke;
  v8[3] = &unk_1E6AF4A70;
  v8[4] = self;
  int v9 = v7;
  int v10 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)_cachedIsAssociated
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_currentNetworkHasBeenSet)
  {
    self->_currentNetworkHasBeenSet = 1;
    [(SBWiFiManager *)self _updateCurrentNetwork];
  }
  BOOL v3 = self->_currentNetwork != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

void __64__SBWiFiManager__updateSignalStrengthFromRawRSSI_andScaledRSSI___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v2 + 80) == v3 && (int v4 = *(_DWORD *)(a1 + 44), *(_DWORD *)(v2 + 84) == v4))
  {
    int v5 = *(unsigned __int8 *)(v2 + 88);
    *(_DWORD *)(v2 + 84) = v4;
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    if (v5) {
      return;
    }
  }
  else
  {
    *(_DWORD *)(v2 + 80) = v3;
    *(_DWORD *)(*(void *)(a1 + 32) + 84) = *(_DWORD *)(a1 + 44);
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  }
  v6 = SBLogStatusBarish();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(a1 + 40);
    v9[0] = 67240192;
    v9[1] = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] signal strength bars changed to %{public}d", (uint8_t *)v9, 8u);
  }

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"SBWifiSignalStrengthChangedNotification" object:0 userInfo:0];
}

- (int)signalStrengthBars
{
  if (!self->_mainThread_signalStrengthHasBeenSet)
  {
    int v3 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__SBWiFiManager_signalStrengthBars__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(v3, block);
  }
  return self->_mainThread_signalStrengthBars;
}

- (BOOL)isAssociatedToIOSHotspot
{
  if (!self->_currentNetworkIsIOSHotspotHasBeenSet)
  {
    self->_currentNetworkIsIOSHotspotHasBeenSet = 1;
    int v3 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SBWiFiManager_isAssociatedToIOSHotspot__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(v3, block);
  }
  return self->_currentNetworkIsIOSHotspot;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_53);
  }
  uint64_t v2 = (void *)sharedInstance___sharedInstance_2;
  return v2;
}

uint64_t __31__SBWiFiManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBWiFiManager);
  v1 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBWiFiManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBWiFiManager;
  uint64_t v2 = [(SBWiFiManager *)&v6 init];
  if (v2)
  {
    int v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v2->_lock;
    v2->_lock = v3;

    [(NSRecursiveLock *)v2->_lock lock];
    [(SBWiFiManager *)v2 _lock_manager];
    [(NSRecursiveLock *)v2->_lock unlock];
  }
  return v2;
}

- (void)_updateDevicePresence
{
  int v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBWiFiManager__updateDevicePresence__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __38__SBWiFiManager__updateDevicePresence__block_invoke(uint64_t a1)
{
  uint64_t v2 = WiFiManagerClientCreate();
  if (v2)
  {
    int v3 = (const void *)v2;
    int v4 = (void *)WiFiManagerClientCopyDevices();
    BOOL v5 = [v4 count] != 0;
    CFRelease(v3);
  }
  else
  {
    BOOL v5 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SBWiFiManager__updateDevicePresence__block_invoke_2;
  v6[3] = &unk_1E6AF5D38;
  BOOL v7 = v5;
  v6[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __38__SBWiFiManager__updateDevicePresence__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 48))
  {
    *(unsigned char *)(v2 + 48) = v1;
    int v4 = SBLogStatusBarish();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 48)) {
        BOOL v5 = @"PRESENT";
      }
      else {
        BOOL v5 = @"NOT PRESENT";
      }
      int v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] WiFi device is: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:*MEMORY[0x1E4FA7AF8] object:0];
  }
}

- (void)_lock_setWiFiDevice:(__WiFiDeviceClient *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    device = self->_device;
    if (device)
    {
      if (CFEqual(a3, device)) {
        goto LABEL_12;
      }
      if (self->_device)
      {
        objc_super v6 = SBLogStatusBarish();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = self->_device;
          int v11 = 138543618;
          v12 = v7;
          __int16 v13 = 2114;
          v14 = a3;
          _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _setWiFiDevice: unexpected device change from '%{public}@' -> '%{public}@'", (uint8_t *)&v11, 0x16u);
        }

        if (self->_device)
        {
          WiFiDeviceClientRegisterPowerCallback();
          WiFiDeviceClientRegisterExtendedLinkCallback();
          WiFiDeviceClientRegisterLQMCallback();
          CFRelease(self->_device);
          self->_device = 0;
        }
      }
    }
    deviceInterfaceName = self->_deviceInterfaceName;
    if (deviceInterfaceName)
    {
      self->_deviceInterfaceName = 0;
    }
    self->_device = (__WiFiDeviceClient *)CFRetain(a3);
    WiFiDeviceClientRegisterPowerCallback();
    WiFiDeviceClientRegisterExtendedLinkCallback();
    WiFiDeviceClientRegisterLQMCallback();
    WiFiDeviceClientGetInterfaceName();
    uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_deviceInterfaceName;
    self->_deviceInterfaceName = v9;

    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_23_0);
    [(SBWiFiManager *)self _powerStateDidChange];
    [(SBWiFiManager *)self _linkDidChange];
  }
LABEL_12:
  [(SBWiFiManager *)self _updateDevicePresence];
}

void __37__SBWiFiManager__lock_setWiFiDevice___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4FA7AF0] object:0];
}

- (__WiFiManagerClient)_lock_manager
{
  result = self->_manager;
  if (!result)
  {
    if (MobileWiFiContainsRadio())
    {
      result = (__WiFiManagerClient *)WiFiManagerClientCreate();
      self->_manager = result;
      if (!result) {
        return result;
      }
    }
    else
    {
      result = self->_manager;
      if (!result) {
        return result;
      }
    }
    [(SBWiFiManager *)self _lock_spawnManagerCallbackThread];
    WiFiManagerClientScheduleWithRunLoop();
    CFRunLoopWakeUp(self->_callbackRunLoop);
    WiFiManagerClientRegisterServerRestartCallback();
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    [(SBWiFiManager *)self _updateWiFiDevice];
    int v4 = [MEMORY[0x1E4F38C38] sharedSystemPathMonitor];
    systemPathMonitor = self->_systemPathMonitor;
    self->_systemPathMonitor = v4;

    [(NWSystemPathMonitor *)self->_systemPathMonitor addObserver:self forKeyPath:@"wifiPrimary" options:5 context:&self->_isPrimaryInterface];
    return self->_manager;
  }
  return result;
}

- (void)_lock_spawnManagerCallbackThread
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__runManagerCallbackThread object:0];
  int v3 = [MEMORY[0x1E4F29060] mainThread];
  objc_msgSend(v4, "setQualityOfService:", objc_msgSend(v3, "qualityOfService"));

  [v4 start];
  [(SBWiFiManager *)self performSelector:sel_class onThread:v4 withObject:0 waitUntilDone:1];
}

- (void)_runManagerCallbackThread
{
  int v3 = (void *)MEMORY[0x1D948C4D0](self, a2);
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  [v4 setName:@"SBWiFiManager callback thread"];

  CFRunLoopRef Current = CFRunLoopGetCurrent();
  self->_callbackRunLoop = (__CFRunLoop *)CFRetain(Current);
  objc_super v6 = [MEMORY[0x1E4F1CA30] port];
  int v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v6 scheduleInRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

  id v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v8 run];
}

- (void)_updateWiFiState
{
  [(NSRecursiveLock *)self->_lock lock];
  [(SBWiFiManager *)self _updateCurrentNetwork];
  if (self->_poweredHasBeenSet) {
    [(SBWiFiManager *)self _updateSignalStrength];
  }
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_powerStateDidChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  BOOL powered = self->_powered;
  if (self->_device) {
    BOOL v4 = WiFiDeviceClientGetPower() != 0;
  }
  else {
    BOOL v4 = 0;
  }
  self->_BOOL powered = v4;
  self->_poweredHasBeenSet = 1;
  [(SBWiFiManager *)self _updateWiFiState];
  [(NSRecursiveLock *)self->_lock unlock];
  BOOL v5 = SBLogStatusBarish();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = powered;
    __int16 v7 = 1024;
    BOOL v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _powerStateDidChange from %d to %d", (uint8_t *)v6, 0xEu);
  }

  [(SBWiFiManager *)self _updateDevicePresence];
  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_39_1);
}

void __37__SBWiFiManager__powerStateDidChange__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4FA7B00] object:0];
}

- (void)_linkDidChange
{
  int v3 = SBLogStatusBarish();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _linkDidChange", v5, 2u);
  }

  BOOL v4 = MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_41_0);
  [(SBWiFiManager *)self _updateWiFiState];
  dispatch_async(v4, &__block_literal_global_43_0);
}

void __31__SBWiFiManager__linkDidChange__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBWifiManagerLinkWillChangeNotification" object:0];
}

void __31__SBWiFiManager__linkDidChange__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBWifiManagerLinkDidChangeNotification" object:0];
}

- (void)_updateCurrentNetwork
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  [(SBWiFiManager *)self _lock_manager];
  if (!self->_device)
  {
    uint64_t v9 = SBLogStatusBarish();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: no _device to query current network - assuming nil", buf, 2u);
    }

    goto LABEL_12;
  }
  int v3 = (__WiFiNetwork *)WiFiDeviceClientCopyCurrentNetwork();
  BOOL v4 = SBLogStatusBarish();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: WiFiDeviceClientCopyCurrentNetwork: %{public}@", buf, 0xCu);
  }

  if (!v3)
  {
LABEL_12:
    p_currentNetwork = &self->_currentNetwork;
    currentNetwork = self->_currentNetwork;
    if (!currentNetwork) {
      goto LABEL_31;
    }
    int v3 = 0;
    char v8 = 1;
    goto LABEL_14;
  }
  p_currentNetwork = &self->_currentNetwork;
  BOOL v5 = self->_currentNetwork;
  if (!v5) {
    goto LABEL_20;
  }
  if (CFEqual(v3, v5))
  {
LABEL_30:
    CFRelease(v3);
    goto LABEL_31;
  }
  currentNetwork = *p_currentNetwork;
  if (!*p_currentNetwork)
  {
LABEL_20:
    previousNetwork = self->_previousNetwork;
    if (previousNetwork)
    {
      CFRelease(previousNetwork);
      self->_previousNetwork = 0;
    }
    goto LABEL_22;
  }
  char v8 = 0;
LABEL_14:
  uint64_t v10 = self->_previousNetwork;
  if (v10)
  {
    CFRelease(v10);
    currentNetwork = *p_currentNetwork;
  }
  self->_currentNetwork = 0;
  self->_previousNetwork = currentNetwork;
  int v11 = SBLogStatusBarish();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: setting _previousNetwork = _currentNetwork, _currentNetwork = nil", buf, 2u);
  }

  if (v8)
  {
    char v12 = 1;
    goto LABEL_25;
  }
LABEL_22:
  SSID = (__WiFiNetwork *)CFRetain(v3);
  self->_currentNetwork = SSID;
  if (self->_isPrimaryInterface)
  {
    if (!self->_isPrimaryInterfaceChanging)
    {
      if ([(SBWiFiManager *)self isPrimaryInterface])
      {
        v22 = SBLogStatusBarish();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _primaryInterfaceUpdateTimeout: all is good but need to fire a notification that primary may have changed", buf, 2u);
        }

        dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_46);
        primaryInterfaceUpdateTimeoutSource = self->_primaryInterfaceUpdateTimeoutSource;
        if (primaryInterfaceUpdateTimeoutSource)
        {
          dispatch_source_cancel(primaryInterfaceUpdateTimeoutSource);
          v24 = self->_primaryInterfaceUpdateTimeoutSource;
          self->_primaryInterfaceUpdateTimeoutSource = 0;
        }
      }
      else if (!self->_primaryInterfaceUpdateTimeoutSource)
      {
        v25 = SBLogStatusBarish();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _primaryInterfaceUpdateTimeout: wifi is primary but the current network is not - scheduling a timer", buf, 2u);
        }

        v26 = dispatch_get_global_queue(0, 0);
        v27 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v26);
        v28 = self->_primaryInterfaceUpdateTimeoutSource;
        self->_primaryInterfaceUpdateTimeoutSource = v27;

        v29 = self->_primaryInterfaceUpdateTimeoutSource;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __38__SBWiFiManager__updateCurrentNetwork__block_invoke;
        handler[3] = &unk_1E6AF4AC0;
        handler[4] = self;
        dispatch_source_set_event_handler(v29, handler);
        v30 = self->_primaryInterfaceUpdateTimeoutSource;
        dispatch_time_t v31 = dispatch_time(0, 5000000000);
        dispatch_source_set_timer(v30, v31, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        dispatch_resume((dispatch_object_t)self->_primaryInterfaceUpdateTimeoutSource);
      }
    }
    char v12 = 0;
LABEL_25:
    SSID = *p_currentNetwork;
    if (!*p_currentNetwork) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  char v12 = 0;
  if (SSID) {
LABEL_26:
  }
    SSID = (__WiFiNetwork *)WiFiNetworkGetSSID();
LABEL_27:
  uint64_t v15 = SSID;
  v16 = SBLogStatusBarish();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v15;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: network change -> '%{public}@'", buf, 0xCu);
  }

  if ((v12 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_31:
  self->_currentNetworkHasBeenSet = 1;
  v17 = SBLogStatusBarish();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_currentNetwork;
    v19 = self->_previousNetwork;
    BOOL isPrimaryInterface = self->_isPrimaryInterface;
    *(_DWORD *)buf = 138543874;
    v36 = v18;
    __int16 v37 = 2114;
    v38 = v19;
    __int16 v39 = 1026;
    BOOL v40 = isPrimaryInterface;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: current network has been set... _currentNetwork: %{public}@, _previousNetwork: %{public}@, _isPrimaryInterface: %{public}d", buf, 0x1Cu);
  }

  if (self->_currentNetwork) {
    BOOL v21 = WiFiNetworkIsApplePersonalHotspot() != 0;
  }
  else {
    BOOL v21 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBWiFiManager__updateCurrentNetwork__block_invoke_47;
  block[3] = &unk_1E6AF5D38;
  block[4] = self;
  BOOL v33 = v21;
  dispatch_async(MEMORY[0x1E4F14428], block);
  [(NSRecursiveLock *)self->_lock unlock];
}

uint64_t __38__SBWiFiManager__updateCurrentNetwork__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[121] && ([v2 isPrimaryInterface] & 1) == 0)
  {
    int v3 = SBLogStatusBarish();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _primaryInterfaceUpdateTimeout: didn't receive a systemPathMonitor update - assuming the new network is primary", v5, 2u);
    }

    [*(id *)(a1 + 32) _primaryInterfaceChanged:*(unsigned __int8 *)(*(void *)(a1 + 32) + 121)];
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) unlock];
}

void __38__SBWiFiManager__updateCurrentNetwork__block_invoke_44()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBWifiManagerPrimaryInterfaceMayHaveChangedNotification" object:0];
}

void __38__SBWiFiManager__updateCurrentNetwork__block_invoke_47(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(v1 + 73);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  *(unsigned char *)(v1 + 74) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = *(unsigned char *)(a1 + 40);
  if (v2 != v3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"SBWifiManagerLinkHotSpotnessDidChangeNotification" object:0];
  }
}

uint64_t __41__SBWiFiManager_isAssociatedToIOSHotspot__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentNetwork];
}

- (id)currentNetworkName
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_currentNetwork) {
    int v3 = (void *)[(id)WiFiNetworkGetSSID() copy];
  }
  else {
    int v3 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (BOOL)isPowered
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_poweredHasBeenSet)
  {
    [(SBWiFiManager *)self _linkDidChange];
    self->_poweredHasBeenSet = 1;
  }
  BOOL powered = self->_powered;
  [(NSRecursiveLock *)self->_lock unlock];
  return powered;
}

- (void)setPowered:(BOOL)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_poweredHasBeenSet)
  {
    [(SBWiFiManager *)self _linkDidChange];
    self->_poweredHasBeenSet = 1;
  }
  if ([(SBWiFiManager *)self _lock_manager]) {
    WiFiManagerClientSetPower();
  }
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)wiFiEnabled
{
  [(NSRecursiveLock *)self->_lock lock];
  if ([(SBWiFiManager *)self _lock_manager])
  {
    int v3 = (void *)WiFiManagerClientCopyProperty();
    char v4 = [v3 BOOLValue];
    if (v3) {
      CFRelease(v3);
    }
  }
  else
  {
    char v4 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v4;
}

- (void)setWiFiEnabled:(BOOL)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  if ([(SBWiFiManager *)self _lock_manager]) {
    WiFiManagerClientSetProperty();
  }
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

uint64_t __35__SBWiFiManager_signalStrengthBars__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSignalStrength];
}

- (int)signalStrengthRSSI
{
  if (!self->_mainThread_signalStrengthHasBeenSet)
  {
    int v3 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__SBWiFiManager_signalStrengthRSSI__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(v3, block);
  }
  return self->_mainThread_signalStrengthRSSI;
}

uint64_t __35__SBWiFiManager_signalStrengthRSSI__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSignalStrength];
}

- (void)_updateSignalStrength
{
  currentNetwork = self->_currentNetwork;
  BOOL v4 = currentNetwork != 0;
  [(NSRecursiveLock *)self->_lock lock];
  if ([(SBWiFiManager *)self _cachedIsAssociated] && self->_device)
  {
    objc_super v6 = (void *)WiFiDeviceClientCopyProperty();
    __int16 v7 = v6;
    if (v6)
    {
      [v6 floatValue];
      int v9 = v8;
    }
    else
    {
      BOOL v4 = 0;
      int v9 = 0;
    }
    char v12 = (void *)WiFiDeviceClientCopyProperty();

    if (!v12) {
      goto LABEL_8;
    }
    __int16 v13 = [v12 objectForKey:@"RSSI_CTL_AGR"];
    uint64_t v10 = [v13 intValue];

    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    if (!currentNetwork) {
      goto LABEL_8;
    }
    uint64_t v10 = 0;
    int v9 = 0;
  }
  LODWORD(v5) = v9;
  [(SBWiFiManager *)self _updateSignalStrengthFromRawRSSI:v10 andScaledRSSI:v5];
LABEL_8:
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)isPrimaryInterface
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_primaryInterfaceHasBeenSet)
  {
    systemPathMonitor = self->_systemPathMonitor;
    if (systemPathMonitor)
    {
      self->_primaryInterfaceHasBeenSet = 1;
      [(SBWiFiManager *)self _primaryInterfaceChanged:[(NWSystemPathMonitor *)systemPathMonitor isWiFiPrimary]];
    }
  }
  currentNetwork = self->_currentNetwork;
  BOOL v6 = currentNetwork
    && (primaryInterface = self->_primaryInterface) != 0
    && CFEqual(currentNetwork, primaryInterface) != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v6;
}

- (__CFRunLoop)wifiRunLoopRef
{
  [(NSRecursiveLock *)self->_lock lock];
  [(SBWiFiManager *)self _lock_manager];
  callbackRunLoop = self->_callbackRunLoop;
  [(NSRecursiveLock *)self->_lock unlock];
  return callbackRunLoop;
}

- (id)_wifiInterface
{
  [(NSRecursiveLock *)self->_lock lock];
  int v3 = self->_deviceInterfaceName;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (void)_primaryInterfaceChanged:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL isPrimaryInterface = v3;
  self->_isPrimaryInterfaceChanging = 1;
  [(SBWiFiManager *)self _updateCurrentNetwork];
  primaryInterface = self->_primaryInterface;
  if (primaryInterface) {
    CFRelease(primaryInterface);
  }
  if (!v3)
  {
    self->_primaryInterface = 0;
    __int16 v7 = SBLogStatusBarish();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    LOWORD(v13) = 0;
    int v8 = "[SBWiFiManager] _primaryInterfaceChanged: wifi is no longer primary";
    int v9 = (uint8_t *)&v13;
    goto LABEL_9;
  }
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    self->_primaryInterface = (__WiFiNetwork *)CFRetain(currentNetwork);
    __int16 v7 = SBLogStatusBarish();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v16 = 0;
    int v8 = "[SBWiFiManager] _primaryInterfaceChanged: marking current network as primary";
    int v9 = (uint8_t *)&v16;
    goto LABEL_9;
  }
  previousNetwork = self->_previousNetwork;
  if (previousNetwork)
  {
    self->_primaryInterface = (__WiFiNetwork *)CFRetain(previousNetwork);
    __int16 v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      int v8 = "[SBWiFiManager] _primaryInterfaceChanged: current network is nil, marking previous network as primary";
      int v9 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    self->_primaryInterface = 0;
    __int16 v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      int v8 = "[SBWiFiManager] _primaryInterfaceChanged: primary is wifi but no networks known - marking as not primary";
      int v9 = (uint8_t *)&v14;
      goto LABEL_9;
    }
  }
LABEL_10:

  self->_isPrimaryInterfaceChanging = 0;
  if (self->_primaryInterfaceHasBeenSet) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_58_0);
  }
  primaryInterfaceUpdateTimeoutSource = self->_primaryInterfaceUpdateTimeoutSource;
  if (primaryInterfaceUpdateTimeoutSource)
  {
    dispatch_source_cancel(primaryInterfaceUpdateTimeoutSource);
    int v11 = self->_primaryInterfaceUpdateTimeoutSource;
    self->_primaryInterfaceUpdateTimeoutSource = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

void __42__SBWiFiManager__primaryInterfaceChanged___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBWifiManagerPrimaryInterfaceMayHaveChangedNotification" object:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (&self->_isPrimaryInterface != a6)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBWiFiManager.m", 660, @"SBWiFiManager: got a key/value callback that it doesn't understand -> %@", v11 object file lineNumber description];
  }
  __int16 v14 = [v13 objectForKey:*MEMORY[0x1E4F284C8]];
  char v15 = [v14 BOOLValue];

  callbackRunLoop = self->_callbackRunLoop;
  if (!callbackRunLoop)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBWiFiManager.m" lineNumber:663 description:@"SBWiFiManager: shouldn't be possible to get a key/value callback before the runloop has been started"];

    callbackRunLoop = self->_callbackRunLoop;
  }
  v17 = (const void *)*MEMORY[0x1E4F1D418];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBWiFiManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6AF5D38;
  block[4] = self;
  char v21 = v15;
  CFRunLoopPerformBlock(callbackRunLoop, v17, block);
  CFRunLoopWakeUp(self->_callbackRunLoop);
}

uint64_t __64__SBWiFiManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
  [*(id *)(a1 + 32) _primaryInterfaceChanged:*(unsigned __int8 *)(a1 + 40)];
  int v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 unlock];
}

- (void)_updateWiFiDevice
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "[SBWiFiManager] ERROR: WiFi device not found, no WiFi untill a device is attached", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryInterfaceUpdateTimeoutSource, 0);
  objc_storeStrong((id *)&self->_systemPathMonitor, 0);
  objc_storeStrong((id *)&self->_deviceInterfaceName, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end