@interface HTTailspin
+ (BOOL)hasAppExceededGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5;
+ (BOOL)hasExceededDailyFenceLogLimit;
+ (BOOL)hasExceededDailyLimit:(double)a3 isFirstPartyApp:(BOOL)a4;
+ (BOOL)saveActivationTailSpinWithType:(id)a3 reason:(id)a4 bundleID:(id)a5 pid:(int)a6 startTime:(unint64_t)a7 endTime:(unint64_t)a8 isThirdPartyDevSupportModeHang:(BOOL)a9;
+ (BOOL)saveSentryTailspin:(id)a3 infoDict:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 error:(id *)a7;
+ (BOOL)saveTailSpinForService:(id)a3 reason:(id)a4 processID:(int)a5 threadID:(unint64_t)a6 procName:(id)a7 procPath:(id)a8 startTime:(unint64_t)a9 endTime:(unint64_t)a10 blownFenceId:(unint64_t)a11 hangType:(int64_t)a12 userActionData:(id)a13 displayedInHUD:(BOOL)a14 isThirdPartyDevSupportModeHang:(BOOL)a15 failReason:(int64_t *)a16;
+ (BOOL)saveTailSpinWithFileName:(id)a3 infoDictArray:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 processString:(id)a7 pid:(int)a8 requestType:(int64_t)a9 failReason:(int64_t *)a10;
+ (BOOL)saveTailspinForAllHangs;
+ (BOOL)saveTailspinForForceQuitProcessID:(int)a3 procName:(id)a4 procPath:(id)a5 filePath:(id *)a6;
+ (BOOL)saveTailspinWithFileName:(id)a3 path:(id)a4 infoDictArray:(id)a5 startTime:(unint64_t)a6 endTime:(unint64_t)a7 processString:(id)a8 pid:(int)a9 requestType:(int64_t)a10 includeOSSignposts:(BOOL)a11 failReason:(int64_t *)a12;
+ (void)collectTailspinAndUpdateTelemtry;
+ (void)incrementAppGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5;
+ (void)incrementDailyFenceLogGenerationCount;
+ (void)incrementDailyLogGenerationCountForDuration:(double)a3 isFirstPartyApp:(BOOL)a4;
+ (void)initialize;
+ (void)notifyHTTailSpinResult:(BOOL)a3 failReason:(int64_t)a4 hangSubType:(int64_t)a5 htBugType:(int64_t)a6;
+ (void)refreshAppGeneratedLogsCount;
+ (void)refreshPerPeriodSentryLogCount;
+ (void)resetAppActivationTailspinCounts;
+ (void)resetDailyActivationTailspinCounts;
+ (void)resetDailyGeneratedLogsCounts;
+ (void)resetDailySentryTailspinCounts;
+ (void)resetLogCountsForDailyRollover;
+ (void)resetLogCountsForEPL;
+ (void)resetPerAppCounts;
+ (void)resetPerPeriodSentryTailspinCounts;
@end

@implementation HTTailspin

+ (void)initialize
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)qword_100064590;
  qword_100064590 = (uint64_t)v2;

  qword_100064598 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

+ (void)refreshAppGeneratedLogsCount
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x3032000000;
  v6 = sub_10002D1C0;
  v7 = sub_10002D1D0;
  id v8 = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002D1D8;
  v2[3] = &unk_100052B40;
  v2[4] = &v3;
  [(id)qword_100064590 enumerateKeysAndObjectsUsingBlock:v2];
  if (v4[5]) {
    [qword_100064590 removeObjectsForKeys:];
  }
  _Block_object_dispose(&v3, 8);
}

+ (void)refreshPerPeriodSentryLogCount
{
  if (dword_10006458C >= 1)
  {
    --dword_10006458C;
    id v2 = sub_100027DEC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3[0] = 67109376;
      v3[1] = dword_10006458C + 1;
      __int16 v4 = 1024;
      int v5 = dword_10006458C;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Per-period Sentry Generated Logs count decreased %u -> %u", (uint8_t *)v3, 0xEu);
    }
  }
}

+ (void)resetLogCountsForEPL
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Generated log counts will be reset for EPL", v3, 2u);
  }

  +[HTTailspin resetLogCountsForDailyRollover];
  +[HTTailspin resetDailySentryTailspinCounts];
  +[HTTailspin resetPerAppCounts];
  +[HTTailspin resetPerPeriodSentryTailspinCounts];
}

+ (void)resetLogCountsForDailyRollover
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Generated log counts will be reset ", v3, 2u);
  }

  +[HTTailspin resetDailyGeneratedLogsCounts];
  +[HTTailspin resetDailyActivationTailspinCounts];
  +[HTTailspin resetAppActivationTailspinCounts];
}

+ (void)resetDailyGeneratedLogsCounts
{
  j__ADClientSetValueForScalarKey();
  j__ADClientSetValueForScalarKey();
  j__ADClientSetValueForScalarKey();
  j__ADClientSetValueForScalarKey();
  j__ADClientSetValueForScalarKey();
  j__ADClientSetValueForScalarKey();
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v7 = 67109376;
    int v8 = dword_100064570;
    __int16 v9 = 1024;
    int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Hang Micro Hang Logs Daily Generated count reset from %i to %i", (uint8_t *)&v7, 0xEu);
  }

  uint64_t v3 = sub_100027DEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v7 = 67109376;
    int v8 = dword_100064574;
    __int16 v9 = 1024;
    int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Hang Short Logs Daily Generated count reset from %i to %i", (uint8_t *)&v7, 0xEu);
  }

  __int16 v4 = sub_100027DEC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 67109376;
    int v8 = dword_100064578;
    __int16 v9 = 1024;
    int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Hang Long Logs Daily Generated count reset from %i to %i", (uint8_t *)&v7, 0xEu);
  }

  int v5 = sub_100027DEC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 67109376;
    int v8 = dword_10006457C;
    __int16 v9 = 1024;
    int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Hang Third Party Logs Daily Generated count reset from %i to %i", (uint8_t *)&v7, 0xEu);
  }

  v6 = sub_100027DEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 67109376;
    int v8 = dword_100064580;
    __int16 v9 = 1024;
    int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fence Hang Logs Daily Generated count reset from %i to %i", (uint8_t *)&v7, 0xEu);
  }

  dword_100064570 = 0;
  dword_100064574 = 0;
  dword_100064578 = 0;
  dword_10006457C = 0;
  dword_100064580 = 0;
}

+ (void)resetAppActivationTailspinCounts
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "App activation tailspin count reset", v5, 2u);
  }

  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  __int16 v4 = (void *)qword_100064598;
  qword_100064598 = (uint64_t)v3;
}

+ (void)resetDailyActivationTailspinCounts
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109376;
    v3[1] = dword_100064584;
    __int16 v4 = 1024;
    int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Launch Logs Daily Generated count reset from %i to %i", (uint8_t *)v3, 0xEu);
  }

  dword_100064584 = 0;
}

+ (void)resetDailySentryTailspinCounts
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109376;
    v3[1] = dword_100064588;
    __int16 v4 = 1024;
    int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sentry Tailspin count reset from %i to %i", (uint8_t *)v3, 0xEu);
  }

  dword_100064588 = 0;
}

+ (void)resetPerPeriodSentryTailspinCounts
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109376;
    v3[1] = dword_10006458C;
    __int16 v4 = 1024;
    int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Per-period Sentry Tailspin count reset from %i to %i", (uint8_t *)v3, 0xEu);
  }

  dword_10006458C = 0;
}

+ (void)resetPerAppCounts
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Per-app activation and generated tailspin count reset", v3, 2u);
  }

  [(id)qword_100064590 removeAllObjects];
  [(id)qword_100064598 removeAllObjects];
}

+ (BOOL)hasAppExceededGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5
{
  id v7 = a4;
  int v8 = +[HTPrefs sharedPrefs];
  double v9 = (double)(unint64_t)[v8 runloopLongHangDurationThresholdMSec];

  if (v9 <= a3 && a5)
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [(id)qword_100064590 objectForKeyedSubscript:v7];
    v12 = v11;
    if (v11)
    {
      unsigned int v13 = [v11 unsignedIntValue];
      v14 = +[HTPrefs sharedPrefs];
      BOOL v10 = v13 >= [v14 runLoopHangPerPeriodLogLimit];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

+ (BOOL)hasExceededDailyLimit:(double)a3 isFirstPartyApp:(BOOL)a4
{
  if (a4)
  {
    int v5 = +[HTPrefs sharedPrefs];
    double v6 = (double)(unint64_t)[v5 runloopLongHangDurationThresholdMSec];

    if (v6 <= a3)
    {
      int v18 = dword_100064578;
      v19 = +[HTPrefs sharedPrefs];
      signed int v20 = [v19 runLoopLongHangDailyLogLimit];

      if (v18 >= v20)
      {
        v12 = sub_100027DEC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v13 = +[HTPrefs sharedPrefs];
          int v25 = 67109120;
          unsigned int v26 = [v13 runLoopLongHangDailyLogLimit];
          v14 = "Device has hit the Daily Generated Long Log limit of %u. Not saving a report!";
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else
    {
      id v7 = +[HTPrefs sharedPrefs];
      double v8 = (double)(unint64_t)[v7 runloopHangDurationThresholdMSec];

      if (v8 <= a3)
      {
        int v21 = dword_100064574;
        v22 = +[HTPrefs sharedPrefs];
        signed int v23 = [v22 runLoopHangDailyLogLimit];

        if (v21 >= v23)
        {
          v12 = sub_100027DEC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v13 = +[HTPrefs sharedPrefs];
            int v25 = 67109120;
            unsigned int v26 = [v13 runLoopHangDailyLogLimit];
            v14 = "Device has hit the Daily Generated Short Log limit of %u. Not saving a report!";
            goto LABEL_17;
          }
          goto LABEL_18;
        }
      }
      else
      {
        int v9 = dword_100064570;
        BOOL v10 = +[HTPrefs sharedPrefs];
        signed int v11 = [v10 runLoopMicroHangDailyLogLimit];

        if (v9 >= v11)
        {
          v12 = sub_100027DEC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v13 = +[HTPrefs sharedPrefs];
            int v25 = 67109120;
            unsigned int v26 = [v13 runLoopMicroHangDailyLogLimit];
            v14 = "Device has hit the Daily Generated Micro Log limit of %u. Not saving a report!";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v25, 8u);

            goto LABEL_18;
          }
          goto LABEL_18;
        }
      }
    }
    return 0;
  }
  int v15 = dword_10006457C;
  v16 = +[HTPrefs sharedPrefs];
  signed int v17 = [v16 runloopHangThirdPartyDailyLogLimit];

  if (v15 < v17) {
    return 0;
  }
  v12 = sub_100027DEC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = +[HTPrefs sharedPrefs];
    int v25 = 67109120;
    unsigned int v26 = [v13 runloopHangThirdPartyDailyLogLimit];
    v14 = "Device has hit the Daily Generated Third Party Log limit of %u. Not saving a report!";
    goto LABEL_17;
  }
LABEL_18:

  return 1;
}

+ (BOOL)hasExceededDailyFenceLogLimit
{
  int v2 = dword_100064580;
  id v3 = +[HTPrefs sharedPrefs];
  signed int v4 = [v3 fenceHangDailyLogLimit];

  if (v2 >= v4)
  {
    int v5 = sub_100027DEC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = +[HTPrefs sharedPrefs];
      v8[0] = 67109120;
      v8[1] = [v6 fenceHangDailyLogLimit];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device has hit the Daily Generated Fence Log limit of %u. Not saving a report!", (uint8_t *)v8, 8u);
    }
  }
  return v2 >= v4;
}

+ (void)incrementAppGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  double v8 = +[HTPrefs sharedPrefs];
  double v9 = (double)(unint64_t)[v8 runloopLongHangDurationThresholdMSec];

  if (v9 > a3 || !v5)
  {
    signed int v11 = [(id)qword_100064590 objectForKeyedSubscript:v7];
    unsigned int v13 = v11;
    if (v11) {
      unsigned int v12 = [v11 unsignedIntValue];
    }
    else {
      unsigned int v12 = 0;
    }
    int v15 = +[HTPrefs sharedPrefs];
    unsigned int v16 = [v15 runLoopHangPerPeriodLogLimit];

    if (v12 >= v16)
    {
      int v18 = sub_100027DEC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412802;
        id v20 = v7;
        __int16 v21 = 1024;
        unsigned int v22 = v12;
        __int16 v23 = 1024;
        unsigned int v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ Generated Log count: %u -> %u", (uint8_t *)&v19, 0x18u);
      }
    }
    else
    {
      signed int v17 = sub_100027DEC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412802;
        id v20 = v7;
        __int16 v21 = 1024;
        unsigned int v22 = v12;
        __int16 v23 = 1024;
        unsigned int v24 = v12 + 1;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ Generated Log count: %u -> %u", (uint8_t *)&v19, 0x18u);
      }

      int v18 = +[NSNumber numberWithUnsignedInt:v12 + 1];
      [(id)qword_100064590 setObject:v18 forKeyedSubscript:v7];
    }
  }
  else
  {
    unsigned int v13 = sub_100027DEC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ Generated Log count: Long Hang does not count towards per-app generated log count", (uint8_t *)&v19, 0xCu);
    }
  }
}

+ (void)incrementDailyLogGenerationCountForDuration:(double)a3 isFirstPartyApp:(BOOL)a4
{
  if (a4)
  {
    BOOL v5 = +[HTPrefs sharedPrefs];
    double v6 = (double)(unint64_t)[v5 runloopLongHangDurationThresholdMSec];

    if (v6 <= a3)
    {
      ++dword_100064578;
      double v9 = sub_100027DEC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 67109376;
        int v12 = dword_100064578 - 1;
        __int16 v13 = 1024;
        int v14 = dword_100064578;
        BOOL v10 = "Daily Generated Long Log count: %i -> %i";
        goto LABEL_12;
      }
    }
    else
    {
      id v7 = +[HTPrefs sharedPrefs];
      double v8 = (double)(unint64_t)[v7 runloopHangDurationThresholdMSec];

      if (v8 <= a3)
      {
        ++dword_100064574;
        double v9 = sub_100027DEC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v11 = 67109376;
          int v12 = dword_100064574 - 1;
          __int16 v13 = 1024;
          int v14 = dword_100064574;
          BOOL v10 = "Daily Generated Short Log count: %i -> %i";
          goto LABEL_12;
        }
      }
      else
      {
        ++dword_100064570;
        double v9 = sub_100027DEC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v11 = 67109376;
          int v12 = dword_100064570 - 1;
          __int16 v13 = 1024;
          int v14 = dword_100064570;
          BOOL v10 = "Daily Generated Micro Hang Log count: %i -> %i";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xEu);
        }
      }
    }
  }
  else
  {
    ++dword_10006457C;
    double v9 = sub_100027DEC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 67109376;
      int v12 = dword_10006457C - 1;
      __int16 v13 = 1024;
      int v14 = dword_10006457C;
      BOOL v10 = "Daily Generated Third Party Log count: %i -> %i";
      goto LABEL_12;
    }
  }
}

+ (void)incrementDailyFenceLogGenerationCount
{
  ++dword_100064580;
  int v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109376;
    v3[1] = dword_100064580 - 1;
    __int16 v4 = 1024;
    int v5 = dword_100064580;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Daily Generated Fence Hang Log count: %i -> %i", (uint8_t *)v3, 0xEu);
  }
}

+ (void)notifyHTTailSpinResult:(BOOL)a3 failReason:(int64_t)a4 hangSubType:(int64_t)a5 htBugType:(int64_t)a6
{
  BOOL v8 = a3;
  double v9 = +[HTPrefs sharedPrefs];
  BOOL v10 = [v9 enablementPrefix];

  if (!v10) {
    BOOL v10 = &stru_100053108;
  }
  int v11 = sub_100027DEC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = +[NSNumber numberWithBool:v8];
    int v14 = sub_10001C6D4(a4);
    int v15 = sub_10001C680(a5);
    *(_DWORD *)buf = 138413314;
    CFStringRef v17 = @"EnablementType";
    __int16 v18 = 2112;
    int v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v13;
    __int16 v22 = 2112;
    __int16 v23 = v14;
    __int16 v24 = 2112;
    int v25 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "com.apple.hangtracer.hang_capture_tailspinV3 %@: %@, capture_success: %@, failure_reason: %@, subtype: %@\n", buf, 0x34u);
  }
  int v12 = v10;
  AnalyticsSendEventLazy();
}

+ (BOOL)saveSentryTailspin:(id)a3 infoDict:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 error:(id *)a7
{
  id v9 = a4;
  BOOL v10 = off_100063828;
  id v11 = a3;
  v54 = v9;
  int v12 = [v9 objectForKeyedSubscript:v10];
  unsigned int v13 = [v12 isEqualToString:off_100063830];
  int v14 = (void *)qword_100064558;
  int v15 = +[NSDate date];
  unsigned int v16 = [v14 stringFromDate:v15];
  CFStringRef v17 = +[NSString stringWithFormat:@"%@-%@.%@", v11, v16, @"tailspin"];

  __int16 v18 = +[NSString stringWithFormat:@"%s", "/var/root/Library/Caches/hangtracerd/tmp"];
  int v19 = +[NSString stringWithFormat:@"%s/%@", "/var/root/Library/Caches/hangtracerd/spool", v17];
  id v20 = +[NSString stringWithFormat:@"%s/%@", "/var/root/Library/Caches/hangtracerd/tmp", v17];
  v51 = (char *)[v20 UTF8String];
  uint64_t v56 = 11;
  __int16 v21 = +[HTPrefs sharedPrefs];
  LOBYTE(v11) = [v21 htTailspinEnabled];

  if ((v11 & 1) == 0)
  {
    if (!a7) {
      goto LABEL_32;
    }
    CFStringRef v44 = @"Tailspin is not enabled";
    uint64_t v45 = 1;
LABEL_31:
    sub_10001B7CC(v45, (uint64_t)v44);
    LOBYTE(v38) = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  if (!sub_10002BCB8())
  {
    if (!a7) {
      goto LABEL_32;
    }
    CFStringRef v44 = @"Tailspin is not present";
    uint64_t v45 = 2;
    goto LABEL_31;
  }
  v50 = v18;
  int v22 = dword_100064588;
  __int16 v23 = +[HTPrefs sharedPrefs];
  signed int v24 = [v23 signpostMonitoringDailyLogLimit];

  if (v22 >= v24)
  {
    __int16 v18 = v50;
    if (a7)
    {
      CFStringRef v44 = @"Sentry has hit its daily tailspin limit";
LABEL_30:
      uint64_t v45 = 4;
      goto LABEL_31;
    }
LABEL_32:
    LOBYTE(v38) = 0;
    goto LABEL_33;
  }
  int v25 = dword_10006458C;
  unsigned int v26 = +[HTPrefs sharedPrefs];
  signed int v27 = [v26 signpostMonitoringPerPeriodLogLimit];

  if (v25 >= v27)
  {
    __int16 v18 = v50;
    if (a7)
    {
      CFStringRef v44 = @"Sentry has hit its per-period tailspin limit";
      goto LABEL_30;
    }
    goto LABEL_32;
  }
  v28 = sub_100027DEC();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = +[HTPrefs sharedPrefs];
    unsigned int v30 = [v29 shouldCollectOSSignposts];
    CFStringRef v31 = @"NO";
    if (v30) {
      CFStringRef v31 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v58 = v31;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Collecting OS Signposts: %@", buf, 0xCu);
  }
  if (v13)
  {
    v32 = [v54 objectForKeyedSubscript:off_100063808];
    unsigned int v13 = [v32 intValue];
  }
  id v33 = objc_alloc_init((Class)NSMutableArray);
  [v33 addObject:v54];
  unint64_t v34 = (unint64_t)sub_10002AA40(0x7D0uLL);
  if (v34 >= a5) {
    unint64_t v34 = 0;
  }
  unint64_t v35 = a5 - v34;
  v36 = v33;
  v37 = +[HTPrefs sharedPrefs];
  LOBYTE(v49) = [v37 shouldCollectOSSignposts];
  LODWORD(v48) = v13;
  BOOL v38 = +[HTTailspin saveTailspinWithFileName:v17 path:v50 infoDictArray:v36 startTime:v35 endTime:a6 processString:@"Sentry" pid:v48 requestType:3 includeOSSignposts:v49 failReason:&v56];

  if (v38)
  {
    ++dword_100064588;
    ++dword_10006458C;
    v39 = sub_100027DEC();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v58 = @"Sentry";
      __int16 v59 = 2112;
      uint64_t v60 = (uint64_t)v19;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%@: Moving tailspin to spool: %@\n", buf, 0x16u);
    }

    v40 = +[NSFileManager defaultManager];
    id v55 = 0;
    unsigned __int8 v41 = [v40 moveItemAtPath:v20 toPath:v19 error:&v55];
    id v42 = v55;

    if ((v41 & 1) == 0)
    {
      v43 = sub_100027DEC();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        CFStringRef v58 = @"Sentry";
        __int16 v59 = 2114;
        uint64_t v60 = (uint64_t)v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to move tailspin to final path: %{public}@", buf, 0x16u);
      }

      if (a7)
      {
        sub_10001B7CC(3, @"Failed to move tailspin to final path");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      unlink(v51);
    }
  }
  else
  {
    v47 = sub_100027DEC();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v58 = @"Sentry";
      __int16 v59 = 2048;
      uint64_t v60 = v56;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to save tailspin data to file, reason: %ld\n", buf, 0x16u);
    }

    unlink(v51);
    if (a7)
    {
      sub_10001B7CC(3, @"Failed to save tailspin data for Sentry");
      id v42 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v42 = 0;
    }
  }

  __int16 v18 = v50;
LABEL_33:

  return v38;
}

+ (BOOL)saveActivationTailSpinWithType:(id)a3 reason:(id)a4 bundleID:(id)a5 pid:(int)a6 startTime:(unint64_t)a7 endTime:(unint64_t)a8 isThirdPartyDevSupportModeHang:(BOOL)a9
{
  uint64_t v11 = *(void *)&a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  CFStringRef v17 = +[NSDate date];
  [v17 timeIntervalSinceReferenceDate];
  unint64_t v19 = (unint64_t)(v18 * 1000.0);

  uint64_t v20 = mach_absolute_time();
  unint64_t v21 = (unint64_t)sub_10002A984(v20);
  double v22 = sub_10002AA40(a7 - v19 + v21);
  double v23 = sub_10002AA40(a8 - v19 + v21);
  signed int v24 = +[HTPrefs sharedPrefs];
  LODWORD(a7) = [v24 htTailspinEnabled];

  if (!a7)
  {
    int v25 = sub_100027DEC();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v53 = v16;
    unsigned int v30 = "HangTracer tailspin support is disabled, not saving a report for %@ activation!";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
    goto LABEL_15;
  }
  if (!sub_10002BCB8())
  {
    int v25 = sub_100027DEC();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v53 = v16;
    unsigned int v30 = "Tried to save tailspin for %@ activation, but tailspin support is not present on this device!";
    goto LABEL_10;
  }
  if (sub_10002E4E4((uint64_t)v16))
  {
    int v25 = sub_100027DEC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v26 = +[HTPrefs sharedPrefs];
      *(_DWORD *)buf = 138412546;
      *(void *)v53 = v16;
      *(_WORD *)&v53[8] = 1024;
      unsigned int v54 = [v26 slowAppActivationPerAppMaxLogLimit];
      signed int v27 = "%@ is hit Generated Log limit of %u. Not saving a report!";
      v28 = v25;
      uint32_t v29 = 18;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  int v31 = dword_100064584;
  v32 = +[HTPrefs sharedPrefs];
  signed int v33 = [v32 slowAppActivationDailyLogLimit];

  if (v31 > v33)
  {
    int v25 = sub_100027DEC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v26 = +[HTPrefs sharedPrefs];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v53 = [v26 slowAppActivationDailyLogLimit];
      signed int v27 = "Device has hit the Daily Generated Log limit of %u. Not saving a report!";
      v28 = v25;
      uint32_t v29 = 8;
      goto LABEL_14;
    }
LABEL_15:
    LOBYTE(v34) = 0;
    goto LABEL_16;
  }
  v36 = (void *)qword_100064558;
  v37 = +[NSDate date];
  BOOL v38 = [v36 stringFromDate:v37];
  int v25 = +[NSString stringWithFormat:@"%@-%@-%@.%@", v15, v16, v38, @"tailspin"];

  v55[0] = @"Reason";
  v55[1] = @"ServiceName";
  v56[0] = v15;
  v56[1] = v14;
  v56[2] = v16;
  v55[2] = @"ProcessPath";
  v55[3] = @"PID";
  v50 = +[NSNumber numberWithInt:v11];
  v56[3] = v50;
  v55[4] = @"ThreadID";
  uint64_t v49 = +[NSNumber numberWithLongLong:0];
  v56[4] = v49;
  v55[5] = @"StartTime";
  uint64_t v48 = +[NSNumber numberWithLongLong:(unint64_t)v22];
  v56[5] = v48;
  v55[6] = @"EndTime";
  v47 = +[NSNumber numberWithLongLong:(unint64_t)v23];
  v56[6] = v47;
  v55[7] = @"DisplayData";
  v39 = +[HTProcessInfo displayStateArray];
  v56[7] = v39;
  v55[8] = @"NetworkState";
  v40 = +[HTNetworkInfo networkStateForTailSpin];
  unsigned __int8 v41 = v40;
  if (!v40)
  {
    unsigned __int8 v41 = +[NSNull null];
  }
  v56[8] = v41;
  v55[9] = @"IsThirdPartyDevSupportModeHang";
  id v42 = +[NSNumber numberWithBool:a9];
  v56[9] = v42;
  uint64_t v43 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:10];

  if (!v40) {
  uint64_t v51 = 11;
  }
  id v44 = objc_alloc_init((Class)NSMutableArray);
  [v44 addObject:v43];
  BOOL v34 = +[HTTailspin saveTailSpinWithFileName:v25 infoDictArray:v44 startTime:(unint64_t)v22 endTime:(unint64_t)v23 processString:v16 pid:v11 requestType:2 failReason:&v51];
  uint64_t v45 = (void *)v43;
  if (v34)
  {
    ++dword_100064584;
    v46 = sub_100027DEC();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v53 = dword_100064584 - 1;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = dword_100064584;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Daily Generated Launch Log count: %u -> %u", buf, 0xEu);
    }

    sub_10002E564(v16);
  }

LABEL_16:
  return v34;
}

+ (BOOL)saveTailSpinForService:(id)a3 reason:(id)a4 processID:(int)a5 threadID:(unint64_t)a6 procName:(id)a7 procPath:(id)a8 startTime:(unint64_t)a9 endTime:(unint64_t)a10 blownFenceId:(unint64_t)a11 hangType:(int64_t)a12 userActionData:(id)a13 displayedInHUD:(BOOL)a14 isThirdPartyDevSupportModeHang:(BOOL)a15 failReason:(int64_t *)a16
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a7;
  id v23 = a8;
  id v24 = a13;
  int v25 = (void *)qword_100064558;
  unsigned int v26 = +[NSDate date];
  signed int v27 = [v25 stringFromDate:v26];
  uint64_t v56 = v22;
  v53 = +[NSString stringWithFormat:@"%@-%@-%@.%@", v20, v22, v27, @"tailspin"];

  uint64_t v52 = sub_10001C798(v20);
  id v28 = objc_alloc_init((Class)NSUUID);
  uint64_t v60 = [v28 UUIDString];

  uint32_t v29 = +[NSNull null];
  unsigned int v54 = v24;
  if (v24)
  {
    id v30 = objc_alloc((Class)NSString);
    id v31 = v24;
    id v32 = [v30 initWithBytesNoCopy:[v31 bytes] length:[v31 length] encoding:4 freeWhenDone:0];

    uint32_t v29 = v32;
  }
  if (!v29)
  {
    uint32_t v29 = +[NSNull null];
  }
  __int16 v59 = v29;
  signed int v33 = +[HTPrefs sharedPrefs];
  uint64_t v34 = [v33 enablementPrefix];

  v62 = (__CFString *)v34;
  if (!v34) {
    v62 = &stru_100053108;
  }
  v63[0] = @"Reason";
  v63[1] = @"ServiceName";
  v57 = v21;
  CFStringRef v58 = v20;
  v64[0] = v21;
  v64[1] = v20;
  id v55 = v23;
  v64[2] = v23;
  v63[2] = @"ProcessPath";
  v63[3] = @"PID";
  uint64_t v51 = +[NSNumber numberWithInt:a5];
  v64[3] = v51;
  v63[4] = @"ThreadID";
  v50 = +[NSNumber numberWithLongLong:a6];
  v64[4] = v50;
  v63[5] = @"StartTime";
  uint64_t v49 = +[NSNumber numberWithLongLong:a9];
  v64[5] = v49;
  v63[6] = @"EndTime";
  unint64_t v35 = +[NSNumber numberWithLongLong:a10];
  v64[6] = v35;
  v63[7] = @"HangType";
  v36 = +[NSNumber numberWithInteger:a12];
  v64[7] = v36;
  v63[8] = @"DisplayData";
  v37 = +[HTProcessInfo displayStateArray];
  v64[8] = v37;
  v63[9] = @"NetworkState";
  BOOL v38 = +[HTNetworkInfo networkStateForTailSpin];
  v39 = v38;
  if (!v38)
  {
    v39 = +[NSNull null];
  }
  v64[9] = v39;
  v64[10] = v60;
  v63[10] = @"HangUUID";
  v63[11] = @"UserAction";
  v64[11] = v59;
  v64[12] = v62;
  v63[12] = @"EnablementType";
  v63[13] = @"DisplayedInHUD";
  v40 = +[NSNumber numberWithBool:a14];
  v64[13] = v40;
  v63[14] = @"IsThirdPartyDevSupportModeHang";
  unsigned __int8 v41 = +[NSNumber numberWithBool:a15];
  v64[14] = v41;
  id v42 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:15];
  uint64_t v43 = +[NSMutableDictionary dictionaryWithDictionary:v42];

  if (!v38) {
  if (v52 == 1)
  }
  {
    id v44 = +[HTProcessInfo recentAppsDict];
    [v43 setObject:v44 forKeyedSubscript:@"RecentAppsDict"];
  }
  if (a12 == 5)
  {
    uint64_t v45 = +[NSNumber numberWithUnsignedLongLong:a11];
    [v43 setObject:v45 forKeyedSubscript:@"CAFenceId"];
  }
  id v46 = objc_alloc_init((Class)NSMutableArray);
  [v46 addObject:v43];
  BOOL v47 = +[HTTailspin saveTailSpinWithFileName:v53 infoDictArray:v46 startTime:a9 endTime:a10 processString:v56 pid:a5 requestType:v52 failReason:a16];

  return v47;
}

+ (void)collectTailspinAndUpdateTelemtry
{
  unint64_t v2 = +[HTHangInfo numberOfHangs];
  id v3 = sub_100027DEC();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v24 = 134217984;
      unint64_t v25 = +[HTHangInfo numberOfHangs];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Collecting tailspin for a sequence of %lu hang(s)\n", (uint8_t *)&v24, 0xCu);
    }

    BOOL v5 = +[HTTailspin saveTailspinForAllHangs];
    double v6 = +[HTHangInfo firstHang];
    id v3 = v6;
    if (v6)
    {
      BOOL v7 = sub_10001C6C4((uint64_t)[v6 hangSubType]);
      BOOL v8 = v7;
      if (v5)
      {
        if (v7)
        {
          +[HTTailspin incrementDailyFenceLogGenerationCount];
          +[HTHangInfo cleanupAllHangs];
LABEL_14:
          id v10 = [v3 failReason];
          id v11 = [v3 hangSubType];
          BOOL v12 = v5;
          id v13 = v10;
          uint64_t v14 = 0;
LABEL_17:
          +[HTTailspin notifyHTTailSpinResult:v12 failReason:v13 hangSubType:v11 htBugType:v14];
          goto LABEL_18;
        }
        [v3 hangDurationMS];
        double v16 = v15;
        CFStringRef v17 = [v3 processName];
        +[HTTailspin incrementAppGeneratedLogsCountForDuration:v17 procName:[v3 isFirstPartyApp] isFirstPartyApp:v16];

        [v3 hangDurationMS];
        +[HTTailspin incrementDailyLogGenerationCountForDuration:[v3 isFirstPartyApp] isFirstPartyApp:v18];
        +[HTHangInfo cleanupAllHangs];
      }
      else
      {
        +[HTHangInfo cleanupAllHangs];
        if (v8) {
          goto LABEL_14;
        }
      }
      int v19 = [v3 isFirstPartyApp];
      int v20 = [v3 isThirdPartyDevSupportModeHang];
      [v3 hangDurationMS];
      uint64_t v22 = sub_10001C6F8(v19, v20, v21);
      id v23 = [v3 failReason];
      id v11 = [v3 hangSubType];
      BOOL v12 = v5;
      id v13 = v23;
      uint64_t v14 = v22;
      goto LABEL_17;
    }
    id v9 = sub_100027DEC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No hangs found to update telemetry\n", (uint8_t *)&v24, 2u);
    }
  }
  else if (v4)
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "collectTailspinAndUpdateTelemtry: No hangs found, not collecting tailspin\n", (uint8_t *)&v24, 2u);
  }
LABEL_18:
}

+ (BOOL)saveTailspinForAllHangs
{
  if (!+[HTHangInfo numberOfHangs]) {
    return 0;
  }
  id v2 = +[HTHangInfo firstHang];
  uint32_t v29 = [v2 processName];
  unsigned int v28 = [v2 pid];
  uint64_t v38 = 11;
  id v3 = [v2 serviceName];
  BOOL v4 = [v2 processName];
  BOOL v5 = (void *)qword_100064558;
  double v6 = +[NSDate date];
  BOOL v7 = [v5 stringFromDate:v6];
  BOOL v8 = +[NSString stringWithFormat:@"%@-%@-%@.%@", v3, v4, v7, @"tailspin"];

  id v9 = [v2 serviceName];
  uint64_t v10 = sub_10001C798(v9);

  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  BOOL v12 = +[HTHangInfo allHangs];
  id v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        CFStringRef v17 = [*(id *)(*((void *)&v34 + 1) + 8 * i) infoDict];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v14);
  }

  unint64_t v18 = +[HTHangInfo hangSequenceStartTime];
  unint64_t v19 = (unint64_t)sub_10002AA40(0x7D0uLL);
  if (v18 <= v19) {
    unint64_t v19 = 0;
  }
  BOOL v20 = +[HTTailspin saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:](HTTailspin, "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:", v8, v11, v18 - v19, +[HTHangInfo hangSequenceEndTime], v29, v28, v10, &v38);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v21 = +[HTHangInfo allHangs];
  id v22 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      unint64_t v25 = 0;
      unsigned int v26 = v2;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        id v2 = *(id *)(*((void *)&v30 + 1) + 8 * (void)v25);

        [v2 setFailReason:v38];
        unint64_t v25 = (char *)v25 + 1;
        unsigned int v26 = v2;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v23);
  }

  return v20;
}

+ (BOOL)saveTailSpinWithFileName:(id)a3 infoDictArray:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 processString:(id)a7 pid:(int)a8 requestType:(int64_t)a9 failReason:(int64_t *)a10
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = +[NSString stringWithFormat:@"%s", "/var/root/Library/Caches/hangtracerd/tmp"];
  double v16 = +[NSString stringWithFormat:@"%s/%@", "/var/root/Library/Caches/hangtracerd/spool", v14];
  CFStringRef v17 = v12;
  id v18 = +[NSString stringWithFormat:@"%s/%@", "/var/root/Library/Caches/hangtracerd/tmp", v14];
  unint64_t v19 = (const char *)[v18 UTF8String];
  LOBYTE(v29) = 0;
  LODWORD(v28) = a8;
  BOOL v20 = +[HTTailspin saveTailspinWithFileName:v14 path:v15 infoDictArray:v13 startTime:a5 endTime:a6 processString:v12 pid:v28 requestType:a9 includeOSSignposts:v29 failReason:a10];

  if (v20)
  {
    double v21 = v19;
    id v22 = sub_100027DEC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      long long v35 = v17;
      __int16 v36 = 2114;
      id v37 = v16;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Moving tailspin to spool: %{public}@\n", buf, 0x16u);
    }

    id v23 = +[NSFileManager defaultManager];
    id v33 = 0;
    unsigned __int8 v24 = [v23 moveItemAtPath:v18 toPath:v16 error:&v33];
    id v25 = v33;

    if ((v24 & 1) == 0)
    {
      unsigned int v26 = sub_100027DEC();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        long long v35 = v17;
        __int16 v36 = 2114;
        id v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to move tailspin to final path: %{public}@", buf, 0x16u);
      }

      *a10 = 13;
      unlink(v21);
    }
  }
  else
  {
    unlink(v19);
    id v25 = 0;
  }

  return v20;
}

+ (BOOL)saveTailspinForForceQuitProcessID:(int)a3 procName:(id)a4 procPath:(id)a5 filePath:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)qword_100064558;
  id v11 = +[NSDate date];
  id v12 = [v10 stringFromDate:v11];
  id v13 = +[NSString stringWithFormat:@"ForceQuit-%@-%@.%@", v8, v12, @"tailspin"];

  id v14 = +[NSString stringWithFormat:@"%@/%@", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ForceQuit/", v13];
  long long v32 = +[NSFileManager defaultManager];
  v41[0] = @"Reason";
  uint64_t v15 = +[NSString stringWithFormat:@"ForceQuit-%@", v8];
  v42[0] = v15;
  v42[1] = v9;
  long long v31 = v9;
  v41[1] = @"ProcessPath";
  v41[2] = @"PID";
  double v16 = +[NSNumber numberWithInt:v7];
  v42[2] = v16;
  v41[3] = @"NetworkState";
  CFStringRef v17 = +[HTNetworkInfo networkStateForTailSpin];
  id v18 = v17;
  if (!v17)
  {
    id v18 = +[NSNull null];
  }
  v42[3] = v18;
  unint64_t v19 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
  BOOL v20 = +[NSMutableDictionary dictionaryWithDictionary:v19];

  if (!v17) {
  id v21 = objc_alloc_init((Class)NSMutableArray);
  }
  [v21 addObject:v20];
  id v22 = v14;
  *a6 = v22;
  uint64_t v34 = 11;
  LOBYTE(v29) = 1;
  LODWORD(v28) = v7;
  if (!+[HTTailspin saveTailspinWithFileName:v13 path:@"/var/root/Library/Caches/hangtracerd/tmp" infoDictArray:v21 startTime:0 endTime:0 processString:v8 pid:v28 requestType:4 includeOSSignposts:v29 failReason:&v34])goto LABEL_10; {
  BOOL v23 = 1;
  }
  sub_10001B858(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ForceQuit/", 1);
  unsigned __int8 v24 = +[NSString stringWithFormat:@"%s/%@", "/var/root/Library/Caches/hangtracerd/tmp", v13];
  id v33 = 0;
  [v32 moveItemAtPath:v24 toPath:v22 error:&v33];
  id v25 = v33;

  if (v25)
  {
    *a6 = 0;
    unsigned int v26 = sub_100027DEC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v36 = "/var/root/Library/Caches/hangtracerd/tmp";
      __int16 v37 = 2112;
      uint64_t v38 = v13;
      __int16 v39 = 2112;
      id v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "failed to move %s/%@: %@", buf, 0x20u);
    }

LABEL_10:
    BOOL v23 = 0;
    *a6 = 0;
  }

  return v23;
}

+ (BOOL)saveTailspinWithFileName:(id)a3 path:(id)a4 infoDictArray:(id)a5 startTime:(unint64_t)a6 endTime:(unint64_t)a7 processString:(id)a8 pid:(int)a9 requestType:(int64_t)a10 includeOSSignposts:(BOOL)a11 failReason:(int64_t *)a12
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = +[NSString stringWithFormat:@"%@/%@", a4, v15];
  unint64_t v19 = sub_100027DEC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v76 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting to save tailspin at %@", buf, 0xCu);
  }

  id v20 = v18;
  id v21 = (const char *)[v20 cStringUsingEncoding:4];
  uint64_t v22 = open_dprotected_np(v21, 514, 4, 0, 420);
  BOOL v23 = sub_100027DEC();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if ((v22 & 0x80000000) == 0)
  {
    if (v24)
    {
      *(_DWORD *)buf = 138412546;
      id v76 = v20;
      __int16 v77 = 1024;
      *(_DWORD *)v78 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Will request tailspin at: %@, fd: %i", buf, 0x12u);
    }

    id v74 = 0;
    uint64_t v25 = +[NSJSONSerialization dataWithJSONObject:v16 options:0 error:&v74];
    double v68 = COERCE_DOUBLE(v74);
    v69 = (void *)v25;
    if (!v25)
    {
      long long v30 = sub_100027DEC();
      double v31 = v68;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v76 = v17;
        __int16 v77 = 2114;
        *(void *)v78 = v16;
        *(_WORD *)&v78[8] = 2114;
        double v79 = v68;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to serialize Info Dict into JSON: %{public}@ - %{public}@\n", buf, 0x20u);
      }

      unlink(v21);
      close(v22);
      BOOL v29 = 0;
      *a12 = 7;
      goto LABEL_52;
    }
    id v65 = [objc_alloc((Class)NSString) initWithData:v25 encoding:4];
    if (v65)
    {
      unsigned int v26 = +[HTPrefs sharedPrefs];
      if ([v26 isInternal])
      {
        unsigned int v64 = 0;
      }
      else
      {
        id v33 = +[HTPrefs sharedPrefs];
        unsigned int v64 = [v33 shouldUploadToDiagPipe];
      }
      uint64_t v34 = sub_100027DEC();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        long long v35 = +[HTPrefs sharedPrefs];
        uint64_t v36 = v22;
        unsigned int v37 = [v35 isInternal] ^ 1;
        uint64_t v38 = +[HTPrefs sharedPrefs];
        unsigned int v39 = [v38 shouldUploadToDiagPipe];
        *(_DWORD *)buf = 138544130;
        id v76 = v17;
        __int16 v77 = 1024;
        *(_DWORD *)v78 = v64;
        *(_WORD *)&v78[4] = 1024;
        *(_DWORD *)&v78[6] = v37;
        uint64_t v22 = v36;
        LOWORD(v79) = 1024;
        *(_DWORD *)((char *)&v79 + 2) = v39;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%{public}@: Tailspin filepaths will be scrubbed: %{BOOL}d (Customer build: %{BOOL}d, DiagnosticPipeline upload enabled: %{BOOL}d)", buf, 0x1Eu);
      }
      uint64_t v63 = (uint64_t)v17;

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v40 = v16;
      id v41 = [v40 countByEnumeratingWithState:&v70 objects:v84 count:16];
      if (v41)
      {
        id v42 = v41;
        unsigned int v61 = v22;
        id v62 = v15;
        uint64_t v43 = *(void *)v71;
        while (2)
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v71 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            id v46 = [v45 objectForKeyedSubscript:@"isFirstPartyApp"];
            unsigned __int8 v47 = [v46 BOOLValue];

            uint64_t v48 = [v45 objectForKeyedSubscript:@"IsThirdPartyDevSupportModeHang"];
            unsigned int v49 = [v48 BOOLValue];

            if ((v47 & 1) != 0 || !v49)
            {
              uint64_t v51 = sub_100027DEC();
              id v17 = (id)v63;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
                sub_100032F78(v63, v51);
              }

              uint64_t v50 = 1;
              id v15 = v62;
              goto LABEL_35;
            }
          }
          id v42 = [v40 countByEnumeratingWithState:&v70 objects:v84 count:16];
          if (v42) {
            continue;
          }
          break;
        }
        uint64_t v50 = 0;
        id v15 = v62;
        id v17 = (id)v63;
LABEL_35:
        uint64_t v22 = v61;
      }
      else
      {
        uint64_t v50 = 0;
      }

      uint64_t v52 = mach_absolute_time();
      if (!a7 || qword_100064550 <= a7)
      {
        sub_10000F690(a10, a6, a7, v52, 0);
        qword_100064550 = v52;
        CFStringRef v58 = v65;
        if (sub_10002BD04(v22, a6, a7, (uint64_t)v65, a9, a11, v50, v64))
        {
          *a12 = 0;
          BOOL v29 = 1;
        }
        else
        {
          __int16 v59 = sub_100027DEC();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "libtailspin: tailspin_dump_output_with_options_sync() failed to dump tailspin", buf, 2u);
          }

          BOOL v29 = 0;
          *a12 = 12;
        }
        double v31 = v68;
        goto LABEL_51;
      }
      v53 = sub_100027DEC();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v76 = v17;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Tailspin Request Denied because tailspin-buffer has been dumped since this hang ended -> it won't have any trace data for this hang\n", buf, 0xCu);
      }

      float v54 = sub_10002A984(qword_100064550 - a7);
      id v55 = sub_100027DEC();
      double v31 = v68;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        double v56 = sub_10002A9DC(v52 - a7);
        double v57 = sub_10002A9DC(v52 - qword_100064550);
        *(_DWORD *)buf = 138544386;
        id v76 = v15;
        __int16 v77 = 2114;
        *(void *)v78 = v17;
        *(_WORD *)&v78[8] = 2048;
        double v79 = (float)(v54 / 1000.0);
        __int16 v80 = 2048;
        double v81 = v56;
        __int16 v82 = 2048;
        double v83 = v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Tailspin Request Denied: tailspin-buffer will not contain relevant trace data for the time-range of this request due to recent tailspin-capture\n               Filename: %{public}@, Process: %{public}@, Time Between Recent Tailspin Capture and Hang EndTime: %f secs, Hang EndTime: %f secs ago, Recent Tailspin Capture: %f secs ago\n", buf, 0x34u);
      }

      *a12 = 9;
      AnalyticsSendEventLazy();
      sub_10000F690(a10, a6, a7, v52, 1);
      BOOL v29 = 0;
    }
    else
    {
      long long v32 = sub_100027DEC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v76 = v17;
        __int16 v77 = 2114;
        *(void *)v78 = v16;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to create UTF8 string from JSON: %{public}@\n", buf, 0x16u);
      }

      *a12 = 8;
      unlink(v21);
      BOOL v29 = 0;
      double v31 = v68;
    }
    CFStringRef v58 = v65;
LABEL_51:
    close(v22);

LABEL_52:
    goto LABEL_53;
  }
  if (v24)
  {
    signed int v27 = __error();
    *(double *)&uint64_t v28 = COERCE_DOUBLE(strerror(*v27));
    *(_DWORD *)buf = 138543874;
    id v76 = v17;
    __int16 v77 = 2114;
    *(void *)v78 = v20;
    *(_WORD *)&v78[8] = 2080;
    double v79 = *(double *)&v28;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not create file - won't take a tailspin: %{public}@ %s", buf, 0x20u);
  }

  BOOL v29 = 0;
  *a12 = 10;
LABEL_53:

  return v29;
}

@end