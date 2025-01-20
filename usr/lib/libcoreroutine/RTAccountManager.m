@interface RTAccountManager
+ (BOOL)supportsNotificationName:(id)a3;
- (ACAccountStore)accountStore;
- (AFPreferences)siriPreferences;
- (BOOL)cloudSyncProvisionedForAccount;
- (BOOL)siriCloudSyncEnabled;
- (RTAccount)account;
- (RTAccountManager)init;
- (RTAccountManager)initWithAccountStore:(id)a3 lifecycleManager:(id)a4 defaultsManager:(id)a5;
- (RTAccountManager)initWithLifecycleManager:(id)a3 defaultsManager:(id)a4;
- (RTDarwinNotificationHelper)notificationHelper;
- (RTDefaultsManager)defaultsManager;
- (RTInvocationDispatcher)dispatcher;
- (RTLifeCycleManager)lifecycleManager;
- (double)authorizationChangeExitTimeInterval;
- (id)_primaryiCloudAccount;
- (int64_t)accountStatus;
- (int64_t)cloudSyncAuthorizationState;
- (void)_handleSiriCloudSyncPreferenceChangedNotification;
- (void)_lookupAccount:(id)a3;
- (void)_onDefaultsUpdate:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)_updateCloudSyncAuthorizationState:(BOOL)a3;
- (void)currentAccount:(id)a3;
- (void)dealloc;
- (void)fetchCloudSyncAuthorizationState:(id)a3;
- (void)handleSiriCloudSyncPreferenceChangedNotification;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)lookupAccount:(id)a3;
- (void)onDefaultsUpdate:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAuthorizationChangeExitTimeInterval:(double)a3;
- (void)setCloudSyncAuthorizationState:(int64_t)a3;
- (void)setCloudSyncProvisionedForAccount:(BOOL)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setLifecycleManager:(id)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setSiriCloudSyncEnabled:(BOOL)a3;
- (void)setSiriPreferences:(id)a3;
- (void)setup;
- (void)updateCloudSyncAuthorizationState:(BOOL)a3;
- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 handler:(id)a4;
@end

@implementation RTAccountManager

- (void)onDefaultsUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 name];
  v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__RTAccountManager_onDefaultsUpdate___block_invoke;
    v11[3] = &unk_1E6B90BF0;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v8, v11);
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v4 name];
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      __int16 v15 = 2080;
      v16 = "-[RTAccountManager onDefaultsUpdate:]";
      __int16 v17 = 1024;
      int v18 = 458;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unknown notification name %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __37__RTAccountManager_onDefaultsUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDefaultsUpdate:*(void *)(a1 + 40)];
}

- (void)_onDefaultsUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 name];
  v5 = +[RTNotification notificationName];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "-[RTAccountManager _onDefaultsUpdate:]";
      __int16 v13 = 1024;
      int v14 = 465;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "notification name is not RTDefaultsManagerNotificationDefaultsChanged (in %s:%d)", (uint8_t *)&v11, 0x12u);
    }
  }
  v8 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsAccountManagerAuthorizationChangeExitTimeInterval"];
  v9 = v8;
  if (v8) {
    [v8 doubleValue];
  }
  else {
    double v10 = 30.0;
  }
  self->_authorizationChangeExitTimeInterval = v10;
}

- (RTAccountManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountStore_lifecycleManager_defaultsManager_);
}

- (RTAccountManager)initWithLifecycleManager:(id)a3 defaultsManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [(RTAccountManager *)self initWithAccountStore:v8 lifecycleManager:v7 defaultsManager:v6];

  return v9;
}

- (RTAccountManager)initWithAccountStore:(id)a3 lifecycleManager:(id)a4 defaultsManager:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_12:
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTAccountManager initWithAccountStore:lifecycleManager:defaultsManager:]";
      __int16 v29 = 1024;
      int v30 = 100;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lifecycleManager (in %s:%d)", buf, 0x12u);
    }

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTAccountManager initWithAccountStore:lifecycleManager:defaultsManager:]";
    __int16 v29 = 1024;
    int v30 = 99;
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: accountStore (in %s:%d)", buf, 0x12u);
  }

  if (!v10) {
    goto LABEL_12;
  }
LABEL_3:
  if (v11)
  {
LABEL_4:
    id v12 = 0;
    if (v9 && v10)
    {
      v26.receiver = self;
      v26.super_class = (Class)RTAccountManager;
      __int16 v13 = [(RTNotifier *)&v26 init];
      if (v13)
      {
        int v14 = [RTInvocationDispatcher alloc];
        uint64_t v15 = [(RTNotifier *)v13 queue];
        uint64_t v16 = [(RTInvocationDispatcher *)v14 initWithQueue:v15];
        dispatcher = v13->_dispatcher;
        v13->_dispatcher = (RTInvocationDispatcher *)v16;

        objc_storeStrong((id *)&v13->_accountStore, a3);
        objc_storeStrong((id *)&v13->_lifecycleManager, a4);
        objc_storeStrong((id *)&v13->_defaultsManager, a5);
        v13->_cloudSyncAuthorizationState = -1;
        v13->_authorizationChangeExitTimeInterval = 30.0;
        uint64_t v18 = objc_opt_new();
        notificationHelper = v13->_notificationHelper;
        v13->_notificationHelper = (RTDarwinNotificationHelper *)v18;

        uint64_t v20 = [MEMORY[0x1E4F4E538] sharedPreferences];
        siriPreferences = v13->_siriPreferences;
        v13->_siriPreferences = (AFPreferences *)v20;

        v13->_siriCloudSyncEnabled = [(AFPreferences *)v13->_siriPreferences cloudSyncEnabled];
        [(RTAccountManager *)v13 updateCloudSyncAuthorizationState:0];
        [(RTAccountManager *)v13 setup];
      }
      self = v13;
      id v12 = self;
    }
    goto LABEL_18;
  }
LABEL_15:
  v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTAccountManager initWithAccountStore:lifecycleManager:defaultsManager:]";
    __int16 v29 = 1024;
    int v30 = 101;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
  }

  id v12 = 0;
LABEL_18:

  return v12;
}

- (void)setup
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__RTAccountManager_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __25__RTAccountManager_setup__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:@"RTDefaultsAccountManagerAuthorizationChangeExitTimeInterval"];
  v3 = v2;
  if (v2) {
    [v2 doubleValue];
  }
  else {
    double v4 = 30.0;
  }
  *(double *)(*(void *)(a1 + 32) + 104) = v4;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 64);
  id v7 = +[RTNotification notificationName];
  [v6 addObserver:v5 selector:sel_onDefaultsUpdate_ name:v7];

  [*(id *)(*(void *)(a1 + 32) + 88) addObserver:*(void *)(a1 + 32) center:CFNotificationCenterGetDarwinNotifyCenter() key:*MEMORY[0x1E4F4E6A0] callback:onSiriCloudSyncPreferenceChangedNotification info:0 suspensionBehavior:1];
  v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__RTAccountManager_setup__block_invoke_2;
  v9[3] = &unk_1E6B94E80;
  v9[4] = v8;
  [v8 _lookupAccount:v9];
}

void __25__RTAccountManager_setup__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Finished looking up account, %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _setup];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  if ([*(id *)(*(void *)(a1 + 32) + 56) invocationsPending]) {
    [*(id *)(*(void *)(a1 + 32) + 56) dispatchPendingInvocations];
  }
}

- (void)dealloc
{
  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:*MEMORY[0x1E4F4E6A0] info:0];
  v3.receiver = self;
  v3.super_class = (Class)RTAccountManager;
  [(RTAccountManager *)&v3 dealloc];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v6 = a3;
  double v4 = [(RTAccountManager *)self dispatcher];
  [v4 shutdown];

  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:*MEMORY[0x1E4F4E6A0] info:0];
  int v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    int v5 = v6;
  }
}

- (id)_primaryiCloudAccount
{
  uint64_t v2 = [(RTAccountManager *)self accountStore];
  objc_super v3 = [v2 aa_primaryAppleAccount];

  return v3;
}

- (void)lookupAccount:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__RTAccountManager_lookupAccount___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __34__RTAccountManager_lookupAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lookupAccount:*(void *)(a1 + 40)];
}

- (void)_lookupAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, RTAccount *))a3;
  if (v4)
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "starting lookup for icloud account", (uint8_t *)&v17, 2u);
    }

    id v6 = [(RTAccountManager *)self _primaryiCloudAccount];
    uint64_t v7 = v6;
    if (v6)
    {
      self->_cloudSyncProvisionedForAccount = [v6 coreRoutineDataclassEnabled];
      [(RTAccountManager *)self _updateCloudSyncAuthorizationState:0];
      id v8 = [[RTAccount alloc] initWithACAccount:v7];
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        uint64_t v18 = (const char *)v8;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "finished lookup for primary icloud account %@", (uint8_t *)&v17, 0xCu);
      }

      account = self->_account;
      id v11 = v8;
      id v12 = self->_account;
      self->_account = v11;
      __int16 v13 = account;

      v4[2](v4, v11);
      int v14 = [[RTAccountManagerNotificationAccountChanged alloc] initWithLatestAccount:self->_account oldAccount:v13];

      if (v14) {
        [(RTNotifier *)self postNotification:v14];
      }
    }
    else
    {
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "primary icloud account is nil because there isn't one logged in, returning", (uint8_t *)&v17, 2u);
      }

      id v11 = [[RTAccountManagerNotificationAccountChanged alloc] initWithLatestAccount:0 oldAccount:self->_account];
      if (v11) {
        [(RTNotifier *)self postNotification:v11];
      }
      uint64_t v16 = self->_account;
      self->_account = 0;

      v4[2](v4, 0);
    }
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[RTAccountManager _lookupAccount:]";
      __int16 v19 = 1024;
      int v20 = 207;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v17, 0x12u);
    }
  }
}

- (void)currentAccount:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__RTAccountManager_currentAccount___block_invoke;
    block[3] = &unk_1E6B921E0;
    block[4] = self;
    id v9 = v5;
    SEL v10 = a2;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[RTAccountManager currentAccount:]";
      __int16 v13 = 1024;
      int v14 = 249;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __35__RTAccountManager_currentAccount___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 32))
  {
    objc_super v3 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "returning current account, %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(void **)(v2 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__RTAccountManager_currentAccount___block_invoke_2;
    v7[3] = &unk_1E6B90CE0;
    v7[4] = v2;
    id v8 = *(id *)(a1 + 40);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [v5 enqueueBlock:v7, @"%@", v6 description];
  }
}

uint64_t __35__RTAccountManager_currentAccount___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) currentAccount:*(void *)(a1 + 40)];
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v7] & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v17, 0xCu);
    }
  }
  id v9 = +[RTNotification notificationName];
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [[RTAccountManagerNotificationCloudSyncAuthorizationStateChanged alloc] initWithCloudSyncAuthorizationState:self->_cloudSyncAuthorizationState];
    if (!v11) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  id v12 = +[RTNotification notificationName];
  int v13 = [v7 isEqualToString:v12];

  if (v13)
  {
    int v14 = [RTAccountManagerNotificationAccountChanged alloc];
    uint64_t v15 = [(RTAccountManager *)self account];
    uint64_t v16 = [(RTAccountManager *)self account];
    uint64_t v11 = [(RTAccountManagerNotificationAccountChanged *)v14 initWithLatestAccount:v15 oldAccount:v16];

    if (v11) {
LABEL_10:
    }
      [(RTNotifier *)self postNotification:v11 toObserver:v6];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    uint64_t v11 = (RTAccountManagerNotificationCloudSyncAuthorizationStateChanged *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412802;
      id v18 = v7;
      __int16 v19 = 2080;
      int v20 = "-[RTAccountManager internalAddObserver:name:]";
      __int16 v21 = 1024;
      int v22 = 293;
      _os_log_error_impl(&dword_1D9BFA000, &v11->super.super, OS_LOG_TYPE_ERROR, "unhandled notification name, %@ (in %s:%d)", (uint8_t *)&v17, 0x1Cu);
    }
  }
LABEL_13:
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
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
    char v5 = [v3 isEqualToString:v6];
  }
  return v5;
}

- (void)fetchCloudSyncAuthorizationState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__RTAccountManager_fetchCloudSyncAuthorizationState___block_invoke;
    block[3] = &unk_1E6B921E0;
    block[4] = self;
    id v9 = v5;
    SEL v10 = a2;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[RTAccountManager fetchCloudSyncAuthorizationState:]";
      __int16 v13 = 1024;
      int v14 = 322;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __53__RTAccountManager_fetchCloudSyncAuthorizationState___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 32))
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "returning cloud sync auth state, %ld", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(void **)(v2 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__RTAccountManager_fetchCloudSyncAuthorizationState___block_invoke_2;
    v7[3] = &unk_1E6B90CE0;
    v7[4] = v2;
    id v8 = *(id *)(a1 + 40);
    int v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [v5 enqueueBlock:v7, @"%@", v6 description];
  }
}

uint64_t __53__RTAccountManager_fetchCloudSyncAuthorizationState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchCloudSyncAuthorizationState:*(void *)(a1 + 40)];
}

- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 handler:(id)a4
{
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__RTAccountManager_updateCloudSyncProvisionedForAccount_handler___block_invoke;
  v10[3] = &unk_1E6B94EA8;
  BOOL v13 = a3;
  v10[4] = self;
  id v11 = v7;
  SEL v12 = a2;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __65__RTAccountManager_updateCloudSyncProvisionedForAccount_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 32))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned __int8 *)(v2 + 34) != v3)
    {
      *(unsigned char *)(v2 + 34) = v3;
      [*(id *)(a1 + 32) _updateCloudSyncAuthorizationState:1];
    }
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
  else
  {
    int v6 = *(void **)(v2 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__RTAccountManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_2;
    v8[3] = &unk_1E6B90EE0;
    v8[4] = v2;
    char v10 = *(unsigned char *)(a1 + 56);
    id v9 = *(id *)(a1 + 40);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [v6 enqueueBlock:v8, @"%@", v7 description];
  }
}

uint64_t __65__RTAccountManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCloudSyncProvisionedForAccount:*(unsigned __int8 *)(a1 + 48) handler:*(void *)(a1 + 40)];
}

- (void)updateCloudSyncAuthorizationState:(BOOL)a3
{
  id v5 = [(RTNotifier *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__RTAccountManager_updateCloudSyncAuthorizationState___block_invoke;
  v6[3] = &unk_1E6B90F08;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __54__RTAccountManager_updateCloudSyncAuthorizationState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCloudSyncAuthorizationState:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateCloudSyncAuthorizationState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_ready)
  {
    if (self->_siriCloudSyncEnabled)
    {
      if (self->_cloudSyncProvisionedForAccount) {
        int64_t v5 = 2;
      }
      else {
        int64_t v5 = 1;
      }
    }
    else
    {
      int64_t v5 = 1;
    }
    if (self->_cloudSyncAuthorizationState != v5)
    {
      self->_cloudSyncAuthorizationState = v5;
      id v8 = [[RTAccountManagerNotificationCloudSyncAuthorizationStateChanged alloc] initWithCloudSyncAuthorizationState:self->_cloudSyncAuthorizationState];
      if (v8) {
        [(RTNotifier *)self postNotification:v8];
      }
      if (v3)
      {
        id v9 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "exiting due to cloud auth sync state change", buf, 2u);
        }

        [(RTLifeCycleManager *)self->_lifecycleManager exitWithDelay:30.0];
      }
      char v10 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v14 = v5;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "update cloud sync auth state to %lu", buf, 0xCu);
      }
    }
  }
  else
  {
    dispatcher = self->_dispatcher;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__RTAccountManager__updateCloudSyncAuthorizationState___block_invoke;
    v11[3] = &unk_1E6B90F08;
    v11[4] = self;
    BOOL v12 = a3;
    BOOL v7 = NSStringFromSelector(a2);
    [(RTInvocationDispatcher *)dispatcher enqueueBlock:v11, @"%@", v7 description];
  }
}

uint64_t __55__RTAccountManager__updateCloudSyncAuthorizationState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCloudSyncAuthorizationState:*(unsigned __int8 *)(a1 + 40)];
}

- (int64_t)accountStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  BOOL v3 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__RTAccountManager_accountStatus__block_invoke;
  v8[3] = &unk_1E6B90E98;
  v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(v3, v8);

  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityAccount);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v10[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "returning account status, %ld", buf, 0xCu);
  }

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __33__RTAccountManager_accountStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[32])
  {
    BOOL v3 = [v2 _primaryiCloudAccount];
    uint64_t v4 = 1;
    if (v3) {
      uint64_t v4 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)handleSiriCloudSyncPreferenceChangedNotification
{
  BOOL v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTAccountManager_handleSiriCloudSyncPreferenceChangedNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __68__RTAccountManager_handleSiriCloudSyncPreferenceChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSiriCloudSyncPreferenceChangedNotification];
}

- (void)_handleSiriCloudSyncPreferenceChangedNotification
{
  if (self->_ready)
  {
    self->_siriCloudSyncEnabled = [(AFPreferences *)self->_siriPreferences cloudSyncEnabled];
    [(RTAccountManager *)self _updateCloudSyncAuthorizationState:1];
  }
  else
  {
    dispatcher = self->_dispatcher;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__RTAccountManager__handleSiriCloudSyncPreferenceChangedNotification__block_invoke;
    v5[3] = &unk_1E6B90E70;
    v5[4] = self;
    uint64_t v4 = NSStringFromSelector(a2);
    [(RTInvocationDispatcher *)dispatcher enqueueBlock:v5, @"%@", v4 description];
  }
}

uint64_t __69__RTAccountManager__handleSiriCloudSyncPreferenceChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSiriCloudSyncPreferenceChangedNotification];
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (RTAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTLifeCycleManager)lifecycleManager
{
  return self->_lifecycleManager;
}

- (void)setLifecycleManager:(id)a3
{
}

- (int64_t)cloudSyncAuthorizationState
{
  return self->_cloudSyncAuthorizationState;
}

- (void)setCloudSyncAuthorizationState:(int64_t)a3
{
  self->_cloudSyncAuthorizationState = a3;
}

- (BOOL)siriCloudSyncEnabled
{
  return self->_siriCloudSyncEnabled;
}

- (void)setSiriCloudSyncEnabled:(BOOL)a3
{
  self->_siriCloudSyncEnabled = a3;
}

- (BOOL)cloudSyncProvisionedForAccount
{
  return self->_cloudSyncProvisionedForAccount;
}

- (void)setCloudSyncProvisionedForAccount:(BOOL)a3
{
  self->_cloudSyncProvisionedForAccount = a3;
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (AFPreferences)siriPreferences
{
  return self->_siriPreferences;
}

- (void)setSiriPreferences:(id)a3
{
}

- (double)authorizationChangeExitTimeInterval
{
  return self->_authorizationChangeExitTimeInterval;
}

- (void)setAuthorizationChangeExitTimeInterval:(double)a3
{
  self->_authorizationChangeExitTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPreferences, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_lifecycleManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end