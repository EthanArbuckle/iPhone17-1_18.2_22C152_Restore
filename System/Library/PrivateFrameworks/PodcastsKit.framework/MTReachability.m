@interface MTReachability
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (BOOL)hasDeterminedActualGlobalCellularState;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isGlobalCellularEnabled;
- (BOOL)isPodcastsCellularDownloadsEnabled;
- (BOOL)isReachable;
- (BOOL)isReachableViaCellular;
- (BOOL)isReachableViaWifi;
- (BOOL)showInternetUnreachableDialog;
- (BOOL)showInternetUnreachableDialogWithAcknowledmentBlock:(id)a3;
- (ITMReachability)reachability;
- (MTReachability)init;
- (NSHashTable)callbacks;
- (OS_dispatch_queue)cellularQueue;
- (RadiosPreferences)radiosPreferences;
- (id)copy;
- (id)reasonTextForNoInternet;
- (int64_t)networkStatus;
- (unint64_t)reasonForNoInternet;
- (void)_applicationDidBecomeActive;
- (void)_showAlertForInternetUnavailableReason:(unint64_t)a3 completion:(id)a4;
- (void)_updateAirplaneMode;
- (void)_updateGlobalCellularWithCompletion:(id)a3;
- (void)_updateReachability;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setCallbacks:(id)a3;
- (void)setCellularQueue:(id)a3;
- (void)setGlobalCellularEnabled:(BOOL)a3;
- (void)setHasDeterminedActualGlobalCellularState:(BOOL)a3;
- (void)setNetworkStatus:(int64_t)a3;
- (void)setRadiosPreferences:(id)a3;
- (void)setReachability:(id)a3;
- (void)setReachable:(BOOL)a3;
@end

@implementation MTReachability

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MTReachability_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

void __32__MTReachability_sharedInstance__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___MTReachability;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = v1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTReachability)init
{
  v19.receiver = self;
  v19.super_class = (Class)MTReachability;
  v2 = [(MTReachability *)&v19 init];
  if (v2)
  {
    objc_super v3 = _MTLogCategoryNetwork();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F08F000, v3, OS_LOG_TYPE_DEFAULT, "Initializing Reachability", buf, 2u);
    }

    uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    callbacks = v2->_callbacks;
    v2->_callbacks = (NSHashTable *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MTReachability.cellularQueue", 0);
    cellularQueue = v2->_cellularQueue;
    v2->_cellularQueue = (OS_dispatch_queue *)v6;

    v2->_hasDeterminedActualGlobalCellularState = 0;
    v8 = [MEMORY[0x263EFFA40] _applePodcastsFoundationSharedUserDefaults];
    v2->_globalCellularEnabled = [v8 BOOLForKey:@"MTGlobalCellularUserDefaultKey"];

    uint64_t v9 = [MEMORY[0x263F5E9C0] reachabilityForInternetConnection];
    reachability = v2->_reachability;
    v2->_reachability = (ITMReachability *)v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel__updateReachability name:*MEMORY[0x263F5ED48] object:v2->_reachability];

    [(ITMReachability *)v2->_reachability startNotifier];
    [(MTReachability *)v2 _updateReachability];
    v12 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x263F255D8]);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v12;

    [(RadiosPreferences *)v2->_radiosPreferences setDelegate:v2];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v2 selector:sel__applicationDidBecomeActive name:*MEMORY[0x263F5E9A0] object:0];

    [(MTReachability *)v2 _updateAirplaneMode];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __22__MTReachability_init__block_invoke;
    v16[3] = &unk_265055830;
    v17 = v2;
    [(MTReachability *)v17 _updateGlobalCellularWithCompletion:v16];
  }
  return v2;
}

uint64_t __22__MTReachability_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateReachability];
}

- (void)dealloc
{
  objc_super v3 = [(MTReachability *)self reachability];
  [v3 stopNotifier];

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F5ED48];
  dispatch_queue_t v6 = [(MTReachability *)self reachability];
  [v4 removeObserver:self name:v5 object:v6];

  v7.receiver = self;
  v7.super_class = (Class)MTReachability;
  [(MTReachability *)&v7 dealloc];
}

- (void)_applicationDidBecomeActive
{
  [(MTReachability *)self _updateAirplaneMode];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__MTReachability__applicationDidBecomeActive__block_invoke;
  v3[3] = &unk_265055830;
  v3[4] = self;
  [(MTReachability *)self _updateGlobalCellularWithCompletion:v3];
}

uint64_t __45__MTReachability__applicationDidBecomeActive__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateReachability];
}

- (void)_updateReachability
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  objc_super v3 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F08F000, v3, OS_LOG_TYPE_DEFAULT, "Updating reachability", buf, 2u);
  }

  BOOL v4 = [(MTReachability *)self isReachable];
  uint64_t v5 = [(MTReachability *)self reachability];
  -[MTReachability setNetworkStatus:](self, "setNetworkStatus:", [v5 currentReachabilityStatus]);

  [(MTReachability *)self setReachable:1];
  int64_t v6 = [(MTReachability *)self networkStatus];
  if (v6)
  {
    if (v6 == 1)
    {
      BOOL v7 = 1;
    }
    else
    {
      if (v6 != 2) {
        goto LABEL_10;
      }
      BOOL v7 = [(MTReachability *)self isGlobalCellularEnabled];
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  [(MTReachability *)self setReachable:v7];
LABEL_10:
  v8 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(MTReachability *)self reachability];
    uint64_t v10 = [v9 currentReachabilityStatus];
    *(_DWORD *)buf = 134217984;
    *(void *)v30 = v10;
    _os_log_impl(&dword_23F08F000, v8, OS_LOG_TYPE_DEFAULT, "\treachability status <%ld>", buf, 0xCu);
  }
  v11 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [(MTReachability *)self isGlobalCellularEnabled];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v12;
    _os_log_impl(&dword_23F08F000, v11, OS_LOG_TYPE_DEFAULT, "\tcellular enabled <%x>", buf, 8u);
  }

  v13 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = [(MTReachability *)self hasDeterminedActualGlobalCellularState];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = !v14;
    _os_log_impl(&dword_23F08F000, v13, OS_LOG_TYPE_DEFAULT, "\tis using cached global cellular setting <%x>", buf, 8u);
  }

  v15 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = [(MTReachability *)self isReachable];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v30 = v4;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v16;
    _os_log_impl(&dword_23F08F000, v15, OS_LOG_TYPE_DEFAULT, "\treachability changing from %i to %i", buf, 0xEu);
  }

  v17 = [(MTReachability *)self callbacks];
  objc_sync_enter(v17);
  v18 = [(MTReachability *)self callbacks];
  objc_super v19 = (void *)[v18 copy];

  objc_sync_exit(v17);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v23++), "reachabilityChangedFrom:to:", v4, -[MTReachability isReachable](self, "isReachable", (void)v24));
      }
      while (v21 != v23);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }
}

- (void)setGlobalCellularEnabled:(BOOL)a3
{
  self->_globalCellularEnabled = a3;
  [(MTReachability *)self setHasDeterminedActualGlobalCellularState:1];
}

- (void)setHasDeterminedActualGlobalCellularState:(BOOL)a3
{
  self->_hasDeterminedActualGlobalCellularState = a3;
  if (a3)
  {
    id v4 = [MEMORY[0x263EFFA40] _applePodcastsFoundationSharedUserDefaults];
    objc_msgSend(v4, "setBool:forKey:", -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled"), @"MTGlobalCellularUserDefaultKey");
  }
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  id v4 = [(MTReachability *)self callbacks];
  objc_sync_enter(v4);
  uint64_t v5 = [(MTReachability *)self callbacks];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  id v4 = [(MTReachability *)self callbacks];
  objc_sync_enter(v4);
  uint64_t v5 = [(MTReachability *)self callbacks];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (id)reasonTextForNoInternet
{
  unint64_t v2 = [(MTReachability *)self reasonForNoInternet];
  switch(v2)
  {
    case 1uLL:
      objc_super v3 = [MEMORY[0x263F086E0] mainBundle];
      id v4 = v3;
      uint64_t v5 = @"Airplane Mode";
      goto LABEL_6;
    case 2uLL:
      int v7 = MGGetBoolAnswer();
      v8 = @"NO_WIFI";
      if (v7) {
        v8 = @"NO_WLAN";
      }
      uint64_t v9 = (void *)MEMORY[0x263F086E0];
      uint64_t v10 = v8;
      id v4 = [v9 mainBundle];
      id v6 = [v4 localizedStringForKey:v10 value:&stru_26F2CCBC8 table:0];

      goto LABEL_10;
    case 3uLL:
      objc_super v3 = [MEMORY[0x263F086E0] mainBundle];
      id v4 = v3;
      uint64_t v5 = @"No Internet";
LABEL_6:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_26F2CCBC8 table:0];
LABEL_10:

      goto LABEL_12;
  }
  id v6 = 0;
LABEL_12:
  return v6;
}

- (BOOL)showInternetUnreachableDialog
{
  return [(MTReachability *)self showInternetUnreachableDialogWithAcknowledmentBlock:0];
}

- (BOOL)showInternetUnreachableDialogWithAcknowledmentBlock:(id)a3
{
  id v4 = a3;
  if ([(MTReachability *)self isReachable]
    || (unint64_t v5 = [(MTReachability *)self reasonForNoInternet]) == 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    [(MTReachability *)self _showAlertForInternetUnavailableReason:v5 completion:v4];
    BOOL v6 = 1;
  }

  return v6;
}

- (unint64_t)reasonForNoInternet
{
  if ([(MTReachability *)self networkStatus])
  {
    if ([(MTReachability *)self networkStatus] == 2)
    {
      if ([(MTReachability *)self isGlobalCellularEnabled]) {
        return 0;
      }
      else {
        return 2;
      }
    }
    else
    {
      return 0;
    }
  }
  else if ([(MTReachability *)self isAirplaneModeEnabled])
  {
    return 1;
  }
  else if ([(MTReachability *)self isGlobalCellularEnabled] || (MGGetBoolAnswer() & 1) == 0)
  {
    return 3;
  }
  else
  {
    return 2;
  }
}

- (BOOL)isPodcastsCellularDownloadsEnabled
{
  objc_super v3 = [MEMORY[0x263EFFA40] _applePodcastsFoundationSettingsUserDefaults];
  BOOL v4 = ([v3 BOOLForKey:*MEMORY[0x263F5EBF0]] & 1) == 0
    && [(MTReachability *)self isGlobalCellularEnabled];

  return v4;
}

- (BOOL)isReachableViaCellular
{
  return [(MTReachability *)self networkStatus] == 2;
}

- (BOOL)isReachableViaWifi
{
  return [(MTReachability *)self networkStatus] == 1;
}

- (void)_showAlertForInternetUnavailableReason:(unint64_t)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      int v6 = MGGetBoolAnswer();
      int v7 = @"ALERT_TITLE_AIRPLANE_MODE_WIFI";
      if (v6) {
        int v7 = @"ALERT_TITLE_AIRPLANE_MODE_WLAN";
      }
      v8 = (void *)MEMORY[0x263F086E0];
      uint64_t v9 = v7;
      uint64_t v10 = [v8 mainBundle];
      v11 = [v10 localizedStringForKey:v9 value:&stru_26F2CCBC8 table:0];

      BOOL v12 = [MEMORY[0x263F5FAD0] preferencesURL];
      goto LABEL_10;
    case 2uLL:
      BOOL v14 = [MEMORY[0x263F086E0] mainBundle];
      v11 = [v14 localizedStringForKey:@"ALERT_TITLE_GLOBAL_CELLULAR_DISABLED" value:&stru_26F2CCBC8 table:0];

      int v15 = MGGetBoolAnswer();
      BOOL v16 = @"ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WIFI";
      if (v15) {
        BOOL v16 = @"ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WLAN";
      }
      v17 = (void *)MEMORY[0x263F086E0];
      v18 = v16;
      objc_super v19 = [v17 mainBundle];
      v13 = [v19 localizedStringForKey:v18 value:&stru_26F2CCBC8 table:0];

      BOOL v12 = [MEMORY[0x263F5FB28] preferencesURL];
      goto LABEL_11;
    case 3uLL:
      id v20 = [MEMORY[0x263F086E0] mainBundle];
      v11 = [v20 localizedStringForKey:@"ALERT_TITLE_NO_INTERNET" value:&stru_26F2CCBC8 table:0];

      BOOL v12 = 0;
LABEL_10:
      v13 = 0;
      goto LABEL_11;
    default:
      BOOL v12 = 0;
      v13 = 0;
      v11 = 0;
LABEL_11:
      uint64_t v21 = _MTLogCategoryNetwork();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412546;
        uint64_t v23 = v11;
        __int16 v24 = 2112;
        long long v25 = v13;
        _os_log_impl(&dword_23F08F000, v21, OS_LOG_TYPE_ERROR, "Unable to show Internet Unavailable dialog. Title = [%@], Message = [%@]", (uint8_t *)&v22, 0x16u);
      }

LABEL_14:
      return;
  }
}

- (void)_updateGlobalCellularWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CTServerConnectionCreateOnTargetQueue();
  if (v5)
  {
    cellularQueue = self->_cellularQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__MTReachability__updateGlobalCellularWithCompletion___block_invoke;
    block[3] = &unk_265055880;
    uint64_t v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(cellularQueue, block);
  }
}

void __54__MTReachability__updateGlobalCellularWithCompletion___block_invoke(uint64_t a1)
{
  location[1] = 0;
  unint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  objc_super v3 = [v2 bundleIdentifier];

  _CTServerConnectionCopyCellularUsagePolicy();
  CFRelease(*(CFTypeRef *)(a1 + 48));
  if ([MEMORY[0x263F5FB28] isEnabled]) {
    char v4 = MGGetBoolAnswer();
  }
  else {
    char v4 = 0;
  }
  objc_initWeak(location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__MTReachability__updateGlobalCellularWithCompletion___block_invoke_2;
  block[3] = &unk_265055858;
  objc_copyWeak(&v7, location);
  char v8 = 0;
  char v9 = v4;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(location);
}

uint64_t __54__MTReachability__updateGlobalCellularWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v2 = *(unsigned char *)(a1 + 49) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setGlobalCellularEnabled:v2];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_updateAirplaneMode
{
  [(RadiosPreferences *)self->_radiosPreferences refresh];
  int v3 = [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
  if (self->_airplaneModeEnabled != v3)
  {
    self->_airplaneModeEnabled = v3;
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    char v4 = [NSNumber numberWithBool:self->_airplaneModeEnabled];
    [v5 postNotificationName:@"MTAirplaneModeChangedNotification" object:v4];
  }
}

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (BOOL)isGlobalCellularEnabled
{
  return self->_globalCellularEnabled;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (ITMReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (NSHashTable)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
}

- (OS_dispatch_queue)cellularQueue
{
  return self->_cellularQueue;
}

- (void)setCellularQueue:(id)a3
{
}

- (BOOL)hasDeterminedActualGlobalCellularState
{
  return self->_hasDeterminedActualGlobalCellularState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularQueue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
}

@end