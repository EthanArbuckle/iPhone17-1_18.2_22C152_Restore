@interface STManagementStateObserver
+ (void)createObserverWithDSID:(id)a3 completionHandler:(id)a4;
- (NSNumber)dsid;
- (OS_dispatch_queue)screenTimeSettingsChangeQueue;
- (STManagementState)managementState;
- (STManagementStateObserver)me;
- (id)_initWithDSID:(id)a3;
- (int)screenTimeSettingsChangeNotifyToken;
- (int64_t)contactManagementState;
- (void)_screenTimeSettingsDidChange;
- (void)dealloc;
- (void)setContactManagementState:(int64_t)a3;
- (void)setManagementState:(id)a3;
- (void)setMe:(id)a3;
@end

@implementation STManagementStateObserver

- (id)_initWithDSID:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STManagementStateObserver;
  v5 = [(STManagementStateObserver *)&v19 init];
  uint64_t v6 = [v4 copy];
  dsid = v5->_dsid;
  v5->_dsid = (NSNumber *)v6;

  uint64_t v8 = objc_opt_new();
  managementState = v5->_managementState;
  v5->_managementState = (STManagementState *)v8;

  v5->_contactManagementState = 0;
  objc_initWeak(&location, v5);
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);

  dispatch_queue_t v12 = dispatch_queue_create((const char *)[@"com.apple.ScreenTimeAgent.contact-management-state-observer-screentime-settings" UTF8String], v11);
  screenTimeSettingsChangeQueue = v5->_screenTimeSettingsChangeQueue;
  v5->_screenTimeSettingsChangeQueue = (OS_dispatch_queue *)v12;

  v14 = v5->_screenTimeSettingsChangeQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__STManagementStateObserver__initWithDSID___block_invoke;
  v16[3] = &unk_1E6BC76A0;
  objc_copyWeak(&v17, &location);
  notify_register_dispatch("com.apple.ScreenTimeAgent.SettingsDidChangeNotification", &v5->_screenTimeSettingsChangeNotifyToken, v14, v16);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v5;
}

void __43__STManagementStateObserver__initWithDSID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _screenTimeSettingsDidChange];
}

- (void)dealloc
{
  notify_cancel(self->_screenTimeSettingsChangeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)STManagementStateObserver;
  [(STManagementStateObserver *)&v3 dealloc];
}

+ (void)createObserverWithDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) _initWithDSID:v7];
  v9 = [v8 managementState];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__STManagementStateObserver_createObserverWithDSID_completionHandler___block_invoke;
  v12[3] = &unk_1E6BC7CB0;
  id v13 = v8;
  id v14 = v6;
  id v10 = v8;
  id v11 = v6;
  [v9 contactManagementStateForDSID:v7 completionHandler:v12];
}

void __70__STManagementStateObserver_createObserverWithDSID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog managementStateObserver];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __70__STManagementStateObserver_createObserverWithDSID_completionHandler___block_invoke_cold_1((uint64_t)v5, v6);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) setContactManagementState:a2];
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (void)_screenTimeSettingsDidChange
{
  objc_super v3 = [(STManagementStateObserver *)self managementState];
  id v4 = [(STManagementStateObserver *)self dsid];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__STManagementStateObserver__screenTimeSettingsDidChange__block_invoke;
  v5[3] = &unk_1E6BC7CD8;
  v5[4] = self;
  [v3 contactManagementStateForDSID:v4 completionHandler:v5];
}

void __57__STManagementStateObserver__screenTimeSettingsDidChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog managementStateObserver];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57__STManagementStateObserver__screenTimeSettingsDidChange__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  else if ([*(id *)(a1 + 32) contactManagementState] != a2)
  {
    id v7 = +[STLog managementStateObserver];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) contactManagementState];
      int v9 = 134218240;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      _os_log_impl(&dword_1DA519000, v7, OS_LOG_TYPE_DEFAULT, "Contact management state changed from %lld to %lld", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 32) setContactManagementState:a2];
  }
}

- (int64_t)contactManagementState
{
  return self->_contactManagementState;
}

- (void)setContactManagementState:(int64_t)a3
{
  self->_contactManagementState = a3;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (STManagementState)managementState
{
  return (STManagementState *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManagementState:(id)a3
{
}

- (STManagementStateObserver)me
{
  return (STManagementStateObserver *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMe:(id)a3
{
}

- (OS_dispatch_queue)screenTimeSettingsChangeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (int)screenTimeSettingsChangeNotifyToken
{
  return self->_screenTimeSettingsChangeNotifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTimeSettingsChangeQueue, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

void __70__STManagementStateObserver_createObserverWithDSID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch initial contact management state: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __57__STManagementStateObserver__screenTimeSettingsDidChange__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch contact management state: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end