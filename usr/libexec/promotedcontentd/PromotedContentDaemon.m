@interface PromotedContentDaemon
+ (id)sharedInstance;
- (APAttributionRouter)attributionListener;
- (APCacheStatusUpdater)updater;
- (APConfigSystemBackgroundTask)configSystemRequestTask;
- (APConfigurationRequester)configRequester;
- (APMescalSigningRouter)mescalSigningListener;
- (APPCControllerRouter)controllerListener;
- (APPersistentCache)cache;
- (APRotationRouter)rotationRouter;
- (APXPCActivity)aesDownloadActivity;
- (APXPCActivity)dailyReportActivity;
- (APXPCActivity)gcActivity;
- (APXPCActivity)postInstallActivity;
- (APXPCActivity)timeSpentReportActivity;
- (PCStatusConditionsRouter)statusConditionsListener;
- (PCSupportRouter)supportListener;
- (PromotedContentDaemon)init;
- (_TtC16promotedcontentd29ObservabilityXPCTimerActivity)observabilityTimerActivity;
- (id)status;
- (void)setAesDownloadActivity:(id)a3;
- (void)setAttributionListener:(id)a3;
- (void)setConfigRequester:(id)a3;
- (void)setConfigSystemRequestTask:(id)a3;
- (void)setControllerListener:(id)a3;
- (void)setDailyReportActivity:(id)a3;
- (void)setGcActivity:(id)a3;
- (void)setMescalSigningListener:(id)a3;
- (void)setObservabilityTimerActivity:(id)a3;
- (void)setPostInstallActivity:(id)a3;
- (void)setRotationRouter:(id)a3;
- (void)setStatusConditionsListener:(id)a3;
- (void)setSupportListener:(id)a3;
- (void)setTimeSpentReportActivity:(id)a3;
@end

@implementation PromotedContentDaemon

+ (id)sharedInstance
{
  if (qword_100288878 != -1) {
    dispatch_once(&qword_100288878, &stru_10022E3F8);
  }
  v2 = (void *)qword_100288870;

  return v2;
}

- (PromotedContentDaemon)init
{
  v53.receiver = self;
  v53.super_class = (Class)PromotedContentDaemon;
  v2 = [(PromotedContentDaemon *)&v53 init];
  if (v2)
  {
    if (!MKBDeviceUnlockedSinceBoot()) {
      APSimulateCrash();
    }
    v3 = +[APDatabaseManager mainDatabase];
    [v3 setUpMainDatabase];

    v4 = +[APPromotedContentControllerDaemonModule setup];
    id v5 = objc_alloc_init((Class)APNetworkClientConfig);
    [v5 setUseFixedHttpSessionManager:[v4 httpUseFixedHttpSessionManager]];
    [v4 httpLookBackWindow];
    [v5 setLookBackWindow:];
    [v5 setHttpMaximumConnectionsPerHost:[v4 httpMaximumConnectionsPerHost]];
    [v5 setHttpMaximumConnectionsPerHostTempSession:[v4 httpMaximumConnectionsPerHostTempSession]];
    +[APNetworkClient createSharedNetworkClientWithConfig:v5];
    v6 = objc_alloc_init(APRotationRouter);
    rotationRouter = v2->_rotationRouter;
    v2->_rotationRouter = v6;

    v8 = -[APPersistentCache initWithCacheSize:]([APPersistentCache alloc], "initWithCacheSize:", [v4 cacheSizeLimit]);
    cache = v2->_cache;
    v2->_cache = v8;

    v10 = -[APMescalSigningRouter initWithAMSProvider:]([APMescalSigningRouter alloc], "initWithAMSProvider:", [v4 useAMSMescal]);
    mescalSigningListener = v2->_mescalSigningListener;
    v2->_mescalSigningListener = v10;

    v12 = objc_alloc_init(_TtC16promotedcontentd29ObservabilityXPCTimerActivity);
    observabilityTimerActivity = v2->_observabilityTimerActivity;
    v2->_observabilityTimerActivity = v12;

    v14 = v2->_observabilityTimerActivity;
    v15 = +[APDatabaseManager mainDatabase];
    +[APGlobalState createWithTimerXPCActivity:v14 database:v15];

    +[MetricsModule setup];
    +[APPCBaseEventListener startListeners];
    v16 = +[MetricsModule storage];
    v17 = [v16 notificationRegistrar];

    v18 = [[APCacheStatusUpdater alloc] initWithNotificationRegister:v17];
    updater = v2->_updater;
    v2->_updater = v18;

    v20 = objc_alloc_init(APMetricsLegacyInterface);
    +[APPCControllerMetricCoordinator startWithLegacyInterface:v20];
    v21 = objc_alloc_init(APPCControllerRouter);
    controllerListener = v2->_controllerListener;
    v2->_controllerListener = v21;

    v23 = objc_alloc_init(PCSupportRouter);
    supportListener = v2->_supportListener;
    v2->_supportListener = v23;

    v25 = objc_alloc_init(PCStatusConditionsRouter);
    statusConditionsListener = v2->_statusConditionsListener;
    v2->_statusConditionsListener = v25;

    v27 = objc_alloc_init(APAttributionRouter);
    attributionListener = v2->_attributionListener;
    v2->_attributionListener = v27;

    +[MetricsModule start];
    [(ObservabilityXPCTimerActivity *)v2->_observabilityTimerActivity checkin];
    [(APPersistentCache *)v2->_cache start];
    id v29 = objc_alloc((Class)APXPCActivity);
    v30 = [[APCacheGCActivity alloc] initWithCache:v2->_cache];
    v31 = (APXPCActivity *)[v29 initWithDelegate:v30];
    gcActivity = v2->_gcActivity;
    v2->_gcActivity = v31;

    [(APXPCActivity *)v2->_gcActivity checkin];
    v33 = objc_alloc_init(APPCPolicyAdProcessor);
    [(APPCPolicyAdProcessor *)v33 processAdPolicyData];
    id v34 = objc_alloc_init((Class)APConfigurationStorage);
    id v35 = objc_alloc((Class)APXPCActivity);
    v36 = [[APPostInstallActivity alloc] initWithConfigurationStorage:v34];
    v37 = (APXPCActivity *)[v35 initWithDelegate:v36];
    postInstallActivity = v2->_postInstallActivity;
    v2->_postInstallActivity = v37;

    [(APXPCActivity *)v2->_postInstallActivity checkin];
    id v39 = objc_alloc((Class)APXPCActivity);
    v40 = objc_alloc_init(APDailyReportActivity);
    v41 = (APXPCActivity *)[v39 initWithDelegate:v40];
    dailyReportActivity = v2->_dailyReportActivity;
    v2->_dailyReportActivity = v41;

    [(APXPCActivity *)v2->_dailyReportActivity schedule];
    id v43 = objc_alloc((Class)APXPCActivity);
    v44 = [[APTimeSpentReportActivity alloc] initWithLegacyInterface:v20];
    v45 = (APXPCActivity *)[v43 initWithDelegate:v44];
    timeSpentReportActivity = v2->_timeSpentReportActivity;
    v2->_timeSpentReportActivity = v45;

    [(APXPCActivity *)v2->_timeSpentReportActivity checkin];
    v47 = [[APConfigSystemBackgroundTask alloc] initWithConfigurationStorage:v34];
    configSystemRequestTask = v2->_configSystemRequestTask;
    v2->_configSystemRequestTask = v47;

    [(APConfigSystemBackgroundTask *)v2->_configSystemRequestTask registerTask];
    +[APGlobalState startWorkCoordinator];
    v49 = APLogForCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      unsigned int v50 = +[APSystemInfo firstRunSinceReboot];
      CFStringRef v51 = @"NOT ";
      if (v50) {
        CFStringRef v51 = &stru_1002392C0;
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v55 = v51;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Device has %@rebooted since last daemon launch", buf, 0xCu);
    }
  }
  return v2;
}

- (id)status
{
  return +[NSString stringWithFormat:@"Controller Listener:\t%@,\nMescal Signing Listener:\t%@,\nSupport Listener:\t%@,\nStatus Conditions Listener:\t%@", self->_controllerListener, self->_mescalSigningListener, self->_supportListener, self->_statusConditionsListener];
}

- (APPCControllerRouter)controllerListener
{
  return self->_controllerListener;
}

- (void)setControllerListener:(id)a3
{
}

- (APMescalSigningRouter)mescalSigningListener
{
  return self->_mescalSigningListener;
}

- (void)setMescalSigningListener:(id)a3
{
}

- (APCacheStatusUpdater)updater
{
  return self->_updater;
}

- (APPersistentCache)cache
{
  return self->_cache;
}

- (PCSupportRouter)supportListener
{
  return self->_supportListener;
}

- (void)setSupportListener:(id)a3
{
}

- (PCStatusConditionsRouter)statusConditionsListener
{
  return self->_statusConditionsListener;
}

- (void)setStatusConditionsListener:(id)a3
{
}

- (APAttributionRouter)attributionListener
{
  return self->_attributionListener;
}

- (void)setAttributionListener:(id)a3
{
}

- (APXPCActivity)aesDownloadActivity
{
  return self->_aesDownloadActivity;
}

- (void)setAesDownloadActivity:(id)a3
{
}

- (APXPCActivity)gcActivity
{
  return self->_gcActivity;
}

- (void)setGcActivity:(id)a3
{
}

- (APRotationRouter)rotationRouter
{
  return self->_rotationRouter;
}

- (void)setRotationRouter:(id)a3
{
}

- (APXPCActivity)postInstallActivity
{
  return self->_postInstallActivity;
}

- (void)setPostInstallActivity:(id)a3
{
}

- (APConfigurationRequester)configRequester
{
  return self->_configRequester;
}

- (void)setConfigRequester:(id)a3
{
}

- (APXPCActivity)dailyReportActivity
{
  return self->_dailyReportActivity;
}

- (void)setDailyReportActivity:(id)a3
{
}

- (_TtC16promotedcontentd29ObservabilityXPCTimerActivity)observabilityTimerActivity
{
  return self->_observabilityTimerActivity;
}

- (void)setObservabilityTimerActivity:(id)a3
{
}

- (APConfigSystemBackgroundTask)configSystemRequestTask
{
  return self->_configSystemRequestTask;
}

- (void)setConfigSystemRequestTask:(id)a3
{
}

- (APXPCActivity)timeSpentReportActivity
{
  return self->_timeSpentReportActivity;
}

- (void)setTimeSpentReportActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSpentReportActivity, 0);
  objc_storeStrong((id *)&self->_configSystemRequestTask, 0);
  objc_storeStrong((id *)&self->_observabilityTimerActivity, 0);
  objc_storeStrong((id *)&self->_dailyReportActivity, 0);
  objc_storeStrong((id *)&self->_configRequester, 0);
  objc_storeStrong((id *)&self->_postInstallActivity, 0);
  objc_storeStrong((id *)&self->_rotationRouter, 0);
  objc_storeStrong((id *)&self->_gcActivity, 0);
  objc_storeStrong((id *)&self->_aesDownloadActivity, 0);
  objc_storeStrong((id *)&self->_attributionListener, 0);
  objc_storeStrong((id *)&self->_statusConditionsListener, 0);
  objc_storeStrong((id *)&self->_supportListener, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_mescalSigningListener, 0);

  objc_storeStrong((id *)&self->_controllerListener, 0);
}

@end