@interface OSIntelligenceUtilities
+ (BOOL)deviceConnectedToWirelessChargerWithContext:(id)a3;
+ (BOOL)deviceWasActiveWithinSeconds:(double)a3 withContext:(id)a4;
+ (BOOL)deviceWasConnectedToChargerWithinSeconds:(double)a3 withContext:(id)a4;
+ (BOOL)isActiveBiomeActivityLevelEvent:(id)a3;
+ (BOOL)isDayOfWeek:(int)a3 atDate:(id)a4;
+ (BOOL)isDesktopDeviceWithDurations:(double *)a3 withAOEThreshold:(double)a4 withContext:(id)a5;
+ (BOOL)isInputDateInTimeRange:(id)a3 withEarlyTimeOfDay:(double)a4 andLateTimeOfDay:(double)a5;
+ (BOOL)isInternalBuild;
+ (BOOL)isIntervalOnRestDay:(id)a3;
+ (BOOL)isIntervalTouchingTimewiseSlice:(id)a3 definedByReferenceDate:(id)a4 leftBoundary:(double)a5 rightBoundary:(double)a6;
+ (BOOL)isOBCSupported;
+ (BOOL)isPluggedInWithContext:(id)a3;
+ (BOOL)isRestDay:(id)a3;
+ (BOOL)isWeekday:(id)a3;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)isiPod;
+ (BOOL)legacyPastEventInQuestion:(id)a3 containsTimeOfReferenceDate:(id)a4;
+ (BOOL)pastEventInQuestion:(id)a3 containsTimeOfReferenceDate:(id)a4;
+ (BOOL)pastEventInQuestion:(id)a3 startsAfterTimeOfReferenceDate:(id)a4;
+ (double)areaOverEightyWithBatteryLevelDurations:(double *)a3;
+ (double)batteryLevelAtDate:(id)a3;
+ (double)clockwiseAngleFromPoint:(id)a3 toPoint:(id)a4;
+ (double)countIntervalsWithDateDecay:(id)a3 fromDate:(id)a4 withDecayDegree:(double)a5;
+ (double)cyclicalEncodingOfHoursInDay:(double)a3 useCos:(BOOL)a4;
+ (double)cyclicalEncodingOfWeekday:(id)a3 useCos:(BOOL)a4;
+ (double)dynamicDurationFromEvent:(id)a3 withAnchorDate:(id)a4;
+ (double)exponentialDecayByDateDistance:(int)a3 withDegree:(double)a4;
+ (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4;
+ (double)hourFromDate:(id)a3;
+ (double)hoursUntilUseFromBucketedUsage:(id)a3 withCurrentHour:(int)a4 withComponentsMinutes:(int64_t)a5;
+ (double)intersectedDurationOfPastEvent:(id)a3 withDateOfIntersection:(id)a4;
+ (double)maxOf:(id)a3;
+ (double)meanAbsoluteDeviationOf:(id)a3;
+ (double)meanEventDuration:(id)a3;
+ (double)meanOf:(id)a3;
+ (double)medianOf:(id)a3;
+ (double)medianTimeBetweenDescendingEvents:(id)a3;
+ (double)percentOfLongDurationsIn:(id)a3 withLongThreshold:(double)a4;
+ (double)percentageOfBatteryDurations:(double *)a3 aboveBatteryLevel:(double)a4;
+ (double)qthPercentileOf:(id)a3 withQ:(double)a4;
+ (double)secondsSinceBecomingInactiveAtDate:(id)a3;
+ (double)secondsUntilHour:(unint64_t)a3 fromDate:(id)a4;
+ (double)standardDeviationOf:(id)a3;
+ (double)sumDurationsOfEvents:(id)a3 intersectingDateRangeFrom:(id)a4 to:(id)a5;
+ (double)sumIntervalsWithDateDecay:(id)a3 fromDate:(id)a4 withDecayDegree:(double)a5;
+ (double)timeInSeconds:(id)a3;
+ (double)timeOfDayWithDate:(id)a3;
+ (double)totalPluginDurationAfter:(id)a3 withMinimumDuration:(double)a4 withPluginEvents:(id)a5;
+ (id)accumulativelyBinKLongestIntervals:(int64_t)a3 endAfter:(id)a4 startBefore:(id)a5 longerThan:(double)a6 fromIntervals:(id)a7;
+ (id)batteryProperties;
+ (id)clipInterval:(id)a3 withTimewiseSliceDefineBy:(id)a4 leftBoundary:(double)a5 rightBoundary:(double)a6;
+ (id)concatenateChargeSessions:(id)a3 withMaxDeltaSecondsBetweenEvents:(unint64_t)a4;
+ (id)dateForPreferenceKey:(id)a3 inDomain:(id)a4;
+ (id)dynamicDurationsFromEvents:(id)a3 withAnchorDate:(id)a4 withUnit:(double)a5 cappedAt:(double)a6;
+ (id)encodeTimeAsPointFromDate:(id)a3;
+ (id)events:(id)a3 forHourBin:(unint64_t)a4 date:(id)a5 withMaxDuration:(double)a6;
+ (id)filterEvents:(id)a3 isRecentForDate:(id)a4 goingDaysBack:(int64_t)a5 useEndDate:(BOOL)a6;
+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4;
+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4 withHourBinWidth:(unint64_t)a5;
+ (id)filterEvents:(id)a3 withDateDistance:(int)a4 fromDate:(id)a5;
+ (id)filterEvents:(id)a3 withMinimumDuration:(double)a4;
+ (id)filterEvents:(id)a3 withSameWorkOrOffStatusAs:(id)a4;
+ (id)filterEventsSortedByStartDateAscending:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withHourBinWidth:(unint64_t)a6;
+ (id)getAnchorOfDate:(id)a3 onTheDayOf:(id)a4;
+ (id)getCurrentBootSessionUUID;
+ (id)getDurationsFromEvents:(id)a3 withUnit:(double)a4 cappedAt:(double)a5;
+ (id)getTestVector:(id)a3;
+ (id)getUsageBucketsForEvents:(id)a3 forDate:(id)a4 withLog:(id)a5;
+ (id)lastLockDate;
+ (id)lastPluggedInDate;
+ (id)loadCompiledModelFromPath:(id)a3;
+ (id)log;
+ (id)longestK:(int64_t)a3 intervalsInArray:(id)a4;
+ (id)longestKIntervals:(int64_t)a3 endAfter:(id)a4 startBefore:(id)a5 fromIntervals:(id)a6;
+ (id)numberForPreferenceKey:(id)a3 inDomain:(id)a4;
+ (id)percentageOfTimeForBatteryLevels:(double *)a3 withLog:(id)a4;
+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4;
+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 ignoringDisconnectsShorterThan:(double)a5;
+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5;
+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5 ignoringDisconnectsShorterThan:(double)a6;
+ (id)predicateForEventsWithMaximumDuration:(double)a3;
+ (id)readDictForPreferenceKey:(id)a3 inDomain:(id)a4;
+ (id)readStringForPreferenceKey:(id)a3 inDomain:(id)a4;
+ (id)roundedDateFromDate:(id)a3;
+ (id)timelineEventDate:(id)a3 withDefaultsDomain:(id)a4;
+ (int)datewiseDistanceBetweenDate:(id)a3 andDate:(id)a4;
+ (int)pandasWeekdayOf:(id)a3;
+ (int64_t)currentBatteryLevelWithContext:(id)a3;
+ (unint64_t)decileClassificationWithTopBinCutOff:(float *)a3 withContext:(id)a4;
+ (void)getBatteryLevelDurations:(double *)a3;
+ (void)setDate:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5;
+ (void)setDict:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5;
+ (void)setNumber:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5;
+ (void)setString:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5;
@end

@implementation OSIntelligenceUtilities

+ (id)log
{
  v2 = (void *)qword_10007A8A0;
  if (!qword_10007A8A0)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "utilities");
    v4 = (void *)qword_10007A8A0;
    qword_10007A8A0 = (uint64_t)v3;

    v2 = (void *)qword_10007A8A0;
  }

  return v2;
}

+ (BOOL)isInternalBuild
{
  return _os_variant_has_internal_ui("com.apple.osintelligence.chargeprediction", a2);
}

+ (BOOL)isiPad
{
  v2 = (void *)MGGetStringAnswer();
  unsigned __int8 v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

+ (BOOL)isiPod
{
  v2 = (void *)MGGetStringAnswer();
  unsigned __int8 v3 = [v2 isEqualToString:@"iPod"];

  return v3;
}

+ (BOOL)isiPhone
{
  v2 = (void *)MGGetStringAnswer();
  unsigned __int8 v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

+ (id)getCurrentBootSessionUUID
{
  size_t size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  unsigned __int8 v3 = malloc_type_malloc(size, 0x1105D3EDuLL);
  sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0);
  v4 = +[NSString stringWithUTF8String:v3];
  free(v3);
  v5 = [a1 log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current boot session UUID: %@", buf, 0xCu);
  }

  return v4;
}

+ (BOOL)isOBCSupported
{
  v2 = objc_opt_class();

  return [v2 isiPhone];
}

+ (id)batteryProperties
{
  CFDictionaryRef v2 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    CFMutableDictionaryRef properties = 0;
    IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0);
    CFMutableDictionaryRef v5 = properties;
    id v6 = [(__CFDictionary *)properties copy];

    IOObjectRelease(v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (double)batteryLevelAtDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSinceNow];
  if (v5 <= -10.0)
  {
    uint64_t v24 = 0;
    v25 = (double *)&v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    id v12 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:v4 endDate:0 maxEvents:20 lastN:0 reversed:1];
    v13 = BiomeLibrary();
    v14 = [v13 Device];
    v15 = [v14 Power];
    v16 = [v15 BatteryLevel];
    v17 = [v16 publisherWithOptions:v12];
    v18 = [v17 filterWithIsIncluded:&stru_100064F78];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100023D24;
    v23[3] = &unk_100064F98;
    v23[4] = a1;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100023D88;
    v22[3] = &unk_100064FC0;
    v22[4] = &v24;
    id v19 = [v18 sinkWithCompletion:v23 shouldContinue:v22];

    v20 = [a1 log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100042E00();
    }

    double v11 = v25[3];
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v6 = +[_CDClientContext userContext];
    v7 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
    v8 = [v6 objectForKeyedSubscript:v7];

    v9 = +[_CDContextQueries batteryPercentageKey];
    v10 = [v8 objectForKeyedSubscript:v9];
    double v11 = (double)(uint64_t)[v10 integerValue];
  }
  return v11;
}

+ (void)getBatteryLevelDurations:(double *)a3
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100024080;
  uint64_t v27 = sub_100024090;
  id v28 = 0;
  double v5 = BiomeLibrary();
  id v6 = [v5 Device];
  v7 = [v6 Power];
  v8 = [v7 BatteryLevel];
  v9 = [v8 publisher];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100024098;
  v22[3] = &unk_100064F98;
  v22[4] = a1;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000240FC;
  v21[3] = &unk_100064FE8;
  v21[4] = &v23;
  v21[5] = a1;
  v21[6] = a3;
  id v10 = [v9 sinkWithCompletion:v22 receiveInput:v21];

  if (v24[5])
  {
    double v11 = +[NSDate date];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;
    [(id)v24[5] timestamp];
    double v15 = v14;

    v16 = [(id)v24[5] eventBody];
    [v16 batteryPercentage];
    double v18 = v17;

    if ((unint64_t)(uint64_t)v18 >= 0x65)
    {
      id v19 = [a1 log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = +[NSNumber numberWithInteger:(uint64_t)v18];
        sub_100042F1C(v20, buf, v19);
      }
    }
    else
    {
      a3[(uint64_t)v18] = v13 - v15 + a3[(uint64_t)v18];
    }
  }
  _Block_object_dispose(&v23, 8);
}

+ (BOOL)isDesktopDeviceWithDurations:(double *)a3 withAOEThreshold:(double)a4 withContext:(id)a5
{
  return 0;
}

+ (double)areaOverEightyWithBatteryLevelDurations:(double *)a3
{
  bzero(a3, 0x328uLL);
  +[OSIntelligenceUtilities getBatteryLevelDurations:a3];

  +[OSIntelligenceUtilities percentageOfBatteryDurations:a3 aboveBatteryLevel:75.0];
  return result;
}

+ (double)percentageOfBatteryDurations:(double *)a3 aboveBatteryLevel:(double)a4
{
  uint64_t v4 = 0;
  double v5 = 0.0;
  double v6 = 0.0;
  do
  {
    double v7 = a3[v4];
    double v5 = v5 + v7;
    if ((double)(int)v4 < a4) {
      double v7 = -0.0;
    }
    double v6 = v6 + v7;
    ++v4;
  }
  while (v4 != 101);
  if (v5 != 0.0) {
    return v6 / v5;
  }
  v8 = [a1 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000430A8();
  }

  return 0.0;
}

+ (id)percentageOfTimeForBatteryLevels:(double *)a3 withLog:(id)a4
{
  id v5 = a4;
  double v6 = +[NSMutableArray arrayWithCapacity:4];
  uint64_t v7 = 0;
  memset(v24, 0, sizeof(v24));
  double v8 = 0.0;
  do
  {
    unsigned int v9 = v7 / 0x19u;
    if (v9 >= 3) {
      unsigned int v9 = 3;
    }
    double v10 = a3[v7];
    *((double *)v24 + v9) = v10 + *((double *)v24 + v9);
    double v8 = v8 + v10;
    ++v7;
  }
  while (v7 != 101);
  for (uint64_t i = 0; i != 4; ++i)
  {
    double v12 = *((double *)v24 + i);
    if (v12 <= 0.0)
    {
      [v6 setObject:&off_100068E58 atIndexedSubscript:i];
    }
    else
    {
      double v13 = +[NSNumber numberWithDouble:v12 / v8];
      [v6 setObject:v13 atIndexedSubscript:i];

      double v14 = v5;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = +[NSNumber numberWithInt:i];
        v16 = +[NSNumber numberWithDouble:v12];
        *(_DWORD *)buf = 138412546;
        v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Quartile %@: %@", buf, 0x16u);
      }
    }
  }
  double v17 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = +[NSNumber numberWithDouble:v8];
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Desktop Quartile Bins %@ with totalDuration %@", buf, 0x16u);
  }

  return v6;
}

+ (int64_t)currentBatteryLevelWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  double v6 = +[_CDContextQueries batteryPercentageKey];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 integerValue];

  return (int64_t)v8;
}

+ (BOOL)isPluggedInWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  double v6 = +[_CDContextQueries batteryExternalConnectedKey];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

+ (id)lastPluggedInDate
{
  id v3 = +[_CDClientContext userContext];
  if (!+[OSIntelligenceUtilities isPluggedInWithContext:v3])
  {
    uint64_t v30 = 0;
    v31[0] = &v30;
    v31[1] = 0x3032000000;
    v31[2] = sub_100024080;
    v31[3] = sub_100024090;
    id v32 = 0;
    id v8 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:0 endDate:0 maxEvents:8 lastN:0 reversed:1];
    unsigned int v9 = BiomeLibrary();
    double v10 = [v9 Device];
    double v11 = [v10 Power];
    double v12 = [v11 PluggedIn];
    double v13 = [v12 publisherWithOptions:v8];
    double v14 = [v13 filterWithIsIncluded:&stru_100065008];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100024AB4;
    v29[3] = &unk_100064F98;
    v29[4] = a1;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100024B18;
    v28[3] = &unk_100064FC0;
    v28[4] = &v30;
    id v15 = [v14 sinkWithCompletion:v29 shouldContinue:v28];

    v16 = *(void **)(v31[0] + 40);
    if (v16)
    {
      [v16 timeIntervalSinceNow];
      if (v17 <= 0.0)
      {
        uint64_t v25 = [a1 log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          [*(id *)(v31[0] + 40) timeIntervalSinceNow];
          sub_100043144((uint64_t)v31, (uint64_t)v33, v26);
        }

        id v24 = *(id *)(v31[0] + 40);
        goto LABEL_16;
      }
      double v18 = [a1 log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100043110();
      }
    }
    else
    {
      double v18 = [a1 log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000430DC();
      }
    }

    id v24 = +[NSDate date];
LABEL_16:
    uint64_t v23 = v24;

    _Block_object_dispose(&v30, 8);
    goto LABEL_20;
  }
  uint64_t v4 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  double v6 = [v5 objectForKeyedSubscript:@"externalConnectedChangeDate"];

  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"externalConnectedChangeDate"];
LABEL_18:
    uint64_t v23 = (void *)v7;
    goto LABEL_19;
  }
  id v19 = +[_CDContextQueries keyPathForPluginStatus];
  v20 = [v3 objectForKeyedSubscript:v19];
  unsigned int v21 = [v20 BOOLValue];

  if (!v21)
  {
    uint64_t v7 = +[NSDate date];
    goto LABEL_18;
  }
  __int16 v22 = +[_CDContextQueries keyPathForPluginStatus];
  uint64_t v23 = [v3 lastModifiedDateForContextualKeyPath:v22];

LABEL_19:
LABEL_20:

  return v23;
}

+ (BOOL)deviceWasActiveWithinSeconds:(double)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[_CDContextQueries keyPathForInUseStatus];
  id v8 = [v6 objectForKeyedSubscript:v7];
  unsigned __int8 v9 = [v8 unsignedIntegerValue];

  if ((v9 & 5) != 0)
  {
    BOOL v10 = 1;
  }
  else
  {
    double v11 = +[_CDContextQueries keyPathForInUseStatus];
    double v12 = [v6 lastModifiedDateForContextualKeyPath:v11];
    [v12 timeIntervalSinceNow];
    double v14 = -v13;

    if (v14 <= a3)
    {
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      id v15 = objc_alloc((Class)BMPublisherOptions);
      v16 = +[NSDate dateWithTimeIntervalSinceNow:-a3];
      double v17 = +[NSDate distantFuture];
      id v18 = [v15 initWithStartDate:v16 endDate:v17 maxEvents:1000 lastN:0 reversed:0];

      id v19 = BiomeLibrary();
      v20 = [v19 Activity];
      unsigned int v21 = [v20 Level];
      __int16 v22 = [v21 publisherWithOptions:v18];
      uint64_t v23 = [v22 filterWithIsIncluded:&stru_100065028];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100024E8C;
      v27[3] = &unk_100064F98;
      v27[4] = a1;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100024EF0;
      v26[3] = &unk_100064FC0;
      v26[4] = &v28;
      id v24 = [v23 sinkWithCompletion:v27 shouldContinue:v26];

      BOOL v10 = *((unsigned char *)v29 + 24) != 0;
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)deviceWasConnectedToChargerWithinSeconds:(double)a3 withContext:(id)a4
{
  id v5 = a4;
  id v6 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = +[_CDContextQueries batteryExternalConnectedKey];
  unsigned __int8 v9 = [v7 objectForKeyedSubscript:v8];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    double v11 = +[_CDContextQueries batteryExternalConnectedChangeDateKey];
    double v12 = [v7 objectForKeyedSubscript:v11];

    if (!v12)
    {
      double v13 = +[_CDContextQueries keyPathForPluginStatus];
      double v12 = [v5 lastModifiedDateForContextualKeyPath:v13];
    }
    double v14 = +[NSDate date];
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;

    BOOL v17 = v16 < a3 && v16 > 0.0;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)deviceConnectedToWirelessChargerWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  id v6 = +[_CDContextQueries batteryAdapterIsWirelessKey];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4
{
  return [a1 pluginEventsBefore:a3 withMinimumDuration:a4 ignoringDisconnectsShorterThan:0.0];
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 ignoringDisconnectsShorterThan:(double)a5
{
  id v25 = a3;
  uint64_t v23 = (void *)os_transaction_create();
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100024080;
  v38 = sub_100024090;
  id v39 = +[NSMutableArray array];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_100024080;
  v32[4] = sub_100024090;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100024080;
  v30[4] = sub_100024090;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100024080;
  v28[4] = sub_100024090;
  id v29 = 0;
  id v7 = objc_alloc((Class)BMPublisherOptions);
  unsigned __int8 v8 = [v25 dateByAddingTimeInterval:-5184000.0];
  id v9 = [v7 initWithStartDate:v8 endDate:v25 maxEvents:0 lastN:0 reversed:0];

  id v24 = BiomeLibrary();
  unsigned int v10 = [v24 Device];
  double v11 = [v10 Power];
  double v12 = [v11 PluggedIn];
  double v13 = [v12 publisherWithOptions:v9];
  double v14 = BiomeLibrary();
  double v15 = [v14 Device];
  double v16 = [v15 TimeZone];
  BOOL v17 = [v16 publisherWithOptions:v9];
  id v18 = [v13 orderedMergeWithOther:v17 comparator:&stru_100065048];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000255C4;
  v27[3] = &unk_100064F98;
  v27[4] = a1;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100025628;
  v26[3] = &unk_100065070;
  v26[4] = v28;
  void v26[5] = v30;
  v26[6] = v32;
  v26[7] = &v34;
  *(double *)&v26[8] = a5;
  *(double *)&v26[9] = a4;
  id v19 = [v18 sinkWithCompletion:v27 receiveInput:v26];

  id v20 = (id)v35[5];
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);

  return v20;
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5
{
  return [a1 pluginEventsBefore:a3 withMinimumDuration:a4 withMinimumPlugoutBatteryLevel:a5 ignoringDisconnectsShorterThan:0.0];
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5 ignoringDisconnectsShorterThan:(double)a6
{
  id v33 = a3;
  id v24 = (void *)os_transaction_create();
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_100024080;
  v50 = sub_100024090;
  id v51 = +[NSMutableArray array];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_100024080;
  v44[4] = sub_100024090;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_100024080;
  v42[4] = sub_100024090;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_100024080;
  v40[4] = sub_100024090;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_100024080;
  v38[4] = sub_100024090;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  int v37 = -1;
  id v9 = objc_alloc((Class)BMPublisherOptions);
  unsigned int v10 = [v33 dateByAddingTimeInterval:-5184000.0];
  id v11 = [v9 initWithStartDate:v10 endDate:v33 maxEvents:0 lastN:0 reversed:0];

  id v32 = BiomeLibrary();
  id v31 = [v32 Device];
  uint64_t v30 = [v31 Power];
  id v29 = [v30 PluggedIn];
  double v26 = [v29 publisherWithOptions:v11];
  uint64_t v28 = BiomeLibrary();
  uint64_t v27 = [v28 Device];
  double v12 = [v27 TimeZone];
  double v13 = [v12 publisherWithOptions:v11];
  v52[0] = v13;
  double v14 = BiomeLibrary();
  double v15 = [v14 Device];
  double v16 = [v15 Power];
  BOOL v17 = [v16 BatteryLevel];
  id v18 = [v17 publisherWithOptions:v11];
  v52[1] = v18;
  id v19 = +[NSArray arrayWithObjects:v52 count:2];
  id v20 = [v26 orderedMergeWithOthers:v19 comparator:&stru_100065090];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100025F00;
  v35[3] = &unk_100064F98;
  v35[4] = a1;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100025F64;
  v34[3] = &unk_1000650B8;
  v34[4] = v38;
  v34[5] = v40;
  v34[6] = v42;
  v34[7] = v36;
  v34[8] = v44;
  v34[9] = &v46;
  *(double *)&v34[10] = a6;
  *(double *)&v34[11] = a4;
  *(double *)&v34[12] = a5;
  v34[13] = a1;
  id v21 = [v20 sinkWithCompletion:v35 receiveInput:v34];

  id v22 = (id)v47[5];
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

  return v22;
}

+ (id)timelineEventDate:(id)a3 withDefaultsDomain:(id)a4
{
  id v6 = a3;
  id v7 = (void *)CFPreferencesCopyAppValue(@"timeline", (CFStringRef)a4);
  id v8 = [v7 mutableCopy];

  if (v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      id v21 = a1;
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v15 = [v14 objectForKeyedSubscript:@"event"];
          unsigned int v16 = [v15 isEqualToString:v6];

          if (v16)
          {
            id v18 = [v14 objectForKeyedSubscript:@"date"];
            [v18 doubleValue];
            BOOL v17 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

            id v19 = [v21 log];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
              sub_1000433EC();
            }

            goto LABEL_14;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v17 = 0;
LABEL_14:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (double)totalPluginDurationAfter:(id)a3 withMinimumDuration:(double)a4 withPluginEvents:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v15 = [v14 startDate];
        [v7 timeIntervalSinceDate:v15];
        double v17 = v16;

        if (v17 <= 0.0)
        {
          [v14 duration];
          if (v18 >= a4)
          {
            [v14 duration];
            double v12 = v12 + v12 + v19;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

+ (BOOL)isInputDateInTimeRange:(id)a3 withEarlyTimeOfDay:(double)a4 andLateTimeOfDay:(double)a5
{
  [a1 timeOfDayWithDate:a3];
  BOOL v8 = v7 >= a4;
  if (v7 <= a5) {
    BOOL v8 = 1;
  }
  BOOL v9 = v7 >= a4;
  if (v7 > a5) {
    BOOL v9 = 0;
  }
  if (a4 <= a5) {
    return v9;
  }
  else {
    return v8;
  }
}

+ (double)secondsUntilHour:(unint64_t)a3 fromDate:(id)a4
{
  id v5 = a4;
  id v6 = +[NSCalendar currentCalendar];
  double v7 = [v6 components:252 fromDate:v5];
  id v8 = [v7 hour];
  [v7 setHour:a3];
  [v7 setMinute:0];
  [v7 setSecond:0];
  BOOL v9 = [v6 dateFromComponents:v7];
  id v10 = v9;
  if ((unint64_t)v8 > a3)
  {
    uint64_t v11 = [v9 dateByAddingTimeInterval:86400.0];

    id v10 = (void *)v11;
  }
  [v10 timeIntervalSinceDate:v5];
  double v13 = v12;

  return v13;
}

+ (BOOL)isRestDay:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSCalendar currentCalendar];
  id v5 = [v3 dateByAddingTimeInterval:14400.0];

  LOBYTE(v3) = [v4 isDateInWeekend:v5];
  return (char)v3;
}

+ (BOOL)isIntervalOnRestDay:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSCalendar currentCalendar];
  id v5 = [v3 startDate];
  id v6 = [v4 components:544 fromDate:v5];

  double v7 = [v3 endDate];

  id v8 = [v4 components:544 fromDate:v7];

  BOOL v9 = [v6 weekday] == (id)6 && (uint64_t)[v6 hour] > 19;
  BOOL v10 = [v6 weekday] == (id)7 || [v8 weekday] == (id)7;
  if ([v8 weekday] != (id)1)
  {
    BOOL v11 = 0;
    if (!v9) {
      goto LABEL_9;
    }
LABEL_11:
    char v12 = 1;
    goto LABEL_12;
  }
  BOOL v11 = (uint64_t)[v8 hour] < 20;
  if (v9) {
    goto LABEL_11;
  }
LABEL_9:
  char v12 = v10 || v11;
LABEL_12:

  return v12;
}

+ (int)datewiseDistanceBetweenDate:(id)a3 andDate:(id)a4
{
  [a3 timeIntervalSinceDate:a4];
  return llround(v4 / 86400.0);
}

+ (id)getAnchorOfDate:(id)a3 onTheDayOf:(id)a4
{
  id v6 = a3;
  double v7 = +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v6, (double)-(int)[a1 datewiseDistanceBetweenDate:v6 andDate:a4] * 86400.0);

  return v7;
}

+ (BOOL)isIntervalTouchingTimewiseSlice:(id)a3 definedByReferenceDate:(id)a4 leftBoundary:(double)a5 rightBoundary:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    char v12 = [a1 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100043458();
    }
    goto LABEL_7;
  }
  if (a5 > a6)
  {
    char v12 = [a1 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004348C();
    }
LABEL_7:

    BOOL v13 = 0;
    goto LABEL_12;
  }
  double v14 = [v10 startDate];
  double v15 = [a1 getAnchorOfDate:v11 onTheDayOf:v14];

  double v16 = +[NSDate dateWithTimeInterval:v15 sinceDate:a5];
  double v17 = +[NSDate dateWithTimeInterval:v15 sinceDate:a6];
  double v18 = [v10 endDate];
  if ([v18 compare:v16] == (id)1)
  {
    double v19 = [v10 startDate];
    BOOL v13 = [v19 compare:v17] == (id)-1;
  }
  else
  {
    BOOL v13 = 0;
  }

LABEL_12:
  return v13;
}

+ (id)clipInterval:(id)a3 withTimewiseSliceDefineBy:(id)a4 leftBoundary:(double)a5 rightBoundary:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5 <= a6)
  {
    double v14 = [v10 startDate];
    double v15 = [a1 getAnchorOfDate:v11 onTheDayOf:v14];

    double v16 = +[NSDate dateWithTimeInterval:v15 sinceDate:a5];
    double v17 = +[NSDate dateWithTimeInterval:v15 sinceDate:a6];
    double v18 = [v10 endDate];
    double v19 = [v16 earlierDate:v18];
    uint64_t v20 = [v10 endDate];
    if (v19 == (void *)v20)
    {

      id v13 = 0;
    }
    else
    {
      long long v21 = (void *)v20;
      long long v22 = [v10 startDate];
      long long v23 = [v17 earlierDate:v22];

      if (v23 == v17)
      {
        id v13 = 0;
        goto LABEL_11;
      }
      long long v24 = [v10 startDate];
      double v18 = [v16 laterDate:v24];

      long long v25 = [v10 endDate];
      double v19 = [v17 earlierDate:v25];

      id v13 = [v10 copyWithZone:0];
      [v13 setStartDate:v18];
      [v13 setEndDate:v19];
    }

LABEL_11:
    goto LABEL_12;
  }
  char v12 = [a1 log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10004348C();
  }

  id v13 = v10;
LABEL_12:

  return v13;
}

+ (double)clockwiseAngleFromPoint:(id)a3 toPoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] == (id)2 && objc_msgSend(v7, "count") == (id)2)
  {
    id v8 = [v6 objectAtIndexedSubscript:1];
    [v8 doubleValue];
    long double v10 = v9;
    id v11 = [v6 objectAtIndexedSubscript:0];
    [v11 doubleValue];
    double v13 = atan2(v10, v12);

    double v14 = [v7 objectAtIndexedSubscript:1];
    [v14 doubleValue];
    long double v16 = v15;
    double v17 = [v7 objectAtIndexedSubscript:0];
    [v17 doubleValue];
    double v19 = atan2(v16, v18);

    double v20 = fmod(v13 - v19, 6.28318531);
    if (v20 < 0.0) {
      double v20 = v20 + 6.28318531;
    }
    double v21 = v20 * 57.2957795;
  }
  else
  {
    long long v22 = [a1 log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100043504();
    }

    double v21 = -1.0;
  }

  return v21;
}

+ (id)encodeTimeAsPointFromDate:(id)a3
{
  [a1 timeOfDayWithDate:a3];
  __double2 v4 = __sincos_stret(v3 * 6.28318531 / 24.0);
  id v5 = +[NSNumber numberWithDouble:v4.__cosval];
  id v6 = +[NSNumber numberWithDouble:v4.__sinval];
  v9[0] = v5;
  v9[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v9 count:2];

  return v7;
}

+ (BOOL)legacyPastEventInQuestion:(id)a3 containsTimeOfReferenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 >= 0.0)
  {
    long double v12 = [v6 startDate];
    double v13 = [a1 encodeTimeAsPointFromDate:v12];

    double v14 = [v6 endDate];
    double v15 = [a1 encodeTimeAsPointFromDate:v14];

    long double v16 = [a1 encodeTimeAsPointFromDate:v7];
    [a1 clockwiseAngleFromPoint:v16 toPoint:v13];
    BOOL v18 = v17 < 180.0;
    [a1 clockwiseAngleFromPoint:v16 toPoint:v15];
    BOOL v11 = v19 > 180.0 && v18;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)pastEventInQuestion:(id)a3 containsTimeOfReferenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 < 0.0)
  {
LABEL_9:
    unsigned __int8 v21 = 0;
    goto LABEL_10;
  }
  BOOL v11 = [v6 endDate];
  long double v12 = [v6 startDate];
  [v11 timeIntervalSinceDate:v12];
  double v14 = v13;

  if (v14 <= 0.0)
  {
    if (v14 < 0.0)
    {
      long long v22 = [a1 log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10004356C(v6);
      }
    }
    goto LABEL_9;
  }
  if (v14 >= 86400.0)
  {
    unsigned __int8 v21 = 1;
  }
  else
  {
    double v15 = [v6 startDate];
    [a1 timeOfDayWithDate:v15];
    double v17 = v16;

    BOOL v18 = [v6 endDate];
    [a1 timeOfDayWithDate:v18];
    double v20 = v19;

    unsigned __int8 v21 = [a1 isInputDateInTimeRange:v7 withEarlyTimeOfDay:v17 andLateTimeOfDay:v20];
  }
LABEL_10:

  return v21;
}

+ (BOOL)pastEventInQuestion:(id)a3 startsAfterTimeOfReferenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 >= 0.0)
  {
    long double v12 = [v6 startDate];
    double v13 = [a1 encodeTimeAsPointFromDate:v12];

    double v14 = [a1 encodeTimeAsPointFromDate:v7];
    [a1 clockwiseAngleFromPoint:v13 toPoint:v14];
    BOOL v11 = v15 < 180.0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (double)percentOfLongDurationsIn:(id)a3 withLongThreshold:(double)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v18;
      double v11 = a4 / 3600.0;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) doubleValue:v17];
          if (v13 >= v11) {
            ++v9;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
      double v14 = (double)v9;
    }
    else
    {
      double v14 = 0.0;
    }

    double v15 = v14 / (double)(unint64_t)[v6 count];
  }
  else
  {
    double v15 = 0.0;
  }

  return v15;
}

+ (double)cyclicalEncodingOfHoursInDay:(double)a3 useCos:(BOOL)a4
{
  double v4 = a3 * 6.28318531 / 24.0;
  if (a4) {
    return cos(v4);
  }
  else {
    return sin(v4);
  }
}

+ (double)cyclicalEncodingOfWeekday:(id)a3 useCos:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = (double)(int)[a1 pandasWeekdayOf:a3] * 6.28318531 / 6.0;
  if (v4)
  {
    return cos(v5);
  }
  else
  {
    return sin(v5);
  }
}

+ (id)dynamicDurationsFromEvents:(id)a3 withAnchorDate:(id)a4 withUnit:(double)a5 cappedAt:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  long double v12 = +[NSMutableArray array];
  if ([v10 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v10;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (!v14) {
      goto LABEL_20;
    }
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        [a1 dynamicDurationFromEvent:v18 withAnchorDate:v11];
        if (v19 <= 0.0)
        {
          if (v19 >= 0.0) {
            continue;
          }
          unsigned __int8 v21 = [a1 log];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error: extracted <0 duration from event %@. Abandoning event.", buf, 0xCu);
          }
        }
        else
        {
          if (v19 >= a6) {
            double v20 = a6;
          }
          else {
            double v20 = v19;
          }
          if (a6 > 0.0) {
            double v19 = v20;
          }
          unsigned __int8 v21 = +[NSNumber numberWithDouble:v19 / a5];
          [v12 addObject:v21];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (!v15)
      {
LABEL_20:

        id v10 = v23;
        break;
      }
    }
  }

  return v12;
}

+ (double)dynamicDurationFromEvent:(id)a3 withAnchorDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endDate];
  int v9 = [v6 startDate];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  if (+[OSIntelligenceUtilities pastEventInQuestion:v6 containsTimeOfReferenceDate:v7])
  {
    [a1 intersectedDurationOfPastEvent:v6 withDateOfIntersection:v7];
    double v11 = v12;
  }

  return v11;
}

+ (double)intersectedDurationOfPastEvent:(id)a3 withDateOfIntersection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = -1.0;
  if (v6)
  {
    if (+[OSIntelligenceUtilities pastEventInQuestion:v6 containsTimeOfReferenceDate:v7])
    {
      int v9 = [v6 endDate];
      double v10 = [a1 encodeTimeAsPointFromDate:v9];

      double v11 = [a1 encodeTimeAsPointFromDate:v7];
      [a1 clockwiseAngleFromPoint:v10 toPoint:v11];
      double v8 = v12 * 86400.0 / 360.0;
    }
    else
    {
      id v13 = [a1 log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10004362C((uint64_t)v7, v6);
      }
    }
  }

  return v8;
}

+ (double)exponentialDecayByDateDistance:(int)a3 withDegree:(double)a4
{
  if (a3 < 0) {
    int v4 = a3;
  }
  else {
    int v4 = -a3;
  }
  return exp((double)v4 * a4);
}

+ (double)sumIntervalsWithDateDecay:(id)a3 fromDate:(id)a4 withDecayDegree:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v16 = [v15 startDate];
        id v17 = [a1 datewiseDistanceBetweenDate:v9 andDate:v16];

        [a1 exponentialDecayByDateDistance:v17 withDegree:a5];
        double v19 = v18;
        double v20 = [v15 endDate];
        unsigned __int8 v21 = [v15 startDate];
        [v20 timeIntervalSinceDate:v21];
        double v23 = v22;

        double v13 = v13 + v19 * v23;
      }
      id v11 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

+ (double)countIntervalsWithDateDecay:(id)a3 fromDate:(id)a4 withDecayDegree:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) startDate];
        id v16 = [a1 datewiseDistanceBetweenDate:v9 andDate:v15];

        [a1 exponentialDecayByDateDistance:v16 withDegree:a5];
        double v13 = v13 + v17;
      }
      id v11 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

+ (id)longestK:(int64_t)a3 intervalsInArray:(id)a4
{
  double v5 = [a4 sortedArrayUsingComparator:&stru_1000650F8];
  if ((unint64_t)[v5 count] < a3) {
    a3 = (int64_t)[v5 count];
  }
  id v6 = [v5 subarrayWithRange:0, a3];

  return v6;
}

+ (id)longestKIntervals:(int64_t)a3 endAfter:(id)a4 startBefore:(id)a5 fromIntervals:(id)a6
{
  id v9 = a6;
  id v10 = +[NSPredicate predicateWithFormat:@"((endDate >= %@) AND (startDate <= %@))", a4, a5];
  id v11 = [v9 filteredArrayUsingPredicate:v10];

  uint64_t v12 = +[OSIntelligenceUtilities longestK:a3 intervalsInArray:v11];

  return v12;
}

+ (id)accumulativelyBinKLongestIntervals:(int64_t)a3 endAfter:(id)a4 startBefore:(id)a5 longerThan:(double)a6 fromIntervals:(id)a7
{
  id v8 = [a1 longestKIntervals:a3 endAfter:a4 startBefore:a5 fromIntervals:a7];
  int v9 = 24;
  id v10 = +[NSMutableArray arrayWithCapacity:24];
  do
  {
    [v10 addObject:&off_100068E58];
    --v9;
  }
  while (v9);
  uint64_t v34 = +[NSCalendar currentCalendar];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v37;
    id v14 = &AnalyticsSendEventLazy_ptr;
    uint64_t v33 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        double v17 = [v16 endDate];
        double v18 = [v16 startDate];
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;

        if (v20 >= a6)
        {
          long long v21 = [v16 startDate];
          long long v22 = [v16 endDate];
          [v34 components:32 fromDate:v21 toDate:v22 options:0];
          double v23 = v14;
          v25 = id v24 = v12;
          uint64_t v26 = (uint64_t)[v25 hour];

          id v12 = v24;
          id v14 = v23;

          long long v27 = [v16 startDate];
          uint64_t v13 = v33;
          uint64_t v28 = (uint64_t)[v34 component:32 fromDate:v27];

          if (v26 >= 1)
          {
            do
            {
              uint64_t v29 = v23[174];
              uint64_t v30 = [v10 objectAtIndexedSubscript:v28];
              id v31 = [v29 numberWithInteger:((char *)[v30 integerValue]) + 1];
              [v10 setObject:v31 atIndexedSubscript:v28];

              uint64_t v28 = (v28 + 1) % 24;
              --v26;
            }
            while (v26);
          }
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);
  }

  return v10;
}

+ (id)lastLockDate
{
  uint64_t v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = sub_100024080;
  v19[3] = sub_100024090;
  id v20 = 0;
  id v3 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:0 endDate:0 maxEvents:4 lastN:0 reversed:1];
  int v4 = BiomeLibrary();
  double v5 = [v4 Device];
  id v6 = [v5 ScreenLocked];
  id v7 = [v6 publisherWithOptions:v3];
  id v8 = [v7 filterWithIsIncluded:&stru_100065118];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002853C;
  v17[3] = &unk_100064FC0;
  v17[4] = &v18;
  id v9 = [v8 sinkWithCompletion:&stru_100065138 shouldContinue:v17];

  id v10 = *(void **)(v19[0] + 40);
  if (!v10)
  {
    id v12 = [a1 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000436E4();
    }
    goto LABEL_8;
  }
  [v10 timeIntervalSinceNow];
  if (v11 > 0.0)
  {
    id v12 = [a1 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100043718();
    }
LABEL_8:

    id v13 = 0;
    goto LABEL_12;
  }
  id v14 = [a1 log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(v19[0] + 40) timeIntervalSinceNow];
    sub_10004374C((uint64_t)v19, (uint64_t)v21, v15);
  }

  id v13 = *(id *)(v19[0] + 40);
LABEL_12:

  _Block_object_dispose(&v18, 8);

  return v13;
}

+ (double)secondsSinceBecomingInactiveAtDate:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_100024080;
  id v31 = sub_100024090;
  id v32 = 0;
  id v5 = objc_alloc((Class)BMPublisherOptions);
  id v6 = +[NSDate distantPast];
  id v7 = [v5 initWithStartDate:v4 endDate:v6 maxEvents:100 lastN:0 reversed:1];

  id v8 = BiomeLibrary();
  id v9 = [v8 Activity];
  id v10 = [v9 Level];
  double v11 = [v10 publisherWithOptions:v7];
  id v12 = [v11 filterWithIsIncluded:&stru_100065158];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000289DC;
  v26[3] = &unk_100064FC0;
  v26[4] = &v27;
  id v13 = [v12 sinkWithCompletion:&stru_100065178 shouldContinue:v26];

  id v14 = (void *)v28[5];
  if (v14)
  {
    [v14 timestamp];
    double v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v15 timeIntervalSinceDate:v4];
    double v17 = v16;
    if (v16 <= 0.0)
    {
      double v20 = -v16;
      if ([a1 isActiveBiomeActivityLevelEvent:v28[5]])
      {
        uint64_t v18 = [a1 log];
        double v19 = 0.0;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          long long v21 = [(id)v28[5] eventBody];
          unsigned int v22 = [v21 inUseStatus];
          *(_DWORD *)buf = 67109890;
          unsigned int v34 = v22;
          __int16 v35 = 2112;
          long long v36 = v15;
          __int16 v37 = 2048;
          double v38 = v20;
          __int16 v39 = 2112;
          id v40 = v4;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Last event is active (%d) at %@ (%.2f seconds ago from %@). Returning 0 second.", buf, 0x26u);
        }
      }
      else
      {
        uint64_t v18 = [a1 log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          id v24 = [(id)v28[5] eventBody];
          unsigned int v25 = [v24 inUseStatus];
          *(_DWORD *)buf = 67110146;
          unsigned int v34 = v25;
          __int16 v35 = 2112;
          long long v36 = v15;
          __int16 v37 = 2048;
          double v38 = -v17;
          __int16 v39 = 2112;
          id v40 = v4;
          __int16 v41 = 2048;
          double v42 = -v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Last event is inactive (%d) at %@ (%.2f seconds ago from %@). Returning %.2f seconds.", buf, 0x30u);
        }
        double v19 = -v17;
      }
    }
    else
    {
      uint64_t v18 = [a1 log];
      double v19 = 0.0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100043800();
      }
    }
  }
  else
  {
    double v15 = [a1 log];
    double v19 = 0.0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10004378C();
    }
  }

  _Block_object_dispose(&v27, 8);
  return v19;
}

+ (BOOL)isActiveBiomeActivityLevelEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t v5 = [v3 eventBody];
  if (!v5) {
    goto LABEL_10;
  }
  id v6 = (void *)v5;
  id v7 = [v4 eventBody];
  unsigned int v8 = [v7 hasInUseStatus];

  if (v8)
  {
    id v9 = [v4 eventBody];
    unsigned int v10 = [v9 inUseStatus];

    double v11 = [v4 eventBody];
    unsigned int v12 = [v11 inUseStatus];

    BOOL v14 = v10 != 32 && v12 != 0;
  }
  else
  {
LABEL_10:
    BOOL v14 = 1;
  }

  return v14;
}

+ (id)concatenateChargeSessions:(id)a3 withMaxDeltaSecondsBetweenEvents:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 count] > 1)
  {
    id v38 = a1;
    uint64_t v10 = [v6 reverseObjectEnumerator];
    id v7 = [(id)v10 allObjects];

    unsigned int v8 = +[NSMutableArray array];
    int v9 = [v7 count];
    LODWORD(v10) = v9 - 1;
    if (v9 >= 2)
    {
      double v11 = (double)a4;
      __int16 v39 = v8;
      do
      {
        uint64_t v12 = v10;
        do
        {
          id v13 = [v7 objectAtIndexedSubscript:v12];
          BOOL v14 = +[NSNull null];
          if ([v13 isEqual:v14])
          {

            int v15 = v12;
          }
          else
          {
            double v16 = [v7 objectAtIndexedSubscript:v12];

            int v15 = v12;
            if (v16) {
              goto LABEL_11;
            }
          }
          --v12;
        }
        while (v15 > 0);
        LODWORD(v12) = -1;
LABEL_11:
        LODWORD(v10) = v12 - 1;
        if ((int)v12 < 1)
        {
LABEL_19:
          if ((v10 & 0x80000000) == 0)
          {
            uint64_t v10 = v10;
            while (1)
            {
              long long v21 = [v7 objectAtIndexedSubscript:v10];
              unsigned int v22 = [v21 startDate];
              double v23 = [v7 objectAtIndexedSubscript:v10 + 1];
              id v24 = [v23 endDate];
              [v22 timeIntervalSinceDate:v24];
              double v26 = fabs(v25);

              if (v26 > v11) {
                break;
              }
              BOOL v20 = v10-- <= 0;
              if (v20) {
                goto LABEL_24;
              }
            }
          }
        }
        else
        {
          uint64_t v10 = (v12 - 1);
          do
          {
            double v17 = [v7 objectAtIndexedSubscript:v10];
            uint64_t v18 = +[NSNull null];
            if ([v17 isEqual:v18])
            {
            }
            else
            {
              double v19 = [v7 objectAtIndexedSubscript:v10];

              if (v19) {
                goto LABEL_19;
              }
            }
            BOOL v20 = v10-- <= 0;
          }
          while (!v20);
LABEL_24:
          LODWORD(v10) = -1;
        }
        if ((int)v10 >= (int)v12 - 1)
        {
          uint64_t v33 = [v7 objectAtIndexedSubscript:(int)v12];
          LODWORD(v10) = v12 - 1;
        }
        else
        {
          __int16 v41 = [_OSIntelligenceChargeSession alloc];
          double v42 = [v7 objectAtIndexedSubscript:(int)v12];
          id v40 = [v42 startDate];
          uint64_t v27 = [v7 objectAtIndexedSubscript:(int)v10 + 1];
          uint64_t v28 = [v27 endDate];
          uint64_t v29 = [v7 objectAtIndexedSubscript:(int)v12];
          uint64_t v30 = [v29 startSoC];
          id v31 = [v7 objectAtIndexedSubscript:(int)v10 + 1];
          id v32 = [v31 endSoC];
          uint64_t v33 = [(_OSIntelligenceChargeSession *)v41 initWithStartDate:v40 withEndDate:v28 withStartSoC:v30 withEndSoC:v32];

          unsigned int v8 = v39;
        }
        [v8 addObject:v33];
      }
      while ((int)v10 > 0);
    }
    if (!v10)
    {
      unsigned int v34 = [v7 objectAtIndexedSubscript:0];
      [v8 addObject:v34];
    }
    __int16 v35 = [v38 log];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      long long v36 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unsigned char *)[v7 count] - (unsigned char *)[v8 count]);
      *(_DWORD *)buf = 138412290;
      v44 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Concatenated %@ events", buf, 0xCu);
    }
  }
  else
  {
    id v7 = v6;
    unsigned int v8 = v7;
  }

  return v8;
}

+ (id)getUsageBucketsForEvents:(id)a3 forDate:(id)a4 withLog:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v43 = a5;
  memset(v56, 0, sizeof(v56));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v7;
  id v46 = [v7 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (!v46) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)v50;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v50 != v9) {
        objc_enumerationMutation(obj);
      }
      double v11 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v10);
      uint64_t v12 = +[NSCalendar currentCalendar];
      id v13 = [v11 startDate];
      BOOL v14 = [v12 components:112 fromDate:v13];

      int v15 = +[NSCalendar currentCalendar];
      double v16 = [v11 endDate];
      double v17 = [v15 components:96 fromDate:v16];

      uint64_t v18 = (uint64_t)[v14 hour];
      id v19 = [v17 hour];
      v47 = [v14 minute];
      uint64_t v48 = [v17 minute];
      BOOL v20 = +[NSCalendar currentCalendar];
      long long v21 = [v11 startDate];
      if ([v20 isDate:v21 inSameDayAsDate:v8])
      {

        goto LABEL_22;
      }
      uint64_t v45 = (uint64_t)v19;
      unsigned int v22 = [v11 startDate];
      [v8 earlierDate:v22];
      uint64_t v23 = v9;
      id v24 = v8;
      id v25 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v26 = v25 == v24;
      id v8 = v24;
      uint64_t v9 = v23;
      if (!v26)
      {
        if (v18 < v45)
        {
          *((double *)v56 + v18) = sqrt((double)(60 - (uint64_t)v47)) + *((double *)v56 + v18);
          if (v18 + 1 < v45)
          {
            uint64_t v27 = ~v18 + v45;
            uint64_t v28 = (double *)v56 + v18 + 1;
            do
            {
              *uint64_t v28 = *v28 + 7.74596669;
              ++v28;
              --v27;
            }
            while (v27);
          }
LABEL_21:
          *((double *)v56 + v45) = sqrt((double)(uint64_t)v48) + *((double *)v56 + v45);
          goto LABEL_22;
        }
        if (v18 > v45)
        {
          *((double *)v56 + v18) = sqrt((double)(60 - (uint64_t)v47)) + *((double *)v56 + v18);
          if (v18 <= 22)
          {
            uint64_t v29 = v18 + 1;
            do
            {
              *((double *)v56 + v29) = *((double *)v56 + v29) + 7.74596669;
              ++v29;
            }
            while (v29 != 24);
          }
          if (v45 >= 1)
          {
            uint64_t v30 = (double *)v56;
            uint64_t v31 = v45;
            do
            {
              *uint64_t v30 = *v30 + 7.74596669;
              ++v30;
              --v31;
            }
            while (v31);
          }
          goto LABEL_21;
        }
        if (v48 - v47 >= 0) {
          *((double *)v56 + v18) = sqrt((double)(v48 - v47)) + *((double *)v56 + v18);
        }
      }
LABEL_22:

      uint64_t v10 = (char *)v10 + 1;
    }
    while (v10 != v46);
    id v32 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    id v46 = v32;
  }
  while (v32);
LABEL_27:
  uint64_t v33 = 0;
  double v34 = 0.0;
  do
  {
    if (*(double *)((char *)v56 + v33) > v34) {
      double v34 = *(double *)((char *)v56 + v33);
    }
    v33 += 8;
  }
  while (v33 != 192);
  __int16 v35 = v43;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    long long v36 = +[NSNumber numberWithDouble:v34];
    *(_DWORD *)buf = 138412290;
    v54 = v36;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "maxValue in buckets = %@", buf, 0xCu);
  }
  if (v34 == 0.0)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Something went wront, maxValue is 0", buf, 2u);
    }
    __int16 v37 = &off_100069970;
  }
  else
  {
    id v38 = v8;
    __int16 v39 = +[NSMutableArray array];
    for (uint64_t i = 0; i != 192; i += 8)
    {
      __int16 v41 = +[NSNumber numberWithDouble:*(double *)((char *)v56 + i) / v34];
      [v39 addObject:v41];
    }
    __int16 v37 = +[NSArray arrayWithArray:v39];

    id v8 = v38;
  }

  return v37;
}

+ (double)hoursUntilUseFromBucketedUsage:(id)a3 withCurrentHour:(int)a4 withComponentsMinutes:(int64_t)a5
{
  double v8 = 0.0;
  int v9 = 1;
  while (1)
  {
    int v10 = a4 + v9;
    if (a4 + v9 > 23) {
      int v10 = a4 + v9 - 24;
    }
    double v11 = [a3 objectAtIndexedSubscript:v10];
    [v11 doubleValue];
    double v13 = v12;

    if (v13 > 0.2) {
      break;
    }
    if (v9 == 11) {
      double v8 = 12.0;
    }
    if (++v9 == 12) {
      return v8;
    }
  }
  return (double)v9 + (double)a5 / -60.0;
}

+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4 withHourBinWidth:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  +[NSMutableArray array];
  uint64_t v27 = v8;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  [v8 timeIntervalSince1970];
  double v10 = v9;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = (uint64_t)v10;
    double v15 = (double)a5 * 3600.0;
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = *(void *)v30;
    if ((uint64_t)v15 >= 0) {
      uint64_t v18 = (uint64_t)v15;
    }
    else {
      uint64_t v18 = v16 + 1;
    }
    uint64_t v19 = v14 + (v18 >> 1);
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v11);
        }
        long long v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        unsigned int v22 = [v21 startDate];
        [v22 timeIntervalSince1970];
        uint64_t v24 = (uint64_t)v23;

        if (v14 > v24 && (v19 - v24) % 604800 <= v16) {
          [v28 addObject:v21];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }

  return v28;
}

+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v24 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = [v13 endDate:context];
        [v7 timeIntervalSinceDate:v14];
        double v16 = v15;

        if (v16 > 0.0)
        {
          uint64_t v17 = [v13 startDate];
          unsigned int v18 = [a1 datewiseDistanceBetweenDate:v7 andDate:v17];

          uint64_t v19 = [v13 endDate];
          signed int v20 = [a1 datewiseDistanceBetweenDate:v7 andDate:v19];

          if (-1227133513 * v18 + 306783378 < 0x24924925 || v20 % 7 == 0) {
            [v24 addObject:v13];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  return v24;
}

+ (id)filterEvents:(id)a3 withDateDistance:(int)a4 fromDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v25 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        double v15 = [v14 endDate];
        [v9 timeIntervalSinceDate:v15];
        double v17 = v16;

        if (v17 > 0.0)
        {
          unsigned int v18 = [v14 startDate];
          unsigned int v19 = [a1 datewiseDistanceBetweenDate:v9 andDate:v18];

          signed int v20 = [v14 endDate];
          unsigned int v21 = [a1 datewiseDistanceBetweenDate:v9 andDate:v20];

          if (v19 == a4 || v21 == a4) {
            [v25 addObject:v14];
          }
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  return v25;
}

+ (id)filterEvents:(id)a3 isRecentForDate:(id)a4 goingDaysBack:(int64_t)a5 useEndDate:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    double v17 = (double)(uint64_t)((double)a5 * 86400.0);
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned int v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (a6) {
          [v19 endDate];
        }
        else {
        signed int v20 = [v19 startDate:v25];
        }
        [v10 timeIntervalSinceDate:v20];
        double v22 = v21;

        if (v22 >= 0.0 && v22 <= v17) {
          [v11 addObject:v19];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  return v11;
}

+ (id)filterEvents:(id)a3 withSameWorkOrOffStatusAs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [a1 isRestDay:v7];
  id v9 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v8 == objc_msgSend(a1, "isIntervalOnRestDay:", v16, (void)v18)) {
          [v9 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v9;
}

+ (id)filterEvents:(id)a3 withMinimumDuration:(double)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v12 endDate:v18];
        uint64_t v14 = [v12 startDate];
        [v13 timeIntervalSinceDate:v14];
        double v16 = v15;

        if (v16 >= a4) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (double)medianTimeBetweenDescendingEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  if ((int)[v3 count] >= 2)
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = [v3 objectAtIndexedSubscript:v5];
      id v7 = [v6 startDate];
      id v8 = [v3 objectAtIndexedSubscript:++v5];
      id v9 = [v8 endDate];
      [v7 timeIntervalSinceDate:v9];
      double v11 = v10;

      if (v11 >= 0.0)
      {
        id v12 = +[NSNumber numberWithDouble:v11];
        [v4 addObject:v12];
      }
    }
    while (v5 < (int)([v3 count] - 1));
  }
  +[OSIntelligenceUtilities medianOf:v4];
  double v14 = v13;

  return v14;
}

+ (double)meanEventDuration:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) duration:v13];
          double v8 = v8 + v10;
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v11 = v8 / (double)(unint64_t)[v4 count];
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

+ (id)getDurationsFromEvents:(id)a3 withUnit:(double)a4 cappedAt:(double)a5
{
  id v7 = a3;
  double v8 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = [v14 endDate:v22];
        long long v16 = [v14 startDate];
        [v15 timeIntervalSinceDate:v16];
        double v18 = v17 / a4;

        if (v18 >= a5) {
          double v19 = a5;
        }
        else {
          double v19 = v18;
        }
        if (a5 <= 0.0) {
          double v19 = v18;
        }
        long long v20 = +[NSNumber numberWithDouble:v19];
        [v8 addObject:v20];
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)predicateForEventsWithMaximumDuration:(double)a3
{
  id v3 = +[NSNumber numberWithDouble:a3];
  id v4 = +[NSPredicate predicateWithFormat:@"((endDate.timeIntervalSinceReferenceDate - startDate.timeIntervalSinceReferenceDate) <= %@)", v3];

  return v4;
}

+ (double)sumDurationsOfEvents:(id)a3 intersectingDateRangeFrom:(id)a4 to:(id)a5
{
  double v8 = a3;
  id v34 = a4;
  id v9 = a5;
  id v10 = [v8 count];
  uint64_t v33 = v9;
  if (v9
    && v34
    && v10
    && ([v34 laterDate:v9],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11 == v33))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v12 = v8;
    id v15 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v15)
    {
      id v16 = v15;
      long long v32 = v8;
      uint64_t v17 = *(void *)v36;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v12);
          }
          double v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v20 = [v19 startDate];
          long long v21 = [v19 endDate];
          long long v22 = [v20 laterDate:v21];
          long long v23 = [v19 endDate];

          if (v22 == v23)
          {
            long long v27 = [v19 startDate];
            long long v24 = [v34 laterDate:v27];

            long long v28 = [v19 endDate];
            long long v29 = [v33 earlierDate:v28];

            [v29 timeIntervalSinceDate:v24];
            if (v30 >= 0.0)
            {
              double v13 = v13 + v30;
            }
            else
            {
              long long v31 = [a1 log];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                __int16 v41 = v24;
                __int16 v42 = 2112;
                id v43 = v29;
                _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Negative intersected duration with start date %@ and end date %@", buf, 0x16u);
              }
            }
          }
          else
          {
            long long v24 = [a1 log];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              long long v25 = [v19 startDate];
              long long v26 = [v19 endDate];
              *(_DWORD *)buf = 138412802;
              __int16 v41 = v25;
              __int16 v42 = 2112;
              id v43 = v26;
              __int16 v44 = 2112;
              uint64_t v45 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Negative event duration with start date %@ and end date %@ from event %@", buf, 0x20u);
            }
          }
        }
        id v16 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v16);
      double v8 = v32;
    }
    else
    {
      double v13 = 0.0;
    }
  }
  else
  {
    uint64_t v12 = [a1 log];
    double v13 = 0.0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v41 = v8;
      __int16 v42 = 2112;
      id v43 = v34;
      __int16 v44 = 2112;
      uint64_t v45 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid argument(s): events = %@ | startDate = %@ | endDate = %@", buf, 0x20u);
    }
  }

  return v13;
}

+ (id)roundedDateFromDate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 components:124 fromDate:v3];

  uint64_t v6 = (uint64_t)((double)((uint64_t)[v5 minute] / 30 + 1) * 30.0);
  [v5 setMinute:0];
  id v7 = [v4 dateFromComponents:v5];
  double v8 = [v7 dateByAddingTimeInterval:(double)(60 * v6)];

  return v8;
}

+ (double)timeInSeconds:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 components:224 fromDate:v3];

  double v6 = (double)(uint64_t)[v5 hour];
  double v7 = (double)(60 * (uint64_t)[v5 minute]) + v6 * 3600.0;
  double v8 = v7 + (double)(uint64_t)[v5 second];

  return v8;
}

+ (int)pandasWeekdayOf:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 components:512 fromDate:v3];

  LODWORD(v3) = (int)([v5 weekday] + 5) % 7;
  return (int)v3;
}

+ (BOOL)isDayOfWeek:(int)a3 atDate:(id)a4
{
  return [a1 pandasWeekdayOf:a4] == a3;
}

+ (BOOL)isWeekday:(id)a3
{
  return (int)[a1 pandasWeekdayOf:a3] < 5;
}

+ (double)timeOfDayWithDate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 components:224 fromDate:v3];

  id v6 = [v5 hour];
  id v7 = [v5 minute];
  double v8 = (double)(uint64_t)v7 / 60.0 + (double)(uint64_t)v6 + (double)(uint64_t)[v5 second] / 3600.0;

  return v8;
}

+ (double)hourFromDate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 components:32 fromDate:v3];

  double v6 = (double)(uint64_t)[v5 hour];
  return v6;
}

+ (double)maxOf:(id)a3
{
  id v3 = [a3 valueForKeyPath:@"@max.doubleValue"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

+ (double)meanOf:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) doubleValue:v13];
          double v8 = v8 + v10;
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v11 = v8 / (double)(unint64_t)[v4 count];
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

+ (double)standardDeviationOf:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if ((unint64_t)[v3 count] >= 2)
  {
    +[OSIntelligenceUtilities meanOf:v3];
    double v6 = v5;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) doubleValue:v15];
          double v11 = v11 + (v13 - v6) * (v13 - v6);
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    double v4 = sqrt(v11 / (double)((unint64_t)[v7 count] - 1));
  }

  return v4;
}

+ (double)medianOf:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    double v4 = [v3 sortedArrayUsingSelector:"compare:"];
    unsigned __int8 v5 = [v4 count];
    unint64_t v6 = (unint64_t)[v4 count] >> 1;
    if (v5)
    {
      id v7 = [v4 objectAtIndexedSubscript:v6];
      [v7 doubleValue];
      double v12 = v13;
    }
    else
    {
      id v7 = [v4 objectAtIndexedSubscript:v6 - 1];
      [v7 doubleValue];
      double v9 = v8;
      uint64_t v10 = [v4 objectAtIndexedSubscript:v6];
      [v10 doubleValue];
      double v12 = (v9 + v11) * 0.5;
    }
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

+ (double)meanAbsoluteDeviationOf:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [a1 meanOf:v4];
    double v6 = v5;
    id v7 = [v4 mutableCopy];
    if ([v7 count])
    {
      unint64_t v8 = 0;
      do
      {
        double v9 = [v7 objectAtIndexedSubscript:v8];
        [v9 doubleValue];
        double v11 = +[NSNumber numberWithDouble:vabdd_f64(v10, v6)];
        [v7 setObject:v11 atIndexedSubscript:v8];

        ++v8;
      }
      while ((unint64_t)[v7 count] > v8);
    }
    [a1 meanOf:v7];
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

+ (double)qthPercentileOf:(id)a3 withQ:(double)a4
{
  id v5 = a3;
  id v6 = [v5 count];
  double v7 = 0.0;
  if (a4 <= 100.0 && a4 >= 0.0 && v6 != 0)
  {
    double v9 = [v5 sortedArrayUsingSelector:"compare:"];
    double v10 = v9;
    if (a4 >= 2.22044605e-16)
    {
      double v12 = 100.0 - a4;
      if (100.0 - a4 >= 2.22044605e-16)
      {
        double v13 = (double)((unint64_t)[v5 count:v12] - 1) * a4 / 100.0;
        int v14 = vcvtmd_s64_f64(v13);
        if ((char *)[v10 count] - 1 > (char *)v14)
        {
          long long v15 = [v10 objectAtIndexedSubscript:v14];
          [v15 doubleValue];
          double v17 = v16;

          double v18 = v13 - (double)v14;
          double v19 = [v10 objectAtIndexedSubscript:v14 + 1];
          [v19 doubleValue];
          double v21 = v20;
          long long v22 = [v10 objectAtIndexedSubscript:v14];
          [v22 doubleValue];
          double v24 = v21 - v23;

          double v7 = v17 + v18 * v24;
LABEL_13:

          goto LABEL_14;
        }
      }
      double v11 = [v10 lastObject:v12];
    }
    else
    {
      double v11 = [v9 firstObject];
    }
    long long v25 = v11;
    [v11 doubleValue];
    double v7 = v26;

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

+ (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[NSCalendar currentCalendar];
  double v7 = [v6 components:32 fromDate:v5];

  double v8 = (double)(uint64_t)[v7 hour] / (double)a4;
  return v8;
}

+ (id)events:(id)a3 forHourBin:(unint64_t)a4 date:(id)a5 withMaxDuration:(double)a6
{
  id v10 = a3;
  id v11 = a5;
  double v12 = +[NSCalendar currentCalendar];
  long long v32 = v11;
  double v13 = [v12 components:32 fromDate:v11];

  long long v31 = v13;
  id v14 = [v13 hour];
  long long v15 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    unint64_t v19 = (unint64_t)(double)(uint64_t)v14 / a4;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v16);
        }
        long long v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        double v23 = [v22 startDate];
        [a1 getHourBinID:v23 forHourBin:a4];
        if (v19 == (unint64_t)v24)
        {
          long long v25 = [v22 endDate];
          [v25 timeIntervalSinceDate:v23];
          double v27 = v26 / 3600.0;

          if (v27 >= a6) {
            double v28 = a6;
          }
          else {
            double v28 = v27;
          }
          if (a6 <= 0.0) {
            double v28 = v27;
          }
          long long v29 = +[NSNumber numberWithDouble:v28];
          [v15 addObject:v29];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v18);
  }

  return v15;
}

+ (unint64_t)decileClassificationWithTopBinCutOff:(float *)a3 withContext:(id)a4
{
  bzero(v13, 0x328uLL);
  [a1 getBatteryLevelDurations:v13];
  id v6 = [a1 log];
  double v7 = [a1 percentageOfTimeForBatteryLevels:v13 withLog:v6];

  double v8 = [v7 objectAtIndexedSubscript:3];
  [v8 floatValue];
  float v10 = v9;

  unint64_t v11 = 0;
  while (v10 <= a3[v11] || v10 > a3[v11 + 1])
  {
    if (++v11 == 11)
    {
      unint64_t v11 = 0;
      break;
    }
  }

  return v11;
}

+ (id)filterEventsSortedByStartDateAscending:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withHourBinWidth:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v39 = +[NSMutableArray array];
  double v12 = +[NSCalendar currentCalendar];
  double v13 = [v12 timeZone];
  uint64_t v14 = [v10 dateByAddingTimeInterval:(double)(uint64_t)[v13 secondsFromGMT]];

  long long v15 = [v12 timeZone];
  id v16 = [v11 dateByAddingTimeInterval:(double)(uint64_t)[v15 secondsFromGMT]];

  long long v37 = (void *)v14;
  [v12 components:96 fromDate:v14];
  long long v36 = v40 = v12;
  id v17 = [v12 dateFromComponents:v13];
  long long v38 = [v17 dateByAddingTimeInterval:86400.0];
  if ([v9 count])
  {
    unint64_t v18 = 0;
    double v19 = (double)a6 * 1800.0;
    do
    {
      uint64_t v20 = [v9 objectAtIndexedSubscript:v18];
      double v21 = [v20 startDate];

      if (v18)
      {
        long long v22 = [v9 objectAtIndexedSubscript:(v18 - 1)];
        double v23 = [v22 endDate];
      }
      else
      {
        double v23 = +[NSDate distantPast];
      }
      [v21 timeIntervalSinceDate:v23];
      if (v24 >= 0.0)
      {
        [v21 timeIntervalSinceDate:v16];
        if (v25 < 0.0)
        {
          double v26 = [v40 components:96 fromDate:v21];
          double v27 = [v40 dateFromComponents:v26];
          double v28 = [v27 dateByAddingTimeInterval:86400.0];
          [v27 timeIntervalSinceDate:v17];
          if (v29 < 0.0) {
            double v29 = -v29;
          }
          if (v29 < v19) {
            goto LABEL_17;
          }
          [v28 timeIntervalSinceDate:v17];
          if (v30 < 0.0) {
            double v30 = -v30;
          }
          if (v30 < v19) {
            goto LABEL_17;
          }
          [v27 timeIntervalSinceDate:v38];
          if (v31 < 0.0) {
            double v31 = -v31;
          }
          if (v31 < v19)
          {
LABEL_17:
            [v9 objectAtIndexedSubscript:v18];
            v33 = long long v32 = v16;
            [v39 addObject:v33];

            id v16 = v32;
          }
        }
      }

      ++v18;
    }
    while ((unint64_t)[v9 count] > v18);
  }

  return v39;
}

+ (void)setString:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
}

+ (id)readStringForPreferenceKey:(id)a3 inDomain:(id)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);

  return v4;
}

+ (void)setDate:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  key = (__CFString *)a4;
  double v7 = (__CFString *)a5;
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    double v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    double v8 = 0;
  }
  CFPreferencesSetAppValue(key, v8, v7);
}

+ (id)dateForPreferenceKey:(id)a3 inDomain:(id)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)setNumber:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
}

+ (id)numberForPreferenceKey:(id)a3 inDomain:(id)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);

  return v4;
}

+ (void)setDict:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
}

+ (id)readDictForPreferenceKey:(id)a3 inDomain:(id)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);

  return v4;
}

+ (id)getTestVector:(id)a3
{
  id v3 = a3;
  id v46 = 0;
  __int16 v42 = +[NSRegularExpression regularExpressionWithPattern:@"(\".+?),(.+?\")" options:1 error:&v46];
  id v4 = v46;
  id v45 = v4;
  id v40 = v3;
  id v5 = +[NSString stringWithContentsOfURL:v3 encoding:1 error:&v45];
  id v39 = v45;

  id v6 = objc_alloc_init((Class)NSNumberFormatter);
  [v6 setNumberStyle:1];
  long long v38 = v5;
  double v7 = [v5 componentsSeparatedByString:@"\n"];
  double v8 = [v7 objectAtIndexedSubscript:0];
  id v9 = [v8 componentsSeparatedByString:@","];

  id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  if ([v9 count])
  {
    unint64_t v11 = 0;
    do
    {
      double v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v7 count] - 1);
      [v10 setObject:v12 atIndexedSubscript:v11];

      ++v11;
    }
    while ((unint64_t)[v9 count] > v11);
  }
  if ((char *)[v7 count] - 3 <= (char *)0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v13 = 1;
    __int16 v41 = v7;
    while (1)
    {
      uint64_t v14 = [v7 objectAtIndexedSubscript:v13];
      uint64_t v44 = v13;
      long long v15 = [v7 objectAtIndexedSubscript:v13];
      id v16 = [v42 stringByReplacingMatchesInString:v14 options:0 range:NSMakeRange([v15 length], 0) withTemplate:@"$1.$2"];

      id v43 = v16;
      id v17 = [v16 componentsSeparatedByString:@","];
      if ([v9 count]) {
        break;
      }
LABEL_17:

      uint64_t v13 = v44 + 1;
      double v7 = v41;
      if ((char *)[v41 count] - 1 <= (char *)(v44 + 1)) {
        goto LABEL_18;
      }
    }
    uint64_t v18 = 0;
    uint64_t v19 = v44 - 1;
    while (1)
    {
      uint64_t v20 = [v17 objectAtIndexedSubscript:v18];
      double v21 = [v6 numberFromString:v20];

      long long v22 = [v17 objectAtIndexedSubscript:v18];
      double v23 = v22;
      if (v21) {
        break;
      }
      unsigned int v26 = [v22 isEqualToString:@"True"];

      if (v26)
      {
        double v27 = [v10 objectAtIndexedSubscript:v18];
        double v23 = v27;
        double v28 = &off_100068E70;
        goto LABEL_14;
      }
      double v29 = [v17 objectAtIndexedSubscript:v18];
      unsigned int v30 = [v29 isEqualToString:@"False"];

      if (v30)
      {
        double v27 = [v10 objectAtIndexedSubscript:v18];
        double v23 = v27;
        double v28 = &off_100068E58;
LABEL_14:
        [v27 setObject:v28 atIndexedSubscript:v19];
LABEL_15:
      }
      if ((unint64_t)[v9 count] <= ++v18) {
        goto LABEL_17;
      }
    }
    double v24 = [v6 numberFromString:v22];
    double v25 = [v10 objectAtIndexedSubscript:v18];
    [v25 setObject:v24 atIndexedSubscript:v19];

    goto LABEL_15;
  }
LABEL_18:
  double v31 = +[NSMutableDictionary dictionary];
  if ([v9 count])
  {
    unint64_t v32 = 0;
    do
    {
      long long v33 = [v10 objectAtIndexedSubscript:v32];
      long long v34 = +[NSArray arrayWithArray:v33];
      long long v35 = [v9 objectAtIndexedSubscript:v32];
      [v31 setObject:v34 forKeyedSubscript:v35];

      ++v32;
    }
    while ((unint64_t)[v9 count] > v32);
  }
  long long v36 = +[NSDictionary dictionaryWithDictionary:v31];

  return v36;
}

+ (id)loadCompiledModelFromPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = +[NSURL fileURLWithPath:v4];

  double v7 = [a1 log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10004389C();
  }

  id v13 = 0;
  double v8 = +[MLModel modelWithContentsOfURL:v6 error:&v13];
  id v9 = v13;
  if (v9 || !v8)
  {
    unint64_t v11 = [a1 log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100043834();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

@end