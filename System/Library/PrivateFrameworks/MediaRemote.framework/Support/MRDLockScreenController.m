@interface MRDLockScreenController
- (BOOL)_onQueue_calculateShouldShowLockScreenForReason:(id *)a3;
- (BOOL)_onQueue_isLockScreenWidgetVisible;
- (BOOL)hasLockScreenAssertion;
- (BOOL)hasLockScreenRecommendationAssertion;
- (BOOL)hasPresentedForCurrentPersonalDevices;
- (BOOL)isLockScreenRecommendationActive;
- (BOOL)isLockScreenWidgetActive;
- (BOOL)isLockScreenWidgetVisible;
- (BOOL)shouldFinishPresentationForCurrentPersonalDevices;
- (MRDLockScreenAssertion)legacyAssertion;
- (MRDLockScreenContentController)contentController;
- (MRDLockScreenController)init;
- (MRDLockScreenControllerDelegate)delegate;
- (MRDPersonalDeviceController)personalDeviceController;
- (MRLockScreenUIControllable)uiController;
- (MRPlayerPath)electedPlayerPath;
- (MRPlayerPath)playerPath;
- (MRPlayerPath)previousPlayerPath;
- (int64_t)changeType;
- (int64_t)eventType;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleElectedPlayerDidChangeNotification:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_onQueue_reevaluateShouldShowLockScreenForReason:(id)a3;
- (void)_onSerialQueue_restoreElectedPlayer;
- (void)lockScreenContentControllerStateDidChange:(id)a3;
- (void)personalDeviceControllerStateDidChange:(id)a3;
- (void)routeRecommendationDismissed;
- (void)setChangeType:(int64_t)a3;
- (void)setContentController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElectedPlayerPath:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setHasLockScreenAssertion:(BOOL)a3;
- (void)setHasLockScreenRecommendationAssertion:(BOOL)a3;
- (void)setHasPresentedForCurrentPersonalDevices:(BOOL)a3;
- (void)setLegacyAssertion:(id)a3;
- (void)setLockScreenRecommendationActive:(BOOL)a3;
- (void)setPersonalDeviceController:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPreviousPlayerPath:(id)a3;
- (void)setShouldFinishPresentationForCurrentPersonalDevices:(BOOL)a3;
- (void)setUiController:(id)a3;
@end

@implementation MRDLockScreenController

- (BOOL)_onQueue_calculateShouldShowLockScreenForReason:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_playerPath)
  {
    v6 = [(MRDLockScreenController *)self personalDeviceController];
    if ([v6 personalDeviceWasRecentlyAttached])
    {
      v7 = [(MRDLockScreenController *)self contentController];
      if ([v7 lockScreenPlatterHasContent]
        && [(MRDDisplayMonitor *)self->_displayMonitor lockScreenVisible])
      {
        unsigned __int8 v8 = [(MRDLockScreenController *)self shouldFinishPresentationForCurrentPersonalDevices];

        if ((v8 & 1) == 0)
        {
          BOOL v5 = 1;
          [(MRDLockScreenController *)self setHasPresentedForCurrentPersonalDevices:1];
          *a3 = @"personalDeviceAttached";
          return v5;
        }
        return 0;
      }
    }
    return 0;
  }
  *a3 = @"playerPath";
  return 1;
}

- (void)_onQueue_reevaluateShouldShowLockScreenForReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10032E048((uint64_t)v4, v5);
  }

  if (![(MRDDisplayMonitor *)self->_displayMonitor lockScreenVisible]) {
    [(MRDLockScreenController *)self _onSerialQueue_restoreElectedPlayer];
  }
  uint64_t v14 = 0;
  if ([(MRDLockScreenController *)self _onQueue_calculateShouldShowLockScreenForReason:&v14])
  {
    if (![(MRDLockScreenController *)self hasLockScreenAssertion])
    {
      v6 = [(MRDLockScreenController *)self uiController];
      v7 = v6;
      if (v6)
      {
        [v6 acquireLockScreenControlsAssertion];
      }
      else
      {
        v10 = objc_alloc_init(MRDLockScreenAssertion);
        [(MRDLockScreenController *)self setLegacyAssertion:v10];
      }
      v11 = self;
      uint64_t v12 = 1;
LABEL_22:
      [(MRDLockScreenController *)v11 setHasLockScreenAssertion:v12];
LABEL_23:
    }
  }
  else if ([(MRDLockScreenController *)self _onQueue_isLockScreenWidgetVisible])
  {
    unsigned __int8 v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10032E004(v8);
    }

    if (!self->_playerPath)
    {
      v7 = _MRLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDLockScreenController] LockScreen now showing empty controls. Will be dismissed when lock screen is no longer visible", v13, 2u);
      }
      goto LABEL_23;
    }
  }
  else if ([(MRDLockScreenController *)self hasLockScreenAssertion])
  {
    v7 = [(MRDLockScreenController *)self uiController];
    if (v7)
    {
      v9 = [(MRDLockScreenController *)self uiController];
      [v9 releaseLockScreenControlsAssertion];
    }
    else
    {
      [(MRDLockScreenController *)self setLegacyAssertion:0];
    }
    v11 = self;
    uint64_t v12 = 0;
    goto LABEL_22;
  }
}

- (MRDPersonalDeviceController)personalDeviceController
{
  return self->_personalDeviceController;
}

- (BOOL)hasPresentedForCurrentPersonalDevices
{
  return self->_hasPresentedForCurrentPersonalDevices;
}

- (BOOL)hasLockScreenAssertion
{
  return self->_hasLockScreenAssertion;
}

- (void)_onSerialQueue_restoreElectedPlayer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  electedPlayerPath = self->_electedPlayerPath;
  if (electedPlayerPath != self->_playerPath
    && (-[MRPlayerPath isEqual:](electedPlayerPath, "isEqual:") & 1) == 0)
  {
    id v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      playerPath = self->_playerPath;
      v6 = self->_electedPlayerPath;
      int v7 = 138543618;
      unsigned __int8 v8 = playerPath;
      __int16 v9 = 2114;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDLockScreenController] Restoring defered playerPath from %{public}@ to electedPlayerPath %{public}@", (uint8_t *)&v7, 0x16u);
    }

    self->_changeType = 0;
    [(MRDLockScreenController *)self setPlayerPath:self->_electedPlayerPath];
  }
}

- (BOOL)_onQueue_isLockScreenWidgetVisible
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_hasLockScreenAssertion)
  {
    BOOL v3 = [(MRDDisplayMonitor *)self->_displayMonitor lockScreenVisible];
    if (v3) {
      LOBYTE(v3) = ![(MRDDisplayMonitor *)self->_displayMonitor ambientVisible];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000141E4;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (MRDLockScreenController)init
{
  v24.receiver = self;
  v24.super_class = (Class)MRDLockScreenController;
  v2 = [(MRDLockScreenController *)&v24 init];
  BOOL v3 = v2;
  if (v2)
  {
    id playerPathInvalidationToken = v2->_playerPathInvalidationToken;
    v2->_id playerPathInvalidationToken = 0;

    uint64_t v5 = +[MRDDisplayMonitor sharedMonitor];
    displayMonitor = v3->_displayMonitor;
    v3->_displayMonitor = (MRDDisplayMonitor *)v5;

    int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaremote.MRDLockScreenController", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v3->_hasLockScreenAssertion = 0;
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v3 selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v3->_displayMonitor];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v3 selector:"_handleElectedPlayerDidChangeNotification:" name:kMRMediaRemoteElectedPlayerDidChangeNotification object:0];

    uint64_t v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v3 selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v3 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

    uint64_t v14 = +[MRUserSettings currentSettings];
    unsigned int v15 = [v14 supportLockscreenPlatterDisplayForPersonalDevice];

    if (v15)
    {
      uint64_t v16 = objc_opt_new();
      personalDeviceController = v3->_personalDeviceController;
      v3->_personalDeviceController = (MRDPersonalDeviceController *)v16;

      [(MRDPersonalDeviceController *)v3->_personalDeviceController setDelegate:v3];
      v18 = objc_alloc_init(MRDLockScreenContentController);
      contentController = v3->_contentController;
      v3->_contentController = v18;

      [(MRDLockScreenContentController *)v3->_contentController setDelegate:v3];
      *(_WORD *)&v3->_hasPresentedForCurrentPersonalDevices = 0;
    }
    v20 = v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CB01C;
    block[3] = &unk_100415CC8;
    v23 = v3;
    dispatch_async(v20, block);
  }
  return v3;
}

- (BOOL)isLockScreenWidgetActive
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)isLockScreenWidgetVisible
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CB1B0;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setHasLockScreenAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_hasLockScreenAssertion != v3)
  {
    self->_hasLockScreenAssertion = v3;
    if (self->_delegate)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000CB288;
      block[3] = &unk_100415CC8;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (BOOL)isLockScreenRecommendationActive
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CB344;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLockScreenRecommendationActive:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000CB3D0;
  v4[3] = &unk_100417720;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (void)setPreviousPlayerPath:(id)a3
{
  id v5 = a3;
  if (self->_previousPlayerPathInvalidationToken)
  {
    MRMediaRemoteRemovePlayerPathInvalidationHandler();
    id previousPlayerPathInvalidationToken = self->_previousPlayerPathInvalidationToken;
    self->_id previousPlayerPathInvalidationToken = 0;
  }
  objc_storeStrong((id *)&self->_previousPlayerPath, a3);
  if (self->_previousPlayerPath)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v9, &location);
    char v7 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler();
    id v8 = self->_previousPlayerPathInvalidationToken;
    self->_id previousPlayerPathInvalidationToken = v7;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)setPlayerPath:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = [(MRDLockScreenController *)self _onQueue_isLockScreenWidgetVisible];
  if (self->_changeType && (v6 & 1) != 0)
  {
    char v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      playerPath = self->_playerPath;
      id v9 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
      *(_DWORD *)buf = 138544130;
      v30 = playerPath;
      __int16 v31 = 2114;
      id v32 = v5;
      __int16 v33 = 2114;
      v34 = v9;
      __int16 v35 = 2114;
      CFStringRef v36 = @"visible";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDLockScreenController] Deferring setting playerPath from %{public}@ to %{public}@ because changeType is <%{public}@> and lock screen is <%{public}@>", buf, 0x2Au);
    }
    if (self->_playerPathInvalidationToken)
    {
      MRMediaRemoteRemovePlayerPathInvalidationHandler();
      id playerPathInvalidationToken = self->_playerPathInvalidationToken;
      self->_id playerPathInvalidationToken = 0;
    }
    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v26, (id *)buf);
    v11 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler();
    id v12 = self->_playerPathInvalidationToken;
    self->_id playerPathInvalidationToken = v11;

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(MRDLockScreenController *)self setPreviousPlayerPath:self->_playerPath];
    if (self->_playerPathInvalidationToken)
    {
      MRMediaRemoteRemovePlayerPathInvalidationHandler();
      id v13 = self->_playerPathInvalidationToken;
      self->_id playerPathInvalidationToken = 0;
    }
    uint64_t v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = self->_playerPath;
      *(_DWORD *)buf = 138543618;
      v30 = v15;
      __int16 v31 = 2114;
      id v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDLockScreenController] Setting playerPath from %{public}@ to %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_playerPath, a3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CB928;
    block[3] = &unk_1004158D8;
    void block[4] = self;
    id v16 = v5;
    id v28 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v17 = +[MRDMediaRemoteServer server];
    v18 = [v17 nowPlayingServer];
    v19 = [v18 queryExistingPlayerPath:v16];
    playerResult = self->_playerResult;
    self->_playerResult = v19;

    id v21 = objc_alloc((Class)NSString);
    v23 = self->_playerPath;
    previousPlayerPath = self->_previousPlayerPath;
    objc_super v24 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
    id v25 = [v21 initWithFormat:@"PlayerPath changed from %@ to %@ with changeType %@", previousPlayerPath, v23, v24];
    [(MRDLockScreenController *)self _onQueue_reevaluateShouldShowLockScreenForReason:v25];
  }
}

- (void)personalDeviceControllerStateDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CBA10;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)lockScreenContentControllerStateDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CBAE4;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)routeRecommendationDismissed
{
  id v6 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:0 reason:@"recommendation dismissed"];
  [v6 setType:2];
  char v2 = +[MRUserSettings currentSettings];
  [v2 mediaRecentlyPlayedInterval];
  objc_msgSend(v6, "setDisableDuration:");

  char v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 routingServer];
  id v5 = [v4 systemEndpointController];
  [v5 updateSystemEndpointForRequest:v6];
}

- (void)_handleElectedPlayerDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 playerPath];
  id v6 = [v4 userInfo];
  char v7 = [v6 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointChangeTypeUserInfoKey];
  uint64_t v8 = (int)[v7 intValue];

  id v9 = [v4 userInfo];

  v10 = [v9 objectForKeyedSubscript:@"MRDElectedPlayerControllerEventUserInfoKey"];
  uint64_t v11 = (int)[v10 intValue];

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000CBCF0;
  v14[3] = &unk_100415B20;
  v14[4] = self;
  id v15 = v5;
  uint64_t v16 = v8;
  uint64_t v17 = v11;
  id v13 = v5;
  dispatch_sync((dispatch_queue_t)queue, v14);
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CBE00;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = +[MRUserSettings currentSettings];
  unsigned __int8 v6 = [v5 supportManyRecommendationsPlatters];

  if ((v6 & 1) == 0)
  {
    char v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:MRUpdateActiveSystemEndpointRequestUserInfoKey];

    id v9 = [v4 userInfo];
    v10 = [v9 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];
    id v11 = [v10 integerValue];

    if (v11 == (id)3)
    {
      id v12 = [v8 outputDeviceUID];

      id v13 = _MRLogForCategory();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          id v15 = [v8 outputDeviceUID];
          int v18 = 138412290;
          v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDLockScreenController] Requesting legacy RSE presentation - %@", (uint8_t *)&v18, 0xCu);
        }
        uint64_t v16 = [(MRDLockScreenController *)self uiController];
        [v16 acquireRouteRecommendationAssertionForIdentifiers:&off_100438650];
      }
      else
      {
        if (v14)
        {
          uint64_t v17 = [v8 outputDeviceUID];
          int v18 = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDLockScreenController] Requesting legacy RSE dismissal - %@", (uint8_t *)&v18, 0xCu);
        }
        uint64_t v16 = [(MRDLockScreenController *)self uiController];
        [v16 releaseRouteRecommendationAssertion];
      }

      [(MRDLockScreenController *)self setHasLockScreenRecommendationAssertion:v12 != 0];
    }
  }
}

- (MRLockScreenUIControllable)uiController
{
  uiController = self->_uiController;
  if (!uiController)
  {
    id v4 = +[MRDUIControllerProvider lockScreenUIControllerWithDelegate:self];
    id v5 = self->_uiController;
    self->_uiController = v4;

    uiController = self->_uiController;
  }

  return uiController;
}

- (MRDLockScreenControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MRDLockScreenControllerDelegate *)a3;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRPlayerPath)previousPlayerPath
{
  return self->_previousPlayerPath;
}

- (void)setUiController:(id)a3
{
}

- (BOOL)hasLockScreenRecommendationAssertion
{
  return self->_hasLockScreenRecommendationAssertion;
}

- (void)setHasLockScreenRecommendationAssertion:(BOOL)a3
{
  self->_hasLockScreenRecommendationAssertion = a3;
}

- (MRDLockScreenAssertion)legacyAssertion
{
  return self->_legacyAssertion;
}

- (void)setLegacyAssertion:(id)a3
{
}

- (MRPlayerPath)electedPlayerPath
{
  return self->_electedPlayerPath;
}

- (void)setElectedPlayerPath:(id)a3
{
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (void)setPersonalDeviceController:(id)a3
{
}

- (MRDLockScreenContentController)contentController
{
  return self->_contentController;
}

- (void)setContentController:(id)a3
{
}

- (void)setHasPresentedForCurrentPersonalDevices:(BOOL)a3
{
  self->_hasPresentedForCurrentPersonalDevices = a3;
}

- (BOOL)shouldFinishPresentationForCurrentPersonalDevices
{
  return self->_shouldFinishPresentationForCurrentPersonalDevices;
}

- (void)setShouldFinishPresentationForCurrentPersonalDevices:(BOOL)a3
{
  self->_shouldFinishPresentationForCurrentPersonalDevices = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_personalDeviceController, 0);
  objc_storeStrong((id *)&self->_electedPlayerPath, 0);
  objc_storeStrong((id *)&self->_legacyAssertion, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_previousPlayerPathInvalidationToken, 0);
  objc_storeStrong(&self->_playerPathInvalidationToken, 0);
  objc_storeStrong((id *)&self->_previousPlayerPath, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_playerResult, 0);

  objc_storeStrong((id *)&self->_displayMonitor, 0);
}

@end