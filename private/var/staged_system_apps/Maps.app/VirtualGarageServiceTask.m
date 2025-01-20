@interface VirtualGarageServiceTask
+ (int64_t)creationPreference;
- (BOOL)usesVirtualGarage;
- (OS_dispatch_queue)serviceQueue;
- (VirtualGarageServiceTask)init;
- (void)_mapsTerminated:(id)a3;
- (void)_setupVirtualGarageIfNeeded;
- (void)_tearDownVirtualGarage;
- (void)dealloc;
- (void)setServiceQueue:(id)a3;
- (void)setUsesVirtualGarage:(BOOL)a3;
- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4;
@end

@implementation VirtualGarageServiceTask

- (VirtualGarageServiceTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)VirtualGarageServiceTask;
  v2 = [(VirtualGarageServiceTask *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Maps.VirtualGarageServiceTask.configDelegate", v3);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v4;

    [(VirtualGarageServiceTask *)v2 _setupVirtualGarageIfNeeded];
  }
  return v2;
}

- (void)_setupVirtualGarageIfNeeded
{
  v3 = [(VirtualGarageServiceTask *)self serviceQueue];
  MapsFeature_AddDelegateListener();
  MapsFeature_AddDelegateListener();
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000400C0;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setUsesVirtualGarage:(BOOL)a3
{
  if (self->_usesVirtualGarage != a3)
  {
    BOOL v3 = a3;
    self->_usesVirtualGarage = a3;
    id v5 = sub_1000519B4();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "usesVirtualGarage changed. will open virtual garage connection", buf, 2u);
      }

      objc_super v7 = +[VGVirtualGarageService sharedService];
      [v7 openForClient:self];

      v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"_mapsTerminated:" name:UIApplicationWillTerminateNotification object:0];

      v9 = [(VirtualGarageServiceTask *)self serviceQueue];
      dispatch_async(v9, &stru_1013137D0);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "usesVirtualGarage changed. will close virtual garage connection", v10, 2u);
      }

      [(VirtualGarageServiceTask *)self _tearDownVirtualGarage];
      v9 = +[NSNotificationCenter defaultCenter];
      [v9 removeObserver:self name:UIApplicationWillTerminateNotification object:0];
    }
  }
}

+ (int64_t)creationPreference
{
  return 1;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)dealloc
{
  MapsFeature_RemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)VirtualGarageServiceTask;
  [(VirtualGarageServiceTask *)&v3 dealloc];
}

- (void)_tearDownVirtualGarage
{
  id v3 = +[VGVirtualGarageService sharedService];
  [v3 closeForClient:self];
}

- (void)_mapsTerminated:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(VirtualGarageServiceTask *)self serviceQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009DB7A0;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4
{
  BOOL v5 = a3.var0.var0 == MapsFeaturesConfig_EnableEVRouting
    && a3.var0.var1 == (void *)*((void *)&MapsFeaturesConfig_EnableEVRouting + 1);
  if (v5
    || (a3.var0.var0 == LODWORD(MapsFeaturesConfig_EnableAlberta[0])
      ? (BOOL v6 = a3.var0.var1 == (void *)MapsFeaturesConfig_EnableAlberta[1])
      : (BOOL v6 = 0),
        v6))
  {
    if (MapsFeature_IsEnabled_EVRouting()) {
      uint64_t IsEnabled_Alberta = 1;
    }
    else {
      uint64_t IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
    }
    v8 = sub_1000519B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (IsEnabled_Alberta) {
        v9 = @"YES";
      }
      else {
        v9 = @"NO";
      }
      v10 = v9;
      if (MapsFeature_IsEnabled_EVRouting()) {
        v11 = @"YES";
      }
      else {
        v11 = @"NO";
      }
      v12 = v11;
      if (MapsFeature_IsEnabled_Alberta()) {
        v13 = @"YES";
      }
      else {
        v13 = @"NO";
      }
      v14 = v13;
      int v15 = 138412802;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GEOConfigs changed. VirtualGarageIsEnabled: %@, evRoutingEnabled: %@, albertaEnabled: %@", (uint8_t *)&v15, 0x20u);
    }
    [(VirtualGarageServiceTask *)self setUsesVirtualGarage:IsEnabled_Alberta];
  }
}

- (BOOL)usesVirtualGarage
{
  return self->_usesVirtualGarage;
}

- (void)setServiceQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end