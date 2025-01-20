@interface ICQInAppMessaging
+ (id)shared;
- (ACAccountStore)accountStore;
- (BOOL)_isCellularDataOff;
- (BOOL)_termsNotAccepted;
- (BOOL)hasNewObserver;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isICloudReachable;
- (BOOL)isRegisteredForNotifications;
- (ICQInAppMessage)lastMessage;
- (ICQInAppMessage)mockMessage;
- (ICQInAppMessaging)init;
- (ICQOffer)defaultOffer;
- (ICQOffer)regularOffer;
- (ICQOfferManager)sharedOfferManager;
- (ICQPremiumOffer)premiumOffer;
- (ICQUnfairLock)unfairLock;
- (NSString)bundleID;
- (NSString)placement;
- (NSUserDefaults)defaults;
- (OS_nw_path_monitor)connectivityMonitor;
- (RadiosPreferences)radioPrefs;
- (id)_accountIdentifier;
- (id)_actionsForBannerSpecification:(id)a3 offer:(id)a4;
- (id)_dismissActionForBannerSpecification:(id)a3 offer:(id)a4;
- (id)_recalculateCurrentMessage;
- (id)_symbolNameForQuotaOffer:(id)a3;
- (id)airplaneModeOnMessageFromDefaultOffer:(id)a3;
- (id)cellularDataOffMessageFromDefaultOffer:(id)a3;
- (id)quotaMessageForOffer:(id)a3;
- (id)serverUnreachableMessageFromDefaultOffer:(id)a3;
- (id)termsNotAcceptedMessageFromDefaultOffer:(id)a3;
- (id)uploadFailureMessageForPendingItemCount:(id)a3 defaultOffer:(id)a4;
- (unint64_t)_contentTypeForDriveWithOffer:(id)a3;
- (unint64_t)_contentTypeForMessageWithOffer:(id)a3;
- (unint64_t)_contentTypeForQuotaOffer:(id)a3;
- (void)_fetchDefaultOffer;
- (void)_fetchInitialOfferStates;
- (void)_fetchPremiumOffer;
- (void)_fetchRegularOffer;
- (void)_isCellularDataOff;
- (void)_observeUpdatesForBundleID:(id)a3;
- (void)_postMessage:(id)a3;
- (void)_recalculateAndPostCurrentMessage;
- (void)_registerForNotifications;
- (void)_startMonitoringNetworkStatus;
- (void)airplaneModeChanged;
- (void)dataSettingsChanged:(id)a3;
- (void)fetchMessageForReason:(id)a3 pendingItemsCount:(id)a4 withCompletion:(id)a5;
- (void)fetchMessageForReason:(id)a3 withCompletion:(id)a4;
- (void)fetchMessageWithCompletion:(id)a3;
- (void)observeUpdates;
- (void)observeUpdatesForBundleID:(id)a3;
- (void)observeUpdatesForBundleID:(id)a3 placement:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccountStore:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnectivityMonitor:(id)a3;
- (void)setDefaultOffer:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setHasNewObserver:(BOOL)a3;
- (void)setICloudReachable:(BOOL)a3;
- (void)setIsRegisteredForNotifications:(BOOL)a3;
- (void)setLastMessage:(id)a3;
- (void)setMockMessage:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setPremiumOffer:(id)a3;
- (void)setRadioPrefs:(id)a3;
- (void)setRegularOffer:(id)a3;
- (void)setSharedOfferManager:(id)a3;
- (void)setUnfairLock:(id)a3;
- (void)stopObservingUpdates;
@end

@implementation ICQInAppMessaging

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)shared_shared;
  return v2;
}

void __27__ICQInAppMessaging_shared__block_invoke()
{
  v0 = objc_alloc_init(ICQInAppMessaging);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cloud.quota"];
  [(id)shared_shared setDefaults:v2];

  [(id)shared_shared setICloudReachable:1];
  v3 = [MEMORY[0x263F88928] sharedOfferManager];
  [(id)shared_shared setSharedOfferManager:v3];

  id v4 = [MEMORY[0x263EFB210] defaultStore];
  [(id)shared_shared setAccountStore:v4];
}

- (ICQInAppMessaging)init
{
  v21.receiver = self;
  v21.super_class = (Class)ICQInAppMessaging;
  v2 = [(ICQInAppMessaging *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icq.in-app-Message", v3);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v4;

    v6 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v7 = [v6 bundleIdentifier];
    bundleID = v2->_bundleID;
    v2->_bundleID = (NSString *)v7;

    objc_storeStrong((id *)&v2->_placement, @"InApp");
    v9 = (ICQUnfairLock *)objc_alloc_init(MEMORY[0x263F88960]);
    unfairLock = v2->_unfairLock;
    v2->_unfairLock = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.icloud.quota.in-app-messaging-connectivity", v11);
    connectivityQueue = v2->_connectivityQueue;
    v2->_connectivityQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.icloud.quota.in-app-messaging-radios-prefs", v14);
    radiosPrefsQueue = v2->_radiosPrefsQueue;
    v2->_radiosPrefsQueue = (OS_dispatch_queue *)v15;

    v17 = v2->_radiosPrefsQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__ICQInAppMessaging_init__block_invoke;
    block[3] = &unk_264921C80;
    v20 = v2;
    dispatch_sync(v17, block);
  }
  return v2;
}

uint64_t __25__ICQInAppMessaging_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F255D8]);
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  v5 = *(void **)(*(void *)(a1 + 32) + 64);
  return objc_msgSend(v5, "setDelegate:");
}

- (void)observeUpdates
{
  id v3 = [(ICQInAppMessaging *)self bundleID];
  [(ICQInAppMessaging *)self _observeUpdatesForBundleID:v3];
}

- (void)observeUpdatesForBundleID:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Client requested in-app message updates in bundle %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(ICQInAppMessaging *)self observeUpdatesForBundleID:v4 placement:@"InApp"];
}

- (void)observeUpdatesForBundleID:(id)a3 placement:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Client requested in-app message updates in bundle %{public}@ with placement %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = [(ICQInAppMessaging *)self bundleID];
  char v10 = [v6 isEqualToString:v9];

  if ((v10 & 1) == 0) {
    [(ICQInAppMessaging *)self setBundleID:v6];
  }
  [(ICQInAppMessaging *)self setPlacement:v7];
  [(ICQInAppMessaging *)self setHasNewObserver:1];
  if (![(ICQInAppMessaging *)self isRegisteredForNotifications])
  {
    [(ICQInAppMessaging *)self setIsRegisteredForNotifications:1];
    [(ICQInAppMessaging *)self _registerForNotifications];
  }
  [(ICQInAppMessaging *)self _recalculateAndPostCurrentMessage];
}

- (void)_registerForNotifications
{
  id v3 = [(ICQInAppMessaging *)self defaults];
  [v3 addObserver:self forKeyPath:@"debug-in-app-message" options:5 context:0];

  [(ICQInAppMessaging *)self _fetchInitialOfferStates];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__fetchRegularOffer name:*MEMORY[0x263F88840] object:0];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__fetchPremiumOffer name:*MEMORY[0x263F88848] object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__fetchDefaultOffer name:*MEMORY[0x263F88838] object:0];

  uint64_t v7 = *MEMORY[0x263F833B8];
  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__recalculateAndPostCurrentMessage name:v7 object:0];

  [(ICQInAppMessaging *)self _startMonitoringNetworkStatus];
  self->_cellularDataConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  v9 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:self->_connectivityQueue];
  ctClient = self->_ctClient;
  self->_ctClient = v9;

  int v11 = self->_ctClient;
  [(CoreTelephonyClient *)v11 setDelegate:self];
}

- (void)_startMonitoringNetworkStatus
{
  nw_path_monitor_t v3 = nw_path_monitor_create();
  [(ICQInAppMessaging *)self setConnectivityMonitor:v3];

  id v4 = [(ICQInAppMessaging *)self connectivityMonitor];
  nw_path_monitor_set_queue(v4, (dispatch_queue_t)self->_connectivityQueue);

  v5 = [(ICQInAppMessaging *)self connectivityMonitor];
  update_handler[0] = MEMORY[0x263EF8330];
  update_handler[1] = 3221225472;
  update_handler[2] = __50__ICQInAppMessaging__startMonitoringNetworkStatus__block_invoke;
  update_handler[3] = &unk_264923C30;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v5, update_handler);

  id v6 = [(ICQInAppMessaging *)self connectivityMonitor];
  nw_path_monitor_start(v6);
}

uint64_t __50__ICQInAppMessaging__startMonitoringNetworkStatus__block_invoke(uint64_t a1, nw_path_t path)
{
  BOOL v3 = (nw_path_get_status(path) & 0xFFFFFFFD) == 1;
  id v4 = [*(id *)(a1 + 32) unfairLock];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__ICQInAppMessaging__startMonitoringNetworkStatus__block_invoke_2;
  v6[3] = &unk_264921D90;
  v6[4] = *(void *)(a1 + 32);
  BOOL v7 = v3;
  [v4 synchronized:v6];

  return [*(id *)(a1 + 32) _recalculateAndPostCurrentMessage];
}

void __50__ICQInAppMessaging__startMonitoringNetworkStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setICloudReachable:*(unsigned __int8 *)(a1 + 40)];
  id v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      BOOL v3 = @"YES";
    }
    else {
      BOOL v3 = @"NO";
    }
    int v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "In-app message: iCloud Reachability changed to %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_fetchInitialOfferStates
{
  [(ICQInAppMessaging *)self _fetchRegularOffer];
  [(ICQInAppMessaging *)self _fetchPremiumOffer];
  [(ICQInAppMessaging *)self _fetchDefaultOffer];
}

- (void)stopObservingUpdates
{
  if ([(ICQInAppMessaging *)self isRegisteredForNotifications])
  {
    BOOL v3 = [(ICQInAppMessaging *)self defaults];
    [v3 removeObserver:self forKeyPath:@"debug-in-app-message"];

    int v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self];

    v5 = [(ICQInAppMessaging *)self connectivityMonitor];
    nw_path_monitor_cancel(v5);

    [(ICQInAppMessaging *)self setICloudReachable:1];
    [(ICQInAppMessaging *)self setIsRegisteredForNotifications:0];
  }
}

- (void)fetchMessageWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(ICQInAppMessaging *)self bundleID];
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Client requested single in-app message updates in bundle %{public}@", buf, 0xCu);
  }
  BOOL v7 = [(ICQInAppMessaging *)self _recalculateCurrentMessage];
  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(ICQInAppMessaging *)self bundleID];
    *(_DWORD *)buf = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Returning message: %@, to client: %@", buf, 0x16u);
  }
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__ICQInAppMessaging_fetchMessageWithCompletion___block_invoke;
    v10[3] = &unk_2649227F8;
    id v12 = v4;
    id v11 = v7;
    [v11 fetchIconIfNeededWithCompletion:v10];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

uint64_t __48__ICQInAppMessaging_fetchMessageWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchMessageForReason:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (id)[a4 copy];
  [(ICQInAppMessaging *)self fetchMessageForReason:v6 pendingItemsCount:0 withCompletion:v7];
}

- (void)fetchMessageForReason:(id)a3 pendingItemsCount:(id)a4 withCompletion:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__13;
  v49 = __Block_byref_object_dispose__13;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__13;
  v43 = __Block_byref_object_dispose__13;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__13;
  v37 = __Block_byref_object_dispose__13;
  id v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  id v11 = [(ICQInAppMessaging *)self unfairLock];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __76__ICQInAppMessaging_fetchMessageForReason_pendingItemsCount_withCompletion___block_invoke;
  v30[3] = &unk_264923C58;
  v30[4] = self;
  v30[5] = &v45;
  v30[6] = &v39;
  v30[7] = &v33;
  v30[8] = v31;
  [v11 synchronized:v30];

  if ([v8 isEqualToString:@"AirplaneModeOn"])
  {
    uint64_t v12 = [(ICQInAppMessaging *)self airplaneModeOnMessageFromDefaultOffer:v34[5]];
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"WiFiConnectivityIssues"])
  {
    uint64_t v12 = [(ICQInAppMessaging *)self serverUnreachableMessageFromDefaultOffer:v34[5]];
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"CellularDataOff"])
  {
    uint64_t v12 = [(ICQInAppMessaging *)self cellularDataOffMessageFromDefaultOffer:v34[5]];
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"TermsNotAccepted"])
  {
    uint64_t v12 = [(ICQInAppMessaging *)self termsNotAcceptedMessageFromDefaultOffer:v34[5]];
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"UploadFailure"])
  {
    uint64_t v12 = [(ICQInAppMessaging *)self uploadFailureMessageForPendingItemCount:v9 defaultOffer:v34[5]];
    goto LABEL_19;
  }
  __int16 v13 = (void *)v46[5];
  id v14 = [(ICQInAppMessaging *)self placement];
  __int16 v15 = [v13 messageSpecificationForPlacement:v14];
  if (v15)
  {
    BOOL v16 = [(id)v46[5] level] == 0;

    if (!v16)
    {
      uint64_t v17 = v46;
LABEL_18:
      uint64_t v12 = [(ICQInAppMessaging *)self quotaMessageForOffer:v17[5]];
LABEL_19:
      v22 = (void *)v12;
      if (v12)
      {
        v23 = _ICQGetLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [(ICQInAppMessaging *)self bundleID];
          *(_DWORD *)buf = 138412546;
          v52 = v22;
          __int16 v53 = 2112;
          v54 = v24;
          _os_log_impl(&dword_22C821000, v23, OS_LOG_TYPE_DEFAULT, "Returning in-app message: %@, to client: %@", buf, 0x16u);
        }
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __76__ICQInAppMessaging_fetchMessageForReason_pendingItemsCount_withCompletion___block_invoke_82;
        v27[3] = &unk_2649227F8;
        id v29 = v10;
        id v25 = v22;
        id v28 = v25;
        [v25 fetchIconIfNeededWithCompletion:v27];

        goto LABEL_27;
      }
      goto LABEL_24;
    }
  }
  else
  {
  }
  v18 = (void *)v40[5];
  v19 = [(ICQInAppMessaging *)self placement];
  v20 = [v18 messageSpecificationForPlacement:v19];
  if (!v20)
  {

    goto LABEL_24;
  }
  BOOL v21 = [(id)v40[5] level] == 0;

  if (!v21)
  {
    uint64_t v17 = v40;
    goto LABEL_18;
  }
LABEL_24:
  v26 = _ICQGetLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[ICQInAppMessaging fetchMessageForReason:pendingItemsCount:withCompletion:]((uint64_t)v8, v26);
  }

  ICQCreateError();
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))v10 + 2))(v10, 0, v25);
LABEL_27:

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
}

uint64_t __76__ICQInAppMessaging_fetchMessageForReason_pendingItemsCount_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) regularOffer];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) premiumOffer];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 32) defaultOffer];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t result = [*(id *)(a1 + 32) isICloudReachable];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __76__ICQInAppMessaging_fetchMessageForReason_pendingItemsCount_withCompletion___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (BOOL)isAirplaneModeEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  radiosPrefsQueue = self->_radiosPrefsQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ICQInAppMessaging_isAirplaneModeEnabled__block_invoke;
  v5[3] = &unk_264922780;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(radiosPrefsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__ICQInAppMessaging_isAirplaneModeEnabled__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) radioPrefs];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 airplaneMode];
}

- (void)airplaneModeChanged
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(ICQInAppMessaging *)self isAirplaneModeEnabled];
    uint64_t v5 = @"NO";
    if (v4) {
      uint64_t v5 = @"YES";
    }
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "In-app message: Airplane mode changed to %@", (uint8_t *)&v6, 0xCu);
  }

  [(ICQInAppMessaging *)self _recalculateAndPostCurrentMessage];
}

- (void)dataSettingsChanged:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[ICQInAppMessaging dataSettingsChanged:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "In-app message: %s", (uint8_t *)&v5, 0xCu);
  }

  [(ICQInAppMessaging *)self _recalculateAndPostCurrentMessage];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = [(ICQInAppMessaging *)self defaults];
  id v11 = [v7 objectForKey:@"debug-in-app-message"];

  uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  int v9 = [v11 isEqual:v8];

  if (v9)
  {
    [(ICQInAppMessaging *)self setMockMessage:0];
  }
  else
  {
    id v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
    [(ICQInAppMessaging *)self setMockMessage:v10];

    [(ICQInAppMessaging *)self _recalculateAndPostCurrentMessage];
  }
}

- (void)_fetchRegularOffer
{
  objc_initWeak(&location, self);
  char v3 = [(ICQInAppMessaging *)self sharedOfferManager];
  BOOL v4 = [(ICQInAppMessaging *)self bundleID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__ICQInAppMessaging__fetchRegularOffer__block_invoke;
  v5[3] = &unk_264923C80;
  objc_copyWeak(&v6, &location);
  [v3 getOfferForBundleIdentifier:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__ICQInAppMessaging__fetchRegularOffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 debugDescription];
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "In-app messages received regular offer %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [WeakRetained unfairLock];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  __int16 v15 = __39__ICQInAppMessaging__fetchRegularOffer__block_invoke_86;
  BOOL v16 = &unk_264923B30;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  id v11 = v5;
  id v17 = v11;
  [v10 synchronized:&v13];

  id v12 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v12, "_recalculateAndPostCurrentMessage", v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __39__ICQInAppMessaging__fetchRegularOffer__block_invoke_86(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setRegularOffer:v1];
}

- (void)_fetchPremiumOffer
{
  objc_initWeak(&location, self);
  char v3 = [(ICQInAppMessaging *)self sharedOfferManager];
  BOOL v4 = [(ICQInAppMessaging *)self bundleID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__ICQInAppMessaging__fetchPremiumOffer__block_invoke;
  v5[3] = &unk_264923CA8;
  objc_copyWeak(&v6, &location);
  [v3 getPremiumOfferForBundleIdentifier:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__ICQInAppMessaging__fetchPremiumOffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 debugDescription];
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "In-app messages received premium offer %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [WeakRetained unfairLock];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  __int16 v15 = __39__ICQInAppMessaging__fetchPremiumOffer__block_invoke_88;
  BOOL v16 = &unk_264923B30;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  id v11 = v5;
  id v17 = v11;
  [v10 synchronized:&v13];

  id v12 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v12, "_recalculateAndPostCurrentMessage", v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __39__ICQInAppMessaging__fetchPremiumOffer__block_invoke_88(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPremiumOffer:v1];
}

- (void)_fetchDefaultOffer
{
  objc_initWeak(&location, self);
  char v3 = [(ICQInAppMessaging *)self sharedOfferManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__ICQInAppMessaging__fetchDefaultOffer__block_invoke;
  v4[3] = &unk_264923C80;
  objc_copyWeak(&v5, &location);
  [v3 getDefaultOfferWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__ICQInAppMessaging__fetchDefaultOffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 debugDescription];
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "In-app messages received default offer %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [WeakRetained unfairLock];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  __int16 v15 = __39__ICQInAppMessaging__fetchDefaultOffer__block_invoke_90;
  BOOL v16 = &unk_264923B30;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  id v11 = v5;
  id v17 = v11;
  [v10 synchronized:&v13];

  id v12 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v12, "_recalculateAndPostCurrentMessage", v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __39__ICQInAppMessaging__fetchDefaultOffer__block_invoke_90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDefaultOffer:v1];
}

- (unint64_t)_contentTypeForQuotaOffer:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQInAppMessaging *)self bundleID];
  if ([v5 isEqualToString:@"com.apple.iCloudDriveApp"]) {
    goto LABEL_6;
  }
  id v6 = [(ICQInAppMessaging *)self bundleID];
  if ([v6 isEqualToString:@"com.apple.finder"])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v7 = [(ICQInAppMessaging *)self bundleID];
  if ([v7 isEqualToString:@"com.apple.DocumentsApp"])
  {

    goto LABEL_5;
  }
  id v11 = [(ICQInAppMessaging *)self bundleID];
  char v12 = [v11 isEqualToString:@"com.apple.appkit.xpc.openAndSavePanelService"];

  if ((v12 & 1) == 0)
  {
    unint64_t v8 = [(ICQInAppMessaging *)self _contentTypeForMessageWithOffer:v4];
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v8 = [(ICQInAppMessaging *)self _contentTypeForDriveWithOffer:v4];
LABEL_8:
  unint64_t v9 = v8;

  return v9;
}

- (unint64_t)_contentTypeForMessageWithOffer:(id)a3
{
  return [a3 level] == 3;
}

- (unint64_t)_contentTypeForDriveWithOffer:(id)a3
{
  if ([a3 level] == 3) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)_symbolNameForQuotaOffer:(id)a3
{
  return @"exclamationmark.triangle";
}

- (id)_actionsForBannerSpecification:(id)a3 offer:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v8 = objc_msgSend(v5, "links", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [[ICQLinkInAppAction alloc] initWithLink:*(void *)(*((void *)&v15 + 1) + 8 * i) inOffer:v6];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_dismissActionForBannerSpecification:(id)a3 offer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 dismissLink];

  if (v7)
  {
    unint64_t v8 = [ICQLinkInAppAction alloc];
    uint64_t v9 = [v5 dismissLink];
    uint64_t v7 = [(ICQLinkInAppAction *)v8 initWithLink:v9 inOffer:v6];
  }
  return v7;
}

- (id)quotaMessageForOffer:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 isPremiumOffer];
    uint64_t v7 = @"regular";
    if (v6) {
      uint64_t v7 = @"premium";
    }
    *(_DWORD *)buf = 138543362;
    id v29 = v7;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "In-app messages sending %{public}@ offer message", buf, 0xCu);
  }

  unint64_t v8 = [v4 deviceInfo];
  uint64_t v9 = [(ICQInAppMessaging *)self placement];
  uint64_t v10 = [v4 messageSpecificationForPlacement:v9];

  v27 = v8;
  uint64_t v11 = [v8 key];
  v26 = [v10 titleWithKey:v11];

  char v12 = [v8 key];
  id v25 = [v10 messageWithKey:v12];

  v23 = [(ICQInAppMessaging *)self _actionsForBannerSpecification:v10 offer:v4];
  uint64_t v20 = [(ICQInAppMessaging *)self _dismissActionForBannerSpecification:v10 offer:v4];
  v24 = [v10 reason];
  id v21 = [(ICQInAppMessaging *)self _contentTypeForQuotaOffer:v4];
  uint64_t v13 = [ICQInAppMessage alloc];
  uint64_t v14 = [v4 offerId];
  long long v15 = [(ICQInAppMessaging *)self _symbolNameForQuotaOffer:v4];
  long long v16 = [(ICQInAppMessaging *)self _accountIdentifier];
  long long v17 = [(ICQInAppMessaging *)self bundleID];
  long long v18 = [v10 iconSpecification];
  v22 = [(ICQInAppMessage *)v13 initWithContentType:v21 identifier:v14 reason:v24 title:v26 subTitle:v25 sfSymbolName:v15 accountId:v16 bundleID:v17 actions:v23 dismissAction:v20 iconSpecification:v18];

  return v22;
}

- (id)airplaneModeOnMessageFromDefaultOffer:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "In-app messages sending airplane mode message", buf, 2u);
  }

  int v6 = [v4 deviceInfo];
  uint64_t v7 = [(ICQInAppMessaging *)self bundleID];
  unint64_t v8 = [(ICQInAppMessaging *)self placement];
  uint64_t v9 = [v4 messageSpecificationForReason:@"AirplaneModeOn" bundleId:v7 placement:v8];

  if (v9)
  {
    uint64_t v10 = [v6 key];
    uint64_t v39 = [v9 titleWithKey:v10];

    uint64_t v11 = [v6 key];
    uint64_t v37 = [v9 messageWithKey:v11];

    uint64_t v12 = [(ICQInAppMessaging *)self _actionsForBannerSpecification:v9 offer:v4];
    uint64_t v13 = [(ICQInAppMessaging *)self _dismissActionForBannerSpecification:v9 offer:v4];
    uint64_t v14 = [ICQInAppMessage alloc];
    long long v15 = [(ICQInAppMessaging *)self _accountIdentifier];
    long long v16 = [(ICQInAppMessaging *)self bundleID];
    long long v17 = [v9 iconSpecification];
    uint64_t v41 = (void *)v12;
    uint64_t v34 = v12;
    long long v18 = v6;
    v19 = v14;
    id v21 = (void *)v37;
    uint64_t v20 = (void *)v39;
    v22 = [(ICQInAppMessage *)v19 initWithContentType:0 identifier:@"AirplaneMode" reason:@"AirplaneModeOn" title:v39 subTitle:v37 sfSymbolName:0 accountId:v15 bundleID:v16 actions:v34 dismissAction:v13 iconSpecification:v17];
  }
  else
  {
    v36 = v6;
    id v38 = v4;
    v23 = _ICQGetLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v23, OS_LOG_TYPE_DEFAULT, "No message content found for Airplane Mode On, using default message", buf, 2u);
    }

    v24 = (void *)MEMORY[0x263F88908];
    id v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = objc_msgSend(v25, "localizedStringForKey:value:table:", @"AIRPLANE_MODE_ON_BUTTON_TITLE", &stru_26DFF2C90);
    uint64_t v44 = *MEMORY[0x263F88820];
    v45[0] = *MEMORY[0x263F88860];
    v27 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
    uint64_t v40 = [v24 linkWithText:v26 options:0 action:6 parameters:v27];

    id v28 = [[ICQLinkInAppAction alloc] initWithLink:v40];
    uint64_t v35 = [ICQInAppMessage alloc];
    uint64_t v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v29 = [v41 localizedStringForKey:@"AIRPLANE_MODE_ON_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    long long v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v16 = [v15 localizedStringForKey:@"AIRPLANE_MODE_ON_SUBTITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    long long v17 = [(ICQInAppMessaging *)self _accountIdentifier];
    uint64_t v30 = [(ICQInAppMessaging *)self bundleID];
    v43 = v28;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    char v32 = [0 iconSpecification];
    uint64_t v13 = (void *)v29;
    v22 = [(ICQInAppMessage *)v35 initWithContentType:0 identifier:@"AirplaneMode" reason:@"AirplaneModeOn" title:v29 subTitle:v16 sfSymbolName:0 accountId:v17 bundleID:v30 actions:v31 iconSpecification:v32];

    id v21 = v28;
    id v4 = v38;
    uint64_t v20 = (void *)v40;
    uint64_t v9 = 0;
    long long v18 = v36;
  }

  return v22;
}

- (id)serverUnreachableMessageFromDefaultOffer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceInfo];
  int v6 = [(ICQInAppMessaging *)self bundleID];
  uint64_t v7 = [(ICQInAppMessaging *)self placement];
  unint64_t v8 = [v4 messageSpecificationForReason:@"WiFiConnectivityIssues" bundleId:v6 placement:v7];

  v26 = v5;
  if (v8)
  {
    uint64_t v9 = [v5 key];
    uint64_t v24 = [v8 titleWithKey:v9];

    uint64_t v10 = [v5 key];
    uint64_t v11 = [v8 messageWithKey:v10];

    uint64_t v12 = [(ICQInAppMessaging *)self _actionsForBannerSpecification:v8 offer:v4];
    uint64_t v13 = [(ICQInAppMessaging *)self _dismissActionForBannerSpecification:v8 offer:v4];
    uint64_t v14 = [ICQInAppMessage alloc];
    long long v15 = [(ICQInAppMessaging *)self _accountIdentifier];
    long long v16 = [(ICQInAppMessaging *)self bundleID];
    long long v17 = [v8 iconSpecification];
    long long v18 = v14;
    v19 = (void *)v24;
    uint64_t v20 = [(ICQInAppMessage *)v18 initWithContentType:4 identifier:@"ServerUnreeachable" reason:@"WiFiConnectivityIssues" title:v24 subTitle:v11 sfSymbolName:0 accountId:v15 bundleID:v16 actions:v12 dismissAction:v13 iconSpecification:v17];
  }
  else
  {
    id v25 = [ICQInAppMessage alloc];
    id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v21 localizedStringForKey:@"SERVER_UNREACHABLE_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = v21;
    uint64_t v13 = [v12 localizedStringForKey:@"SERVER_UNREACHABLE_SUBTITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    long long v15 = [(ICQInAppMessaging *)self _accountIdentifier];
    long long v16 = [(ICQInAppMessaging *)self bundleID];
    long long v17 = [0 iconSpecification];
    uint64_t v20 = [(ICQInAppMessage *)v25 initWithContentType:4 identifier:@"ServerUnreeachable" reason:@"WiFiConnectivityIssues" title:v11 subTitle:v13 sfSymbolName:0 accountId:v15 bundleID:v16 actions:MEMORY[0x263EFFA68] iconSpecification:v17];
  }
  v22 = (void *)v20;

  return v22;
}

- (id)cellularDataOffMessageFromDefaultOffer:(id)a3
{
  v41[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 deviceInfo];
  int v6 = [(ICQInAppMessaging *)self bundleID];
  uint64_t v7 = [(ICQInAppMessaging *)self placement];
  unint64_t v8 = [v4 messageSpecificationForReason:@"CellularDataOff" bundleId:v6 placement:v7];

  uint64_t v37 = v5;
  id v38 = v4;
  if (v8)
  {
    uint64_t v9 = [v5 key];
    uint64_t v10 = [v8 titleWithKey:v9];

    uint64_t v11 = [v5 key];
    uint64_t v12 = [v8 messageWithKey:v11];

    uint64_t v13 = [(ICQInAppMessaging *)self _actionsForBannerSpecification:v8 offer:v4];
    uint64_t v14 = [(ICQInAppMessaging *)self _dismissActionForBannerSpecification:v8 offer:v4];
    long long v15 = [ICQInAppMessage alloc];
    long long v16 = [(ICQInAppMessaging *)self _accountIdentifier];
    long long v17 = [(ICQInAppMessaging *)self bundleID];
    long long v18 = [v8 iconSpecification];
    v19 = (void *)v10;
    uint64_t v20 = [(ICQInAppMessage *)v15 initWithContentType:0 identifier:@"CellularDataOff" reason:@"CellularDataOff" title:v10 subTitle:v12 sfSymbolName:0 accountId:v16 bundleID:v17 actions:v13 dismissAction:v14 iconSpecification:v18];
  }
  else
  {
    id v21 = (void *)MEMORY[0x263F88908];
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = objc_msgSend(v22, "localizedStringForKey:value:table:", @"CELLULAR_OFF_BUTTON_TITLE");
    uint64_t v40 = *MEMORY[0x263F88820];
    v41[0] = *MEMORY[0x263F88830];
    uint64_t v24 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    v36 = [v21 linkWithText:v23 options:0 action:6 parameters:v24];

    uint64_t v34 = [[ICQLinkInAppAction alloc] initWithLink:v36];
    uint64_t v35 = [ICQInAppMessage alloc];
    id v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"CELLULAR_OFF_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v28 = [v27 localizedStringForKey:@"CELLULAR_OFF_SUBTITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v29 = [(ICQInAppMessaging *)self _accountIdentifier];
    uint64_t v30 = [(ICQInAppMessaging *)self bundleID];
    uint64_t v39 = v34;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    char v32 = [0 iconSpecification];
    uint64_t v20 = [(ICQInAppMessage *)v35 initWithContentType:0 identifier:@"CellularDataOff" reason:@"CellularDataOff" title:v26 subTitle:v28 sfSymbolName:0 accountId:v29 bundleID:v30 actions:v31 iconSpecification:v32];
  }
  return v20;
}

- (id)termsNotAcceptedMessageFromDefaultOffer:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 deviceInfo];
  int v6 = [(ICQInAppMessaging *)self bundleID];
  uint64_t v7 = [(ICQInAppMessaging *)self placement];
  unint64_t v8 = [v4 messageSpecificationForReason:@"TermsNotAccepted" bundleId:v6 placement:v7];

  uint64_t v41 = v5;
  if (v8)
  {
    uint64_t v9 = [v5 key];
    uint64_t v39 = [v8 titleWithKey:v9];

    uint64_t v10 = [v5 key];
    uint64_t v11 = [v8 messageWithKey:v10];

    uint64_t v12 = [(ICQInAppMessaging *)self _actionsForBannerSpecification:v8 offer:v4];
    uint64_t v13 = [(ICQInAppMessaging *)self _dismissActionForBannerSpecification:v8 offer:v4];
    uint64_t v14 = [ICQInAppMessage alloc];
    long long v15 = [(ICQInAppMessaging *)self _accountIdentifier];
    long long v16 = [(ICQInAppMessaging *)self bundleID];
    [v8 iconSpecification];
    v18 = long long v17 = v4;
    v19 = [(ICQInAppMessage *)v14 initWithContentType:1 identifier:@"TermsNotAccepted" reason:@"TermsNotAccepted" title:v39 subTitle:v11 sfSymbolName:0 accountId:v15 bundleID:v16 actions:v12 dismissAction:v13 iconSpecification:v18];

    uint64_t v20 = v41;
  }
  else
  {
    id v40 = v4;
    id v21 = _ICQGetLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v21, OS_LOG_TYPE_DEFAULT, "No message content found for Terms not Accepted, using default message", buf, 2u);
    }

    v22 = (void *)MEMORY[0x263F88908];
    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v24 = objc_msgSend(v23, "localizedStringForKey:value:table:", @"TERMS_NOT_ACCEPTED_BUTTON_TITLE", &stru_26DFF2C90);
    uint64_t v44 = *MEMORY[0x263F88820];
    v45[0] = @"https://setup.icloud.com/email/prefs/storage?root=APPLE_ACCOUNT";
    id v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
    id v38 = [v22 linkWithText:v24 options:0 action:6 parameters:v25];

    v26 = [[ICQLinkInAppAction alloc] initWithLink:v38];
    uint64_t v37 = [ICQInAppMessage alloc];
    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v28 = [v27 localizedStringForKey:@"TERMS_NOT_ACCEPTED_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v30 = [v29 localizedStringForKey:@"TERMS_NOT_ACCEPTED_SUBTITLE" value:&stru_26DFF2C90 table:@"Localizable"];
    v31 = [(ICQInAppMessaging *)self _accountIdentifier];
    char v32 = [(ICQInAppMessaging *)self bundleID];
    v43 = v26;
    uint64_t v33 = v26;
    uint64_t v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    uint64_t v35 = [0 iconSpecification];
    v19 = [(ICQInAppMessage *)v37 initWithContentType:1 identifier:@"TermsNotAccepted" reason:@"TermsNotAccepted" title:v28 subTitle:v30 sfSymbolName:0 accountId:v31 bundleID:v32 actions:v34 iconSpecification:v35];

    long long v17 = v40;
    uint64_t v20 = v41;
    unint64_t v8 = 0;
  }

  return v19;
}

- (id)uploadFailureMessageForPendingItemCount:(id)a3 defaultOffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [MEMORY[0x263F88968] templateKeyForItemCount:v6];
  uint64_t v9 = [(ICQInAppMessaging *)self bundleID];
  uint64_t v10 = [(ICQInAppMessaging *)self placement];
  uint64_t v11 = [v7 messageSpecificationForReason:@"UploadFailure" bundleId:v9 placement:v10];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F88968] wordsToReplaceForItemCount:v6];
    uint64_t v13 = (void *)MEMORY[0x263F88978];
    uint64_t v14 = [v11 titleWithKey:v8];
    v31 = (void *)v12;
    uint64_t v30 = [v13 replaceWordsIn:v14 with:v12];

    long long v15 = (void *)MEMORY[0x263F88978];
    long long v16 = [v11 messageWithKey:v8];
    id v28 = [v15 replaceWordsIn:v16 with:v12];

    v27 = [(ICQInAppMessaging *)self _actionsForBannerSpecification:v11 offer:v7];
    v26 = [(ICQInAppMessaging *)self _dismissActionForBannerSpecification:v11 offer:v7];
    id v29 = v7;
    id v17 = v6;
    long long v18 = [ICQInAppMessage alloc];
    v19 = [(ICQInAppMessaging *)self _accountIdentifier];
    uint64_t v20 = [(ICQInAppMessaging *)self bundleID];
    [v11 iconSpecification];
    v22 = id v21 = v8;
    v23 = v18;
    id v6 = v17;
    id v7 = v29;
    uint64_t v24 = [(ICQInAppMessage *)v23 initWithContentType:1 identifier:@"UploadFailure" reason:@"UploadFailure" title:v30 subTitle:v28 sfSymbolName:0 accountId:v19 bundleID:v20 actions:v27 dismissAction:v26 iconSpecification:v22];

    unint64_t v8 = v21;
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)_recalculateCurrentMessage
{
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__13;
  v42 = __Block_byref_object_dispose__13;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__13;
  v36 = __Block_byref_object_dispose__13;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__13;
  uint64_t v30 = __Block_byref_object_dispose__13;
  id v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  char v3 = [(ICQInAppMessaging *)self unfairLock];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __47__ICQInAppMessaging__recalculateCurrentMessage__block_invoke;
  v21[3] = &unk_264923C58;
  v21[4] = self;
  v21[5] = &v38;
  v21[6] = &v32;
  v21[7] = &v26;
  v21[8] = &v22;
  [v3 synchronized:v21];

  id v4 = [(ICQInAppMessaging *)self mockMessage];

  if (v4)
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "In-app messages sending mock message", v20, 2u);
    }

    uint64_t v6 = [(ICQInAppMessaging *)self mockMessage];
    goto LABEL_5;
  }
  if (!*((unsigned char *)v23 + 24))
  {
    if ([(ICQInAppMessaging *)self isAirplaneModeEnabled])
    {
      uint64_t v6 = [(ICQInAppMessaging *)self airplaneModeOnMessageFromDefaultOffer:v27[5]];
    }
    else
    {
      BOOL v14 = [(ICQInAppMessaging *)self _isCellularDataOff];
      uint64_t v15 = v27[5];
      if (v14) {
        [(ICQInAppMessaging *)self cellularDataOffMessageFromDefaultOffer:v15];
      }
      else {
      uint64_t v6 = [(ICQInAppMessaging *)self serverUnreachableMessageFromDefaultOffer:v15];
      }
    }
    goto LABEL_5;
  }
  if ([(ICQInAppMessaging *)self _termsNotAccepted])
  {
    uint64_t v6 = [(ICQInAppMessaging *)self termsNotAcceptedMessageFromDefaultOffer:v27[5]];
LABEL_5:
    id v7 = (void *)v6;
    goto LABEL_6;
  }
  uint64_t v9 = (void *)v39[5];
  uint64_t v10 = [(ICQInAppMessaging *)self placement];
  uint64_t v11 = [v9 messageSpecificationForPlacement:v10];
  if (v11)
  {
    uint64_t v12 = [(id)v39[5] level];

    if (v12)
    {
      uint64_t v13 = v39;
LABEL_24:
      uint64_t v6 = [(ICQInAppMessaging *)self quotaMessageForOffer:v13[5]];
      goto LABEL_5;
    }
  }
  else
  {
  }
  long long v16 = (void *)v33[5];
  id v17 = [(ICQInAppMessaging *)self placement];
  long long v18 = [v16 messageSpecificationForPlacement:v17];
  if (v18)
  {
    uint64_t v19 = [(id)v33[5] level];

    if (v19)
    {
      uint64_t v13 = v33;
      goto LABEL_24;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_6:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v7;
}

uint64_t __47__ICQInAppMessaging__recalculateCurrentMessage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) regularOffer];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) premiumOffer];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 32) defaultOffer];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t result = [*(id *)(a1 + 32) isICloudReachable];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (void)_recalculateAndPostCurrentMessage
{
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ICQInAppMessaging__recalculateAndPostCurrentMessage__block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(messageQueue, block);
}

void __54__ICQInAppMessaging__recalculateAndPostCurrentMessage__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _recalculateCurrentMessage];
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) lastMessage];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v2;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Last in-app message: %{public}@.\nNew in-app message: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) lastMessage];
  if ([v2 isEqual:v5])
  {
  }
  else
  {
    if (v2)
    {

      goto LABEL_12;
    }
    id v7 = [*(id *)(a1 + 32) lastMessage];

    if (v7) {
      goto LABEL_12;
    }
  }
  if ([*(id *)(a1 + 32) hasNewObserver])
  {
LABEL_12:
    [*(id *)(a1 + 32) _postMessage:v2];
    goto LABEL_13;
  }
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = v2;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "In-app messages skipping notification for message because there has been no change to message: %{public}@", (uint8_t *)&v8, 0xCu);
  }

LABEL_13:
  [*(id *)(a1 + 32) setLastMessage:v2];
}

- (void)_postMessage:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(ICQInAppMessaging *)self setHasNewObserver:0];
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "In-app messages posting notification for message: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ICQInAppMessaging__postMessage___block_invoke;
  block[3] = &unk_264921C80;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v7 = [(ICQInAppMessaging *)self bundleID];
  +[ICQAnalytics logInAppBannerImpressionWithAppIdentifier:v7];
}

void __34__ICQInAppMessaging__postMessage___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __34__ICQInAppMessaging__postMessage___block_invoke_2;
    v3[3] = &unk_264921C80;
    id v4 = v1;
    [v4 fetchIconIfNeededWithCompletion:v3];
  }
  else
  {
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:@"ICQCurrentInAppMessageChangedNotification" object:0 userInfo:MEMORY[0x263EFFA78]];
  }
}

void __34__ICQInAppMessaging__postMessage___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = @"ICQInAppMessage";
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"ICQCurrentInAppMessageChangedNotification" object:0 userInfo:v4];
}

- (BOOL)_termsNotAccepted
{
  id v2 = [(ICQInAppMessaging *)self accountStore];
  uint64_t v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  char v4 = objc_msgSend(v3, "aa_needsToVerifyTerms");

  return v4;
}

- (id)_accountIdentifier
{
  id v2 = [(ICQInAppMessaging *)self accountStore];
  uint64_t v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  char v4 = [v3 identifier];

  return v4;
}

- (BOOL)_isCellularDataOff
{
  char v6 = 1;
  char v5 = 1;
  uint64_t CellularDataSettings = _CTServerConnectionGetCellularDataSettings();
  if (CellularDataSettings)
  {
    uint64_t v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(ICQInAppMessaging *)CellularDataSettings _isCellularDataOff];
    }
  }
  return v5 == 0;
}

- (void)_observeUpdatesForBundleID:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Client requested in-app message updates in bundle %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(ICQInAppMessaging *)self observeUpdatesForBundleID:v4 placement:@"InApp"];
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (RadiosPreferences)radioPrefs
{
  return self->_radioPrefs;
}

- (void)setRadioPrefs:(id)a3
{
}

- (ICQOfferManager)sharedOfferManager
{
  return self->_sharedOfferManager;
}

- (void)setSharedOfferManager:(id)a3
{
}

- (ICQOffer)regularOffer
{
  return self->_regularOffer;
}

- (void)setRegularOffer:(id)a3
{
}

- (ICQPremiumOffer)premiumOffer
{
  return self->_premiumOffer;
}

- (void)setPremiumOffer:(id)a3
{
}

- (ICQOffer)defaultOffer
{
  return self->_defaultOffer;
}

- (void)setDefaultOffer:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (ICQInAppMessage)mockMessage
{
  return self->_mockMessage;
}

- (void)setMockMessage:(id)a3
{
}

- (OS_nw_path_monitor)connectivityMonitor
{
  return self->_connectivityMonitor;
}

- (void)setConnectivityMonitor:(id)a3
{
}

- (BOOL)isICloudReachable
{
  return self->_iCloudReachable;
}

- (void)setICloudReachable:(BOOL)a3
{
  self->_iCloudReachable = a3;
}

- (ICQInAppMessage)lastMessage
{
  return self->_lastMessage;
}

- (void)setLastMessage:(id)a3
{
}

- (BOOL)hasNewObserver
{
  return self->_hasNewObserver;
}

- (void)setHasNewObserver:(BOOL)a3
{
  self->_hasNewObserver = a3;
}

- (ICQUnfairLock)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (BOOL)isRegisteredForNotifications
{
  return self->_isRegisteredForNotifications;
}

- (void)setIsRegisteredForNotifications:(BOOL)a3
{
  self->_isRegisteredForNotifications = a3;
}

- (NSString)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_unfairLock, 0);
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_connectivityMonitor, 0);
  objc_storeStrong((id *)&self->_mockMessage, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_defaultOffer, 0);
  objc_storeStrong((id *)&self->_premiumOffer, 0);
  objc_storeStrong((id *)&self->_regularOffer, 0);
  objc_storeStrong((id *)&self->_sharedOfferManager, 0);
  objc_storeStrong((id *)&self->_radioPrefs, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_radiosPrefsQueue, 0);
  objc_storeStrong((id *)&self->_connectivityQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
}

- (void)fetchMessageForReason:(uint64_t)a1 pendingItemsCount:(NSObject *)a2 withCompletion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Unable to find in-app message for reason %@", (uint8_t *)&v2, 0xCu);
}

- (void)_isCellularDataOff
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Error retrieving state for cellular data switch. Domain: %d, error: %d", (uint8_t *)v3, 0xEu);
}

@end