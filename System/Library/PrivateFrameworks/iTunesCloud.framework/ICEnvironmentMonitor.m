@interface ICEnvironmentMonitor
+ (ICEnvironmentMonitor)sharedMonitor;
- (BOOL)_onQueue_isWiFiAssociated;
- (BOOL)_onQueue_networkConstrained;
- (BOOL)isCharging;
- (BOOL)isCurrentNetworkLinkExpensive;
- (BOOL)isCurrentNetworkLinkHighQuality;
- (BOOL)isEthernetWired;
- (BOOL)isNetworkConstrained;
- (BOOL)isRemoteServerLikelyReachable;
- (BOOL)isRemoteServerReachable;
- (BOOL)isWiFiActive;
- (BOOL)isWiFiAssociated;
- (BOOL)isWifiActive;
- (ICEnvironmentMonitor)init;
- (NSDictionary)signalInfo;
- (NSDictionary)signalStrength;
- (NSString)telephonyOperatorName;
- (NSString)telephonyRegistrationStatus;
- (double)currentBatteryLevel;
- (int64_t)_networkTypeFromWatchCarousel;
- (int64_t)_onQueue_currentCellularLinkQuality;
- (int64_t)_onQueue_currentNetworkType;
- (int64_t)currentThermalPressureLevel;
- (int64_t)currentThermalState;
- (int64_t)lastKnownNetworkType;
- (int64_t)networkType;
- (unint64_t)currentNetworkLinkQuality;
- (unint64_t)currentThermalLevel;
- (void)_handleApplicationDidEnterForegroundNotification:(id)a3;
- (void)_notifyObserversEnvironmentMonitorDidChangeTelephonyStatus;
- (void)_onQueue_loadInitialThermalLevel;
- (void)_onQueue_updateNetworkReachabilityAndNotifyObservers:(BOOL)a3;
- (void)_onQueue_updatePowerStateNotifyingObservers:(BOOL)a3;
- (void)_onQueue_updateTelephonyStateAndNotifyObservers:(BOOL)a3;
- (void)_onQueue_updateThermalLevelWithToken:(int)a3;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)currentDataSimChanged:(id)a3;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation ICEnvironmentMonitor

uint64_t __53__ICEnvironmentMonitor_isRemoteServerLikelyReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 122);
  return result;
}

uint64_t __35__ICEnvironmentMonitor_networkType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 128);
  return result;
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v8 = [(CTXPCServiceSubscriptionContext *)self->_dataSubscriptionContext uuid];
  v9 = [v6 uuid];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v24 = v7;
    id v25 = v6;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v11 = [v7 legacyInfo];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v12) {
      goto LABEL_14;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    uint64_t v15 = *MEMORY[0x1E4F23BE8];
    id v16 = (id)*MEMORY[0x1E4F23BF0];
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v19 = [v18 objectForKeyedSubscript:v15];
        if (v19 == v16)
        {

LABEL_11:
          v22 = (NSDictionary *)[v18 copy];
          cellSignalInfo = self->_cellSignalInfo;
          self->_cellSignalInfo = v22;

          continue;
        }
        v20 = v19;
        int v21 = [v19 isEqual:v16];

        if (v21) {
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v13)
      {
LABEL_14:

        id v7 = v24;
        id v6 = v25;
        break;
      }
    }
  }
}

uint64_t __44__ICEnvironmentMonitor_isNetworkConstrained__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 127);
  return result;
}

uint64_t __40__ICEnvironmentMonitor_isWiFiAssociated__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 124);
  return result;
}

uint64_t __43__ICEnvironmentMonitor_currentThermalLevel__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 152);
  return result;
}

uint64_t __39__ICEnvironmentMonitor_isEthernetWired__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 125);
  return result;
}

uint64_t __53__ICEnvironmentMonitor_isCurrentNetworkLinkExpensive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 123);
  return result;
}

void __28__ICEnvironmentMonitor_init__block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v2 = *(int **)(a1 + 32);
  v3 = v2 + 28;
  v4 = *((void *)v2 + 1);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __28__ICEnvironmentMonitor_init__block_invoke_2;
  handler[3] = &unk_1E5ACD450;
  v56 = v2;
  uint32_t v5 = notify_register_dispatch("com.apple.system.powersources.timeremaining", v3, v4, handler);
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: failed to register for battery level notifications. status=%d", buf, 8u);
    }
  }
  id v7 = *(int **)(a1 + 32);
  v8 = v7 + 29;
  v9 = *((void *)v7 + 1);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __28__ICEnvironmentMonitor_init__block_invoke_17;
  v53[3] = &unk_1E5ACD450;
  v54 = v7;
  uint32_t v10 = notify_register_dispatch("com.apple.system.powersources.source", v8, v9, v53);
  if (v10)
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: failed to register for power source notifications. status=%d", buf, 8u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updatePowerStateNotifyingObservers:", 0);
  uint64_t v12 = +[ICDeviceInfo currentDeviceInfo];
  if ([v12 hasWiFiCapability]
    && [MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.private.corewifi"])
  {
    int v13 = [MEMORY[0x1E4F77990] hasEntitlement:@"com.apple.private.corewifi-xpc" inGroup:@"com.apple.security.exception.mach-lookup.global-name"];

    if (v13)
    {
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x2050000000;
      uint64_t v14 = (void *)getCWFInterfaceClass_softClass;
      uint64_t v60 = getCWFInterfaceClass_softClass;
      if (!getCWFInterfaceClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v63 = 3221225472;
        v64 = __getCWFInterfaceClass_block_invoke;
        v65 = &unk_1E5ACD4F0;
        v66 = &v57;
        __getCWFInterfaceClass_block_invoke((uint64_t)buf);
        uint64_t v14 = (void *)v58[3];
      }
      uint64_t v15 = v14;
      _Block_object_dispose(&v57, 8);
      id v16 = objc_alloc_init(v15);
      uint64_t v17 = *(void *)(a1 + 32);
      v18 = *(void **)(v17 + 88);
      *(void *)(v17 + 88) = v16;

      [*(id *)(*(void *)(a1 + 32) + 88) activate];
    }
  }
  else
  {
  }
  id v19 = +[ICDeviceInfo currentDeviceInfo];
  int v20 = [v19 hasCellularDataCapability];

  if (v20)
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:*(void *)(*(void *)(a1 + 32) + 8)];
    v22 = *(void **)(*(void *)(a1 + 32) + 56);
    *(void *)(*(void *)(a1 + 32) + 56) = v21;

    v23 = *(void **)(a1 + 32);
    id v24 = (void *)v23[7];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __28__ICEnvironmentMonitor_init__block_invoke_30;
    v51[3] = &unk_1E5ACD478;
    v52 = v23;
    [v24 getCurrentDataSubscriptionContext:v51];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
  }
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateTelephonyStateAndNotifyObservers:", 0);
  uint64_t v25 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
  long long v26 = *(void **)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(a1 + 32) + 40) = v25;

  long long v27 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v27)
  {
    [v27 addObserver:*(void *)(a1 + 32) forKeyPath:@"path" options:5 context:ICEnvironmentMonitorNetworkPathEvaluatorContext];
  }
  else
  {
    long long v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: failed to create network path observer", buf, 2u);
    }
  }
  uint64_t v29 = a1 + 32;
  *(unsigned char *)(*(void *)v29 + 127) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_networkConstrained");
  uint64_t v30 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v31 = *(void **)(*(void *)(a1 + 32) + 104);
  *(void *)(*(void *)v29 + 104) = v30;

  v32 = +[ICDeviceInfo currentDeviceInfo];
  int v33 = [v32 isWatch];
  uint64_t v34 = 50;
  if (v33) {
    uint64_t v34 = 0;
  }
  *(void *)(*(void *)v29 + 144) = v34;

  v61 = @"linkQuality";
  uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  v36 = (void *)ICNOIKeysToObserve;
  ICNOIKeysToObserve = v35;

  id v37 = objc_alloc_init(MEMORY[0x1E4FA91C8]);
  v38 = *(void **)(*(void *)v29 + 96);
  *(void *)(*(void *)v29 + 96) = v37;

  v39 = *(void **)(*(void *)v29 + 96);
  if (v39)
  {
    [v39 setQueue:*(void *)(*(void *)v29 + 8)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 96) trackNOIAnyForInterfaceType:2 options:0];
    [*(id *)(*(void *)(a1 + 32) + 96) trackNOIAnyForInterfaceType:1 options:0];
  }
  else
  {
    v40 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v40, OS_LOG_TYPE_ERROR, "Failed to create NWNetworkOfInterestManager", buf, 2u);
    }
  }
  v42 = *(void **)(a1 + 32);
  v41 = (id *)(a1 + 32);
  objc_msgSend(v42, "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 0);
  objc_msgSend(*v41, "_onQueue_loadInitialThermalLevel");
  [*((id *)*v41 + 7) refreshCellMonitor:0 completion:&__block_literal_global_39];
  v43 = (const char *)*MEMORY[0x1E4F14918];
  v44 = *v41;
  v45 = (int *)((char *)*v41 + 48);
  v46 = v44[1];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __28__ICEnvironmentMonitor_init__block_invoke_40;
  v49[3] = &unk_1E5ACD450;
  v50 = v44;
  uint32_t v47 = notify_register_dispatch(v43, v45, v46, v49);
  if (v47)
  {
    v48 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v47;
      _os_log_impl(&dword_1A2D01000, v48, OS_LOG_TYPE_DEFAULT, "error registering for thermal pressure levels change notifications status=%u", buf, 8u);
    }
  }
}

uint64_t __44__ICEnvironmentMonitor_didStartTrackingNOI___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) interface];
  if ((unint64_t)(result - 1) <= 1)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v16 = v4;
      __int16 v17 = 1024;
      int v18 = [v4 linkQuality];
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Start tracking interface %{public}@. linkQuality=%d", buf, 0x12u);
    }

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = (id)ICNOIKeysToObserve;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(void *)(a1 + 40), *(void *)(*((void *)&v10 + 1) + 8 * i), 1, ICEnvironmentMonitorNOIContext, (void)v10);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [*(id *)(*(void *)(a1 + 40) + 104) addObject:*(void *)(a1 + 32)];
    return objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
  }
  return result;
}

- (void)_onQueue_updateNetworkReachabilityAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  int64_t v5 = [(ICEnvironmentMonitor *)self _onQueue_currentNetworkType];
  BOOL wifiAssociated = self->_wifiAssociated;
  int ethernetWired = self->_ethernetWired;
  BOOL networkConstrained = self->_networkConstrained;
  unint64_t v7 = [(ICEnvironmentMonitor *)self _onQueue_currentCellularLinkQuality];
  self->_BOOL wifiAssociated = [(ICEnvironmentMonitor *)self _onQueue_isWiFiAssociated];
  self->_int ethernetWired = v5 == 2000;
  self->_BOOL networkConstrained = [(ICEnvironmentMonitor *)self _onQueue_networkConstrained];
  uint64_t v8 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
  uint64_t v9 = [v8 status];

  BOOL v10 = v9 == 1;
  if (v9 == 1)
  {
    BOOL v12 = 1;
  }
  else
  {
    long long v11 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
    BOOL v12 = [v11 status] == 3;
  }
  long long v13 = +[ICDeviceInfo currentDeviceInfo];
  int v14 = [v13 isWatch];

  if (v14 && v5) {
    BOOL v12 = 1;
  }
  BOOL v15 = v9 == 1;
  id v16 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
  self->_BOOL currentNetworkLinkExpensive = [v16 isExpensive];

  if (self->_remoteServerReachable == v10
    && self->_remoteServerLikelyReachable == v12
    && self->_currentNetworkLinkQuality == v7
    && self->_wifiAssociated == wifiAssociated
    && self->_networkConstrained == networkConstrained)
  {
    int v17 = self->_ethernetWired;
    int64_t networkType = self->_networkType;
    BOOL v19 = networkType == v5;
    BOOL v20 = v17 != ethernetWired;
    if (v17 == ethernetWired && networkType == v5) {
      goto LABEL_25;
    }
  }
  else
  {
    BOOL v19 = self->_networkType == v5;
    BOOL v20 = 1;
  }
  BOOL v39 = v12;
  BOOL v21 = v15;
  v22 = @"fair";
  if (v7 < 0x14) {
    v22 = @"low";
  }
  if (v7 > 0x31) {
    v22 = @"high";
  }
  v23 = [NSString stringWithFormat:@"%d (%@)", v7, v22];
  id v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    [NSNumber numberWithUnsignedInt:self->_telephonyStatusIndicator];
    uint64_t v25 = v37 = v19;
    BOOL currentNetworkLinkExpensive = self->_currentNetworkLinkExpensive;
    BOOL v27 = self->_wifiAssociated;
    BOOL v28 = self->_ethernetWired;
    BOOL v29 = self->_networkConstrained;
    *(_DWORD *)buf = 67242242;
    int v47 = v5;
    __int16 v48 = 2114;
    v49 = v25;
    __int16 v50 = 1024;
    BOOL v51 = v21;
    __int16 v52 = 1024;
    BOOL v53 = v39;
    __int16 v54 = 2114;
    v55 = v23;
    __int16 v56 = 1024;
    BOOL v57 = currentNetworkLinkExpensive;
    __int16 v58 = 1024;
    BOOL v59 = v27;
    __int16 v60 = 1024;
    BOOL v61 = v28;
    __int16 v62 = 1024;
    BOOL v63 = v29;
    _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_DEFAULT, "Network reachability values changed. networkType=%{public}d, telephonyDataIndicator=%{public}@, isRemoteServerReachable=%{BOOL}u, isRemoteServerLikelyReachable=%{BOOL}u, currentNetworkLinkQuality=%{public}@, _currentNetworkLinkExpensive=%{BOOL}u, _wifiAssociated=%{BOOL}u, _ethernetWired=%{BOOL}u, _networkConstrained=%{BOOL}u", buf, 0x40u);

    BOOL v19 = v37;
  }

  if (v20)
  {
    self->_remoteServerReachable = v10;
    self->_remoteServerLikelyReachable = v39;
    self->_currentNetworkLinkQuality = v7;
    if (v3)
    {
      os_unfair_recursive_lock_lock_with_options();
      uint64_t v30 = (void *)[(NSHashTable *)self->_observers copy];
      os_unfair_recursive_lock_unlock();
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__ICEnvironmentMonitor__onQueue_updateNetworkReachabilityAndNotifyObservers___block_invoke;
      block[3] = &unk_1E5ACD4C8;
      id v44 = v30;
      v45 = self;
      id v32 = v30;
      dispatch_async(calloutQueue, block);
    }
  }
LABEL_25:
  if (!v19)
  {
    self->_int64_t networkType = v5;
    self->_wiFiActive = (unint64_t)(v5 - 1000) < 0x3E8;
    if (v5) {
      self->_lastKnownNetworkType = v5;
    }
    if (v3)
    {
      os_unfair_recursive_lock_lock_with_options();
      int v33 = (void *)[(NSHashTable *)self->_observers copy];
      os_unfair_recursive_lock_unlock();
      uint64_t v34 = self->_calloutQueue;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __77__ICEnvironmentMonitor__onQueue_updateNetworkReachabilityAndNotifyObservers___block_invoke_2;
      v40[3] = &unk_1E5ACD4C8;
      id v41 = v33;
      v42 = self;
      id v35 = v33;
      dispatch_async(v34, v40);
    }
  }
}

- (BOOL)_onQueue_networkConstrained
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL v3 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
  char v4 = [v3 isConstrained];

  return v4;
}

- (BOOL)_onQueue_isWiFiAssociated
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_networksOfInterest;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v3);
        }
        BOOL v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "interface", (void)v12) == 1)
        {
          if ([v10 linkQuality] > v7) {
            uint64_t v7 = [v10 linkQuality];
          }
          char v6 = 1;
        }
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);

    if (v6) {
      return v7 > 0;
    }
  }
  else
  {
  }
  return self->_wifiAssociated;
}

- (int64_t)_onQueue_currentNetworkType
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL v3 = +[ICDeviceInfo currentDeviceInfo];
  int v4 = [v3 isInternalBuild];

  if (v4)
  {
    uint64_t v5 = +[ICDefaults standardDefaults];
    char v6 = [v5 networkTypeOverride];

    if (v6)
    {
      uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138543618;
        id v24 = self;
        __int16 v25 = 2114;
        long long v26 = v6;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found network type override value %{public}@", (uint8_t *)&v23, 0x16u);
      }

      int64_t v8 = [v6 integerValue];
      return v8;
    }
  }
  uint64_t v9 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
  uint64_t v10 = [v9 status];

  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    long long v11 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
    char v12 = [v11 usesInterfaceType:3];

    if (v12) {
      return 2000;
    }
    long long v13 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
    char v14 = [v13 usesInterfaceType:1];

    if (v14) {
      return 1000;
    }
    int64_t v8 = 1;
    switch(self->_telephonyStatusIndicator)
    {
      case 0:
        long long v15 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
        char v16 = [v15 usesInterfaceType:2];

        if (v16) {
          return 100;
        }
        uint64_t v17 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
        if ([v17 usesInterfaceType:0])
        {
        }
        else
        {
          int v18 = [(NWPathEvaluator *)self->_networkPathEvaluator path];
          char v19 = [v18 usesInterfaceType:4];

          if ((v19 & 1) == 0) {
            goto LABEL_25;
          }
        }
        int64_t v8 = 3000;
        break;
      case 1:
      case 2:
        return v8;
      case 3:
      case 4:
      case 5:
        return 2;
      case 6:
      case 7:
      case 0xD:
      case 0xE:
      case 0xF:
        return 3;
      case 8:
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
        return 4;
      case 9:
        return 5;
      case 0xA:
        return 6;
      case 0xB:
        return 7;
      case 0xC:
        return 8;
      default:
        goto LABEL_25;
    }
    return v8;
  }
LABEL_25:
  BOOL v20 = +[ICDeviceInfo currentDeviceInfo];
  int v21 = [v20 isWatch];

  if (!v21) {
    return 0;
  }

  return [(ICEnvironmentMonitor *)self _networkTypeFromWatchCarousel];
}

- (int64_t)_onQueue_currentCellularLinkQuality
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL v3 = +[ICDeviceInfo currentDeviceInfo];
  int v4 = [v3 isInternalBuild];

  if (v4)
  {
    uint64_t v5 = +[ICDefaults standardDefaults];
    char v6 = [v5 networkLinkQualityOverride];

    if (v6)
    {
      uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        int v23 = self;
        __int16 v24 = 2114;
        __int16 v25 = v6;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found network link quality override value %{public}@", buf, 0x16u);
      }

      int64_t v8 = (int)[v6 intValue];
      return v8;
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_networksOfInterest;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v10)
  {

    return self->_currentNetworkLinkQuality;
  }
  uint64_t v11 = v10;
  char v12 = 0;
  int64_t v8 = 0;
  uint64_t v13 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v9);
      }
      long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if (objc_msgSend(v15, "interface", (void)v17) == 2)
      {
        if ([v15 linkQuality] > v8) {
          int64_t v8 = [v15 linkQuality];
        }
        char v12 = 1;
      }
    }
    uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v11);

  if ((v12 & 1) == 0) {
    return self->_currentNetworkLinkQuality;
  }
  return v8;
}

- (void)_onQueue_updatePowerStateNotifyingObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  int currentBatteryLevel = (int)self->_currentBatteryLevel;
  unsigned __int8 charging = self->_charging;
  unsigned __int8 v33 = 0;
  int v5 = IOPSDrawingUnlimitedPower();
  int v6 = IOPSGetPercentRemaining();
  if (v6)
  {
    int v7 = v6;
    int64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)BOOL v37 = v7;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "Failed to get current batter state. err=%d (%x)", buf, 0xEu);
    }
  }
  charging |= v5;
  uint64_t v9 = +[ICDefaults standardDefaults];
  uint64_t v10 = [v9 chargingStateOverride];

  if (v10)
  {
    uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)BOOL v37 = self;
      *(_WORD *)&v37[8] = 2114;
      v38 = v10;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Found charging state override value %{public}@", buf, 0x16u);
    }

    int v12 = [v10 BOOLValue];
    unsigned __int8 charging = v12;
  }
  else
  {
    int v12 = charging;
  }
  if (self->_charging != v12)
  {
    uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)BOOL v37 = charging;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v33;
      LOWORD(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 2) = v5;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "Power state changed. isCharging=%d, isFullyCharged=%d, powerSourceIsUnlimited=%d", buf, 0x14u);
    }

    self->_unsigned __int8 charging = charging;
    if (v3)
    {
      os_unfair_recursive_lock_lock_with_options();
      char v14 = (void *)[(NSHashTable *)self->_observers copy];
      os_unfair_recursive_lock_unlock();
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__ICEnvironmentMonitor__onQueue_updatePowerStateNotifyingObservers___block_invoke;
      block[3] = &unk_1E5ACD4C8;
      id v31 = v14;
      id v32 = self;
      id v16 = v14;
      dispatch_async(calloutQueue, block);
    }
  }
  int v17 = currentBatteryLevel;
  long long v18 = +[ICDefaults standardDefaults];
  long long v19 = [v18 batteryLevelOverride];

  if (v19)
  {
    long long v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)BOOL v37 = self;
      *(_WORD *)&v37[8] = 2114;
      v38 = v19;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Found battery level override value %{public}@", buf, 0x16u);
    }

    [v19 doubleValue];
    double v22 = v21;
  }
  else
  {
    double v22 = (double)v17 / 100.0;
  }
  if (v22 != self->_currentBatteryLevel)
  {
    int v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)BOOL v37 = v22;
      _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_DEFAULT, "Battery level changed. batteryLevel=%.2f", buf, 0xCu);
    }

    self->_int currentBatteryLevel = v22;
    if (v3)
    {
      os_unfair_recursive_lock_lock_with_options();
      __int16 v24 = (void *)[(NSHashTable *)self->_observers copy];
      os_unfair_recursive_lock_unlock();
      __int16 v25 = self->_calloutQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __68__ICEnvironmentMonitor__onQueue_updatePowerStateNotifyingObservers___block_invoke_114;
      v27[3] = &unk_1E5ACD4C8;
      id v28 = v24;
      BOOL v29 = self;
      id v26 = v24;
      dispatch_async(v25, v27);
    }
  }
}

uint64_t __71__ICEnvironmentMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateTelephonyStateAndNotifyObservers:", 1);
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
}

- (void)_onQueue_updateTelephonyStateAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  dataSubscriptionContext = self->_dataSubscriptionContext;
  if (dataSubscriptionContext)
  {
    int v6 = dataSubscriptionContext;
    int v7 = self->_telephonyOperatorName;
    telephonyClient = self->_telephonyClient;
    id v33 = 0;
    uint64_t v9 = [(CoreTelephonyClient *)telephonyClient getOperatorName:v6 error:&v33];
    id v10 = v33;
    telephonyOperatorName = self->_telephonyOperatorName;
    self->_telephonyOperatorName = v9;

    if (v10)
    {
      int v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v10;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "Error fetching operator name. error=%{public}@", buf, 0xCu);
      }
    }
    uint64_t v13 = self->_telephonyOperatorName;
    if (v13 == v7) {
      char v14 = 0;
    }
    else {
      char v14 = ![(NSString *)v13 isEqualToString:v7];
    }
    long long v15 = self->_telephonyRegistrationStatus;
    id v16 = self->_telephonyClient;
    id v32 = 0;
    int v17 = (NSString *)[(CoreTelephonyClient *)v16 copyRegistrationStatus:v6 error:&v32];
    id v18 = v32;
    telephonyRegistrationStatus = self->_telephonyRegistrationStatus;
    self->_telephonyRegistrationStatus = v17;

    if (v18)
    {
      long long v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v18;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "Error fetching registration status. error=%{public}@", buf, 0xCu);
      }
    }
    if (v14)
    {
      int v21 = 1;
    }
    else
    {
      double v22 = self->_telephonyRegistrationStatus;
      if (v22 == v15) {
        int v21 = 0;
      }
      else {
        int v21 = ![(NSString *)v22 isEqualToString:v15];
      }
    }
    int telephonyStatusIndicator = self->_telephonyStatusIndicator;
    __int16 v24 = self->_telephonyClient;
    id v31 = 0;
    __int16 v25 = [(CoreTelephonyClient *)v24 getDataStatus:v6 error:&v31];
    id v26 = v31;
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v27;
        _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_ERROR, "Error fetching data status. error=%{public}@", buf, 0xCu);
      }
    }
    if (v25)
    {
      int v29 = [v25 indicator];
      self->_int telephonyStatusIndicator = v29;
      if (v29 == telephonyStatusIndicator) {
        int v30 = v21;
      }
      else {
        int v30 = 1;
      }
      if (!v3) {
        goto LABEL_31;
      }
      if (v29 == telephonyStatusIndicator)
      {
        if (!v30) {
          goto LABEL_31;
        }
      }
      else
      {
        [(ICEnvironmentMonitor *)self _onQueue_updateNetworkReachabilityAndNotifyObservers:1];
      }
    }
    else if ((v3 & v21 & 1) == 0)
    {
LABEL_31:

      return;
    }
    [(ICEnvironmentMonitor *)self _notifyObserversEnvironmentMonitorDidChangeTelephonyStatus];
    goto LABEL_31;
  }
}

- (void)_onQueue_loadInitialThermalLevel
{
  *(void *)&v18[5] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  int out_token = 0;
  uint32_t v3 = notify_register_check((const char *)*MEMORY[0x1E4F14918], &out_token);
  if (!v3)
  {
    p_currentThermalLevel = &self->_currentThermalLevel;
    uint32_t state = notify_get_state(out_token, &self->_currentThermalLevel);
    int64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    uint64_t v9 = v8;
    if (state)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v10 = *p_currentThermalLevel;
        *(_DWORD *)buf = 67109376;
        v18[0] = state;
        LOWORD(v18[1]) = 2048;
        *(void *)((char *)&v18[1] + 2) = v10;
        uint64_t v11 = "error getting current thermal pressure level - status=%u, _currentThermalLevel=%llu";
        int v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        uint32_t v14 = 18;
LABEL_10:
        _os_log_impl(&dword_1A2D01000, v12, v13, v11, buf, v14);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v15 = *p_currentThermalLevel;
      *(_DWORD *)buf = 134217984;
      *(void *)id v18 = v15;
      uint64_t v11 = "current thermal pressure level=%llu";
      int v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
      goto LABEL_10;
    }

    notify_cancel(out_token);
    return;
  }
  uint32_t v4 = v3;
  int v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v18[0] = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "error checking for thermal pressure level status=%u", buf, 8u);
  }
}

uint64_t __28__ICEnvironmentMonitor_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updatePowerStateNotifyingObservers:", 1);
}

uint64_t __47__ICEnvironmentMonitor_isRemoteServerReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 121);
  return result;
}

void __68__ICEnvironmentMonitor__onQueue_updatePowerStateNotifyingObservers___block_invoke_114(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 environmentMonitorDidChangeBatteryLevel:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __77__ICEnvironmentMonitor__onQueue_updateNetworkReachabilityAndNotifyObservers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 environmentMonitorDidChangeNetworkReachability:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)registerObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    os_unfair_recursive_lock_lock_with_options();
    [(NSHashTable *)self->_observers addObject:v4];

    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)isRemoteServerLikelyReachable
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ICEnvironmentMonitor_isRemoteServerLikelyReachable__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (ICEnvironmentMonitor)sharedMonitor
{
  if (sharedMonitor_sOnceToken_39891 != -1) {
    dispatch_once(&sharedMonitor_sOnceToken_39891, &__block_literal_global_39892);
  }
  v2 = (void *)sharedMonitor_sSharedMonitor_39893;

  return (ICEnvironmentMonitor *)v2;
}

- (int64_t)networkType
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__ICEnvironmentMonitor_networkType__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isWiFiAssociated
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__ICEnvironmentMonitor_isWiFiAssociated__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEthernetWired
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ICEnvironmentMonitor_isEthernetWired__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ICEnvironmentMonitor_didStartTrackingNOI___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __37__ICEnvironmentMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor_sSharedMonitor_39893 = objc_alloc_init(ICEnvironmentMonitor);

  return MEMORY[0x1F41817F8]();
}

- (ICEnvironmentMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)ICEnvironmentMonitor;
  id v2 = [(ICEnvironmentMonitor *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloud.ICEnvironmentMonitor.accessQueue", 0);
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunescloud.ICEnvironmentMonitor.calloutQueue", MEMORY[0x1E4F14430]);
    id v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    *((void *)v2 + 4) = 0;
    *((void *)v2 + 14) = -1;
    *((_DWORD *)v2 + 16) = 0;
    *((void *)v2 + 19) = 0;
    *((_DWORD *)v2 + 12) = -1;
    char v9 = *((void *)v2 + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__ICEnvironmentMonitor_init__block_invoke;
    block[3] = &unk_1E5ACD750;
    id v10 = v2;
    id v14 = v10;
    dispatch_async(v9, block);
    long long v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v10 selector:sel__handleApplicationDidEnterForegroundNotification_ name:@"UIApplicationDidEnterForegroundNotification" object:0];
    [v11 addObserver:v10 selector:sel__handleApplicationDidEnterForegroundNotification_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
  }
  return (ICEnvironmentMonitor *)v2;
}

uint64_t __73__ICEnvironmentMonitor__handleApplicationDidEnterForegroundNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateTelephonyStateAndNotifyObservers:", 1);
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
}

uint64_t __55__ICEnvironmentMonitor_isCurrentNetworkLinkHighQuality__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 128) != 0;
  uint64_t v1 = *(void *)(result + 32);
  if ((unint64_t)(*(void *)(v1 + 128) - 1) <= 0x1F2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(v1 + 144) > 0x31uLL;
  }
  return result;
}

- (int64_t)currentThermalPressureLevel
{
  int v2 = [(ICEnvironmentMonitor *)self currentThermalLevel];
  int64_t v3 = 30;
  uint64_t v4 = 40;
  uint64_t v5 = 50;
  if (v2 != 50) {
    uint64_t v5 = 0;
  }
  if (v2 != 40) {
    uint64_t v4 = v5;
  }
  if (v2 != 30) {
    int64_t v3 = v4;
  }
  int64_t v6 = 10;
  uint64_t v7 = 20;
  if (v2 != 20) {
    uint64_t v7 = 0;
  }
  if (v2 != 10) {
    int64_t v6 = v7;
  }
  if (v2 <= 29) {
    return v6;
  }
  else {
    return v3;
  }
}

- (unint64_t)currentThermalLevel
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ICEnvironmentMonitor_currentThermalLevel__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isNetworkConstrained
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ICEnvironmentMonitor_isNetworkConstrained__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__ICEnvironmentMonitor_signalStrength__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 128);
}

void __34__ICEnvironmentMonitor_signalInfo__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 88));
  uint64_t v2 = [*(id *)(a1[4] + 80) copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 128);
}

- (NSDictionary)signalStrength
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v50 = 0;
  BOOL v51 = &v50;
  uint64_t v52 = 0x3032000000;
  BOOL v53 = __Block_byref_object_copy__39791;
  __int16 v54 = __Block_byref_object_dispose__39792;
  id v55 = 0;
  uint64_t v46 = 0;
  int v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__39791;
  id v44 = __Block_byref_object_dispose__39792;
  id v45 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ICEnvironmentMonitor_signalStrength__block_invoke;
  block[3] = &unk_1E5ACD4A0;
  void block[4] = self;
  block[5] = &v50;
  block[6] = &v40;
  block[7] = &v46;
  dispatch_sync(accessQueue, block);
  uint64_t v5 = v47[3];
  if ((unint64_t)(v5 - 1) > 0x1F2)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v6 = (void *)v51[5];
    id v38 = 0;
    uint64_t v7 = [v6 getCurrentDataServiceDescriptorSync:&v38];
    id v8 = v38;
    if (v8)
    {
      id v9 = v8;
      id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v57 = v9;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve Current Data CTServiceDescriptor: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      long long v11 = (void *)v51[5];
      id v37 = 0;
      id v10 = [v11 getPublicSignalStrength:v7 error:&v37];
      id v12 = v37;
      if (v12)
      {
        uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v57 = v12;
          _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "Failed to retrieve CTSignalStrengthInfo %{public}@", buf, 0xCu);
        }
      }
      else
      {
        id v14 = [v10 maxDisplayBars];
        [v3 setObject:v14 forKeyedSubscript:@"signal-bars-max"];

        uint64_t v13 = [v10 displayBars];
        [v3 setObject:v13 forKeyedSubscript:@"signal-bars"];
      }

      objc_super v15 = (void *)v51[5];
      id v36 = v12;
      id v16 = [v15 getSignalStrengthMeasurements:v7 error:&v36];
      id v9 = v36;

      if (v9)
      {
        int v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v57 = v9;
          _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve CTSignalStrengthMeasurements %{public}@", buf, 0xCu);
        }
      }
      else
      {
        id v18 = [v16 rssi];
        [v3 setObject:v18 forKeyedSubscript:@"gsm-rssi"];

        long long v19 = [v16 rscp];
        [v3 setObject:v19 forKeyedSubscript:@"umts-rscp"];

        long long v20 = [v16 ecn0];
        [v3 setObject:v20 forKeyedSubscript:@"umts-ecn0"];

        int v21 = [v16 rsrp];
        [v3 setObject:v21 forKeyedSubscript:@"lte-rsrp"];

        double v22 = [v16 rsrq];
        [v3 setObject:v22 forKeyedSubscript:@"lte-rsrq"];

        int v23 = [v16 snr];
        [v3 setObject:v23 forKeyedSubscript:@"lte-snr"];

        __int16 v24 = [v16 ecio];
        [v3 setObject:v24 forKeyedSubscript:@"evdo-ecio"];

        int v17 = [v16 rxagc];
        [v3 setObject:v17 forKeyedSubscript:@"evdo-rxagc"];
      }
    }
    uint64_t v5 = v47[3];
  }
  if ((unint64_t)(v5 - 1000) <= 0x3E7)
  {
    float v25 = (float)[(id)v41[5] RSSI] + 77.5;
    float v26 = fabsf(sqrtf((float)(v25 * v25) + 450.0));
    float v27 = (float)(v25 / (float)(v26 + v26)) + 0.5;
    if (v27 < 0.0 || v27 > 1.0)
    {
      uint64_t v29 = 0;
    }
    else
    {
      unint64_t v30 = vcvtps_u32_f32(v27 * 3.0);
      if (v30 <= 1) {
        unint64_t v30 = 1;
      }
      if (v30 >= 3) {
        uint64_t v29 = 3;
      }
      else {
        uint64_t v29 = v30;
      }
    }
    id v31 = [NSNumber numberWithUnsignedInteger:v29];
    [v3 setObject:v31 forKeyedSubscript:@"signal-bars"];

    id v32 = [NSNumber numberWithUnsignedInteger:3];
    [v3 setObject:v32 forKeyedSubscript:@"signal-bars-max"];

    id v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)v41[5], "RSSI"));
    [v3 setObject:v33 forKeyedSubscript:@"wifi-rssi"];
  }
  uint64_t v34 = (void *)[v3 copy];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  return (NSDictionary *)v34;
}

- (NSDictionary)signalInfo
{
  v60[16] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v53 = 0;
  __int16 v54 = &v53;
  uint64_t v55 = 0x3032000000;
  __int16 v56 = __Block_byref_object_copy__39791;
  id v57 = __Block_byref_object_dispose__39792;
  id v58 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__39791;
  int v47 = __Block_byref_object_dispose__39792;
  id v48 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ICEnvironmentMonitor_signalInfo__block_invoke;
  block[3] = &unk_1E5ACD4A0;
  void block[4] = self;
  block[5] = &v43;
  block[6] = &v53;
  block[7] = &v49;
  dispatch_sync(accessQueue, block);
  uint64_t v5 = *MEMORY[0x1E4F23C20];
  v60[0] = *MEMORY[0x1E4F23C18];
  v60[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F23C08];
  v60[2] = *MEMORY[0x1E4F23BE0];
  v60[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F23BB8];
  v60[4] = *MEMORY[0x1E4F23CB8];
  v60[5] = v7;
  uint64_t v8 = *MEMORY[0x1E4F23BC8];
  v60[6] = *MEMORY[0x1E4F23C28];
  v60[7] = v8;
  uint64_t v9 = *MEMORY[0x1E4F23C40];
  v60[8] = *MEMORY[0x1E4F23BC0];
  v60[9] = v9;
  uint64_t v10 = *MEMORY[0x1E4F23CA0];
  v60[10] = *MEMORY[0x1E4F23C48];
  v60[11] = v10;
  uint64_t v11 = *MEMORY[0x1E4F23C00];
  v60[12] = *MEMORY[0x1E4F23C38];
  v60[13] = v11;
  uint64_t v12 = *MEMORY[0x1E4F23BF8];
  v60[14] = *MEMORY[0x1E4F23C50];
  v60[15] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:16];
  id v14 = v13;
  uint64_t v15 = v50[3];
  if ((unint64_t)(v15 - 1) <= 0x1F2)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v59 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          int v21 = objc_msgSend((id)v54[5], "objectForKeyedSubscript:", v20, (void)v38);

          if (v21)
          {
            double v22 = [(id)v54[5] objectForKeyedSubscript:v20];
            [v3 setObject:v22 forKeyedSubscript:v20];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v59 count:16];
      }
      while (v17);
    }

    uint64_t v15 = v50[3];
  }
  if ((unint64_t)(v15 - 1000) <= 0x3E7)
  {
    int v23 = NSNumber;
    [(id)v44[5] txRate];
    __int16 v24 = objc_msgSend(v23, "numberWithDouble:");
    [v3 setObject:v24 forKeyedSubscript:@"wifi-txRate"];

    float v25 = NSNumber;
    float v26 = [(id)v44[5] channel];
    float v27 = objc_msgSend(v25, "numberWithUnsignedInt:", objc_msgSend(v26, "flags"));
    [v3 setObject:v27 forKeyedSubscript:@"wifi-channel-flags"];

    id v28 = NSNumber;
    uint64_t v29 = [(id)v44[5] channel];
    unint64_t v30 = objc_msgSend(v28, "numberWithUnsignedInt:", objc_msgSend(v29, "width"));
    [v3 setObject:v30 forKeyedSubscript:@"wifi-channel-width"];

    uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)v44[5], "PHYMode"));
    [v3 setObject:v31 forKeyedSubscript:@"wifi-phyMode"];

    id v32 = [(id)v44[5] countryCode];
    LOBYTE(v31) = v32 == 0;

    if ((v31 & 1) == 0)
    {
      id v33 = [(id)v44[5] countryCode];
      [v3 setObject:v33 forKeyedSubscript:@"wifi-countryCode"];
    }
    uint64_t v34 = NSNumber;
    objc_msgSend((id)v44[5], "rxRate", (void)v38);
    id v35 = objc_msgSend(v34, "numberWithDouble:");
    [v3 setObject:v35 forKeyedSubscript:@"wifi-rxRate"];
  }
  id v36 = objc_msgSend(v3, "copy", (void)v38);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return (NSDictionary *)v36;
}

- (void)_handleApplicationDidEnterForegroundNotification:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ICEnvironmentMonitor__handleApplicationDidEnterForegroundNotification___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __28__ICEnvironmentMonitor_init__block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: [_telephonyClient refreshCellMonitor] failed error=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (BOOL)isCurrentNetworkLinkExpensive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ICEnvironmentMonitor_isCurrentNetworkLinkExpensive__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCurrentNetworkLinkHighQuality
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ICEnvironmentMonitor_isCurrentNetworkLinkHighQuality__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __28__ICEnvironmentMonitor_init__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: getCurrentDataSubscriptionContext failed error=%{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateTelephonyStateAndNotifyObservers:", 0);
  }
}

- (BOOL)isRemoteServerReachable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ICEnvironmentMonitor_isRemoteServerReachable__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)ICEnvironmentMonitorNetworkPathEvaluatorContext == a6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__ICEnvironmentMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5ACD750;
    void block[4] = self;
    dispatch_async(accessQueue, block);
  }
  else if ((void *)ICEnvironmentMonitorNOIContext == a6)
  {
    id v14 = self->_accessQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__ICEnvironmentMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v16[3] = &unk_1E5ACD4C8;
    id v17 = v11;
    uint64_t v18 = self;
    dispatch_async(v14, v16);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICEnvironmentMonitor;
    [(ICEnvironmentMonitor *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

double __43__ICEnvironmentMonitor_currentBatteryLevel__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 160);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)currentBatteryLevel
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ICEnvironmentMonitor_currentBatteryLevel__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyRegistrationStatus, 0);
  objc_storeStrong((id *)&self->_telephonyOperatorName, 0);
  objc_storeStrong((id *)&self->_networksOfInterest, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_cellSignalInfo, 0);
  objc_storeStrong((id *)&self->_dataSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_networkPathEvaluator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (BOOL)isWiFiActive
{
  return self->_wiFiActive;
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ICEnvironmentMonitor_didStopTrackingAllNOIs___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __47__ICEnvironmentMonitor_didStopTrackingAllNOIs___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "Stop tracking interfaces %{public}@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 40) didStopTrackingNOI:*(void *)(*((void *)&v12 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(NSObject **)(v9 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ICEnvironmentMonitor_didStopTrackingAllNOIs___block_invoke_119;
  block[3] = &unk_1E5ACD750;
  void block[4] = v9;
  dispatch_async(v10, block);
}

uint64_t __47__ICEnvironmentMonitor_didStopTrackingAllNOIs___block_invoke_119(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "Start tracking WiFi and Cellular link changes", v4, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 96) trackNOIAnyForInterfaceType:2 options:0];
  return [*(id *)(*(void *)(a1 + 32) + 96) trackNOIAnyForInterfaceType:1 options:0];
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ICEnvironmentMonitor_didStopTrackingNOI___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __43__ICEnvironmentMonitor_didStopTrackingNOI___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) interface];
  if ((unint64_t)(result - 1) <= 1)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Stop tracking interface %{public}@", buf, 0xCu);
    }

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = (id)ICNOIKeysToObserve;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(void *)(a1 + 40), *(void *)(*((void *)&v10 + 1) + 8 * v9++), ICEnvironmentMonitorNOIContext, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [*(id *)(*(void *)(a1 + 40) + 104) removeObject:*(void *)(a1 + 32)];
    return objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
  }
  return result;
}

- (void)currentDataSimChanged:(id)a3
{
  uint64_t v4 = (CTXPCServiceSubscriptionContext *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  dataSubscriptionContext = self->_dataSubscriptionContext;
  self->_dataSubscriptionContext = v4;

  [(ICEnvironmentMonitor *)self _onQueue_updateTelephonyStateAndNotifyObservers:1];
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  accessQueue = self->_accessQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(accessQueue);
  uint64_t v8 = [(CTXPCServiceSubscriptionContext *)self->_dataSubscriptionContext uuid];
  uint64_t v9 = [v7 uuid];

  LODWORD(v7) = [v8 isEqual:v9];
  if (v7)
  {
    [(ICEnvironmentMonitor *)self _onQueue_updateTelephonyStateAndNotifyObservers:1];
  }
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  accessQueue = self->_accessQueue;
  id v6 = a3;
  dispatch_assert_queue_V2(accessQueue);
  id v7 = [(CTXPCServiceSubscriptionContext *)self->_dataSubscriptionContext uuid];
  uint64_t v8 = [v6 uuid];

  LODWORD(v6) = [v7 isEqual:v8];
  if (v6)
  {
    [(ICEnvironmentMonitor *)self _onQueue_updateTelephonyStateAndNotifyObservers:1];
  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  accessQueue = self->_accessQueue;
  id v6 = a3;
  dispatch_assert_queue_V2(accessQueue);
  id v7 = [(CTXPCServiceSubscriptionContext *)self->_dataSubscriptionContext uuid];
  uint64_t v8 = [v6 uuid];

  LODWORD(v6) = [v7 isEqual:v8];
  if (v6)
  {
    [(ICEnvironmentMonitor *)self _onQueue_updateTelephonyStateAndNotifyObservers:1];
  }
}

void __71__ICEnvironmentMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if ([v2 interface] == 2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  if ([v2 interface] == 1)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      int v4 = 138543618;
      id v5 = v2;
      __int16 v6 = 1024;
      int v7 = [v2 linkQuality];
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Received link quality change on interface %{public}@. linkQuality=%d", (uint8_t *)&v4, 0x12u);
    }
LABEL_7:

    objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
  }
}

- (int64_t)_networkTypeFromWatchCarousel
{
  return 0;
}

void __68__ICEnvironmentMonitor__onQueue_updatePowerStateNotifyingObservers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 environmentMonitorDidChangePower:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversEnvironmentMonitorDidChangeTelephonyStatus
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  os_unfair_recursive_lock_unlock();
  calloutQueue = self->_calloutQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__ICEnvironmentMonitor__notifyObserversEnvironmentMonitorDidChangeTelephonyStatus__block_invoke;
  v6[3] = &unk_1E5ACD4C8;
  id v7 = v3;
  long long v8 = self;
  id v5 = v3;
  dispatch_async(calloutQueue, v6);
}

void __82__ICEnvironmentMonitor__notifyObserversEnvironmentMonitorDidChangeTelephonyStatus__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 environmentMonitorDidChangeTelephonyStatus:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_onQueue_updateThermalLevelWithToken:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a3, &state64);
  if (state)
  {
    uint32_t v6 = state;
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t currentThermalLevel = self->_currentThermalLevel;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v18 = v6;
      *(_WORD *)&v18[4] = 2048;
      *(void *)&v18[6] = currentThermalLevel;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Failed to get current thermal level. status=%u, using %llu for now", buf, 0x12u);
    }
  }
  else
  {
    if (state64 == self->_currentThermalLevel) {
      return;
    }
    long long v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = self->_currentThermalLevel;
      *(_DWORD *)buf = 134218240;
      *(void *)uint64_t v18 = v10;
      *(_WORD *)&v18[8] = 2048;
      *(void *)&v18[10] = state64;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "thermal levels changed - oldValue=%llu, newValue=%llu", buf, 0x16u);
    }

    self->_unint64_t currentThermalLevel = state64;
    os_unfair_recursive_lock_lock_with_options();
    long long v11 = (void *)[(NSHashTable *)self->_observers copy];
    os_unfair_recursive_lock_unlock();
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__ICEnvironmentMonitor__onQueue_updateThermalLevelWithToken___block_invoke;
    block[3] = &unk_1E5ACD4C8;
    id v14 = v11;
    long long v15 = self;
    id v7 = v11;
    dispatch_async(calloutQueue, block);
  }
}

void __61__ICEnvironmentMonitor__onQueue_updateThermalLevelWithToken___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 environmentMonitorDidChangeThermalLevel:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __77__ICEnvironmentMonitor__onQueue_updateNetworkReachabilityAndNotifyObservers___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 environmentMonitorDidChangeNetworkType:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (int64_t)currentThermalState
{
  int v2 = [(ICEnvironmentMonitor *)self currentThermalLevel];
  if (v2 <= 29)
  {
    int64_t v4 = 2;
    if (v2 != 20) {
      int64_t v4 = 0;
    }
    if (v2 == 10) {
      return 1;
    }
    else {
      return v4;
    }
  }
  else if (v2 == 30 || v2 == 40 || v2 == 50)
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

- (NSString)telephonyRegistrationStatus
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__39791;
  long long v10 = __Block_byref_object_dispose__39792;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ICEnvironmentMonitor_telephonyRegistrationStatus__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __51__ICEnvironmentMonitor_telephonyRegistrationStatus__block_invoke(uint64_t a1)
{
}

- (NSString)telephonyOperatorName
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__39791;
  long long v10 = __Block_byref_object_dispose__39792;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ICEnvironmentMonitor_telephonyOperatorName__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __45__ICEnvironmentMonitor_telephonyOperatorName__block_invoke(uint64_t a1)
{
}

- (BOOL)isWifiActive
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__ICEnvironmentMonitor_isWifiActive__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ICEnvironmentMonitor_isWifiActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 126);
  return result;
}

- (unint64_t)currentNetworkLinkQuality
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__ICEnvironmentMonitor_currentNetworkLinkQuality__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__ICEnvironmentMonitor_currentNetworkLinkQuality__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 144);
  return result;
}

- (int64_t)lastKnownNetworkType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ICEnvironmentMonitor_lastKnownNetworkType__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__ICEnvironmentMonitor_lastKnownNetworkType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 136);
  return result;
}

- (BOOL)isCharging
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__ICEnvironmentMonitor_isCharging__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__ICEnvironmentMonitor_isCharging__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 120);
  return result;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(NSHashTable *)self->_observers removeObject:v4];

  os_unfair_recursive_lock_unlock();
}

- (void)dealloc
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  networkPathEvaluator = self->_networkPathEvaluator;
  if (networkPathEvaluator)
  {
    [(NWPathEvaluator *)networkPathEvaluator removeObserver:self forKeyPath:@"path" context:ICEnvironmentMonitorNetworkPathEvaluatorContext];
    id v4 = self->_networkPathEvaluator;
    self->_networkPathEvaluator = 0;
  }
  [(CoreTelephonyClient *)self->_telephonyClient setDelegate:0];
  [(CWFInterface *)self->_wifiInterface invalidate];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_networksOfInterest;
  uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = (id)ICNOIKeysToObserve;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              [v9 removeObserver:self forKeyPath:*(void *)(*((void *)&v21 + 1) + 8 * v14++)];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [(NSMutableSet *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  [(NSMutableSet *)self->_networksOfInterest removeAllObjects];
  [(NWNetworkOfInterestManager *)self->_noiManager setDelegate:0];
  [(NWNetworkOfInterestManager *)self->_noiManager destroy];
  int batteryNotificationToken = self->_batteryNotificationToken;
  if (batteryNotificationToken != -1) {
    notify_cancel(batteryNotificationToken);
  }
  int powerSourceNotificationToken = self->_powerSourceNotificationToken;
  if (powerSourceNotificationToken != -1) {
    notify_cancel(powerSourceNotificationToken);
  }
  uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 removeObserver:self];

  int thermalNotificationToken = self->_thermalNotificationToken;
  if (thermalNotificationToken != -1) {
    notify_cancel(thermalNotificationToken);
  }
  v20.receiver = self;
  v20.super_class = (Class)ICEnvironmentMonitor;
  [(ICEnvironmentMonitor *)&v20 dealloc];
}

uint64_t __28__ICEnvironmentMonitor_init__block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updatePowerStateNotifyingObservers:", 1);
}

uint64_t __28__ICEnvironmentMonitor_init__block_invoke_40(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateThermalLevelWithToken:", a2);
}

@end