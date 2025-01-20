@interface DPSQuickRecoveryRecommendationEngine
- (BOOL)checkAWDLActivity:(id)a3 symptomsDnsStats:(id)a4;
- (BOOL)checkDpsStatus:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5;
- (BOOL)checkForPriorityNetwork;
- (BOOL)checkParameterThresholds:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5 chipNumber:(id)a6 dpsSnapshot:(id)a7 originalCCA:(unsigned int)a8;
- (BOOL)isForegroundTrafficPresent;
- (BOOL)isGoodWiFiCondition:(id)a3;
- (BOOL)isHighAWDLActivity:(id)a3;
- (BOOL)isPeerDiagnosticsTriggerAllowed:(unint64_t)a3;
- (BOOL)isPriorityNetwork;
- (BOOL)isResetAllowedForKey:(id)a3 forPrefSelector:(SEL)a4;
- (BOOL)isResetAllowedForQuickDPS;
- (BOOL)isResetAllowedForSymptomsDPS;
- (BOOL)isScoreBelowThreshold:(id)a3;
- (BOOL)isTriggerDisconnect:(id)a3 currentSample:(id)a4;
- (DPSQuickRecoveryRecommendationEngine)init;
- (NSMutableDictionary)dpsQuickRecoveryWDBudgetDict;
- (NSMutableDictionary)dpsStats;
- (RecommendationPreferences)preferences;
- (id)computeFeatures:(id)a3 currentSample:(id)a4 acList:(id)a5;
- (id)updateDpsStats:(id)a3;
- (unint64_t)recommendReset:(id)a3 currentSample:(id)a4 acList:(id)a5 qDpsStat:(id)a6 chipNumber:(id)a7 dpsSnapshot:(id)a8 originalCCA:(unsigned int)a9;
- (unint64_t)recommendSymptomsDpsRecovery:(id)a3 symptomsDnsStats:(id)a4 awdlState:(BOOL)a5 currentSymptomsCondition:(BOOL)a6 isLANPingSuccessful:(BOOL)a7 appUsage:(BOOL)a8 averageCCA:(unsigned int)a9;
- (unsigned)computeBin:(id)a3 previousSample:(id)a4 currentSample:(id)a5;
- (void)addNumRecommendedScreenOffQuickRecoveryWD;
- (void)addNumRecommendedScreenOnQuickRecoveryWD;
- (void)addNumSuppressedScreenOffQuickRecoveryWD;
- (void)addNumSuppressedScreenOnQuickRecoveryWD;
- (void)setDpsQuickRecoveryWDBudgetDict:(id)a3;
- (void)setDpsStats:(id)a3;
- (void)setPreferences:(id)a3;
- (void)updateScreenState;
- (void)updateSymptomsDPSRecoveryWDStatsForKey:(id)a3;
- (void)updateTimeSincePreviousTriggerForQuickDps:(id)a3;
- (void)updateTimeSincePreviousTriggerForStudy:(id)a3 msgKey:(id)a4 dictKey:(id)a5;
@end

@implementation DPSQuickRecoveryRecommendationEngine

- (DPSQuickRecoveryRecommendationEngine)init
{
  v13.receiver = self;
  v13.super_class = (Class)DPSQuickRecoveryRecommendationEngine;
  v2 = [(DPSQuickRecoveryRecommendationEngine *)&v13 init];
  if (!v2)
  {
    v7 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136446466;
    v15 = "-[DPSQuickRecoveryRecommendationEngine init]";
    __int16 v16 = 1024;
    int v17 = 83;
    v8 = "%{public}s::%d:Error in super init failed";
LABEL_9:
    v9 = v7;
    uint32_t v10 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_13;
  }
  uint64_t v3 = +[RecommendationPreferences sharedObject];
  preferences = v2->_preferences;
  v2->_preferences = (RecommendationPreferences *)v3;

  if (!v2->_preferences)
  {
    v7 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136446466;
    v15 = "-[DPSQuickRecoveryRecommendationEngine init]";
    __int16 v16 = 1024;
    int v17 = 86;
    v8 = "%{public}s::%d:Error RecommendationPreferences init";
    goto LABEL_9;
  }
  uint32_t v5 = notify_register_check("com.apple.springboard.hasBlankedScreen", &v2->screenStateToken);
  if (!v5) {
    return v2;
  }
  uint32_t v11 = v5;
  v7 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v15 = "-[DPSQuickRecoveryRecommendationEngine init]";
    __int16 v16 = 1024;
    int v17 = 89;
    __int16 v18 = 1024;
    uint32_t v19 = v11;
    v8 = "%{public}s::%d:notify_register_check() for screenstate failed with %u";
    v9 = v7;
    uint32_t v10 = 24;
    goto LABEL_12;
  }
LABEL_13:

  v12 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[DPSQuickRecoveryRecommendationEngine init]";
    __int16 v16 = 1024;
    int v17 = 97;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:FAILED to initialize!", buf, 0x12u);
  }

  return 0;
}

- (id)updateDpsStats:(id)a3
{
  id v4 = a3;
  uint32_t v5 = +[NSMutableDictionary dictionary];
  [v5 addEntriesFromDictionary:v4];

  [v5 addEntriesFromDictionary:self->_dpsQuickRecoveryWDBudgetDict];
  [v5 addEntriesFromDictionary:self->_dpsStats];

  return v5;
}

- (void)addNumRecommendedScreenOnQuickRecoveryWD
{
  uint64_t v3 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_numRecommendedScreenOnQuickRecoveryWD"];
  if (v3)
  {
    id v4 = (void *)v3;
    uint32_t v5 = +[NSNumber numberWithInt:1];
  }
  else
  {
    uint32_t v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [0 intValue] + 1);
  }
  [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict setObject:v5 forKey:@"dps_numRecommendedScreenOnQuickRecoveryWD"];
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_numRecommendedScreenOnQuickRecoveryWD"];
    int v8 = 136446722;
    v9 = "-[DPSQuickRecoveryRecommendationEngine addNumRecommendedScreenOnQuickRecoveryWD]";
    __int16 v10 = 1024;
    int v11 = 121;
    __int16 v12 = 1024;
    unsigned int v13 = [v7 intValue] - 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:number screen-on fast resets triggered previously: %d", (uint8_t *)&v8, 0x18u);
  }
}

- (void)addNumRecommendedScreenOffQuickRecoveryWD
{
  uint64_t v3 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_numRecommendedScreenOffQuickRecoveryWD"];
  if (v3)
  {
    id v4 = (void *)v3;
    uint32_t v5 = +[NSNumber numberWithInt:1];
  }
  else
  {
    uint32_t v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [0 intValue] + 1);
  }
  [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict setObject:v5 forKey:@"dps_numRecommendedScreenOffQuickRecoveryWD"];
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_numRecommendedScreenOffQuickRecoveryWD"];
    int v8 = 136446722;
    v9 = "-[DPSQuickRecoveryRecommendationEngine addNumRecommendedScreenOffQuickRecoveryWD]";
    __int16 v10 = 1024;
    int v11 = 133;
    __int16 v12 = 1024;
    unsigned int v13 = [v7 intValue] - 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:number screen-off fast resets triggered previously: %d", (uint8_t *)&v8, 0x18u);
  }
}

- (void)addNumSuppressedScreenOnQuickRecoveryWD
{
  uint64_t v3 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_numSuppressedScreenOnQuickRecoveryWD"];
  if (v3)
  {
    id v4 = (void *)v3;
    uint32_t v5 = +[NSNumber numberWithInt:1];
  }
  else
  {
    uint32_t v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [0 intValue] + 1);
  }
  [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict setObject:v5 forKey:@"dps_numSuppressedScreenOnQuickRecoveryWD"];
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_numSuppressedScreenOnQuickRecoveryWD"];
    int v8 = 136446722;
    v9 = "-[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOnQuickRecoveryWD]";
    __int16 v10 = 1024;
    int v11 = 145;
    __int16 v12 = 1024;
    unsigned int v13 = [v7 intValue] - 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:number screen-on fast resets suppressed previously: %d", (uint8_t *)&v8, 0x18u);
  }
}

- (void)addNumSuppressedScreenOffQuickRecoveryWD
{
  uint64_t v3 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_numSuppressedScreenOffQuickRecoveryWD"];
  if (v3)
  {
    id v4 = (void *)v3;
    uint32_t v5 = +[NSNumber numberWithInt:1];
  }
  else
  {
    uint32_t v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [0 intValue] + 1);
  }
  [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict setObject:v5 forKey:@"dps_numSuppressedScreenOffQuickRecoveryWD"];
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_numSuppressedScreenOffQuickRecoveryWD"];
    int v8 = 136446722;
    v9 = "-[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOffQuickRecoveryWD]";
    __int16 v10 = 1024;
    int v11 = 157;
    __int16 v12 = 1024;
    unsigned int v13 = [v7 intValue] - 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:number screen-off fast resets suppressed previously: %d", (uint8_t *)&v8, 0x18u);
  }
}

- (BOOL)isForegroundTrafficPresent
{
  v2 = (const void *)sub_100036BA8((uint64_t)kCFAllocatorDefault);
  if (!v2)
  {
    int v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 168;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error managerClient init failed", buf, 0x12u);
    }
    goto LABEL_14;
  }
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_100036CC4((uint64_t)v2, (uint64_t)Current);
  id v4 = (void *)sub_100036DEC((uint64_t)v2);
  if (!v4)
  {
    int v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 173;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:No WiFi Devices present! Defaulting to screen state for decision!", buf, 0x12u);
    }
LABEL_14:

    uint32_t v5 = 0;
    goto LABEL_18;
  }
  uint32_t v5 = v4;
  if (![v4 count])
  {
LABEL_18:
    BOOL v10 = 1;
    goto LABEL_19;
  }
  v6 = [v5 objectAtIndexedSubscript:0];

  if (!v6)
  {
    __int16 v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 177;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:DeviceClient not present! Defaulting to screen state for decision!", buf, 0x12u);
    }

    goto LABEL_18;
  }
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  v7 = (unsigned int (*)(void *))off_1000F1020;
  __int16 v18 = off_1000F1020;
  if (!off_1000F1020)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10003E020;
    v20 = &unk_1000D1010;
    v21 = &v15;
    int v8 = (void *)sub_10003DDFC();
    v9 = dlsym(v8, "WiFiDeviceClientGetAppState");
    *(void *)(v21[1] + 24) = v9;
    off_1000F1020 = *(_UNKNOWN **)(v21[1] + 24);
    v7 = (unsigned int (*)(void *))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v7)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  BOOL v10 = v7(v6) != 0;
LABEL_19:
  CFRunLoopRef v13 = CFRunLoopGetCurrent();
  sub_100036F04((uint64_t)v2, (uint64_t)v13);
  if (v2) {
    CFRelease(v2);
  }

  return v10;
}

- (void)updateScreenState
{
  uint64_t state64 = 0;
  notify_get_state(self->screenStateToken, &state64);
  uint64_t v3 = state64;
  unsigned __int8 v4 = [(DPSQuickRecoveryRecommendationEngine *)self isForegroundTrafficPresent];
  if (v3 == 1) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4;
  }
  self->BOOL screenON = v5;
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "DETECTED";
    BOOL screenON = self->screenON;
    int v11 = "-[DPSQuickRecoveryRecommendationEngine updateScreenState]";
    *(_DWORD *)buf = 136446722;
    if (!screenON) {
      v7 = "NOT DETECTED";
    }
    __int16 v12 = 1024;
    int v13 = 198;
    __int16 v14 = 2080;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS Fast Reset Recommendation Engine: (screenON & foreGrnd traffic) is %s", buf, 0x1Cu);
  }
}

- (void)updateSymptomsDPSRecoveryWDStatsForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:v4];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = +[NSNumber numberWithInt:1];
  }
  else
  {
    v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [0 intValue] + 1);
  }
  [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict setObject:v7 forKey:v4];
  int v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v7 intValue];
    dpsQuickRecoveryWDBudgetDict = self->_dpsQuickRecoveryWDBudgetDict;
    int v11 = 136447234;
    __int16 v12 = "-[DPSQuickRecoveryRecommendationEngine updateSymptomsDPSRecoveryWDStatsForKey:]";
    __int16 v13 = 1024;
    int v14 = 210;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 1024;
    unsigned int v18 = v9;
    __int16 v19 = 2112;
    v20 = dpsQuickRecoveryWDBudgetDict;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Added key: %@ value:%d dict:%@", (uint8_t *)&v11, 0x2Cu);
  }
}

- (BOOL)isPriorityNetwork
{
  v2 = (const void *)sub_100036BA8((uint64_t)kCFAllocatorDefault);
  if (!v2)
  {
    uint64_t v5 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isPriorityNetwork]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 222;
    __int16 v17 = "%{public}s::%d:Error managerClient init failed";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v17, buf, 0x12u);
    goto LABEL_26;
  }
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_100036CC4((uint64_t)v2, (uint64_t)Current);
  id v4 = sub_100036DEC((uint64_t)v2);
  if (!v4)
  {
    uint64_t v5 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isPriorityNetwork]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 227;
    __int16 v17 = "%{public}s::%d:No WiFi Devices present! Defaulting to screen state for decision!";
    goto LABEL_21;
  }
  uint64_t v5 = v4;
  if (![v4 count])
  {
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  v6 = [v5 objectAtIndexedSubscript:0];

  if (v6)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    v7 = (uint64_t (*)(void *))off_1000F1030;
    v22 = off_1000F1030;
    if (!off_1000F1030)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10003E0C0;
      v24 = &unk_1000D1010;
      v25 = &v19;
      int v8 = (void *)sub_10003DDFC();
      unsigned int v9 = dlsym(v8, "WiFiDeviceClientCopyCurrentNetwork");
      *(void *)(v25[1] + 24) = v9;
      off_1000F1030 = *(_UNKNOWN **)(v25[1] + 24);
      v7 = (uint64_t (*)(void *))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v7) {
      goto LABEL_27;
    }
    uint64_t v10 = v7(v6);
LABEL_10:
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    int v11 = (uint64_t (*)(uint64_t))off_1000F1038;
    v22 = off_1000F1038;
    if (!off_1000F1038)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10003E110;
      v24 = &unk_1000D1010;
      v25 = &v19;
      __int16 v12 = (void *)sub_10003DDFC();
      __int16 v13 = dlsym(v12, "WiFiNetworkIsPriorityNetworkWrapper");
      *(void *)(v25[1] + 24) = v13;
      off_1000F1038 = *(_UNKNOWN **)(v25[1] + 24);
      int v11 = (uint64_t (*)(uint64_t))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (v11)
    {
      BOOL v14 = v11(v10) != 0;
      goto LABEL_14;
    }
LABEL_27:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  unsigned int v18 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isPriorityNetwork]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 231;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:DeviceClient not present! Defaulting to screen state for decision!", buf, 0x12u);
  }

LABEL_26:
  BOOL v14 = 0;
LABEL_14:

  CFRunLoopRef v15 = CFRunLoopGetCurrent();
  sub_100036F04((uint64_t)v2, (uint64_t)v15);
  if (v2) {
    CFRelease(v2);
  }
  return v14;
}

- (BOOL)checkForPriorityNetwork
{
  if ([(RecommendationPreferences *)self->_preferences disable_slow_wifi_dps_is_priority_network])
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = [(DPSQuickRecoveryRecommendationEngine *)self isPriorityNetwork];
  }
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(RecommendationPreferences *)self->_preferences disable_slow_wifi_dps_is_priority_network];
    v6 = "NO";
    uint64_t v10 = "-[DPSQuickRecoveryRecommendationEngine checkForPriorityNetwork]";
    __int16 v11 = 1024;
    int v12 = 256;
    if (v5) {
      v7 = "YES";
    }
    else {
      v7 = "NO";
    }
    int v9 = 136446978;
    BOOL v14 = v7;
    __int16 v13 = 2080;
    if (v3) {
      v6 = "YES";
    }
    __int16 v15 = 2080;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Priority Network Check Disabled: %s IsPriorityNetwork: %s", (uint8_t *)&v9, 0x26u);
  }

  return v3;
}

- (BOOL)isResetAllowedForSymptomsDPS
{
  if (self->screenON)
  {
    unsigned int v3 = [(DPSQuickRecoveryRecommendationEngine *)self isResetAllowedForKey:@"symptomsDps_lastScreenOnRecoveryWD" forPrefSelector:"minutes_between_symptoms_dps_wd_screen_on"];
    BOOL v4 = v3;
    CFStringRef v5 = @"symptomsDps_numSuppressedScreenOnRecoveryWD";
    CFStringRef v6 = @"symptomsDps_numRecommendedScreenOnRecoveryWD";
  }
  else
  {
    unsigned int v3 = [(DPSQuickRecoveryRecommendationEngine *)self isResetAllowedForKey:@"symptomsDps_lastScreenOffRecoveryWD" forPrefSelector:"minutes_between_symptoms_dps_wd_screen_off"];
    BOOL v4 = v3;
    CFStringRef v5 = @"symptomsDps_numSuppressedScreenOffRecoveryWD";
    CFStringRef v6 = @"symptomsDps_numRecommendedScreenOffRecoveryWD";
  }
  if (v3) {
    CFStringRef v7 = v6;
  }
  else {
    CFStringRef v7 = v5;
  }
  [(DPSQuickRecoveryRecommendationEngine *)self updateSymptomsDPSRecoveryWDStatsForKey:v7];
  return v4;
}

- (BOOL)isResetAllowedForQuickDPS
{
  if (!self->screenON)
  {
    if ([(DPSQuickRecoveryRecommendationEngine *)self isResetAllowedForKey:@"dps_lastScreenOffQuickRecoveryWD" forPrefSelector:"minutes_between_fast_dps_wd_screen_off"])
    {
      goto LABEL_6;
    }
    if (![(DPSQuickRecoveryRecommendationEngine *)self isResetAllowedForKey:@"dps_lastScreenOnQuickRecoveryWD" forPrefSelector:"minutes_between_fast_dps_wd_screen_on"])
    {
      [(DPSQuickRecoveryRecommendationEngine *)self addNumSuppressedScreenOffQuickRecoveryWD];
      return 0;
    }
LABEL_8:
    [(DPSQuickRecoveryRecommendationEngine *)self addNumRecommendedScreenOnQuickRecoveryWD];
    return 1;
  }
  if ([(DPSQuickRecoveryRecommendationEngine *)self isResetAllowedForKey:@"dps_lastScreenOnQuickRecoveryWD" forPrefSelector:"minutes_between_fast_dps_wd_screen_on"])
  {
    goto LABEL_8;
  }
  if ([(DPSQuickRecoveryRecommendationEngine *)self isResetAllowedForKey:@"dps_lastScreenOffQuickRecoveryWD" forPrefSelector:"minutes_between_fast_dps_wd_screen_off"])
  {
LABEL_6:
    [(DPSQuickRecoveryRecommendationEngine *)self addNumRecommendedScreenOffQuickRecoveryWD];
    return 1;
  }
  [(DPSQuickRecoveryRecommendationEngine *)self addNumSuppressedScreenOnQuickRecoveryWD];
  return 0;
}

- (BOOL)isResetAllowedForKey:(id)a3 forPrefSelector:(SEL)a4
{
  id v6 = a3;
  CFStringRef v7 = +[NSDate date];
  int v8 = (unsigned int (*)(RecommendationPreferences *, SEL))[(RecommendationPreferences *)self->_preferences methodForSelector:a4];
  int v9 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:v6];
  if (v9 && ([v7 timeIntervalSinceDate:v9], (int)(v10 / 60.0) < v8(self->_preferences, a4)))
  {
    BOOL v11 = 0;
  }
  else
  {
    [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict setObject:v7 forKey:v6];
    BOOL v11 = 1;
  }
  int v12 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = "-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:]";
    __int16 v13 = "NO";
    __int16 v17 = 1024;
    int v18 = 330;
    int v15 = 136447490;
    if (v11) {
      __int16 v13 = "YES";
    }
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    v24 = v7;
    __int16 v25 = 2080;
    v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:key:%@ previousWD_TS:%@ currentWD_TS:%@ recommendation:%s", (uint8_t *)&v15, 0x3Au);
  }

  return v11;
}

- (id)computeFeatures:(id)a3 currentSample:(id)a4 acList:(id)a5
{
  id v305 = a3;
  id v318 = a4;
  id v7 = a5;
  int v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 335;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Computing features for ML model...", buf, 0x12u);
  }

  long long v379 = 0u;
  long long v380 = 0u;
  long long v377 = 0u;
  long long v378 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v377 objects:v393 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v378;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v378 != v11) {
          objc_enumerationMutation(v9);
        }
        __int16 v13 = *(void **)(*((void *)&v377 + 1) + 8 * i);
        BOOL v14 = [v13 fieldForKey:@"DPSN_symptom"];
        unsigned int v15 = [v14 int32Value];

        if (!v15)
        {
          id v20 = [v13 fieldForKey:@"DPSN_problemAC"];
          unsigned int v19 = [v20 uint32Value];

          int v17 = (v19 >> 1) & 1;
          int v18 = v19 & 1;
          int v16 = (v19 >> 2) & 1;
          LODWORD(v10) = (v19 >> 3) & 1;
          goto LABEL_13;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v377 objects:v393 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  int v16 = 0;
  int v17 = 0;
  int v18 = 0;
  unsigned int v19 = 0;
LABEL_13:

  __int16 v21 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447746;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 358;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v19;
    *(_WORD *)&v388[4] = 1024;
    *(_DWORD *)&v388[6] = v18;
    LOWORD(v389) = 1024;
    *(_DWORD *)((char *)&v389 + 2) = v17;
    HIWORD(v389) = 1024;
    int v390 = v16;
    __int16 v391 = 1024;
    int v392 = (int)v10;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:problemAC: %u dpsBE:%d dpsBK:%d dpsVO:%d dpsVI:%d", buf, 0x30u);
  }

  v22 = [v305 fieldForKey:@"DPSCS_peerStats"];
  __int16 v23 = [v22 subMessageValue];
  v24 = [v23 fieldForKey:@"NWAPS_ccas"];
  __int16 v25 = [v24 repeatableValues];
  v26 = (char *)[v25 count];

  double v27 = 0.0;
  v304 = v9;
  unsigned int v303 = v19;
  if (v26)
  {
    v326 = v26 - 1;
    if (v26 != (char *)1)
    {
      v321 = v26;
      unint64_t v28 = 0;
      unsigned int v29 = 0;
      while (1)
      {
        unsigned int v333 = v29;
        v364 = [v318 fieldForKey:@"DPSCS_peerStats"];
        v357 = [v364 subMessageValue];
        v351 = [v357 fieldForKey:@"NWAPS_ccas"];
        v30 = [v351 repeatableValues];
        v31 = [v30 objectAtIndex:v28];
        v32 = [v31 fieldForKey:@"NWASB_residentTime"];
        id v342 = [v32 uint64Value];
        v33 = [v305 fieldForKey:@"DPSCS_peerStats"];
        v34 = [v33 subMessageValue];
        v35 = [v34 fieldForKey:@"NWAPS_ccas"];
        v36 = [v35 repeatableValues];
        v37 = [v36 objectAtIndex:v28];
        v38 = [v37 fieldForKey:@"NWASB_residentTime"];
        id v39 = [v38 uint64Value];

        if (v342 != v39) {
          break;
        }
        unint64_t v28 = v333 + 1;
        unsigned int v29 = v333 + 1;
        if ((unint64_t)v326 <= v28) {
          goto LABEL_22;
        }
      }
      double v27 = (double)v333;
LABEL_22:
      v26 = v321;
    }
  }
  v40 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 374;
    __int16 v387 = 2048;
    *(void *)v388 = v26;
    *(_WORD *)&v388[8] = 2048;
    double v389 = v27;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:ccaBinCount:%llu ccaBin:%.2f", buf, 0x26u);
  }

  v41 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v42 = [v41 subMessageValue];
  v43 = [v42 fieldForKey:@"NWAPS_rssis"];
  v44 = [v43 repeatableValues];
  id v45 = [v44 count];

  double v46 = 0.0;
  unint64_t v327 = (unint64_t)v45;
  if ((unint64_t)v45 >= 2)
  {
    unsigned int v47 = 0;
    unint64_t v48 = 1;
    while (1)
    {
      v365 = [v318 fieldForKey:@"DPSCS_peerStats"];
      v358 = [v365 subMessageValue];
      v352 = [v358 fieldForKey:@"NWAPS_rssis"];
      v343 = [v352 repeatableValues];
      v49 = [v343 objectAtIndex:v48];
      v50 = [v49 fieldForKey:@"NWASB_residentTime"];
      id v334 = [v50 uint64Value];
      v51 = [v305 fieldForKey:@"DPSCS_peerStats"];
      v52 = [v51 subMessageValue];
      v53 = [v52 fieldForKey:@"NWAPS_rssis"];
      v54 = [v53 repeatableValues];
      v55 = [v54 objectAtIndex:v48];
      v56 = [v55 fieldForKey:@"NWASB_residentTime"];
      id v57 = [v56 uint64Value];

      if (v334 != v57) {
        break;
      }
      unint64_t v48 = v47 + 2;
      ++v47;
      if (v327 <= v48) {
        goto LABEL_31;
      }
    }
    double v46 = (double)v47;
  }
LABEL_31:
  v58 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 388;
    __int16 v387 = 2048;
    *(void *)v388 = v327;
    *(_WORD *)&v388[8] = 2048;
    double v389 = v46;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:rssiBinCount:%llu rssiBin:%.2f", buf, 0x26u);
  }

  v59 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v60 = [v59 subMessageValue];
  v61 = [v60 fieldForKey:@"NWAPS_snrs"];
  v62 = [v61 repeatableValues];
  id v63 = [v62 count];

  double v64 = 0.0;
  unint64_t v328 = (unint64_t)v63;
  if ((unint64_t)v63 >= 2)
  {
    unsigned int v65 = 0;
    unint64_t v66 = 1;
    while (1)
    {
      v366 = [v318 fieldForKey:@"DPSCS_peerStats"];
      v359 = [v366 subMessageValue];
      v353 = [v359 fieldForKey:@"NWAPS_snrs"];
      v344 = [v353 repeatableValues];
      v67 = [v344 objectAtIndex:v66];
      v68 = [v67 fieldForKey:@"NWASB_residentTime"];
      id v335 = [v68 uint64Value];
      v69 = [v305 fieldForKey:@"DPSCS_peerStats"];
      v70 = [v69 subMessageValue];
      v71 = [v70 fieldForKey:@"NWAPS_snrs"];
      v72 = [v71 repeatableValues];
      v73 = [v72 objectAtIndex:v66];
      v74 = [v73 fieldForKey:@"NWASB_residentTime"];
      id v75 = [v74 uint64Value];

      if (v335 != v75) {
        break;
      }
      unint64_t v66 = v65 + 2;
      ++v65;
      if (v328 <= v66) {
        goto LABEL_39;
      }
    }
    double v64 = (double)v65;
  }
LABEL_39:
  v76 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 402;
    __int16 v387 = 2048;
    *(void *)v388 = v328;
    *(_WORD *)&v388[8] = 2048;
    double v389 = v64;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:snrBinCount:%llu snrBin:%.2f", buf, 0x26u);
  }

  long long v375 = 0u;
  long long v376 = 0u;
  long long v373 = 0u;
  long long v374 = 0u;
  v77 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v78 = [v77 subMessageValue];
  v79 = [v78 fieldForKey:@"NWAPS_acCompletions"];
  v80 = [v79 repeatableValues];

  id obj = v80;
  id v316 = [v80 countByEnumeratingWithState:&v373 objects:v382 count:16];
  if (v316)
  {
    uint64_t v310 = 0;
    uint64_t v311 = 0;
    unsigned int v81 = 0;
    uint64_t v308 = 0;
    uint64_t v309 = 0;
    unsigned int v82 = 0;
    uint64_t v306 = 0;
    uint64_t v307 = 0;
    unsigned int v83 = 0;
    unsigned int v84 = 0;
    uint64_t v314 = *(void *)v374;
    do
    {
      for (j = 0; j != v316; j = (char *)j + 1)
      {
        unsigned int v367 = v81;
        if (*(void *)v374 != v314) {
          objc_enumerationMutation(obj);
        }
        v86 = *(void **)(*((void *)&v373 + 1) + 8 * (void)j);
        long long v369 = 0u;
        long long v370 = 0u;
        long long v371 = 0u;
        long long v372 = 0u;
        v87 = [v318 fieldForKey:@"DPSCS_peerStats"];
        v88 = [v87 subMessageValue];
        v89 = [v88 fieldForKey:@"NWAPS_acCompletions"];
        v90 = [v89 repeatableValues];

        id v91 = [v90 countByEnumeratingWithState:&v369 objects:v381 count:16];
        if (v91)
        {
          id v92 = v91;
          unsigned int v336 = v82;
          unsigned int v345 = v83;
          unsigned int v354 = v84;
          v360 = j;
          uint64_t v93 = *(void *)v370;
          while (2)
          {
            for (k = 0; k != v92; k = (char *)k + 1)
            {
              if (*(void *)v370 != v93) {
                objc_enumerationMutation(v90);
              }
              v95 = *(void **)(*((void *)&v369 + 1) + 8 * (void)k);
              v96 = [v86 fieldForKey:@"NWAPACTC_ac"];
              unsigned int v97 = [v96 int32Value];

              v98 = [v95 fieldForKey:@"NWAPACTC_ac"];
              unsigned int v99 = [v98 int32Value];

              if (v99 == v97)
              {
                v100 = [v95 fieldForKey:@"NWAPACTC_expiredComp"];
                unsigned int v329 = [v100 uint32Value];
                v101 = [v86 fieldForKey:@"NWAPACTC_expiredComp"];
                unsigned int v322 = [v101 uint32Value];

                v102 = [v95 fieldForKey:@"NWAPACTC_failedComp"];
                unsigned int v319 = [v102 uint32Value];
                v103 = [v86 fieldForKey:@"NWAPACTC_failedComp"];
                unsigned int v104 = [v103 uint32Value];

                v105 = [v95 fieldForKey:@"NWAPACTC_noAckComp"];
                LODWORD(v102) = [v105 uint32Value];
                v106 = [v86 fieldForKey:@"NWAPACTC_noAckComp"];
                LODWORD(v103) = [v106 uint32Value];

                v107 = [v95 fieldForKey:@"NWAPACTC_otherErrComp"];
                unsigned int v108 = [v107 uint32Value];
                v109 = [v86 fieldForKey:@"NWAPACTC_otherErrComp"];
                unsigned int v110 = [v109 uint32Value];

                unsigned int v111 = v97 - 2;
                unsigned int v84 = v329 - v322;
                int v112 = v102 - v103;
                unsigned int v113 = v108 - v110;
                unsigned int v81 = v319 - v104;
                unsigned int v82 = v112;
                unsigned int v83 = v108 - v110;
                j = v360;
                switch(v111)
                {
                  case 0u:
                    HIDWORD(v310) = v329 - v322;
                    unsigned int v81 = v367;
                    LODWORD(v309) = v319 - v104;
                    unsigned int v82 = v336;
                    HIDWORD(v307) = v112;
                    unsigned int v83 = v345;
                    LODWORD(v306) = v113;
                    goto LABEL_61;
                  case 1u:
                    goto LABEL_62;
                  case 2u:
                    HIDWORD(v311) = v329 - v322;
                    unsigned int v81 = v367;
                    LODWORD(v310) = v319 - v104;
                    unsigned int v82 = v336;
                    HIDWORD(v308) = v112;
                    unsigned int v83 = v345;
                    LODWORD(v307) = v113;
                    goto LABEL_61;
                  case 3u:
                    LODWORD(v311) = v329 - v322;
                    unsigned int v81 = v367;
                    HIDWORD(v309) = v319 - v104;
                    unsigned int v82 = v336;
                    LODWORD(v308) = v112;
                    unsigned int v83 = v345;
                    HIDWORD(v306) = v113;
LABEL_61:
                    unsigned int v84 = v354;
                    break;
                  default:
                    goto LABEL_58;
                }
                goto LABEL_62;
              }
            }
            id v92 = [v90 countByEnumeratingWithState:&v369 objects:v381 count:16];
            if (v92) {
              continue;
            }
            break;
          }
LABEL_58:
          unsigned int v81 = v367;
          unsigned int v82 = v336;
          unsigned int v83 = v345;
          unsigned int v84 = v354;
          j = v360;
        }
        else
        {
          unsigned int v81 = v367;
        }
LABEL_62:
      }
      id v316 = [obj countByEnumeratingWithState:&v373 objects:v382 count:16];
    }
    while (v316);
  }
  else
  {
    uint64_t v310 = 0;
    uint64_t v311 = 0;
    unsigned int v81 = 0;
    uint64_t v308 = 0;
    uint64_t v309 = 0;
    unsigned int v82 = 0;
    uint64_t v306 = 0;
    uint64_t v307 = 0;
    unsigned int v83 = 0;
    unsigned int v84 = 0;
  }

  v114 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 462;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v84;
    *(_WORD *)&v388[4] = 1024;
    *(_DWORD *)&v388[6] = HIDWORD(v310);
    LOWORD(v389) = 1024;
    *(_DWORD *)((char *)&v389 + 2) = v311;
    HIWORD(v389) = 1024;
    int v390 = HIDWORD(v311);
    _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txBEExpComp: %u txBKExpComp: %u txVIExpComp: %u txVOExpComp: %u", buf, 0x2Au);
  }

  v115 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 464;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v81;
    *(_WORD *)&v388[4] = 1024;
    *(_DWORD *)&v388[6] = v309;
    LOWORD(v389) = 1024;
    *(_DWORD *)((char *)&v389 + 2) = HIDWORD(v309);
    HIWORD(v389) = 1024;
    int v390 = v310;
    _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txBEFailComp: %u txBKFailComp: %u txVIFailComp: %u txVOFailComp: %u", buf, 0x2Au);
  }

  v116 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 466;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v82;
    *(_WORD *)&v388[4] = 1024;
    *(_DWORD *)&v388[6] = HIDWORD(v307);
    LOWORD(v389) = 1024;
    *(_DWORD *)((char *)&v389 + 2) = v308;
    HIWORD(v389) = 1024;
    int v390 = HIDWORD(v308);
    _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txBENoAckComp: %u txBKNoAckComp: %u txVINoAckComp: %u txVONoAckComp: %u", buf, 0x2Au);
  }
  unsigned int obja = v84;
  unsigned int v317 = v82;
  unsigned int v320 = v81;

  v117 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 468;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v83;
    *(_WORD *)&v388[4] = 1024;
    *(_DWORD *)&v388[6] = v306;
    LOWORD(v389) = 1024;
    *(_DWORD *)((char *)&v389 + 2) = HIDWORD(v306);
    HIWORD(v389) = 1024;
    int v390 = v307;
    _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txBEOErrComp: %u txBKOErrComp: %u txVIOErrComp: %u txVOOErrComp: %u", buf, 0x2Au);
  }
  unsigned int v315 = v83;

  v361 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v118 = [v361 subMessageValue];
  v119 = [v118 fieldForKey:@"NWAPS_completions"];
  v120 = [v119 subMessageValue];
  v121 = [v120 fieldForKey:@"NWATC_chipmodeerror"];
  unsigned int v122 = [v121 uint32Value];
  v123 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v124 = [v123 subMessageValue];
  v125 = [v124 fieldForKey:@"NWAPS_completions"];
  v126 = [v125 subMessageValue];
  v127 = [v126 fieldForKey:@"NWATC_chipmodeerror"];
  unsigned int v368 = v122 - [v127 uint32Value];

  v346 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v337 = [v346 subMessageValue];
  v128 = [v337 fieldForKey:@"NWAPS_completions"];
  v129 = [v128 subMessageValue];
  v130 = [v129 fieldForKey:@"NWATC_expired"];
  unsigned int v362 = [v130 uint32Value];
  v131 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v132 = [v131 subMessageValue];
  v133 = [v132 fieldForKey:@"NWAPS_completions"];
  v134 = [v133 subMessageValue];
  v135 = [v134 fieldForKey:@"NWATC_expired"];
  unsigned int v355 = [v135 uint32Value];

  v330 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v136 = [v330 subMessageValue];
  v137 = [v136 fieldForKey:@"NWAPS_completions"];
  v138 = [v137 subMessageValue];
  v139 = [v138 fieldForKey:@"NWATC_internalerror"];
  unsigned int v347 = [v139 uint32Value];
  v140 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v141 = [v140 subMessageValue];
  v142 = [v141 fieldForKey:@"NWAPS_completions"];
  v143 = [v142 subMessageValue];
  v144 = [v143 fieldForKey:@"NWATC_internalerror"];
  unsigned int v338 = [v144 uint32Value];

  v300 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v145 = [v300 subMessageValue];
  v146 = [v145 fieldForKey:@"NWAPS_completions"];
  v147 = [v146 subMessageValue];
  v148 = [v147 fieldForKey:@"NWATC_ioerror"];
  unsigned int v331 = [v148 uint32Value];
  v149 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v150 = [v149 subMessageValue];
  v151 = [v150 fieldForKey:@"NWAPS_completions"];
  v152 = [v151 subMessageValue];
  v153 = [v152 fieldForKey:@"NWATC_ioerror"];
  unsigned int v323 = [v153 uint32Value];

  v295 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v154 = [v295 subMessageValue];
  v155 = [v154 fieldForKey:@"NWAPS_completions"];
  v156 = [v155 subMessageValue];
  v157 = [v156 fieldForKey:@"NWATC_noack"];
  unsigned int v301 = [v157 uint32Value];
  v158 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v159 = [v158 subMessageValue];
  v160 = [v159 fieldForKey:@"NWAPS_completions"];
  v161 = [v160 subMessageValue];
  v162 = [v161 fieldForKey:@"NWATC_noack"];
  unsigned int v298 = [v162 uint32Value];

  v290 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v163 = [v290 subMessageValue];
  v164 = [v163 fieldForKey:@"NWAPS_completions"];
  v165 = [v164 subMessageValue];
  v166 = [v165 fieldForKey:@"NWATC_nobuf"];
  unsigned int v296 = [v166 uint32Value];
  v167 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v168 = [v167 subMessageValue];
  v169 = [v168 fieldForKey:@"NWAPS_completions"];
  v170 = [v169 subMessageValue];
  v171 = [v170 fieldForKey:@"NWATC_nobuf"];
  unsigned int v293 = [v171 uint32Value];

  v285 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v282 = [v285 subMessageValue];
  v172 = [v282 fieldForKey:@"NWAPS_completions"];
  v173 = [v172 subMessageValue];
  v174 = [v173 fieldForKey:@"NWATC_noremotepeer"];
  unsigned int v291 = [v174 uint32Value];
  v175 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v176 = [v175 subMessageValue];
  v177 = [v176 fieldForKey:@"NWAPS_completions"];
  v178 = [v177 subMessageValue];
  v179 = [v178 fieldForKey:@"NWATC_noremotepeer"];
  unsigned int v288 = [v179 uint32Value];

  v180 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v181 = [v180 subMessageValue];
  v182 = [v181 fieldForKey:@"NWAPS_completions"];
  v183 = [v182 subMessageValue];
  v184 = [v183 fieldForKey:@"NWATC_noresources"];
  unsigned int v286 = [v184 uint32Value];
  v185 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v186 = [v185 subMessageValue];
  v187 = [v186 fieldForKey:@"NWAPS_completions"];
  v188 = [v187 subMessageValue];
  v189 = [v188 fieldForKey:@"NWATC_noresources"];
  unsigned int v283 = [v189 uint32Value];

  v190 = [v318 fieldForKey:@"DPSCS_peerStats"];
  v191 = [v190 subMessageValue];
  v192 = [v191 fieldForKey:@"NWAPS_completions"];
  v193 = [v192 subMessageValue];
  v194 = [v193 fieldForKey:@"NWATC_txfailure"];
  unsigned int v279 = [v194 uint32Value];
  v195 = [v305 fieldForKey:@"DPSCS_peerStats"];
  v196 = [v195 subMessageValue];
  v197 = [v196 fieldForKey:@"NWAPS_completions"];
  v198 = [v197 subMessageValue];
  v199 = [v198 fieldForKey:@"NWATC_txfailure"];
  unsigned int v277 = [v199 uint32Value];

  v200 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 490;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v368;
    _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:chipModeError: %u", buf, 0x18u);
  }
  unsigned int v201 = v362 - v355;

  v202 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 491;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v362 - v355;
    _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:expired: %u", buf, 0x18u);
  }

  v203 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 492;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v347 - v338;
    _os_log_impl((void *)&_mh_execute_header, v203, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:internalError: %u", buf, 0x18u);
  }

  v204 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 493;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v331 - v323;
    _os_log_impl((void *)&_mh_execute_header, v204, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:ioError: %u", buf, 0x18u);
  }

  v205 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 494;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v301 - v298;
    _os_log_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noAck: %u", buf, 0x18u);
  }

  v206 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 495;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v296 - v293;
    _os_log_impl((void *)&_mh_execute_header, v206, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noBuf: %u", buf, 0x18u);
  }

  v207 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 496;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v291 - v288;
    _os_log_impl((void *)&_mh_execute_header, v207, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noRemotePeer: %u", buf, 0x18u);
  }
  unsigned int v363 = v286 - v283;

  v208 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 497;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v286 - v283;
    _os_log_impl((void *)&_mh_execute_header, v208, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noResources: %u", buf, 0x18u);
  }
  unsigned int v289 = v291 - v288;
  unsigned int v292 = v296 - v293;
  unsigned int v294 = v301 - v298;
  unsigned int v297 = v331 - v323;
  unsigned int v299 = v347 - v338;
  unsigned int v302 = v201;

  v209 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 498;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v279 - v277;
    _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txFailure: %u", buf, 0x18u);
  }
  unsigned int v287 = v279 - v277;

  v348 = [v318 fieldForKey:@"DPSCS_controllerStats"];
  v210 = [v348 subMessageValue];
  v211 = [v210 fieldForKey:@"NWACS_scanActivity"];
  v212 = [v211 subMessageValue];
  v213 = [v212 fieldForKey:@"NWASA_roamDur"];
  unsigned int v214 = [v213 uint32Value];
  v215 = [v305 fieldForKey:@"DPSCS_controllerStats"];
  v216 = [v215 subMessageValue];
  v217 = [v216 fieldForKey:@"NWACS_scanActivity"];
  v218 = [v217 subMessageValue];
  v219 = [v218 fieldForKey:@"NWASA_roamDur"];
  unsigned int v356 = v214 - [v219 uint32Value];

  v220 = [v318 fieldForKey:@"DPSCS_controllerStats"];
  v221 = [v220 subMessageValue];
  v222 = [v221 fieldForKey:@"NWACS_scanActivity"];
  v223 = [v222 subMessageValue];
  v224 = [v223 fieldForKey:@"NWASA_roamCount"];
  unsigned int v349 = [v224 uint32Value];
  v225 = [v305 fieldForKey:@"DPSCS_controllerStats"];
  v226 = [v225 subMessageValue];
  v227 = [v226 fieldForKey:@"NWACS_scanActivity"];
  v228 = [v227 subMessageValue];
  v229 = [v228 fieldForKey:@"NWASA_roamCount"];
  unsigned int v339 = [v229 uint32Value];

  v230 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 506;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v356;
    _os_log_impl((void *)&_mh_execute_header, v230, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:roamDuration: %u", buf, 0x18u);
  }

  v231 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 507;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v349 - v339;
    _os_log_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:roamCount: %u", buf, 0x18u);
  }
  unsigned int v284 = v349 - v339;

  v340 = [v318 fieldForKey:@"DPSCS_controllerStats"];
  v232 = [v340 subMessageValue];
  v233 = [v232 fieldForKey:@"NWACS_btCoex"];
  v234 = [v233 subMessageValue];
  v235 = [v234 fieldForKey:@"NWABC_btabort"];
  unsigned int v236 = [v235 uint32Value];
  v237 = [v305 fieldForKey:@"DPSCS_controllerStats"];
  v238 = [v237 subMessageValue];
  v239 = [v238 fieldForKey:@"NWACS_btCoex"];
  v240 = [v239 subMessageValue];
  v241 = [v240 fieldForKey:@"NWABC_btabort"];
  unsigned int v350 = v236 - [v241 uint32Value];

  v324 = [v318 fieldForKey:@"DPSCS_controllerStats"];
  v280 = [v324 subMessageValue];
  v242 = [v280 fieldForKey:@"NWACS_btCoex"];
  v243 = [v242 subMessageValue];
  v244 = [v243 fieldForKey:@"NWABC_grant"];
  unsigned int v341 = [v244 uint32Value];
  v245 = [v305 fieldForKey:@"DPSCS_controllerStats"];
  v246 = [v245 subMessageValue];
  v247 = [v246 fieldForKey:@"NWACS_btCoex"];
  v248 = [v247 subMessageValue];
  v249 = [v248 fieldForKey:@"NWABC_grant"];
  unsigned int v332 = [v249 uint32Value];

  v250 = [v318 fieldForKey:@"DPSCS_controllerStats"];
  v251 = [v250 subMessageValue];
  v252 = [v251 fieldForKey:@"NWACS_btCoex"];
  v253 = [v252 subMessageValue];
  v254 = [v253 fieldForKey:@"NWABC_request"];
  unsigned int v325 = [v254 uint32Value];
  v255 = [v305 fieldForKey:@"DPSCS_controllerStats"];
  v256 = [v255 subMessageValue];
  v257 = [v256 fieldForKey:@"NWACS_btCoex"];
  v258 = [v257 subMessageValue];
  v259 = [v258 fieldForKey:@"NWABC_request"];
  unsigned int v281 = [v259 uint32Value];

  v260 = [v318 fieldForKey:@"DPSCS_controllerStats"];
  v261 = [v260 subMessageValue];
  v262 = [v261 fieldForKey:@"NWACS_btCoex"];
  v263 = [v262 subMessageValue];
  v264 = [v263 fieldForKey:@"NWABC_ucodehighlatency"];
  unsigned int v278 = [v264 uint32Value];
  v265 = [v305 fieldForKey:@"DPSCS_controllerStats"];
  v266 = [v265 subMessageValue];
  v267 = [v266 fieldForKey:@"NWACS_btCoex"];
  v268 = [v267 subMessageValue];
  v269 = [v268 fieldForKey:@"NWABC_ucodehighlatency"];
  unsigned int v276 = [v269 uint32Value];

  v270 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v270, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 517;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v350;
    _os_log_impl((void *)&_mh_execute_header, v270, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:bt_abort: %u", buf, 0x18u);
  }

  v271 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v271, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 518;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v341 - v332;
    _os_log_impl((void *)&_mh_execute_header, v271, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:bt_grant: %u", buf, 0x18u);
  }

  v272 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v272, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 519;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v325 - v281;
    _os_log_impl((void *)&_mh_execute_header, v272, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:bt_request: %u", buf, 0x18u);
  }

  v273 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v384 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v385 = 1024;
    int v386 = 520;
    __int16 v387 = 1024;
    *(_DWORD *)v388 = v278 - v276;
    _os_log_impl((void *)&_mh_execute_header, v273, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:bt_uch_latency: %u", buf, 0x18u);
  }

  v274 = objc_retainAutoreleaseReturnValue(-[WiFiStallDetectInput initWithAC_problem_bitfield:TxBE_expiredCompletions:TxBE_failedCompletions:TxBE_noAckCompletions:TxBE_otherErrCompletions:TxBK_expiredCompletions:TxBK_failedCompletions:TxBK_noAckCompletions:TxBK_otherErrCompletions:TxVI_expiredCompletions:TxVI_failedCompletions:TxVI_noAckCompletions:TxVI_otherErrCompletions:TxVO_expiredCompletions:TxVO_failedCompletions:TxVO_noAckCompletions:TxVO_otherErrCompletions:bt_abort:bt_grant:bt_request:bt_uch_latency:cca_bin:completions_chipmodeerror:completions_expired:completions_internalerror:completions_ioerror:completions_noack:completions_nobuf:completions_noremotepeer:completions_noresources:completions_txfailure:roam_count:roam_duration:rssi_bin:snr_bin:]([WiFiStallDetectInput alloc], "initWithAC_problem_bitfield:TxBE_expiredCompletions:TxBE_failedCompletions:TxBE_noAckCompletions:TxBE_otherErrCompletions:TxBK_expiredCompletions:TxBK_failedCompletions:TxBK_noAckCompletions:TxBK_otherErrCompletions:TxVI_expiredCompletions:TxVI_failedCompletions:TxVI_noAckCompletions:TxVI_otherErrCompletions:TxVO_expiredCompletions:TxVO_failedCompletions:TxVO_noAckCompletions:TxVO_otherErrCompletions:bt_abort:bt_grant:bt_request:bt_uch_latency:cca_bin:completions_chipmodeerror:completions_expired:completions_internalerror:completions_ioerror:completions_noack:completions_nobuf:completions_noremotepeer:completions_noresources:completions_txfailure:roam_count:roam_duration:rssi_bin:snr_bin:", (double)v303, (double)obja, (double)v320, (double)v317, (double)v315, (double)HIDWORD(v310), (double)v309, (double)HIDWORD(v307), (double)v306, (double)v311,
             (double)HIDWORD(v309),
             (double)v308,
             (double)HIDWORD(v306),
             (double)HIDWORD(v311),
             (double)v310,
             (double)HIDWORD(v308),
             (double)v307,
             (double)v350,
             (double)(v341 - v332),
             (double)(v325 - v281),
             (double)(v278 - v276),
             *(void *)&v27,
             (double)v368,
             (double)v302,
             (double)v299,
             (double)v297,
             (double)v294,
             (double)v292,
             (double)v289,
             (double)v363,
             (double)v287,
             (double)v284,
             (double)v356,
             *(void *)&v46,
             *(void *)&v64));

  return v274;
}

- (BOOL)checkDpsStatus:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v9 = a5;
  if ([(RecommendationPreferences *)self->_preferences disable_fast_dps_wd])
  {
    id v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      __int16 v42 = 1024;
      int v43 = 567;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Quick DPS Reset Recovery is disabled", buf, 0x12u);
    }

    uint64_t v11 = [v9 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
    int v12 = v11;
    uint64_t v13 = 3;
    goto LABEL_27;
  }
  if ([(RecommendationPreferences *)self->_preferences disable_fast_dps_validation_for_test])
  {
    int v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      __int16 v42 = 1024;
      int v43 = 574;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Bypassing Quick DPS validation for Quick Reset Recovery", buf, 0x12u);
    }
    BOOL v14 = 1;
    goto LABEL_28;
  }
  unsigned int v15 = [v8 fieldForKey:@"DPSCS_peerStats"];
  int v16 = [v15 subMessageValue];
  int v17 = [v16 fieldForKey:@"NWAPS_acCompletions"];
  int v18 = [v17 repeatableValues];
  unint64_t v19 = (unint64_t)[v18 count];

  id v20 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v41 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
    __int16 v42 = 1024;
    int v43 = 580;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:DPS Fast Reset Recovery Enabled, Validation Starts...", buf, 0x12u);
  }

  if (v19 < 5)
  {
    if (!v19)
    {
      v35 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "acCompletions not populated, so this DPS trigger cannot be validated", buf, 2u);
      }

      if ([(DPSQuickRecoveryRecommendationEngine *)self computeBin:@"NWAPS_ccas" previousSample:v8 currentSample:v39] != 0xFFFF)goto LABEL_26; {
      goto LABEL_23;
      }
    }
  }
  else
  {
    __int16 v21 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v41 = (const char *)v19;
      _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Out of range acCount found in NWAPS_acCompletions: %llu", buf, 0xCu);
    }

    unint64_t v19 = 4;
  }
  v36 = self;
  id v37 = v8;
  v38 = v9;
  uint64_t v22 = 0;
  while (1)
  {
    __int16 v23 = [v39 fieldForKey:@"DPSCS_peerStats"];
    v24 = [v23 subMessageValue];
    __int16 v25 = [v24 fieldForKey:@"NWAPS_acCompletions"];
    v26 = [v25 repeatableValues];
    double v27 = [v26 objectAtIndex:v22];
    unint64_t v28 = [v27 fieldForKey:@"NWAPACTC_durSinceLastSuccessfulComp"];
    unsigned int v29 = [v28 uint32Value];

    v30 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v41 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      __int16 v42 = 1024;
      int v43 = 592;
      __int16 v44 = 1024;
      int v45 = v22;
      __int16 v46 = 1024;
      unsigned int v47 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC:%u NWAPACTC_durSinceLastSuccessfulComp[@6s] %u", buf, 0x1Eu);
    }

    unsigned int v31 = v29 >> 2;
    BOOL v14 = v29 >> 2 > 0x658;
    if (v31 <= 0x658) {
      break;
    }
    if (v19 == ++v22) {
      goto LABEL_22;
    }
  }
  v32 = [v38 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
  [v32 setInt32Value:9];

LABEL_22:
  id v8 = v37;
  id v9 = v38;
  if ([(DPSQuickRecoveryRecommendationEngine *)v36 computeBin:@"NWAPS_ccas" previousSample:v37 currentSample:v39] == 0xFFFF)
  {
LABEL_23:
    v33 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Instances populated with the same values, CCA not found (QuickDPS)", buf, 2u);
    }

LABEL_26:
    uint64_t v11 = [v9 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
    int v12 = v11;
    uint64_t v13 = 10;
LABEL_27:
    [v11 setInt32Value:v13];
    BOOL v14 = 0;
LABEL_28:
  }
  return v14;
}

- (unsigned)computeBin:(id)a3 previousSample:(id)a4 currentSample:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v30 = a5;
  unsigned int v31 = v8;
  id v9 = [v8 fieldForKey:@"DPSCS_peerStats"];
  id v10 = [v9 subMessageValue];
  v32 = v7;
  uint64_t v11 = [v10 fieldForKey:v7];
  int v12 = [v11 repeatableValues];
  id v13 = [v12 count];

  unint64_t v29 = (unint64_t)v13;
  if (v13)
  {
    unint64_t v14 = 0;
    unsigned int v15 = 0;
    while (1)
    {
      unsigned int v33 = v15;
      id v37 = [v30 fieldForKey:@"DPSCS_peerStats"];
      v36 = [v37 subMessageValue];
      v35 = [v36 fieldForKey:v32];
      int v16 = [v35 repeatableValues];
      int v17 = [v16 objectAtIndex:v14];
      int v18 = [v17 fieldForKey:@"NWASB_residentTime"];
      id v34 = [v18 uint64Value];
      unint64_t v19 = [v31 fieldForKey:@"DPSCS_peerStats"];
      id v20 = [v19 subMessageValue];
      __int16 v21 = [v20 fieldForKey:v32];
      uint64_t v22 = [v21 repeatableValues];
      __int16 v23 = [v22 objectAtIndex:v14];
      v24 = [v23 fieldForKey:@"NWASB_residentTime"];
      id v25 = [v24 uint64Value];

      if (v34 != v25) {
        break;
      }
      unint64_t v14 = v33 + 1;
      unsigned int v15 = v33 + 1;
      if (v29 <= v14) {
        goto LABEL_5;
      }
    }
    unsigned int v26 = v33;
  }
  else
  {
LABEL_5:
    unsigned int v26 = 0xFFFF;
  }
  double v27 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    id v39 = "-[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:]";
    __int16 v40 = 1024;
    int v41 = 629;
    __int16 v42 = 2112;
    int v43 = v32;
    __int16 v44 = 2048;
    unint64_t v45 = v29;
    __int16 v46 = 1024;
    unsigned int v47 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:key:%@ binCount:%llu bin:%u", buf, 0x2Cu);
  }

  return v26;
}

- (BOOL)isTriggerDisconnect:(id)a3 currentSample:(id)a4
{
  id v6 = a3;
  id v120 = a4;
  v117 = self;
  LODWORD(v112) = [(DPSQuickRecoveryRecommendationEngine *)self computeBin:@"NWAPS_rssis" previousSample:v6 currentSample:v120];
  v118 = [v120 fieldForKey:@"DPSCS_peerStats"];
  id v7 = [v118 subMessageValue];
  id v8 = [v7 fieldForKey:@"NWAPS_completions"];
  id v9 = [v8 subMessageValue];
  id v10 = [v9 fieldForKey:@"NWATC_noack"];
  LODWORD(v116) = [v10 uint32Value];
  uint64_t v11 = [v6 fieldForKey:@"DPSCS_peerStats"];
  int v12 = [v11 subMessageValue];
  id v13 = [v12 fieldForKey:@"NWAPS_completions"];
  unint64_t v14 = [v13 subMessageValue];
  unsigned int v15 = [v14 fieldForKey:@"NWATC_noack"];
  LODWORD(v115) = [v15 uint32Value];

  int v16 = [v120 fieldForKey:@"DPSCS_peerStats"];
  int v17 = [v16 subMessageValue];
  int v18 = [v17 fieldForKey:@"NWAPS_completions"];
  unint64_t v19 = [v18 subMessageValue];
  id v20 = [v19 fieldForKey:@"NWATC_expired"];
  LODWORD(v114) = [v20 uint32Value];
  v119 = v6;
  __int16 v21 = [v6 fieldForKey:@"DPSCS_peerStats"];
  uint64_t v22 = [v21 subMessageValue];
  __int16 v23 = [v22 fieldForKey:@"NWAPS_completions"];
  v24 = [v23 subMessageValue];
  id v25 = [v24 fieldForKey:@"NWATC_expired"];
  LODWORD(v113) = [v25 uint32Value];

  unsigned int v26 = [v120 fieldForKey:@"DPSCS_peerStats"];
  double v27 = [v26 subMessageValue];
  unint64_t v28 = [(__CFString *)v27 fieldForKey:@"NWAPS_rssiValue"];
  int v29 = [v28 int32Value];

  id v30 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    unsigned int v122 = "-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:]";
    __int16 v123 = 1024;
    int v124 = 641;
    __int16 v125 = 1024;
    *(_DWORD *)v126 = v116 - v115;
    *(_WORD *)&v126[4] = 1024;
    *(_DWORD *)&v126[6] = v114 - v113;
    __int16 v127 = 1024;
    int v128 = v29;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noACK errors: %d txExpired errors: %d RSSI:%d", buf, 0x24u);
  }

  if (v29 >= -84)
  {
    if ([(RecommendationPreferences *)v117->_preferences reset_rssi_bin_threshold] < v112
      || v116 == v115 && v114 == v113)
    {
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      BOOL v38 = 0;
    }
    else
    {
      uint64_t v22 = v120;
      v116 = [v120 fieldForKey:@"DPSCS_peerStats"];
      v115 = [v116 subMessageValue];
      v114 = [v115 fieldForKey:@"NWAPS_completions"];
      [v114 subMessageValue];
      v113 = double v27 = @"NWATC_chipmodeerror";
      int v112 = [v113 fieldForKey:@"NWATC_chipmodeerror"];
      unsigned int v43 = [v112 uint32Value];
      unsigned int v111 = [v119 fieldForKey:@"DPSCS_peerStats"];
      unsigned int v110 = [v111 subMessageValue];
      v109 = [v110 fieldForKey:@"NWAPS_completions"];
      unsigned int v108 = [v109 subMessageValue];
      v107 = [v108 fieldForKey:@"NWATC_chipmodeerror"];
      if (v43 == [v107 uint32Value])
      {
        v106 = [v120 fieldForKey:@"DPSCS_peerStats"];
        v105 = [v106 subMessageValue];
        unsigned int v104 = [v105 fieldForKey:@"NWAPS_completions"];
        [v104 subMessageValue];
        v103 = double v27 = @"NWATC_internalerror";
        v102 = [v103 fieldForKey:@"NWATC_internalerror"];
        unsigned int v44 = [v102 uint32Value];
        v101 = [v119 fieldForKey:@"DPSCS_peerStats"];
        v100 = [v101 subMessageValue];
        unsigned int v99 = [v100 fieldForKey:@"NWAPS_completions"];
        v98 = [v99 subMessageValue];
        unsigned int v97 = [v98 fieldForKey:@"NWATC_internalerror"];
        if (v44 == [v97 uint32Value])
        {
          v96 = [v120 fieldForKey:@"DPSCS_peerStats"];
          v95 = [v96 subMessageValue];
          v94 = [v95 fieldForKey:@"NWAPS_completions"];
          [v94 subMessageValue];
          v93 = double v27 = @"NWATC_ioerror";
          id v92 = [v93 fieldForKey:@"NWATC_ioerror"];
          unsigned int v45 = [v92 uint32Value];
          id v91 = [v119 fieldForKey:@"DPSCS_peerStats"];
          v90 = [v91 subMessageValue];
          v89 = [v90 fieldForKey:@"NWAPS_completions"];
          v88 = [v89 subMessageValue];
          v87 = [v88 fieldForKey:@"NWATC_ioerror"];
          if (v45 == [v87 uint32Value])
          {
            v86 = [v120 fieldForKey:@"DPSCS_peerStats"];
            v85 = [v86 subMessageValue];
            unsigned int v84 = [v85 fieldForKey:@"NWAPS_completions"];
            [v84 subMessageValue];
            v83 = double v27 = @"NWATC_nobuf";
            unsigned int v82 = [v83 fieldForKey:@"NWATC_nobuf"];
            unsigned int v46 = [v82 uint32Value];
            unsigned int v81 = [v119 fieldForKey:@"DPSCS_peerStats"];
            v80 = [v81 subMessageValue];
            v79 = [v80 fieldForKey:@"NWAPS_completions"];
            v78 = [v79 subMessageValue];
            v77 = [v78 fieldForKey:@"NWATC_nobuf"];
            if (v46 == [v77 uint32Value])
            {
              v76 = [v120 fieldForKey:@"DPSCS_peerStats"];
              id v75 = [v76 subMessageValue];
              v74 = [v75 fieldForKey:@"NWAPS_completions"];
              [v74 subMessageValue];
              v73 = double v27 = @"NWATC_noremotepeer";
              v72 = [v73 fieldForKey:@"NWATC_noremotepeer"];
              unsigned int v47 = [v72 uint32Value];
              v71 = [v119 fieldForKey:@"DPSCS_peerStats"];
              v70 = [v71 subMessageValue];
              v69 = [v70 fieldForKey:@"NWAPS_completions"];
              v68 = [v69 subMessageValue];
              v67 = [v68 fieldForKey:@"NWATC_noremotepeer"];
              if (v47 == [v67 uint32Value])
              {
                unint64_t v66 = [v120 fieldForKey:@"DPSCS_peerStats"];
                unsigned int v65 = [v66 subMessageValue];
                double v64 = [v65 fieldForKey:@"NWAPS_completions"];
                [v64 subMessageValue];
                v63 = double v27 = @"NWATC_noresources";
                v62 = [v63 fieldForKey:@"NWATC_noresources"];
                unsigned int v48 = [v62 uint32Value];
                v61 = [v119 fieldForKey:@"DPSCS_peerStats"];
                v60 = [v61 subMessageValue];
                v59 = [v60 fieldForKey:@"NWAPS_completions"];
                v58 = [v59 subMessageValue];
                id v57 = [v58 fieldForKey:@"NWATC_noresources"];
                if (v48 == [v57 uint32Value])
                {
                  v56 = [v120 fieldForKey:@"DPSCS_peerStats"];
                  v55 = [v56 subMessageValue];
                  v54 = [v55 fieldForKey:@"NWAPS_completions"];
                  v53 = [v54 subMessageValue];
                  v52 = [v53 fieldForKey:@"NWATC_txfailure"];
                  unsigned int v49 = [v52 uint32Value];
                  v51 = [v119 fieldForKey:@"DPSCS_peerStats"];
                  v50 = [v51 subMessageValue];
                  double v27 = [v50 fieldForKey:@"NWAPS_completions"];
                  uint64_t v22 = [(__CFString *)v27 subMessageValue];
                  v24 = [v22 fieldForKey:@"NWATC_txfailure"];
                  BOOL v38 = v49 == [v24 uint32Value];
                  int v31 = 1;
                  int v32 = 1;
                  int v33 = 1;
                  int v34 = 1;
                  int v35 = 1;
                  int v36 = 1;
                  int v37 = 1;
                }
                else
                {
                  int v37 = 0;
                  BOOL v38 = 0;
                  int v31 = 1;
                  int v32 = 1;
                  int v33 = 1;
                  int v34 = 1;
                  int v35 = 1;
                  int v36 = 1;
                }
              }
              else
              {
                int v36 = 0;
                int v37 = 0;
                BOOL v38 = 0;
                int v31 = 1;
                int v32 = 1;
                int v33 = 1;
                int v34 = 1;
                int v35 = 1;
              }
            }
            else
            {
              int v35 = 0;
              int v36 = 0;
              int v37 = 0;
              BOOL v38 = 0;
              int v31 = 1;
              int v32 = 1;
              int v33 = 1;
              int v34 = 1;
            }
          }
          else
          {
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            BOOL v38 = 0;
            int v31 = 1;
            int v32 = 1;
            int v33 = 1;
          }
        }
        else
        {
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          BOOL v38 = 0;
          int v31 = 1;
          int v32 = 1;
        }
      }
      else
      {
        int v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        BOOL v38 = 0;
        int v31 = 1;
      }
    }
  }
  else
  {
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    BOOL v38 = 1;
  }
  if (v37)
  {

    if (!v36)
    {
LABEL_11:
      if (!v35) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if (!v36)
  {
    goto LABEL_11;
  }

  if (v35)
  {
LABEL_12:
  }
LABEL_13:
  if (v34)
  {

    if (!v33)
    {
LABEL_15:
      if (!v32) {
        goto LABEL_16;
      }
      goto LABEL_30;
    }
  }
  else if (!v33)
  {
    goto LABEL_15;
  }

  if (!v32)
  {
LABEL_16:
    if (!v31) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_30:

  if (v31)
  {
LABEL_17:
  }
LABEL_18:
  if (v38)
  {
    id v39 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v40 = [(RecommendationPreferences *)v117->_preferences reset_rssi_bin_threshold];
      *(_DWORD *)buf = 136446722;
      unsigned int v122 = "-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:]";
      __int16 v123 = 1024;
      int v124 = 662;
      __int16 v125 = 2048;
      *(void *)v126 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:rssi-bin threshold: %ld", buf, 0x1Cu);
    }

    int v41 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unsigned int v122 = "-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:]";
      __int16 v123 = 1024;
      int v124 = 663;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Trigger Disconnect suspected!", buf, 0x12u);
    }
  }
  return v38;
}

- (BOOL)isHighAWDLActivity:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 fieldForKey:@"DPSS_awdlSnapshot"];
  id v6 = [v5 subMessageValue];
  id v7 = [v6 fieldForKey:@"DPSAWDLS_sdb"];
  unsigned int v8 = [v7 uint32Value];

  id v9 = [v4 fieldForKey:@"DPSS_awdlSnapshot"];
  id v10 = [v9 subMessageValue];
  uint64_t v11 = [v10 fieldForKey:@"DPSAWDLS_use"];
  unsigned int v12 = [v11 uint32Value];

  id v13 = [v4 fieldForKey:@"DPSS_awdlSnapshot"];

  unint64_t v14 = [v13 subMessageValue];
  unsigned int v15 = [v14 fieldForKey:@"DPSAWDLS_ts"];
  unint64_t v16 = (unint64_t)[v15 uint64Value];

  int v17 = +[NSDate date];
  [v17 timeIntervalSince1970];
  double v19 = v18;

  id v20 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v21 = [(RecommendationPreferences *)self->_preferences reset_awdl_activity_threshold];
    int v25 = 136447490;
    unsigned int v26 = "-[DPSQuickRecoveryRecommendationEngine isHighAWDLActivity:]";
    __int16 v27 = 1024;
    int v28 = 680;
    __int16 v29 = 2048;
    unint64_t v30 = v21;
    __int16 v31 = 1024;
    unsigned int v32 = v12;
    __int16 v33 = 1024;
    unsigned int v34 = v8;
    __int16 v35 = 2048;
    unint64_t v36 = (unint64_t)v19 - v16 / 0x3E8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:awdl activity threshold: %ld, awdl usage: %u, sdb: %u, updated before:%llu seconds", (uint8_t *)&v25, 0x32u);
  }

  if (v8) {
    return 0;
  }
  unint64_t v23 = [(RecommendationPreferences *)self->_preferences reset_awdl_activity_threshold];
  BOOL result = 0;
  if (v23 < v12 && (unint64_t)v19 - v16 / 0x3E8 <= 0xF)
  {
    v24 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136446466;
      unsigned int v26 = "-[DPSQuickRecoveryRecommendationEngine isHighAWDLActivity:]";
      __int16 v27 = 1024;
      int v28 = 683;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:High AWDL Activity suspected!", (uint8_t *)&v25, 0x12u);
    }

    return 1;
  }
  return result;
}

- (BOOL)checkParameterThresholds:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5 chipNumber:(id)a6 dpsSnapshot:(id)a7 originalCCA:(unsigned int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  unsigned int v19 = [(DPSQuickRecoveryRecommendationEngine *)self computeBin:@"NWAPS_ccas" previousSample:v14 currentSample:v15];
  unsigned int v20 = [&off_1000E43A8 containsObject:v17];
  preferences = self->_preferences;
  if (v20) {
    unint64_t v22 = [(RecommendationPreferences *)preferences reset_legacy_chipset_cca_bin_threshold];
  }
  else {
    unint64_t v22 = [(RecommendationPreferences *)preferences reset_cca_bin_threshold];
  }
  unint64_t v23 = v22;
  double v24 = (double)(v22 + 1) * 12.5;
  int v25 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136447490;
    unsigned int v34 = "-[DPSQuickRecoveryRecommendationEngine checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
    __int16 v35 = 1024;
    int v36 = 699;
    __int16 v37 = 1024;
    unsigned int v38 = a8;
    __int16 v39 = 1024;
    int v40 = v23;
    __int16 v41 = 2048;
    *(double *)__int16 v42 = v24;
    *(_WORD *)&v42[8] = 2112;
    *(void *)&v42[10] = v17;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:notificationCCA: %d ccaThreshold:%d ccaFloatThreshold:%f set for chipset : %@", (uint8_t *)&v33, 0x32u);
  }

  unsigned int v26 = [v16 fieldForKey:@"WFAAWDWAQDS_ccaThreshold"];
  [v26 setUint32Value:v23];

  if (v19 >= v23 || v24 <= (double)a8)
  {
    unint64_t v30 = [v16 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
    [v30 setInt32Value:6];

    int v28 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136447490;
      unsigned int v34 = "-[DPSQuickRecoveryRecommendationEngine checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      __int16 v35 = 1024;
      int v36 = 707;
      __int16 v37 = 1024;
      unsigned int v38 = v19;
      __int16 v39 = 1024;
      int v40 = v23;
      __int16 v41 = 1024;
      *(_DWORD *)__int16 v42 = a8;
      *(_WORD *)&v42[4] = 2048;
      *(double *)&v42[6] = v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCA Threshold Suppression.. cca-bin: %d threshold: %d notificationCCA: %d CCALimit: %f", (uint8_t *)&v33, 0x2Eu);
    }
  }
  else
  {
    if ([(DPSQuickRecoveryRecommendationEngine *)self isTriggerDisconnect:v14 currentSample:v15])
    {
      __int16 v27 = [v16 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
      int v28 = v27;
      uint64_t v29 = 7;
    }
    else
    {
      if (![(DPSQuickRecoveryRecommendationEngine *)self isHighAWDLActivity:v18])
      {
        BOOL v31 = 1;
        goto LABEL_16;
      }
      __int16 v27 = [v16 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
      int v28 = v27;
      uint64_t v29 = 8;
    }
    [v27 setInt32Value:v29];
  }

  BOOL v31 = 0;
LABEL_16:

  return v31;
}

- (unint64_t)recommendReset:(id)a3 currentSample:(id)a4 acList:(id)a5 qDpsStat:(id)a6 chipNumber:(id)a7 dpsSnapshot:(id)a8 originalCCA:(unsigned int)a9
{
  id v15 = a3;
  id v16 = a4;
  id v75 = a5;
  id v17 = a6;
  id v76 = a7;
  id v77 = a8;
  v74 = +[NSDate date];
  unint64_t v18 = [(RecommendationPreferences *)self->_preferences disable_fast_dps_validation_for_test];
  unsigned int v19 = [v17 fieldForKey:@"WFAAWDWAQDS_isDpsValidationDisabled"];
  [v19 setBoolValue:v18];

  [(DPSQuickRecoveryRecommendationEngine *)self updateTimeSincePreviousTriggerForStudy:v17 msgKey:@"WFAAWDWAQDS_quickDpsTimeSincePreviousTriggerMinutes" dictKey:@"dps_lastQuickDpsTrigger"];
  [(DPSQuickRecoveryRecommendationEngine *)self updateScreenState];
  unsigned int v20 = [v17 fieldForKey:@"WFAAWDWAQDS_screenStateOn"];
  [v20 setBoolValue:self->screenON];

  if ([(DPSQuickRecoveryRecommendationEngine *)self checkDpsStatus:v15 currentSample:v16 qDpsStat:v17])
  {
    if (self->model) {
      goto LABEL_3;
    }
    __int16 v39 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      __int16 v81 = 1024;
      int v82 = 739;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Model not yet loaded, loading...", buf, 0x12u);
    }

    int v40 = +[WAUtil resourcePath];
    __int16 v41 = +[NSString stringWithFormat:@"%@%@.%@", v40, @"WiFiStallDetect", @"mlmodelc"];

    __int16 v42 = +[NSURL fileURLWithPath:v41];
    modelUrl = self->modelUrl;
    self->modelUrl = v42;

    unsigned int v44 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v45 = self->modelUrl;
      *(_DWORD *)buf = 136446722;
      v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      __int16 v81 = 1024;
      int v82 = 744;
      __int16 v83 = 2112;
      double v84 = *(double *)&v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:modelUrl is %@", buf, 0x1Cu);
    }

    unsigned int v46 = [WiFiStallDetect alloc];
    unsigned int v47 = self->modelUrl;
    id v78 = 0;
    unsigned int v48 = [(WiFiStallDetect *)v46 initWithContentsOfURL:v47 error:&v78];
    id v49 = v78;
    model = self->model;
    self->model = v48;

    if (self->model)
    {
LABEL_3:
      if (!self->screenON) {
        goto LABEL_28;
      }
      unint64_t v21 = [(DPSQuickRecoveryRecommendationEngine *)self computeFeatures:v15 currentSample:v16 acList:v75];
      unint64_t v22 = [(WiFiStallDetect *)self->model predictionFromFeatures:v21 error:0];
      unint64_t v23 = WALogCategoryDefaultHandle();
      double v24 = v23;
      if (v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v22 stall];
          unsigned int v26 = "WILL";
          v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapsh"
                "ot:originalCCA:]";
          *(_DWORD *)buf = 136446722;
          if (!v25) {
            unsigned int v26 = "WILL NOT";
          }
          __int16 v81 = 1024;
          int v82 = 762;
          __int16 v83 = 2080;
          double v84 = *(double *)&v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS ML Prediction: The Stall '%s' last for more than 10 seconds", buf, 0x1Cu);
        }

        id v27 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:[v22 stall]];
        int v28 = [v22 stallProbability];
        uint64_t v29 = [v28 objectForKey:v27];
        [v29 doubleValue];
        double v31 = v30;

        unsigned int v32 = [v17 fieldForKey:@"WFAAWDWAQDS_stallPrediction"];
        [v32 setBoolValue:(uint64_t)[v22 stall] > 0];

        int v33 = [v17 fieldForKey:@"WFAAWDWAQDS_stallProbability"];
        double v34 = v31 * 100.0;
        [v33 setUint32Value:v34];

        unint64_t v35 = [(RecommendationPreferences *)self->_preferences prediction_probability_threshold];
        int v36 = [v17 fieldForKey:@"WFAAWDWAQDS_probabilityThreshold"];
        [v36 setUint32Value:v35];

        if (v18)
        {
          __int16 v37 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnap"
                  "shot:originalCCA:]";
            __int16 v81 = 1024;
            int v82 = 779;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:simluated DPS: Overriding decision...do reset", buf, 0x12u);
          }

LABEL_27:
LABEL_28:
          if (![(DPSQuickRecoveryRecommendationEngine *)self checkParameterThresholds:v15 currentSample:v16 qDpsStat:v17 chipNumber:v76 dpsSnapshot:v77 originalCCA:a9]|| ![(DPSQuickRecoveryRecommendationEngine *)self checkForPriorityNetwork])
          {
            uint64_t v56 = 0;
            unint64_t v18 = 0;
LABEL_38:
            id v57 = [v17 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
            v58 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v57 int32Value]);

            [(NSMutableDictionary *)self->_dpsStats setObject:v58 forKey:@"dps_lastQuickRecoverySuppressionReason"];
            if ((v56 & 1) == 0) {
              [(NSMutableDictionary *)self->_dpsStats setObject:v74 forKey:@"dps_lastQuickRecoverySuppressedWD"];
            }
            v59 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              v60 = "NO";
              v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSn"
                    "apshot:originalCCA:]";
              *(_DWORD *)buf = 136446722;
              if (v56) {
                v60 = "YES";
              }
              __int16 v81 = 1024;
              int v82 = 820;
              __int16 v83 = 2080;
              double v84 = *(double *)&v60;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Recommendation for fast reset: %s", buf, 0x1Cu);
            }

            if ((v56 & 1) == 0)
            {
              v61 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                id v62 = [v58 intValue];
                if (v62 >= 0xB)
                {
                  id v63 = +[NSString stringWithFormat:@"(unknown: %i)", v62];
                }
                else
                {
                  id v63 = off_1000D1048[(int)v62];
                }
                *(_DWORD *)buf = 136446722;
                v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dps"
                      "Snapshot:originalCCA:]";
                __int16 v81 = 1024;
                int v82 = 822;
                __int16 v83 = 2112;
                double v84 = *(double *)&v63;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:quickDPS: Suppressed Reason: %@", buf, 0x1Cu);
              }
            }
            double v64 = [v17 fieldForKey:@"WFAAWDWAQDS_quickDpsResetRecommendation"];
            [v64 setBoolValue:v56];

            unsigned int v65 = [v17 fieldForKey:@"WFAAWDWAQDS_rssiThreshold"];
            preferences = self->_preferences;
            p_preferences = &self->_preferences;
            [v65 setUint32Value:-[RecommendationPreferences reset_rssi_bin_threshold](preferences, "reset_rssi_bin_threshold")];

            v68 = [v17 fieldForKey:@"WFAAWDWAQDS_screenOnThreshold"];
            [v68 setUint32Value:-[RecommendationPreferences minutes_between_fast_dps_wd_screen_on](*p_preferences, "minutes_between_fast_dps_wd_screen_on")];

            v69 = [v17 fieldForKey:@"WFAAWDWAQDS_screenOffThreshold"];
            [v69 setUint32Value:-[RecommendationPreferences minutes_between_fast_dps_wd_screen_off](*p_preferences, "minutes_between_fast_dps_wd_screen_off")];

            v70 = [v17 fieldForKey:@"WFAAWDWAQDS_awdlActivityThreshold"];
            [v70 setUint32Value:-[RecommendationPreferences reset_awdl_activity_threshold](*p_preferences, "reset_awdl_activity_threshold")];

            goto LABEL_52;
          }
          unsigned int v54 = [(DPSQuickRecoveryRecommendationEngine *)self isResetAllowedForQuickDPS];
          v55 = [v17 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
          unint64_t v21 = v55;
          if (v54)
          {
            [v55 setInt32Value:0];
            unint64_t v18 = 1;
            uint64_t v56 = 1;
          }
          else
          {
            [v55 setInt32Value:5];
            uint64_t v56 = 0;
            unint64_t v18 = 2;
          }
LABEL_37:

          goto LABEL_38;
        }
        if ((uint64_t)[v22 stall] < 1)
        {
          v53 = [v17 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
          [v53 setInt32Value:1];
        }
        else
        {
          double v51 = (double)v35;
          v52 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnap"
                  "shot:originalCCA:]";
            __int16 v81 = 1024;
            int v82 = 782;
            __int16 v83 = 2048;
            double v84 = v34;
            __int16 v85 = 2048;
            double v86 = v51;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS ML Prediction probability: %lf threshold: %lf", buf, 0x26u);
          }

          if (v34 >= v51) {
            goto LABEL_27;
          }
          v53 = [v17 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
          [v53 setInt32Value:2];
        }
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapsh"
                "ot:originalCCA:]";
          __int16 v81 = 1024;
          int v82 = 761;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:ML model output is nil", buf, 0x12u);
        }
      }
      uint64_t v56 = 0;
      unint64_t v18 = 0;
      goto LABEL_37;
    }
    v72 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      __int16 v81 = 1024;
      int v82 = 754;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error WiFiStallDetect init", buf, 0x12u);
    }

    v73 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_FAULT, "Error WiFiStallDetect init", buf, 2u);
    }
  }
  else
  {
    unsigned int v38 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v80 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      __int16 v81 = 1024;
      int v82 = 734;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS Fast Reset Recovery Validations Failed!", buf, 0x12u);
    }

    unint64_t v18 = 0;
  }
LABEL_52:

  return v18;
}

- (BOOL)isPeerDiagnosticsTriggerAllowed:(unint64_t)a3
{
  CFStringRef v5 = +[NSDate date];
  preferences = self->_preferences;
  if (a3)
  {
    unint64_t v7 = [(RecommendationPreferences *)preferences minutes_between_peer_diagnostics_trigger_for_other_issues];
    CFStringRef v8 = @"pd_lastDiagnosticsTriggerForOtherIssues";
  }
  else
  {
    unint64_t v7 = [(RecommendationPreferences *)preferences minutes_between_peer_diagnostics_trigger_for_dns_stall];
    CFStringRef v8 = @"pd_lastDiagnosticsTriggerForDNSStall";
  }
  id v9 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:v8];
  if (v9 && ([v5 timeIntervalSinceDate:v9], unint64_t v11 = (int)(v10 / 60.0), v7 > v11))
  {
    unsigned int v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136447234;
      id v16 = "-[DPSQuickRecoveryRecommendationEngine isPeerDiagnosticsTriggerAllowed:]";
      __int16 v17 = 1024;
      int v18 = 859;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      __int16 v21 = 2048;
      uint64_t v22 = (int)v11;
      __int16 v23 = 2112;
      double v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Trigger Not Allowed for type:%lu - Last trigger was %ld minutes ago at %@", (uint8_t *)&v15, 0x30u);
    }

    BOOL v13 = 0;
  }
  else
  {
    [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict setObject:v5 forKey:v8];
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)isScoreBelowThreshold:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 objectForKey:@"NetScore"];
  unsigned int v6 = [v5 unsignedIntValue];

  unint64_t v7 = [v4 objectForKey:@"DataStallScore"];

  unsigned int v8 = [v7 unsignedIntValue];
  BOOL v9 = [(RecommendationPreferences *)self->_preferences reset_score_threshold] >= v6
    || [(RecommendationPreferences *)self->_preferences reset_score_threshold] >= v8;
  double v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446978;
    BOOL v13 = "-[DPSQuickRecoveryRecommendationEngine isScoreBelowThreshold:]";
    __int16 v14 = 1024;
    int v15 = 882;
    __int16 v16 = 1024;
    unsigned int v17 = v6;
    __int16 v18 = 1024;
    unsigned int v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: netScore:%u dataStallScore:%u", (uint8_t *)&v12, 0x1Eu);
  }

  return v9;
}

- (BOOL)isGoodWiFiCondition:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 objectForKey:@"RSSI"];
  signed int v6 = [v5 intValue];

  unint64_t v7 = [v4 objectForKey:@"CCA"];

  unint64_t v8 = [v7 unsignedIntValue];
  BOOL v9 = [(RecommendationPreferences *)self->_preferences reset_pd_rssi_threshold] <= v6
    && [(RecommendationPreferences *)self->_preferences reset_pd_cca_threshold] >= v8;
  double v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446978;
    BOOL v13 = "-[DPSQuickRecoveryRecommendationEngine isGoodWiFiCondition:]";
    __int16 v14 = 1024;
    int v15 = 898;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 2048;
    unint64_t v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: RSSI:%ld CCA:%ld", (uint8_t *)&v12, 0x26u);
  }

  return v9;
}

- (void)updateTimeSincePreviousTriggerForStudy:(id)a3 msgKey:(id)a4 dictKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = +[NSDate date];
  int v12 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:v10];
  if (v12)
  {
    [v11 timeIntervalSinceDate:v12];
    uint64_t v14 = (int)(v13 / 60.0);
    int v15 = [v8 fieldForKey:v9];
    [v15 setUint64Value:v14];
  }
  else
  {
    uint64_t v14 = 0;
  }
  [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict setObject:v11 forKey:v10];
  __int16 v16 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136447746;
    __int16 v18 = "-[DPSQuickRecoveryRecommendationEngine updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:]";
    __int16 v19 = 1024;
    int v20 = 913;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    unsigned int v26 = v12;
    __int16 v27 = 2112;
    int v28 = v11;
    __int16 v29 = 2048;
    uint64_t v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:msgkey:%@ dictKey:%@ previous_TS:%@ current_TS:%@ difference:%llu", (uint8_t *)&v17, 0x44u);
  }
}

- (void)updateTimeSincePreviousTriggerForQuickDps:(id)a3
{
  id v9 = a3;
  id v4 = +[NSDate date];
  CFStringRef v5 = [(NSMutableDictionary *)self->_dpsQuickRecoveryWDBudgetDict valueForKey:@"dps_lastQuickDpsTrigger"];
  if (v5)
  {
    [v4 timeIntervalSinceDate:v5];
    uint64_t v7 = (int)(v6 / 60.0);
    id v8 = [v9 fieldForKey:@"WFAAWDWAQDS_quickDpsTimeSincePreviousTriggerMinutes"];
    [v8 setUint64Value:v7];
  }
}

- (BOOL)checkAWDLActivity:(id)a3 symptomsDnsStats:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 fieldForKey:@"DPSS_awdlSnapshot"];
  id v8 = [v7 subMessageValue];
  id v9 = [v8 fieldForKey:@"DPSAWDLS_sdb"];
  unsigned int v10 = [v9 uint32Value];

  unint64_t v11 = [v6 fieldForKey:@"DPSS_awdlSnapshot"];
  int v12 = [v11 subMessageValue];
  double v13 = [v12 fieldForKey:@"DPSAWDLS_use"];
  unsigned int v14 = [v13 uint32Value];

  int v15 = [v6 fieldForKey:@"DPSS_awdlSnapshot"];

  __int16 v16 = [v15 subMessageValue];
  int v17 = [v16 fieldForKey:@"DPSAWDLS_ts"];
  unint64_t v18 = (unint64_t)[v17 uint64Value];

  __int16 v19 = +[NSDate date];
  [v19 timeIntervalSince1970];
  double v21 = v20;

  id v22 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136447234;
    __int16 v29 = "-[DPSQuickRecoveryRecommendationEngine checkAWDLActivity:symptomsDnsStats:]";
    __int16 v30 = 1024;
    int v31 = 939;
    __int16 v32 = 1024;
    unsigned int v33 = v14;
    __int16 v34 = 1024;
    unsigned int v35 = v10;
    __int16 v36 = 2048;
    unint64_t v37 = (unint64_t)v21 - v18 / 0x3E8;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:awdl activity detected, awdl usage: %u, sdb: %u, updated before:%llu seconds", (uint8_t *)&v28, 0x28u);
  }

  if (v14) {
    BOOL v23 = (unint64_t)v21 - v18 / 0x3E8 >= 0x10;
  }
  else {
    BOOL v23 = 1;
  }
  BOOL v24 = !v23;
  if (v24)
  {
    __int16 v25 = [v5 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
    [v25 setInt32Value:4];

    unsigned int v26 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136446466;
      __int16 v29 = "-[DPSQuickRecoveryRecommendationEngine checkAWDLActivity:symptomsDnsStats:]";
      __int16 v30 = 1024;
      int v31 = 943;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AWDL Activity suspected!", (uint8_t *)&v28, 0x12u);
    }
  }
  return v24;
}

- (unint64_t)recommendSymptomsDpsRecovery:(id)a3 symptomsDnsStats:(id)a4 awdlState:(BOOL)a5 currentSymptomsCondition:(BOOL)a6 isLANPingSuccessful:(BOOL)a7 appUsage:(BOOL)a8 averageCCA:(unsigned int)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  int v17 = [v16 fieldForKey:@"WFAAWDWASDS_symptomsDnsRecommendation"];
  [v17 setInt32Value:0];

  [(DPSQuickRecoveryRecommendationEngine *)self updateTimeSincePreviousTriggerForStudy:v16 msgKey:@"WFAAWDWASDS_symptomsDnsTimeSincePreviousTriggerMinutes" dictKey:@"dps_lastSymptomsDpsTrigger"];
  unint64_t v18 = [v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
  [v18 setInt32Value:0];

  [(DPSQuickRecoveryRecommendationEngine *)self updateScreenState];
  __int16 v19 = [v16 fieldForKey:@"WFAAWDWASDS_symptomsDnsscreenStateOn"];
  [v19 setBoolValue:self->screenON];

  double v20 = &off_100096000;
  if (v9)
  {
    unsigned int v54 = [v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
    [v54 setInt32Value:5];

    __int16 v42 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_71;
    }
    *(_DWORD *)buf = 136446466;
    v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptoms"
          "Condition:isLANPingSuccessful:appUsage:averageCCA:]";
    __int16 v69 = 1024;
    int v70 = 961;
    v55 = "%{public}s::%d:critical App In Use";
LABEL_70:
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v55, buf, 0x12u);
    goto LABEL_71;
  }
  if (!a6)
  {
    uint64_t v56 = [v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
    [v56 setInt32Value:2];

    __int16 v42 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_71;
    }
    *(_DWORD *)buf = 136446466;
    v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptoms"
          "Condition:isLANPingSuccessful:appUsage:averageCCA:]";
    __int16 v69 = 1024;
    int v70 = 962;
    v55 = "%{public}s::%d:DNS symptoms Condition recovered";
    goto LABEL_70;
  }
  if ([(RecommendationPreferences *)self->_preferences dps_symptoms_average_cca_threshold] < a9)
  {
    id v57 = [v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
    [v57 setInt32Value:7];

    __int16 v42 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      __int16 v69 = 1024;
      int v70 = 963;
      v55 = "%{public}s::%d:DNS symptoms Average CCA greater than threshold";
      goto LABEL_70;
    }
LABEL_71:
    unint64_t v43 = 0;
    unsigned int v45 = "NoBudget";
    int v44 = 1;
LABEL_51:

    goto LABEL_52;
  }
  double v21 = WALogCategoryDefaultHandle();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v22)
    {
      *(_DWORD *)buf = 136446722;
      v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      __int16 v69 = 1024;
      int v70 = 968;
      __int16 v71 = 2112;
      id v72 = v15;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: all:%@", buf, 0x1Cu);
    }

    BOOL v23 = [v15 firstObject];
    BOOL v24 = [v23 info];
    __int16 v25 = [v24 objectForKeyedSubscript:@"PeerDiagnosticsResults"];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    double v21 = v25;
    id v26 = [v21 countByEnumeratingWithState:&v62 objects:v66 count:16];
    id v27 = v15;
    if (v26)
    {
      id v28 = v26;
      BOOL v58 = v12;
      BOOL v59 = v10;
      v60 = v27;
      uint64_t v29 = *(void *)v63;
      uint64_t v61 = 1;
      while (2)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v63 != v29) {
            objc_enumerationMutation(v21);
          }
          int v31 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          __int16 v32 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:current"
                  "SymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
            __int16 v69 = 1024;
            int v70 = 971;
            __int16 v71 = 2112;
            id v72 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: parsing results...peer:%@", buf, 0x1Cu);
          }

          if (v31)
          {
            unsigned int v33 = [v31 objectForKeyedSubscript:@"LQMSummary"];
            __int16 v34 = [v31 objectForKeyedSubscript:@"LocalDevice"];
            unsigned int v35 = [v34 isEqualToString:@"YES"];

            __int16 v36 = WALogCategoryDefaultHandle();
            BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
            if (v35)
            {
              if (v37)
              {
                *(_DWORD *)buf = 136446466;
                v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:cur"
                      "rentSymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
                __int16 v69 = 1024;
                int v70 = 976;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: self...", buf, 0x12u);
              }

              [(DPSQuickRecoveryRecommendationEngine *)self isScoreBelowThreshold:v33];
            }
            else
            {
              if (v37)
              {
                *(_DWORD *)buf = 136446466;
                v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:cur"
                      "rentSymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
                __int16 v69 = 1024;
                int v70 = 982;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: peer...", buf, 0x12u);
              }

              if ([(DPSQuickRecoveryRecommendationEngine *)self isGoodWiFiCondition:v33]
                && [(DPSQuickRecoveryRecommendationEngine *)self isScoreBelowThreshold:v33])
              {

                int v40 = [v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
                [v40 setInt32Value:3];

                unsigned int v38 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:c"
                        "urrentSymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
                  __int16 v69 = 1024;
                  int v70 = 994;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Peer Devices are also experiencing issues", buf, 0x12u);
                }
                uint64_t v61 = 0;
                id v15 = v60;
                goto LABEL_33;
              }
            }
          }
          else
          {
            unsigned int v33 = 0;
          }
        }
        id v28 = [v21 countByEnumeratingWithState:&v62 objects:v66 count:16];
        if (v28) {
          continue;
        }
        break;
      }
      unsigned int v38 = v21;
      id v15 = v60;
LABEL_33:
      double v20 = &off_100096000;
      BOOL v12 = v58;
      BOOL v10 = v59;
    }
    else
    {
      uint64_t v61 = 1;
      unsigned int v38 = v21;
    }

    uint64_t v39 = v61;
  }
  else
  {
    if (v22)
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      __int16 v69 = 1024;
      int v70 = 966;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Data not received from peerDiagnostics", buf, 0x12u);
    }
    uint64_t v39 = 1;
  }

  if (v39 && !v12 && [(DPSQuickRecoveryRecommendationEngine *)self checkForPriorityNetwork])
  {
    if ([(DPSQuickRecoveryRecommendationEngine *)self isResetAllowedForSymptomsDPS])
    {
      __int16 v41 = [v16 fieldForKey:@"WFAAWDWASDS_symptomsDnsRecommendation"];
      __int16 v42 = v41;
      if (v10)
      {
        unint64_t v43 = 2;
        [v41 setInt32Value:2];
        int v44 = 0;
        unsigned int v45 = "Reassoc";
      }
      else
      {
        unint64_t v43 = 1;
        [v41 setInt32Value:1];
        int v44 = 0;
        unsigned int v45 = "Reset";
      }
    }
    else
    {
      unsigned int v46 = [v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
      [v46 setInt32Value:1];

      __int16 v42 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymp"
              "tomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
        __int16 v69 = 1024;
        int v70 = 1012;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: No budget", buf, 0x12u);
      }
      int v44 = 0;
      unsigned int v45 = "NoBudget";
      unint64_t v43 = 3;
    }
    goto LABEL_51;
  }
  unint64_t v43 = 0;
  unsigned int v45 = "NoBudget";
  int v44 = 1;
  if (v39 && v12)
  {
    __int16 v42 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      __int16 v69 = 1024;
      int v70 = 1016;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: DNS symptoms recovery suppressed due to AWDL activity", buf, 0x12u);
    }
    unint64_t v43 = 0;
    goto LABEL_51;
  }
LABEL_52:
  unsigned int v47 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v48 = "None";
    *(_DWORD *)buf = *((void *)v20 + 309);
    v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptoms"
          "Condition:isLANPingSuccessful:appUsage:averageCCA:]";
    if (!v44) {
      unsigned int v48 = v45;
    }
    __int16 v69 = 1024;
    int v70 = 1023;
    __int16 v71 = 2080;
    id v72 = (id)v48;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Recommendation for DNS Symptoms Recovery: %s", buf, 0x1Cu);
  }

  if (v44)
  {
    id v49 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = [v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
      double v51 = (void *)v50;
      if (v50 >= 0xB)
      {
        v52 = +[NSString stringWithFormat:@"(unknown: %i)", v50];
      }
      else
      {
        v52 = off_1000D10A0[(int)v50];
      }
      *(_DWORD *)buf = *((void *)v20 + 309);
      v68 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      __int16 v69 = 1024;
      int v70 = 1025;
      __int16 v71 = 2112;
      id v72 = v52;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Suppressed Reason: %@", buf, 0x1Cu);
    }
  }

  return v43;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSMutableDictionary)dpsQuickRecoveryWDBudgetDict
{
  return self->_dpsQuickRecoveryWDBudgetDict;
}

- (void)setDpsQuickRecoveryWDBudgetDict:(id)a3
{
}

- (NSMutableDictionary)dpsStats
{
  return self->_dpsStats;
}

- (void)setDpsStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dpsStats, 0);
  objc_storeStrong((id *)&self->_dpsQuickRecoveryWDBudgetDict, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->modelUrl, 0);

  objc_storeStrong((id *)&self->model, 0);
}

@end