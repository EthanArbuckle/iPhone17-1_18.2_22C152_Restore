@interface SiriCoreNetworkManager
+ (id)connectionTypeForInterfaceName:(id)a3 isCellular:(BOOL)a4;
+ (id)sharedInstance;
+ (int64_t)connectionSubTypeForCellularInterface;
+ (int64_t)connectionTypeForInterface:(id)a3;
+ (void)_ifnameTypeForName:(char *)a3 isWiFi:(BOOL *)a4 isCellular:(BOOL *)a5;
+ (void)acquireDormancySuspendAssertion:(const void *)a3;
+ (void)getCarrierName:(id *)a3 signalStrength:(id *)a4 subscriptionCount:(id *)a5;
+ (void)releaseDormancySuspendAssertion:(void *)a3;
- (BOOL)_defaultWiFiLinkRecommendation;
- (BOOL)_getConnectionSuccessRate:(id)a3 hasMetric:(BOOL *)a4;
- (id)_init;
- (id)_wiFiManagerClient;
- (int64_t)_getConnectionTechnologyForCellularInterface;
- (int64_t)_reportCellularHistoricalQuality;
- (int64_t)_reportCellularInstantQuality;
- (int64_t)_reportWiFiHistoricalQuality;
- (int64_t)_reportWiFiInstantQuality;
- (int64_t)anyNetworkQuality;
- (int64_t)cellularNetworkQuality;
- (int64_t)wifiNetworkQuality;
- (void)_dataServiceDescriptorUpdate;
- (void)_dataSubscriptionContextChange:(id)a3;
- (void)_getCarrierName:(id *)a3;
- (void)_getLinkRecommendationSafe:(BOOL)a3 recommendation:(id)a4;
- (void)_pathUpdated:(id)a3;
- (void)_serviceSubscriptionInfoUpdate;
- (void)_signalStrengthChange:(id)a3;
- (void)_signalStrengthUpdate;
- (void)_stopMonitoringNetwork;
- (void)_subscribeToLinkRecommendations:(id)a3;
- (void)acquireWiFiAssertion:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)deRegisterWithWirelessCoexManager;
- (void)dealloc;
- (void)forceFastDormancy;
- (void)getLinkRecommendation:(BOOL)a3 recommendation:(id)a4;
- (void)getNetworkPerformanceFeed;
- (void)getQualityReport:(id)a3;
- (void)getSignalStrength:(id *)a3 subscriptionCount:(unint64_t *)a4;
- (void)preferredDataSimChanged:(id)a3;
- (void)proximityRecomendationWithCompletion:(id)a3;
- (void)registerWithWirelessCoexManager;
- (void)releaseWiFiAssertion;
- (void)removeObserver:(id)a3;
- (void)resetLinkMetrics;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)startMonitoringNetworkForHost:(id)a3;
- (void)stopMonitoringNetwork;
@end

@implementation SiriCoreNetworkManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetricsInfo, 0);
  objc_storeStrong((id *)&self->_linkRecommendationInfo, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_lastSignalStrength, 0);
  objc_storeStrong((id *)&self->_subscriptionSlotTwoStatus, 0);
  objc_storeStrong((id *)&self->_subscriptionSlotOneStatus, 0);
  objc_storeStrong((id *)&self->_dataServiceDescriptor, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_wiFiManagerClient, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)_getConnectionSuccessRate:(id)a3 hasMetric:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (BOOL)_defaultWiFiLinkRecommendation
{
  return AFIsNano() ^ 1;
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x263F28390];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28390], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[SiriCoreNetworkManager signalStrengthChanged:info:]";
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (v6)
  {
    if (v7)
    {
      os_unfair_lock_lock(&self->_ctLock);
      int64_t lastDataSubscriptionSlot = self->_lastDataSubscriptionSlot;
      os_unfair_lock_unlock(&self->_ctLock);
      if ([v6 slotID] == lastDataSubscriptionSlot) {
        [(SiriCoreNetworkManager *)self _signalStrengthChange:v7];
      }
    }
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)*MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v9;
      int v14 = 136315650;
      v15 = "-[SiriCoreNetworkManager simStatusDidChange:status:]";
      __int16 v16 = 2048;
      uint64_t v17 = [v6 slotID];
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_DEFAULT, "%s SIM Slot %ld - Status: %@", (uint8_t *)&v14, 0x20u);
    }
    os_unfair_lock_lock(&self->_ctLock);
    if ([v6 slotID] == 1)
    {
      v11 = (NSString *)[v8 copy];
      subscriptionSlotOneStatus = self->_subscriptionSlotOneStatus;
      self->_subscriptionSlotOneStatus = v11;
    }
    else
    {
      if ([v6 slotID] != 2)
      {
LABEL_10:
        os_unfair_lock_unlock(&self->_ctLock);
        [(SiriCoreNetworkManager *)self _serviceSubscriptionInfoUpdate];
        [(SiriCoreNetworkManager *)self _dataServiceDescriptorUpdate];
        goto LABEL_11;
      }
      v13 = (NSString *)[v8 copy];
      subscriptionSlotOneStatus = self->_subscriptionSlotTwoStatus;
      self->_subscriptionSlotTwoStatus = v13;
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (void)carrierBundleChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v10 = "-[SiriCoreNetworkManager carrierBundleChange:]";
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_ctLock);
  int64_t lastDataSubscriptionSlot = self->_lastDataSubscriptionSlot;
  os_unfair_lock_unlock(&self->_ctLock);
  if (v4 && lastDataSubscriptionSlot)
  {
    if ([v4 slotID] == lastDataSubscriptionSlot) {
      [(SiriCoreNetworkManager *)self _dataSubscriptionContextChange:v4];
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__SiriCoreNetworkManager_carrierBundleChange___block_invoke;
    block[3] = &unk_26443AF18;
    block[4] = self;
    dispatch_async(queue, block);
  }
  [(SiriCoreNetworkManager *)self _dataServiceDescriptorUpdate];
}

uint64_t __46__SiriCoreNetworkManager_carrierBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SiriCoreNetworkManager_carrierBundleChange___block_invoke_2;
  v4[3] = &unk_26443AD50;
  v4[4] = v1;
  return [v2 getCurrentDataSubscriptionContext:v4];
}

uint64_t __46__SiriCoreNetworkManager_carrierBundleChange___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(result + 32) _dataSubscriptionContextChange:a2];
  }
  return result;
}

- (void)preferredDataSimChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28390];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28390], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SiriCoreNetworkManager preferredDataSimChanged:]";
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(SiriCoreNetworkManager *)self _dataSubscriptionContextChange:v4];
  [(SiriCoreNetworkManager *)self _dataServiceDescriptorUpdate];
}

- (void)_signalStrengthChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28390];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28390], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[SiriCoreNetworkManager _signalStrengthChange:]";
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  os_unfair_lock_lock(&self->_ctLock);
  int v6 = [v4 bars];
  id v7 = (NSNumber *)[v6 copy];
  lastSignalStrength = self->_lastSignalStrength;
  self->_lastSignalStrength = v7;

  os_unfair_lock_unlock(&self->_ctLock);
}

- (void)_signalStrengthUpdate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SiriCoreNetworkManager _signalStrengthUpdate]";
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke_2;
  v4[3] = &unk_26443AD50;
  v4[4] = v1;
  return [v2 getCurrentDataSubscriptionContext:v4];
}

void __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      int v10 = *MEMORY[0x263F28350];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[SiriCoreNetworkManager _signalStrengthUpdate]_block_invoke";
        __int16 v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_DEFAULT, "%s Error getting current Data Subscription Context: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 64);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke_3;
    v11[3] = &unk_26443AD28;
    v11[4] = v8;
    [v9 getSignalStrengthInfo:v5 completion:v11];
  }
}

void __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      int v9 = "-[SiriCoreNetworkManager _signalStrengthUpdate]_block_invoke_3";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Error getting Signal Strength: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _signalStrengthChange:v5];
  }
}

- (void)_serviceSubscriptionInfoUpdate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SiriCoreNetworkManager _serviceSubscriptionInfoUpdate]";
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SiriCoreNetworkManager__serviceSubscriptionInfoUpdate__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __56__SiriCoreNetworkManager__serviceSubscriptionInfoUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SiriCoreNetworkManager__serviceSubscriptionInfoUpdate__block_invoke_2;
  v4[3] = &unk_26443AD00;
  v4[4] = v1;
  return [v2 getSubscriptionInfo:v4];
}

void __56__SiriCoreNetworkManager__serviceSubscriptionInfoUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      __int16 v14 = *MEMORY[0x263F28350];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "-[SiriCoreNetworkManager _serviceSubscriptionInfoUpdate]_block_invoke_2";
        __int16 v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_21CBF7000, v14, OS_LOG_TYPE_DEFAULT, "%s Error getting Subscription Info: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v8 = [v5 subscriptions];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      LODWORD(v11) = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v11 = v11
              + ([*(id *)(*((void *)&v15 + 1) + 8 * i) isSimHidden] ^ 1);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
    *(void *)(*(void *)(a1 + 32) + 120) = v11;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  }
}

- (void)_dataServiceDescriptorUpdate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SiriCoreNetworkManager _dataServiceDescriptorUpdate]";
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SiriCoreNetworkManager__dataServiceDescriptorUpdate__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__SiriCoreNetworkManager__dataServiceDescriptorUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SiriCoreNetworkManager__dataServiceDescriptorUpdate__block_invoke_2;
  v4[3] = &unk_26443ACD8;
  v4[4] = v1;
  return [v2 getCurrentDataServiceDescriptor:v4];
}

void __54__SiriCoreNetworkManager__dataServiceDescriptorUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[SiriCoreNetworkManager _dataServiceDescriptorUpdate]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Error getting current Data Service Descriptor: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
    uint64_t v8 = [v5 copy];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  }
}

- (void)_dataSubscriptionContextChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[SiriCoreNetworkManager _dataSubscriptionContextChange:]";
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__SiriCoreNetworkManager__dataSubscriptionContextChange___block_invoke;
    v7[3] = &unk_26443AF40;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __57__SiriCoreNetworkManager__dataSubscriptionContextChange___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(v3 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SiriCoreNetworkManager__dataSubscriptionContextChange___block_invoke_2;
  v6[3] = &unk_26443ACB0;
  v6[4] = v3;
  id v7 = v4;
  [v5 copyCarrierBundleValue:v7 key:@"CarrierName" bundleType:v2 completion:v6];
}

uint64_t __57__SiriCoreNetworkManager__dataSubscriptionContextChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t isKindOfClass = a2;
  uint64_t v6 = isKindOfClass;
  if (!a3)
  {
    long long v16 = (void *)isKindOfClass;
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = (uint64_t)v16;
    if (isKindOfClass)
    {
      id v7 = v16;
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
      uint64_t v8 = [v7 copy];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 128);
      *(void *)(v9 + 128) = v8;

      *(void *)(*(void *)(a1 + 32) + 72) = [*(id *)(a1 + 40) slotID];
      if ([*(id *)(a1 + 40) slotID] == 1)
      {
        uint64_t v11 = 88;
      }
      else
      {
        if ([*(id *)(a1 + 40) slotID] != 2)
        {
LABEL_8:
          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));

          uint64_t v6 = (uint64_t)v16;
          goto LABEL_9;
        }
        uint64_t v11 = 96;
      }
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = (id)*MEMORY[0x263F030B8];
      id v14 = *(void **)(v12 + v11);
      *(void *)(v12 + v11) = v13;

      goto LABEL_8;
    }
  }
LABEL_9:

  return MEMORY[0x270F9A758](isKindOfClass, v6);
}

- (void)resetLinkMetrics
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SiriCoreNetworkManager_resetLinkMetrics__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__SiriCoreNetworkManager_resetLinkMetrics__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 136)) {
    return [*(id *)(v1 + 168) resetLinkMetrics];
  }
  return result;
}

- (void)proximityRecomendationWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SiriCoreNetworkManager_proximityRecomendationWithCompletion___block_invoke;
  block[3] = &unk_26443AC88;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __63__SiriCoreNetworkManager_proximityRecomendationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

- (void)getLinkRecommendation:(BOOL)a3 recommendation:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__SiriCoreNetworkManager_getLinkRecommendation_recommendation___block_invoke;
    block[3] = &unk_26443AC60;
    void block[4] = self;
    id v10 = v6;
    BOOL v11 = a3;
    dispatch_async(queue, block);
  }
}

void __63__SiriCoreNetworkManager_getLinkRecommendation_recommendation___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2[17])
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __63__SiriCoreNetworkManager_getLinkRecommendation_recommendation___block_invoke_31;
    v5[3] = &unk_26443AC38;
    id v6 = *(id *)(a1 + 40);
    [v2 _getLinkRecommendationSafe:v3 recommendation:v5];
  }
  else
  {
    id v4 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[SiriCoreNetworkManager getLinkRecommendation:recommendation:]_block_invoke";
      _os_log_error_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_ERROR, "%s iRAT client not registered", buf, 0xCu);
      v2 = *(void **)(a1 + 32);
    }
    [v2 _defaultBTLinkRecommendation];
    [*(id *)(a1 + 32) _defaultWiFiLinkRecommendation];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __63__SiriCoreNetworkManager_getLinkRecommendation_recommendation___block_invoke_31(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[SiriCoreNetworkManager getLinkRecommendation:recommendation:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_DEFAULT, "%s %d , %d", (uint8_t *)&v8, 0x18u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

- (void)deRegisterWithWirelessCoexManager
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SiriCoreNetworkManager_deRegisterWithWirelessCoexManager__block_invoke;
  block[3] = &unk_26443AF18;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __59__SiriCoreNetworkManager_deRegisterWithWirelessCoexManager__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    [v2 unregisterClient];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  }
}

- (void)registerWithWirelessCoexManager
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SiriCoreNetworkManager_registerWithWirelessCoexManager__block_invoke;
  block[3] = &unk_26443AF18;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __57__SiriCoreNetworkManager_registerWithWirelessCoexManager__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 136))
  {
    WRM_iRATInterfaceClass_2574 = (objc_class *)getWRM_iRATInterfaceClass_2574();
    if (WRM_iRATInterfaceClass_2574)
    {
      id v3 = objc_alloc_init(WRM_iRATInterfaceClass_2574);
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 136);
      *(void *)(v4 + 136) = v3;

      id v6 = *MEMORY[0x263F28350];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 136);
        int v14 = 136315394;
        uint64_t v15 = "-[SiriCoreNetworkManager registerWithWirelessCoexManager]_block_invoke";
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v14, 0x16u);
      }
      [*(id *)(*(void *)(a1 + 32) + 136) registerClient:22 queue:*(void *)(*(void *)(a1 + 32) + 8)];
      int v8 = -[SiriCoreLinkRecommendationInfo initWithPreferences:wifiPreference:timeTaken:metrics:]([SiriCoreLinkRecommendationInfo alloc], "initWithPreferences:wifiPreference:timeTaken:metrics:", [*(id *)(a1 + 32) _defaultBTLinkRecommendation], objc_msgSend(*(id *)(a1 + 32), "_defaultWiFiLinkRecommendation"), 0, 0.0);
      uint64_t v9 = *(void *)(a1 + 32);
      __int16 v10 = *(void **)(v9 + 168);
      *(void *)(v9 + 168) = v8;

      int v11 = *(id **)(a1 + 32);
      id v12 = v11[21];
      [v11 _subscribeToLinkRecommendations:v12];
      *(void *)(*(void *)(a1 + 32) + 152) = 1;
    }
    else
    {
      int v13 = *MEMORY[0x263F28350];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        uint64_t v15 = "-[SiriCoreNetworkManager registerWithWirelessCoexManager]_block_invoke";
        _os_log_error_impl(&dword_21CBF7000, v13, OS_LOG_TYPE_ERROR, "%s Unable to find iRATInterface class", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)_getLinkRecommendationSafe:(BOOL)a3 recommendation:(id)a4
{
  BOOL v4 = a3;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__2589;
  v51 = __Block_byref_object_dispose__2590;
  v52 = self->_linkRecommendationInfo;
  uint64_t v7 = [(SiriCoreLinkRecommendationInfo *)v52 btPreference];
  uint64_t v8 = [(id)v48[5] wifiPreference];
  if ((AFIsNano() & 1) != 0 && !self->_iRATCallInProgress)
  {
    uint64_t v9 = [MEMORY[0x263F08AB0] processInfo];
    [v9 systemUptime];
    uint64_t v11 = v10;

    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    v46[3] = 0;
    id v12 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = @"trying";
      if (v4) {
        int v13 = @"retrying";
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SiriCoreNetworkManager _getLinkRecommendationSafe:recommendation:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unint64_t v14 = 1;
    char v54 = 1;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    char v45 = 0;
    self->_iRATCallInProgress = 1;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    unint64_t iRATCallNumber = self->_iRATCallNumber;
    v43[3] = iRATCallNumber;
    if (iRATCallNumber + 1 > 1) {
      unint64_t v14 = iRATCallNumber + 1;
    }
    self->_unint64_t iRATCallNumber = v14;
    [(SiriCoreLinkRecommendationInfo *)self->_linkRecommendationInfo setLinkMetrics:0];
    __int16 v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    uint64_t v17 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v17 logEventWithType:1011 context:0];

    interface = self->_interface;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke;
    v36[3] = &unk_26443ABC0;
    v36[4] = self;
    uint64_t v42 = v11;
    v38 = v46;
    v39 = &v47;
    v40 = buf;
    v41 = v44;
    v19 = v16;
    v37 = v19;
    [(WRM_iRATInterface *)interface getProximityLinkRecommendation:v4 recommendation:v36];
    dispatch_time_t v20 = dispatch_time(0, 1000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke_28;
    block[3] = &unk_26443ABE8;
    v33 = v43;
    v34 = v46;
    uint64_t v35 = v11;
    void block[4] = self;
    v32 = v19;
    v22 = v19;
    dispatch_after(v20, queue, block);
    v23 = self->_queue;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke_29;
    v24[3] = &unk_26443AC10;
    v27 = buf;
    v28 = v44;
    v29 = v46;
    BOOL v30 = v4;
    v26 = &v47;
    v24[4] = self;
    id v25 = v6;
    dispatch_group_notify(v22, v23, v24);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v46, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v7, v8);
  }
  _Block_object_dispose(&v47, 8);
}

void __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (os_log_t *)MEMORY[0x263F28350];
  id v5 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[SiriCoreNetworkManager _getLinkRecommendationSafe:recommendation:]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 144))
  {
    id v6 = [MEMORY[0x263F08AB0] processInfo];
    [v6 systemUptime];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7 - *(double *)(a1 + 80);

    int v8 = [v3 count];
    uint64_t v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[SiriCoreNetworkManager _getLinkRecommendationSafe:recommendation:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = v8;
      _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_DEFAULT, "%s count of recommendations is %d", buf, 0x12u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v15, "RecommendationType", (void)v19) == 2)
          {
            __int16 v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            uint64_t v17 = [v15 metrics];
            [v16 setLinkMetrics:v17];
          }
          if ([v15 linkIsRecommended]
            && [v15 linkRecommendationIsValid]
            && [v15 RecommendationType])
          {
            if ([v15 RecommendationType] == 1) {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
            }
            if ([v15 RecommendationType] == 2) {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
    uint64_t v18 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v18 logEventWithType:1012 context:0];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke_28(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(void *)(v2 + 24)) {
    *(void *)(v2 + 24) = 1;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 144) && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(void *)(v3 + 152))
  {
    *(unsigned char *)(v3 + 144) = 0;
    BOOL v4 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[SiriCoreNetworkManager _getLinkRecommendationSafe:recommendation:]_block_invoke";
      _os_log_error_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_ERROR, "%s getLinkRecommendation timedout", (uint8_t *)&v8, 0xCu);
    }
    id v5 = [MEMORY[0x263F08AB0] processInfo];
    [v5 systemUptime];
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6 - *(double *)(a1 + 64);

    double v7 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v7 logEventWithType:1013 context:0];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

uint64_t __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke_29(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setBTPreference:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setWiFiPreference:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTimeTaken:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = [MEMORY[0x263F08AB0] processInfo];
    [v2 systemUptime];
    *(void *)(*(void *)(a1 + 32) + 160) = v3;
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 160) = 0;
  }
  BOOL v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)_subscribeToLinkRecommendations:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  interface = self->_interface;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SiriCoreNetworkManager__subscribeToLinkRecommendations___block_invoke;
  v7[3] = &unk_26443AB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WRM_iRATInterface *)interface subscribeStandaloneLinkRecommendation:v7];
}

void __58__SiriCoreNetworkManager__subscribeToLinkRecommendations___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315906;
    uint64_t v13 = "-[SiriCoreNetworkManager _subscribeToLinkRecommendations:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 1024;
    int v17 = a3;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_DEFAULT, "%s Received an asynchronous recommendation type %d, linkType %d, value %@", (uint8_t *)&v12, 0x22u);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  if (a2 == 1)
  {
    if (a3 == 1)
    {
      uint64_t v9 = 1;
    }
    else
    {
      if (a3)
      {
LABEL_9:
        uint64_t v10 = [MEMORY[0x263F08AB0] processInfo];
        [v10 systemUptime];
        *(void *)(*(void *)(a1 + 32) + 160) = v11;

        goto LABEL_10;
      }
      uint64_t v9 = 0;
    }
    [*(id *)(a1 + 40) setWiFiPreference:v9];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)acquireWiFiAssertion:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SiriCoreNetworkManager_acquireWiFiAssertion___block_invoke;
  v4[3] = &unk_26443AB70;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __47__SiriCoreNetworkManager_acquireWiFiAssertion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _wiFiManagerClient];
  [v2 acquireWiFiAssertion:*(void *)(a1 + 40)];
}

- (void)releaseWiFiAssertion
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SiriCoreNetworkManager_releaseWiFiAssertion__block_invoke;
  block[3] = &unk_26443AF18;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __46__SiriCoreNetworkManager_releaseWiFiAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) releaseWiFiAssertion];
}

- (void)forceFastDormancy
{
}

void __43__SiriCoreNetworkManager_forceFastDormancy__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[SiriCoreNetworkManager forceFastDormancy]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v0, OS_LOG_TYPE_DEFAULT, "%s Forcing fast dormancy", (uint8_t *)&v3, 0xCu);
  }
  uint64_t v1 = dispatch_get_global_queue(21, 0);
  id v2 = (const void *)_CTServerConnectionCreateOnTargetQueue();

  if (v2)
  {
    _CTServerForceFastDormancy();
    CFRelease(v2);
  }
}

- (int64_t)_getConnectionTechnologyForCellularInterface
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_ctLock = &self->_ctLock;
  os_unfair_lock_lock(&self->_ctLock);
  id v4 = (void *)[(CTServiceDescriptor *)self->_dataServiceDescriptor copy];
  os_unfair_lock_unlock(p_ctLock);
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28350];
  if (v4)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v14 = 0;
    id v7 = [(CoreTelephonyClient *)coreTelephonyClient getCurrentRat:v4 error:&v14];
    id v8 = (__CFString *)v14;
    if (v8)
    {
      uint64_t v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v16 = "-[SiriCoreNetworkManager _getConnectionTechnologyForCellularInterface]";
        __int16 v17 = 2112;
        __int16 v18 = v8;
        _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_DEFAULT, "%s Error getting current Radio Access Technology: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BE0]])
  {
    int64_t v10 = 2004;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BD8]])
  {
    int64_t v10 = 2005;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02C10]])
  {
    int64_t v10 = 2006;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BE8]])
  {
    int64_t v10 = 2007;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BF0]])
  {
    int64_t v10 = 2008;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BB8]])
  {
    int64_t v10 = 2002;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BC0]])
  {
    int64_t v10 = 2009;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BC8]])
  {
    int64_t v10 = 2010;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BD0]])
  {
    int64_t v10 = 2011;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02C18]])
  {
    int64_t v10 = 2012;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02BF8]])
  {
    int64_t v10 = 2003;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02C08]])
  {
    int64_t v10 = 2013;
  }
  else if ([(__CFString *)v7 isEqualToString:*MEMORY[0x263F02C00]])
  {
    int64_t v10 = 2014;
  }
  else
  {
    int64_t v10 = 2000;
  }
  uint64_t v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = @"WWAN";
    if (v7) {
      int v12 = v7;
    }
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[SiriCoreNetworkManager _getConnectionTechnologyForCellularInterface]";
    __int16 v17 = 2112;
    __int16 v18 = v12;
    _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Current Radio Access Technology: %@", buf, 0x16u);
  }

  return v10;
}

- (void)_getCarrierName:(id *)a3
{
  p_ctLock = &self->_ctLock;
  os_unfair_lock_lock(&self->_ctLock);
  int64_t lastDataSubscriptionSlot = self->_lastDataSubscriptionSlot;
  if (lastDataSubscriptionSlot == 1)
  {
    if ([(NSString *)self->_subscriptionSlotOneStatus isEqualToString:*MEMORY[0x263F030B8]])
    {
LABEL_6:
      id v8 = (id)[(NSString *)self->_carrierName copy];
      goto LABEL_8;
    }
    int64_t lastDataSubscriptionSlot = self->_lastDataSubscriptionSlot;
  }
  if (lastDataSubscriptionSlot == 2
    && [(NSString *)self->_subscriptionSlotTwoStatus isEqualToString:*MEMORY[0x263F030B8]])
  {
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_8:
  os_unfair_lock_unlock(p_ctLock);
  id v7 = v8;
  if (a3)
  {
    *a3 = v8;
    id v7 = v8;
  }
}

- (void)getSignalStrength:(id *)a3 subscriptionCount:(unint64_t *)a4
{
  p_ctLock = &self->_ctLock;
  os_unfair_lock_lock(&self->_ctLock);
  id v10 = (id)[(NSNumber *)self->_lastSignalStrength copy];
  unint64_t subscriptionCount = self->_subscriptionCount;
  os_unfair_lock_unlock(p_ctLock);
  if (a4) {
    *a4 = subscriptionCount;
  }
  uint64_t v9 = v10;
  if (a3)
  {
    *a3 = v10;
    uint64_t v9 = v10;
  }
}

- (int64_t)_reportWiFiHistoricalQuality
{
  if (!self->_hasSymptomsBasedHistoricalWiFiQuality) {
    return 0;
  }
  if (self->_symptomsBasedHistoricalWiFiQualityIsGood) {
    return 1;
  }
  return 2;
}

- (int64_t)_reportWiFiInstantQuality
{
  if (!self->_hasSymptomsBasedInstantWiFiQuality) {
    return 0;
  }
  if (self->_symptomsBasedInstantWiFiQualityIsGood) {
    return 1;
  }
  return 2;
}

- (int64_t)_reportCellularHistoricalQuality
{
  if (!self->_hasSymptomsBasedHistoricalCellQuality) {
    return 0;
  }
  if (self->_symptomsBasedHistoricalCellQualityIsGood) {
    return 1;
  }
  return 2;
}

- (int64_t)_reportCellularInstantQuality
{
  if (!self->_hasSymptomsBasedInstantCellQuality) {
    return 0;
  }
  if (self->_symptomsBasedInstantCellQualityIsGood) {
    return 1;
  }
  return 2;
}

- (void)getQualityReport:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SiriCoreNetworkManager_getQualityReport___block_invoke;
  v7[3] = &unk_26443AB48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__SiriCoreNetworkManager_getQualityReport___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(SiriCoreNetworkQualityReport);
  -[SiriCoreNetworkQualityReport setCellularInstant:](v2, "setCellularInstant:", [*(id *)(a1 + 32) _reportCellularInstantQuality]);
  -[SiriCoreNetworkQualityReport setCellularHistorical:](v2, "setCellularHistorical:", [*(id *)(a1 + 32) _reportCellularHistoricalQuality]);
  -[SiriCoreNetworkQualityReport setWifiInstant:](v2, "setWifiInstant:", [*(id *)(a1 + 32) _reportWiFiInstantQuality]);
  -[SiriCoreNetworkQualityReport setWifiHistorical:](v2, "setWifiHistorical:", [*(id *)(a1 + 32) _reportWiFiHistoricalQuality]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int64_t)anyNetworkQuality
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SiriCoreNetworkManager_anyNetworkQuality__block_invoke;
  v5[3] = &unk_26443AB20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SiriCoreNetworkManager_anyNetworkQuality__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 50)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 51);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  uint64_t v3 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(void *)(v3 + 24))
  {
    uint64_t v4 = *(void *)(result + 32);
    if (*(unsigned char *)(v4 + 48)) {
      uint64_t v5 = *(unsigned __int8 *)(v4 + 49);
    }
    else {
      uint64_t v5 = 0;
    }
    *(void *)(v3 + 24) = v5;
  }
  return result;
}

- (int64_t)wifiNetworkQuality
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SiriCoreNetworkManager_wifiNetworkQuality__block_invoke;
  v5[3] = &unk_26443AB20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SiriCoreNetworkManager_wifiNetworkQuality__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 50)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 51);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)cellularNetworkQuality
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SiriCoreNetworkManager_cellularNetworkQuality__block_invoke;
  v5[3] = &unk_26443AB20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__SiriCoreNetworkManager_cellularNetworkQuality__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 48)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 49);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (void)getNetworkPerformanceFeed
{
  int64_t v3 = [MEMORY[0x263F28548] sharedObserver];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SiriCoreNetworkManager_getNetworkPerformanceFeed__block_invoke;
  v4[3] = &unk_26443AAF8;
  v4[4] = self;
  [v3 getCurrentConditionWithCompletion:v4];
}

void __51__SiriCoreNetworkManager_getNetworkPerformanceFeed__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2 > 1)
  {
    uint64_t v4 = (void *)*MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      uint64_t v6 = _AFMemoryPressureConditionGetName();
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "-[SiriCoreNetworkManager getNetworkPerformanceFeed]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Memory condition (%@) not suited for Symptoms feedback.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int64_t v3 = *(NSObject **)(v2 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SiriCoreNetworkManager_getNetworkPerformanceFeed__block_invoke_2;
    block[3] = &unk_26443AF18;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __51__SiriCoreNetworkManager_getNetworkPerformanceFeed__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getNetworkPerformanceFeed];
}

- (void)stopMonitoringNetwork
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SiriCoreNetworkManager_stopMonitoringNetwork__block_invoke;
  block[3] = &unk_26443AF18;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __47__SiriCoreNetworkManager_stopMonitoringNetwork__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopMonitoringNetwork];
}

- (void)_stopMonitoringNetwork
{
  if (self->_pathEvaluator)
  {
    nw_path_evaluator_cancel();
    pathEvaluator = self->_pathEvaluator;
    self->_pathEvaluator = 0;
  }
}

- (void)startMonitoringNetworkForHost:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SiriCoreNetworkManager_startMonitoringNetworkForHost___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__SiriCoreNetworkManager_startMonitoringNetworkForHost___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    if (v2)
    {
      int64_t v3 = *MEMORY[0x263F28350];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v8 = "-[SiriCoreNetworkManager startMonitoringNetworkForHost:]_block_invoke";
        _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
        uint64_t v2 = *(void **)(a1 + 40);
      }
      nw_endpoint_t host = nw_endpoint_create_host((const char *)[v2 UTF8String], "443");
      evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_copyWeak(&v6, (id *)buf);
      nw_path_evaluator_set_update_handler();
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), evaluator_for_endpoint);
      [*(id *)(a1 + 32) _serviceSubscriptionInfoUpdate];
      [*(id *)(a1 + 32) _signalStrengthUpdate];
      objc_destroyWeak(&v6);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __56__SiriCoreNetworkManager_startMonitoringNetworkForHost___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _pathUpdated:v3];
}

- (void)_pathUpdated:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    nw_path_status_t status = nw_path_get_status(v4);
    BOOL v7 = nw_path_uses_interface_type(v5, nw_interface_type_cellular);
  }
  else
  {
    BOOL v7 = 0;
    nw_path_status_t status = nw_path_status_invalid;
  }
  if (status != self->_pathStatus || self->_pathUsesCellular != v7)
  {
    id v8 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v31 = "-[SiriCoreNetworkManager _pathUpdated:]";
      __int16 v32 = 1024;
      nw_path_status_t v33 = status;
      __int16 v34 = 1024;
      BOOL v35 = v7;
      _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_DEFAULT, "%s status %d, usesCellular %d", buf, 0x18u);
    }
    char v9 = status != nw_path_status_satisfied || v7;
    if (!self->_pathUsesCellular || (v9 & 1) != 0)
    {
      if (self->_pathUsesCellular || !v7) {
        goto LABEL_33;
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      __int16 v10 = self->_observers;
      uint64_t v16 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "networkManagerLostNonWWANConnectivity:", self, (void)v20);
          }
          uint64_t v17 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v17);
      }
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      __int16 v10 = self->_observers;
      uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * j) networkManagerNonWWANDidBecomeAvailable:self];
          }
          uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v12);
      }
    }

LABEL_33:
    self->_pathStatus = status;
    self->_pathUsesCellular = v7;
  }
}

- (id)_wiFiManagerClient
{
  wiFiManagerClient = self->_wiFiManagerClient;
  if (!wiFiManagerClient)
  {
    id v4 = objc_alloc_init(SiriCoreWiFiManagerClient);
    uint64_t v5 = self->_wiFiManagerClient;
    self->_wiFiManagerClient = v4;

    wiFiManagerClient = self->_wiFiManagerClient;
  }

  return wiFiManagerClient;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SiriCoreNetworkManager_removeObserver___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __41__SiriCoreNetworkManager_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (!result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _stopMonitoringNetwork];
  }
  return result;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SiriCoreNetworkManager_addObserver___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __38__SiriCoreNetworkManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v7 = "-[SiriCoreNetworkManager dealloc]";
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (self->_pathEvaluator) {
    nw_path_evaluator_cancel();
  }
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient) {
    [(CoreTelephonyClient *)coreTelephonyClient setDelegate:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)SiriCoreNetworkManager;
  [(SiriCoreNetworkManager *)&v5 dealloc];
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)SiriCoreNetworkManager;
  uint64_t v2 = [(SiriCoreNetworkManager *)&v12 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("SiriCoreNetworkManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:1];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v2->_pathStatus = 0;
    v2->_ctLock._os_unfair_lock_opaque = 0;
    v2->_int64_t lastDataSubscriptionSlot = 0;
    uint64_t v9 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v2->_queue];
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v9;

    [(CoreTelephonyClient *)v2->_coreTelephonyClient setDelegate:v2];
    [(SiriCoreNetworkManager *)v2 carrierBundleChange:0];
  }
  return v2;
}

+ (void)releaseDormancySuspendAssertion:(void *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "+[SiriCoreNetworkManager releaseDormancySuspendAssertion:]";
      _os_log_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Released dormancy suspension assertion.", (uint8_t *)&v5, 0xCu);
    }
    CFRelease(a3);
  }
}

+ (void)acquireDormancySuspendAssertion:(const void *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v3 = *a3;
    id v4 = (os_log_t *)MEMORY[0x263F28350];
    int v5 = *MEMORY[0x263F28350];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        int v16 = 136315138;
        uint64_t v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
        _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Already acquired.", (uint8_t *)&v16, 0xCu);
      }
      return;
    }
    if (v6)
    {
      int v16 = 136315138;
      uint64_t v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Suspend Dormancy", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v8 = dispatch_get_global_queue(21, 0);
    uint64_t v9 = (const void *)_CTServerConnectionCreateOnTargetQueue();

    if (v9)
    {
      uint64_t v10 = _CTServerConnectionDormancySuspendAssertionCreateWithExpirationCB();

      os_log_t v11 = *v4;
      BOOL v12 = os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          int v16 = 136315650;
          uint64_t v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
          __int16 v18 = 1024;
          int v19 = v10;
          __int16 v20 = 1024;
          int v21 = HIDWORD(v10);
          uint64_t v13 = "%s Failed to acquire the dormancy suspend assertion (%i, %i)";
          id v14 = v11;
          uint32_t v15 = 24;
LABEL_15:
          _os_log_impl(&dword_21CBF7000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
        }
      }
      else if (v12)
      {
        int v16 = 136315138;
        uint64_t v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
        uint64_t v13 = "%s Acquired dormany suspension assertion.";
        id v14 = v11;
        uint32_t v15 = 12;
        goto LABEL_15;
      }
      CFRelease(v9);
    }
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      uint64_t v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
      _os_log_error_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_ERROR, "%s Assertion ref should not be nil", (uint8_t *)&v16, 0xCu);
    }
  }
}

void __58__SiriCoreNetworkManager_acquireDormancySuspendAssertion___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v0, OS_LOG_TYPE_DEFAULT, "%s Dormancy Suspend Assertion auto expired.", (uint8_t *)&v1, 0xCu);
  }
}

+ (int64_t)connectionTypeForInterface:(id)a3
{
  if (!a3) {
    return 0;
  }
  __int16 v5 = 0;
  int64_t result = [a3 UTF8String];
  if (result)
  {
    [a1 _ifnameTypeForName:result isWiFi:(char *)&v5 + 1 isCellular:&v5];
    if (HIBYTE(v5)) {
      int64_t result = 1000;
    }
    else {
      int64_t result = 0;
    }
    if ((_BYTE)v5) {
      return [a1 connectionSubTypeForCellularInterface];
    }
  }
  return result;
}

+ (id)connectionTypeForInterfaceName:(id)a3 isCellular:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v4)
  {
    uint64_t v8 = [a1 connectionSubTypeForCellularInterface];
  }
  else if (v6 && (char v12 = 0, (v9 = [v6 UTF8String]) != 0))
  {
    [a1 _ifnameTypeForName:v9 isWiFi:&v12 isCellular:0];
    if (v12) {
      uint64_t v8 = 1000;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v10 = [[SiriCoreConnectionType alloc] initWithTechnology:v8];

  return v10;
}

+ (void)getCarrierName:(id *)a3 signalStrength:(id *)a4 subscriptionCount:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  uint64_t v8 = +[SiriCoreNetworkManager sharedInstance];
  id v18 = 0;
  [v8 getSignalStrength:&v18 subscriptionCount:&v19];
  id v9 = v18;

  uint64_t v10 = +[SiriCoreNetworkManager sharedInstance];
  id v17 = 0;
  [v10 _getCarrierName:&v17];
  id v11 = v17;

  if (a3) {
    *a3 = v11;
  }
  if (a4) {
    *a4 = v9;
  }
  if (a5)
  {
    *a5 = [NSNumber numberWithUnsignedInteger:v19];
  }
  char v12 = (void *)*MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = NSNumber;
    uint64_t v14 = v19;
    uint32_t v15 = v12;
    int v16 = [v13 numberWithUnsignedInteger:v14];
    *(_DWORD *)buf = 136315906;
    int v21 = "+[SiriCoreNetworkManager getCarrierName:signalStrength:subscriptionCount:]";
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    long long v27 = v16;
    _os_log_impl(&dword_21CBF7000, v15, OS_LOG_TYPE_DEFAULT, "%s Carrier Name: %@, Signal Strength: %@, Subscription count: %@", buf, 0x2Au);
  }
}

+ (int64_t)connectionSubTypeForCellularInterface
{
  uint64_t v2 = +[SiriCoreNetworkManager sharedInstance];
  int64_t v3 = [v2 _getConnectionTechnologyForCellularInterface];

  return v3;
}

+ (void)_ifnameTypeForName:(char *)a3 isWiFi:(BOOL *)a4 isCellular:(BOOL *)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    int v7 = socket(2, 2, 0);
    long long v9 = 0u;
    long long v10 = 0u;
    __strlcpy_chk();
    if (ioctl(v7, 0xC0206911uLL, &v9) != -1 && a5 && (v10 & 0x10) != 0) {
      *a5 = 1;
    }
    memset(v8, 0, 44);
    __strlcpy_chk();
    if (ioctl(v7, 0xC02C6938uLL, v8) != -1 && a4 && (v8[1] & 0xE0) == 0x80) {
      *a4 = 1;
    }
    close(v7);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2670 != -1) {
    dispatch_once(&sharedInstance_onceToken_2670, &__block_literal_global_2671);
  }
  uint64_t v2 = (void *)sharedInstance_sSharedInstance_2672;

  return v2;
}

uint64_t __40__SiriCoreNetworkManager_sharedInstance__block_invoke()
{
  id v0 = [[SiriCoreNetworkManager alloc] _init];
  uint64_t v1 = sharedInstance_sSharedInstance_2672;
  sharedInstance_sSharedInstance_2672 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end