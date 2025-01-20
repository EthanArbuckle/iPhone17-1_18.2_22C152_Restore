@interface TMDaemonCore
- (BOOL)isAutomaticTimeEnabled;
- (BOOL)isAutomaticTimeZoneEnabled;
- (BOOL)isSystemTimeSet;
- (BOOL)isSystemTimeZoneSet;
- (BOOL)requiresActiveBBTime;
- (OS_dispatch_workloop)workloop;
- (TMDaemonCore)initWithTimeZoneRules:(id)a3 monotonicClock:(id)a4 preferences:(id)a5 workloop:(id)a6;
- (TMMonotonicClock)clock;
- (TMTimeProvider)timeProvider;
- (TMTimeZone)computedTimeZone;
- (double)accessoryUnc_s;
- (unsigned)rtcResetCount;
- (void)addPlugin:(id)a3;
- (void)addTimeProvider:(id)a3 forKey:(id)a4;
- (void)checkActiveTimeSourceRequired;
- (void)dealloc;
- (void)executeCommand:(id)a3 withHandler:(id)a4;
- (void)handleShutdown;
- (void)resetTime;
- (void)resetTimeZone:(id)a3;
- (void)rtcDidReset;
- (void)setAccessoryUnc_s:(double)a3;
- (void)setAccurateThresholds:(BOOL)a3;
- (void)setAutomaticTimeEnabled:(BOOL)a3;
- (void)setAutomaticTimeZoneEnabled:(BOOL)a3;
- (void)setClock:(id)a3;
- (void)setRequiresActiveBBTime:(BOOL)a3;
- (void)setSourceAvailable:(id)a3;
- (void)setSourceTime:(id)a3;
- (void)setSourceTimeZone:(id)a3;
- (void)setSourceUnavailable:(id)a3;
- (void)setSystemTimeSet:(BOOL)a3;
- (void)setSystemTimeZoneSet:(BOOL)a3;
- (void)testAndApplySystemTime;
- (void)timeZoneManager:(id)a3 didComputeResult:(id)a4;
- (void)timeZoneManager:(id)a3 didReset:(id)a4;
- (void)timeZoneManager:(id)a3 shouldFetch:(id)a4;
@end

@implementation TMDaemonCore

- (void)rtcDidReset
{
  ++self->_rtcResetCount;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TMRTCResetNotification", 0, 0, 0);
  AnalyticsSendEventLazy();
}

- (void)setAccurateThresholds:(BOOL)a3
{
}

- (void)handleShutdown
{
  if (![(TMDaemonCore *)self isSystemTimeSet])
  {
    [(TMDaemonCore *)self testAndApplySystemTime];
  }
}

- (TMDaemonCore)initWithTimeZoneRules:(id)a3 monotonicClock:(id)a4 preferences:(id)a5 workloop:(id)a6
{
  v32.receiver = self;
  v32.super_class = (Class)TMDaemonCore;
  v11 = [(TMDaemonCore *)&v32 init];
  if (v11)
  {
    v11->_prefs = (TMPreferences *)a5;
    v11->_pendingSetupTimeHandlers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v11->_timeProviders = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(TMPreferences *)v11->_prefs settimeofdayThreshold];
    v11->_settimeofdayThreshold = v12;
    v11->_workloop = (OS_dispatch_workloop *)a6;
    [(TMDaemonCore *)v11 setClock:a4];
    v11->cache = [[TMCache alloc] initWithPath:@"/var/db/timed/com.apple.timed.plist" clock:[(TMDaemonCore *)v11 clock]];
    v11->monitor = objc_alloc_init(TMTimeSynthesizerMonitor);
    if ([(TMCache *)v11->cache isValid])
    {
      v13 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Loading data from cache.", buf, 2u);
      }
      v14 = 0;
    }
    else
    {
      if ([(TMCache *)v11->cache systemTimeSet])
      {
        v14 = [(TMCache *)v11->cache filesystemTimestampOfPath:@"/var/db/timed/com.apple.timed.plist"];
      }
      else
      {
        v15 = qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cache was never used to set the clock, discarding filesystem timestamp.", buf, 2u);
        }
        v14 = 0;
      }
      [(TMCache *)v11->cache emptyPath:@"/var/db/timed/com.apple.timed.plist"];
      xpc_activity_unregister("com.apple.timed.check-active");
    }
    if ([(NSUUID *)[(TMCache *)v11->cache bootUUID] isEqual:sub_100007158((uint64_t)v11)])
    {
      v16 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(TMCache *)v11->cache bootUUID];
        unsigned int v18 = [(TMCache *)v11->cache rtcResetCount];
        *(_DWORD *)buf = 138412546;
        v34 = v17;
        __int16 v35 = 1024;
        unsigned int v36 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Boot UUID matches. Keeping RTC reset count. UUID:%@ Count:%u", buf, 0x12u);
      }
      v11->_rtcResetCount += [(TMCache *)v11->cache rtcResetCount];
    }
    if ([(TMCache *)v11->cache rtcReset]) {
      [(TMDaemonCore *)v11 rtcDidReset];
    }
    v11->_systemTimeSet = [(TMCache *)v11->cache systemTimeSet];
    [(TMCache *)v11->cache accessoryUnc_s];
    v11->_accessoryUnc_s = v19;
    sub_100007254((uint64_t)v11);
    v20 = [(TMCache *)v11->cache STF];
    if (v20)
    {
      v21 = +[TMTimeSynthesizer newSynthesizerFromDataRepresentation:v20];
      v11->_STF = v21;
      if (![(NSString *)[(TMTimeSynthesizer *)v21 name] isEqualToString:@"STF"]) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v11 file:@"TMDaemonCore.m" lineNumber:272 description:@"Cached STF name mismatch"];
      }
    }
    STF = v11->_STF;
    [(TMPreferences *)v11->_prefs RTCWakeUncertainty];
    -[TMTimeSynthesizer inflateHistoricalDataBy:](STF, "inflateHistoricalDataBy:");
    if ([(TMCache *)v11->cache TDTF])
    {
      v23 = +[TMTimeSynthesizer newSynthesizerFromDataRepresentation:](TMTimeSynthesizer, "newSynthesizerFromDataRepresentation:");
      v11->_timeSynthesizer = v23;
      if (![(NSString *)[(TMTimeSynthesizer *)v23 name] isEqualToString:@"TDTF"]) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v11 file:@"TMDaemonCore.m" lineNumber:279 description:@"Cached synthesizer name mismatch"];
      }
    }
    else
    {
      v24 = [TMTimeSynthesizer alloc];
      [(TMPreferences *)v11->_prefs RTCFrequencyTolerance];
      double v26 = v25;
      [(TMPreferences *)v11->_prefs RTCFrequencyNoiseDensity];
      v11->_timeSynthesizer = [(TMTimeSynthesizer *)v24 initWithClockAccuracy:@"TDTF" noiseDensity:v26 name:v27];
    }
    timeSynthesizer = v11->_timeSynthesizer;
    [(TMPreferences *)v11->_prefs RTCWakeUncertainty];
    -[TMTimeSynthesizer inflateHistoricalDataBy:](timeSynthesizer, "inflateHistoricalDataBy:");
    [(TMDaemonCore *)v11 addTimeProvider:v11->_timeSynthesizer forKey:@"Filtered"];
    v11->_timeZoneManager = [[TMTimeZoneManager alloc] initWithRules:a3 delegate:v11];
    if ([(TMPreferences *)v11->_prefs shouldUseFilesystemTimestamp] && v14)
    {
      v29 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v14;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Injecting filesystem timestamp: %@", buf, 0xCu);
      }
      [(TMDaemonCore *)v11 setSourceTime:v14];
    }
    v30 = objc_alloc_init(TMBackgroundNtpSource);
    v11->_ntpSource = v30;
    [(TMBackgroundNtpSource *)v30 setPreferences:v11->_prefs];
    [(TMCache *)v11->cache lastNTPFetchAttempt];
    -[TMBackgroundNtpSource setLastFetchAttempt:](v11->_ntpSource, "setLastFetchAttempt:");
    [(TMBackgroundNtpSource *)v11->_ntpSource setClock:[(TMDaemonCore *)v11 clock]];
    [(TMBackgroundNtpSource *)v11->_ntpSource setDaemonCore:v11];
    sub_10000729C(v11);
  }
  return v11;
}

- (void)dealloc
{
  self->bootUUID = 0;
  self->_plugins = 0;

  self->_pendingSetupTimeHandlers = 0;
  self->_timeProviders = 0;
  [+[NSNotificationCenter defaultCenter] removeObserver:self];

  self->_timeZoneManager = 0;
  self->_timeSynthesizer = 0;

  self->_STF = 0;
  self->_ntpSource = 0;
  [(TMDaemonCore *)self setClock:0];

  self->_prefs = 0;
  self->cache = 0;

  self->monitor = 0;
  v3.receiver = self;
  v3.super_class = (Class)TMDaemonCore;
  [(TMDaemonCore *)&v3 dealloc];
}

- (void)addPlugin:(id)a3
{
  plugins = self->_plugins;
  if (!plugins)
  {
    plugins = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_plugins = plugins;
  }

  [(NSMutableSet *)plugins addObject:a3];
}

- (void)testAndApplySystemTime
{
  if (self && [(TMDaemonCore *)self isAutomaticTimeEnabled])
  {
    sub_100007B50((id *)&self->super.isa, 6);
  }
}

- (void)setSystemTimeSet:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_systemTimeSet != a3)
  {
    self->_systemTimeSet = a3;
    sub_10000729C(self);
  }
  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    pendingSetupTimeHandlers = self->_pendingSetupTimeHandlers;
    id v6 = [(NSMutableArray *)pendingSetupTimeHandlers countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(pendingSetupTimeHandlers);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))();
        }
        id v7 = [(NSMutableArray *)pendingSetupTimeHandlers countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    [(NSMutableArray *)self->_pendingSetupTimeHandlers removeAllObjects];
  }
}

- (BOOL)isSystemTimeZoneSet
{
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(@"timezoneset", @"com.apple.preferences.datetime", &keyExistsAndHasValidFormat) != 0;
}

- (void)setSystemTimeZoneSet:(BOOL)a3
{
  CFPreferencesSetAppValue(@"timezoneset", +[NSNumber numberWithBool:a3], @"com.apple.preferences.datetime");

  CFPreferencesAppSynchronize(@"com.apple.preferences.datetime");
}

- (void)executeCommand:(id)a3 withHandler:(id)a4
{
  id v7 = [(TMMonotonicClock *)[(TMDaemonCore *)self clock] machTime];
  unsigned __int8 v8 = sub_100009274(self, (uint64_t)[a3 objectForKeyedSubscript:@"TMCommand"]);
  if ([a3 objectForKeyedSubscript:@"TMRtcTime"]
    || ![a3 objectForKeyedSubscript:@"TMMachTime"])
  {
    char v9 = 0;
  }
  else
  {
    if ((v8 & 1) == 0)
    {
      long long v10 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001AD6C(a3, v10);
      }
    }
    id v7 = [[a3 objectForKeyedSubscript:@"TMMachTime"] unsignedLongLongValue];
    char v9 = 1;
    unsigned __int8 v8 = 1;
  }
  if ([a3 objectForKeyedSubscript:@"TMRtcTime"]
    && [a3 objectForKeyedSubscript:@"TMMachTime"]
    && (!objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMCommand"), "isEqualToString:", @"TMSetSourceTime")|| (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMSource"), "isEqualToString:", @"NTP") & 1) == 0)&& os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    sub_10001AD04();
    if (v8) {
      goto LABEL_14;
    }
  }
  else if (v8)
  {
LABEL_14:
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000A270;
    v11[3] = &unk_100028C30;
    char v12 = v9;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = a4;
    [(TMMonotonicClock *)[(TMDaemonCore *)self clock] montonicTimeForMachTime:v7 toQueue:[(TMDaemonCore *)self workloop] withCompletionHandler:v11];
    return;
  }
  sub_1000095C4((NSDictionary *)self, a3, (uint64_t)a4);
}

- (void)setAutomaticTimeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "disabled";
    if (v3) {
      id v6 = "enabled";
    }
    int v7 = 136315138;
    unsigned __int8 v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received automatic time %s\n", (uint8_t *)&v7, 0xCu);
  }
  [(TMPreferences *)self->_prefs setAutomaticTimeEnabled:v3];
  if (v3)
  {
    [(TMDaemonCore *)self testAndApplySystemTime];
    sub_10000BF60(self, &stru_100028CC0);
    [(TMTimeSynthesizer *)self->_STF reset];
  }
}

- (BOOL)isAutomaticTimeEnabled
{
  return [(TMPreferences *)self->_prefs isAutomaticTimeEnabled];
}

- (void)setAutomaticTimeZoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "disabled";
    if (v3) {
      id v6 = "enabled";
    }
    *(_DWORD *)buf = 136315138;
    long long v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received automatic time zone %s\n", buf, 0xCu);
  }
  unsigned __int8 v7 = [(TMDaemonCore *)self isAutomaticTimeZoneEnabled];
  [(TMPreferences *)self->_prefs setAutomaticTimeZoneEnabled:v3];
  sub_10000C170((uint64_t)self);
  if (v3 && (v7 & 1) == 0)
  {
    [(TMMonotonicClock *)[(TMDaemonCore *)self clock] coarseMonotonicTime];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C200;
    v8[3] = &unk_100028CE8;
    [(TMDaemonCore *)self executeCommand:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"TMResetTimeZone", @"TMCommand", @"AutomaticTimeZoneEnabled", @"TMResetTimeZoneReason", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"TMRtcTime", 0) withHandler:v8];
  }
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  return [(TMPreferences *)self->_prefs isAutomaticTimeZoneEnabled];
}

- (void)checkActiveTimeSourceRequired
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C348;
  block[3] = &unk_100028DB0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(TMDaemonCore *)self workloop], block);
}

- (void)setSourceTime:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000CD58;
  v3[3] = &unk_100028E18;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)[(TMDaemonCore *)self workloop], v3);
}

- (void)setSourceAvailable:(id)a3
{
  CFStringRef v5 = (const __CFString *)[a3 objectForKeyedSubscript:@"TMSource"];
  id v6 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received source available from \"%@\"\n", buf, 0xCu);
  }
  unsigned __int8 v7 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a3 objectForKeyedSubscript:@"TMSource"];
    [objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
    *(_DWORD *)buf = 138412802;
    CFStringRef v11 = @"available";
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
  }
  AnalyticsSendEventLazy();
  sub_1000073E0(self, (uint64_t)"sourceWillBecomeAvailable:", (uint64_t)v5);
  [(TMTimeZoneManager *)self->_timeZoneManager setSourceAvailable:v5];
}

- (void)setSourceUnavailable:(id)a3
{
  CFStringRef v5 = (const __CFString *)[a3 objectForKeyedSubscript:@"TMSource"];
  id v6 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received source unavailable from \"%@\"\n", buf, 0xCu);
  }
  unsigned __int8 v7 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a3 objectForKeyedSubscript:@"TMSource"];
    [objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
    *(_DWORD *)buf = 138412802;
    CFStringRef v11 = @"unavailable";
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
  }
  AnalyticsSendEventLazy();
  [(TMTimeZoneManager *)self->_timeZoneManager setSourceUnavailable:v5];
  sub_1000073E0(self, (uint64_t)"sourceBecameUnavailable:", (uint64_t)v5);
}

- (void)setSourceTimeZone:(id)a3
{
  CFStringRef v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v13 = (const __CFString *)[a3 objectForKey:@"TMTimeZone"];
    __int16 v14 = 2112;
    id v15 = [a3 objectForKey:@"TMSource"];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received timezone \"%@\" from \"%@\"\n", buf, 0x16u);
  }
  id v6 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a3 objectForKeyedSubscript:@"TMSource"];
    [objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
    uint64_t v9 = v8;
    id v10 = [a3 objectForKeyedSubscript:@"TMTimeZone"];
    *(_DWORD *)buf = 138413058;
    CFStringRef v13 = @"TZ";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,tz,%@", buf, 0x2Au);
  }
  AnalyticsSendEventLazy();
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMSource"), "isEqualToString:", @"Location") sub_1000073E0(self, (uint64_t)"locationProvidedTimeZone:", (uint64_t)objc_msgSend(a3, "objectForKeyedSubscript:", @"TMTimeZone")); {
  CFStringRef v11 = [[TMTimeZone alloc] initWithDictionary:a3];
  }
  [(TMTimeZoneManager *)self->_timeZoneManager setSourceTimeZone:v11];
}

- (void)setRequiresActiveBBTime:(BOOL)a3
{
  BOOL requiresActiveBBTime = self->_requiresActiveBBTime;
  self->_BOOL requiresActiveBBTime = a3;
  if (requiresActiveBBTime != a3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TMBBTimeActiveNotification", 0, 0, 0);
    AnalyticsSendEventLazy();
  }
}

- (void)resetTime
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E55C;
  block[3] = &unk_100028DB0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(TMDaemonCore *)self workloop], block);
}

- (void)resetTimeZone:(id)a3
{
  id v5 = [a3 objectForKey:@"TMResetTimeZoneReason"];
  id v6 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a3 objectForKeyedSubscript:@"TMSource"];
    [objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
    *(_DWORD *)buf = 138413058;
    CFStringRef v10 = @"reset_tz";
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,reason,%@", buf, 0x2Au);
  }
  AnalyticsSendEventLazy();
  -[TMTimeZoneManager reset:](self->_timeZoneManager, "reset:", v5, _NSConcreteStackBlock, 3221225472, sub_10000E7E0, &unk_100028F00, v5, a3);
}

- (void)timeZoneManager:(id)a3 didReset:(id)a4
{
  sub_100007254((uint64_t)self);
  sub_1000073E0(self, (uint64_t)"timeZoneWasReset:", (uint64_t)a4);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AutomaticTimeZoneUpdateNeeded", 0, 0, 1u);

  sub_10000C170((uint64_t)self);
}

- (void)timeZoneManager:(id)a3 didComputeResult:(id)a4
{
  if (([a3 isEqual:self->_timeZoneManager] & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"TMDaemonCore.m", 1667, @"Got unexpected callback from manager %@", a3 object file lineNumber description];
  }
  sub_100008FCC((id *)&self->super.isa, (__CFString *)[a4 olsonName]);

  sub_100007254((uint64_t)self);
}

- (void)timeZoneManager:(id)a3 shouldFetch:(id)a4
{
  sub_100007254((uint64_t)self);
  sub_1000073E0(self, (uint64_t)"fetch:", (uint64_t)a4);

  sub_10000C170((uint64_t)self);
}

- (TMTimeZone)computedTimeZone
{
  BOOL v3 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    timeZoneManager = self->_timeZoneManager;
    int v6 = 138412290;
    id v7 = timeZoneManager;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Asked for computed time zone: %@", (uint8_t *)&v6, 0xCu);
  }
  return [(TMTimeZoneManager *)self->_timeZoneManager currentTimeZone];
}

- (TMTimeProvider)timeProvider
{
  v2 = (TMTimeProvider *)[(NSMutableDictionary *)self->_timeProviders objectForKeyedSubscript:[(TMPreferences *)self->_prefs providerName]];
  if (!v2 && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
    sub_10001B1E0();
  }
  return v2;
}

- (void)addTimeProvider:(id)a3 forKey:(id)a4
{
  if ([(NSMutableDictionary *)self->_timeProviders objectForKeyedSubscript:a4]
    && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    sub_10001B254();
  }
  [(NSMutableDictionary *)self->_timeProviders setObject:a3 forKeyedSubscript:a4];
}

- (BOOL)isSystemTimeSet
{
  return self->_systemTimeSet;
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (double)accessoryUnc_s
{
  return self->_accessoryUnc_s;
}

- (void)setAccessoryUnc_s:(double)a3
{
  self->_accessoryUnc_s = a3;
}

- (unsigned)rtcResetCount
{
  return self->_rtcResetCount;
}

- (BOOL)requiresActiveBBTime
{
  return self->_requiresActiveBBTime;
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

@end