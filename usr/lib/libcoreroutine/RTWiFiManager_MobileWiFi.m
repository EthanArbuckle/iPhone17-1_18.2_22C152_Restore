@interface RTWiFiManager_MobileWiFi
+ (id)activeScanRequest;
+ (id)cacheScanRequest;
+ (id)defaultScanRequest;
+ (id)scanRequestWithType:(int64_t)a3 dwellTime:(int64_t)a4 channels:(id)a5 lowPriority:(BOOL)a6 merge:(BOOL)a7;
- (NSArray)devices;
- (NSMutableDictionary)accessPointForInterface;
- (__WiFiManagerClient)wifiManager;
- (void)_cancelScan;
- (void)_destroyConnectionToWiFiManager;
- (void)_establishConnectionToWiFiManager;
- (void)_handleScanResultsCallback:(id)a3 attemptCacheFallback:(BOOL)a4 error:(int)a5;
- (void)_handleWiFiDeviceClientExtendedLinkCallback:(__WiFiDeviceClient *)a3 eventData:(id)a4;
- (void)_handleWiFiDeviceClientPowerCallback:(__WiFiDeviceClient *)a3;
- (void)_pollAccessPoints;
- (void)_pollManagerPowerStatus;
- (void)_scheduleActiveScan;
- (void)_scheduleScan;
- (void)_scheduleScanWithCache;
- (void)_scheduleScanWithChannels:(id)a3;
- (void)_setRegisteredForExtendedLinkCallbacks:(BOOL)a3;
- (void)_setRegisteredForPowerCallbacks:(BOOL)a3;
- (void)_setRegisteredForScanUpdateCallbacks:(BOOL)a3;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)handleWiFiDeviceClientCacheScanCallback:(__WiFiDeviceClient *)a3 scanResults:(id)a4 error:(int)a5;
- (void)handleWiFiDeviceClientExtendedLinkCallback:(__WiFiDeviceClient *)a3 eventData:(id)a4;
- (void)handleWiFiDeviceClientPowerCallback:(__WiFiDeviceClient *)a3;
- (void)handleWiFiDeviceClientScanCallback:(__WiFiDeviceClient *)a3 scanResults:(id)a4 error:(int)a5;
- (void)handleWiFiDeviceClientScanUpdateCallback:(__WiFiDeviceClient *)a3 scanRequest:(id)a4 scanResults:(id)a5 error:(int)a6;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)setAccessPointForInterface:(id)a3;
- (void)setDevices:(id)a3;
- (void)setWifiManager:(__WiFiManagerClient *)a3;
@end

@implementation RTWiFiManager_MobileWiFi

- (void)_setup
{
  v3 = objc_opt_new();
  [(RTWiFiManager_MobileWiFi *)self setAccessPointForInterface:v3];

  [(RTWiFiManager_MobileWiFi *)self _establishConnectionToWiFiManager];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(RTWiFiManager_MobileWiFi *)self _destroyConnectionToWiFiManager];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    v4 = v5;
  }
}

- (void)_scheduleScan
{
  v3 = [(RTWiFiManager_MobileWiFi *)self devices];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(id)objc_opt_class() defaultScanRequest];
    v6 = [(RTWiFiManager_MobileWiFi *)self devices];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__RTWiFiManager_MobileWiFi__scheduleScan__block_invoke;
    v8[3] = &unk_1E6B90A68;
    id v9 = v5;
    v10 = self;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v8];
  }
}

- (void)_scheduleScanWithCache
{
  v3 = [(RTWiFiManager_MobileWiFi *)self devices];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(id)objc_opt_class() cacheScanRequest];
    v6 = [(RTWiFiManager_MobileWiFi *)self devices];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__RTWiFiManager_MobileWiFi__scheduleScanWithCache__block_invoke;
    v8[3] = &unk_1E6B90A68;
    id v9 = v5;
    v10 = self;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v8];
  }
}

- (void)_scheduleActiveScan
{
  v3 = [(RTWiFiManager_MobileWiFi *)self devices];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(id)objc_opt_class() activeScanRequest];
    v6 = [(RTWiFiManager_MobileWiFi *)self devices];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__RTWiFiManager_MobileWiFi__scheduleActiveScan__block_invoke;
    v8[3] = &unk_1E6B90A68;
    id v9 = v5;
    v10 = self;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v8];
  }
}

- (void)_scheduleScanWithChannels:(id)a3
{
  id v4 = a3;
  id v5 = [(RTWiFiManager_MobileWiFi *)self devices];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(id)objc_opt_class() scanRequestWithType:2 dwellTime:110 channels:v4 lowPriority:1 merge:1];
    v8 = [(RTWiFiManager_MobileWiFi *)self devices];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__RTWiFiManager_MobileWiFi__scheduleScanWithChannels___block_invoke;
    v10[3] = &unk_1E6B90A68;
    id v11 = v7;
    v12 = self;
    id v9 = v7;
    [v8 enumerateObjectsUsingBlock:v10];
  }
}

- (void)_cancelScan
{
  id v2 = [(RTWiFiManager_MobileWiFi *)self devices];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_95];
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)RTWiFiManager_MobileWiFi;
  [(RTWiFiManager *)&v9 internalAddObserver:a3 name:v6];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8 && [(RTNotifier *)self getNumberOfObservers:v6] == 1) {
    [(RTWiFiManager_MobileWiFi *)self _setRegisteredForScanUpdateCallbacks:1];
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)RTWiFiManager_MobileWiFi;
  [(RTWiFiManager *)&v9 internalRemoveObserver:a3 name:v6];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8 && ![(RTNotifier *)self getNumberOfObservers:v6]) {
    [(RTWiFiManager_MobileWiFi *)self _setRegisteredForScanUpdateCallbacks:0];
  }
}

- (void)_establishConnectionToWiFiManager
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(RTWiFiManager_MobileWiFi *)self _destroyConnectionToWiFiManager];
  [(RTWiFiManager_MobileWiFi *)self setWifiManager:WiFiManagerClientCreate()];
  if ([(RTWiFiManager_MobileWiFi *)self wifiManager])
  {
    [(RTWiFiManager_MobileWiFi *)self wifiManager];
    v3 = (void *)WiFiManagerClientCopyDevices();
    [(RTWiFiManager_MobileWiFi *)self setDevices:v3];

    [(RTWiFiManager_MobileWiFi *)self _setRegisteredForExtendedLinkCallbacks:1];
    [(RTWiFiManager_MobileWiFi *)self _setRegisteredForPowerCallbacks:1];
    [(RTWiFiManager_MobileWiFi *)self wifiManager];
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [(RTWiFiManager_MobileWiFi *)self devices];
      int v6 = 134217984;
      uint64_t v7 = [v5 count];
      _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "created WiFiManagerClient with %lu devices", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_destroyConnectionToWiFiManager
{
  v3 = [(RTWiFiManager_MobileWiFi *)self devices];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(RTWiFiManager_MobileWiFi *)self _setRegisteredForPowerCallbacks:0];
    [(RTWiFiManager_MobileWiFi *)self _setRegisteredForExtendedLinkCallbacks:0];
  }
  [(RTWiFiManager_MobileWiFi *)self setDevices:0];
  if ([(RTWiFiManager_MobileWiFi *)self wifiManager])
  {
    [(RTWiFiManager_MobileWiFi *)self _setRegisteredForScanUpdateCallbacks:0];
    [(RTWiFiManager_MobileWiFi *)self wifiManager];
    CFRunLoopGetMain();
    id v5 = (const void *)*MEMORY[0x1E4F1D410];
    WiFiManagerClientUnscheduleFromRunLoop();
    int v6 = [(RTWiFiManager_MobileWiFi *)self wifiManager];
    [(RTWiFiManager_MobileWiFi *)self setWifiManager:0];
    Main = CFRunLoopGetMain();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__RTWiFiManager_MobileWiFi__destroyConnectionToWiFiManager__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v6;
    CFRunLoopPerformBlock(Main, v5, block);
  }
}

- (void)_setRegisteredForExtendedLinkCallbacks:(BOOL)a3
{
  if (a3) {
    [(RTWiFiManager_MobileWiFi *)self _pollAccessPoints];
  }
  id v5 = [(RTWiFiManager_MobileWiFi *)self devices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__RTWiFiManager_MobileWiFi__setRegisteredForExtendedLinkCallbacks___block_invoke;
  v6[3] = &unk_1E6B9A5D0;
  BOOL v7 = a3;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];

  if (!a3) {
    [(RTWiFiManager *)self setAccessPoints:0];
  }
}

- (void)_setRegisteredForPowerCallbacks:(BOOL)a3
{
  if (a3) {
    [(RTWiFiManager_MobileWiFi *)self _pollManagerPowerStatus];
  }
  id v5 = [(RTWiFiManager_MobileWiFi *)self devices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__RTWiFiManager_MobileWiFi__setRegisteredForPowerCallbacks___block_invoke;
  v6[3] = &unk_1E6B9A5D0;
  BOOL v7 = a3;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];

  if (!a3) {
    [(RTWiFiManager *)self setPowerStatus:0];
  }
}

- (void)_setRegisteredForScanUpdateCallbacks:(BOOL)a3
{
  id v5 = [(RTWiFiManager_MobileWiFi *)self devices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__RTWiFiManager_MobileWiFi__setRegisteredForScanUpdateCallbacks___block_invoke;
  v6[3] = &unk_1E6B9A5D0;
  BOOL v7 = a3;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (void)handleWiFiDeviceClientPowerCallback:(__WiFiDeviceClient *)a3
{
  id v5 = [(RTNotifier *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientPowerCallback___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)_handleWiFiDeviceClientPowerCallback:(__WiFiDeviceClient *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int Power = WiFiDeviceClientGetPower();
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (Power) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
      uint64_t InterfaceName = WiFiDeviceClientGetInterfaceName();
      uint64_t v8 = +[RTWiFiManager powerStatusToString:v6];
      int v9 = 138412546;
      uint64_t v10 = InterfaceName;
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "power status for device, %@, changed to, %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [(RTWiFiManager_MobileWiFi *)self _pollManagerPowerStatus];
}

- (void)_pollManagerPowerStatus
{
  [(RTWiFiManager_MobileWiFi *)self wifiManager];
  if (WiFiManagerClientGetPower()) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }

  [(RTWiFiManager *)self setPowerStatus:v3];
}

- (void)handleWiFiDeviceClientExtendedLinkCallback:(__WiFiDeviceClient *)a3 eventData:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientExtendedLinkCallback_eventData___block_invoke;
  block[3] = &unk_1E6B91220;
  id v10 = v6;
  __int16 v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_handleWiFiDeviceClientExtendedLinkCallback:(__WiFiDeviceClient *)a3 eventData:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  WiFiDeviceClientGetInterfaceName();
  BOOL v7 = (__WiFiDeviceClient *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"LINK_CHANGED_NETWORK"];

    int v9 = [objc_alloc(MEMORY[0x1E4F5CFD0]) initWithWiFiNetwork:v8];
    id v10 = [(RTWiFiManager_MobileWiFi *)self accessPointForInterface];
    [v10 setObject:v9 forKeyedSubscript:v7];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      __int16 v11 = [v6 objectForKeyedSubscript:@"LINK_CHANGED_IS_LINKDOWN"];
      int v12 = [v11 BOOLValue];
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        if (v12) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = 2;
        }
        v15 = +[RTWiFiManager linkStatusToString:v14];
        int v18 = 138412802;
        v19 = v7;
        __int16 v20 = 2112;
        v21 = v15;
        __int16 v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "link status for interface, %@, changed to status, %@, ap, %@", (uint8_t *)&v18, 0x20u);
      }
    }
    v16 = [(RTWiFiManager_MobileWiFi *)self accessPointForInterface];
    v17 = [v16 allValues];
    [(RTWiFiManager *)self setAccessPoints:v17];
  }
  else
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134217984;
      v19 = a3;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "no interface name for device, %p", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)_pollAccessPoints
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(RTWiFiManager_MobileWiFi *)self devices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__RTWiFiManager_MobileWiFi__pollAccessPoints__block_invoke;
  v6[3] = &unk_1E6B90B78;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];

  [(RTWiFiManager *)self setAccessPoints:v5];
}

- (void)handleWiFiDeviceClientScanUpdateCallback:(__WiFiDeviceClient *)a3 scanRequest:(id)a4 scanResults:(id)a5 error:(int)a6
{
  id v8 = a5;
  int v9 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientScanUpdateCallback_scanRequest_scanResults_error___block_invoke;
  block[3] = &unk_1E6B9A5F8;
  block[4] = self;
  id v12 = v8;
  int v13 = a6;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)handleWiFiDeviceClientScanCallback:(__WiFiDeviceClient *)a3 scanResults:(id)a4 error:(int)a5
{
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientScanCallback_scanResults_error___block_invoke;
  block[3] = &unk_1E6B9A5F8;
  block[4] = self;
  id v11 = v7;
  int v12 = a5;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)handleWiFiDeviceClientCacheScanCallback:(__WiFiDeviceClient *)a3 scanResults:(id)a4 error:(int)a5
{
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientCacheScanCallback_scanResults_error___block_invoke;
  block[3] = &unk_1E6B9A5F8;
  block[4] = self;
  id v11 = v7;
  int v12 = a5;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)_handleScanResultsCallback:(id)a3 attemptCacheFallback:(BOOL)a4 error:(int)a5
{
  BOOL v6 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  id v10 = [v8 arrayWithCapacity:[v9 count]];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__RTWiFiManager_MobileWiFi__handleScanResultsCallback_attemptCacheFallback_error___block_invoke;
  v13[3] = &unk_1E6B90B78;
  id v11 = v10;
  id v14 = v11;
  [v9 enumerateObjectsUsingBlock:v13];

  if (!a5 || (![v11 count] ? (BOOL v12 = !v6) : (BOOL v12 = 1), v12)) {
    [(RTWiFiManager *)self _notifyScanResults:v11];
  }
  else {
    [(RTWiFiManager_MobileWiFi *)self _scheduleScanWithCache];
  }
}

+ (id)cacheScanRequest
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SCAN_MAXAGE";
  v4[1] = @"SCAN_MERGE";
  v5[0] = &unk_1F3451CC8;
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[2] = @"SCAN_TYPE";
  v4[3] = @"SCAN_DWELL_TIME";
  v5[2] = &unk_1F3451CE0;
  v5[3] = &unk_1F3451CF8;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];

  return v2;
}

+ (id)defaultScanRequest
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SCAN_MERGE";
  v4[1] = @"SCAN_TYPE";
  v5[0] = MEMORY[0x1E4F1CC38];
  v5[1] = &unk_1F3451CE0;
  v4[2] = @"SCAN_DWELL_TIME";
  v5[2] = &unk_1F3451CF8;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

+ (id)activeScanRequest
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SCAN_MERGE";
  v4[1] = @"SCAN_TYPE";
  v5[0] = MEMORY[0x1E4F1CC38];
  v5[1] = &unk_1F3451D10;
  v4[2] = @"SCAN_DWELL_TIME";
  v5[2] = &unk_1F3451CF8;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

+ (id)scanRequestWithType:(int64_t)a3 dwellTime:(int64_t)a4 channels:(id)a5 lowPriority:(BOOL)a6 merge:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a5;
  BOOL v12 = objc_opt_new();
  int v13 = [NSNumber numberWithBool:v7];
  [v12 setObject:v13 forKeyedSubscript:@"SCAN_MERGE"];

  id v14 = [NSNumber numberWithInteger:a3];
  [v12 setObject:v14 forKeyedSubscript:@"SCAN_TYPE"];

  v15 = [NSNumber numberWithInteger:a4];
  [v12 setObject:v15 forKeyedSubscript:@"SCAN_DWELL_TIME"];

  v16 = [NSNumber numberWithBool:v8];
  [v12 setObject:v16 forKeyedSubscript:@"SCAN_LOW_PRIORITY"];

  if ([v11 count])
  {
    v17 = objc_opt_new();
    [v12 setObject:v17 forKeyedSubscript:@"SCAN_CHANNELS"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__RTWiFiManager_MobileWiFi_scanRequestWithType_dwellTime_channels_lowPriority_merge___block_invoke;
    v20[3] = &unk_1E6B9A620;
    id v21 = v17;
    id v18 = v17;
    [v11 enumerateObjectsUsingBlock:v20];
  }

  return v12;
}

- (__WiFiManagerClient)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManagerClient *)a3
{
  self->_wifiManager = a3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSMutableDictionary)accessPointForInterface
{
  return self->_accessPointForInterface;
}

- (void)setAccessPointForInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPointForInterface, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end