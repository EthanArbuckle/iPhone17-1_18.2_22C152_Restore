@interface ManagedConfiguration
+ (ManagedConfiguration)sharedInstance;
- (BOOL)coredata_diagnostic_metrics_enabled;
- (BOOL)disable_dps_wd;
- (BOOL)megawifiprofile_diagnostic_metrics_before_first_assoc;
- (BOOL)megawifiprofile_diagnostic_metrics_enabled;
- (BOOL)megawifiprofile_diagnostic_metrics_while_unassoc;
- (BOOL)monitoring;
- (BOOL)profileLoaded;
- (MCProfileConnection)mcConnection;
- (ManagedConfiguration)init;
- (NSDictionary)profileConfiguration;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)megaProfileInstalledTransaction;
- (WADiagDBDelegate)dbDelegate;
- (int)profileNoticeToken;
- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms;
- (void)MCSettingsDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileChangedCallback:(int)a3;
- (void)scheduleWithQueue:(id)a3;
- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3;
- (void)setDbDelegate:(id)a3;
- (void)setMcConnection:(id)a3;
- (void)setMegaProfileInstalledTransaction:(id)a3;
- (void)setMegawifiprofile_diagnostic_metrics_before_first_assoc:(BOOL)a3;
- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3;
- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3;
- (void)setMegawifiprofile_diagnostic_metrics_while_unassoc:(BOOL)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setProfileConfiguration:(id)a3;
- (void)setProfileLoaded:(BOOL)a3;
- (void)setProfileNoticeToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)unscheduleFromQueue:(id)a3;
@end

@implementation ManagedConfiguration

+ (ManagedConfiguration)sharedInstance
{
  if (qword_1000F0FF8 != -1) {
    dispatch_once(&qword_1000F0FF8, &stru_1000D0F80);
  }
  v2 = (void *)qword_1000F0FF0;

  return (ManagedConfiguration *)v2;
}

- (ManagedConfiguration)init
{
  v14.receiver = self;
  v14.super_class = (Class)ManagedConfiguration;
  v2 = [(ManagedConfiguration *)&v14 init];
  v3 = WALogCategoryDefaultHandle();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "-[ManagedConfiguration init]";
      __int16 v17 = 1024;
      int v18 = 104;
      __int16 v19 = 2112;
      CFStringRef v20 = @"com.apple.wifianalyticsd";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:starting id %@", buf, 0x1Cu);
    }

    [(ManagedConfiguration *)v2 setMonitoring:0];
    v5 = +[MCProfileConnection sharedConnection];
    [(ManagedConfiguration *)v2 setMcConnection:v5];

    v4 = +[NSUserDefaults standardUserDefaults];
    v6 = [v4 persistentDomainForName:@"com.apple.wifianalyticsd"];
    v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "-[ManagedConfiguration init]";
      __int16 v17 = 1024;
      int v18 = 114;
      __int16 v19 = 2112;
      CFStringRef v20 = @"com.apple.wifianalyticsd";
      __int16 v21 = 2112;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RecommendationPreferences bundleIdentifier %@ defaults %@", buf, 0x26u);
    }

    v8 = +[NSMutableDictionary dictionary];
    unsigned int v9 = +[WAUtil isWiFiFragmentSamplingEnabled];
    if (v9) {
      v10 = &__kCFBooleanTrue;
    }
    else {
      v10 = &__kCFBooleanFalse;
    }
    if (v9) {
      v11 = &off_1000E4048;
    }
    else {
      v11 = &off_1000E4060;
    }
    [v8 setObject:v10 forKey:@"megawifiprofile_diagnostic_metrics_enabled"];
    [v8 setObject:v11 forKey:@"megawifiprofile_diagnostic_metrics_period_ms"];
    [v8 setObject:v10 forKey:@"coredata_diagnostic_metrics_enabled"];
    [v8 setObject:&__kCFBooleanFalse forKey:@"megawifiprofile_diagnostic_metrics_before_first_assoc"];
    [v8 setObject:&__kCFBooleanTrue forKey:@"megawifiprofile_diagnostic_metrics_while_unassoc"];
    [v4 setPersistentDomain:v6 forName:@"com.apple.wifianalyticsd"];
    [v4 registerDefaults:v8];
    [v4 addObserver:v2 forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled" options:5 context:0];
    [v4 addObserver:v2 forKeyPath:@"megawifiprofile_diagnostic_metrics_period_ms" options:5 context:0];
    [v4 addObserver:v2 forKeyPath:@"coredata_diagnostic_metrics_enabled" options:5 context:0];
    [v4 addObserver:v2 forKeyPath:@"megawifiprofile_diagnostic_metrics_before_first_assoc" options:5 context:0];
    [v4 addObserver:v2 forKeyPath:@"megawifiprofile_diagnostic_metrics_while_unassoc" options:5 context:0];
    v12 = v2;
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "-[ManagedConfiguration init]";
    __int16 v17 = 1024;
    int v18 = 102;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
  }

  return v2;
}

- (void)dealloc
{
  if ([(ManagedConfiguration *)self monitoring]) {
    [(ManagedConfiguration *)self stopMonitoring];
  }
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled"];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_period_ms"];
  [v3 removeObserver:self forKeyPath:@"coredata_diagnostic_metrics_enabled"];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_before_first_assoc"];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_while_unassoc"];

  v4.receiver = self;
  v4.super_class = (Class)ManagedConfiguration;
  [(ManagedConfiguration *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  unsigned int v9 = [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  if (![v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_enabled"])
  {
    if ([v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_period_ms"])
    {
      if (!v11) {
        goto LABEL_28;
      }
      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_period_ms:](self, "setMegawifiprofile_diagnostic_metrics_period_ms:", [v11 unsignedIntValue]);
      v12 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v16 = 136446978;
      __int16 v17 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v18 = 1024;
      int v19 = 192;
      __int16 v20 = 2112;
      CFStringRef v21 = @"megawifiprofile_diagnostic_metrics_period_ms";
      __int16 v22 = 2048;
      unint64_t v23 = [(ManagedConfiguration *)self megawifiprofile_diagnostic_metrics_period_ms];
      v15 = "%{public}s::%d:%@ Preference is %lu";
    }
    else if ([v8 isEqualToString:@"coredata_diagnostic_metrics_enabled"])
    {
      if (!v11) {
        goto LABEL_28;
      }
      -[ManagedConfiguration setCoredata_diagnostic_metrics_enabled:](self, "setCoredata_diagnostic_metrics_enabled:", [v11 BOOLValue]);
      v12 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v16 = 136446978;
      __int16 v17 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v18 = 1024;
      int v19 = 197;
      __int16 v20 = 2112;
      CFStringRef v21 = @"coredata_diagnostic_metrics_enabled";
      __int16 v22 = 2048;
      unint64_t v23 = [(ManagedConfiguration *)self coredata_diagnostic_metrics_enabled];
      v15 = "%{public}s::%d:%@ Preference is %lu";
    }
    else if ([v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_before_first_assoc"])
    {
      if (!v11) {
        goto LABEL_28;
      }
      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_before_first_assoc:](self, "setMegawifiprofile_diagnostic_metrics_before_first_assoc:", [v11 BOOLValue]);
      v12 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v16 = 136446978;
      __int16 v17 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v18 = 1024;
      int v19 = 202;
      __int16 v20 = 2112;
      CFStringRef v21 = @"megawifiprofile_diagnostic_metrics_before_first_assoc";
      __int16 v22 = 2048;
      unint64_t v23 = [(ManagedConfiguration *)self megawifiprofile_diagnostic_metrics_before_first_assoc];
      v15 = "%{public}s::%d:%@ Preference is %lu";
    }
    else
    {
      if (![v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_while_unassoc"]|| !v11)
      {
        goto LABEL_28;
      }
      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_while_unassoc:](self, "setMegawifiprofile_diagnostic_metrics_while_unassoc:", [v11 BOOLValue]);
      v12 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v16 = 136446978;
      __int16 v17 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v18 = 1024;
      int v19 = 207;
      __int16 v20 = 2112;
      CFStringRef v21 = @"megawifiprofile_diagnostic_metrics_while_unassoc";
      __int16 v22 = 2048;
      unint64_t v23 = [(ManagedConfiguration *)self megawifiprofile_diagnostic_metrics_while_unassoc];
      v15 = "%{public}s::%d:%@ Preference is %lu";
    }
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v16, 0x26u);
    goto LABEL_27;
  }
  if (v11)
  {
    -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_enabled:](self, "setMegawifiprofile_diagnostic_metrics_enabled:", [v11 BOOLValue]);
    v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [(ManagedConfiguration *)self megawifiprofile_diagnostic_metrics_enabled];
      objc_super v14 = "NO";
      __int16 v17 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v18 = 1024;
      int v19 = 187;
      int v16 = 136446978;
      if (v13) {
        objc_super v14 = "YES";
      }
      __int16 v20 = 2112;
      CFStringRef v21 = @"megawifiprofile_diagnostic_metrics_enabled";
      __int16 v22 = 2080;
      unint64_t v23 = (unint64_t)v14;
      v15 = "%{public}s::%d:%@ Preference is %s";
      goto LABEL_26;
    }
LABEL_27:
  }
LABEL_28:
}

- (void)MCSettingsDidChange:(id)a3
{
  id v4 = a3;
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[ManagedConfiguration MCSettingsDidChange:]";
    __int16 v9 = 1024;
    int v10 = 215;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MCNotification received", (uint8_t *)&v7, 0x12u);
  }

  [(ManagedConfiguration *)self profileChangedCallback:0];
}

- (void)scheduleWithQueue:(id)a3
{
  id v4 = a3;
  [(ManagedConfiguration *)self setQueue:v4];
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[ManagedConfiguration scheduleWithQueue:]";
    __int16 v11 = 1024;
    int v12 = 226;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:scheduleWithQueue", buf, 0x12u);
  }

  int v7 = [(ManagedConfiguration *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035000;
  block[3] = &unk_1000D0D98;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)unscheduleFromQueue:(id)a3
{
  id v4 = a3;
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[ManagedConfiguration unscheduleFromQueue:]";
    __int16 v9 = 1024;
    int v10 = 238;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unscheduleFromQueue", (uint8_t *)&v7, 0x12u);
  }

  [(ManagedConfiguration *)self stopMonitoring];
  [(ManagedConfiguration *)self setQueue:0];
}

- (void)startMonitoring
{
  p_profileNoticeToken = &self->_profileNoticeToken;
  id v4 = dispatch_get_global_queue(0, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100035468;
  handler[3] = &unk_1000D0FA8;
  handler[4] = self;
  uint32_t v5 = notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", p_profileNoticeToken, v4, handler);

  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v15 = "-[ManagedConfiguration startMonitoring]";
    __int16 v16 = 1024;
    int v17 = 256;
    __int16 v18 = 1024;
    uint32_t v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:notify_register_dispatch for PROFILE_SERVICE_IDENTIFIER %d", buf, 0x18u);
  }

  id v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[ManagedConfiguration startMonitoring]";
    __int16 v16 = 1024;
    int v17 = 260;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding NSNotificationCenter Observer", buf, 0x12u);
  }

  __int16 v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"MCSettingsDidChange:" name:MCEffectiveSettingsChangedNotification object:0];

  int v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[ManagedConfiguration startMonitoring]";
    __int16 v16 = 1024;
    int v17 = 267;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DarwinNotifyCenter Observer", buf, 0x12u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  int v12 = DarwinNotifyCenter;
  if (DarwinNotifyCenter)
  {
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100035474, @"CCDaemonProfile Changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v4, &stru_1000D0FE8);
  }
  else
  {
    id v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[ManagedConfiguration startMonitoring]";
      __int16 v16 = 1024;
      int v17 = 270;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unable to get DarwinNotifyCenter", buf, 0x12u);
    }
  }

  [(ManagedConfiguration *)self setMonitoring:v12 != 0];
}

- (void)profileChangedCallback:(int)a3
{
  id v4 = [(ManagedConfiguration *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035708;
  block[3] = &unk_1000D0D98;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)stopMonitoring
{
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    int v7 = "-[ManagedConfiguration stopMonitoring]";
    __int16 v8 = 1024;
    int v9 = 414;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:removing observer", (uint8_t *)&v6, 0x12u);
  }

  uint32_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:MCEffectiveSettingsChangedNotification object:0];

  [(ManagedConfiguration *)self setMonitoring:0];
}

- (WADiagDBDelegate)dbDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dbDelegate);

  return (WADiagDBDelegate *)WeakRetained;
}

- (void)setDbDelegate:(id)a3
{
}

- (BOOL)disable_dps_wd
{
  return self->_disable_dps_wd;
}

- (BOOL)megawifiprofile_diagnostic_metrics_enabled
{
  return self->_megawifiprofile_diagnostic_metrics_enabled;
}

- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_enabled = a3;
}

- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms
{
  return self->_megawifiprofile_diagnostic_metrics_period_ms;
}

- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3
{
  self->_megawifiprofile_diagnostic_metrics_period_ms = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_before_first_assoc
{
  return self->_megawifiprofile_diagnostic_metrics_before_first_assoc;
}

- (void)setMegawifiprofile_diagnostic_metrics_before_first_assoc:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_before_first_assoc = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_while_unassoc
{
  return self->_megawifiprofile_diagnostic_metrics_while_unassoc;
}

- (void)setMegawifiprofile_diagnostic_metrics_while_unassoc:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_while_unassoc = a3;
}

- (BOOL)coredata_diagnostic_metrics_enabled
{
  return self->_coredata_diagnostic_metrics_enabled;
}

- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_coredata_diagnostic_metrics_enabled = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (MCProfileConnection)mcConnection
{
  return (MCProfileConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMcConnection:(id)a3
{
}

- (NSDictionary)profileConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProfileConfiguration:(id)a3
{
}

- (BOOL)profileLoaded
{
  return self->_profileLoaded;
}

- (void)setProfileLoaded:(BOOL)a3
{
  self->_profileLoaded = a3;
}

- (OS_os_transaction)megaProfileInstalledTransaction
{
  return self->_megaProfileInstalledTransaction;
}

- (void)setMegaProfileInstalledTransaction:(id)a3
{
}

- (int)profileNoticeToken
{
  return self->_profileNoticeToken;
}

- (void)setProfileNoticeToken:(int)a3
{
  self->_profileNoticeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_megaProfileInstalledTransaction, 0);
  objc_storeStrong((id *)&self->_profileConfiguration, 0);
  objc_storeStrong((id *)&self->_mcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_dbDelegate);
}

@end