@interface STKCarrierSubscriptionMonitor
- (STKCarrierSubscriptionMonitor)init;
- (id)subscriptionContextForSlot:(int64_t)a3;
- (id)subscriptionInfoForSlot:(int64_t)a3;
- (unint64_t)numAvailableSubscriptions;
- (void)carrierBundleChange:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation STKCarrierSubscriptionMonitor

- (STKCarrierSubscriptionMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)STKCarrierSubscriptionMonitor;
  v2 = [(STKCarrierSubscriptionMonitor *)&v15 init];
  if (v2)
  {
    uint64_t v3 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    subscriptionInfo = v2->_subscriptionInfo;
    v2->_subscriptionInfo = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    subscriptionContext = v2->_subscriptionContext;
    v2->_subscriptionContext = (NSMutableDictionary *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v2->_queue];
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = (CoreTelephonyClient *)v9;

    [(CoreTelephonyClient *)v2->_telephonyClient setDelegate:v2];
    v11 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__STKCarrierSubscriptionMonitor_init__block_invoke;
    block[3] = &unk_2645F4458;
    v14 = v2;
    dispatch_sync(v11, block);
  }
  return v2;
}

uint64_t __37__STKCarrierSubscriptionMonitor_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) subscriptionInfoDidChange];
}

- (id)subscriptionInfoForSlot:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__STKCarrierSubscriptionMonitor_subscriptionInfoForSlot___block_invoke;
  block[3] = &unk_2645F46F0;
  void block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__STKCarrierSubscriptionMonitor_subscriptionInfoForSlot___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 16);
  id v6 = [NSNumber numberWithInteger:a1[6]];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)subscriptionContextForSlot:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__STKCarrierSubscriptionMonitor_subscriptionContextForSlot___block_invoke;
  block[3] = &unk_2645F46F0;
  void block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__STKCarrierSubscriptionMonitor_subscriptionContextForSlot___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 24);
  id v6 = [NSNumber numberWithInteger:a1[6]];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)numAvailableSubscriptions
{
  return [(NSMutableDictionary *)self->_subscriptionContext count];
}

- (void)subscriptionInfoDidChange
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221DC0000, v0, v1, "STKAlertSessionManager: subscriptionInfoDidChange: failed to get subscription info [error] %{public}@", v2, v3, v4, v5, v6);
}

uint64_t __58__STKCarrierSubscriptionMonitor_subscriptionInfoDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) carrierBundleChange:*(void *)(a1 + 40)];
}

- (void)carrierBundleChange:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssert();
  uint64_t v5 = STKCommonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v4;
    _os_log_impl(&dword_221DC0000, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle did change: %@", buf, 0xCu);
  }

  uint8_t v6 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
  telephonyClient = self->_telephonyClient;
  id v40 = 0;
  v8 = (void *)[(CoreTelephonyClient *)telephonyClient copyCarrierBundleValueWithDefault:v4 keyHierarchy:&unk_26D468310 bundleType:v6 error:&v40];
  id v9 = v40;
  if (v9)
  {
    v10 = v9;
    v11 = STKCommonLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STKCarrierSubscriptionMonitor carrierBundleChange:].cold.4();
    }
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v12 = [v8 BOOLValue];
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = STKClass0SMSLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v42) = v12;
    _os_log_impl(&dword_221DC0000, v13, OS_LOG_TYPE_DEFAULT, "Carrier bundle value changed: showClass0SMSOverInCallAlerts = %d", buf, 8u);
  }

  v14 = self->_telephonyClient;
  id v39 = 0;
  objc_super v15 = (void *)[(CoreTelephonyClient *)v14 copyCarrierBundleValueWithDefault:v4 key:@"ShowClass0SMSFromField" bundleType:v6 error:&v39];
  id v16 = v39;
  if (v16)
  {
    v17 = v16;
    v18 = STKCommonLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[STKCarrierSubscriptionMonitor carrierBundleChange:]();
    }
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v19 = [v15 BOOLValue];
  }
  else {
    uint64_t v19 = 0;
  }

  v20 = self->_telephonyClient;
  id v38 = 0;
  v21 = (void *)[(CoreTelephonyClient *)v20 copyCarrierBundleValueWithDefault:v4 key:@"USSDFilterPatterns" bundleType:v6 error:&v38];
  id v22 = v38;
  if (v22)
  {
    v23 = v22;
    v24 = STKCommonLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[STKCarrierSubscriptionMonitor carrierBundleChange:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v21;
    if (objc_msgSend(v25, "bs_containsObjectPassingTest:", &__block_literal_global_2)) {
      id v26 = (id)MEMORY[0x263EFFA68];
    }
    else {
      id v26 = v25;
    }
  }
  else
  {
    id v26 = (id)MEMORY[0x263EFFA68];
  }

  v27 = self->_telephonyClient;
  id v37 = 0;
  v28 = (void *)[(CoreTelephonyClient *)v27 copyCarrierBundleValueWithDefault:v4 key:@"USSDFilterSometimesPatterns" bundleType:v6 error:&v37];
  id v29 = v37;
  if (v29)
  {
    v30 = v29;
    v31 = STKCommonLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[STKCarrierSubscriptionMonitor carrierBundleChange:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v28;
    if (objc_msgSend(v32, "bs_containsObjectPassingTest:", &__block_literal_global_25)) {
      id v33 = (id)MEMORY[0x263EFFA68];
    }
    else {
      id v33 = v32;
    }
  }
  else
  {
    id v33 = (id)MEMORY[0x263EFFA68];
  }

  v34 = [[STKCarrierSubscriptionInfo alloc] initWithShowClass0SMSFromField:v19 canShowClass0SMSOverInCallAlerts:v12 ussdAlwaysFilteredPatterns:v26 ussdSometimesFilteredPatterns:v33];
  subscriptionInfo = self->_subscriptionInfo;
  v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  [(NSMutableDictionary *)subscriptionInfo setObject:v34 forKeyedSubscript:v36];
}

BOOL __53__STKCarrierSubscriptionMonitor_carrierBundleChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __53__STKCarrierSubscriptionMonitor_carrierBundleChange___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)carrierBundleChange:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221DC0000, v0, v1, "STKAlertSessionManager: carrierBundleChange: failed to get USSDFilterSometimesPatterns [error] %{public}@", v2, v3, v4, v5, v6);
}

- (void)carrierBundleChange:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221DC0000, v0, v1, "STKAlertSessionManager: carrierBundleChange: failed to get USSDFilterPatterns [error] %{public}@", v2, v3, v4, v5, v6);
}

- (void)carrierBundleChange:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221DC0000, v0, v1, "STKAlertSessionManager: carrierBundleChange: failed to get ShowClass0SMSFromField [error] %{public}@", v2, v3, v4, v5, v6);
}

- (void)carrierBundleChange:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_221DC0000, v0, v1, "STKAlertSessionManager: carrierBundleChange: failed to get ShowClass0SMSOverInCallAlerts [error] %{public}@", v2, v3, v4, v5, v6);
}

@end