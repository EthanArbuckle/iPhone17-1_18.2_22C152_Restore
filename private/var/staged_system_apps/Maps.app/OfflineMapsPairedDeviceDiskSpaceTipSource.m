@interface OfflineMapsPairedDeviceDiskSpaceTipSource
+ (id)_actionTitle;
+ (id)_icon;
+ (id)_subtitleWithRequiredDiskSpace:(int64_t)a3;
+ (id)_title;
+ (id)openManageWatchStorageURL;
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)showFeature;
- (GEOObserverHashTable)observers;
- (OfflineMapsPairedDeviceDiskSpaceTipSource)initWithIsActive:(BOOL)a3;
- (id)_activePairedDeviceID;
- (id)offlineMapsPairedDeviceDiskSpaceTipModel;
- (void)_hideTip;
- (void)_notifyObservers;
- (void)_showTipWithRequiredDiskSpace:(int64_t)a3;
- (void)_updateTipShown;
- (void)dealloc;
- (void)pairedSubscriptionInfosDidChange:(id)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation OfflineMapsPairedDeviceDiskSpaceTipSource

- (OfflineMapsPairedDeviceDiskSpaceTipSource)initWithIsActive:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OfflineMapsPairedDeviceDiskSpaceTipSource;
  v4 = [(OfflineMapsPairedDeviceDiskSpaceTipSource *)&v8 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Maps.Home.OfflineMapsPairedDeviceDiskSpaceTip", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    [(OfflineMapsPairedDeviceDiskSpaceTipSource *)v4 setActive:v3];
  }
  return v4;
}

- (id)_activePairedDeviceID
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = [v2 getActivePairedDeviceExcludingAltAccount];

  v4 = [v3 pairingID];

  return v4;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = self;
    objc_sync_enter(v4);
    dispatch_queue_t v5 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v6 = self->_observers;
    self->_observers = v5;

    objc_sync_exit(v4);
    observers = self->_observers;
  }

  return observers;
}

- (void)_updateTipShown
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v24 = [v2 objectForKey:@"OfflineMapsPairedDeviceDiskSpaceLastCheckedUUIDKey"];

  BOOL v3 = [(OfflineMapsPairedDeviceDiskSpaceTipSource *)self _activePairedDeviceID];
  v4 = [v3 UUIDString];
  unsigned int v5 = [v24 isEqual:v4];

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D1A9B0;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6 = +[NSUserDefaults standardUserDefaults];
    v7 = [v3 UUIDString];
    [v6 setObject:v7 forKey:@"OfflineMapsPairedDeviceDiskSpaceLastCheckedUUIDKey"];

    if (v3)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      objc_super v8 = +[MapsOfflineUIHelper sharedHelper];
      v9 = [v8 subscriptionInfos];

      uint64_t v10 = 0;
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v29;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v15 = [v14 pairedDeviceState];
            if (v15)
            {
              v16 = [v14 pairedDeviceState];
              BOOL v17 = [v16 downloadState] == 0;

              if (!v17)
              {
                v18 = [v14 state];
                id v19 = [v18 downloadedDataSize];

                v10 += (uint64_t)v19;
              }
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v11);
      }

      GEOConfigGetDouble();
      double v21 = v20;
      objc_initWeak(&location, self);
      v22 = +[MapsOfflineUIHelper sharedHelper];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100D1A9B8;
      v25[3] = &unk_1012F2F28;
      objc_copyWeak(v26, &location);
      v26[1] = (id)(v10 + (uint64_t)(v21 * (double)v10));
      [v22 getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:v25];

      objc_destroyWeak(v26);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (GEOConfigGetBOOL())
  {
    if (self->_active == v3) {
      return;
    }
    unsigned int v5 = sub_10010A09C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11[0] = 67109120;
      v11[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Becoming active: %d", (uint8_t *)v11, 8u);
    }

    self->_active = v3;
    v6 = +[MapsOfflineUIHelper sharedHelper];
    v7 = v6;
    if (v3)
    {
      [v6 addObserver:self];

      objc_super v8 = +[MapsOfflineUIHelper sharedHelper];
      [v8 startMonitoringPairedDeviceSubscriptionStates];

      v9 = +[NSNotificationCenter defaultCenter];
      [v9 addObserver:self selector:"_updateTipShown" name:NRPairedDeviceRegistryDevicesDidUpdateNotification object:0];
    }
    else
    {
      [v6 removeObserver:self];

      uint64_t v10 = +[MapsOfflineUIHelper sharedHelper];
      [v10 stopMonitoringPairedDeviceSubscriptionStates];

      v9 = +[NSNotificationCenter defaultCenter];
      [v9 removeObserver:self name:NRPairedDeviceRegistryDevicesDidUpdateNotification object:0];
    }
  }
  else
  {
    v9 = sub_10010A09C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Maps config has disabled the tip, will not activate.", (uint8_t *)v11, 2u);
    }
  }
}

- (void)pairedSubscriptionInfosDidChange:(id)a3
{
}

- (void)dealloc
{
  BOOL v3 = +[MapsOfflineUIHelper sharedHelper];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)OfflineMapsPairedDeviceDiskSpaceTipSource;
  [(OfflineMapsPairedDeviceDiskSpaceTipSource *)&v4 dealloc];
}

- (id)offlineMapsPairedDeviceDiskSpaceTipModel
{
  return self->_model;
}

- (void)_notifyObservers
{
  if ([(OfflineMapsPairedDeviceDiskSpaceTipSource *)self active])
  {
    observers = self->_observers;
    [(GEOObserverHashTable *)observers homeDataProvidingObjectDidUpdate:self];
  }
}

- (void)_hideTip
{
  self->_showFeature = 0;
  model = self->_model;
  self->_model = 0;

  [(OfflineMapsPairedDeviceDiskSpaceTipSource *)self _notifyObservers];
}

- (void)_showTipWithRequiredDiskSpace:(int64_t)a3
{
  self->_showFeature = 1;
  unsigned int v5 = [(id)objc_opt_class() openManageWatchStorageURL];
  objc_initWeak(&location, self);
  v6 = [FeatureDiscoveryModel alloc];
  v7 = [(id)objc_opt_class() _icon];
  objc_super v8 = [(id)objc_opt_class() _title];
  v9 = [(id)objc_opt_class() _subtitleWithRequiredDiskSpace:a3];
  uint64_t v10 = [(id)objc_opt_class() _actionTitle];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100D1A908;
  v17[3] = &unk_1012E5D08;
  id v11 = v5;
  id v18 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100D1A96C;
  v15[3] = &unk_1012E6708;
  objc_copyWeak(&v16, &location);
  LOBYTE(v14) = 0;
  uint64_t v12 = [(FeatureDiscoveryModel *)v6 initWithImage:v7 title:v8 subtitle:v9 actionTitle:v10 actionHandler:v17 bodyTapHandler:0 displayedHandler:0 dismissHandler:v15 disableAffordanceAfterAction:v14];
  model = self->_model;
  self->_model = v12;

  [(OfflineMapsPairedDeviceDiskSpaceTipSource *)self _notifyObservers];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

+ (id)_icon
{
  v2 = +[UIImageSymbolConfiguration configurationWithPointSize:64.0];
  BOOL v3 = +[UIImage systemImageNamed:@"arrow.down.applewatch"];
  objc_super v4 = [v3 imageByApplyingSymbolConfiguration:v2];

  return v4;
}

+ (id)_title
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"PAIRED_DEVICE_DISK_SPACE_TIP_TITLE" value:@"localized string not found" table:@"Offline"];

  return v3;
}

+ (id)_subtitleWithRequiredDiskSpace:(int64_t)a3
{
  BOOL v3 = +[NSByteCountFormatter stringFromByteCount:(unint64_t)((double)(uint64_t)llround((double)a3 / 1000000.0) * 1000000.0) countStyle:2];
  objc_super v4 = +[NSBundle mainBundle];
  unsigned int v5 = [v4 localizedStringForKey:@"PAIRED_DEVICE_DISK_SPACE_TIP_SUBTITLE" value:@"localized string not found" table:@"Offline"];
  v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3);

  return v6;
}

+ (id)_actionTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"PAIRED_DEVICE_DISK_SPACE_TIP_ACTION_TITLE" value:@"localized string not found" table:@"Offline"];

  return v3;
}

+ (id)openManageWatchStorageURL
{
  return +[NSURL URLWithString:@"bridge:tab=SETTINGS&root=GENERAL_LINK&path=USAGE_LINK"];
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (BOOL)showFeature
{
  return self->_showFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end