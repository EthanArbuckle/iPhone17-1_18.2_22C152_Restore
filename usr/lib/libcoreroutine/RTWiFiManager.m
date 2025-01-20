@interface RTWiFiManager
+ (BOOL)supportsNotificationName:(id)a3;
+ (RTWiFiManager)allocWithZone:(_NSZone *)a3;
+ (id)linkStatusToString:(unint64_t)a3;
+ (id)powerStatusToString:(unint64_t)a3;
- (NSArray)accessPoints;
- (RTWiFiManager)init;
- (unint64_t)linkStatus;
- (unint64_t)powerStatus;
- (void)_notifyScanResults:(id)a3;
- (void)cancelScan;
- (void)fetchLinkStatus:(id)a3;
- (void)fetchPowerStatus:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)scheduleActiveScan;
- (void)scheduleScan;
- (void)scheduleScanWithChannels:(id)a3;
- (void)setAccessPoints:(id)a3;
- (void)setPowerStatus:(unint64_t)a3;
@end

@implementation RTWiFiManager

+ (RTWiFiManager)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (RTWiFiManager *)+[RTWiFiManager allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTWiFiManager;
    return (RTWiFiManager *)[super allocWithZone:a3];
  }
}

- (RTWiFiManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTWiFiManager;
  v2 = [(RTNotifier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_linkStatus = 0;
    v2->_powerStatus = 0;
    accessPoints = v2->_accessPoints;
    v2->_accessPoints = 0;

    [(RTService *)v3 setup];
  }
  return v3;
}

- (void)scheduleScan
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__RTWiFiManager_scheduleScan__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __29__RTWiFiManager_scheduleScan__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleScan];
}

- (void)scheduleScanWithChannels:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RTWiFiManager_scheduleScanWithChannels___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __42__RTWiFiManager_scheduleScanWithChannels___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleScanWithChannels:*(void *)(a1 + 40)];
}

- (void)scheduleActiveScan
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RTWiFiManager_scheduleActiveScan__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __35__RTWiFiManager_scheduleActiveScan__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleActiveScan];
}

- (void)cancelScan
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__RTWiFiManager_cancelScan__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __27__RTWiFiManager_cancelScan__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelScan];
}

- (void)fetchPowerStatus:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTWiFiManager fetchPowerStatus:]";
      __int16 v12 = 1024;
      int v13 = 112;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v6 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__RTWiFiManager_fetchPowerStatus___block_invoke;
  v8[3] = &unk_1E6B90D08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __34__RTWiFiManager_fetchPowerStatus___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) powerStatus];
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)fetchLinkStatus:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTWiFiManager fetchLinkStatus:]";
      __int16 v12 = 1024;
      int v13 = 121;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v6 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__RTWiFiManager_fetchLinkStatus___block_invoke;
  v8[3] = &unk_1E6B90D08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __33__RTWiFiManager_fetchLinkStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) linkStatus];
  id v4 = [*(id *)(a1 + 32) accessPoints];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3 = a3;
  id v4 = +[RTNotification notificationName];
  if ([v3 isEqualToString:v4])
  {
    char v5 = 1;
  }
  else
  {
    int v6 = +[RTNotification notificationName];
    if ([v3 isEqualToString:v6])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = +[RTNotification notificationName];
      char v5 = [v3 isEqualToString:v7];
    }
  }

  return v5;
}

- (void)setPowerStatus:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t powerStatus = self->_powerStatus;
  if (powerStatus != a3)
  {
    self->_unint64_t powerStatus = a3;
    char v5 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = +[RTWiFiManager powerStatusToString:powerStatus];
      id v7 = +[RTWiFiManager powerStatusToString:self->_powerStatus];
      int v9 = 138412546;
      v10 = v6;
      __int16 v11 = 2112;
      __int16 v12 = v7;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "power status changed from, %@, to, %@", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v8 = [[RTWiFiManagerNotificationPowerStatusChanged alloc] initWithPowerStatus:self->_powerStatus];
    [(RTNotifier *)self postNotification:v8];
  }
}

- (void)setAccessPoints:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 count];
    unint64_t v8 = 1;
    if (v7) {
      unint64_t v8 = 2;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  unint64_t linkStatus = self->_linkStatus;
  if (v8 != linkStatus)
  {
    self->_unint64_t linkStatus = v8;
    v10 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = +[RTWiFiManager linkStatusToString:linkStatus];
      __int16 v12 = +[RTWiFiManager linkStatusToString:self->_linkStatus];
      int v17 = 138412546;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "link status changed from, %@, to, %@", (uint8_t *)&v17, 0x16u);
    }
  }
  p_accessPoints = &self->_accessPoints;
  objc_storeStrong((id *)&self->_accessPoints, a3);
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityWiFi);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = [(NSArray *)*p_accessPoints componentsJoinedByString:@", "];
    int v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "access points changed to, %@", (uint8_t *)&v17, 0xCu);
  }
  v16 = [[RTWiFiManagerNotificationLinkStatusChanged alloc] initWithLinkStatus:self->_linkStatus accessPoints:*p_accessPoints];
  [(RTNotifier *)self postNotification:v16];
}

- (void)_notifyScanResults:(id)a3
{
  id v4 = a3;
  id v5 = [[RTWiFiManagerNotificationScanResults alloc] initWithScanResults:v4];

  [(RTNotifier *)self postNotification:v5];
}

+ (id)powerStatusToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unexpected Value";
  }
  else {
    return off_1E6B97960[a3];
  }
}

+ (id)linkStatusToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unexpected Value";
  }
  else {
    return off_1E6B97978[a3];
  }
}

- (unint64_t)powerStatus
{
  return self->_powerStatus;
}

- (unint64_t)linkStatus
{
  return self->_linkStatus;
}

- (NSArray)accessPoints
{
  return self->_accessPoints;
}

- (void).cxx_destruct
{
}

uint64_t __41__RTWiFiManager_MobileWiFi__scheduleScan__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F412FE38](a2, *(void *)(a1 + 32), RTWiFiManager_WiFiDeviceClientScanCallback, *(void *)(a1 + 40));
}

uint64_t __50__RTWiFiManager_MobileWiFi__scheduleScanWithCache__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F412FE38](a2, *(void *)(a1 + 32), RTWiFiManager_WiFiDeviceClientCacheScanCallback, *(void *)(a1 + 40));
}

uint64_t __47__RTWiFiManager_MobileWiFi__scheduleActiveScan__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F412FE38](a2, *(void *)(a1 + 32), RTWiFiManager_WiFiDeviceClientCacheScanCallback, *(void *)(a1 + 40));
}

uint64_t __54__RTWiFiManager_MobileWiFi__scheduleScanWithChannels___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F412FE38](a2, *(void *)(a1 + 32), RTWiFiManager_WiFiDeviceClientScanCallback, *(void *)(a1 + 40));
}

uint64_t __39__RTWiFiManager_MobileWiFi__cancelScan__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F412FE40](a2);
}

void __59__RTWiFiManager_MobileWiFi__destroyConnectionToWiFiManager__block_invoke(uint64_t a1)
{
}

uint64_t __67__RTWiFiManager_MobileWiFi__setRegisteredForExtendedLinkCallbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    id v3 = RTWiFiManager_WiFiDeviceClientExtendedLinkCallback;
  }
  else {
    id v3 = 0;
  }
  return MEMORY[0x1F412FE00](a2, v3, *(void *)(a1 + 32));
}

uint64_t __60__RTWiFiManager_MobileWiFi__setRegisteredForPowerCallbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    id v3 = RTWiFiManager_WiFiDeviceClientPowerCallback;
  }
  else {
    id v3 = 0;
  }
  return MEMORY[0x1F412FE18](a2, v3, *(void *)(a1 + 32));
}

uint64_t __65__RTWiFiManager_MobileWiFi__setRegisteredForScanUpdateCallbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    id v3 = RTWiFiManager_WiFiDeviceClientScanUpdateCallback;
  }
  else {
    id v3 = 0;
  }
  return MEMORY[0x1F412FE28](a2, v3, 0, *(void *)(a1 + 32));
}

uint64_t __64__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientPowerCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleWiFiDeviceClientPowerCallback:*(void *)(a1 + 40)];
}

uint64_t __81__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientExtendedLinkCallback_eventData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleWiFiDeviceClientExtendedLinkCallback:*(void *)(a1 + 48) eventData:*(void *)(a1 + 40)];
}

void __45__RTWiFiManager_MobileWiFi__pollAccessPoints__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = WiFiDeviceClientCopyCurrentNetwork();
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F5CFD0]) initWithWiFiNetwork:v6];
    if (v8) {
      [*(id *)(a1 + 32) addObject:v8];
    }
    CFRelease(v7);
    *a4 = 1;
  }
}

uint64_t __99__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientScanUpdateCallback_scanRequest_scanResults_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleScanResultsCallback:*(void *)(a1 + 40) attemptCacheFallback:0 error:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = *(int *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 40) count];

  return +[RTWiFiScanMetrics submitWiFiScanMetricsWithErrorCode:v2 accessPointsscanResultsCount:v3 isScanIssuedByOtherClient:1 isCacheQuery:0];
}

uint64_t __81__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientScanCallback_scanResults_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleScanResultsCallback:*(void *)(a1 + 40) attemptCacheFallback:1 error:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = *(int *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 40) count];

  return +[RTWiFiScanMetrics submitWiFiScanMetricsWithErrorCode:v2 accessPointsscanResultsCount:v3 isScanIssuedByOtherClient:0 isCacheQuery:0];
}

uint64_t __86__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientCacheScanCallback_scanResults_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleScanResultsCallback:*(void *)(a1 + 40) attemptCacheFallback:0 error:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = *(int *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 40) count];

  return +[RTWiFiScanMetrics submitWiFiScanMetricsWithErrorCode:v2 accessPointsscanResultsCount:v3 isScanIssuedByOtherClient:0 isCacheQuery:1];
}

void __82__RTWiFiManager_MobileWiFi__handleScanResultsCallback_attemptCacheFallback_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F5CFD0];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithWiFiNetwork:v4];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    id v5 = v6;
  }
}

void __85__RTWiFiManager_MobileWiFi_scanRequestWithType_dwellTime_channels_lowPriority_merge___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)objc_opt_new();
  [v4 setObject:v3 forKeyedSubscript:@"CHANNEL"];

  [v4 setObject:&unk_1F3451D28 forKeyedSubscript:@"CHANNEL_FLAGS"];
  [*(id *)(a1 + 32) addObject:v4];
}

@end