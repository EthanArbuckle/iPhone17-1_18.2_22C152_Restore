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

- (void)addObserver:(id)a3
{
  id v6 = a3;
  v4 = [(MTReachability *)self callbacks];
  objc_sync_enter(v4);
  v5 = [(MTReachability *)self callbacks];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)_updateGlobalCellularWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CTServerConnectionCreateOnTargetQueue();
  if (v5)
  {
    cellularQueue = self->_cellularQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100027EE8;
    block[3] = &unk_10054DC88;
    uint64_t v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(cellularQueue, block);
  }
}

- (MTReachability)init
{
  v19.receiver = self;
  v19.super_class = (Class)MTReachability;
  v2 = [(MTReachability *)&v19 init];
  if (v2)
  {
    v3 = _MTLogCategoryNetwork();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing Reachability", buf, 2u);
    }

    uint64_t v4 = +[NSHashTable weakObjectsHashTable];
    callbacks = v2->_callbacks;
    v2->_callbacks = (NSHashTable *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MTReachability.cellularQueue", 0);
    cellularQueue = v2->_cellularQueue;
    v2->_cellularQueue = (OS_dispatch_queue *)v6;

    v2->_hasDeterminedActualGlobalCellularState = 0;
    id v8 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
    v2->_globalCellularEnabled = [v8 BOOLForKey:@"MTGlobalCellularUserDefaultKey"];

    uint64_t v9 = +[ITMReachability reachabilityForInternetConnection];
    reachability = v2->_reachability;
    v2->_reachability = (ITMReachability *)v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_updateReachability" name:kReachabilityChangedNotification object:v2->_reachability];

    [(ITMReachability *)v2->_reachability startNotifier];
    [(MTReachability *)v2 _updateReachability];
    v12 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v12;

    [(RadiosPreferences *)v2->_radiosPreferences setDelegate:v2];
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"_applicationDidBecomeActive" name:MTApplicationDidBecomeActiveNotification object:0];

    [(MTReachability *)v2 _updateAirplaneMode];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000594A8;
    v16[3] = &unk_10054D570;
    v17 = v2;
    [(MTReachability *)v17 _updateGlobalCellularWithCompletion:v16];
  }
  return v2;
}

- (void)setHasDeterminedActualGlobalCellularState:(BOOL)a3
{
  self->_hasDeterminedActualGlobalCellularState = a3;
  if (a3)
  {
    id v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
    [v4 setBool:[self isGlobalCellularEnabled] forKey:@"MTGlobalCellularUserDefaultKey"];
  }
}

- (void)setGlobalCellularEnabled:(BOOL)a3
{
  self->_globalCellularEnabled = a3;
  [(MTReachability *)self setHasDeterminedActualGlobalCellularState:1];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000079C4;
  block[3] = &unk_10054D910;
  block[4] = a1;
  if (qword_10060A7F0 != -1) {
    dispatch_once(&qword_10060A7F0, block);
  }
  v2 = (void *)qword_10060A7E8;

  return v2;
}

- (void)_updateReachability
{
  v3 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating reachability", buf, 2u);
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
  id v8 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(MTReachability *)self reachability];
    id v10 = [v9 currentReachabilityStatus];
    *(_DWORD *)buf = 134217984;
    *(void *)v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "\treachability status <%ld>", buf, 0xCu);
  }
  v11 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [(MTReachability *)self isGlobalCellularEnabled];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "\tcellular enabled <%x>", buf, 8u);
  }

  v13 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(MTReachability *)self hasDeterminedActualGlobalCellularState];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v14 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "\tis using cached global cellular setting <%x>", buf, 8u);
  }

  v15 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = [(MTReachability *)self isReachable];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v30 = v4;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "\treachability changing from %i to %i", buf, 0xEu);
  }

  v17 = [(MTReachability *)self callbacks];
  objc_sync_enter(v17);
  v18 = [(MTReachability *)self callbacks];
  id v19 = [v18 copy];

  objc_sync_exit(v17);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v20 = v19;
  id v21 = [v20 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v23) reachabilityChangedFrom:v4 to:[self isReachable:v24]];
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v20 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (NSHashTable)callbacks
{
  return self->_callbacks;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (ITMReachability)reachability
{
  return self->_reachability;
}

- (BOOL)isGlobalCellularEnabled
{
  return self->_globalCellularEnabled;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (BOOL)hasDeterminedActualGlobalCellularState
{
  return self->_hasDeterminedActualGlobalCellularState;
}

- (void)_updateAirplaneMode
{
  [(RadiosPreferences *)self->_radiosPreferences refresh];
  unsigned int v3 = [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
  if (self->_airplaneModeEnabled != v3)
  {
    self->_airplaneModeEnabled = v3;
    id v5 = +[NSNotificationCenter defaultCenter];
    BOOL v4 = +[NSNumber numberWithBool:self->_airplaneModeEnabled];
    [v5 postNotificationName:@"MTAirplaneModeChangedNotification" object:v4];
  }
}

- (void)_applicationDidBecomeActive
{
  [(MTReachability *)self _updateAirplaneMode];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10005925C;
  v3[3] = &unk_10054D570;
  v3[4] = self;
  [(MTReachability *)self _updateGlobalCellularWithCompletion:v3];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  unsigned int v3 = [(MTReachability *)self reachability];
  [v3 stopNotifier];

  BOOL v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = kReachabilityChangedNotification;
  int64_t v6 = [(MTReachability *)self reachability];
  [v4 removeObserver:self name:v5 object:v6];

  v7.receiver = self;
  v7.super_class = (Class)MTReachability;
  [(MTReachability *)&v7 dealloc];
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(MTReachability *)self callbacks];
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
      unsigned int v3 = +[NSBundle mainBundle];
      BOOL v4 = v3;
      CFStringRef v5 = @"Airplane Mode";
      goto LABEL_6;
    case 2uLL:
      int v7 = MGGetBoolAnswer();
      id v8 = @"NO_WIFI";
      if (v7) {
        id v8 = @"NO_WLAN";
      }
      uint64_t v9 = v8;
      BOOL v4 = +[NSBundle mainBundle];
      id v6 = [v4 localizedStringForKey:v9 value:&stru_10056A8A0 table:0];

      goto LABEL_10;
    case 3uLL:
      unsigned int v3 = +[NSBundle mainBundle];
      BOOL v4 = v3;
      CFStringRef v5 = @"No Internet";
LABEL_6:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_10056A8A0 table:0];
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
    if ((id)[(MTReachability *)self networkStatus] == (id)2)
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
  unsigned int v3 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
  if ([v3 BOOLForKey:kMTWiFiDownloadOnly]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(MTReachability *)self isGlobalCellularEnabled];
  }

  return v4;
}

- (BOOL)isReachableViaCellular
{
  return (id)[(MTReachability *)self networkStatus] == (id)2;
}

- (BOOL)isReachableViaWifi
{
  return (id)[(MTReachability *)self networkStatus] == (id)1;
}

- (void)_showAlertForInternetUnavailableReason:(unint64_t)a3 completion:(id)a4
{
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
      id v8 = v7;
      uint64_t v9 = +[NSBundle mainBundle];
      id v10 = [v9 localizedStringForKey:v8 value:&stru_10056A8A0 table:0];

      v11 = +[PSAirplaneModeSettingsDetail preferencesURL];
      goto LABEL_10;
    case 2uLL:
      v13 = +[NSBundle mainBundle];
      id v10 = [v13 localizedStringForKey:@"ALERT_TITLE_GLOBAL_CELLULAR_DISABLED" value:&stru_10056A8A0 table:0];

      int v14 = MGGetBoolAnswer();
      v15 = @"ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WIFI";
      if (v14) {
        v15 = @"ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WLAN";
      }
      unsigned int v16 = v15;
      v17 = +[NSBundle mainBundle];
      unsigned int v12 = [v17 localizedStringForKey:v16 value:&stru_10056A8A0 table:0];

      v11 = +[PSCellularDataSettingsDetail preferencesURL];
      goto LABEL_11;
    case 3uLL:
      v18 = +[NSBundle mainBundle];
      id v10 = [v18 localizedStringForKey:@"ALERT_TITLE_NO_INTERNET" value:&stru_10056A8A0 table:0];

      v11 = 0;
LABEL_10:
      unsigned int v12 = 0;
      goto LABEL_11;
    default:
      v11 = 0;
      unsigned int v12 = 0;
      id v10 = 0;
LABEL_11:
      id v19 = +[MTAlertController alertControllerWithTitle:v10 message:v12 preferredStyle:1];
      if (v11)
      {
        id v20 = +[NSBundle mainBundle];
        id v21 = [v20 localizedStringForKey:@"Settings" value:&stru_10056A8A0 table:0];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1000E82D4;
        v28[3] = &unk_1005510F8;
        id v29 = v11;
        id v30 = v5;
        uint64_t v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v28];

        [v19 addAction:v22];
      }
      v23 = +[NSBundle mainBundle];
      long long v24 = [v23 localizedStringForKey:@"OK" value:&stru_10056A8A0 table:0];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000E8344;
      v26[3] = &unk_100550688;
      id v27 = v5;
      long long v25 = +[UIAlertAction actionWithTitle:v24 style:0 handler:v26];

      [v19 addAction:v25];
      [v19 presentAnimated:1 completion:0];

LABEL_14:
      return;
  }
}

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setReachability:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularQueue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);

  objc_storeStrong((id *)&self->_reachability, 0);
}

@end