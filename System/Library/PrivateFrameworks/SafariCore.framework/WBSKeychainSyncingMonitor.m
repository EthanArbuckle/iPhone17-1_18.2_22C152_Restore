@interface WBSKeychainSyncingMonitor
+ (WBSKeychainSyncingMonitor)sharedMonitor;
- (BOOL)canKeychainSyncBeEnabled;
- (BOOL)isKeychainSyncEnabled;
- (WBSKeychainSyncingMonitor)init;
- (unint64_t)keychainSyncSettingValue;
- (void)_fetchKeychainSyncingStatus;
- (void)_keychainSyncingStatusMayHaveChanged;
- (void)_primaryAppleAccountDidChange;
- (void)_updateAccountOnInternalQueue:(id)a3;
- (void)_updateKeychainClique;
- (void)performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue:(id)a3 task:(id)a4;
@end

@implementation WBSKeychainSyncingMonitor

void __88__WBSKeychainSyncingMonitor_performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue_task___block_invoke(uint64_t a1)
{
}

void *__53__WBSKeychainSyncingMonitor_keychainSyncSettingValue__block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 48) != 0;
  *(void *)(*(void *)(result[6] + 8) + 24) = *(void *)(result[4] + 40);
  return result;
}

- (void)_updateAccountOnInternalQueue:(id)a3
{
  id v4 = a3;
  primaryAppleAccountAltDSID = self->_primaryAppleAccountAltDSID;
  v10 = (ACAccount *)v4;
  primaryAppleAccount = self->_primaryAppleAccount;
  self->_primaryAppleAccount = v10;
  v7 = primaryAppleAccountAltDSID;

  v8 = [(ACAccount *)v10 aa_altDSID];
  v9 = self->_primaryAppleAccountAltDSID;
  self->_primaryAppleAccountAltDSID = v8;

  LOBYTE(primaryAppleAccount) = WBSIsEqual(v7, self->_primaryAppleAccountAltDSID);
  if ((primaryAppleAccount & 1) == 0) {
    [(WBSKeychainSyncingMonitor *)self _updateKeychainClique];
  }
  [(WBSKeychainSyncingMonitor *)self _fetchKeychainSyncingStatus];
}

- (void)_fetchKeychainSyncingStatus
{
  v3 = self->_keychainClique;
  keychainStatusFetchingQueue = self->_keychainStatusFetchingQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke;
  v6[3] = &unk_1E615A6C8;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(keychainStatusFetchingQueue, v6);
}

+ (WBSKeychainSyncingMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedMonitor_sharedMonitor;
  return (WBSKeychainSyncingMonitor *)v2;
}

- (unint64_t)keychainSyncSettingValue
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSKeychainSyncingMonitor_keychainSyncSettingValue__block_invoke;
  block[3] = &unk_1E615B0B8;
  block[4] = self;
  block[5] = &v6;
  block[6] = &v10;
  dispatch_sync(internalQueue, block);
  if (*((unsigned char *)v7 + 24)) {
    unint64_t v3 = v11[3];
  }
  else {
    unint64_t v3 = 1;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

void __65__WBSKeychainSyncingMonitor__keychainSyncingStatusMayHaveChanged__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:WBSKeychainSyncStatusMayHaveChangedNotification object:0];
}

- (void)performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  synchronousGetterQueue = self->_synchronousGetterQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__WBSKeychainSyncingMonitor_performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue_task___block_invoke;
  v11[3] = &unk_1E615A6A0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(synchronousGetterQueue, v11);
}

uint64_t __58__WBSKeychainSyncingMonitor__primaryAppleAccountDidChange__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccountOnInternalQueue:*(void *)(a1 + 40)];
}

- (void)_keychainSyncingStatusMayHaveChanged
{
}

uint64_t __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke_11(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v1 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 40))
  {
    *(void *)(v2 + 40) = v1;
    return [*(id *)(result + 32) _keychainSyncingStatusMayHaveChanged];
  }
  return result;
}

void __42__WBSKeychainSyncingMonitor_sharedMonitor__block_invoke()
{
  id v0 = objc_alloc_init(WBSKeychainSyncingMonitor);
  uint64_t v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;
}

- (WBSKeychainSyncingMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)WBSKeychainSyncingMonitor;
  uint64_t v2 = [(WBSKeychainSyncingMonitor *)&v17 init];
  if (v2)
  {
    unint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SafariCore.WBSKeychainSyncingMonitor", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.SafariCore.WBSKeychainSyncingMonitor.keychainStatusFetchingQueue", v4);
    keychainStatusFetchingQueue = v2->_keychainStatusFetchingQueue;
    v2->_keychainStatusFetchingQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);

    v11 = dispatch_queue_attr_make_initially_inactive(v10);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.SafariCore.WBSKeychainSyncingMonitor.synchronousGetterQueue", v11);
    synchronousGetterQueue = v2->_synchronousGetterQueue;
    v2->_synchronousGetterQueue = (OS_dispatch_queue *)v12;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v2 selector:sel__primaryAppleAccountDidChange name:@"WBSPrimaryAppleAccountDidChangeNotification" object:0];

    [(WBSKeychainSyncingMonitor *)v2 _primaryAppleAccountDidChange];
    v15 = v2;
  }
  return v2;
}

- (void)_primaryAppleAccountDidChange
{
  unint64_t v3 = +[WBSPrimaryAppleAccountObserver sharedObserver];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__WBSKeychainSyncingMonitor__primaryAppleAccountDidChange__block_invoke;
  v4[3] = &unk_1E615B108;
  v4[4] = self;
  [v3 getPrimaryAppleAccountWithCompletionHandler:v4];
}

void __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v11 = 0;
  char v3 = [v2 fetchUserControllableViewsSyncingEnabled:&v11];
  id v4 = v11;
  dispatch_queue_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = 2;
  }
  else
  {
    if (v4)
    {
      dispatch_queue_t v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke_cold_1(v7, v5);
      }
    }
    uint64_t v6 = v5 == 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke_11;
  block[3] = &unk_1E615B0E0;
  block[4] = v8;
  block[5] = v6;
  dispatch_async(v9, block);
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 40) + 24));
}

void __58__WBSKeychainSyncingMonitor__primaryAppleAccountDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  dispatch_queue_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__WBSKeychainSyncingMonitor__primaryAppleAccountDidChange__block_invoke_2;
  v7[3] = &unk_1E615A6C8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

- (void)_updateKeychainClique
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F3B438]);
  [v5 setContext:*MEMORY[0x1E4F3B458]];
  [v5 setAltDSID:self->_primaryAppleAccountAltDSID];
  id v3 = (OTClique *)[objc_alloc(MEMORY[0x1E4F3B430]) initWithContextData:v5];
  keychainClique = self->_keychainClique;
  self->_keychainClique = v3;
}

- (BOOL)isKeychainSyncEnabled
{
  dispatch_sync((dispatch_queue_t)self->_synchronousGetterQueue, &__block_literal_global_19_0);
  if (!+[WBSFeatureAvailability isInternalInstall]) {
    return [(WBSKeychainSyncingMonitor *)self keychainSyncSettingValue] == 2;
  }
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v4 = objc_msgSend(v3, "safari_numberForKey:", @"iCloudKeychainEnabledOverride");

  if (!v4) {
    return [(WBSKeychainSyncingMonitor *)self keychainSyncSettingValue] == 2;
  }
  id v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Overriding iCloud Keychain check due to iCloudKeychainEnabledOverrideDefault", v8, 2u);
  }
  char v6 = [v4 BOOLValue];

  return v6;
}

- (BOOL)canKeychainSyncBeEnabled
{
  uint64_t v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  char v3 = [v2 isSharedIPad];

  if (v3) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v4 = [v5 BOOLRestrictionForFeature:*MEMORY[0x1E4F73FA8]] == 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccountAltDSID, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_keychainClique, 0);
  objc_storeStrong((id *)&self->_synchronousGetterQueue, 0);
  objc_storeStrong((id *)&self->_keychainStatusFetchingQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = a1;
  BOOL v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  char v6 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Failed to read keychain sync status with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end