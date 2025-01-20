@interface RTWalletManager
+ (int64_t)passUseSourceFromUsageNotificationSource:(int64_t)a3;
- (PKUsageNotificationClient)passKitClient;
- (RTDefaultsManager)defaultsManager;
- (RTWalletManager)init;
- (RTWalletManager)initWithDefaultsManager:(id)a3;
- (double)maximumTransactionDistance;
- (void)_passUsedWithTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5;
- (void)_paymentMadeWithIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5;
- (void)_registerForNotifications;
- (void)_registerPassUseCallbacks;
- (void)_registerPaymentUseCallbacks;
- (void)_shutdownWithHandler:(id)a3;
- (void)_unregisterForNotifications;
- (void)_unregisterPassUseCallbacks;
- (void)_unregisterPaymentUseCallbacks;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onDefaultsUpdate:(id)a3;
- (void)passUsedWithTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5;
- (void)paymentMadeWithIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5;
- (void)setDefaultsManager:(id)a3;
- (void)setMaximumTransactionDistance:(double)a3;
- (void)setPassKitClient:(id)a3;
- (void)updateDoubleForKey:(id)a3 handler:(id)a4;
@end

@implementation RTWalletManager

- (void)onDefaultsUpdate:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [v4 updatedKeys];
    int v9 = [v8 containsObject:@"RTDefaultsWalletManagerMinimumUncertaintyThreshold"];

    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __36__RTWalletManager_onDefaultsUpdate___block_invoke;
      v10[3] = &unk_1E6B98460;
      v10[4] = self;
      [(RTWalletManager *)self updateDoubleForKey:@"RTDefaultsWalletManagerMinimumUncertaintyThreshold" handler:v10];
    }
  }
}

- (RTWalletManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTWalletManager)initWithDefaultsManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RTWalletManager;
  v6 = [(RTNotifier *)&v14 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultsManager, a3);
    v7->_maximumTransactionDistance = 1000.0;
    uint64_t v8 = objc_opt_new();
    passKitClient = v7->_passKitClient;
    v7->_passKitClient = (PKUsageNotificationClient *)v8;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__RTWalletManager_initWithDefaultsManager___block_invoke;
    v12[3] = &unk_1E6B98460;
    v10 = v7;
    v13 = v10;
    [(RTWalletManager *)v10 updateDoubleForKey:@"RTDefaultsWalletManagerMinimumUncertaintyThreshold" handler:v12];
    [(RTService *)v10 setup];
  }
  return v7;
}

uint64_t __43__RTWalletManager_initWithDefaultsManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMaximumTransactionDistance:];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(RTWalletManager *)self _unregisterForNotifications];
  [(RTWalletManager *)self _unregisterPassUseCallbacks];
  [(RTWalletManager *)self _unregisterPaymentUseCallbacks];
  [(RTWalletManager *)self setPassKitClient:0];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)_registerForNotifications
{
  defaultsManager = self->_defaultsManager;
  id v4 = +[RTNotification notificationName];
  [(RTNotifier *)defaultsManager addObserver:self selector:sel_onDefaultsUpdate_ name:v4];
}

- (void)_unregisterForNotifications
{
  defaultsManager = self->_defaultsManager;
  id v4 = +[RTNotification notificationName];
  [(RTNotifier *)defaultsManager removeObserver:self fromNotification:v4];
}

void __36__RTWalletManager_onDefaultsUpdate___block_invoke(uint64_t a1, double a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__RTWalletManager_onDefaultsUpdate___block_invoke_2;
  v5[3] = &unk_1E6B91248;
  v5[4] = *(void *)(a1 + 32);
  *(double *)&v5[5] = a2;
  dispatch_async(v4, v5);
}

uint64_t __36__RTWalletManager_onDefaultsUpdate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMaximumTransactionDistance:*(double *)(a1 + 40)];
}

- (void)updateDoubleForKey:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTWalletManager_updateDoubleForKey_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __46__RTWalletManager_updateDoubleForKey_handler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (*(void *)(a1 + 48))
    {
      v3 = _rt_log_facility_get_os_log(RTLogFacilityWallet);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        id v4 = *(const char **)(a1 + 40);
        int v10 = 138412546;
        v11 = v4;
        __int16 v12 = 2048;
        uint64_t v13 = 0;
        _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "onDefaultsUpdate %@ = %f", (uint8_t *)&v10, 0x16u);
      }

      uint64_t v5 = *(void *)(a1 + 48);
      [v2 doubleValue];
      (*(void (**)(uint64_t, __n128))(v5 + 16))(v5, v6);
    }
  }
  else if (*(void *)(a1 + 48))
  {
    if ([*(id *)(a1 + 40) isEqualToString:@"RTDefaultsWalletManagerMinimumUncertaintyThreshold"])
    {
      v7.n128_u64[0] = 0x408F400000000000;
      (*(void (**)(void, __n128))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7);
    }
    else
    {
      uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        v11 = "-[RTWalletManager updateDoubleForKey:handler:]_block_invoke";
        __int16 v12 = 1024;
        LODWORD(v13) = 166;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "missing key from update (in %s:%d)", (uint8_t *)&v10, 0x12u);
      }

      v9.n128_u64[0] = 0;
      (*(void (**)(void, __n128))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v9);
    }
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  __n128 v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if ([(RTNotifier *)self getNumberOfObservers:v5] == 1) {
      [(RTWalletManager *)self _registerPassUseCallbacks];
    }
  }
  else
  {
    uint64_t v8 = +[RTNotification notificationName];
    int v9 = [v5 isEqualToString:v8];

    if (v9)
    {
      if ([(RTNotifier *)self getNumberOfObservers:v5] == 1) {
        [(RTWalletManager *)self _registerPaymentUseCallbacks];
      }
    }
    else
    {
      int v10 = _rt_log_facility_get_os_log(RTLogFacilityWallet);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  __n128 v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if (![(RTNotifier *)self getNumberOfObservers:v5]) {
      [(RTWalletManager *)self _unregisterPassUseCallbacks];
    }
  }
  else
  {
    uint64_t v8 = +[RTNotification notificationName];
    int v9 = [v5 isEqualToString:v8];

    if (v9)
    {
      if (![(RTNotifier *)self getNumberOfObservers:v5]) {
        [(RTWalletManager *)self _unregisterPaymentUseCallbacks];
      }
    }
    else
    {
      int v10 = _rt_log_facility_get_os_log(RTLogFacilityWallet);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_registerPassUseCallbacks
{
  objc_initWeak(&location, self);
  v3 = [(RTWalletManager *)self passKitClient];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__RTWalletManager__registerPassUseCallbacks__block_invoke;
  v4[3] = &unk_1E6B98488;
  objc_copyWeak(&v5, &location);
  [v3 setPassUsageHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__RTWalletManager__registerPassUseCallbacks__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  __n128 v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained passUsedWithTypeIdentifier:v8 source:a3 info:v7];
}

- (void)_registerPaymentUseCallbacks
{
  objc_initWeak(&location, self);
  v3 = [(RTWalletManager *)self passKitClient];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__RTWalletManager__registerPaymentUseCallbacks__block_invoke;
  v4[3] = &unk_1E6B984B0;
  objc_copyWeak(&v5, &location);
  [v3 setPaymentUsageHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__RTWalletManager__registerPaymentUseCallbacks__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  __n128 v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained paymentMadeWithIdentifier:v9 transactionIdentifier:v8 info:v7];
}

- (void)_unregisterPassUseCallbacks
{
  id v2 = [(RTWalletManager *)self passKitClient];
  [v2 setPassUsageHandler:0];
}

- (void)_unregisterPaymentUseCallbacks
{
  id v2 = [(RTWalletManager *)self passKitClient];
  [v2 setPaymentPassUsageHandler:0];
}

- (void)passUsedWithTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__RTWalletManager_passUsedWithTypeIdentifier_source_info___block_invoke;
  v13[3] = &unk_1E6B917F0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __58__RTWalletManager_passUsedWithTypeIdentifier_source_info___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _passUsedWithTypeIdentifier:*(void *)(a1 + 40) source:*(void *)(a1 + 56) info:*(void *)(a1 + 48)];
}

- (void)_passUsedWithTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityWallet);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2048;
    int64_t v16 = a4;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "pass used with identifier, %@, source, %ld, pass info, %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v11 = [(id)objc_opt_class() passUseSourceFromUsageNotificationSource:a4];
  if (v11)
  {
    id v12 = [[RTWalletManagerNotificationPassUsed alloc] initWithPassTypeIdentifier:v8 source:v11 info:v9];
    [(RTNotifier *)self postNotification:v12];
  }
}

- (void)paymentMadeWithIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__RTWalletManager_paymentMadeWithIdentifier_transactionIdentifier_info___block_invoke;
  v15[3] = &unk_1E6B96E10;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __72__RTWalletManager_paymentMadeWithIdentifier_transactionIdentifier_info___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _paymentMadeWithIdentifier:*(void *)(a1 + 40) transactionIdentifier:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)_paymentMadeWithIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityWallet);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "payment made with identifier, %@, transaction identifier, %@, payment info, %@", (uint8_t *)&v16, 0x20u);
  }

  id v12 = [v10 objectForKey:*MEMORY[0x1E4F88000]];
  id v13 = v12;
  if (v12)
  {
    [v12 horizontalAccuracy];
    if (v14 <= *MEMORY[0x1E4F1E6F8])
    {
      __int16 v15 = [[RTWalletManagerNotificationPaymentUsed alloc] initWithPassIdentifier:v8 transactionIdentifier:v9 info:v10];
      [(RTNotifier *)self postNotification:v15];
    }
  }
}

+ (int64_t)passUseSourceFromUsageNotificationSource:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)setMaximumTransactionDistance:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_maximumTransactionDistance != a3)
  {
    self->_double maximumTransactionDistance = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityWallet);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double maximumTransactionDistance = self->_maximumTransactionDistance;
      int v6 = 134217984;
      double v7 = maximumTransactionDistance;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "update maximum transaction distance to %f", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (double)maximumTransactionDistance
{
  return self->_maximumTransactionDistance;
}

- (PKUsageNotificationClient)passKitClient
{
  return self->_passKitClient;
}

- (void)setPassKitClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passKitClient, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end