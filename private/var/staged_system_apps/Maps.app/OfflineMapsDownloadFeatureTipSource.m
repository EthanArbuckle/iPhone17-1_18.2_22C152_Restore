@interface OfflineMapsDownloadFeatureTipSource
- (BOOL)_allowToShowTip;
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)showFeature;
- (GEOObserverHashTable)observers;
- (OfflineMapsDownloadFeatureTipSource)initWithIsActive:(BOOL)a3;
- (id)offlineMapsDownloadTipModel;
- (void)_didOpenUserProfile:(id)a3;
- (void)_dismissTip;
- (void)_markAsShown;
- (void)_notifyObservers;
- (void)_showDownloadTipModelWithDisplayName:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setShowFeature:(BOOL)a3;
- (void)subscriptionInfosDidChange:(id)a3;
@end

@implementation OfflineMapsDownloadFeatureTipSource

- (OfflineMapsDownloadFeatureTipSource)initWithIsActive:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsDownloadFeatureTipSource;
  v4 = [(OfflineMapsDownloadFeatureTipSource *)&v7 init];
  v5 = v4;
  if (v4) {
    [(OfflineMapsDownloadFeatureTipSource *)v4 setActive:v3];
  }
  return v5;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    v5 = +[MapsOfflineUIHelper sharedHelper];
    v6 = v5;
    if (v3)
    {
      [v5 addObserver:self];

      id v7 = +[NSNotificationCenter defaultCenter];
      [v7 addObserver:self selector:"_didOpenUserProfile:" name:@"UserProfileDidOpenProfilePageNotification" object:0];
    }
    else
    {
      [v5 removeObserver:self];

      id v7 = +[NSNotificationCenter defaultCenter];
      [v7 removeObserver:self];
    }
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v6 = self->_observers;
    self->_observers = v5;

    objc_sync_exit(v4);
    observers = self->_observers;
  }

  return observers;
}

- (void)_notifyObservers
{
  if (self->_active) {
    [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
  }
}

- (id)offlineMapsDownloadTipModel
{
  return self->_model;
}

- (void)_dismissTip
{
  [(OfflineMapsDownloadFeatureTipSource *)self setShowFeature:0];

  [(OfflineMapsDownloadFeatureTipSource *)self _notifyObservers];
}

- (BOOL)_allowToShowTip
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"OfflineMapsUserHasOpenedOfflineManagementScreenKey"];

  if (v3)
  {
    v4 = sub_10082FFF0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      v5 = "already opened the OfflineScreen, won't show the tip";
      v6 = v4;
      uint32_t v7 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v19, v7);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v8 = +[NSUserDefaults standardUserDefaults];
  id v9 = [v8 integerForKey:@"OfflineMapsDownloadingTipDisplayedCountKey"];

  uint64_t UInteger = GEOConfigGetUInteger();
  if ((uint64_t)v9 >= UInteger)
  {
    uint64_t v17 = UInteger;
    v4 = sub_10082FFF0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v19 = 134217984;
      uint64_t v20 = v17;
      v5 = "already displayed maximum number of time, won't show the tip. The maximum is %ld";
      v6 = v4;
      uint32_t v7 = 12;
      goto LABEL_12;
    }
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  v11 = +[NSUserDefaults standardUserDefaults];
  v4 = [v11 objectForKey:@"OfflineMapsDownloadingTipLastDisplayedTimeKey"];

  v12 = +[NSDate date];
  v13 = v12;
  if (v4 && ([v12 timeIntervalSinceDate:v4], v14 < 86400.0))
  {
    v15 = sub_10082FFF0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "already displayed tip today, won't show the tip", (uint8_t *)&v19, 2u);
    }

    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = 1;
  }

LABEL_16:
  return v16;
}

- (void)_markAsShown
{
  id v6 = +[NSDate date];
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setObject:v6 forKey:@"OfflineMapsDownloadingTipLastDisplayedTimeKey"];

  unsigned int v3 = +[NSUserDefaults standardUserDefaults];
  v4 = (char *)[v3 integerForKey:@"OfflineMapsDownloadingTipDisplayedCountKey"];

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setInteger:v4 + 1 forKey:@"OfflineMapsDownloadingTipDisplayedCountKey"];
}

- (void)_showDownloadTipModelWithDisplayName:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
  -[ImageIconWithBackgroundConfiguration setIconSize:](v5, "setIconSize:", 35.0, 35.0);
  [(ImageIconWithBackgroundConfiguration *)v5 setCornerRadius:17.5];
  id v6 = +[UIColor whiteColor];
  [(ImageIconWithBackgroundConfiguration *)v5 setTintColor:v6];

  uint32_t v7 = +[UIColor colorNamed:@"ProfileGrayColor"];
  [(ImageIconWithBackgroundConfiguration *)v5 setBackgroundColor:v7];

  v8 = +[UIImage systemImageNamed:@"icloud.slash.fill"];
  v18 = [v8 _maps_imageIconWithBackgroundConfiguration:v5];

  id v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"[Offline] download tip title" value:@"localized string not found" table:@"Offline"];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v4);

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"[Offline] download tip subtitle" value:@"localized string not found" table:@"Offline"];

  objc_initWeak(location, self);
  double v14 = [FeatureDiscoveryModel alloc];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100830460;
  v23[3] = &unk_1012E6708;
  objc_copyWeak(&v24, location);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1008304A4;
  v21[3] = &unk_1012E6708;
  objc_copyWeak(&v22, location);
  LOBYTE(v17) = 1;
  v15 = [(FeatureDiscoveryModel *)v14 initWithImage:v18 title:v11 subtitle:v13 actionTitle:0 actionHandler:0 bodyTapHandler:0 displayedHandler:v23 dismissHandler:v21 disableAffordanceAfterAction:v17];
  model = self->_model;
  self->_model = v15;

  [(FeatureDiscoveryModel *)self->_model setIsTipMode:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008304E8;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v20, location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(location);
}

- (void)subscriptionInfosDidChange:(id)a3
{
  id v9 = a3;
  if (![(OfflineMapsDownloadFeatureTipSource *)self showFeature]
    && [(OfflineMapsDownloadFeatureTipSource *)self _allowToShowTip])
  {
    id v4 = [v9 lastObject];
    v5 = [v4 state];
    id v6 = [v5 downloadState];

    if (v6 == (id)2)
    {
      uint32_t v7 = [v4 subscription];
      v8 = [v7 displayName];
      [(OfflineMapsDownloadFeatureTipSource *)self _showDownloadTipModelWithDisplayName:v8];
    }
  }
}

- (void)_didOpenUserProfile:(id)a3
{
  if ([(OfflineMapsDownloadFeatureTipSource *)self showFeature])
  {
    [(OfflineMapsDownloadFeatureTipSource *)self _dismissTip];
  }
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->hasInitialData;
}

- (BOOL)showFeature
{
  return self->_showFeature;
}

- (void)setShowFeature:(BOOL)a3
{
  self->_showFeature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end