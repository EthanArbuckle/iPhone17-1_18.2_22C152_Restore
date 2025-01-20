@interface PUIBankConnectAnalyticsConsentCoordinator
- (BOOL)shouldShare;
- (BOOL)showPreference;
- (PUIBankConnectAnalyticsConsentCoordinator)init;
- (id)privacyBundleIdentifier;
- (id)updateHandler;
- (void)dealloc;
- (void)fetchStateWithCompletion:(id)a3;
- (void)registerForUpdatesWithHandler:(id)a3;
- (void)setAnalyticsConsent:(BOOL)a3 completion:(id)a4;
- (void)setUpdateHandler:(id)a3;
- (void)updateCachedPermission:(BOOL)a3;
- (void)updateCachedVisibility:(BOOL)a3;
@end

@implementation PUIBankConnectAnalyticsConsentCoordinator

- (PUIBankConnectAnalyticsConsentCoordinator)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUIBankConnectAnalyticsConsentCoordinator;
  v2 = [(PUIBankConnectAnalyticsConsentCoordinator *)&v10 init];
  if (v2)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v3 = (void *)getFKBankConnectOfflineLabConsentCoordinatorClass_softClass;
    uint64_t v15 = getFKBankConnectOfflineLabConsentCoordinatorClass_softClass;
    if (!getFKBankConnectOfflineLabConsentCoordinatorClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke;
      v11[3] = &unk_1E6E9C7F8;
      v11[4] = &v12;
      __getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    v4 = v3;
    _Block_object_dispose(&v12, 8);
    id v5 = objc_alloc_init(v4);
    id offlineLabConsentCoordinator = v2->_offlineLabConsentCoordinator;
    v2->_id offlineLabConsentCoordinator = v5;

    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_shouldShare = [v7 BOOLForKey:@"shouldShareBankConnectData"];

    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_showPreference = [v8 BOOLForKey:@"showBankConnectPreference"];
  }
  return v2;
}

- (void)updateCachedPermission:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldShare = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"shouldShareBankConnectData"];
}

- (void)updateCachedVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showPreference = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"showBankConnectPreference"];
}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id offlineLabConsentCoordinator = self->_offlineLabConsentCoordinator;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PUIBankConnectAnalyticsConsentCoordinator_fetchStateWithCompletion___block_invoke;
  v7[3] = &unk_1E6E9C968;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [offlineLabConsentCoordinator loadOfflineLabSharingPreferenceWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__PUIBankConnectAnalyticsConsentCoordinator_fetchStateWithCompletion___block_invoke(uint64_t a1, char a2, char a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PUIBankConnectAnalyticsConsentCoordinator_fetchStateWithCompletion___block_invoke_2;
  block[3] = &unk_1E6E9C940;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  char v9 = a2;
  char v10 = a3;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

uint64_t __70__PUIBankConnectAnalyticsConsentCoordinator_fetchStateWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateCachedPermission:*(unsigned __int8 *)(a1 + 48)];

  id v4 = objc_loadWeakRetained(v2);
  if (([v4 showPreference] & 1) == 0)
  {
    int v5 = *(unsigned __int8 *)(a1 + 49);

    if (!v5) {
      goto LABEL_5;
    }
    id v4 = objc_loadWeakRetained(v2);
    [v4 updateCachedVisibility:*(unsigned __int8 *)(a1 + 49)];
  }

LABEL_5:
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v6();
}

- (void)registerForUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  [(PUIBankConnectAnalyticsConsentCoordinator *)self setUpdateHandler:v4];
  objc_initWeak(&location, self);
  id offlineLabConsentCoordinator = self->_offlineLabConsentCoordinator;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke;
  v12[3] = &unk_1E6E9C9B8;
  objc_copyWeak(&v13, &location);
  [offlineLabConsentCoordinator loadOfflineLabSharingPreferenceWithCompletion:v12];
  int syncedKeychainNotifyToken = self->_syncedKeychainNotifyToken;
  p_int syncedKeychainNotifyToken = &self->_syncedKeychainNotifyToken;
  if (!syncedKeychainNotifyToken)
  {
    id v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_3;
    handler[3] = &unk_1E6E9C9E0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.security.keychainchanged", p_syncedKeychainNotifyToken, v8, handler);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke(uint64_t a1, char a2, char a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_2;
  v5[3] = &unk_1E6E9C990;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = a2;
  char v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
}

void __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained updateHandler];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = [v5 shouldShare];
    int v7 = *(unsigned __int8 *)(a1 + 40);

    if (v7 != v6)
    {
      id v8 = objc_loadWeakRetained(v2);
      [v8 updateCachedPermission:*(unsigned __int8 *)(a1 + 40)];
    }
    id v9 = objc_loadWeakRetained(v2);
    int v10 = [v9 showPreference];
    int v11 = *(unsigned __int8 *)(a1 + 41);

    if (v11 == v10)
    {
      if (v7 == v6) {
        return;
      }
      id v15 = objc_loadWeakRetained(v2);
      id v13 = [v15 updateHandler];
      uint64_t v14 = (void (*)(void))v13[2];
    }
    else
    {
      id v12 = objc_loadWeakRetained(v2);
      [v12 updateCachedVisibility:*(unsigned __int8 *)(a1 + 41)];

      id v15 = objc_loadWeakRetained(v2);
      id v13 = [v15 updateHandler];
      uint64_t v14 = (void (*)(void))v13[2];
    }
    v14();
  }
}

void __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained shouldShare];

  id v4 = objc_loadWeakRetained(v1);
  char v5 = [v4 showPreference];

  id v6 = objc_loadWeakRetained(v1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_4;
  v7[3] = &unk_1E6E9C990;
  objc_copyWeak(&v8, v1);
  char v9 = v5;
  char v10 = v3;
  [v6 fetchStateWithCompletion:v7];

  objc_destroyWeak(&v8);
}

void __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained updateHandler];

  if (!v4) {
    return;
  }
  id v5 = objc_loadWeakRetained(v2);
  if (![v5 showPreference])
  {

LABEL_6:
    id v7 = objc_loadWeakRetained(v2);
    int v8 = [v7 shouldShare];
    int v9 = *(unsigned __int8 *)(a1 + 41);

    if (v9 == v8) {
      return;
    }
    goto LABEL_8;
  }
  int v6 = *(unsigned __int8 *)(a1 + 40);

  if (v6) {
    goto LABEL_6;
  }
LABEL_8:
  id v11 = objc_loadWeakRetained(v2);
  char v10 = [v11 updateHandler];
  v10[2]();
}

- (id)privacyBundleIdentifier
{
  return (id)[self->_offlineLabConsentCoordinator offlineLabPrivacyBundleIdentifier];
}

- (void)setAnalyticsConsent:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = _PUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[PUIBankConnectAnalyticsConsentCoordinator setAnalyticsConsent:completion:]";
    _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "%s: Saving OfflineLab analytics consent state.", buf, 0xCu);
  }

  BOOL v8 = [(PUIBankConnectAnalyticsConsentCoordinator *)self shouldShare];
  [(PUIBankConnectAnalyticsConsentCoordinator *)self updateCachedPermission:v4];
  objc_initWeak((id *)buf, self);
  id offlineLabConsentCoordinator = self->_offlineLabConsentCoordinator;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PUIBankConnectAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke;
  v11[3] = &unk_1E6E9CA08;
  objc_copyWeak(&v13, (id *)buf);
  BOOL v14 = v8;
  id v10 = v6;
  id v12 = v10;
  [offlineLabConsentCoordinator saveOfflineLabSharingPermission:v4 withCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __76__PUIBankConnectAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = _PUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__PUIBankConnectAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke_cold_1((uint64_t)v3, v4);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained updateCachedPermission:*(unsigned __int8 *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  notify_cancel(self->_syncedKeychainNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)PUIBankConnectAnalyticsConsentCoordinator;
  [(PUIBankConnectAnalyticsConsentCoordinator *)&v3 dealloc];
}

- (BOOL)shouldShare
{
  return self->_shouldShare;
}

- (BOOL)showPreference
{
  return self->_showPreference;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_offlineLabConsentCoordinator, 0);
}

void __76__PUIBankConnectAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  objc_super v3 = "-[PUIBankConnectAnalyticsConsentCoordinator setAnalyticsConsent:completion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "%s, Error when saving OfflineLab analytics consent, error: %@", (uint8_t *)&v2, 0x16u);
}

@end