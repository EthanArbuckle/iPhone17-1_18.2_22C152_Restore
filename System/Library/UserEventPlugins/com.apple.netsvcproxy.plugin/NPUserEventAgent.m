@interface NPUserEventAgent
+ (id)sharedAgent;
- (BOOL)captiveOutage;
- (BOOL)captiveOutageWaitingForUserActivity;
- (BOOL)configFetchOnNetworkChange;
- (BOOL)directPathProbeOnNetworkChange;
- (BOOL)isObservingPath;
- (BOOL)proxyPathProbeOnNetworkChange;
- (BOOL)subscriptionCheckOnNetworkChange;
- (BOOL)tokenFetchOnNetworkChange;
- (NSData)nonwifiNetworkSignature;
- (NSData)wifiNetworkSignature;
- (NSDate)configurationFetchDate;
- (NSDate)directPathProbeDate;
- (NSDate)odohAuthOutageRestoreDate;
- (NSDate)odohRestoreDate;
- (NSDate)proxyPathProbeDate;
- (NSDate)proxyRestoreDate;
- (NSDate)resurrectionDate;
- (NSDate)subscriptionCheckDate;
- (NSDate)tokenFetchDate;
- (NSDate)tokenIssuanceRestrictedUntilDate;
- (NSTimer)configurationFetchTimer;
- (NSTimer)directPathProbeTimer;
- (NSTimer)locationMonitorTimer;
- (NSTimer)odohAuthOutageRestoreTimer;
- (NSTimer)odohRestoreTimer;
- (NSTimer)proxyPathProbeTimer;
- (NSTimer)proxyRestoreTimer;
- (NSTimer)resurrectionTimer;
- (NSTimer)subscriptionCheckTimer;
- (NSTimer)tokenFetchTimer;
- (NSTimer)tokenIssuanceRestrictedUntilTimer;
- (__SCDynamicStore)dynamicStore;
- (unint64_t)eventToken;
- (unint64_t)userActivityNotificationHandle;
- (void)handleProviderAction:(int64_t)a3 token:(unint64_t)a4 event:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)provider;
- (void)registerForCaptivePluginListChangedNotification;
- (void)registerForDynamicStoreChanges;
- (void)registerForUserActivityNotifications;
- (void)setCaptiveOutage:(BOOL)a3;
- (void)setCaptiveOutageWaitingForUserActivity:(BOOL)a3;
- (void)setConfigFetchOnNetworkChange:(BOOL)a3;
- (void)setConfigurationFetchDate:(id)a3;
- (void)setConfigurationFetchInterval:(int64_t)a3;
- (void)setConfigurationFetchTimer:(id)a3;
- (void)setDirectPathProbeDate:(id)a3;
- (void)setDirectPathProbeInterval:(int64_t)a3;
- (void)setDirectPathProbeOnNetworkChange:(BOOL)a3;
- (void)setDirectPathProbeTimer:(id)a3;
- (void)setDynamicStore:(__SCDynamicStore *)a3;
- (void)setEventToken:(unint64_t)a3;
- (void)setIsObservingPath:(BOOL)a3;
- (void)setLocationMonitorInterval:(double)a3;
- (void)setLocationMonitorTimer:(id)a3;
- (void)setNonwifiNetworkSignature:(id)a3;
- (void)setODoHAuthOutageRestoreInterval:(int64_t)a3;
- (void)setODoHRestoreInterval:(int64_t)a3;
- (void)setOdohAuthOutageRestoreDate:(id)a3;
- (void)setOdohAuthOutageRestoreTimer:(id)a3;
- (void)setOdohRestoreDate:(id)a3;
- (void)setOdohRestoreTimer:(id)a3;
- (void)setProvider:(void *)a3;
- (void)setProxyPathProbeDate:(id)a3;
- (void)setProxyPathProbeInterval:(int64_t)a3;
- (void)setProxyPathProbeOnNetworkChange:(BOOL)a3;
- (void)setProxyPathProbeTimer:(id)a3;
- (void)setProxyRestoreDate:(id)a3;
- (void)setProxyRestoreInterval:(int64_t)a3;
- (void)setProxyRestoreTimer:(id)a3;
- (void)setResurrectionDate:(id)a3;
- (void)setResurrectionInterval:(int64_t)a3;
- (void)setResurrectionTimer:(id)a3;
- (void)setSubscriptionCheckDate:(id)a3;
- (void)setSubscriptionCheckInterval:(int64_t)a3;
- (void)setSubscriptionCheckOnNetworkChange:(BOOL)a3;
- (void)setSubscriptionCheckTimer:(id)a3;
- (void)setTokenFetchDate:(id)a3;
- (void)setTokenFetchInterval:(int64_t)a3;
- (void)setTokenFetchOnNetworkChange:(BOOL)a3;
- (void)setTokenFetchTimer:(id)a3;
- (void)setTokenIssuanceRestrictedUntilDate:(id)a3;
- (void)setTokenIssuanceRestrictedUntilInterval:(int64_t)a3;
- (void)setTokenIssuanceRestrictedUntilTimer:(id)a3;
- (void)setUserActivityNotificationHandle:(unint64_t)a3;
- (void)setWifiNetworkSignature:(id)a3;
- (void)unregisterForUserActivityNotifications;
- (void)unwatchForPathChanges;
- (void)watchForPathChanges;
@end

@implementation NPUserEventAgent

+ (id)sharedAgent
{
  if (qword_17E60 != -1) {
    dispatch_once(&qword_17E60, &stru_14A00);
  }
  v2 = (void *)qword_17E58;

  return v2;
}

- (void)setResurrectionInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self resurrectionTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self resurrectionTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setResurrectionTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setResurrectionDate:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setResurrectionDate:v7];

    v8 = [(NPUserEventAgent *)self resurrectionDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self resurrectionDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14A40 block:0.0];
      [(NPUserEventAgent *)self setResurrectionTimer:v13];

      v14 = [(NPUserEventAgent *)self resurrectionTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self resurrectionTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BC0C();
        }
      }
    }
  }
}

- (void)setConfigurationFetchInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self configurationFetchTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self configurationFetchTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setConfigurationFetchTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setConfigurationFetchDate:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setConfigurationFetchDate:v7];

    v8 = [(NPUserEventAgent *)self configurationFetchDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self configurationFetchDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14A60 block:0.0];
      [(NPUserEventAgent *)self setConfigurationFetchTimer:v13];

      v14 = [(NPUserEventAgent *)self configurationFetchTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self configurationFetchTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BC40();
        }
      }
    }
  }
}

- (void)setTokenFetchInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self tokenFetchTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self tokenFetchTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setTokenFetchTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setTokenFetchDate:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setTokenFetchDate:v7];

    v8 = [(NPUserEventAgent *)self tokenFetchDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self tokenFetchDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14A80 block:0.0];
      [(NPUserEventAgent *)self setTokenFetchTimer:v13];

      v14 = [(NPUserEventAgent *)self tokenFetchTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self tokenFetchTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BC74();
        }
      }
    }
  }
}

- (void)setTokenIssuanceRestrictedUntilInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self tokenIssuanceRestrictedUntilTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self tokenIssuanceRestrictedUntilTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setTokenIssuanceRestrictedUntilTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setTokenIssuanceRestrictedUntilDate:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setTokenIssuanceRestrictedUntilDate:v7];

    v8 = [(NPUserEventAgent *)self tokenIssuanceRestrictedUntilDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self tokenIssuanceRestrictedUntilDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14AA0 block:0.0];
      [(NPUserEventAgent *)self setTokenIssuanceRestrictedUntilTimer:v13];

      v14 = [(NPUserEventAgent *)self tokenIssuanceRestrictedUntilTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self tokenIssuanceRestrictedUntilTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BCA8();
        }
      }
    }
  }
}

- (void)setSubscriptionCheckInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self subscriptionCheckTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self subscriptionCheckTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setSubscriptionCheckTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setSubscriptionCheckDate:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setSubscriptionCheckDate:v7];

    v8 = [(NPUserEventAgent *)self subscriptionCheckDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self subscriptionCheckDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14AC0 block:0.0];
      [(NPUserEventAgent *)self setSubscriptionCheckTimer:v13];

      v14 = [(NPUserEventAgent *)self subscriptionCheckTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self subscriptionCheckTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BCDC();
        }
      }
    }
  }
}

- (void)setProxyRestoreInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self proxyRestoreTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self proxyRestoreTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setProxyRestoreTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setProxyRestoreDate:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setProxyRestoreDate:v7];

    v8 = [(NPUserEventAgent *)self proxyRestoreDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self proxyRestoreDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14AE0 block:0.0];
      [(NPUserEventAgent *)self setProxyRestoreTimer:v13];

      v14 = [(NPUserEventAgent *)self proxyRestoreTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self proxyRestoreTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BD10();
        }
      }
    }
  }
}

- (void)setODoHRestoreInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self odohRestoreTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self odohRestoreTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setOdohRestoreTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setOdohRestoreDate:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setOdohRestoreDate:v7];

    v8 = [(NPUserEventAgent *)self odohRestoreDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self odohRestoreDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14B00 block:0.0];
      [(NPUserEventAgent *)self setOdohRestoreTimer:v13];

      v14 = [(NPUserEventAgent *)self odohRestoreTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self odohRestoreTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BD44();
        }
      }
    }
  }
}

- (void)setODoHAuthOutageRestoreInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self odohAuthOutageRestoreTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self odohAuthOutageRestoreTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setOdohAuthOutageRestoreTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setOdohAuthOutageRestoreDate:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setOdohAuthOutageRestoreDate:v7];

    v8 = [(NPUserEventAgent *)self odohAuthOutageRestoreDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self odohAuthOutageRestoreDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14B20 block:0.0];
      [(NPUserEventAgent *)self setOdohAuthOutageRestoreTimer:v13];

      v14 = [(NPUserEventAgent *)self odohAuthOutageRestoreTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self odohAuthOutageRestoreTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BD78();
        }
      }
    }
  }
}

- (void)setProxyPathProbeInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self proxyPathProbeTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self proxyPathProbeTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setProxyPathProbeTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setProxyPathProbeTimer:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setProxyPathProbeDate:v7];

    v8 = [(NPUserEventAgent *)self proxyPathProbeDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self proxyPathProbeDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14B40 block:0.0];
      [(NPUserEventAgent *)self setProxyPathProbeTimer:v13];

      v14 = [(NPUserEventAgent *)self proxyPathProbeTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self proxyPathProbeTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BDAC();
        }
      }
    }
  }
}

- (void)setDirectPathProbeInterval:(int64_t)a3
{
  v5 = [(NPUserEventAgent *)self directPathProbeTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self directPathProbeTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setDirectPathProbeTimer:0];
  }
  if (a3 < 1)
  {
    [(NPUserEventAgent *)self setDirectPathProbeTimer:0];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
    [(NPUserEventAgent *)self setDirectPathProbeDate:v7];

    v8 = [(NPUserEventAgent *)self directPathProbeDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = objc_alloc((Class)NSTimer);
      v12 = [(NPUserEventAgent *)self directPathProbeDate];
      id v13 = [v11 initWithFireDate:v12 interval:0 repeats:&stru_14B60 block:0.0];
      [(NPUserEventAgent *)self setDirectPathProbeTimer:v13];

      v14 = [(NPUserEventAgent *)self directPathProbeTimer];

      if (v14)
      {
        id v17 = +[NSRunLoop mainRunLoop];
        v15 = [(NPUserEventAgent *)self directPathProbeTimer];
        [v17 addTimer:v15 forMode:NSDefaultRunLoopMode];
      }
      else
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_BDE0();
        }
      }
    }
  }
}

- (void)setLocationMonitorInterval:(double)a3
{
  v5 = [(NPUserEventAgent *)self locationMonitorTimer];

  if (v5)
  {
    v6 = [(NPUserEventAgent *)self locationMonitorTimer];
    [v6 invalidate];

    [(NPUserEventAgent *)self setLocationMonitorTimer:0];
  }
  if (a3 >= 300.0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_9A6C;
    v11[3] = &unk_14B88;
    v11[4] = self;
    id v7 = +[NSTimer timerWithTimeInterval:0 repeats:v11 block:a3];
    [(NPUserEventAgent *)self setLocationMonitorTimer:v7];

    v8 = [(NPUserEventAgent *)self locationMonitorTimer];

    if (v8)
    {
      double v9 = +[NSRunLoop mainRunLoop];
      double v10 = [(NPUserEventAgent *)self locationMonitorTimer];
      [v9 addTimer:v10 forMode:NSDefaultRunLoopMode];
    }
    else
    {
      double v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_BE14();
      }
    }
  }
}

- (void)watchForPathChanges
{
  if (![(NPUserEventAgent *)self isObservingPath])
  {
    v3 = +[NWPathEvaluator sharedDefaultEvaluator];
    [v3 addObserver:self forKeyPath:@"path" options:0 context:0];

    [(NPUserEventAgent *)self setIsObservingPath:1];
  }
}

- (void)unwatchForPathChanges
{
  if ([(NPUserEventAgent *)self isObservingPath])
  {
    v3 = +[NWPathEvaluator sharedDefaultEvaluator];
    [v3 removeObserver:self forKeyPath:@"path"];

    [(NPUserEventAgent *)self setIsObservingPath:0];
  }
}

- (void)registerForCaptivePluginListChangedNotification
{
  if (qword_17E68 != -1) {
    dispatch_once(&qword_17E68, &stru_14BA8);
  }
}

- (void)registerForUserActivityNotifications
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9DE4;
  block[3] = &unk_14930;
  block[4] = self;
  if (qword_17E70 != -1) {
    dispatch_once(&qword_17E70, block);
  }
}

- (void)unregisterForUserActivityNotifications
{
  if ([(NPUserEventAgent *)self userActivityNotificationHandle])
  {
    unint64_t v3 = [(NPUserEventAgent *)self userActivityNotificationHandle];
    _IOPMUnregisterNotification(v3);
  }
}

- (void)registerForDynamicStoreChanges
{
  if (![(NPUserEventAgent *)self dynamicStore])
  {
    [(NPUserEventAgent *)self setDynamicStore:SCDynamicStoreCreate(kCFAllocatorDefault, @"networkserviceproxy event agent", (SCDynamicStoreCallBack)sub_A190, 0)];
    if ([(NPUserEventAgent *)self dynamicStore])
    {
      unint64_t v3 = [(NPUserEventAgent *)self dynamicStore];
      v4 = dispatch_get_global_queue(0, 0);
      LODWORD(v3) = SCDynamicStoreSetDispatchQueue(v3, v4);

      if (v3)
      {
        v5 = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetPvD);
        v6 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, 0);
        v8[0] = v6;
        v8[1] = v5;
        if (!SCDynamicStoreSetNotificationKeys([(NPUserEventAgent *)self dynamicStore], 0, (CFArrayRef)+[NSArray arrayWithObjects:v8 count:2]))
        {
          id v7 = nplog_obj();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            sub_BFF0();
          }
        }
      }
      else
      {
        v5 = nplog_obj();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_BF70();
        }
      }
    }
    else
    {
      v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_BEF0();
      }
    }
  }
}

- (void)handleProviderAction:(int64_t)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8 = a5;
  double v9 = self;
  objc_sync_enter(v9);
  if (a3 == 1 && v8)
  {
    [(NPUserEventAgent *)v9 setEventToken:a4];
    int int64 = xpc_dictionary_get_int64(v8, "PID");
    if (int64)
    {
      id v11 = nplog_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v35) = 67109120;
        DWORD1(v35) = int64;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Got pid %d", (uint8_t *)&v35, 8u);
      }

      v12 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
      [v12 launchOwner];
    }
    if (xpc_dictionary_get_int64(v8, "ResurrectionDate")) {
      [(NPUserEventAgent *)v9 setResurrectionInterval:xpc_dictionary_get_int64(v8, "ResurrectionDate")];
    }
    if (xpc_dictionary_get_int64(v8, "ConfigFetchDate")) {
      [(NPUserEventAgent *)v9 setConfigurationFetchInterval:xpc_dictionary_get_int64(v8, "ConfigFetchDate")];
    }
    if (!xpc_dictionary_get_int64(v8, "ConfigFetchOnNetworkChange"))
    {
LABEL_19:
      if (xpc_dictionary_get_double(v8, "LocationMonitorTimeInterval") != 0.0) {
        [(NPUserEventAgent *)v9 setLocationMonitorInterval:xpc_dictionary_get_double(v8, "LocationMonitorTimeInterval")];
      }
      if (xpc_dictionary_get_int64(v8, "TokenFetchDate")) {
        [(NPUserEventAgent *)v9 setTokenFetchInterval:xpc_dictionary_get_int64(v8, "TokenFetchDate")];
      }
      if (!xpc_dictionary_get_int64(v8, "TokenFetchOnNetworkChange"))
      {
LABEL_31:
        if (xpc_dictionary_get_int64(v8, "TokenIssuanceRestrictedUntilDate")) {
          [(NPUserEventAgent *)v9 setTokenIssuanceRestrictedUntilInterval:xpc_dictionary_get_int64(v8, "TokenIssuanceRestrictedUntilDate")];
        }
        if (!xpc_dictionary_get_int64(v8, "SubscriptionCheckOnNetworkChange"))
        {
LABEL_41:
          if (xpc_dictionary_get_int64(v8, "SubscriptionCheckDate")) {
            [(NPUserEventAgent *)v9 setSubscriptionCheckInterval:xpc_dictionary_get_int64(v8, "SubscriptionCheckDate")];
          }
          if (xpc_dictionary_get_int64(v8, "ProxyRestoreDate")) {
            [(NPUserEventAgent *)v9 setProxyRestoreInterval:xpc_dictionary_get_int64(v8, "ProxyRestoreDate")];
          }
          if (xpc_dictionary_get_int64(v8, "ODoHRestoreDate")) {
            [(NPUserEventAgent *)v9 setODoHRestoreInterval:xpc_dictionary_get_int64(v8, "ODoHRestoreDate")];
          }
          if (xpc_dictionary_get_int64(v8, "odohAuthRestoreDate")) {
            [(NPUserEventAgent *)v9 setODoHAuthOutageRestoreInterval:xpc_dictionary_get_int64(v8, "odohAuthRestoreDate")];
          }
          if (xpc_dictionary_get_int64(v8, "ProxyPathProber")) {
            [(NPUserEventAgent *)v9 setProxyPathProbeInterval:xpc_dictionary_get_int64(v8, "ProxyPathProber")];
          }
          if (!xpc_dictionary_get_int64(v8, "ProxyPathProbeOnNetworkChange"))
          {
LABEL_59:
            if (xpc_dictionary_get_int64(v8, "DirectPathProber")) {
              [(NPUserEventAgent *)v9 setDirectPathProbeInterval:xpc_dictionary_get_int64(v8, "DirectPathProber")];
            }
            if (!xpc_dictionary_get_int64(v8, "DirectPathProbeOnNetworkChange"))
            {
LABEL_69:
              if (!xpc_dictionary_get_int64(v8, "CaptiveOutage")) {
                goto LABEL_77;
              }
              int64_t v28 = xpc_dictionary_get_int64(v8, "CaptiveOutage");
              if (v28 == 1)
              {
                v29 = nplog_obj();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v35) = 136315138;
                  *(void *)((char *)&v35 + 4) = "CaptiveOutage";
                  v30 = "[%s] changed to true";
LABEL_75:
                  _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v35, 0xCu);
                }
              }
              else
              {
                v29 = nplog_obj();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v35) = 136315138;
                  *(void *)((char *)&v35 + 4) = "CaptiveOutage";
                  v30 = "[%s] changed to false";
                  goto LABEL_75;
                }
              }

              [(NPUserEventAgent *)v9 setCaptiveOutage:v28 == 1];
LABEL_77:
              if (!xpc_dictionary_get_int64(v8, "CaptiveOutageWaitingForUserActivity"))
              {
LABEL_85:
                [(NPUserEventAgent *)v9 registerForCaptivePluginListChangedNotification];
                [(NPUserEventAgent *)v9 registerForDynamicStoreChanges];
                [(NPUserEventAgent *)v9 registerForUserActivityNotifications];
                v34 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
                [v34 setReceivedEventToken:1];

                goto LABEL_86;
              }
              int64_t v31 = xpc_dictionary_get_int64(v8, "CaptiveOutageWaitingForUserActivity");
              if (v31 == 1)
              {
                v32 = nplog_obj();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v35) = 136315138;
                  *(void *)((char *)&v35 + 4) = "CaptiveOutageWaitingForUserActivity";
                  v33 = "[%s] changed to true";
LABEL_83:
                  _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)&v35, 0xCu);
                }
              }
              else
              {
                v32 = nplog_obj();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v35) = 136315138;
                  *(void *)((char *)&v35 + 4) = "CaptiveOutageWaitingForUserActivity";
                  v33 = "[%s] changed to false";
                  goto LABEL_83;
                }
              }

              [(NPUserEventAgent *)v9 setCaptiveOutageWaitingForUserActivity:v31 == 1];
              goto LABEL_85;
            }
            int64_t v25 = xpc_dictionary_get_int64(v8, "DirectPathProbeOnNetworkChange");
            if (v25 == 1)
            {
              v26 = nplog_obj();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v35) = 0;
                v27 = "Got direct path probe on network change";
LABEL_67:
                _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v35, 2u);
              }
            }
            else
            {
              v26 = nplog_obj();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v35) = 0;
                v27 = "Reset direct path on network change";
                goto LABEL_67;
              }
            }

            [(NPUserEventAgent *)v9 setDirectPathProbeOnNetworkChange:v25 == 1];
            goto LABEL_69;
          }
          int64_t v22 = xpc_dictionary_get_int64(v8, "ProxyPathProbeOnNetworkChange");
          if (v22 == 1)
          {
            v23 = nplog_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v35) = 0;
              v24 = "Got proxy path probe on network change";
LABEL_57:
              _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v35, 2u);
            }
          }
          else
          {
            v23 = nplog_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v35) = 0;
              v24 = "Reset proxy path probe on network change";
              goto LABEL_57;
            }
          }

          [(NPUserEventAgent *)v9 setProxyPathProbeOnNetworkChange:v22 == 1];
          goto LABEL_59;
        }
        int64_t v19 = xpc_dictionary_get_int64(v8, "SubscriptionCheckOnNetworkChange");
        if (v19 == 1)
        {
          v20 = nplog_obj();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v35) = 0;
            v21 = "Got subscription check on network change";
LABEL_39:
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v35, 2u);
          }
        }
        else
        {
          v20 = nplog_obj();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v35) = 0;
            v21 = "Reset token fetch on network change";
            goto LABEL_39;
          }
        }

        [(NPUserEventAgent *)v9 setSubscriptionCheckOnNetworkChange:v19 == 1];
        goto LABEL_41;
      }
      int64_t v16 = xpc_dictionary_get_int64(v8, "TokenFetchOnNetworkChange");
      if (v16 == 1)
      {
        id v17 = nplog_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          v18 = "Got token fetch on network change";
LABEL_29:
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v35, 2u);
        }
      }
      else
      {
        id v17 = nplog_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          v18 = "Reset token fetch on network change";
          goto LABEL_29;
        }
      }

      [(NPUserEventAgent *)v9 setTokenFetchOnNetworkChange:v16 == 1];
      goto LABEL_31;
    }
    int64_t v13 = xpc_dictionary_get_int64(v8, "ConfigFetchOnNetworkChange");
    if (v13 == 1)
    {
      v14 = nplog_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        v15 = "Got config fetch on network change";
LABEL_17:
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v35, 2u);
      }
    }
    else
    {
      v14 = nplog_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        v15 = "Reset config fetch on network change";
        goto LABEL_17;
      }
    }

    [(NPUserEventAgent *)v9 setConfigFetchOnNetworkChange:v13 == 1];
    goto LABEL_19;
  }
LABEL_86:
  objc_sync_exit(v9);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v56 = v11;
  if ([v10 isEqualToString:@"path"])
  {
    int64_t v13 = self;
    objc_sync_enter(v13);
    v14 = +[NWPathEvaluator sharedDefaultEvaluator];
    v15 = [v14 path];
    int64_t v16 = (char *)[v15 status];

    if (v16 != (unsigned char *)&dword_0 + 1)
    {
      [(NPUserEventAgent *)v13 setWifiNetworkSignature:0];
LABEL_47:
      objc_sync_exit(v13);

      goto LABEL_48;
    }
    if ([(NPUserEventAgent *)v13 configFetchOnNetworkChange])
    {
      id v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Triggering configuration fetch on network change", buf, 2u);
      }

      [(NPUserEventAgent *)v13 setConfigFetchOnNetworkChange:0];
      v18 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
      [v18 launchOwner];
    }
    if ([(NPUserEventAgent *)v13 tokenFetchOnNetworkChange])
    {
      int64_t v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Triggering token fetch on network change", buf, 2u);
      }

      [(NPUserEventAgent *)v13 setTokenFetchOnNetworkChange:0];
      v20 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
      [v20 launchOwner];
    }
    if ([(NPUserEventAgent *)v13 subscriptionCheckOnNetworkChange])
    {
      v21 = nplog_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Triggering subscription check on network change", buf, 2u);
      }

      [(NPUserEventAgent *)v13 setSubscriptionCheckOnNetworkChange:0];
      int64_t v22 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
      [v22 launchOwner];
    }
    v23 = +[NWPathEvaluator sharedDefaultEvaluator];
    v24 = [v23 path];
    int64_t v25 = [v24 interface];
    BOOL v26 = [v25 type] == (char *)&dword_0 + 1;

    if (v26)
    {
      v27 = +[NWPathEvaluator sharedDefaultEvaluator];
      int64_t v28 = [v27 path];
      id v29 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:v28];

      v30 = [v29 objectForKeyedSubscript:@"Signature"];
      uint64_t v31 = [(NPUserEventAgent *)v13 wifiNetworkSignature];
      unint64_t v32 = v30;
      v33 = (void *)v32;
      if (!(v32 | v31) || v32 && v31 && [(id)v31 isEqual:v32])
      {
      }
      else
      {

        v34 = nplog_obj();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "WiFi signature changed", buf, 2u);
        }

        [(NPUserEventAgent *)v13 setWifiNetworkSignature:v33];
        uint64_t v31 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
        [(id)v31 launchOwner];
      }
    }
    else
    {
      [(NPUserEventAgent *)v13 setWifiNetworkSignature:0];
    }
    long long v35 = +[NWPathEvaluator sharedDefaultEvaluator];
    v36 = [v35 path];
    v37 = [v36 interface];
    if ([v37 type] == (char *)&dword_0 + 2)
    {
    }
    else
    {
      v38 = +[NWPathEvaluator sharedDefaultEvaluator];
      v39 = [v38 path];
      v40 = [v39 interface];
      BOOL v41 = [v40 type] == (char *)&dword_0 + 3;

      if (!v41)
      {
        [(NPUserEventAgent *)v13 setNonwifiNetworkSignature:0];
        goto LABEL_47;
      }
    }
    v42 = +[NWPathEvaluator sharedDefaultEvaluator];
    v43 = [v42 path];
    id v44 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:v43];

    v45 = [v44 objectForKeyedSubscript:@"Signature"];
    uint64_t v46 = [(NPUserEventAgent *)v13 nonwifiNetworkSignature];
    unint64_t v47 = v45;
    v48 = (void *)v47;
    if (!(v47 | v46) || v47 && v46 && [(id)v46 isEqual:v47])
    {
    }
    else
    {

      v49 = +[NWPathEvaluator sharedDefaultEvaluator];
      v50 = [v49 path];
      v51 = [v50 interface];
      v52 = (char *)[v51 type];

      v53 = nplog_obj();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = "Ethernet";
        if (v52 == (unsigned char *)&dword_0 + 2) {
          v54 = "Cellular";
        }
        *(_DWORD *)buf = 136315138;
        v59 = v54;
        _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "%s signature changed", buf, 0xCu);
      }

      [(NPUserEventAgent *)v13 setNonwifiNetworkSignature:v48];
      if (![(NPUserEventAgent *)v13 captiveOutage]) {
        goto LABEL_45;
      }
      v55 = nplog_obj();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "captive outage is true, launching NSP", buf, 2u);
      }

      uint64_t v46 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
      [(id)v46 launchOwner];
    }

LABEL_45:
    goto LABEL_47;
  }
  v57.receiver = self;
  v57.super_class = (Class)NPUserEventAgent;
  [(NPUserEventAgent *)&v57 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_48:
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

- (NSDate)resurrectionDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResurrectionDate:(id)a3
{
}

- (NSDate)configurationFetchDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigurationFetchDate:(id)a3
{
}

- (NSDate)tokenFetchDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenFetchDate:(id)a3
{
}

- (NSDate)tokenIssuanceRestrictedUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenIssuanceRestrictedUntilDate:(id)a3
{
}

- (NSDate)subscriptionCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubscriptionCheckDate:(id)a3
{
}

- (NSDate)proxyRestoreDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProxyRestoreDate:(id)a3
{
}

- (NSDate)odohRestoreDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOdohRestoreDate:(id)a3
{
}

- (NSDate)odohAuthOutageRestoreDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOdohAuthOutageRestoreDate:(id)a3
{
}

- (NSDate)proxyPathProbeDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProxyPathProbeDate:(id)a3
{
}

- (NSDate)directPathProbeDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDirectPathProbeDate:(id)a3
{
}

- (unint64_t)eventToken
{
  return self->_eventToken;
}

- (void)setEventToken:(unint64_t)a3
{
  self->_eventToken = a3;
}

- (NSTimer)resurrectionTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setResurrectionTimer:(id)a3
{
}

- (NSTimer)configurationFetchTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setConfigurationFetchTimer:(id)a3
{
}

- (NSTimer)locationMonitorTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLocationMonitorTimer:(id)a3
{
}

- (NSTimer)tokenFetchTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTokenFetchTimer:(id)a3
{
}

- (BOOL)configFetchOnNetworkChange
{
  return self->_configFetchOnNetworkChange;
}

- (void)setConfigFetchOnNetworkChange:(BOOL)a3
{
  self->_configFetchOnNetworkChange = a3;
}

- (BOOL)tokenFetchOnNetworkChange
{
  return self->_tokenFetchOnNetworkChange;
}

- (void)setTokenFetchOnNetworkChange:(BOOL)a3
{
  self->_tokenFetchOnNetworkChange = a3;
}

- (BOOL)subscriptionCheckOnNetworkChange
{
  return self->_subscriptionCheckOnNetworkChange;
}

- (void)setSubscriptionCheckOnNetworkChange:(BOOL)a3
{
  self->_subscriptionCheckOnNetworkChange = a3;
}

- (BOOL)proxyPathProbeOnNetworkChange
{
  return self->_proxyPathProbeOnNetworkChange;
}

- (void)setProxyPathProbeOnNetworkChange:(BOOL)a3
{
  self->_proxyPathProbeOnNetworkChange = a3;
}

- (BOOL)directPathProbeOnNetworkChange
{
  return self->_directPathProbeOnNetworkChange;
}

- (void)setDirectPathProbeOnNetworkChange:(BOOL)a3
{
  self->_directPathProbeOnNetworkChange = a3;
}

- (BOOL)isObservingPath
{
  return self->_isObservingPath;
}

- (void)setIsObservingPath:(BOOL)a3
{
  self->_isObservingPath = a3;
}

- (NSTimer)tokenIssuanceRestrictedUntilTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTokenIssuanceRestrictedUntilTimer:(id)a3
{
}

- (NSTimer)subscriptionCheckTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSubscriptionCheckTimer:(id)a3
{
}

- (NSTimer)proxyRestoreTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setProxyRestoreTimer:(id)a3
{
}

- (NSTimer)odohRestoreTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOdohRestoreTimer:(id)a3
{
}

- (NSTimer)odohAuthOutageRestoreTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOdohAuthOutageRestoreTimer:(id)a3
{
}

- (NSTimer)proxyPathProbeTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setProxyPathProbeTimer:(id)a3
{
}

- (NSTimer)directPathProbeTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDirectPathProbeTimer:(id)a3
{
}

- (__SCDynamicStore)dynamicStore
{
  return self->_dynamicStore;
}

- (void)setDynamicStore:(__SCDynamicStore *)a3
{
  self->_dynamicStore = a3;
}

- (NSData)wifiNetworkSignature
{
  return (NSData *)objc_getProperty(self, a2, 208, 1);
}

- (void)setWifiNetworkSignature:(id)a3
{
}

- (NSData)nonwifiNetworkSignature
{
  return (NSData *)objc_getProperty(self, a2, 216, 1);
}

- (void)setNonwifiNetworkSignature:(id)a3
{
}

- (BOOL)captiveOutage
{
  return self->_captiveOutage;
}

- (void)setCaptiveOutage:(BOOL)a3
{
  self->_captiveOutage = a3;
}

- (BOOL)captiveOutageWaitingForUserActivity
{
  return self->_captiveOutageWaitingForUserActivity;
}

- (void)setCaptiveOutageWaitingForUserActivity:(BOOL)a3
{
  self->_captiveOutageWaitingForUserActivity = a3;
}

- (unint64_t)userActivityNotificationHandle
{
  return self->_userActivityNotificationHandle;
}

- (void)setUserActivityNotificationHandle:(unint64_t)a3
{
  self->_userActivityNotificationHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonwifiNetworkSignature, 0);
  objc_storeStrong((id *)&self->_wifiNetworkSignature, 0);
  objc_storeStrong((id *)&self->_directPathProbeTimer, 0);
  objc_storeStrong((id *)&self->_proxyPathProbeTimer, 0);
  objc_storeStrong((id *)&self->_odohAuthOutageRestoreTimer, 0);
  objc_storeStrong((id *)&self->_odohRestoreTimer, 0);
  objc_storeStrong((id *)&self->_proxyRestoreTimer, 0);
  objc_storeStrong((id *)&self->_subscriptionCheckTimer, 0);
  objc_storeStrong((id *)&self->_tokenIssuanceRestrictedUntilTimer, 0);
  objc_storeStrong((id *)&self->_tokenFetchTimer, 0);
  objc_storeStrong((id *)&self->_locationMonitorTimer, 0);
  objc_storeStrong((id *)&self->_configurationFetchTimer, 0);
  objc_storeStrong((id *)&self->_resurrectionTimer, 0);
  objc_storeStrong((id *)&self->_directPathProbeDate, 0);
  objc_storeStrong((id *)&self->_proxyPathProbeDate, 0);
  objc_storeStrong((id *)&self->_odohAuthOutageRestoreDate, 0);
  objc_storeStrong((id *)&self->_odohRestoreDate, 0);
  objc_storeStrong((id *)&self->_proxyRestoreDate, 0);
  objc_storeStrong((id *)&self->_subscriptionCheckDate, 0);
  objc_storeStrong((id *)&self->_tokenIssuanceRestrictedUntilDate, 0);
  objc_storeStrong((id *)&self->_tokenFetchDate, 0);
  objc_storeStrong((id *)&self->_configurationFetchDate, 0);

  objc_storeStrong((id *)&self->_resurrectionDate, 0);
}

@end