@interface PowerUISmartChargeUtilities
+ (BOOL)deviceConnectedToWirelessChargerWithContext:(id)a3;
+ (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withDefaultsDomain:(id)a5;
+ (BOOL)deviceWasConnectedToChargerWithinSeconds:(double)a3 withContext:(id)a4;
+ (BOOL)doesTimeOfDayForDate:(id)a3 fallBetweenDate:(id)a4 andDate:(id)a5;
+ (BOOL)isDEoCDryRunSupported;
+ (BOOL)isDesktopDeviceWithDurations:(double *)a3 withAOEThreshold:(double)a4;
+ (BOOL)isInflowInhibitSupported;
+ (BOOL)isInternalBuild;
+ (BOOL)isOBCSupported;
+ (BOOL)isPluggedInWithContext:(id)a3;
+ (BOOL)isUltraWatch;
+ (BOOL)isWeekend:(id)a3;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)isiPod;
+ (MemoryFootprint)getMemoryUsage;
+ (double)areaOverEightyWithBatteryLevelDurations:(double *)a3;
+ (double)batteryLevelAtDate:(id)a3;
+ (double)cachedHistorical80ToFullDuration;
+ (double)percentageOfBatteryDurations:(double *)a3 aboveBatteryLevel:(double)a4;
+ (double)timestampOfFirstEventReachingBatteryLevel:(int)a3 betweenStartTime:(id)a4 andEndTime:(id)a5;
+ (double)totalPluginDurationAfter:(id)a3 withMinimumDuration:(double)a4 withPluginEvents:(id)a5;
+ (id)batteryLevelHistogramAroundTime:(id)a3 withDelta:(double)a4 withOffset:(double)a5;
+ (id)batteryProperties;
+ (id)concatenateChargeSessions:(id)a3 withMaxDeltaSecondsBetweenEvents:(unint64_t)a4;
+ (id)curentDateStringFromDate:(id)a3 withFormat:(id)a4;
+ (id)dateForPreferenceKey:(id)a3 inDomain:(id)a4;
+ (id)drainBetweenRelevantEventsBefore:(id)a3 withMinimumDuration:(double)a4;
+ (id)drainBetweenRelevantEventsFromDrainSessionInfo:(id)a3;
+ (id)drainSessionsInfoBetweenRelevantChargesBefore:(id)a3 withMinimumDuration:(double)a4;
+ (id)filterChargeSessions:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withinSeconds:(unint64_t)a6;
+ (id)getCurrentBootSessionUUID;
+ (id)getTestVector:(id)a3;
+ (id)historicalFullChargeDurationStartingAt:(int)a3 withMinimumPluginDuration:(int)a4;
+ (id)lastPluggedInDate;
+ (id)log;
+ (id)numberForPreferenceKey:(id)a3 inDomain:(id)a4;
+ (id)percentageOfTimeForBatteryLevels:(double *)a3 withLog:(id)a4;
+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 ignoringDisconnectsShorterThan:(double)a5;
+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5 ignoringDisconnectsShorterThan:(double)a6;
+ (id)readDictForPreferenceKey:(id)a3 inDomain:(id)a4;
+ (id)readStringForPreferenceKey:(id)a3 inDomain:(id)a4;
+ (id)recentEngagementHistory;
+ (id)roundedDateFromDate:(id)a3;
+ (id)timeStringFromDate:(id)a3;
+ (id)timelineEventDate:(id)a3 withDefaultsDomain:(id)a4;
+ (int64_t)currentBatteryLevelWithContext:(id)a3;
+ (unint64_t)decileClassificationWithTopBinCutOff:(float *)a3;
+ (void)getBatteryLevelDurations:(double *)a3;
+ (void)getMemoryUsage;
+ (void)lastPluggedInDate;
+ (void)logMemoryUsageInternalForEvent:(id)a3;
+ (void)mergeDrainSessionsInfo:(id)a3 intoResult:(id)a4;
+ (void)setDate:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5;
+ (void)setDict:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5;
+ (void)setNumber:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5;
+ (void)setString:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5;
@end

@implementation PowerUISmartChargeUtilities

+ (BOOL)isiPhone
{
  v2 = (void *)MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

+ (int64_t)currentBatteryLevelWithContext:(id)a3
{
  char v3 = (void *)MEMORY[0x263F351D0];
  id v4 = a3;
  v5 = [v3 keyPathForBatteryStateDataDictionary];
  v6 = [v4 objectForKeyedSubscript:v5];

  v7 = [MEMORY[0x263F351D0] batteryPercentageKey];
  v8 = [v6 objectForKeyedSubscript:v7];
  int64_t v9 = [v8 integerValue];

  return v9;
}

+ (BOOL)isPluggedInWithContext:(id)a3
{
  char v3 = (void *)MEMORY[0x263F351D0];
  id v4 = a3;
  v5 = [v3 keyPathForBatteryStateDataDictionary];
  v6 = [v4 objectForKeyedSubscript:v5];

  v7 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
  v8 = [v6 objectForKeyedSubscript:v7];
  char v9 = [v8 BOOLValue];

  return v9;
}

+ (void)logMemoryUsageInternalForEvent:(id)a3
{
  id v4 = a3;
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    uint64_t v5 = +[PowerUISmartChargeUtilities getMemoryUsage];
    uint64_t v7 = v6;
    v8 = [a1 log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](v5, v7, (uint64_t)v4, v8);
    }
  }
}

+ (id)log
{
  v2 = (void *)log_log;
  if (!log_log)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.smartcharging", "utilities");
    id v4 = (void *)log_log;
    log_log = (uint64_t)v3;

    v2 = (void *)log_log;
  }
  return v2;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_6);
  }
  return isInternalBuild_isInternalBuild;
}

+ (MemoryFootprint)getMemoryUsage
{
  int v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  *(_OWORD *)task_info_out = 0u;
  long long v8 = 0u;
  mach_msg_type_number_t task_info_outCnt = 93;
  if (task_info(*MEMORY[0x263EF8960], 0x16u, task_info_out, &task_info_outCnt))
  {
    os_log_t v3 = [a1 log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[PowerUISmartChargeUtilities getMemoryUsage]();
    }

    unint64_t v4 = -1;
    unint64_t v5 = -1;
  }
  else
  {
    unint64_t v5 = (unint64_t)v16 >> 10;
    unint64_t v4 = *((void *)&v17 + 1) / 1024;
  }
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

uint64_t __46__PowerUISmartChargeUtilities_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  isInternalBuild_isInternalBuild = result;
  return result;
}

+ (BOOL)isiPad
{
  v2 = (void *)MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

+ (BOOL)isiPod
{
  v2 = (void *)MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPod"];

  return v3;
}

+ (BOOL)isUltraWatch
{
  if (MGIsDeviceOfType()) {
    return 1;
  }
  else {
    return MGIsDeviceOfType();
  }
}

+ (BOOL)isOBCSupported
{
  v2 = objc_opt_class();
  return [v2 isiPhone];
}

+ (BOOL)isInflowInhibitSupported
{
  return 0;
}

+ (BOOL)isDEoCDryRunSupported
{
  return +[PowerUISmartChargeUtilities isiPhone];
}

+ (id)getCurrentBootSessionUUID
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  size_t size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  char v3 = malloc_type_malloc(size, 0x4B0C34FBuLL);
  sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0);
  unint64_t v4 = [NSString stringWithUTF8String:v3];
  free(v3);
  unint64_t v5 = [a1 log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v9 = v4;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Current boot session UUID: %@", buf, 0xCu);
  }

  return v4;
}

+ (void)getBatteryLevelDurations:(double *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__2;
  long long v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  unint64_t v5 = BiomeLibrary();
  uint64_t v6 = [v5 Device];
  uint64_t v7 = [v6 Power];
  long long v8 = [v7 BatteryLevel];
  long long v9 = [v8 publisher];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke;
  v22[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v22[4] = a1;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_22;
  v21[3] = &unk_2645A6060;
  v21[4] = &v23;
  v21[5] = a1;
  v21[6] = a3;
  id v10 = (id)[v9 sinkWithCompletion:v22 receiveInput:v21];

  if (v24[5])
  {
    long long v11 = [MEMORY[0x263EFF910] date];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;
    [(id)v24[5] timestamp];
    double v15 = v14;

    long long v16 = [(id)v24[5] eventBody];
    [v16 batteryPercentage];
    double v18 = v17;

    if ((unint64_t)(uint64_t)v18 >= 0x65)
    {
      long long v19 = [a1 log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        long long v20 = [NSNumber numberWithInteger:(uint64_t)v18];
        +[PowerUISmartChargeUtilities getBatteryLevelDurations:v19];
      }
    }
    else
    {
      a3[(uint64_t)v18] = v13 - v15 + a3[(uint64_t)v18];
    }
  }
  _Block_object_dispose(&v23, 8);
}

void __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    unint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_cold_1(v3);
    }
  }
}

void __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_22(uint64_t a1, void *a2)
{
  id v4 = a2;
  unint64_t v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(void *)(v6 + 40)) {
    goto LABEL_4;
  }
  [v4 timestamp];
  double v8 = v7;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timestamp];
  double v10 = v9;
  long long v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
  [v11 batteryPercentage];
  unint64_t v13 = (uint64_t)v12;

  if (v13 < 0x65)
  {
    *(double *)(*(void *)(a1 + 48) + 8 * v13) = v8 - v10 + *(double *)(*(void *)(a1 + 48) + 8 * v13);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v6 + 40), a2);
    goto LABEL_8;
  }
  double v14 = [*(id *)(a1 + 40) log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_22_cold_1(v13);
  }

LABEL_8:
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
  double v8 = [a1 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[PowerUISmartChargeUtilities percentageOfBatteryDurations:aboveBatteryLevel:]();
  }

  return 0.0;
}

+ (double)areaOverEightyWithBatteryLevelDurations:(double *)a3
{
  bzero(a3, 0x328uLL);
  +[PowerUISmartChargeUtilities getBatteryLevelDurations:a3];
  +[PowerUISmartChargeUtilities percentageOfBatteryDurations:a3 aboveBatteryLevel:75.0];
  return result;
}

+ (BOOL)isDesktopDeviceWithDurations:(double *)a3 withAOEThreshold:(double)a4
{
  return 0;
}

+ (id)percentageOfTimeForBatteryLevels:(double *)a3 withLog:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
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
      [v6 setObject:&unk_26D3852E8 atIndexedSubscript:i];
    }
    else
    {
      unint64_t v13 = [NSNumber numberWithDouble:v12 / v8];
      [v6 setObject:v13 atIndexedSubscript:i];

      double v14 = v5;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = [NSNumber numberWithInt:i];
        long long v16 = [NSNumber numberWithDouble:v12];
        *(_DWORD *)buf = 138412546;
        long long v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "Quartile %@: %@", buf, 0x16u);
      }
    }
  }
  double v17 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = [NSNumber numberWithDouble:v8];
    *(_DWORD *)buf = 138412546;
    long long v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v18;
    _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "Desktop Quartile Bins %@ with totalDuration %@", buf, 0x16u);
  }
  return v6;
}

+ (unint64_t)decileClassificationWithTopBinCutOff:(float *)a3
{
  v12[101] = *MEMORY[0x263EF8340];
  bzero(v12, 0x328uLL);
  [a1 getBatteryLevelDurations:v12];
  id v5 = [a1 log];
  double v6 = [a1 percentageOfTimeForBatteryLevels:v12 withLog:v5];

  uint64_t v7 = [v6 objectAtIndexedSubscript:3];
  [v7 floatValue];
  float v9 = v8;

  unint64_t v10 = 0;
  while (v9 <= a3[v10] || v9 > a3[v10 + 1])
  {
    if (++v10 == 11)
    {
      unint64_t v10 = 0;
      break;
    }
  }

  return v10;
}

+ (BOOL)deviceWasConnectedToChargerWithinSeconds:(double)a3 withContext:(id)a4
{
  id v5 = a4;
  double v6 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  float v8 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
  float v9 = [v7 objectForKeyedSubscript:v8];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    long long v11 = [MEMORY[0x263F351D0] batteryExternalConnectedChangeDateKey];
    double v12 = [v7 objectForKeyedSubscript:v11];

    if (!v12)
    {
      unint64_t v13 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
      double v12 = [v5 lastModifiedDateForContextualKeyPath:v13];
    }
    double v14 = [MEMORY[0x263EFF910] date];
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
  id v3 = (void *)MEMORY[0x263F351D0];
  id v4 = a3;
  id v5 = [v3 keyPathForBatteryStateDataDictionary];
  double v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [MEMORY[0x263F351D0] batteryAdapterIsWirelessKey];
  float v8 = [v6 objectForKeyedSubscript:v7];
  char v9 = [v8 BOOLValue];

  return v9;
}

+ (id)roundedDateFromDate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  double v6 = [v5 components:124 fromDate:v4];

  uint64_t v7 = (uint64_t)((double)([v6 minute] / 30 + 1) * 30.0);
  [v6 setMinute:0];
  float v8 = [v5 dateFromComponents:v6];
  char v9 = [v8 dateByAddingTimeInterval:(double)(60 * v7)];

  return v9;
}

+ (id)timeStringFromDate:(id)a3
{
  uint64_t v3 = timeStringFromDate__onceToken_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&timeStringFromDate__onceToken_0, &__block_literal_global_30_0);
  }
  id v5 = [(id)timeStringFromDate__formatter_0 stringFromDate:v4];

  return v5;
}

uint64_t __50__PowerUISmartChargeUtilities_timeStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)timeStringFromDate__formatter_0;
  timeStringFromDate__formatter_0 = (uint64_t)v0;

  [(id)timeStringFromDate__formatter_0 setDateStyle:1];
  v2 = (void *)timeStringFromDate__formatter_0;
  return [v2 setTimeStyle:1];
}

+ (BOOL)isWeekend:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  char v6 = [v5 isDateInWeekend:v4];

  return v6;
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 ignoringDisconnectsShorterThan:(double)a5
{
  id v25 = a3;
  uint64_t v23 = (void *)os_transaction_create();
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__2;
  v38 = __Block_byref_object_dispose__2;
  id v39 = [MEMORY[0x263EFF980] array];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__2;
  v32[4] = __Block_byref_object_dispose__2;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__2;
  v30[4] = __Block_byref_object_dispose__2;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__2;
  v28[4] = __Block_byref_object_dispose__2;
  id v29 = 0;
  id v7 = objc_alloc(MEMORY[0x263F2A8B0]);
  float v8 = [v25 dateByAddingTimeInterval:-5184000.0];
  char v9 = (void *)[v7 initWithStartDate:v8 endDate:v25 maxEvents:0 lastN:0 reversed:0];

  long long v24 = BiomeLibrary();
  int v10 = [v24 Device];
  long long v11 = [v10 Power];
  double v12 = [v11 PluggedIn];
  unint64_t v13 = [v12 publisherWithOptions:v9];
  double v14 = BiomeLibrary();
  double v15 = [v14 Device];
  double v16 = [v15 TimeZone];
  BOOL v17 = [v16 publisherWithOptions:v9];
  double v18 = [v13 orderedMergeWithOther:v17 comparator:&__block_literal_global_36];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2;
  v27[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v27[4] = a1;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_37;
  v26[3] = &unk_2645A6088;
  v26[4] = v28;
  v26[5] = v30;
  v26[6] = v32;
  v26[7] = &v34;
  *(double *)&v26[8] = a5;
  *(double *)&v26[9] = a4;
  id v19 = (id)[v18 sinkWithCompletion:v27 receiveInput:v26];

  id v20 = (id)v35[5];
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  return v20;
}

uint64_t __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  char v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  int v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

void __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2_cold_1(v3);
    }
  }
}

void __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_37(uint64_t a1, void *a2)
{
  id v36 = a2;
  id v3 = (void *)MEMORY[0x223C80A30]();
  id v4 = [v36 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v36;
    id v8 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v7;
    goto LABEL_18;
  }
  id v8 = v36;
  double v9 = [v8 eventBody];
  if ([v9 starting])
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

    if (!v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = v8;
      unint64_t v13 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v12;
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v13 = [v8 eventBody];
  if (([v13 starting] & 1) == 0)
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

    if (!v14) {
      goto LABEL_18;
    }
    double v15 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
    double v16 = 0.0;
    if ([v15 hasSecondsFromGMT])
    {
      BOOL v17 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
      [v17 secondsFromGMT];
      double v16 = v18;
    }
    id v19 = (void *)MEMORY[0x263EFF910];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timestamp];
    unint64_t v13 = [v19 dateWithTimeIntervalSinceReferenceDate:v16 + v20];
    long long v21 = (void *)MEMORY[0x263EFF910];
    [v8 timestamp];
    uint64_t v23 = [v21 dateWithTimeIntervalSinceReferenceDate:v16 + v22];
    long long v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v24)
    {
      id v25 = [v24 endDate];
      [v13 timeIntervalSinceDate:v25];
      double v27 = v26;
      double v28 = *(double *)(a1 + 64);

      if (v27 < v28)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];

        unint64_t v13 = (void *)v29;
      }
    }
    uint64_t v30 = [[PowerUIChargeSession alloc] initWithStartDate:v13 withEndDate:v23 withStartSoC:0 withEndSoC:0];
    uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
    v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;

    [v23 timeIntervalSinceDate:v13];
    if (v33 >= *(double *)(a1 + 72)) {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
    uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8);
    v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = 0;
  }
LABEL_17:

LABEL_18:
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5 ignoringDisconnectsShorterThan:(double)a6
{
  v52[2] = *MEMORY[0x263EF8340];
  id v33 = a3;
  long long v24 = (void *)os_transaction_create();
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__2;
  v50 = __Block_byref_object_dispose__2;
  id v51 = [MEMORY[0x263EFF980] array];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__2;
  v44[4] = __Block_byref_object_dispose__2;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__2;
  v42[4] = __Block_byref_object_dispose__2;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__2;
  v40[4] = __Block_byref_object_dispose__2;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__2;
  v38[4] = __Block_byref_object_dispose__2;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  int v37 = -1;
  id v9 = objc_alloc(MEMORY[0x263F2A8B0]);
  uint64_t v10 = [v33 dateByAddingTimeInterval:-5184000.0];
  uint64_t v11 = (void *)[v9 initWithStartDate:v10 endDate:v33 maxEvents:0 lastN:0 reversed:0];

  v32 = BiomeLibrary();
  uint64_t v31 = [v32 Device];
  uint64_t v30 = [v31 Power];
  uint64_t v29 = [v30 PluggedIn];
  double v26 = [v29 publisherWithOptions:v11];
  double v28 = BiomeLibrary();
  double v27 = [v28 Device];
  id v12 = [v27 TimeZone];
  unint64_t v13 = [v12 publisherWithOptions:v11];
  v52[0] = v13;
  uint64_t v14 = BiomeLibrary();
  double v15 = [v14 Device];
  double v16 = [v15 Power];
  BOOL v17 = [v16 BatteryLevel];
  double v18 = [v17 publisherWithOptions:v11];
  v52[1] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
  double v20 = [v26 orderedMergeWithOthers:v19 comparator:&__block_literal_global_43];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_2;
  v35[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v35[4] = a1;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_44;
  v34[3] = &unk_2645A60B0;
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
  id v21 = (id)[v20 sinkWithCompletion:v35 receiveInput:v34];

  id v22 = (id)v47[5];
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

  return v22;
}

uint64_t __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

void __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2_cold_1(v3);
    }
  }
}

void __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_44(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = (void *)MEMORY[0x223C80A30]();
  uint64_t v6 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    double v9 = [v4 eventBody];
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if (v10)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      goto LABEL_5;
    }
    id v11 = v4;
    id v12 = [v11 eventBody];
    if ([v12 starting])
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

      if (!v13)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
        [v14 batteryPercentage];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (int)v15;
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v14 = [v11 eventBody];
    if (([v14 starting] & 1) == 0)
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

      if (v16)
      {
        BOOL v17 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
        double v18 = 0.0;
        if ([v17 hasSecondsFromGMT])
        {
          id v19 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
          [v19 secondsFromGMT];
          double v18 = v20;
        }
        id v21 = (void *)MEMORY[0x263EFF910];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timestamp];
        uint64_t v23 = [v21 dateWithTimeIntervalSinceReferenceDate:v18 + v22];
        long long v24 = (void *)MEMORY[0x263EFF910];
        [v11 timestamp];
        double v26 = [v24 dateWithTimeIntervalSinceReferenceDate:v18 + v25];
        double v27 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v27)
        {
          double v28 = [v27 endDate];
          [v23 timeIntervalSinceDate:v28];
          double v30 = v29;
          double v31 = *(double *)(a1 + 80);

          if (v30 < v31)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            uint64_t v32 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) startDate];

            id v33 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) startSoC];
            *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v33 intValue];

            uint64_t v23 = (void *)v32;
          }
        }
        uint64_t v34 = [PowerUIChargeSession alloc];
        v35 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
        id v36 = NSNumber;
        int v37 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
        [v37 batteryPercentage];
        v38 = objc_msgSend(v36, "numberWithDouble:");
        uint64_t v39 = [(PowerUIChargeSession *)v34 initWithStartDate:v23 withEndDate:v26 withStartSoC:v35 withEndSoC:v38];
        uint64_t v40 = *(void *)(*(void *)(a1 + 64) + 8);
        id v41 = *(void **)(v40 + 40);
        *(void *)(v40 + 40) = v39;

        [v26 timeIntervalSinceDate:v23];
        if (v42 >= *(double *)(a1 + 88))
        {
          id v43 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
          [v43 batteryPercentage];
          double v45 = v44;
          double v46 = *(double *)(a1 + 96);

          if (v45 >= v46)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            v47 = [*(id *)(a1 + 104) log];
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
              __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_44_cold_1(a1 + 64, v47);
            }
          }
        }
        uint64_t v48 = *(void *)(*(void *)(a1 + 48) + 8);
        v49 = *(void **)(v48 + 40);
        *(void *)(v48 + 40) = 0;

        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -1;
      }
      goto LABEL_24;
    }
LABEL_11:

LABEL_24:
    goto LABEL_25;
  }
  uint64_t v8 = *(void *)(a1 + 32);
LABEL_5:
  objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), a2);
LABEL_25:
}

+ (id)drainBetweenRelevantEventsBefore:(id)a3 withMinimumDuration:(double)a4
{
  id v5 = [a1 drainSessionsInfoBetweenRelevantChargesBefore:a3 withMinimumDuration:a4];
  uint64_t v6 = [a1 drainBetweenRelevantEventsFromDrainSessionInfo:v5];

  return v6;
}

+ (id)drainBetweenRelevantEventsFromDrainSessionInfo:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "objectForKey:", @"drain_depth", (void)v14);

        if (v11)
        {
          id v12 = [v10 objectForKeyedSubscript:@"drain_depth"];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)curentDateStringFromDate:(id)a3 withFormat:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F08790];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setDateFormat:v6];

  double v9 = [v8 stringFromDate:v7];

  return v9;
}

+ (id)drainSessionsInfoBetweenRelevantChargesBefore:(id)a3 withMinimumDuration:(double)a4
{
  v70[2] = *MEMORY[0x263EF8340];
  id v32 = a3;
  uint64_t v23 = (void *)os_transaction_create();
  id v24 = (id)objc_opt_new();
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__2;
  v68 = __Block_byref_object_dispose__2;
  id v69 = (id)objc_opt_new();
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  char v59 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__2;
  v56 = __Block_byref_object_dispose__2;
  id v57 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__2;
  v50[4] = __Block_byref_object_dispose__2;
  id v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__2;
  v48[4] = __Block_byref_object_dispose__2;
  id v49 = 0;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  double v45 = __Block_byref_object_copy__2;
  double v46 = __Block_byref_object_dispose__2;
  id v47 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__2;
  v40[4] = __Block_byref_object_dispose__2;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__2;
  v38[4] = __Block_byref_object_dispose__2;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  void v36[3] = __Block_byref_object_copy__2;
  v36[4] = __Block_byref_object_dispose__2;
  id v37 = 0;
  id v5 = objc_alloc(MEMORY[0x263F2A8B0]);
  id v6 = [v32 dateByAddingTimeInterval:-5184000.0];
  id v33 = (void *)[v5 initWithStartDate:v6 endDate:v32 maxEvents:0 lastN:0 reversed:0];

  double v31 = BiomeLibrary();
  double v30 = [v31 Device];
  double v29 = [v30 Power];
  double v28 = [v29 PluggedIn];
  double v25 = [v28 publisherWithOptions:v33];
  double v27 = BiomeLibrary();
  id v7 = [v27 Device];
  id v8 = [v7 Power];
  double v9 = [v8 BatteryLevel];
  char v10 = [v9 publisherWithOptions:v33];
  v70[0] = v10;
  id v11 = BiomeLibrary();
  id v12 = [v11 Device];
  uint64_t v13 = [v12 TimeZone];
  long long v14 = [v13 publisherWithOptions:v33];
  v70[1] = v14;
  long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
  long long v16 = [v25 orderedMergeWithOthers:v15 comparator:&__block_literal_global_51];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_2;
  v35[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v35[4] = a1;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_52;
  v34[3] = &unk_2645A60D8;
  v34[4] = v36;
  v34[5] = &v52;
  v34[6] = &v60;
  v34[7] = &v42;
  v34[8] = v58;
  v34[9] = v38;
  v34[10] = v50;
  v34[11] = &v64;
  *(double *)&void v34[14] = a4;
  v34[12] = v40;
  v34[13] = v48;
  id v17 = (id)[v16 sinkWithCompletion:v35 receiveInput:v34];

  if ([(id)v65[5] count] && v53[5] && !v43[5] && v61[3] >= 1)
  {
    double v18 = [(id)v65[5] lastObject];
    uint64_t v19 = [NSNumber numberWithLong:v61[3]];
    [v18 setObject:v19 forKeyedSubscript:@"drain_depth"];

    double v20 = (void *)MEMORY[0x263EFF910];
    [(id)v53[5] timestamp];
    id v21 = objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
    [v18 setObject:v21 forKeyedSubscript:@"drain_end"];
  }
  [a1 mergeDrainSessionsInfo:v65[5] intoResult:v24];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

  return v24;
}

uint64_t __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  char v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

void __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_2_cold_1(v3);
    }
  }
}

void __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_52(uint64_t a1, void *a2)
{
  id v72 = a2;
  id v4 = (void *)MEMORY[0x223C80A30]();
  id v5 = [v72 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = v72;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
LABEL_3:

    goto LABEL_4;
  }
  char v10 = [v72 eventBody];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    id v9 = v72;
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(*(void *)(v12 + 8) + 40);
    if (v13)
    {
      long long v14 = [v13 eventBody];
      [v14 batteryPercentage];
      double v16 = v15;
      id v17 = [v9 eventBody];
      [v17 batteryPercentage];
      double v19 = v18;

      uint64_t v12 = *(void *)(a1 + 40);
      if (v16 > v19)
      {
        double v20 = [*(id *)(*(void *)(v12 + 8) + 40) eventBody];
        [v20 batteryPercentage];
        double v22 = v21;
        uint64_t v23 = [v9 eventBody];
        [v23 batteryPercentage];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (uint64_t)(v22
                                                                              - v24
                                                                              + (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));

        uint64_t v12 = *(void *)(a1 + 40);
      }
    }
    objc_storeStrong((id *)(*(void *)(v12 + 8) + 40), a2);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      double v25 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
      [v25 batteryPercentage];
      double v27 = v26;

      if (v27 >= 80.0) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    goto LABEL_3;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      v61 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) eventBody];
      int v62 = [v61 starting];

      uint64_t v63 = *(void *)(a1 + 56);
      if (v62)
      {
        objc_storeStrong((id *)(*(void *)(v63 + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
        if ([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count])
        {
          id v9 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) lastObject];
          uint64_t v64 = [NSNumber numberWithLong:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
          [v9 setObject:v64 forKeyedSubscript:@"drain_depth"];

          v65 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
          double v66 = 0.0;
          if ([v65 hasSecondsFromGMT])
          {
            v67 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
            [v67 secondsFromGMT];
            double v66 = v68;
          }
          id v69 = (void *)MEMORY[0x263EFF910];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timestamp];
          v71 = [v69 dateWithTimeIntervalSinceReferenceDate:v66 + v70];
          [v9 setObject:v71 forKeyedSubscript:@"drain_end"];

          goto LABEL_3;
        }
        goto LABEL_4;
      }
      if (!*(void *)(*(void *)(v63 + 8) + 40)) {
        goto LABEL_4;
      }
    }
    double v28 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) eventBody];
    char v29 = [v28 starting];

    if ((v29 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      double v30 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
      double v31 = 0.0;
      if ([v30 hasSecondsFromGMT])
      {
        id v32 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
        [v32 secondsFromGMT];
        double v31 = v33;
      }
      uint64_t v34 = (void *)MEMORY[0x263EFF910];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timestamp];
      id v9 = [v34 dateWithTimeIntervalSinceReferenceDate:v31 + v35];
      id v36 = (void *)MEMORY[0x263EFF910];
      [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) timestamp];
      v38 = [v36 dateWithTimeIntervalSinceReferenceDate:v31 + v37];
      [v38 timeIntervalSinceDate:v9];
      if (v39 >= *(double *)(a1 + 112))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
        uint64_t v40 = objc_opt_new();
        [v40 setObject:v9 forKeyedSubscript:@"start"];
        [v40 setObject:v38 forKeyedSubscript:@"end"];
        id v41 = NSNumber;
        [v38 timeIntervalSinceDate:v9];
        uint64_t v42 = objc_msgSend(v41, "numberWithDouble:");
        [v40 setObject:v42 forKeyedSubscript:@"charge_duration"];

        id v43 = NSNumber;
        uint64_t v44 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
        [v44 batteryPercentage];
        double v45 = objc_msgSend(v43, "numberWithDouble:");
        [v40 setObject:v45 forKeyedSubscript:@"charge_end_soc"];

        double v46 = NSNumber;
        id v47 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) eventBody];
        [v47 batteryPercentage];
        uint64_t v48 = objc_msgSend(v46, "numberWithDouble:");
        [v40 setObject:v48 forKeyedSubscript:@"charge_start_soc"];

        [v40 setObject:&unk_26D3852E8 forKeyedSubscript:@"drain_depth"];
        [v40 setObject:&unk_26D3852E8 forKeyedSubscript:@"drain_duration"];
        id v49 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
        [v40 setObject:v49 forKeyedSubscript:@"relevant_charge_session"];

        v50 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) eventBody];
        [v50 batteryPercentage];
        double v52 = v51;

        if (v52 <= 0.0) {
          [v40 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"relevant_charge_session"];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObject:v40];
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v53 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v54 = *(void **)(v53 + 40);
      *(void *)(v53 + 40) = 0;

      uint64_t v55 = *(void *)(*(void *)(a1 + 96) + 8);
      v56 = *(void **)(v55 + 40);
      *(void *)(v55 + 40) = 0;

      uint64_t v57 = *(void *)(*(void *)(a1 + 80) + 8);
      v58 = *(void **)(v57 + 40);
      *(void *)(v57 + 40) = 0;

      uint64_t v59 = *(void *)(*(void *)(a1 + 104) + 8);
      uint64_t v60 = *(void **)(v59 + 40);
      *(void *)(v59 + 40) = 0;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_3;
    }
  }
LABEL_4:
}

+ (void)mergeDrainSessionsInfo:(id)a3 intoResult:(id)a4
{
  id v65 = a3;
  id v61 = a4;
  id v5 = objc_opt_new();
  if ([v65 count])
  {
    uint64_t v6 = 0;
    int v7 = 0;
    id v8 = 0;
    do
    {
      id v9 = v8;
      char v10 = objc_msgSend(v65, "objectAtIndexedSubscript:", v6, v61);
      id v8 = (void *)[v10 mutableCopy];

      char v11 = [v8 objectForKeyedSubscript:@"relevant_charge_session"];
      int v12 = [v11 BOOLValue];

      unint64_t v13 = v7;
      if ([v65 count] > (unint64_t)v7)
      {
        long long v14 = v65;
        while (1)
        {
          double v15 = [v14 objectAtIndexedSubscript:v13];
          double v16 = [v15 objectForKeyedSubscript:@"drain_depth"];
          uint64_t v17 = [v16 integerValue];

          if (v17) {
            break;
          }
          double v18 = [v65 objectAtIndexedSubscript:v13];
          double v19 = [v18 objectForKeyedSubscript:@"relevant_charge_session"];
          v12 |= [v19 BOOLValue];

          ++v13;
          ++v7;
          BOOL v20 = [v65 count] > v13;
          long long v14 = v65;
          if (!v20) {
            goto LABEL_9;
          }
        }
      }
      long long v14 = v65;
LABEL_9:
      if ([v14 count] <= v13) {
        break;
      }
      double v21 = [v65 objectAtIndexedSubscript:v13];
      double v22 = [v21 objectForKeyedSubscript:@"charge_end_soc"];
      [v8 setObject:v22 forKeyedSubscript:@"charge_end_soc"];

      uint64_t v23 = [v65 objectAtIndexedSubscript:v13];
      double v24 = [v23 objectForKeyedSubscript:@"end"];
      [v8 setObject:v24 forKeyedSubscript:@"end"];

      double v25 = NSNumber;
      double v26 = [v8 objectForKeyedSubscript:@"end"];
      double v27 = [v8 objectForKeyedSubscript:@"start"];
      [v26 timeIntervalSinceDate:v27];
      double v28 = objc_msgSend(v25, "numberWithDouble:");
      [v8 setObject:v28 forKeyedSubscript:@"charge_duration"];

      char v29 = [v65 objectAtIndexedSubscript:v13];
      double v30 = [v29 objectForKeyedSubscript:@"drain_depth"];
      [v8 setObject:v30 forKeyedSubscript:@"drain_depth"];

      double v31 = [v65 objectAtIndexedSubscript:v13];
      id v32 = [v31 objectForKeyedSubscript:@"drain_end"];
      [v8 setObject:v32 forKeyedSubscript:@"drain_end"];

      double v33 = [NSNumber numberWithBool:v12 & 1];
      [v8 setObject:v33 forKeyedSubscript:@"relevant_charge_session"];

      [v5 addObject:v8];
      uint64_t v6 = ++v7;
    }
    while ([v65 count] > (unint64_t)v7);
  }
  else
  {
    id v8 = 0;
  }
  if (!objc_msgSend(v5, "count", v61))
  {
    uint64_t v60 = v8;
    id v36 = v62;
    goto LABEL_28;
  }
  unint64_t v34 = 0;
  int v35 = 0;
  id v36 = v62;
  do
  {
    double v37 = [v5 objectAtIndexedSubscript:v34];
    v38 = (void *)[v37 mutableCopy];

    double v39 = [v38 objectForKeyedSubscript:@"drain_depth"];
    uint64_t v40 = [v39 integerValue];

    uint64_t v64 = v38;
    id v41 = [v38 objectForKeyedSubscript:@"drain_end"];
    int v42 = v35 + 1;
    unint64_t v34 = v42;
    if ([v5 count] <= (unint64_t)v42)
    {
      int v63 = v42;
      int v43 = 0;
      goto LABEL_25;
    }
    int v43 = 0;
    while (1)
    {
      uint64_t v44 = [v5 objectAtIndexedSubscript:v34];
      double v45 = [v44 objectForKeyedSubscript:@"relevant_charge_session"];
      if (([v45 BOOLValue] & 1) == 0)
      {

        goto LABEL_21;
      }
      double v46 = [v5 objectAtIndexedSubscript:v34];
      id v47 = [v46 objectForKeyedSubscript:@"charge_start_soc"];
      uint64_t v48 = [v47 integerValue];

      if (v48 > 0) {
        break;
      }
LABEL_21:
      id v49 = [v5 objectAtIndexedSubscript:v34];
      v50 = [v49 objectForKeyedSubscript:@"drain_depth"];
      v40 += [v50 integerValue];

      double v51 = [v5 objectAtIndexedSubscript:v34];
      uint64_t v54 = [v51 objectForKeyedSubscript:@"drain_end"];

      double v52 = [v5 objectAtIndexedSubscript:v34];
      uint64_t v53 = [v52 objectForKeyedSubscript:@"charge_duration"];
      v43 += [v53 integerValue];

      ++v34;
      id v41 = (void *)v54;
      if ([v5 count] <= v34) {
        goto LABEL_24;
      }
    }
    uint64_t v54 = (uint64_t)v41;
LABEL_24:
    int v63 = v34;
    unint64_t v34 = (int)v34;
    id v41 = (void *)v54;
    id v36 = v62;
LABEL_25:
    uint64_t v55 = [NSNumber numberWithLong:v40];
    [v64 setObject:v55 forKeyedSubscript:@"drain_depth"];

    [v64 setObject:v41 forKeyedSubscript:@"drain_end"];
    v56 = NSNumber;
    uint64_t v57 = [v64 objectForKeyedSubscript:@"end"];
    [v41 timeIntervalSinceDate:v57];
    uint64_t v59 = [v56 numberWithDouble:v58 - (double)v43];
    [v64 setObject:v59 forKeyedSubscript:@"drain_duration"];

    uint64_t v60 = v64;
    [v36 addObject:v64];

    id v8 = v64;
    int v35 = v63;
  }
  while ([v5 count] > v34);
LABEL_28:
}

+ (double)timestampOfFirstEventReachingBatteryLevel:(int)a3 betweenStartTime:(id)a4 andEndTime:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v25 = 0;
  double v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:v7 endDate:v8 maxEvents:0 lastN:0 reversed:0];
  char v10 = BiomeLibrary();
  char v11 = [v10 Device];
  int v12 = [v11 Power];
  unint64_t v13 = [v12 BatteryLevel];
  long long v14 = [v13 publisherWithOptions:v9];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke;
  v23[3] = &__block_descriptor_36_e22_B16__0__BMStoreEvent_8l;
  int v24 = a3;
  double v15 = [v14 filterWithIsIncluded:v23];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_2;
  v22[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v22[4] = a1;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_80;
  v20[3] = &unk_2645A6120;
  int v21 = a3;
  v20[4] = &v25;
  id v16 = (id)[v15 sinkWithCompletion:v22 shouldContinue:v20];

  double v17 = v26[3];
  _Block_object_dispose(&v25, 8);

  return v17;
}

BOOL __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  [v3 batteryPercentage];
  BOOL v5 = v4 >= (double)*(int *)(a1 + 32);

  return v5;
}

void __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    double v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_2_cold_1(v3);
    }
  }
}

BOOL __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 eventBody];
  [v4 batteryPercentage];
  double v6 = v5;
  double v7 = (double)*(int *)(a1 + 40);

  if (v6 >= v7)
  {
    [v3 timestamp];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  }

  return v6 < v7;
}

+ (id)historicalFullChargeDurationStartingAt:(int)a3 withMinimumPluginDuration:(int)a4
{
  if (a3 > 79)
  {
    uint64_t v25 = 0;
    v26[0] = &v25;
    v26[1] = 0x3032000000;
    v26[2] = __Block_byref_object_copy__2;
    v26[3] = __Block_byref_object_dispose__2;
    id v27 = [MEMORY[0x263EFF980] array];
    context = (void *)MEMORY[0x223C80A30]();
    v24[0] = 0;
    v24[1] = v24;
    _OWORD v24[2] = 0x2020000000;
    v24[3] = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    id v9 = BiomeLibrary();
    char v10 = [v9 Device];
    char v11 = [v10 Charging];
    int v12 = [v11 SmartCharging];
    unint64_t v13 = [v12 publisher];
    long long v14 = [v13 filterWithIsIncluded:&__block_literal_global_82];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_2;
    v22[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
    v22[4] = a1;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_83;
    v19[3] = &unk_2645A6148;
    v19[4] = v24;
    v19[5] = v23;
    int v20 = a3;
    int v21 = a4;
    v19[6] = &v25;
    id v15 = (id)[v14 sinkWithCompletion:v22 receiveInput:v19];

    id v16 = [a1 log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:]((uint64_t)v26, v16);
    }

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v24, 8);
    double v6 = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(v26[0] + 40)];
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    double v5 = [a1 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:]();
    }

    double v6 = (void *)MEMORY[0x263EFFA68];
  }
  return v6;
}

BOOL __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 eventBody];
  if ([v3 obcEvent] == 6)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [v2 eventBody];
    if ([v5 obcEvent] == 12)
    {
      BOOL v4 = 1;
    }
    else
    {
      double v6 = [v2 eventBody];
      if ([v6 obcEvent] == 7)
      {
        BOOL v4 = 1;
      }
      else
      {
        double v7 = [v2 eventBody];
        if ([v7 obcEvent] == 9)
        {
          BOOL v4 = 1;
        }
        else
        {
          uint64_t v8 = [v2 eventBody];
          BOOL v4 = [v8 obcEvent] == 10;
        }
      }
    }
  }

  return v4;
}

void __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    BOOL v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_2_cold_1(v3);
    }
  }
}

void __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_83(uint64_t a1, void *a2)
{
  id v29 = a2;
  id v3 = [v29 eventBody];
  int v4 = [v3 obcEvent];

  if (v4 == 12)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_11;
  }
  double v5 = [v29 eventBody];
  int v6 = [v5 obcEvent];

  double v7 = [v29 eventBody];
  uint64_t v8 = v7;
  if (v6 == 6)
  {
    int v9 = [v7 batteryLevel];
    int v10 = *(_DWORD *)(a1 + 56);

    if (v9 > v10) {
      goto LABEL_11;
    }
    [v29 timestamp];
    uint64_t v12 = *(void *)(a1 + 40);
    goto LABEL_10;
  }
  if ([v7 obcEvent] == 7)
  {

    unint64_t v13 = v29;
LABEL_9:
    [v13 timestamp];
    uint64_t v12 = *(void *)(a1 + 32);
LABEL_10:
    *(void *)(*(void *)(v12 + 8) + 24) = v11;
    goto LABEL_11;
  }
  long long v14 = [v29 eventBody];
  int v15 = [v14 obcEvent];

  unint64_t v13 = v29;
  if (v15 == 9) {
    goto LABEL_9;
  }
  id v16 = [v29 eventBody];
  if ([v16 obcEvent] != 10) {
    goto LABEL_21;
  }
  double v17 = [v29 eventBody];
  if ([v17 batteryLevel] != 100
    || *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0.0)
  {

    goto LABEL_21;
  }
  double v18 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  if (v18 != 0.0)
  {
    uint64_t v19 = *(unsigned int *)(a1 + 56);
    int v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
    int v21 = (void *)MEMORY[0x263EFF910];
    [v29 timestamp];
    double v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
    +[PowerUISmartChargeUtilities timestampOfFirstEventReachingBatteryLevel:v19 betweenStartTime:v20 andEndTime:v22];
    double v24 = v23;

    [v29 timestamp];
    if (v25 - *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > (double)*(int *)(a1 + 60))
    {
      double v26 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v27 = NSNumber;
      [v29 timestamp];
      id v16 = [v27 numberWithDouble:v28 - v24];
      [v26 addObject:v16];
LABEL_21:
    }
  }
LABEL_11:
}

+ (double)cachedHistorical80ToFullDuration
{
  if (cachedHistorical80ToFullDuration_onceToken != -1) {
    dispatch_once(&cachedHistorical80ToFullDuration_onceToken, &__block_literal_global_85);
  }
  return *(double *)&cachedHistorical80ToFullDuration_eightyToFullDuration;
}

void __63__PowerUISmartChargeUtilities_cachedHistorical80ToFullDuration__block_invoke()
{
  id v4 = +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:80 withMinimumPluginDuration:300];
  if ((unint64_t)[v4 count] < 3)
  {
    id v2 = v4;
  }
  else
  {
    id v0 = [v4 sortedArrayUsingSelector:sel_compare_];
    uint64_t v1 = objc_msgSend(v0, "subarrayWithRange:", 1, objc_msgSend(v0, "count") - 2);

    id v2 = (void *)v1;
  }
  id v5 = v2;
  [v2 percentile:0.9];
  *(double *)&cachedHistorical80ToFullDuration_eightyToFullDuration = v3 / 60.0;
}

+ (id)batteryProperties
{
  mach_port_t v2 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v3 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    CFMutableDictionaryRef properties = 0;
    IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    CFMutableDictionaryRef v6 = properties;
    double v7 = (void *)[(__CFDictionary *)properties copy];

    IOObjectRelease(v5);
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

+ (id)concatenateChargeSessions:(id)a3 withMaxDeltaSecondsBetweenEvents:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((unint64_t)[v5 count] > 1)
  {
    id v37 = a1;
    double v7 = [v5 reverseObjectEnumerator];
    id v6 = [v7 allObjects];

    id v41 = [MEMORY[0x263EFF980] array];
    int v8 = [v6 count];
    LODWORD(v9) = v8 - 1;
    if (v8 >= 2)
    {
      do
      {
        uint64_t v10 = v9;
        do
        {
          uint64_t v11 = [v6 objectAtIndexedSubscript:v10];
          uint64_t v12 = [MEMORY[0x263EFF9D0] null];
          if ([v11 isEqual:v12])
          {

            int v13 = v10;
          }
          else
          {
            long long v14 = [v6 objectAtIndexedSubscript:v10];

            int v13 = v10;
            if (v14) {
              goto LABEL_10;
            }
          }
          --v10;
        }
        while (v13 > 0);
        LODWORD(v10) = -1;
LABEL_10:
        LODWORD(v9) = v10 - 1;
        if ((int)v10 < 1)
        {
LABEL_18:
          if ((v9 & 0x80000000) == 0)
          {
            uint64_t v9 = v9;
            while (1)
            {
              uint64_t v19 = [v6 objectAtIndexedSubscript:v9];
              int v20 = [v19 startDate];
              int v21 = [v6 objectAtIndexedSubscript:v9 + 1];
              double v22 = [v21 endDate];
              [v20 timeIntervalSinceDate:v22];
              int v24 = (int)v23;
              unint64_t v25 = (int)v23 >= 0 ? v24 : -v24;

              if (v25 > a4) {
                break;
              }
              BOOL v18 = v9-- <= 0;
              if (v18) {
                goto LABEL_26;
              }
            }
          }
        }
        else
        {
          uint64_t v9 = (v10 - 1);
          do
          {
            int v15 = [v6 objectAtIndexedSubscript:v9];
            id v16 = [MEMORY[0x263EFF9D0] null];
            if ([v15 isEqual:v16])
            {
            }
            else
            {
              double v17 = [v6 objectAtIndexedSubscript:v9];

              if (v17) {
                goto LABEL_18;
              }
            }
            BOOL v18 = v9-- <= 0;
          }
          while (!v18);
LABEL_26:
          LODWORD(v9) = -1;
        }
        if ((int)v9 >= (int)v10 - 1)
        {
          id v32 = [v6 objectAtIndexedSubscript:(int)v10];
          LODWORD(v9) = v10 - 1;
        }
        else
        {
          double v39 = [PowerUIChargeSession alloc];
          uint64_t v40 = [v6 objectAtIndexedSubscript:(int)v10];
          v38 = [v40 startDate];
          double v26 = [v6 objectAtIndexedSubscript:(int)v9 + 1];
          id v27 = [v26 endDate];
          double v28 = [v6 objectAtIndexedSubscript:(int)v10];
          id v29 = [v28 startSoC];
          double v30 = [v6 objectAtIndexedSubscript:(int)v9 + 1];
          double v31 = [v30 endSoC];
          id v32 = [(PowerUIChargeSession *)v39 initWithStartDate:v38 withEndDate:v27 withStartSoC:v29 withEndSoC:v31];
        }
        [v41 addObject:v32];
      }
      while ((int)v9 > 0);
    }
    if (!v9)
    {
      double v33 = [v6 objectAtIndexedSubscript:0];
      [v41 addObject:v33];
    }
    unint64_t v34 = [v37 log];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count") - objc_msgSend(v41, "count"));
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v35;
      _os_log_impl(&dword_22135E000, v34, OS_LOG_TYPE_DEFAULT, "Concatenated %@ events", buf, 0xCu);
    }
  }
  else
  {
    id v6 = v5;
    id v41 = v6;
  }

  return v41;
}

+ (id)recentEngagementHistory
{
  v39[10] = *MEMORY[0x263EF8340];
  id v37 = [MEMORY[0x263EFF910] now];
  mach_port_t v2 = +[PowerUIAnalyticsManager sharedInstance];
  CFDictionaryRef v3 = [v37 dateByAddingTimeInterval:-86400.0];
  id v36 = v2;
  id v4 = [v2 chargingStatisticsFrom:v37 to:v3];

  id v5 = [v37 dateByAddingTimeInterval:-259200.0];
  id v6 = [v2 chargingStatisticsFrom:v37 to:v5];

  double v7 = [v4 objectForKeyedSubscript:@"numberUnderCharges"];
  BOOL v8 = (int)[v7 intValue] > 0;

  uint64_t v9 = [v4 objectForKeyedSubscript:@"totalTempDisableEvents"];
  BOOL v10 = (int)[v9 intValue] > 0;

  uint64_t v11 = [v4 objectForKeyedSubscript:@"numberChargeSessionsReachingTargetSoC"];
  BOOL v33 = (int)[v11 intValue] > 0;

  int v35 = v4;
  uint64_t v12 = [v4 objectForKeyedSubscript:@"DEoCCount"];
  BOOL v13 = (int)[v12 intValue] > 0;

  long long v14 = [v6 objectForKeyedSubscript:@"numberUnderCharges"];
  BOOL v32 = (int)[v14 intValue] > 0;

  int v15 = [v6 objectForKeyedSubscript:@"totalTempDisableEvents"];
  BOOL v30 = (int)[v15 intValue] > 0;

  id v16 = [v6 objectForKeyedSubscript:@"numberChargeSessionsReachingTargetSoC"];
  BOOL v29 = (int)[v16 intValue] > 0;

  double v17 = [v6 objectForKeyedSubscript:@"DEoCCount"];
  BOOL v18 = (int)[v17 intValue] > 0;

  v38[0] = @"LastDayEngagement";
  unint64_t v34 = [v35 objectForKeyedSubscript:@"sawEngagement"];
  v39[0] = v34;
  v38[1] = @"LastDayDEoCEngagement";
  double v31 = [NSNumber numberWithBool:v13];
  v39[1] = v31;
  v38[2] = @"LastDayInterrupted";
  uint64_t v19 = [NSNumber numberWithBool:v8];
  v39[2] = v19;
  v38[3] = @"LastDayOverride";
  int v20 = [NSNumber numberWithBool:v10];
  v39[3] = v20;
  v38[4] = @"LastDayFullyCharged";
  int v21 = [NSNumber numberWithBool:v33];
  v39[4] = v21;
  void v38[5] = @"LastThreeEngagement";
  double v22 = [v6 objectForKeyedSubscript:@"sawEngagement"];
  v39[5] = v22;
  v38[6] = @"LastThreeDEoCEngagement";
  double v23 = [NSNumber numberWithBool:v18];
  v39[6] = v23;
  v38[7] = @"LastThreeInterrupted";
  int v24 = [NSNumber numberWithBool:v32];
  v39[7] = v24;
  v38[8] = @"LastThreeOverride";
  unint64_t v25 = [NSNumber numberWithBool:v30];
  v39[8] = v25;
  v38[9] = @"LastThreeFullyCharged";
  double v26 = [NSNumber numberWithBool:v29];
  v39[9] = v26;
  id v27 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:10];

  return v27;
}

+ (id)filterChargeSessions:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withinSeconds:(unint64_t)a6
{
  id v9 = a3;
  BOOL v10 = (void *)MEMORY[0x263EFF980];
  id v11 = a5;
  id v12 = a4;
  id v40 = [v10 array];
  BOOL v13 = [MEMORY[0x263EFF8F0] currentCalendar];
  long long v14 = [v13 timeZone];
  uint64_t v15 = objc_msgSend(v11, "dateByAddingTimeInterval:", (double)objc_msgSend(v14, "secondsFromGMT"));

  id v16 = [v13 timeZone];
  double v17 = objc_msgSend(v12, "dateByAddingTimeInterval:", (double)objc_msgSend(v16, "secondsFromGMT"));

  id v37 = (void *)v15;
  [v13 components:96 fromDate:v15];
  id v36 = v41 = v13;
  BOOL v18 = objc_msgSend(v13, "dateFromComponents:");
  v38 = [v18 dateByAddingTimeInterval:86400.0];
  if ([v9 count])
  {
    unint64_t v19 = 0;
    double v20 = (double)a6;
    double v39 = v17;
    do
    {
      int v21 = (void *)MEMORY[0x223C80A30]();
      double v22 = [v9 objectAtIndexedSubscript:v19];
      double v23 = [v22 startDate];

      if (v19)
      {
        int v24 = [v9 objectAtIndexedSubscript:(v19 - 1)];
        unint64_t v25 = [v24 endDate];
      }
      else
      {
        unint64_t v25 = [MEMORY[0x263EFF910] distantPast];
      }
      [v23 timeIntervalSinceDate:v25];
      if (v26 >= 0.0)
      {
        [v23 timeIntervalSinceDate:v17];
        if (v27 < 0.0)
        {
          double v28 = [v41 components:96 fromDate:v23];
          BOOL v29 = [v41 dateFromComponents:v28];
          BOOL v30 = [v29 dateByAddingTimeInterval:86400.0];
          [v29 timeIntervalSinceDate:v18];
          if (v31 < 0.0) {
            double v31 = -v31;
          }
          if (v31 < v20) {
            goto LABEL_17;
          }
          [v30 timeIntervalSinceDate:v18];
          if (v32 < 0.0) {
            double v32 = -v32;
          }
          if (v32 < v20) {
            goto LABEL_17;
          }
          [v29 timeIntervalSinceDate:v38];
          if (v33 < 0.0) {
            double v33 = -v33;
          }
          if (v33 < v20)
          {
LABEL_17:
            unint64_t v34 = [v9 objectAtIndexedSubscript:v19];
            [v40 addObject:v34];
          }
          double v17 = v39;
        }
      }

      ++v19;
    }
    while ([v9 count] > v19);
  }

  return v40;
}

+ (BOOL)doesTimeOfDayForDate:(id)a3 fallBetweenDate:(id)a4 andDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 timeIntervalSinceDate:v8];
  if (v10 < 86400.0)
  {
    if (doesTimeOfDayForDate_fallBetweenDate_andDate__onceToken != -1) {
      dispatch_once(&doesTimeOfDayForDate_fallBetweenDate_andDate__onceToken, &__block_literal_global_136);
    }
    double v22 = [(id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar components:96 fromDate:v8];
    id v11 = objc_msgSend((id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar, "dateFromComponents:");
    id v12 = [(id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar components:96 fromDate:v9];
    BOOL v13 = [(id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar dateFromComponents:v12];
    long long v14 = [(id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar components:96 fromDate:v7];
    uint64_t v15 = [(id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar dateFromComponents:v14];
    id v16 = [v11 earlierDate:v13];

    uint64_t v17 = [v15 earlierDate:v11];
    BOOL v18 = (void *)v17;
    if (v16 == v11)
    {
      if ((void *)v17 != v11)
      {
        BOOL v19 = 0;
        goto LABEL_11;
      }
    }
    else if ((void *)v17 == v11)
    {
      BOOL v19 = 1;
LABEL_11:

      goto LABEL_12;
    }
    double v20 = [v15 earlierDate:v13];
    BOOL v19 = v20 == v15;

    goto LABEL_11;
  }
  BOOL v19 = 1;
LABEL_12:

  return v19;
}

uint64_t __76__PowerUISmartChargeUtilities_doesTimeOfDayForDate_fallBetweenDate_andDate___block_invoke()
{
  doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar = [MEMORY[0x263EFF8F0] currentCalendar];
  return MEMORY[0x270F9A758]();
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
  id v7 = (__CFString *)a5;
  if (a3)
  {
    id v8 = NSNumber;
    [a3 timeIntervalSinceReferenceDate];
    id v9 = (const void *)objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    id v9 = 0;
  }
  CFPreferencesSetAppValue(key, v9, v7);
}

+ (id)dateForPreferenceKey:(id)a3 inDomain:(id)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x263EFF910];
    [v4 doubleValue];
    id v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
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

+ (id)timelineEventDate:(id)a3 withDefaultsDomain:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)CFPreferencesCopyAppValue(@"timeline", (CFStringRef)a4);
  id v8 = (void *)[v7 mutableCopy];

  if (v8)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v22 = a1;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v15 = [v14 objectForKeyedSubscript:@"event"];
          int v16 = [v15 isEqualToString:v6];

          if (v16)
          {
            BOOL v18 = (void *)MEMORY[0x263EFF910];
            BOOL v19 = [v14 objectForKeyedSubscript:@"date"];
            [v19 doubleValue];
            uint64_t v17 = objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");

            double v20 = [v22 log];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
              +[PowerUISmartChargeUtilities timelineEventDate:withDefaultsDomain:]();
            }

            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v17 = 0;
LABEL_14:
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)batteryLevelHistogramAroundTime:(id)a3 withDelta:(double)a4 withOffset:(double)a5
{
  v61[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = BiomeLibrary();
  id v9 = [v8 Device];
  uint64_t v10 = [v9 Power];
  uint64_t v11 = [v10 BatteryLevel];

  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  uint64_t v12 = malloc_type_calloc(0x65uLL, 8uLL, 0x100004000313F17uLL);
  uint64_t v13 = 0;
  uint64_t v59 = v12;
  do
  {
    *(void *)(v57[3] + v13) = 0;
    v13 += 8;
  }
  while (v13 != 64);
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  int v55 = -1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0;
  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF910] now];
  }
  long long v14 = [v7 dateByAddingTimeInterval:-2592000.0];
  uint64_t v15 = [v14 dateByAddingTimeInterval:a5];

  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__2;
  double v51 = __Block_byref_object_dispose__2;
  id v52 = [v15 dateByAddingTimeInterval:-a4];
  uint64_t v41 = 0;
  int v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__2;
  uint64_t v45 = __Block_byref_object_dispose__2;
  id v46 = [v15 dateByAddingTimeInterval:a4];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__2;
  v39[4] = __Block_byref_object_dispose__2;
  id v16 = objc_alloc(MEMORY[0x263F08798]);
  id v40 = (id)[v16 initWithStartDate:v48[5] endDate:v42[5]];
  id v17 = objc_alloc(MEMORY[0x263F2A8B0]);
  BOOL v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-2592000.0];
  BOOL v19 = (void *)[v17 initWithStartDate:v18 endDate:0 maxEvents:0 lastN:0 reversed:0];

  double v20 = [v11 publisherWithOptions:v19];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __84__PowerUISmartChargeUtilities_batteryLevelHistogramAroundTime_withDelta_withOffset___block_invoke_2;
  v38[3] = &unk_2645A6170;
  v38[4] = &v41;
  void v38[5] = &v47;
  v38[6] = v39;
  v38[7] = v54;
  v38[8] = &v56;
  v38[9] = v53;
  int v21 = [v20 sinkWithCompletion:&__block_literal_global_148 receiveInput:v38];

  unint64_t v22 = 0;
  double v23 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  do
  {
    if (v22 > 0x13)
    {
      if (v22 > 0x31)
      {
        double v27 = (double *)v57[3];
        double v28 = v27[v22];
        double v29 = v26 + v28;
        double v30 = v25 + v28;
        if (v22 <= 0x5E) {
          double v25 = v30;
        }
        else {
          double v26 = v29;
        }
      }
      else
      {
        double v27 = (double *)v57[3];
        double v24 = v24 + v27[v22];
      }
    }
    else
    {
      double v27 = (double *)v57[3];
      double v23 = v23 + v27[v22];
    }
    ++v22;
  }
  while (v22 != 101);
  free(v27);
  double v31 = v26 + v25 + v24 + v23;
  v60[0] = &unk_26D385300;
  double v32 = [NSNumber numberWithDouble:v26 / v31];
  v61[0] = v32;
  v60[1] = &unk_26D385318;
  double v33 = [NSNumber numberWithDouble:v25 / v31];
  v61[1] = v33;
  v60[2] = &unk_26D385330;
  unint64_t v34 = [NSNumber numberWithDouble:v24 / v31];
  v61[2] = v34;
  v60[3] = &unk_26D3852E8;
  int v35 = [NSNumber numberWithDouble:v23 / v31];
  v61[3] = v35;
  id v36 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:4];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v56, 8);

  return v36;
}

void __84__PowerUISmartChargeUtilities_batteryLevelHistogramAroundTime_withDelta_withOffset___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263EFF910];
  id v23 = v3;
  [v3 timestamp];
  id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1[4] + 8) + 40)];
  if (v6 > 0.0)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1[5] + 8) + 40) dateByAddingTimeInterval:86400.0];
    uint64_t v8 = *(void *)(a1[5] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [*(id *)(*(void *)(a1[4] + 8) + 40) dateByAddingTimeInterval:86400.0];
    uint64_t v11 = *(void *)(a1[4] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:*(void *)(*(void *)(a1[5] + 8) + 40) endDate:*(void *)(*(void *)(a1[4] + 8) + 40)];
    uint64_t v14 = *(void *)(a1[6] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) containsDate:v5])
  {
    id v16 = v23;
    if (*(_DWORD *)(*(void *)(a1[7] + 8) + 24) != -1)
    {
      [v23 timestamp];
      id v16 = v23;
      uint64_t v18 = *(void *)(*(void *)(a1[8] + 8) + 24);
      uint64_t v19 = *(int *)(*(void *)(a1[7] + 8) + 24);
      *(double *)(v18 + 8 * v19) = v17 - *(double *)(*(void *)(a1[9] + 8) + 24) + *(double *)(v18 + 8 * v19);
    }
    double v20 = [v16 eventBody];
    [v20 batteryPercentage];
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = (int)v21;

    [v23 timestamp];
    *(void *)(*(void *)(a1[9] + 8) + 24) = v22;
  }
}

+ (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withDefaultsDomain:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)os_transaction_create();
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  id v9 = +[PowerUISmartChargeUtilities pluginEventsBefore:v8 withMinimumDuration:1200.0 ignoringDisconnectsShorterThan:300.0];
  uint64_t v10 = +[PowerUISmartChargeUtilities concatenateChargeSessions:v9 withMaxDeltaSecondsBetweenEvents:10];

  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = [v11 startDate];
  [v8 timeIntervalSinceDate:v12];
  double v14 = v13;

  if (v14 < a3 * 86400.0)
  {
LABEL_9:
    uint64_t v19 = [a1 log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134217984;
      double v28 = v14 / 86400.0;
      _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "Not real carry device: First plugin: %0.2f days ago", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_11;
  }
  if ((unint64_t)[v10 count] < 9)
  {
    double v24 = [a1 log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134217984;
      double v28 = COERCE_DOUBLE([v10 count]);
      _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_DEFAULT, "Event count: %lu, too low", (uint8_t *)&v27, 0xCu);
    }

    goto LABEL_9;
  }
  uint64_t v15 = [v10 lastObject];
  id v16 = [v15 startDate];
  [v8 timeIntervalSinceDate:v16];
  double v18 = v17;

  if (v18 <= 604800.0)
  {
    BOOL v25 = 1;
    goto LABEL_12;
  }
  uint64_t v19 = [a1 log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    double v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    double v21 = [v10 lastObject];
    uint64_t v22 = [v21 startDate];
    [v8 timeIntervalSinceDate:v22];
    int v27 = 138543618;
    double v28 = v20;
    __int16 v29 = 2048;
    double v30 = v23 / 86400.0;
    _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "Not real carry device: %{public}@ events, Last plugin: %0.2f days ago", (uint8_t *)&v27, 0x16u);
  }
LABEL_11:

  BOOL v25 = 0;
LABEL_12:

  return v25;
}

+ (double)totalPluginDurationAfter:(id)a3 withMinimumDuration:(double)a4 withPluginEvents:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = [v14 startDate];
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
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

+ (id)getTestVector:(id)a3
{
  id v3 = a3;
  id v48 = 0;
  uint64_t v44 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(\".+?),(.+?\"" options:1 error:&v48];
  id v4 = v48;
  id v47 = v4;
  int v42 = v3;
  id v5 = [NSString stringWithContentsOfURL:v3 encoding:1 error:&v47];
  id v41 = v47;

  id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v6 setNumberStyle:1];
  id v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v6 setLocale:v7];

  id v40 = v5;
  id v8 = [v5 componentsSeparatedByString:@"\n"];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 componentsSeparatedByString:@","];

  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  if ([v10 count])
  {
    unint64_t v12 = 0;
    do
    {
      double v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count") - 1);
      [v11 setObject:v13 atIndexedSubscript:v12];

      ++v12;
    }
    while ([v10 count] > v12);
  }
  if ((unint64_t)([v8 count] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v14 = 1;
    uint64_t v43 = v8;
    while (1)
    {
      uint64_t v15 = [v8 objectAtIndexedSubscript:v14];
      uint64_t v46 = v14;
      double v16 = [v8 objectAtIndexedSubscript:v14];
      double v17 = objc_msgSend(v44, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v16, "length"), @"$1.$2");

      uint64_t v45 = v17;
      double v18 = [v17 componentsSeparatedByString:@","];
      if ([v10 count]) {
        break;
      }
LABEL_17:

      uint64_t v14 = v46 + 1;
      id v8 = v43;
      if ([v43 count] - 1 <= (unint64_t)(v46 + 1)) {
        goto LABEL_18;
      }
    }
    uint64_t v19 = 0;
    uint64_t v20 = v46 - 1;
    while (1)
    {
      long long v21 = [v18 objectAtIndexedSubscript:v19];
      long long v22 = [v6 numberFromString:v21];

      long long v23 = [v18 objectAtIndexedSubscript:v19];
      long long v24 = v23;
      if (v22) {
        break;
      }
      int v27 = [v23 isEqualToString:@"True"];

      if (v27)
      {
        double v28 = [v11 objectAtIndexedSubscript:v19];
        long long v24 = v28;
        __int16 v29 = &unk_26D385348;
        goto LABEL_14;
      }
      double v30 = [v18 objectAtIndexedSubscript:v19];
      int v31 = [v30 isEqualToString:@"False"];

      if (v31)
      {
        double v28 = [v11 objectAtIndexedSubscript:v19];
        long long v24 = v28;
        __int16 v29 = &unk_26D3852E8;
LABEL_14:
        [v28 setObject:v29 atIndexedSubscript:v20];
LABEL_15:
      }
      if ([v10 count] <= (unint64_t)++v19) {
        goto LABEL_17;
      }
    }
    BOOL v25 = [v6 numberFromString:v23];
    uint64_t v26 = [v11 objectAtIndexedSubscript:v19];
    [v26 setObject:v25 atIndexedSubscript:v20];

    goto LABEL_15;
  }
LABEL_18:
  double v32 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v10 count])
  {
    unint64_t v33 = 0;
    do
    {
      unint64_t v34 = (void *)MEMORY[0x263EFF8C0];
      int v35 = [v11 objectAtIndexedSubscript:v33];
      id v36 = [v34 arrayWithArray:v35];
      id v37 = [v10 objectAtIndexedSubscript:v33];
      [v32 setObject:v36 forKeyedSubscript:v37];

      ++v33;
    }
    while ([v10 count] > v33);
  }
  v38 = [NSDictionary dictionaryWithDictionary:v32];

  return v38;
}

+ (double)batteryLevelAtDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSinceNow];
  if (v5 <= -10.0)
  {
    uint64_t v24 = 0;
    BOOL v25 = (double *)&v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    unint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:v4 endDate:0 maxEvents:20 lastN:0 reversed:1];
    double v13 = BiomeLibrary();
    uint64_t v14 = [v13 Device];
    uint64_t v15 = [v14 Power];
    double v16 = [v15 BatteryLevel];
    double v17 = [v16 publisherWithOptions:v12];
    double v18 = [v17 filterWithIsIncluded:&__block_literal_global_184];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_2;
    v23[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
    void v23[4] = a1;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_185;
    v22[3] = &unk_2645A6198;
    v22[4] = &v24;
    id v19 = (id)[v18 sinkWithCompletion:v23 shouldContinue:v22];

    uint64_t v20 = [a1 log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[PowerUISmartChargeUtilities batteryLevelAtDate:]();
    }

    double v11 = v25[3];
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v6 = [MEMORY[0x263F351B8] userContext];
    id v7 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
    id v8 = [v6 objectForKeyedSubscript:v7];

    uint64_t v9 = [MEMORY[0x263F351D0] batteryPercentageKey];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    double v11 = (double)[v10 integerValue];
  }
  return v11;
}

uint64_t __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke()
{
  return 1;
}

void __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_2_cold_1(v3);
    }
  }
}

uint64_t __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_185(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  [v3 batteryPercentage];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;

  return 0;
}

+ (id)lastPluggedInDate
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F351B8] userContext];
  if (!+[PowerUISmartChargeUtilities isPluggedInWithContext:v3])
  {
    uint64_t v30 = 0;
    v31[0] = &v30;
    v31[1] = 0x3032000000;
    v31[2] = __Block_byref_object_copy__2;
    v31[3] = __Block_byref_object_dispose__2;
    id v32 = 0;
    id v8 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:0 endDate:0 maxEvents:8 lastN:0 reversed:1];
    uint64_t v9 = BiomeLibrary();
    uint64_t v10 = [v9 Device];
    double v11 = [v10 Power];
    unint64_t v12 = [v11 PluggedIn];
    double v13 = [v12 publisherWithOptions:v8];
    uint64_t v14 = [v13 filterWithIsIncluded:&__block_literal_global_190];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_2;
    v29[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
    v29[4] = a1;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_191;
    v28[3] = &unk_2645A6198;
    v28[4] = &v30;
    id v15 = (id)[v14 sinkWithCompletion:v29 shouldContinue:v28];

    double v16 = *(void **)(v31[0] + 40);
    if (v16)
    {
      [v16 timeIntervalSinceNow];
      if (v17 <= 0.0)
      {
        BOOL v25 = [a1 log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          [*(id *)(v31[0] + 40) timeIntervalSinceNow];
          +[PowerUISmartChargeUtilities lastPluggedInDate];
        }

        id v24 = *(id *)(v31[0] + 40);
        goto LABEL_16;
      }
      double v18 = [a1 log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[PowerUISmartChargeUtilities lastPluggedInDate]();
      }
    }
    else
    {
      double v18 = [a1 log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[PowerUISmartChargeUtilities lastPluggedInDate]();
      }
    }

    id v24 = [MEMORY[0x263EFF910] date];
LABEL_16:
    long long v23 = v24;

    _Block_object_dispose(&v30, 8);
    goto LABEL_20;
  }
  uint64_t v4 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
  double v5 = [v3 objectForKeyedSubscript:v4];

  id v6 = [v5 objectForKeyedSubscript:@"externalConnectedChangeDate"];

  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"externalConnectedChangeDate"];
LABEL_18:
    long long v23 = (void *)v7;
    goto LABEL_19;
  }
  id v19 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
  uint64_t v20 = [v3 objectForKeyedSubscript:v19];
  int v21 = [v20 BOOLValue];

  if (!v21)
  {
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    goto LABEL_18;
  }
  long long v22 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
  long long v23 = [v3 lastModifiedDateForContextualKeyPath:v22];

LABEL_19:
LABEL_20:

  return v23;
}

uint64_t __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke()
{
  return 1;
}

void __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_2_cold_1(v3);
    }
  }
}

BOOL __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_191(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  char v5 = [v4 starting];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFF910];
    [v3 timestamp];
    uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) == 0;
  }

  return v10;
}

+ (void)getMemoryUsage
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Couldn't get process memory usage", v2, v3, v4, v5, v6);
}

+ (void)logMemoryUsageInternalForEvent:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a1];
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:a2];
  int v9 = 138412802;
  uint64_t v10 = a3;
  __int16 v11 = 2112;
  unint64_t v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_22135E000, a4, OS_LOG_TYPE_DEBUG, "(%@) current memory usage: %@ kB - peak usage: %@ kB", (uint8_t *)&v9, 0x20u);
}

+ (void)getBatteryLevelDurations:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "Skipping battery level %@", buf, 0xCu);
}

void __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting battery stream in batteryLevelDurations: %s", v5, v6, v7, v8, v9);
}

void __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_22_cold_1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v2, v3, "Skipping battery level %@", v4, v5, v6, v7, v8);
}

+ (void)percentageOfBatteryDurations:aboveBatteryLevel:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: No battery events!", v2, v3, v4, v5, v6);
}

void __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting plugin biome events in pluginEventsBefore - %s", v5, v6, v7, v8, v9);
}

void __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_44_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22135E000, a2, OS_LOG_TYPE_DEBUG, "  %@", (uint8_t *)&v3, 0xCu);
}

void __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting biome events in drain calculation - %s", v5, v6, v7, v8, v9);
}

void __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting BatteryLevel in timestampOfFirstEventReachingBatteryLevel: %s", v5, v6, v7, v8, v9);
}

+ (void)historicalFullChargeDurationStartingAt:withMinimumPluginDuration:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_22135E000, v0, OS_LOG_TYPE_FAULT, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration: is not being called with a value of >= 80", v1, 2u);
}

+ (void)historicalFullChargeDurationStartingAt:(uint64_t)a1 withMinimumPluginDuration:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22135E000, a2, OS_LOG_TYPE_DEBUG, "historical80to100Time durations: %@", (uint8_t *)&v3, 0xCu);
}

void __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting chargingExperience biome events in historical80to100Time: %s", v5, v6, v7, v8, v9);
}

+ (void)timelineEventDate:withDefaultsDomain:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_4(&dword_22135E000, v0, v1, "Timeline event '%@' exists %@", v2);
}

+ (void)batteryLevelAtDate:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  OUTLINED_FUNCTION_4(&dword_22135E000, v1, v2, "Battery level at %@ is %lf", v3);
}

void __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_2_cold_1(void *a1)
{
  int v1 = [a1 error];
  os_log_t v2 = [v1 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting battery level biome events in batteryLevelAtDate %@", v5, v6, v7, v8, v9);
}

+ (void)lastPluggedInDate
{
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  *(_DWORD *)a2 = 134218242;
  *(double *)(a2 + 4) = -a4;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_4(&dword_22135E000, a2, a3, "Last plug-in was %.2f seconds ago at %@", (uint8_t *)a2);
}

void __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_2_cold_1(void *a1)
{
  int v1 = [a1 error];
  os_log_t v2 = [v1 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting plugged in biome events in lastPluggedInDate %@", v5, v6, v7, v8, v9);
}

@end