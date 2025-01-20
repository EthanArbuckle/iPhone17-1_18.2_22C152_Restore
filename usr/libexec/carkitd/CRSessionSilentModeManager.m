@interface CRSessionSilentModeManager
- (BOOL)deviceIsMuted;
- (BOOL)lastModeChangeByCarkitd;
- (BOOL)shouldResetMuteState;
- (BOOL)shouldResetToMuted;
- (CARSessionStatus)sessionStatus;
- (CRSessionSilentModeManager)initWithSessionStatus:(id)a3;
- (CRSessionSilentModeStatus)muteStatus;
- (void)matchDeviceSilentModeToCarPlaySilentModeWithReason:(id)a3;
- (void)ringerSwitchDidChange;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setDeviceIsMuted:(BOOL)a3;
- (void)setLastModeChangeByCarkitd:(BOOL)a3;
- (void)setMuteStatus:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setShouldResetMuteState:(BOOL)a3;
- (void)setShouldResetToMuted:(BOOL)a3;
- (void)setupObservers;
- (void)silentModeDidChangeDuringSession;
- (void)silentModePanelStateDidChange;
- (void)tearDownObservers;
@end

@implementation CRSessionSilentModeManager

- (CRSessionSilentModeManager)initWithSessionStatus:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRSessionSilentModeManager;
  v6 = [(CRSessionSilentModeManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionStatus, a3);
    [(CARSessionStatus *)v7->_sessionStatus addSessionObserver:v7];
    v8 = (CRSessionSilentModeStatus *)objc_alloc_init((Class)CRSessionSilentModeStatus);
    muteStatus = v7->_muteStatus;
    v7->_muteStatus = v8;
  }
  return v7;
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = [(CRSessionSilentModeStatus *)self->_muteStatus getCarPlaySilentModePreference];
  id v5 = CarSilentModeLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"CarPlay silent mode state has not been set yet";
    if (v4 == (id)2) {
      v6 = @"Unmute when session starts";
    }
    if (v4 == (id)1) {
      v6 = @"Mute when session starts";
    }
    v7 = v6;
    int v16 = 138412290;
    CFStringRef v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Session connecting, Silent Mode Status: %@", (uint8_t *)&v16, 0xCu);
  }
  unsigned __int8 v8 = [(CRSessionSilentModeStatus *)self->_muteStatus isDeviceSilentModeOn];
  self->_deviceIsMuted = v8;
  *(_WORD *)&self->_shouldResetToMuted = v8;
  if (v4 == (id)1)
  {
    v12 = CarSilentModeLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_deviceIsMuted) {
        CFStringRef v13 = @"Muted, maintaining mute state";
      }
      else {
        CFStringRef v13 = @"Unmuted, attempting to mute.";
      }
      int v16 = 138412290;
      CFStringRef v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device is %@", (uint8_t *)&v16, 0xCu);
    }

    if (!self->_deviceIsMuted)
    {
      CFStringRef v11 = @"Muting for CarPlay session";
      goto LABEL_23;
    }
  }
  else
  {
    if (v4 != (id)2)
    {
      v15 = CarSilentModeLogging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Mirroring iPhone silent mode state", (uint8_t *)&v16, 2u);
      }

      BOOL v14 = 0;
      goto LABEL_27;
    }
    v9 = CarSilentModeLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_deviceIsMuted) {
        CFStringRef v10 = @"Muted, attempting to unmute";
      }
      else {
        CFStringRef v10 = @"Unmuted, maintaining mute state.";
      }
      int v16 = 138412290;
      CFStringRef v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device is %@", (uint8_t *)&v16, 0xCu);
    }

    if (self->_deviceIsMuted)
    {
      CFStringRef v11 = @"Unmuting for CarPlay session";
LABEL_23:
      [(CRSessionSilentModeManager *)self matchDeviceSilentModeToCarPlaySilentModeWithReason:v11];
      BOOL v14 = 1;
      self->_shouldResetMuteState = 1;
LABEL_27:
      self->_lastModeChangeByCarkitd = v14;
    }
  }
  [(CRSessionSilentModeManager *)self setupObservers];
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = CarSilentModeLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldResetMuteState) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    int v6 = 138412290;
    CFStringRef v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session disconnected, will reset mute state: %@", (uint8_t *)&v6, 0xCu);
  }

  if (self->_shouldResetMuteState) {
    [(CRSessionSilentModeStatus *)self->_muteStatus setDeviceSilentMode:self->_shouldResetToMuted reason:@"CarPlay session ended."];
  }
  [(CRSessionSilentModeManager *)self tearDownObservers];
}

- (void)silentModeDidChangeDuringSession
{
  unsigned int v3 = [(CRSessionSilentModeStatus *)self->_muteStatus isDeviceSilentModeOn];
  if (self->_deviceIsMuted != v3)
  {
    id v4 = CarSilentModeLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = @"Muted";
      if (self->_deviceIsMuted) {
        CFStringRef v6 = @"Muted";
      }
      else {
        CFStringRef v6 = @"Unmuted";
      }
      if (!v3) {
        CFStringRef v5 = @"Unmuted";
      }
      BOOL lastModeChangeByCarkitd = self->_lastModeChangeByCarkitd;
      int v10 = 138412802;
      CFStringRef v11 = v6;
      __int16 v12 = 2112;
      CFStringRef v13 = v5;
      if (lastModeChangeByCarkitd) {
        CFStringRef v8 = @"CarPlay";
      }
      else {
        CFStringRef v8 = @"Other Process";
      }
      __int16 v14 = 2112;
      CFStringRef v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Silent mode changed during CarPlay session. Old State: %@ New State: %@. Changed by: %@", (uint8_t *)&v10, 0x20u);
    }

    if (self->_lastModeChangeByCarkitd)
    {
      self->_shouldResetMuteState = 1;
    }
    else
    {
      self->_shouldResetToMuted = v3;
      self->_shouldResetMuteState = 0;
      v9 = +[NSDistributedNotificationCenter defaultCenter];
      [v9 postNotificationName:CRExternalProcessChangedSilentMode object:0 userInfo:0];
    }
  }
  self->_BOOL lastModeChangeByCarkitd = 0;
  self->_deviceIsMuted = v3;
}

- (void)setupObservers
{
  unsigned int v3 = +[AVSystemController sharedAVSystemController];
  uint64_t v8 = AVSystemController_SilentModeEnabledDidChangeNotification;
  id v4 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  CFStringRef v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"silentModeDidChangeDuringSession" name:AVSystemController_SilentModeEnabledDidChangeNotification object:0];

  CFStringRef v6 = +[NSDistributedNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"ringerSwitchDidChange" name:CRDeviceRingerSwitchToggledNotification object:0 suspensionBehavior:4];

  CFStringRef v7 = +[NSDistributedNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"silentModePanelStateDidChange" name:CRSilentModePanelInteraction object:0 suspensionBehavior:4];
}

- (void)tearDownObservers
{
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)ringerSwitchDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060B38;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)silentModePanelStateDidChange
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100060C84;
  v2[3] = &unk_1000BD740;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)matchDeviceSilentModeToCarPlaySilentModeWithReason:(id)a3
{
  muteStatus = self->_muteStatus;
  id v5 = a3;
  [(CRSessionSilentModeStatus *)self->_muteStatus setDeviceSilentMode:[(CRSessionSilentModeStatus *)muteStatus getCarPlaySilentModePreference] == (id)1 reason:v5];
}

- (CRSessionSilentModeStatus)muteStatus
{
  return self->_muteStatus;
}

- (void)setMuteStatus:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (BOOL)deviceIsMuted
{
  return self->_deviceIsMuted;
}

- (void)setDeviceIsMuted:(BOOL)a3
{
  self->_deviceIsMuted = a3;
}

- (BOOL)lastModeChangeByCarkitd
{
  return self->_lastModeChangeByCarkitd;
}

- (void)setLastModeChangeByCarkitd:(BOOL)a3
{
  self->_BOOL lastModeChangeByCarkitd = a3;
}

- (BOOL)shouldResetToMuted
{
  return self->_shouldResetToMuted;
}

- (void)setShouldResetToMuted:(BOOL)a3
{
  self->_shouldResetToMuted = a3;
}

- (BOOL)shouldResetMuteState
{
  return self->_shouldResetMuteState;
}

- (void)setShouldResetMuteState:(BOOL)a3
{
  self->_shouldResetMuteState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);

  objc_storeStrong((id *)&self->_muteStatus, 0);
}

@end