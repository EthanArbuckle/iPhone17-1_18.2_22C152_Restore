@interface ICQOfferManager
+ (BOOL)_legacyBuddyOfferMightNeedPresenting;
+ (BOOL)buddyOfferMightNeedPresenting;
+ (id)ckBackupDeviceID;
+ (id)defaultBundleIdentifier;
+ (id)defaultPlaceholderKeys;
+ (id)sharedOfferManager;
+ (id)stringWithPlaceholderFormat:(id)a3 alternateString:(id)a4;
- (BOOL)_offerTypeMatchesRequestOptions:(id)a3 offer:(id)a4;
- (BOOL)_shouldUseOffer:(id)a3 forBundleIdentifier:(id)a4;
- (BOOL)didDismissRecommendationForBundleId:(id)a3;
- (BOOL)fetchOfferIfNeeded;
- (BOOL)isBuddyOfferEnabled;
- (BOOL)isDeviceStorageAlmostFull;
- (BOOL)isSimulatedDeviceStorageAlmostFull;
- (BOOL)shouldPresentAppLaunchLink:(id)a3;
- (ICQOfferManager)init;
- (ICQUnfairLock)cachedOffersLock;
- (NSMutableDictionary)cachedOffers;
- (NSMutableDictionary)dismissedRecommendations;
- (NSMutableDictionary)registeredDarwinNotifications;
- (id)_currentOfferForBundleIdentifier:(id)a3 options:(id)a4;
- (id)_premiumOptions;
- (id)_refreshOfferWithDaemonOfferDict:(id)a3 offerRequestType:(int64_t)a4 bundleId:(id)a5;
- (id)cachedOfferForType:(int64_t)a3;
- (id)currentDefaultOffer;
- (id)currentOffer;
- (id)currentOfferForBundleIdentifier:(id)a3;
- (id)currentPremiumOffer;
- (id)currentPremiumOfferForBundleIdentifier:(id)a3;
- (id)photosLibrarySize;
- (id)simulatedPhotosLibrarySize;
- (void)_firedPremiumOfferInvalidationTimer:(id)a3;
- (void)_firedRegularOfferInvalidationTimer:(id)a3;
- (void)_funnelCloudServerOfferForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_getOfferForAccount:(id)a3 bundleIdentifier:(id)a4 options:(id)a5 offerContext:(id)a6 completion:(id)a7;
- (void)_getOfferForBundleIdentifier:(id)a3 options:(id)a4 offerContext:(id)a5 completion:(id)a6;
- (void)_handlePushReceivedDarwinNotificationRequestType:(int64_t)a3;
- (void)_refetchDefaultOffer;
- (void)_refetchPremiumOffer;
- (void)_refetchRegularOffer;
- (void)_registerForDarwinNotification:(id)a3;
- (void)_setupTimerForInvalidationDate:(id)a3 forType:(int64_t)a4;
- (void)_setupTimerForPremiumOfferInvalidationDate:(id)a3;
- (void)_setupTimerForRegularOfferInvalidationDate:(id)a3;
- (void)_teardownInvalidationTimerForRequestType:(int64_t)a3;
- (void)_teardownPremiumOfferInvalidationTimer;
- (void)_teardownRegularOfferInvalidationTimer;
- (void)_unregisterForAllDarwinNotifications;
- (void)_unregisterForDarwinNotification:(id)a3;
- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3;
- (void)clearFollowups;
- (void)dealloc;
- (void)dismissRecommendationForBundleId:(id)a3;
- (void)forcePostFollowup;
- (void)getDefaultOfferWithCompletion:(id)a3;
- (void)getEventOfferWithOptions:(id)a3 completion:(id)a4;
- (void)getOfferForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getOfferForBundleIdentifier:(id)a3 offerContext:(id)a4 completion:(id)a5;
- (void)getOfferWithCompletion:(id)a3;
- (void)getPremiumOfferAndOpportunityBubbleForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getPremiumOfferAndOpportunityBubbleWithCompletion:(id)a3;
- (void)getPremiumOfferForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getPremiumOfferForBundleIdentifier:(id)a3 offerContext:(id)a4 completion:(id)a5;
- (void)getPremiumOfferWithCompletion:(id)a3;
- (void)postBackupRestoredOffer:(id)a3;
- (void)postBuddyOfferType:(id)a3;
- (void)postOfferType:(id)a3;
- (void)removeCachedOfferForType:(int64_t)a3;
- (void)setBuddyOfferEnabled:(BOOL)a3;
- (void)setCachedOfferForType:(int64_t)a3 daemonOffer:(id)a4 bundleIdentifier:(id)a5;
- (void)setCachedOffers:(id)a3;
- (void)setCachedOffersLock:(id)a3;
- (void)setDismissedRecommendations:(id)a3;
- (void)setRegisteredDarwinNotifications:(id)a3;
- (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3;
- (void)setSimulatedPhotosLibrarySize:(id)a3;
- (void)teardownCachedBuddyOffer;
- (void)teardownCachedEventOffer;
- (void)teardownCachedOffer;
- (void)teardownCachedOffers;
- (void)teardownCachedPremiumOffer;
- (void)updateOfferId:(id)a3 buttonId:(id)a4 info:(id)a5 completion:(id)a6;
@end

@implementation ICQOfferManager

void __42__ICQOfferManager_defaultBundleIdentifier__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v3 bundleIdentifier];
  v1 = (void *)v0;
  if (v0) {
    v2 = (__CFString *)v0;
  }
  else {
    v2 = &stru_1F2DCE430;
  }
  objc_storeStrong((id *)&defaultBundleIdentifier_sDefaultBundleIdentifier, v2);
}

+ (id)sharedOfferManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ICQOfferManager_sharedOfferManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedOfferManager_onceToken != -1) {
    dispatch_once(&sharedOfferManager_onceToken, block);
  }
  v2 = (void *)sharedOfferManager_sOfferManager;
  return v2;
}

uint64_t __37__ICQOfferManager_sharedOfferManager__block_invoke()
{
  sharedOfferManager_sOfferManager = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (ICQOfferManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICQOfferManager;
  v2 = [(ICQOfferManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(ICQUnfairLock);
    cachedOffersLock = v2->_cachedOffersLock;
    v2->_cachedOffersLock = v3;

    id v5 = (id)[(id)objc_opt_class() defaultBundleIdentifier];
  }
  return v2;
}

- (void)getOfferWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() defaultBundleIdentifier];
  [(ICQOfferManager *)self getOfferForBundleIdentifier:v5 completion:v4];
}

+ (id)defaultBundleIdentifier
{
  if (defaultBundleIdentifier_onceToken != -1) {
    dispatch_once(&defaultBundleIdentifier_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)defaultBundleIdentifier_sDefaultBundleIdentifier;
  return v2;
}

- (void)getOfferForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ICQOfferManager_getOfferForBundleIdentifier_completion___block_invoke;
  v8[3] = &unk_1E6A52428;
  id v9 = v6;
  id v7 = v6;
  [(ICQOfferManager *)self _getOfferForBundleIdentifier:a3 options:0 offerContext:0 completion:v8];
}

- (void)setCachedOfferForType:(int64_t)a3 daemonOffer:(id)a4 bundleIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 expirationDate];
  v11 = [(ICQOfferManager *)self cachedOffersLock];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __70__ICQOfferManager_setCachedOfferForType_daemonOffer_bundleIdentifier___block_invoke;
  v19 = &unk_1E6A52600;
  v20 = self;
  int64_t v23 = a3;
  id v12 = v8;
  id v21 = v12;
  id v13 = v9;
  id v22 = v13;
  [v11 synchronized:&v16];

  v14 = +[_ICQHelperFunctions _darwinNotificationNameForRequestType:](_ICQHelperFunctions, "_darwinNotificationNameForRequestType:", a3, v16, v17, v18, v19, v20);
  if (v14)
  {
    [(ICQOfferManager *)self _registerForDarwinNotification:v14];
    if (v10) {
LABEL_3:
    }
      [(ICQOfferManager *)self _setupTimerForInvalidationDate:v10 forType:a3];
  }
  else
  {
    v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v25 = a3;
      _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "Found no notification to observe for offerRequestType: %ld", buf, 0xCu);
    }

    if (v10) {
      goto LABEL_3;
    }
  }
}

void __70__ICQOfferManager_setCachedOfferForType_daemonOffer_bundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachedOffers];

  if (!v2)
  {
    id v3 = objc_opt_new();
    [*(id *)(a1 + 32) setCachedOffers:v3];
  }
  id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  id v4 = [[ICQOfferCacheObject alloc] initWithDaemonOffer:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 32) cachedOffers];
  [v5 setObject:v4 forKeyedSubscript:v6];
}

- (NSMutableDictionary)cachedOffers
{
  return self->_cachedOffers;
}

- (ICQUnfairLock)cachedOffersLock
{
  return self->_cachedOffersLock;
}

- (void)_registerForDarwinNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = [(ICQOfferManager *)v5 registeredDarwinNotifications];

    if (!v6)
    {
      id v7 = objc_opt_new();
      [(ICQOfferManager *)v5 setRegisteredDarwinNotifications:v7];
    }
    id v8 = [(ICQOfferManager *)v5 registeredDarwinNotifications];
    id v9 = [v8 objectForKeyedSubscript:v4];

    if (!v9 || ([v9 BOOLValue] & 1) == 0)
    {
      v10 = _ICQGetLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "registering for darwin notification %@", (uint8_t *)&v13, 0xCu);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_handlePushReceivedDarwinNotification, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      id v12 = [(ICQOfferManager *)v5 registeredDarwinNotifications];
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
    }
  }
  objc_sync_exit(v5);
}

- (NSMutableDictionary)registeredDarwinNotifications
{
  return self->_registeredDarwinNotifications;
}

- (void)_getOfferForBundleIdentifier:(id)a3 options:(id)a4 offerContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v15 = objc_msgSend(v14, "aa_primaryAppleAccount");
  if (v15)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__ICQOfferManager__getOfferForBundleIdentifier_options_offerContext_completion___block_invoke;
    v16[3] = &unk_1E6A52510;
    id v17 = v14;
    id v18 = v13;
    [(ICQOfferManager *)self _getOfferForAccount:v15 bundleIdentifier:v10 options:v11 offerContext:v12 completion:v16];
  }
  else
  {
    -[ICQOfferManager removeCachedOfferForType:](self, "removeCachedOfferForType:", +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", v11, v10, [v10 isEqualToString:@"com.apple.purplebuddy"]));
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
}

uint64_t __58__ICQOfferManager_getOfferForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeCachedOfferForType:(int64_t)a3
{
}

- (void)setRegisteredDarwinNotifications:(id)a3
{
}

- (void)setCachedOffers:(id)a3
{
}

- (BOOL)didDismissRecommendationForBundleId:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQOfferManager *)self dismissedRecommendations];

  if (v5
    && ([(ICQOfferManager *)self dismissedRecommendations],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKeyedSubscript:v4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [(ICQOfferManager *)self dismissedRecommendations];
    id v9 = [v8 objectForKeyedSubscript:v4];
    char v10 = [v9 BOOLValue];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)dismissedRecommendations
{
  return self->_dismissedRecommendations;
}

- (void)dealloc
{
  [(ICQOfferManager *)self _teardownRegularOfferInvalidationTimer];
  [(ICQOfferManager *)self _teardownPremiumOfferInvalidationTimer];
  [(ICQOfferManager *)self _unregisterForAllDarwinNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ICQOfferManager;
  [(ICQOfferManager *)&v3 dealloc];
}

- (id)currentOffer
{
  objc_super v3 = [(id)objc_opt_class() defaultBundleIdentifier];
  id v4 = [(ICQOfferManager *)self currentOfferForBundleIdentifier:v3];

  return v4;
}

- (id)currentPremiumOffer
{
  objc_super v3 = [(id)objc_opt_class() defaultBundleIdentifier];
  id v4 = [(ICQOfferManager *)self currentPremiumOfferForBundleIdentifier:v3];

  return v4;
}

- (void)getDefaultOfferWithCompletion:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() defaultBundleIdentifier];
  id v7 = @"isDefaultOffer";
  v8[0] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(ICQOfferManager *)self _getOfferForBundleIdentifier:v5 options:v6 offerContext:0 completion:v4];
}

- (id)currentDefaultOffer
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(id)objc_opt_class() defaultBundleIdentifier];
  id v7 = @"isDefaultOffer";
  v8[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [(ICQOfferManager *)self _currentOfferForBundleIdentifier:v3 options:v4];

  return v5;
}

- (id)currentOfferForBundleIdentifier:(id)a3
{
  return [(ICQOfferManager *)self _currentOfferForBundleIdentifier:a3 options:0];
}

- (id)currentPremiumOfferForBundleIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICQOfferManager *)self _premiumOptions];
  id v6 = [(ICQOfferManager *)self _currentOfferForBundleIdentifier:v4 options:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v8 = _ICQGetLogSystem();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        char v10 = [(id)objc_opt_class() description];
        int v12 = 138412546;
        id v13 = v10;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Received incorrect class %@ when requesting currentPremiumOffer for bundle ID %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else if (v9)
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Offer received was nil when requesting currentPremiumOffer for bundle ID %@", (uint8_t *)&v12, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (void)getPremiumOfferWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() defaultBundleIdentifier];
  [(ICQOfferManager *)self getPremiumOfferForBundleIdentifier:v5 completion:v4];
}

- (void)getPremiumOfferForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICQOfferManager *)self _premiumOptions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__ICQOfferManager_getPremiumOfferForBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E6A52428;
  id v11 = v6;
  id v9 = v6;
  [(ICQOfferManager *)self _getOfferForBundleIdentifier:v7 options:v8 offerContext:0 completion:v10];
}

void __65__ICQOfferManager_getPremiumOfferForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6, v5);
}

- (void)getPremiumOfferAndOpportunityBubbleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() defaultBundleIdentifier];
  [(ICQOfferManager *)self getPremiumOfferAndOpportunityBubbleForBundleIdentifier:v5 completion:v4];
}

- (void)getPremiumOfferAndOpportunityBubbleForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Requested a premium offer with an opportunity bubble.", buf, 2u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__ICQOfferManager_getPremiumOfferAndOpportunityBubbleForBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E6A52478;
  id v11 = v6;
  id v9 = v6;
  [(ICQOfferManager *)self getPremiumOfferForBundleIdentifier:v7 completion:v10];
}

void __85__ICQOfferManager_getPremiumOfferAndOpportunityBubbleForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__ICQOfferManager_getPremiumOfferAndOpportunityBubbleForBundleIdentifier_completion___block_invoke_2;
  v9[3] = &unk_1E6A52450;
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  [v8 shouldShowOpportunityBubbleWithCompletion:v9];
}

void __85__ICQOfferManager_getPremiumOfferAndOpportunityBubbleForBundleIdentifier_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    objc_super v3 = [*(id *)(a1 + 32) opportunityBubble];
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Returning premium offer %@, opportunity bubble %@, error %@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)postBackupRestoredOffer:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v9 = @"backupRestoreComplete";
  v10[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ICQOfferManager_postBackupRestoredOffer___block_invoke;
  v7[3] = &unk_1E6A52428;
  id v8 = v4;
  id v6 = v4;
  [(ICQOfferManager *)self getEventOfferWithOptions:v5 completion:v7];
}

void __43__ICQOfferManager_postBackupRestoredOffer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _ICQGetLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Backup restore offer found: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__ICQOfferManager_postBackupRestoredOffer___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }

    id v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Reverting to original backup restore notification", (uint8_t *)&v15, 2u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOfferForBundleIdentifier:(id)a3 offerContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __71__ICQOfferManager_getOfferForBundleIdentifier_offerContext_completion___block_invoke;
  v10[3] = &unk_1E6A52428;
  id v11 = v8;
  id v9 = v8;
  [(ICQOfferManager *)self _getOfferForBundleIdentifier:a3 options:0 offerContext:a4 completion:v10];
}

uint64_t __71__ICQOfferManager_getOfferForBundleIdentifier_offerContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPremiumOfferForBundleIdentifier:(id)a3 offerContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ICQOfferManager *)self _premiumOptions];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__ICQOfferManager_getPremiumOfferForBundleIdentifier_offerContext_completion___block_invoke;
  v13[3] = &unk_1E6A52428;
  id v14 = v8;
  id v12 = v8;
  [(ICQOfferManager *)self _getOfferForBundleIdentifier:v10 options:v11 offerContext:v9 completion:v13];
}

void __78__ICQOfferManager_getPremiumOfferForBundleIdentifier_offerContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6, v5);
}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  [v6 timeIntervalSince1970];
  objc_msgSend(v5, "setDouble:forKey:", @"iCloudAppLaunchLinkPresentationDate");

  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICQOfferManager appLaunchLinkDidPresentForBundleIdentifier:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  int v15 = [(ICQOfferManager *)self cachedOffersLock];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke;
  v18[3] = &unk_1E6A524A0;
  v18[4] = self;
  [v15 synchronized:v18];

  id v16 = _ICQGetLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "Sending AppLaunch event to ind with bundleId %@", buf, 0xCu);
  }

  id v17 = objc_alloc_init((Class)getINDaemonConnectionClass());
  [v17 appLaunchLinkDidPresentForBundleIdentifier:v4 completion:&__block_literal_global_30];
}

uint64_t __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCachedOffers:0];
}

void __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = _ICQGetLogSystem();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_27_cold_2(v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_27_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (BOOL)shouldPresentAppLaunchLink:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v5 doubleForKey:@"iCloudAppLaunchLinkPresentationDate"];
  uint64_t v6 = objc_msgSend(v4, "initWithTimeIntervalSince1970:");

  uint64_t v7 = [v3 minDisplayIntervalDays];
  uint64_t v8 = [v7 integerValue];
  uint64_t v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v11 = [v9 components:16 fromDate:v6 toDate:v10 options:0];
  uint64_t v12 = [v11 day];

  if (v8 <= v12) {
    BOOL v13 = 1;
  }
  else {
LABEL_3:
  }
    BOOL v13 = 0;

  return v13;
}

- (void)getEventOfferWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() defaultBundleIdentifier];
  if (v6) {
    id v9 = (id)[v6 mutableCopy];
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v10 = v9;
  [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isEventOffer"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__ICQOfferManager_getEventOfferWithOptions_completion___block_invoke;
  aBlock[3] = &unk_1E6A52428;
  id v15 = v7;
  id v11 = v7;
  uint64_t v12 = _Block_copy(aBlock);
  BOOL v13 = (void *)[v10 copy];
  [(ICQOfferManager *)self _getOfferForBundleIdentifier:v8 options:v13 offerContext:0 completion:v12];
}

void __55__ICQOfferManager_getEventOfferWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 debugDescription];
    int v20 = 138412546;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "offer: %@ and error: %@", (uint8_t *)&v20, 0x16u);
  }
  if (v5
    && ([v5 offerId],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToString:&stru_1F2DCE430],
        v9,
        v10))
  {
    id v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __55__ICQOfferManager_getEventOfferWithOptions_completion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    v19 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v19 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v19();
}

- (id)_premiumOptions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"isPremiumOffer";
  v5[0] = MEMORY[0x1E4F1CC38];
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)_currentOfferForBundleIdentifier:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__ICQOfferManager__currentOfferForBundleIdentifier_options___block_invoke;
  v12[3] = &unk_1E6A524E8;
  uint64_t v14 = &v15;
  id v9 = v8;
  uint64_t v13 = v9;
  [(ICQOfferManager *)self _getOfferForBundleIdentifier:v6 options:v7 offerContext:0 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __60__ICQOfferManager__currentOfferForBundleIdentifier_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    dispatch_semaphore_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch offer. Error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_funnelCloudServerOfferForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "Getting offer from ind with options %@", (uint8_t *)&v12, 0xCu);
  }

  id v11 = objc_alloc_init((Class)getINDaemonConnectionClass());
  [v11 iCloudServerOfferForAccount:v9 options:v7 completion:v8];
}

- (BOOL)_shouldUseOffer:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 offerType] != 1
    || ![v5 isEqualToString:@"com.apple.mobileslideshow"]
    || +[ICQDaemonOfferConditions isPhotosCloudEnabled];

  return v6;
}

uint64_t __80__ICQOfferManager__getOfferForBundleIdentifier_options_offerContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_offerTypeMatchesRequestOptions:(id)a3 offer:(id)a4
{
  if (!a4) {
    return 1;
  }
  id v5 = a4;
  int64_t v6 = +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:a3 bundleId:0 isBuddy:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return v6 == 2;
  }
  else {
    return v6 != 2;
  }
}

- (void)_getOfferForAccount:(id)a3 bundleIdentifier:(id)a4 options:(id)a5 offerContext:(id)a6 completion:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = _ICQSignpostLogSystem();
  uint64_t v18 = objc_opt_new();
  os_signpost_id_t v19 = _ICQSignpostCreateWithObject(v17, v18);
  uint64_t v21 = v20;

  __int16 v22 = _ICQSignpostLogSystem();
  id v23 = v22;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    id v52 = v14;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v19, "GetOffer", " enableTelemetry=YES options: %@", buf, 0xCu);
  }
  uint64_t v24 = v12;

  int64_t v25 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[ICQOfferManager _getOfferForAccount:bundleIdentifier:options:offerContext:completion:](v19, (uint64_t)v14, v25);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke;
  aBlock[3] = &unk_1E6A52560;
  os_signpost_id_t v49 = v19;
  uint64_t v50 = v21;
  void aBlock[4] = self;
  id v26 = v13;
  id v46 = v26;
  id v27 = v14;
  id v47 = v27;
  id v28 = v16;
  id v48 = v28;
  v29 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  uint64_t v30 = [v26 isEqualToString:@"com.apple.purplebuddy"];
  int64_t v31 = +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:v27 bundleId:v26 isBuddy:v30];
  if ((v30 & 1) == 0)
  {
    v32 = [(ICQOfferManager *)self cachedOfferForType:v31];
    v33 = v32;
    if (v32 && ([v32 isExpired] & 1) == 0)
    {
      v40 = [v33 bundleIdentifier];
      if ([v40 isEqualToString:v26])
      {
        v39 = [v33 accountAltDSID];
        v37 = objc_msgSend(v12, "aa_altDSID");
        int v38 = [v39 isEqualToString:v37];

        if (v38)
        {
          v34 = _ICQGetLogSystem();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:v31];
            *(_DWORD *)buf = 138412290;
            id v52 = v35;
            _os_log_impl(&dword_1D5851000, v34, OS_LOG_TYPE_DEFAULT, "Returning cached offer %@", buf, 0xCu);
          }
          v29[2](v29, v33, 0);
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    [(ICQOfferManager *)self removeCachedOfferForType:v31];
  }
  if (v27) {
    v36 = (void *)[v27 mutableCopy];
  }
  else {
    v36 = objc_opt_new();
  }
  v33 = v36;
  if (v26) {
    [v36 setObject:v26 forKeyedSubscript:@"bundleIdentifier"];
  }
  if (v15) {
    [v33 setObject:v15 forKeyedSubscript:@"contextDictionary"];
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_50;
  v41[3] = &unk_1E6A52588;
  v41[4] = self;
  int64_t v44 = v31;
  id v42 = v26;
  v43 = v29;
  [(ICQOfferManager *)self _funnelCloudServerOfferForAccount:v12 options:v33 completion:v41];

LABEL_24:
}

void __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int64_t v6 = a3;
  unint64_t Nanoseconds = _ICQSignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  id v8 = _ICQSignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    id v11 = objc_opt_class();
    id v12 = v11;
    id v13 = NSString;
    if (v6) {
      id v14 = v6;
    }
    else {
      id v14 = &stru_1F2DCE430;
    }
    id v15 = v11;
    id v16 = [v13 stringWithFormat:@"%@", v14];
    *(_DWORD *)buf = 138412546;
    *(void *)v39 = v12;
    *(_WORD *)&v39[8] = 2112;
    *(void *)&v39[10] = v16;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v9, OS_SIGNPOST_INTERVAL_END, v10, "GetOffer", "%@ %@", buf, 0x16u);
  }
  uint64_t v17 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    double v27 = (double)Nanoseconds / 1000000000.0;
    int v28 = *(unsigned __int16 *)(a1 + 64);
    v29 = objc_opt_class();
    uint64_t v30 = v29;
    int64_t v31 = NSString;
    if (v6) {
      v32 = v6;
    }
    else {
      v32 = &stru_1F2DCE430;
    }
    id v33 = v29;
    v34 = [v31 stringWithFormat:@"%@", v32];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v39 = v28;
    *(_WORD *)&v39[4] = 2048;
    *(double *)&v39[6] = v27;
    *(_WORD *)&v39[14] = 2112;
    *(void *)&v39[16] = v30;
    __int16 v40 = 2112;
    v41 = v34;
    _os_log_debug_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) GetOffer %@ %@", buf, 0x26u);
  }
  if (!v5
    || v6
    || ![*(id *)(a1 + 32) _shouldUseOffer:v5 forBundleIdentifier:*(void *)(a1 + 40)])
  {
    os_signpost_id_t v19 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_15:
    v19();
    goto LABEL_16;
  }
  if (([*(id *)(a1 + 32) _offerTypeMatchesRequestOptions:*(void *)(a1 + 48) offer:v5] & 1) == 0)
  {
    uint64_t v20 = _ICQGetLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_cold_1(a1 + 48, v20, v21, v22, v23, v24, v25, v26);
    }

    os_signpost_id_t v19 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_15;
  }
  if (![v5 showsPhotoVideoCounts])
  {
    os_signpost_id_t v19 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_15;
  }
  uint64_t v18 = *(void *)(a1 + 40);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_48;
  v35[3] = &unk_1E6A52538;
  id v36 = v5;
  id v37 = *(id *)(a1 + 56);
  +[_ICQDeviceInfo getInfoWithBundleId:v18 completion:v35];

LABEL_16:
}

void __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) setDeviceInfo:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Fetch offer completed with error: (%@)", (uint8_t *)&v12, 0xCu);
  }

  id v8 = 0;
  if (v5 && !v6)
  {
    id v8 = [*(id *)(a1 + 32) _refreshOfferWithDaemonOfferDict:v5 offerRequestType:*(void *)(a1 + 56) bundleId:*(void *)(a1 + 40)];
  }
  id v9 = [MEMORY[0x1E4F28B50] mainBundle];
  os_signpost_id_t v10 = [v9 infoDictionary];
  id v11 = [v10 objectForKey:@"CFBundleShortVersionString"];
  [v8 setAppVersionId:v11];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_refreshOfferWithDaemonOfferDict:(id)a3 offerRequestType:(int64_t)a4 bundleId:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 5:
      objc_opt_class();
      break;
    default:
      break;
  }
  os_signpost_id_t v10 = (objc_class *)objc_opt_class();
  id v11 = (void *)[[v10 alloc] initWithDictionary:v8];
  int v12 = [v11 serverDictionary];

  if (v12)
  {
    uint64_t v25 = self;
    [(objc_class *)v10 isEqual:objc_opt_class()];
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = [v11 appLaunchLinkForBundleID:v9];
    id v15 = [v13 alloc];
    id v16 = [v11 serverDictionary];
    uint64_t v17 = [v11 accountAltDSID];
    uint64_t v18 = [v11 notificationID];
    os_signpost_id_t v19 = [v11 retrievalDate];
    [v11 callbackInterval];
    int v12 = objc_msgSend(v15, "initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:", v16, v17, v18, v19, v14, v9);

    uint64_t v20 = _ICQGetLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a4];
      *(_DWORD *)buf = 138412290;
      int v28 = v21;
      _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "Fetched offer type: %@", buf, 0xCu);
    }
    if (a4 != 4) {
      [(ICQOfferManager *)v25 setCachedOfferForType:a4 daemonOffer:v11 bundleIdentifier:v9];
    }
    if ([v11 failedToFetchFromServer])
    {
      uint64_t v22 = _ICQGetLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v11 failureDetails];
        *(_DWORD *)buf = 138412290;
        int v28 = v23;
        _os_log_impl(&dword_1D5851000, v22, OS_LOG_TYPE_DEFAULT, "failed to fetch offer from server; details: %@",
          buf,
          0xCu);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__ICQOfferManager__refreshOfferWithDaemonOfferDict_offerRequestType_bundleId___block_invoke;
      block[3] = &unk_1E6A525B0;
      block[4] = v25;
      void block[5] = a4;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  return v12;
}

uint64_t __78__ICQOfferManager__refreshOfferWithDaemonOfferDict_offerRequestType_bundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardownInvalidationTimerForRequestType:*(void *)(a1 + 40)];
}

- (id)cachedOfferForType:(int64_t)a3
{
  uint64_t v9 = 0;
  os_signpost_id_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__2;
  id v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  id v5 = [(ICQOfferManager *)self cachedOffersLock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __38__ICQOfferManager_cachedOfferForType___block_invoke;
  v8[3] = &unk_1E6A525D8;
  v8[5] = &v9;
  v8[6] = a3;
  void v8[4] = self;
  [v5 synchronized:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __38__ICQOfferManager_cachedOfferForType___block_invoke(uint64_t a1)
{
  id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) cachedOffers];
  id v3 = [v2 objectForKeyedSubscript:v7];

  uint64_t v4 = [v3 offer];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_refetchRegularOffer
{
  id v3 = [(ICQOfferManager *)self cachedOfferForType:3];
  uint64_t v4 = [v3 bundleIdentifier];

  [(ICQOfferManager *)self removeCachedOfferForType:3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__ICQOfferManager__refetchRegularOffer__block_invoke;
  aBlock[3] = &unk_1E6A52628;
  void aBlock[4] = self;
  uint64_t v5 = _Block_copy(aBlock);
  if (v4) {
    [(ICQOfferManager *)self getOfferForBundleIdentifier:v4 completion:v5];
  }
  else {
    [(ICQOfferManager *)self getOfferWithCompletion:v5];
  }
}

void __39__ICQOfferManager__refetchRegularOffer__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICQOfferManager__refetchRegularOffer__block_invoke_2;
  block[3] = &unk_1E6A524A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __39__ICQOfferManager__refetchRegularOffer__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICQCurrentOfferChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_refetchPremiumOffer
{
  id v3 = [(ICQOfferManager *)self cachedOfferForType:2];
  uint64_t v4 = [v3 bundleIdentifier];

  [(ICQOfferManager *)self removeCachedOfferForType:2];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__ICQOfferManager__refetchPremiumOffer__block_invoke;
  aBlock[3] = &unk_1E6A52650;
  void aBlock[4] = self;
  uint64_t v5 = _Block_copy(aBlock);
  if (v4) {
    [(ICQOfferManager *)self getPremiumOfferForBundleIdentifier:v4 completion:v5];
  }
  else {
    [(ICQOfferManager *)self getPremiumOfferWithCompletion:v5];
  }
}

void __39__ICQOfferManager__refetchPremiumOffer__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICQOfferManager__refetchPremiumOffer__block_invoke_2;
  block[3] = &unk_1E6A524A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __39__ICQOfferManager__refetchPremiumOffer__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICQCurrentPremiumOfferChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_refetchDefaultOffer
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(ICQOfferManager *)self cachedOfferForType:1];
  uint64_t v4 = [v3 bundleIdentifier];

  [(ICQOfferManager *)self removeCachedOfferForType:1];
  id v7 = @"isDefaultOffer";
  v8[0] = &unk_1F2DDFF90;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__ICQOfferManager__refetchDefaultOffer__block_invoke;
  v6[3] = &unk_1E6A52628;
  v6[4] = self;
  [(ICQOfferManager *)self _getOfferForBundleIdentifier:v4 options:v5 offerContext:0 completion:v6];
}

void __39__ICQOfferManager__refetchDefaultOffer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Failed to fetch offer. Error: %@", buf, 0xCu);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__ICQOfferManager__refetchDefaultOffer__block_invoke_65;
    block[3] = &unk_1E6A524A0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__ICQOfferManager__refetchDefaultOffer__block_invoke_2;
  v6[3] = &unk_1E6A524A0;
  v6[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __39__ICQOfferManager__refetchDefaultOffer__block_invoke_65(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICQCurrentDefaultOfferChangedNotification" object:*(void *)(a1 + 32)];
}

void __39__ICQOfferManager__refetchDefaultOffer__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICQCurrentDefaultOfferChangedNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)fetchOfferIfNeeded
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__ICQOfferManager_fetchOfferIfNeeded__block_invoke;
  v3[3] = &unk_1E6A52628;
  v3[4] = self;
  [(ICQOfferManager *)self getOfferWithCompletion:v3];
  return 1;
}

void __37__ICQOfferManager_fetchOfferIfNeeded__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ICQOfferManager_fetchOfferIfNeeded__block_invoke_2;
  block[3] = &unk_1E6A524A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__ICQOfferManager_fetchOfferIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICQCurrentOfferChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_unregisterForDarwinNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(ICQOfferManager *)v5 registeredDarwinNotifications];
  id v7 = [v6 objectForKeyedSubscript:v4];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "unregistering for darwin notification %@", (uint8_t *)&v12, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v5, v4, 0);
    uint64_t v11 = [(ICQOfferManager *)v5 registeredDarwinNotifications];
    [v11 removeObjectForKey:v4];
  }
  objc_sync_exit(v5);
}

- (void)_unregisterForAllDarwinNotifications
{
  [(ICQOfferManager *)self _unregisterForDarwinNotification:@"ICQDaemonOfferChangedDueToPushDarwinNotificationRegular"];
  [(ICQOfferManager *)self _unregisterForDarwinNotification:@"ICQDaemonOfferChangedDueToPushDarwinNotificationPremium"];
  [(ICQOfferManager *)self _unregisterForDarwinNotification:@"ICQDaemonOfferChangedDueToPushDarwinNotificationDefault"];
}

- (void)_handlePushReceivedDarwinNotificationRequestType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.RemoteiCloudQuotaUI"];

  if (a3 == 1 || (v7 & 1) == 0)
  {
    int v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a3];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "push received -- refetching offer type %@", (uint8_t *)&v10, 0xCu);
    }
    switch(a3)
    {
      case 1:
        [(ICQOfferManager *)self _refetchDefaultOffer];
        break;
      case 2:
        [(ICQOfferManager *)self _refetchPremiumOffer];
        break;
      case 3:
        [(ICQOfferManager *)self _refetchRegularOffer];
        break;
    }
  }
}

- (void)_setupTimerForInvalidationDate:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 2)
  {
    id v8 = v6;
    id v6 = (id)[(ICQOfferManager *)self _setupTimerForPremiumOfferInvalidationDate:v6];
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_6;
    }
    id v8 = v6;
    id v6 = (id)[(ICQOfferManager *)self _setupTimerForRegularOfferInvalidationDate:v6];
  }
  id v7 = v8;
LABEL_6:
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_setupTimerForRegularOfferInvalidationDate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ICQOfferManager__setupTimerForRegularOfferInvalidationDate___block_invoke;
  v6[3] = &unk_1E6A52678;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __62__ICQOfferManager__setupTimerForRegularOfferInvalidationDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _teardownRegularOfferInvalidationTimer];
  id v2 = *(void **)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  uint64_t v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel__firedRegularOfferInvalidationTimer_ selector:0 userInfo:0 repeats:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 8);
  *(void *)(v7 + 8) = v6;
  return MEMORY[0x1F41817F8](v6, v8);
}

- (void)_setupTimerForPremiumOfferInvalidationDate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ICQOfferManager__setupTimerForPremiumOfferInvalidationDate___block_invoke;
  v6[3] = &unk_1E6A52678;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __62__ICQOfferManager__setupTimerForPremiumOfferInvalidationDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _teardownPremiumOfferInvalidationTimer];
  id v2 = *(void **)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  uint64_t v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel__firedPremiumOfferInvalidationTimer_ selector:0 userInfo:0 repeats:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 16);
  *(void *)(v7 + 16) = v6;
  return MEMORY[0x1F41817F8](v6, v8);
}

- (void)_teardownInvalidationTimerForRequestType:(int64_t)a3
{
  if (a3 == 2)
  {
    [(ICQOfferManager *)self _teardownPremiumOfferInvalidationTimer];
  }
  else if (a3 == 3)
  {
    [(ICQOfferManager *)self _teardownRegularOfferInvalidationTimer];
  }
}

- (void)_teardownRegularOfferInvalidationTimer
{
  if ([(NSTimer *)self->_regularOfferInvalidationTimer isValid]) {
    [(NSTimer *)self->_regularOfferInvalidationTimer invalidate];
  }
  regularOfferInvalidationTimer = self->_regularOfferInvalidationTimer;
  self->_regularOfferInvalidationTimer = 0;
}

- (void)_teardownPremiumOfferInvalidationTimer
{
  if ([(NSTimer *)self->_premiumOfferInvalidationTimer isValid]) {
    [(NSTimer *)self->_premiumOfferInvalidationTimer invalidate];
  }
  premiumOfferInvalidationTimer = self->_premiumOfferInvalidationTimer;
  self->_premiumOfferInvalidationTimer = 0;
}

- (void)_firedRegularOfferInvalidationTimer:(id)a3
{
  double v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "offer expired -- refetching", v5, 2u);
  }

  [(ICQOfferManager *)self _teardownRegularOfferInvalidationTimer];
  [(ICQOfferManager *)self _refetchRegularOffer];
}

- (void)_firedPremiumOfferInvalidationTimer:(id)a3
{
  double v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Premium offer expired -- refetching", v5, 2u);
  }

  [(ICQOfferManager *)self _teardownPremiumOfferInvalidationTimer];
  [(ICQOfferManager *)self _refetchPremiumOffer];
}

- (void)setCachedOffersLock:(id)a3
{
}

- (void)setDismissedRecommendations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissedRecommendations, 0);
  objc_storeStrong((id *)&self->_cachedOffersLock, 0);
  objc_storeStrong((id *)&self->_registeredDarwinNotifications, 0);
  objc_storeStrong((id *)&self->_cachedOffers, 0);
  objc_storeStrong((id *)&self->_premiumOfferInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_regularOfferInvalidationTimer, 0);
}

+ (id)defaultPlaceholderKeys
{
  return +[ICQDaemonOffer defaultPlaceholderKeys];
}

+ (id)stringWithPlaceholderFormat:(id)a3 alternateString:(id)a4
{
  return +[ICQDaemonOffer stringWithPlaceholderFormat:a3 alternateString:a4];
}

- (void)clearFollowups
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v2 clearFollowupsOfferType:3 completion:0];
}

- (void)updateOfferId:(id)a3 buttonId:(id)a4 info:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v14 = objc_msgSend(v13, "aa_primaryAppleAccount");
  id v15 = _ICQGetLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "account:%@ updateOfferId:%@ buttonId:%@ info:%@", buf, 0x2Au);
  }

  if (v14)
  {
    id v16 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__ICQOfferManager_Private__updateOfferId_buttonId_info_completion___block_invoke;
    v17[3] = &unk_1E6A526A0;
    id v18 = v13;
    id v19 = v12;
    [v16 updateOfferForAccount:v14 offerId:v9 buttonId:v10 info:v11 completion:v17];
  }
  else if (v12)
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

uint64_t __67__ICQOfferManager_Private__updateOfferId_buttonId_info_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissRecommendationForBundleId:(id)a3
{
  id v4 = a3;
  double v5 = [(ICQOfferManager *)self dismissedRecommendations];

  if (!v5)
  {
    uint64_t v6 = objc_opt_new();
    [(ICQOfferManager *)self setDismissedRecommendations:v6];
  }
  id v8 = [NSNumber numberWithBool:1];
  uint64_t v7 = [(ICQOfferManager *)self dismissedRecommendations];
  [v7 setObject:v8 forKeyedSubscript:v4];
}

+ (BOOL)buddyOfferMightNeedPresenting
{
  return 0;
}

+ (BOOL)_legacyBuddyOfferMightNeedPresenting
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[ICQDaemonOfferConditions isCachedCloudQuotaAlmostFullOrFull];
  BOOL v3 = +[ICQDaemonOfferConditions isDeviceStorageNearLowButNotLow];
  int v4 = v3 & !+[ICQDaemonOfferConditions isPhotosCloudEnabled];
  if (v2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4;
  }
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NERP";
    if (v5) {
      uint64_t v7 = @"YASE";
    }
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "mini-buddy might need to run: %@", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (void)forcePostFollowup
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v2 forcePostFollowup];
}

- (void)postOfferType:(id)a3
{
  id v3 = a3;
  id v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 postOfferType:v3];
}

- (void)postBuddyOfferType:(id)a3
{
  id v3 = a3;
  id v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 postBuddyOfferType:v3];
}

- (void)teardownCachedOffer
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v2 teardownCachedOffer];
}

- (void)teardownCachedBuddyOffer
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v2 teardownCachedBuddyOffer];
}

- (void)teardownCachedPremiumOffer
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v2 tearDownCachedPremiumOffer];
}

- (void)teardownCachedEventOffer
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v2 tearDownCachedEventOffer];
}

- (void)teardownCachedOffers
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v2 teardownCachedOffers];
}

+ (id)ckBackupDeviceID
{
  return +[ICQDaemonOfferManager ckBackupDeviceID];
}

- (BOOL)isDeviceStorageAlmostFull
{
  return +[ICQDaemonOfferConditions isDeviceStorageAlmostFull];
}

- (BOOL)isSimulatedDeviceStorageAlmostFull
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  char v3 = [v2 isSimulatedDeviceStorageAlmostFull];

  return v3;
}

- (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 setSimulatedDeviceStorageAlmostFull:v3];
}

- (id)simulatedPhotosLibrarySize
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  BOOL v3 = [v2 simulatedPhotosLibrarySize];

  return v3;
}

- (void)setSimulatedPhotosLibrarySize:(id)a3
{
  id v3 = a3;
  id v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 setSimulatedPhotosLibrarySize:v3];
}

- (id)photosLibrarySize
{
  return +[ICQDaemonOfferConditions photosLibrarySize];
}

- (BOOL)isBuddyOfferEnabled
{
  id v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  char v3 = [v2 isBuddyOfferEnabled];

  return v3;
}

- (void)setBuddyOfferEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 setBuddyOfferEnabled:v3];
}

void __43__ICQOfferManager_postBackupRestoredOffer___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_27_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_27_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a1 localizedDescription];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "Failed to send AppLaunch event to ind with error: %@", (uint8_t *)&v4, 0xCu);
}

void __55__ICQOfferManager_getEventOfferWithOptions_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getOfferForAccount:(os_log_t)log bundleIdentifier:options:offerContext:completion:.cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_1D5851000, log, OS_LOG_TYPE_DEBUG, "SIGNPOST BEGIN [id: %hu]: GetOffer  enableTelemetry=YES options: %@", (uint8_t *)v3, 0x12u);
}

void __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end