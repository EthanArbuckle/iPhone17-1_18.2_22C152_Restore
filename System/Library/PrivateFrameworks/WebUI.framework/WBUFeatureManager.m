@interface WBUFeatureManager
+ (BOOL)_hasManagedAutoFillDomains;
+ (BOOL)shouldAllowAddingNewPasswords;
+ (BOOL)shouldOfferVirtualCards;
+ (id)webui_sharedFeatureManager;
+ (int64_t)accessLevel;
+ (void)shouldOfferVirtualCards;
- (BOOL)_isCloudTabsAvailableUsingManagedAppleID:(BOOL)a3;
- (BOOL)_isUsingManagedAppleID;
- (BOOL)_locallyRestricted;
- (BOOL)isAirDropPasswordsAvailable;
- (BOOL)isAutoFillAvailable;
- (BOOL)isBookmarksAvailable;
- (BOOL)isCloudAccountHSA2;
- (BOOL)isCloudHistorySyncAvailable;
- (BOOL)isCloudKitBookmarksAvailable;
- (BOOL)isCloudSyncAvailable;
- (BOOL)isCloudTabsAvailable;
- (BOOL)isCreditCardStorageAvailable;
- (BOOL)isInMemoryBookmarkChangeTrackingAvailable;
- (BOOL)isOfflineReadingListAvailable;
- (BOOL)isReadingListAvailable;
- (BOOL)isSafariSyncEnabled;
- (WBUFeatureManager)init;
- (void)_accountsDidChange;
- (void)_primaryAppleAccountChanged;
- (void)_setAccountOnInternalQueue:(id)a3;
- (void)_updateFeatureAvailabilityByAccessLevel;
- (void)determineIfPrivateBrowsingIsAvailableWithCompletionHandler:(id)a3;
- (void)determineIfUserIsRestrictedByScreenTimeWithCompletionHandler:(id)a3;
@end

@implementation WBUFeatureManager

uint64_t __48__WBUFeatureManager__primaryAppleAccountChanged__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAccountOnInternalQueue:*(void *)(a1 + 40)];
}

- (BOOL)isCloudAccountHSA2
{
  if (!self->_accountInformationProvider)
  {
    v3 = (WBSAppleAccountInformationProvider *)objc_alloc_init((Class)off_2643EFD58);
    accountInformationProvider = self->_accountInformationProvider;
    self->_accountInformationProvider = v3;

    [(WBUFeatureManager *)self _accountsDidChange];
  }
  return self->_cloudAccountIsHSA2;
}

- (void)_accountsDidChange
{
  self->_cloudAccountIsHSA2 = [(WBSAppleAccountInformationProvider *)self->_accountInformationProvider appleAccountSecurityState] == 2;
  self->_isCloudSyncEnabled = [(WBSAppleAccountInformationProvider *)self->_accountInformationProvider isSafariSyncEnabled];
}

void __48__WBUFeatureManager__primaryAppleAccountChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__WBUFeatureManager__primaryAppleAccountChanged__block_invoke_2;
  v7[3] = &unk_2643F0108;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __82__WBUFeatureManager_determineIfUserIsRestrictedByScreenTimeWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[4])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F671E0]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    v2 = *(void **)(a1 + 32);
  }
  if ([v2 _locallyRestricted])
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __82__WBUFeatureManager_determineIfUserIsRestrictedByScreenTimeWithCompletionHandler___block_invoke_21;
    v8[3] = &unk_2643F00B8;
    objc_copyWeak(&v10, (id *)(a1 + 48));
    id v9 = *(id *)(a1 + 40);
    [v6 shouldRequestMoreTime:v8];

    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXScreenTime();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C355000, v7, OS_LOG_TYPE_INFO, "Determined user is not restricted because there is not a Screen Time passcode set", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __80__WBUFeatureManager_determineIfPrivateBrowsingIsAvailableWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_locallyRestricted
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastRestrictedSettingRequestedTime >= 2.0 || (uint64_t v4 = self->_cachedLocallyRestricted) == 0)
  {
    self->_lastRestrictedSettingRequestedTime = Current;
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F67F58], "settingEnabled"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    cachedLocallyRestricted = self->_cachedLocallyRestricted;
    self->_cachedLocallyRestricted = v5;

    uint64_t v4 = self->_cachedLocallyRestricted;
  }
  return [(NSNumber *)v4 BOOLValue];
}

void __32__WBUFeatureManager_accessLevel__block_invoke()
{
  accessLevel_accessLevel = 0;
  v0 = [MEMORY[0x263F53C50] sharedConnection];
  int v1 = [v0 isEphemeralMultiUser];

  if (v1)
  {
    accessLevel_accessLevel = 2;
  }
  else if (!accessLevel_accessLevel && [MEMORY[0x263F662A0] hasInternalContent])
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"SafariDebugOverrideLaunchMode", (CFStringRef)*MEMORY[0x263EFFE48], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      accessLevel_accessLevel = AppIntegerValue;
    }
  }
}

- (BOOL)isCloudHistorySyncAvailable
{
  BOOL v3 = [(WBUFeatureManager *)self isCloudSyncAvailable];
  if (v3) {
    LOBYTE(v3) = [(id)objc_opt_class() accessLevel] == 2
  }
              || ![(WBUFeatureManager *)self _isUsingManagedAppleID];
  return v3;
}

- (BOOL)isCloudTabsAvailable
{
  BOOL v3 = [(WBUFeatureManager *)self _isUsingManagedAppleID];
  return [(WBUFeatureManager *)self _isCloudTabsAvailableUsingManagedAppleID:v3];
}

- (BOOL)isCloudSyncAvailable
{
  return self->_cloudSyncAvailable;
}

- (WBUFeatureManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBUFeatureManager;
  v2 = [(WBUFeatureManager *)&v13 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.WebUI.WBUFeatureManagerQueue.AppleAccount", v3);
    appleAccountQueue = v2->_appleAccountQueue;
    v2->_appleAccountQueue = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.WebUI.WBUFeatureManagerQueue.ScreenTime", v6);
    screenTimeQueue = v2->_screenTimeQueue;
    v2->_screenTimeQueue = (OS_dispatch_queue *)v7;

    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel__primaryAppleAccountChanged name:*MEMORY[0x263F664E8] object:0];

    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel__accountsDidChange name:*MEMORY[0x263EFB060] object:0];

    [(WBUFeatureManager *)v2 _primaryAppleAccountChanged];
    [(WBUFeatureManager *)v2 _updateFeatureAvailabilityByAccessLevel];
    v11 = v2;
  }

  return v2;
}

- (void)_primaryAppleAccountChanged
{
  BOOL v3 = [MEMORY[0x263F66348] sharedObserver];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__WBUFeatureManager__primaryAppleAccountChanged__block_invoke;
  v4[3] = &unk_2643F0130;
  v4[4] = self;
  [v3 getPrimaryAppleAccountWithCompletionHandler:v4];
}

- (void)_updateFeatureAvailabilityByAccessLevel
{
  *(_DWORD *)&self->_autoFillAvailable = 16843009;
  p_autoFillAvailable = &self->_autoFillAvailable;
  *(_WORD *)&self->_cloudSyncAvailable = 257;
  uint64_t v4 = [(id)objc_opt_class() accessLevel];
  if (v4 == 1)
  {
    *((_WORD *)p_autoFillAvailable + 2) = 0;
    *(_DWORD *)p_autoFillAvailable = 0;
  }
  else if (v4 == 2)
  {
    self->_offlineReadingListAvailable = 0;
    self->_inMemoryBookmarkChangeTrackingAvailable = 0;
  }
}

- (void)determineIfPrivateBrowsingIsAvailableWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  v5 = [MEMORY[0x263F861D8] sharedWebFilterSettings];
  int v6 = [v5 isWebFilterEnabled];

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __80__WBUFeatureManager_determineIfPrivateBrowsingIsAvailableWithCompletionHandler___block_invoke;
    v7[3] = &unk_2643F0090;
    id v8 = v4;
    [(WBUFeatureManager *)self determineIfUserIsRestrictedByScreenTimeWithCompletionHandler:v7];
  }
}

- (void)determineIfUserIsRestrictedByScreenTimeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  screenTimeQueue = self->_screenTimeQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__WBUFeatureManager_determineIfUserIsRestrictedByScreenTimeWithCompletionHandler___block_invoke;
  v7[3] = &unk_2643F00E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(screenTimeQueue, v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)_setAccountOnInternalQueue:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_appleAccountQueue);
  BOOL v6 = [(WBUFeatureManager *)self _isCloudTabsAvailableUsingManagedAppleID:[(ACAccount *)self->_primaryAppleAccount aa_isManagedAppleID]];
  objc_storeStrong((id *)&self->_primaryAppleAccount, a3);
  if (v6 != -[WBUFeatureManager _isCloudTabsAvailableUsingManagedAppleID:](self, "_isCloudTabsAvailableUsingManagedAppleID:", objc_msgSend(v5, "aa_isManagedAppleID")))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__WBUFeatureManager__setAccountOnInternalQueue___block_invoke;
    block[3] = &unk_2643EFFA0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (BOOL)_isCloudTabsAvailableUsingManagedAppleID:(BOOL)a3
{
  uint64_t v4 = [(id)objc_opt_class() accessLevel];
  return v4 != 1 && (v4 || !a3);
}

+ (int64_t)accessLevel
{
  if (accessLevel_onceToken != -1) {
    dispatch_once(&accessLevel_onceToken, &__block_literal_global);
  }
  return accessLevel_accessLevel;
}

uint64_t __43__WBUFeatureManager__isUsingManagedAppleID__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "aa_isManagedAppleID");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isUsingManagedAppleID
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_appleAccountQueue);
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  appleAccountQueue = v2->_appleAccountQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__WBUFeatureManager__isUsingManagedAppleID__block_invoke;
  v5[3] = &unk_2643F0068;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(appleAccountQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isCloudKitBookmarksAvailable
{
  return 1;
}

+ (id)webui_sharedFeatureManager
{
  if (webui_sharedFeatureManager_onceToken != -1) {
    dispatch_once(&webui_sharedFeatureManager_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)webui_sharedFeatureManager_webuiSharedFeatureManager;
  return v2;
}

uint64_t __47__WBUFeatureManager_webui_sharedFeatureManager__block_invoke()
{
  webui_sharedFeatureManager_webuiSharedFeatureManager = objc_alloc_init(WBUFeatureManager);
  return MEMORY[0x270F9A758]();
}

void __48__WBUFeatureManager__setAccountOnInternalQueue___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WBUFeatureManagerCloudTabsAvailabilityDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)isCreditCardStorageAvailable
{
  if ((unint64_t)([(id)objc_opt_class() accessLevel] - 1) >= 2) {
    return ![(WBUFeatureManager *)self _isUsingManagedAppleID];
  }
  else {
    return 0;
  }
}

void __82__WBUFeatureManager_determineIfUserIsRestrictedByScreenTimeWithCompletionHandler___block_invoke_21(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXScreenTime();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = @"not";
      if (a2) {
        uint64_t v6 = &stru_26CC74200;
      }
      int v8 = 138543362;
      char v9 = v6;
      _os_log_impl(&dword_21C355000, v5, OS_LOG_TYPE_INFO, "Determined user is %{public}@ an iCloud managed child", (uint8_t *)&v8, 0xCu);
    }
    dispatch_queue_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    dispatch_queue_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

- (BOOL)isAirDropPasswordsAvailable
{
  return [MEMORY[0x263F662A0] isAirDropPasswordsEnabled];
}

+ (BOOL)shouldOfferVirtualCards
{
  if (!MGGetBoolAnswer()) {
    return 1;
  }
  id v2 = objc_alloc_init(MEMORY[0x263F10468]);
  id v7 = 0;
  char v3 = [v2 canEvaluatePolicy:2 error:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[WBUFeatureManager shouldOfferVirtualCards];
    }
  }

  return v3;
}

+ (BOOL)shouldAllowAddingNewPasswords
{
  if ([a1 accessLevel] == 2) {
    return 0;
  }
  char v3 = [MEMORY[0x263F53C50] sharedConnection];
  if ([v3 isSupervised])
  {
    char v4 = [a1 _hasManagedAutoFillDomains];

    if (v4) {
      return 0;
    }
  }
  else
  {
  }
  return 1;
}

+ (BOOL)_hasManagedAutoFillDomains
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 effectiveValuesForUnionSetting:*MEMORY[0x263F53730]];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isSafariSyncEnabled
{
  if (!self->_accountInformationProvider)
  {
    char v3 = (WBSAppleAccountInformationProvider *)objc_alloc_init((Class)off_2643EFD58);
    accountInformationProvider = self->_accountInformationProvider;
    self->_accountInformationProvider = v3;

    [(WBUFeatureManager *)self _accountsDidChange];
  }
  return self->_isCloudSyncEnabled;
}

- (BOOL)isAutoFillAvailable
{
  return self->_autoFillAvailable;
}

- (BOOL)isBookmarksAvailable
{
  return self->_bookmarksAvailable;
}

- (BOOL)isReadingListAvailable
{
  return self->_readingListAvailable;
}

- (BOOL)isOfflineReadingListAvailable
{
  return self->_offlineReadingListAvailable;
}

- (BOOL)isInMemoryBookmarkChangeTrackingAvailable
{
  return self->_inMemoryBookmarkChangeTrackingAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountInformationProvider, 0);
  objc_storeStrong((id *)&self->_cachedLocallyRestricted, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_screenTimeQueue, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_appleAccountQueue, 0);
}

+ (void)shouldOfferVirtualCards
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v3 = a1;
  BOOL v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_21C355000, v3, OS_LOG_TYPE_ERROR, "Encountered error when determining can evaluate policy: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end