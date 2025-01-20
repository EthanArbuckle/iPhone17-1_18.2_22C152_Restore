@interface NRCoreAnalyticsReporter
+ (void)reportAbortPairingClient:(id)a3 reason:(id)a4;
+ (void)reportDeviceIsPairedTelemetry:(id)a3;
+ (void)reportDeviceSwitchTelemetryWithCollectionHistory:(id)a3;
+ (void)reportMigrationWithDeviceHistory:(id)a3 andError:(id)a4;
+ (void)reportPairingFailureWithReportString:(id)a3;
+ (void)reportPairingSuccess;
+ (void)reportUnpairReason:(unint64_t)a3;
+ (void)reportXPCReconnectSuccess;
+ (void)sendEvent:(id)a3;
+ (void)sendReport:(id)a3 withEvent:(id)a4;
@end

@implementation NRCoreAnalyticsReporter

+ (void)sendReport:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000F9750((uint64_t)v5, v9);
      }
    }
  }
  v10 = nr_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = nr_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[NRCoreAnalyticsReporter] Sending Event: %@ - %@", (uint8_t *)&v13, 0x16u);
    }
  }
  AnalyticsSendEvent();
}

+ (void)sendEvent:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = nr_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      id v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000F97C8(v6);
      }
    }
  }
  v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[NRCoreAnalyticsReporter] Sending Event: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  AnalyticsSendEvent();
}

+ (void)reportUnpairReason:(unint64_t)a3
{
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[NRCoreAnalyticsReporter reportUnpairReason:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[NRCoreAnalyticsReporter] %s: Reason: %lu", buf, 0x16u);
    }
  }
  v15[0] = @"eventType";
  BOOL v8 = [@"com.apple.bluetoothregistry." stringByAppendingString:@"unpair"];
  v15[1] = @"errorReason";
  v16[0] = v8;
  v9 = (void *)qword_1001A11D8;
  if (!qword_1001A11D8)
  {
    v17[0] = &off_100176AD8;
    v17[1] = &off_100176AF0;
    *(void *)buf = @"unpairReasonBluetooth";
    *(void *)&buf[8] = @"unpairReasonOther";
    v17[2] = &off_100176B08;
    *(void *)&buf[16] = @"unpairReasonRestoredFromBackup";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:buf forKeys:v17 count:3];
    id v11 = (void *)qword_1001A11D8;
    qword_1001A11D8 = v10;

    v9 = (void *)qword_1001A11D8;
  }
  v12 = +[NSNumber numberWithInteger:a3];
  int v13 = [v9 objectForKeyedSubscript:v12];

  if (!v13)
  {
    int v13 = +[NSString stringWithFormat:@"missingUnpairReason%ld", a3];
  }
  v16[1] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  [a1 sendEvent:v14];
}

+ (void)reportAbortPairingClient:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "+[NRCoreAnalyticsReporter reportAbortPairingClient:reason:]";
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[NRCoreAnalyticsReporter] %s: Client: %@; Reason: %@",
        buf,
        0x20u);
    }
  }
  id v11 = [v6 lastPathComponent];
  v12 = +[NSString stringWithFormat:@"%@", v7];
  int v13 = +[NSString stringWithFormat:@"pairingAborted.%@.%@", v11, v12];

  v16[0] = @"eventType";
  id v14 = [@"com.apple.bluetoothregistry." stringByAppendingString:@"pairFailure"];
  v16[1] = @"errorReason";
  v17[0] = v14;
  v17[1] = v13;
  __int16 v15 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  [a1 sendEvent:v15];
}

+ (void)reportXPCReconnectSuccess
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "+[NRCoreAnalyticsReporter reportXPCReconnectSuccess]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[NRCoreAnalyticsReporter] %s", buf, 0xCu);
    }
  }
  id v6 = [[@"com.apple.bluetoothregistry." stringByAppendingString:@"pairFailure"] stringByAppendingString:@"eventType"];
  v8[1] = @"errorReason";
  v9[0] = v6;
  v9[1] = @"xpcReconnectSuccess";
  id v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  [a1 sendEvent:v7];
}

+ (void)reportPairingSuccess
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "+[NRCoreAnalyticsReporter reportPairingSuccess]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[NRCoreAnalyticsReporter] %s", buf, 0xCu);
    }
  }
  id v6 = [@"com.apple.bluetoothregistry." stringByAppendingString:@"pairSuccess" eventType];
  BOOL v9 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  [a1 sendEvent:v7];
}

+ (void)reportPairingFailureWithReportString:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "+[NRCoreAnalyticsReporter reportPairingFailureWithReportString:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[NRCoreAnalyticsReporter] %s: %@", buf, 0x16u);
    }
  }
  uint64_t v8 = [@"com.apple.bluetoothregistry." stringByAppendingString:@"pairFailure" eventType];
  v12 = v8;
  BOOL v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v10 = [v9 mutableCopy];

  if (v4) {
    [v10 setObject:v4 forKeyedSubscript:@"errorReason"];
  }
  [a1 sendEvent:v10];
}

+ (void)reportDeviceSwitchTelemetryWithCollectionHistory:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _NRIsAutomated();
  [v4 deviceCollection];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v54 = long long v60 = 0u;
  BOOL v6 = [v54 allPairingIDs];
  id v55 = [v6 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v55)
  {
    unsigned int v42 = v5;
    id v43 = a1;
    v44 = v4;
    uint64_t v46 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    BOOL v9 = 0;
    id v10 = 0;
    uint64_t v52 = NRDevicePropertyIsAltAccount;
    uint64_t v53 = *(void *)v58;
    uint64_t v50 = NRDevicePropertySystemBuildVersion;
    uint64_t v51 = NRDevicePropertyIsActive;
    uint64_t v48 = NRDevicePropertyLastActiveDate;
    uint64_t v49 = NRDevicePropertyHWModelString;
    double v11 = 0.0;
    uint64_t v47 = NRDevicePropertyLastInactiveDate;
    id obj = v6;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v58 != v53) {
          objc_enumerationMutation(obj);
        }
        int v13 = [v54 objectForKeyedSubscript:*(void *)(*((void *)&v57 + 1) + 8 * i)];
        id v14 = [v13 objectForKeyedSubscript:v52];
        __int16 v15 = [v14 value];

        id v16 = [v13 objectForKeyedSubscript:v51];
        v17 = [v16 value];

        if (!v17 || [v17 BOOLValue])
        {
          v18 = [v13 objectForKeyedSubscript:v50];
          [v18 value];
          uint64_t v19 = v56 = v7;

          __int16 v20 = [v13 objectForKeyedSubscript:v49];
          uint64_t v21 = [v20 value];

          id v22 = v15;
          id v23 = [v13 objectForKeyedSubscript:v48];
          v24 = [v23 value];

          v25 = [v13 objectForKeyedSubscript:v47];
          v26 = [v25 value];

          [v24 timeIntervalSinceDate:v26];
          double v11 = v27;

          uint64_t v8 = v22;
          BOOL v9 = (void *)v21;
          id v10 = (void *)v19;
          uint64_t v7 = v56;
        }
        if (v15 && [v15 BOOLValue]) {
          ++v46;
        }
        else {
          ++v7;
        }
      }
      id v55 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v55);

    if (v10)
    {
      id v4 = v44;
      if (v9)
      {
        id v28 = [v54 count];
        id v29 = [v44 switchIndex];
        v61[0] = @"isAutomated";
        v30 = +[NSNumber numberWithBool:v42];
        v62[0] = v30;
        v62[1] = v10;
        v61[1] = @"toWatchBuild";
        v61[2] = @"toWatchHW";
        v31 = &off_100176AA8;
        if (v8) {
          v31 = (_UNKNOWN **)v8;
        }
        v62[2] = v9;
        v62[3] = v31;
        v61[3] = @"toWatchPairingType";
        v61[4] = @"totalPairedDeviceCount";
        v32 = +[NSNumber numberWithUnsignedInt:v28];
        v62[4] = v32;
        v61[5] = @"tinkerPairedDeviceCount";
        uint64_t v33 = +[NSNumber numberWithUnsignedInteger:v46];
        uint64_t v34 = v7;
        v35 = (void *)v33;
        v62[5] = v33;
        v61[6] = @"classicPairedDeviceCount";
        v36 = +[NSNumber numberWithUnsignedInteger:v34];
        v62[6] = v36;
        v61[7] = @"switchCounter";
        v37 = +[NSNumber numberWithUnsignedInt:v29];
        v62[7] = v37;
        v61[8] = @"preSwitchDwellTimeSeconds";
        v38 = +[NSNumber numberWithDouble:v11];
        v62[8] = v38;
        v39 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:9];

        id v4 = v44;
        [v43 sendReport:@"com.apple.nanoregistry.switch-report" withEvent:v39];
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      id v4 = v44;
    }
    a1 = v43;
  }
  else
  {

    id v10 = 0;
    BOOL v9 = 0;
    uint64_t v8 = 0;
  }
  v40 = nr_framework_log();
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

  if (v41)
  {
    v39 = nr_framework_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1000F980C((uint64_t)a1, v39);
    }
    goto LABEL_26;
  }
LABEL_27:
}

+ (void)reportDeviceIsPairedTelemetry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _NRIsAutomated();
  id v6 = [v4 paired];
  uint64_t v7 = [v4 activeDevice];

  uint64_t v8 = [v7 objectForKeyedSubscript:NRDevicePropertySystemBuildVersion];
  BOOL v9 = [v8 value];

  id v10 = [v7 objectForKeyedSubscript:NRDevicePropertyHWModelString];
  double v11 = [v10 value];

  if (![(__CFString *)v9 length])
  {

    BOOL v9 = @"none";
  }
  if (![(__CFString *)v11 length])
  {

    double v11 = @"none";
  }
  v15[0] = @"isAutomated";
  v12 = +[NSNumber numberWithBool:v5];
  v16[0] = v12;
  v15[1] = @"isPaired";
  int v13 = +[NSNumber numberWithBool:v6];
  v16[1] = v13;
  void v16[2] = v9;
  void v15[2] = @"watchBuild";
  v15[3] = @"watchHW";
  v16[3] = v11;
  id v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

  [a1 sendReport:@"com.apple.nanoregistry.isPaired" withEvent:v14];
}

+ (void)reportMigrationWithDeviceHistory:(id)a3 andError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 deviceCollection];
  uint64_t v8 = [v7 activeDevice];

  BOOL v9 = +[NRDataCollector sharedInstance];
  unsigned int v61 = _NRIsAutomated();
  id v10 = [v6 deviceCollection];
  id v62 = [v10 count];

  unsigned int v11 = [v6 switchIndex];
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  int v13 = NSCountedSet_ptr;
  if (v8)
  {
    id v14 = [v8 objectForKeyedSubscript:NRDevicePropertySystemBuildVersion];
    long long v59 = [v14 value];

    __int16 v15 = [v8 objectForKeyedSubscript:NRDevicePropertyHWModelString];
    id v16 = [v15 value];

    v17 = [v8 objectForKeyedSubscript:NRDevicePropertyBuildType];
    v18 = [v17 value];

    uint64_t v19 = [v8 objectForKeyedSubscript:NRDevicePropertyMaxPairingCompatibilityVersion];
    [v19 value];
    __int16 v20 = v58 = v11;
    uint64_t v21 = v9;
    id v22 = v12;
    id v23 = [v20 integerValue];

    v24 = [v8 objectForKeyedSubscript:NRDevicePropertyIsAltAccount];
    v25 = [v24 value];
    id v26 = [v25 integerValue];

    CFStringRef v27 = v59;
    if (!v59) {
      CFStringRef v27 = @"Nil";
    }
    v68[0] = @"watchBuild";
    v68[1] = @"watchHW";
    if (v16) {
      CFStringRef v28 = v16;
    }
    else {
      CFStringRef v28 = @"Nil";
    }
    v69[0] = v27;
    v69[1] = v28;
    if (v18) {
      CFStringRef v29 = v18;
    }
    else {
      CFStringRef v29 = @"Nil";
    }
    v69[2] = v29;
    v68[2] = @"watchBuildtype";
    v68[3] = @"watchMaxPairingVersion";
    id v30 = v23;
    id v12 = v22;
    BOOL v9 = v21;
    int v13 = NSCountedSet_ptr;
    v31 = +[NSNumber numberWithInteger:v30];
    v69[3] = v31;
    v68[4] = @"watchPairingType";
    v32 = +[NSNumber numberWithInteger:v26];
    v69[4] = v32;
    uint64_t v33 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:5];
    [v12 addEntriesFromDictionary:v33];

    unsigned int v11 = v58;
  }
  uint64_t v34 = [v5 domain];
  id v35 = [v5 code];

  if (v5)
  {
    v66[0] = @"hasError";
    uint64_t v36 = +[NSNumber numberWithBool:1];
    v37 = (void *)v36;
    CFStringRef v38 = @"Nil";
    if (v34) {
      CFStringRef v38 = (const __CFString *)v34;
    }
    v67[0] = v36;
    v67[1] = v38;
    v66[1] = @"errorDomain";
    v66[2] = @"errorCode";
    v39 = +[NSNumber numberWithInteger:v35];
    v67[2] = v39;
    v40 = [v13[5] dictionaryWithObjects:v67 forKeys:v66 count:3];
    [v12 addEntriesFromDictionary:v40];
  }
  BOOL v41 = v12;
  uint64_t v42 = v11;
  id v43 = [v9 getValueForKey:@"btPairingRetryCount"];
  uint64_t v44 = (int)[v43 intValue];

  v45 = [v9 getValueForKey:@"migrationAttemptCounter"];
  long long v60 = (void *)v34;
  uint64_t v46 = (int)[v45 intValue];

  uint64_t v47 = +[NRConnectivityPublisher sharedConnectivityPublisher];
  unsigned int v48 = [v47 dropoutCounter];
  uint64_t v49 = [v9 getValueForKey:@"migrationIDSDisconnectCount"];
  uint64_t v50 = v48 - [v49 intValue];

  [v9 setValue:&off_100176AC0 forKey:@"migrationIDSDisconnectCount"];
  v64[0] = @"isAutomated";
  uint64_t v51 = +[NSNumber numberWithBool:v61];
  v65[0] = v51;
  v64[1] = @"bluetoothRetryCount";
  uint64_t v52 = +[NSNumber numberWithInteger:v44];
  v65[1] = v52;
  v64[2] = @"attemptCount";
  uint64_t v53 = +[NSNumber numberWithInteger:v46];
  v65[2] = v53;
  v64[3] = @"lossOfIDSConnectivityCount";
  v54 = +[NSNumber numberWithInteger:v50];
  v65[3] = v54;
  v64[4] = @"switchCounter";
  id v55 = +[NSNumber numberWithInteger:v42];
  v65[4] = v55;
  v64[5] = @"totalPairedDeviceCount";
  uint64_t v56 = +[NSNumber numberWithInteger:v62];
  v65[5] = v56;
  long long v57 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:6];
  [v41 addEntriesFromDictionary:v57];

  [a1 sendReport:@"com.apple.nanoregistry.migration-report" withEvent:v41];
}

@end