@interface MapsDistanceUnitUpdater
- (GEOKeyBagNotification)keybagNotification;
- (MapsDistanceUnitUpdater)init;
- (MapsDistanceUnitUpdater)initWithKeyBagNotification:(id)a3;
- (int)unitChangedToken;
- (void)_localeDidChange:(id)a3;
- (void)_updateDistanceUnit;
- (void)dealloc;
- (void)protectedDataDidBecomeAvailable:(id)a3;
- (void)setKeybagNotification:(id)a3;
- (void)setUnitChangedToken:(int)a3;
- (void)start;
- (void)stop;
@end

@implementation MapsDistanceUnitUpdater

- (MapsDistanceUnitUpdater)init
{
  v3 = +[GEOKeyBagNotification sharedObject];
  v4 = [(MapsDistanceUnitUpdater *)self initWithKeyBagNotification:v3];

  return v4;
}

- (MapsDistanceUnitUpdater)initWithKeyBagNotification:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsDistanceUnitUpdater;
  v6 = [(MapsDistanceUnitUpdater *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keybagNotification, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(MapsDistanceUnitUpdater *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MapsDistanceUnitUpdater;
  [(MapsDistanceUnitUpdater *)&v3 dealloc];
}

- (void)start
{
  p_unitChangedToken = &self->_unitChangedToken;
  if (self->_unitChangedToken < 1)
  {
    v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "registering for changes", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v5 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100939D40;
    handler[3] = &unk_1012F6090;
    objc_copyWeak(&v8, buf);
    notify_register_dispatch("com.apple.Maps.DistanceUnitsChanged", p_unitChangedToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_localeDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];

    [(MapsDistanceUnitUpdater *)self _updateDistanceUnit];
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
  else
  {
    [(MapsDistanceUnitUpdater *)self _updateDistanceUnit];
  }
}

- (void)stop
{
  if (self->_unitChangedToken)
  {
    objc_super v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "unregistering for changes", v5, 2u);
    }

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self];

    notify_cancel(self->_unitChangedToken);
    self->_unitChangedToken = 0;
  }
}

- (void)_localeDidChange:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "locale did change - %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100939FEC;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "protected data did become available", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10093A0CC;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateDistanceUnit
{
  objc_super v3 = [(MapsDistanceUnitUpdater *)self keybagNotification];
  unsigned __int8 v4 = [v3 canAccessFilesWithProtection:3];

  if (v4)
  {
    id v5 = +[NSUserDefaults __maps_groupUserDefaults];
    v6 = [v5 stringForKey:@"DistanceUnits"];

    v7 = +[MSPMapsPaths mapsApplicationContainerPaths];
    id v8 = [v7 homeDirectory];
    objc_super v9 = _CFPreferencesCopyAppValueWithContainer();

    if (v6)
    {
      CFStringRef v10 = @"group container";
      v11 = v6;
    }
    else
    {
      if (!v9)
      {
        v15 = 0;
        CFStringRef v10 = 0;
        goto LABEL_11;
      }
      CFStringRef v10 = @"app container";
      v11 = v9;
    }
    v15 = v11;
LABEL_11:
    if ([v15 isEqualToString:@"Imperial"])
    {
      char v16 = 0;
      uint64_t v17 = 2;
    }
    else
    {
      unsigned int v18 = [v15 isEqualToString:@"Metric"];
      char v16 = v18 ^ 1;
      uint64_t v17 = v18;
    }
    v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v21 = 138413314;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v9;
      __int16 v25 = 2112;
      CFStringRef v26 = v10;
      __int16 v27 = 2112;
      v28 = v15;
      __int16 v29 = 2048;
      uint64_t v30 = v17;
    }

    if (v6 && v9 && ([v6 isEqualToString:v9] & 1) == 0)
    {
      v20 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        v22 = v9;
        __int16 v23 = 2112;
        v24 = v6;
      }
    }
    if ((v16 & 1) == 0) {
      +[NSLocale _navigation_overrideDistanceUnit:v17];
    }

    goto LABEL_25;
  }
  v12 = [(MapsDistanceUnitUpdater *)self keybagNotification];
  unsigned int v13 = [v12 addDataDidBecomeAvailableAfterFirstUnlockObserver:self];

  v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    CFStringRef v14 = @"NO";
    if (v13) {
      CFStringRef v14 = @"YES";
    }
    int v21 = 138412290;
    v22 = (void *)v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "unable to read user defaults because the user has not authenticated yet since boot, observer added %@", (uint8_t *)&v21, 0xCu);
  }
LABEL_25:
}

- (int)unitChangedToken
{
  return self->_unitChangedToken;
}

- (void)setUnitChangedToken:(int)a3
{
  self->_unitChangedToken = a3;
}

- (GEOKeyBagNotification)keybagNotification
{
  return self->_keybagNotification;
}

- (void)setKeybagNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end