@interface MRDMediaServerVolumeController
- (BOOL)_platformHasNativeMuteSupport;
- (BOOL)isMuted;
- (MRDMediaServerVolumeController)initWithRoutingDataSource:(id)a3;
- (float)_volumeFromAVController;
- (float)currentVolume;
- (id)_mediaServerController;
- (id)debugDescription;
- (unsigned)capabilities;
- (unsigned)pbsVolumeControlCapabilities;
- (void)_avSessionMediaServicesResetNotification:(id)a3;
- (void)_currentRouteHasVolumeControlDidChangeNotification:(id)a3;
- (void)_forceEnableCECVolumeNotification:(id)a3;
- (void)_initVolumeDataIfNeccessary;
- (void)_postIsMutedDidChange:(BOOL)a3;
- (void)_postVolumeControlCapabilitiesDidChange:(unsigned int)a3;
- (void)_postVolumeDidChange:(float)a3;
- (void)_reloadVolumeDataWithReason:(id)a3;
- (void)_setupNotifications;
- (void)_systemMuteDidChange:(id)a3;
- (void)_systemVolumeDidChange:(id)a3;
- (void)_tearDownNotifications;
- (void)_updateCapabilitiesValueCache;
- (void)_updateIsMutedValueCache;
- (void)_updateVolumeValueCache;
- (void)adjustVolumeWithStepAmount:(float)a3 error:(id *)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIsMuted:(BOOL)a3 error:(id *)a4;
- (void)setVolume:(float)a3 error:(id *)a4;
@end

@implementation MRDMediaServerVolumeController

- (MRDMediaServerVolumeController)initWithRoutingDataSource:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRDMediaServerVolumeController;
  v3 = [(MRDVolumeController *)&v10 initWithRoutingDataSource:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    v5 = off_1004779F0();
    [v4 addObserver:v3 selector:"_avSessionMediaServicesResetNotification:" name:v5 object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"_forceEnableCECVolumeNotification:" name:MRUserSettingsForceEnableCECVolumeDidChange object:0];

    [(MRDMediaServerVolumeController *)v3 _setupNotifications];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014FF08;
    block[3] = &unk_100415CC8;
    v9 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRDMediaServerVolumeController;
  [(MRDMediaServerVolumeController *)&v4 dealloc];
}

- (id)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = MRMediaRemoteVolumeControlCapabilitiesDescription();
  double volumeValue = self->_volumeValue;
  BOOL isMutedValue = self->_isMutedValue;
  v8 = [(MRDMediaServerVolumeController *)self _mediaServerController];
  unsigned int v9 = [v8 currentRouteHasVolumeControl];
  [(MRDMediaServerVolumeController *)self pbsVolumeControlCapabilities];
  objc_super v10 = MRMediaRemoteVolumeControlCapabilitiesDescription();
  v11 = +[MRUserSettings currentSettings];
  id v12 = [v3 initWithFormat:@"<%@:%p = {\n  capabilities=%@\n  volume=%lf\n  muted=%u\n  AVSC.currentRouteHasVolumeControl=%u\n  PBS.capabilities=%@\n  forceEnableCECVolume=%u\n}>", v4, self, v5, *(void *)&volumeValue, isMutedValue, v9, v10, objc_msgSend(v11, "forceEnableCECVolume")];

  return v12;
}

- (unsigned)capabilities
{
  return self->_capabilitiesValue;
}

- (float)currentVolume
{
  return self->_volumeValue;
}

- (BOOL)isMuted
{
  return self->_isMutedValue;
}

- (void)setVolume:(float)a3 error:(id *)a4
{
  if (self->_volumeValue != a3)
  {
    v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDVolumeController] Setting AVSC volume to %f", buf, 0xCu);
    }

    self->_double volumeValue = a3;
    [(MRDMediaServerVolumeController *)self _mediaServerController];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001502B4;
    block[3] = &unk_100415CC8;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = qword_10047E3A8;
    id v8 = v11;
    if (v7 != -1) {
      dispatch_once(&qword_10047E3A8, block);
    }
    *(float *)&double v9 = self->_volumeValue;
    [v8 setVolumeTo:qword_10047E3A0 forCategory:v9];
  }
}

- (void)adjustVolumeWithStepAmount:(float)a3 error:(id *)a4
{
  *(float *)&double v4 = self->_volumeValue + a3;
  [(MRDMediaServerVolumeController *)self setVolume:a4 error:v4];
}

- (void)setIsMuted:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v5) {
      CFStringRef v8 = @"YES";
    }
    int v12 = 138412290;
    CFStringRef v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDVolumeController] Setting AVSC isMuted to %@", (uint8_t *)&v12, 0xCu);
  }

  double v9 = [(MRDMediaServerVolumeController *)self _mediaServerController];
  objc_super v10 = +[NSNumber numberWithBool:v5];
  [v9 setAttribute:v10 forKey:AVSystemController_FullMuteAttribute error:a4];

  if (*a4)
  {
    id v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100330D3C((uint64_t *)a4, v11);
    }
  }
}

- (id)_mediaServerController
{
  return +[AVSystemController sharedAVSystemController];
}

- (void)_setupNotifications
{
  id v3 = [(MRDMediaServerVolumeController *)self _mediaServerController];
  double v4 = off_1004779F0();
  v15 = v4;
  BOOL v5 = +[NSArray arrayWithObjects:&v15 count:1];
  [v3 setAttribute:v5 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  if (AVSystemController_SystemVolumeDidChangeNotification)
  {
    uint64_t v14 = AVSystemController_SystemVolumeDidChangeNotification;
    v6 = +[NSArray arrayWithObjects:&v14 count:1];
    [v3 setAttribute:v6 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"_systemVolumeDidChange:" name:AVSystemController_SystemVolumeDidChangeNotification object:v3];
  }
  if (AVSystemController_FullMuteDidChangeNotification)
  {
    uint64_t v13 = AVSystemController_FullMuteDidChangeNotification;
    CFStringRef v8 = +[NSArray arrayWithObjects:&v13 count:1];
    [v3 setAttribute:v8 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    double v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"_systemMuteDidChange:" name:AVSystemController_FullMuteDidChangeNotification object:v3];
  }
  if (AVSystemController_CurrentRouteHasVolumeControlDidChangeNotification)
  {
    uint64_t v12 = AVSystemController_CurrentRouteHasVolumeControlDidChangeNotification;
    objc_super v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [v3 setAttribute:v10 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    id v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_currentRouteHasVolumeControlDidChangeNotification:" name:AVSystemController_CurrentRouteHasVolumeControlDidChangeNotification object:v3];
  }
}

- (void)_tearDownNotifications
{
  id v4 = [(MRDMediaServerVolumeController *)self _mediaServerController];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVSystemController_SystemVolumeDidChangeNotification object:v4];
  [v3 removeObserver:self name:AVSystemController_FullMuteDidChangeNotification object:v4];
  [v3 removeObserver:self name:AVSystemController_CurrentRouteHasVolumeControlDidChangeNotification object:v4];
}

- (void)_systemVolumeDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:AVSystemController_AudioCategoryNotificationParameter];

  if (([v5 isEqualToString:@"MediaPlayback"] & 1) != 0
    || [v5 isEqualToString:@"Audio/Video"])
  {
    [(MRDMediaServerVolumeController *)self _updateVolumeValueCache];
  }
}

- (void)_systemMuteDidChange:(id)a3
{
  id v4 = [a3 name];
  [(MRDMediaServerVolumeController *)self _reloadVolumeDataWithReason:v4];
}

- (void)_currentRouteHasVolumeControlDidChangeNotification:(id)a3
{
  id v4 = [a3 name];
  [(MRDMediaServerVolumeController *)self _reloadVolumeDataWithReason:v4];
}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDVolumeController] AVAudioSessionMediaServicesWereReset notification received -- re-registering notifications", v7, 2u);
  }

  [(MRDMediaServerVolumeController *)self _tearDownNotifications];
  [(MRDMediaServerVolumeController *)self _setupNotifications];
  v6 = [v4 name];

  [(MRDMediaServerVolumeController *)self _reloadVolumeDataWithReason:v6];
}

- (void)_forceEnableCECVolumeNotification:(id)a3
{
  id v4 = [a3 name];
  [(MRDMediaServerVolumeController *)self _reloadVolumeDataWithReason:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (off_1004779F8 == a6)
  {
    id v11 = NSStringFromSelector("volumeControlCapabilities");
    unsigned int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"PBS.%@", v10];
      [(MRDMediaServerVolumeController *)self _reloadVolumeDataWithReason:v13];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MRDMediaServerVolumeController;
    [(MRDMediaServerVolumeController *)&v14 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)_initVolumeDataIfNeccessary
{
  if (!self->_volumeDataIntialized) {
    [(MRDMediaServerVolumeController *)self _reloadVolumeDataWithReason:0];
  }
}

- (void)_reloadVolumeDataWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDVolumeController] Reloading volume for reason: %@", (uint8_t *)&v6, 0xCu);
  }

  [(MRDMediaServerVolumeController *)self _updateCapabilitiesValueCache];
  [(MRDMediaServerVolumeController *)self _updateIsMutedValueCache];
  [(MRDMediaServerVolumeController *)self _updateVolumeValueCache];
}

- (float)_volumeFromAVController
{
  float v6 = 0.0;
  id v3 = [(MRDMediaServerVolumeController *)self _mediaServerController];
  [v3 getVolume:&v6 forCategory:@"MediaPlayback"];
  if (![(MRDMediaServerVolumeController *)self _platformHasNativeMuteSupport]
    && self->_isMutedValue)
  {
    float v6 = 0.0;
  }
  float v4 = v6;

  return v4;
}

- (void)_updateVolumeValueCache
{
  [(MRDMediaServerVolumeController *)self _volumeFromAVController];
  self->_double volumeValue = v3;

  -[MRDMediaServerVolumeController _postVolumeDidChange:](self, "_postVolumeDidChange:");
}

- (void)_updateIsMutedValueCache
{
  float v3 = [(MRDMediaServerVolumeController *)self _mediaServerController];
  float v4 = [v3 attributeForKey:AVSystemController_FullMuteAttribute];
  id v5 = [v4 BOOLValue];

  self->_BOOL isMutedValue = (char)v5;

  [(MRDMediaServerVolumeController *)self _postIsMutedDidChange:v5];
}

- (void)_updateCapabilitiesValueCache
{
  float v3 = [(MRDMediaServerVolumeController *)self _mediaServerController];
  unsigned int v4 = [v3 currentRouteHasVolumeControl];

  if (v4) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 0;
  }
  float v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 forceEnableCECVolume];

  if (v7) {
    uint64_t v8 = v5 | 5;
  }
  else {
    uint64_t v8 = v5;
  }
  double v9 = +[MRUserSettings currentSettings];
  if ([v9 supportCoordinatedVolume])
  {
    id v10 = [(MRDMediaServerVolumeController *)self _mediaServerController];

    if (v10) {
      uint64_t v8 = v8 | 8;
    }
    else {
      uint64_t v8 = v8;
    }
  }
  else
  {
  }
  self->_capabilitiesValue = v8;

  [(MRDMediaServerVolumeController *)self _postVolumeControlCapabilitiesDidChange:v8];
}

- (void)_postVolumeDidChange:(float)a3
{
  id v7 = +[MRDMediaRemoteServer server];
  unsigned int v4 = [v7 nowPlayingServer];
  unsigned int v5 = [v4 localOriginClient];
  *(float *)&double v6 = a3;
  [v5 setVolume:v6];
}

- (void)_postIsMutedDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[MRDMediaRemoteServer server];
  unsigned int v4 = [v6 nowPlayingServer];
  unsigned int v5 = [v4 localOriginClient];
  [v5 setIsMuted:v3];
}

- (void)_postVolumeControlCapabilitiesDidChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = +[MRDMediaRemoteServer server];
  unsigned int v4 = [v6 nowPlayingServer];
  unsigned int v5 = [v4 localOriginClient];
  [v5 setVolumeControlCapabilities:v3];
}

- (BOOL)_platformHasNativeMuteSupport
{
  return 0;
}

- (unsigned)pbsVolumeControlCapabilities
{
  return 0;
}

@end