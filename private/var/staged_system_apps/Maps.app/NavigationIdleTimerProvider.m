@interface NavigationIdleTimerProvider
- (BOOL)_isInPocket;
- (BOOL)_shouldGuidanceUpdateDisplayPersistently:(id)a3;
- (BOOL)navdRequestingIdleTimerEnabled;
- (BOOL)shouldDisableIdleTimer;
- (NavigationIdleTimerProvider)initWithIdleStateHandler:(id)a3 undimHandler:(id)a4;
- (id)idleStateChangeHandler;
- (id)undimHandler;
- (int64_t)pocketStateType;
- (unint64_t)_guidanceUpdate:(id)a3 isDifferentFromGuidanceUpdate:(id)a4;
- (void)_notifyShouldUndim;
- (void)_updateIdleTimerState;
- (void)dealloc;
- (void)didUpdatePocketStateType:(int64_t)a3;
- (void)navigationService:(id)a3 shouldEnableIdleTimer:(BOOL)a4;
- (void)screenLayoutDidChangeWithReason:(unint64_t)a3;
- (void)setNavdRequestingIdleTimerEnabled:(BOOL)a3;
- (void)setPocketStateType:(int64_t)a3;
- (void)setShouldDisableIdleTimer:(BOOL)a3;
- (void)updateGuidanceState:(id)a3;
@end

@implementation NavigationIdleTimerProvider

- (NavigationIdleTimerProvider)initWithIdleStateHandler:(id)a3 undimHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NavigationIdleTimerProvider;
  v8 = [(NavigationIdleTimerProvider *)&v21 init];
  if (v8)
  {
    v9 = sub_100578094();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v23 = v10;
      __int16 v24 = 2048;
      v25 = v8;
      __int16 v26 = 2080;
      v27 = "-[NavigationIdleTimerProvider initWithIdleStateHandler:undimHandler:]";
      id v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "<%@:%p> %s", buf, 0x20u);
    }
    id v12 = objc_retainBlock(v6);
    id idleStateChangeHandler = v8->_idleStateChangeHandler;
    v8->_id idleStateChangeHandler = v12;

    id v14 = objc_retainBlock(v7);
    id undimHandler = v8->_undimHandler;
    v8->_id undimHandler = v14;

    v8->_pocketStateType = 4;
    v16 = [[MapsPocketStateProvider alloc] initWithDelegate:v8];
    pocketStateManager = v8->_pocketStateManager;
    v8->_pocketStateManager = v16;

    v18 = +[MapsScreenLayoutMonitor sharedMonitor];
    [v18 startMonitoringWithObserver:v8];

    v19 = +[MNNavigationService sharedService];
    [v19 registerObserver:v8];
  }
  return v8;
}

- (void)dealloc
{
  v3 = +[MapsScreenLayoutMonitor sharedMonitor];
  [v3 stopMonitoringWithObserver:self];

  v4 = +[MNNavigationService sharedService];
  [v4 unregisterObserver:self];

  [(NavigationIdleTimerProvider *)self setShouldDisableIdleTimer:0];
  v5 = sub_100578094();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2048;
    id v11 = self;
    __int16 v12 = 2080;
    v13 = "-[NavigationIdleTimerProvider dealloc]";
    id v6 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "<%@:%p> %s", buf, 0x20u);
  }
  v7.receiver = self;
  v7.super_class = (Class)NavigationIdleTimerProvider;
  [(NavigationIdleTimerProvider *)&v7 dealloc];
}

- (void)screenLayoutDidChangeWithReason:(unint64_t)a3
{
  self->_hasReceivedScreenLayout = 1;
  if (a3 == 3)
  {
    v5 = sub_100578094();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Lock button pressed", v8, 2u);
    }

    id v6 = +[MapsScreenLayoutMonitor sharedMonitor];
    unsigned __int8 v7 = [v6 isScreenOn];

    if ((v7 & 1) == 0) {
      objc_storeStrong((id *)&self->_screenLockedGuidanceUpdate, self->_lastGuidanceUpdate);
    }
    goto LABEL_10;
  }
  if (a3)
  {
LABEL_10:
    [(NavigationIdleTimerProvider *)self _updateIdleTimerState];
    return;
  }
  v4 = sub_100578094();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ignoring layout change", buf, 2u);
  }
}

- (void)didUpdatePocketStateType:(int64_t)a3
{
}

- (void)setShouldDisableIdleTimer:(BOOL)a3
{
  if (self->_shouldDisableIdleTimer != a3)
  {
    BOOL v3 = a3;
    v5 = sub_100578094();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL shouldDisableIdleTimer = self->_shouldDisableIdleTimer;
      v9[0] = 67109376;
      v9[1] = shouldDisableIdleTimer;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changing idle timer disabled from %d to %d", (uint8_t *)v9, 0xEu);
    }

    self->_BOOL shouldDisableIdleTimer = v3;
    unsigned __int8 v7 = [(NavigationIdleTimerProvider *)self idleStateChangeHandler];

    if (v7)
    {
      v8 = [(NavigationIdleTimerProvider *)self idleStateChangeHandler];
      v8[2](v8, v3);
    }
  }
}

- (void)setPocketStateType:(int64_t)a3
{
  if (self->_pocketStateType != a3)
  {
    v5 = sub_100578094();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t pocketStateType = self->_pocketStateType;
      if (pocketStateType > 4) {
        CFStringRef v7 = @"Unknown";
      }
      else {
        CFStringRef v7 = *(&off_10131CAA0 + pocketStateType);
      }
      if ((unint64_t)a3 > 4) {
        CFStringRef v8 = @"Unknown";
      }
      else {
        CFStringRef v8 = *(&off_10131CAA0 + a3);
      }
      int v9 = 138543618;
      CFStringRef v10 = v7;
      __int16 v11 = 2114;
      CFStringRef v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changing pocket state type from %{public}@ to %{public}@", (uint8_t *)&v9, 0x16u);
    }

    self->_unint64_t pocketStateType = a3;
    if ([(NavigationIdleTimerProvider *)self _isInPocket]) {
      [(NavigationIdleTimerProvider *)self _updateIdleTimerState];
    }
  }
}

- (void)updateGuidanceState:(id)a3
{
  v4 = (IPCGuidanceStateReply *)a3;
  unint64_t v5 = [(NavigationIdleTimerProvider *)self _guidanceUpdate:v4 isDifferentFromGuidanceUpdate:self->_lastGuidanceUpdate];
  if (!GEOConfigGetBOOL() || ![(IPCGuidanceStateReply *)v4 affectsDimming]) {
    goto LABEL_22;
  }
  id v6 = [(IPCGuidanceStateReply *)v4 alightMessage];

  if (v6)
  {
    p_super = sub_100578094();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
LABEL_8:

      __int16 v11 = sub_100578094();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [(IPCGuidanceStateReply *)v4 shortDescription];
        v13 = (void *)v12;
        if (v5 > 9) {
          CFStringRef v14 = @"Unknown";
        }
        else {
          CFStringRef v14 = *(&off_10131CA50 + v5);
        }
        int v21 = 138412546;
        uint64_t v22 = v12;
        __int16 v23 = 2112;
        CFStringRef v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "guidance update: %@, did change due to %@", (uint8_t *)&v21, 0x16u);
      }
      if (![(NavigationIdleTimerProvider *)self _isInPocket]) {
        [(NavigationIdleTimerProvider *)self _notifyShouldUndim];
      }
      goto LABEL_22;
    }
    LOWORD(v21) = 0;
    CFStringRef v8 = "Undim due to alight message";
    goto LABEL_6;
  }
  if (!self->_lastGuidanceUpdate)
  {
    p_super = sub_100578094();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    LOWORD(v21) = 0;
    CFStringRef v8 = "Undim due to first guidance update";
    goto LABEL_6;
  }
  if (!self->_screenLockedGuidanceUpdate)
  {
    if (![(NavigationIdleTimerProvider *)self _shouldGuidanceUpdateDisplayPersistently:v4])
    {
      if (!v5) {
        goto LABEL_24;
      }
      p_super = sub_100578094();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO)) {
        goto LABEL_8;
      }
      if (v5 > 9) {
        CFStringRef v20 = @"Unknown";
      }
      else {
        CFStringRef v20 = *(&off_10131CA08 + v5 - 1);
      }
      int v21 = 138412290;
      uint64_t v22 = (uint64_t)v20;
      CFStringRef v8 = "Undim from guidance update due to %@";
      int v9 = p_super;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
    p_super = sub_100578094();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    LOWORD(v21) = 0;
    CFStringRef v8 = "Undim from guidance update due to being persistently displayed";
LABEL_6:
    int v9 = p_super;
    uint32_t v10 = 2;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v21, v10);
    goto LABEL_8;
  }
  unint64_t v15 = -[NavigationIdleTimerProvider _guidanceUpdate:isDifferentFromGuidanceUpdate:](self, "_guidanceUpdate:isDifferentFromGuidanceUpdate:", v4);
  if (v5)
  {
    unint64_t v16 = v15;
    if (v15)
    {
      v17 = sub_100578094();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if (v16 > 9) {
          CFStringRef v18 = @"Unknown";
        }
        else {
          CFStringRef v18 = *(&off_10131CA08 + v16 - 1);
        }
        int v21 = 138412290;
        uint64_t v22 = (uint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Undim after locked due to %@", (uint8_t *)&v21, 0xCu);
      }

      p_super = &self->_screenLockedGuidanceUpdate->super.super;
      self->_screenLockedGuidanceUpdate = 0;
      goto LABEL_8;
    }
  }
LABEL_22:
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [(NavigationIdleTimerProvider *)self _updateIdleTimerState];
  }
LABEL_24:
  lastGuidanceUpdate = self->_lastGuidanceUpdate;
  self->_lastGuidanceUpdate = v4;
}

- (BOOL)_isInPocket
{
  return (id)[(NavigationIdleTimerProvider *)self pocketStateType] == (id)3
      || (id)[(NavigationIdleTimerProvider *)self pocketStateType] == (id)2
      || (id)[(NavigationIdleTimerProvider *)self pocketStateType] == (id)1;
}

- (void)_notifyShouldUndim
{
  BOOL hasReceivedScreenLayout = self->_hasReceivedScreenLayout;
  unsigned int v4 = [(NavigationIdleTimerProvider *)self _isInPocket];
  unint64_t v5 = sub_100578094();
  uint64_t v6 = (uint64_t)v5;
  if (!hasReceivedScreenLayout || (v4 & 1) != 0)
  {
    if (v4)
    {
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      unint64_t v8 = [(NavigationIdleTimerProvider *)self pocketStateType];
      if (v8 > 4) {
        CFStringRef v9 = @"Unknown";
      }
      else {
        CFStringRef v9 = *(&off_10131CAA0 + v8);
      }
      int v14 = 138543362;
      CFStringRef v15 = v9;
      uint32_t v10 = "Not undimming the screen due to CMPocketStateManager state: %{public}@";
      __int16 v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      LOWORD(v14) = 0;
      uint32_t v10 = "Can't safely undim as we haven't determined the current screen state";
      __int16 v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v14, v13);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_INFO, "Notifying undim handler to undim the screen", (uint8_t *)&v14, 2u);
  }

  CFStringRef v7 = [(NavigationIdleTimerProvider *)self undimHandler];

  if (v7)
  {
    uint64_t v6 = [(NavigationIdleTimerProvider *)self undimHandler];
    (*(void (**)(void))(v6 + 16))();
LABEL_16:
  }
}

- (void)_updateIdleTimerState
{
  unsigned __int8 v3 = [(NavigationIdleTimerProvider *)self _isInPocket];
  unsigned int v4 = +[MapsScreenLayoutMonitor sharedMonitor];
  if (![v4 isOurAppActive]) {
    goto LABEL_5;
  }
  unint64_t v5 = +[MapsScreenLayoutMonitor sharedMonitor];
  if (![v5 isScreenOn]
    || +[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay])
  {

LABEL_5:
LABEL_6:
    uint64_t v6 = sub_100578094();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      CFStringRef v7 = +[MapsScreenLayoutMonitor sharedMonitor];
      unsigned int v8 = [v7 isOurAppActive];
      CFStringRef v9 = +[MapsScreenLayoutMonitor sharedMonitor];
      unsigned int v10 = [v9 isScreenOn];
      __int16 v11 = +[CarDisplayController sharedInstance];
      unsigned int v12 = [v11 isCurrentlyConnectedToAnyCarScene];
      BOOL navdRequestingIdleTimerEnabled = self->_navdRequestingIdleTimerEnabled;
      unint64_t v14 = [(NavigationIdleTimerProvider *)self pocketStateType];
      if (v14 > 4) {
        CFStringRef v15 = @"Unknown";
      }
      else {
        CFStringRef v15 = *(&off_10131CAA0 + v14);
      }
      v19[0] = 67110146;
      v19[1] = v8;
      __int16 v20 = 1024;
      unsigned int v21 = v10;
      __int16 v22 = 1024;
      unsigned int v23 = v12;
      __int16 v24 = 1024;
      BOOL v25 = navdRequestingIdleTimerEnabled;
      __int16 v26 = 2114;
      CFStringRef v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "enabling idle timer due to: isForeground: %d isScreenOn: %d connectedToCarPlay: %d navdIdleTimer: %d pocketState: %{public}@", (uint8_t *)v19, 0x24u);
    }
    unint64_t v16 = self;
    uint64_t v17 = 0;
    goto LABEL_12;
  }
  if (self->_navdRequestingIdleTimerEnabled) {
    unsigned __int8 v3 = 1;
  }

  if (v3) {
    goto LABEL_6;
  }
  CFStringRef v18 = sub_100578094();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "disabling idle timer", (uint8_t *)v19, 2u);
  }

  unint64_t v16 = self;
  uint64_t v17 = 1;
LABEL_12:
  [(NavigationIdleTimerProvider *)v16 setShouldDisableIdleTimer:v17];
}

- (BOOL)_shouldGuidanceUpdateDisplayPersistently:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isSticky] & 1) != 0
    || [v3 guidanceState] == (id)3
    || [v3 guidanceState] == (id)2;

  return v4;
}

- (unint64_t)_guidanceUpdate:(id)a3 isDifferentFromGuidanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 guidanceState];
  if ([v7 guidanceState] != v8)
  {
    if (![v7 guidanceState])
    {
      unint64_t v17 = 1;
      goto LABEL_27;
    }
    if (v8 == (id)1)
    {
      unint64_t v17 = 2;
      goto LABEL_27;
    }
    if ([v7 guidanceState] == (id)1)
    {
      unint64_t v17 = 3;
      goto LABEL_27;
    }
  }
  if (!v8) {
    goto LABEL_6;
  }
  CFStringRef v9 = [v6 maneuverID];
  unsigned int v10 = [v7 maneuverID];
  unint64_t v11 = v9;
  unint64_t v12 = v10;
  if (v11 | v12)
  {
    uint32_t v13 = (void *)v12;
    unsigned int v14 = [(id)v11 isEqual:v12];

    if (!v14)
    {
      unint64_t v17 = 5;
      goto LABEL_27;
    }
  }
  unsigned int v15 = [(IPCGuidanceStateReply *)self->_lastGuidanceUpdate maneuver];
  if (v15 != [v6 maneuver])
  {
    unint64_t v17 = 4;
  }
  else
  {
LABEL_6:
    unint64_t v16 = [v6 alightMessage];

    if (v16)
    {
      unint64_t v17 = 6;
    }
    else if ([v6 isAlerting])
    {
      unint64_t v17 = 7;
    }
    else
    {
      CFStringRef v18 = [v7 laneGuidanceInfo];
      if (v18)
      {
      }
      else
      {
        __int16 v20 = [v6 laneGuidanceInfo];

        if (v20)
        {
          unint64_t v17 = 8;
          goto LABEL_27;
        }
      }
      v19 = [v7 trafficIncidentAlert];
      if (v19)
      {

        unint64_t v17 = 0;
      }
      else
      {
        unsigned int v21 = [v6 trafficIncidentAlert];

        if (v21) {
          unint64_t v17 = 9;
        }
        else {
          unint64_t v17 = 0;
        }
      }
    }
  }
LABEL_27:

  return v17;
}

- (void)navigationService:(id)a3 shouldEnableIdleTimer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = sub_100578094();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[NavigationIdleTimerProvider navigationService:shouldEnableIdleTimer:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: %d", (uint8_t *)&v7, 0x12u);
  }

  self->_BOOL navdRequestingIdleTimerEnabled = v4;
  [(NavigationIdleTimerProvider *)self _updateIdleTimerState];
}

- (id)idleStateChangeHandler
{
  return self->_idleStateChangeHandler;
}

- (id)undimHandler
{
  return self->_undimHandler;
}

- (BOOL)shouldDisableIdleTimer
{
  return self->_shouldDisableIdleTimer;
}

- (int64_t)pocketStateType
{
  return self->_pocketStateType;
}

- (BOOL)navdRequestingIdleTimerEnabled
{
  return self->_navdRequestingIdleTimerEnabled;
}

- (void)setNavdRequestingIdleTimerEnabled:(BOOL)a3
{
  self->_BOOL navdRequestingIdleTimerEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_undimHandler, 0);
  objc_storeStrong(&self->_idleStateChangeHandler, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_lastGuidanceUpdate, 0);

  objc_storeStrong((id *)&self->_screenLockedGuidanceUpdate, 0);
}

@end