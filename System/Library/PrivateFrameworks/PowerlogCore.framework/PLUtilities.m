@interface PLUtilities
+ (BOOL)AppDeletionEnabled;
+ (BOOL)OverrideAllowlistEnabled;
+ (BOOL)PLCopyItemsFromPath:(id)a3 toPath:(id)a4;
+ (BOOL)PreUnlockTelemetryEnabled;
+ (BOOL)SwitchToIncrementalVacuumEnabled;
+ (BOOL)allowQueryFromPeer:(id)a3;
+ (BOOL)compressWithSource:(id)a3 withDestination:(id)a4 withLevel:(int)a5;
+ (BOOL)createAndChownDirectory:(id)a3;
+ (BOOL)createAndChownDirectoryIfDirectoryDoesNotExist:(id)a3;
+ (BOOL)decompressWithSource:(id)a3 withDestination:(id)a4 withRemoveSrc:(BOOL)a5;
+ (BOOL)devBoardDevice;
+ (BOOL)deviceRebooted;
+ (BOOL)gasGaugeEnabled;
+ (BOOL)hasBattery;
+ (BOOL)hasGasGauge;
+ (BOOL)inBUIDemoMode;
+ (BOOL)isALSCurveHigherThanDefault;
+ (BOOL)isAppAnalyticsEnabled;
+ (BOOL)isDaemonOrAppleXPCService:(int)a3;
+ (BOOL)isEduMode;
+ (BOOL)isFullModeDaemon;
+ (BOOL)isHealthDataSubmissionAllowed;
+ (BOOL)isHeySiriEnabled;
+ (BOOL)isImproveFitnessPlusEnabled;
+ (BOOL)isLiteModeDaemon;
+ (BOOL)isPingPongChargingWith:(BOOL)a3 andBatteryLevelPercent:(double)a4;
+ (BOOL)isPowerlogHelperd;
+ (BOOL)isSafetyDataSubmissionAllowed;
+ (BOOL)isSiriEnabled;
+ (BOOL)isValidString:(id)a3;
+ (BOOL)markFileAsPurgeable:(id)a3 withUrgency:(unint64_t)a4;
+ (BOOL)markFilesAsPurgeable:(id)a3 withUrgency:(unint64_t)a4;
+ (BOOL)markFilesInDirectoryAsPurgeable:(id)a3 ofType:(id)a4 withUrgency:(unint64_t)a5;
+ (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 withName:(id)a5 error:(id *)a6;
+ (BOOL)runningAsMobileUser;
+ (BOOL)shouldCreateQuarantine;
+ (BOOL)shouldLogForEntryKey:(id)a3;
+ (BOOL)shouldLogForEntryKey:(id)a3 withKey:(id)a4 andValue:(id)a5;
+ (BOOL)shouldLogPreUnlockTelemetry;
+ (double)defaultBatteryEnergyCapacity;
+ (double)getLastSystemTimeOffset;
+ (double)getMachbaseTimeRatio;
+ (double)roundToSigFigDouble:(double)a3 withSigFig:(int)a4;
+ (double)scaledPowerBasedOnPoint:(double)a3 withPowerModel:(id)a4;
+ (double)secondsFromMachTime:(unint64_t)a3;
+ (id)JSONSanitizeDictionary:(id)a3;
+ (id)MavRevStringQuery;
+ (id)allSubClassesForClass:(Class)a3;
+ (id)automatedDeviceGroup;
+ (id)binaryPathForPid:(int)a3;
+ (id)buildVersion;
+ (id)bundleIDFromPid:(int)a3;
+ (id)bundleIDFromProcessName:(id)a3;
+ (id)bundleIDFromURL:(id)a3;
+ (id)bundleVersionFromURL:(id)a3;
+ (id)cleanLaunchdApplicationMacOS:(id)a3;
+ (id)cleanLaunchdName:(id)a3;
+ (id)containerPath;
+ (id)crashReporterKey;
+ (id)dateFromTimeval:(timeval)a3;
+ (id)dateFromTimevalSystemTime:(timeval)a3;
+ (id)deviceBootArgs;
+ (id)deviceBootTime;
+ (id)deviceBootUUID;
+ (id)extractDateStringAndUUIDStringFromFilePath:(id)a3;
+ (id)fullModeDaemonName;
+ (id)fullProcessNameForPid:(int)a3;
+ (id)generateAndUpdateSaltValue:(id)a3;
+ (id)generateHashValue:(id)a3 withSalt:(id)a4;
+ (id)getDeviceSoC;
+ (id)getFirstBatteryTimestamp;
+ (id)getIdentifierFromEntry:(id)a3;
+ (id)getKVPairsForCASubmissionFromEntry:(id)a3;
+ (id)getLastBatteryTimestamp;
+ (id)getPerfStatsForProcess:(id)a3;
+ (id)hardwareModel;
+ (id)hardwareModelSMC:(id)a3;
+ (id)hashBundleID:(id)a3;
+ (id)hashString:(id)a3;
+ (id)intervalPeakCADictionaryForLaunchdName:(id)a3 intervalMaxKB:(unint64_t)a4;
+ (id)launchdNameToProcessName:(id)a3;
+ (id)liteModeDaemonName;
+ (id)mobileUserADG;
+ (id)modeForEntryKey:(id)a3 withKeyName:(id)a4;
+ (id)powerModelForOperatorName:(id)a3;
+ (id)powerlogDefaultForKey:(id)a3;
+ (id)processNameForPid:(int)a3;
+ (id)productType;
+ (id)removeFirstPartyBundleIDPrefix:(id)a3;
+ (id)runningAsUser;
+ (id)sanitizeCAPayload:(id)a3;
+ (id)shortUUIDString;
+ (id)supplementalBuildVersion;
+ (id)torchTypeString;
+ (id)transactionWorkQueue;
+ (id)workQueue;
+ (id)workQueueForClass:(Class)a3;
+ (id)workQueueForKey:(id)a3;
+ (int)compressWithSourceStream:(__sFILE *)a3 withDestination:(__sFILE *)a4 withLevel:(int)a5;
+ (int)decompressWithSourceStream:(__sFILE *)a3 withDestinationStream:(__sFILE *)a4;
+ (int)numFilesAtPath:(id)a3;
+ (int)pidForProcessName:(id)a3;
+ (int)remove:(int)a3 oldestFilesFromDirectory:(id)a4 containingFileNameSubstring:(id)a5;
+ (int64_t)compareFilesByKey:(id)a3 file1:(id)a4 file2:(id)a5 sortAscending:(BOOL)a6;
+ (int64_t)roundToSigFig:(int)a3 withSigFig:(int)a4;
+ (jetsam_priority_info)getJetamPriority:(int)a3;
+ (mach_timebase_info)getMachTimebase;
+ (process_memory_limit_info)getProcessMemoryLimit:(int)a3;
+ (signed)canLogMode:(id)a3 fullMode:(BOOL)a4;
+ (signed)connectionToQuarantine:(id)a3;
+ (signed)logModeForEntryKey:(id)a3 withKey:(id)a4 andValue:(id)a5;
+ (uint64_t)deviceBootUUID;
+ (unint64_t)coalitionIDForPid:(int)a3;
+ (unint64_t)convertToBase10:(id)a3 fromBaseN:(int)a4;
+ (unint64_t)directorySize:(id)a3;
+ (unint64_t)dispatchTimeInSeconds:(double)a3;
+ (unint64_t)getCurrMachAbsTimeInSecs;
+ (unint64_t)maxProcessCount;
+ (unsigned)getHardwarePerfLevels;
+ (void)dispatchSyncIfNotCallerQueue:(id)a3 withBlock:(id)a4;
+ (void)exitSafe:(int)a3;
+ (void)exitWithReason:(signed __int16)a3;
+ (void)exitWithReason:(signed __int16)a3 action:(signed __int16)a4;
+ (void)exitWithReason:(signed __int16)a3 connection:(id)a4;
+ (void)exitWithReasonSync:(signed __int16)a3;
+ (void)getCurrentMonotonicAndMachAbsTime:(id *)a3 machAbsTime:(unint64_t *)a4 machContTime:(unint64_t *)a5;
+ (void)getLastSystemTimeOffset;
+ (void)isImproveFitnessPlusEnabled;
+ (void)maxProcessCount;
+ (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5;
+ (void)quarantineToPath:(id)a3 action:(signed __int16)a4;
+ (void)refreshBUI;
+ (void)reportZlibResultToCA:(int)a3 forEvent:(id)a4;
+ (void)setMobileOwnerForFile:(id)a3;
+ (void)setPermissionsForFile:(id)a3 toValue:(unsigned __int16)a4;
@end

@implementation PLUtilities

+ (signed)logModeForEntryKey:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if (+[PPSEntryKey PPSEnabled:v6])
  {
    signed __int16 v8 = 0;
  }
  else
  {
    v9 = +[PLUtilities modeForEntryKey:v6 withKeyName:v7];
    if (!v9)
    {
      v10 = +[PLUtilities modeForEntryKey:v6 withKeyName:@"__Allow_Dynamic__"];
      v11 = v10;
      if (v10)
      {
        if ([v10 BOOLValue]) {
          v9 = @"YES";
        }
        else {
          v9 = 0;
        }
      }
      else
      {
        v9 = 0;
      }
    }
    signed __int16 v8 = +[PLUtilities canLogMode:fullMode:](PLUtilities, "canLogMode:fullMode:", v9, +[PLDefaults fullMode]);
  }
  return v8;
}

+ (id)modeForEntryKey:(id)a3 withKeyName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PLUtilities getAllowblocklist];
  signed __int16 v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:v5];

    if (v9)
    {
      v10 = [v8 objectForKeyedSubscript:v5];
      v9 = [v10 objectForKeyedSubscript:v6];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (signed)canLogMode:(id)a3 fullMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4)
  {
    if ([@"NO" isEqualToString:v5])
    {
      signed __int16 v6 = 1;
      goto LABEL_17;
    }
    if (([@"HF" isEqualToString:v5] & 1) == 0)
    {
      if (([@"HB" isEqualToString:v5] & 1) == 0)
      {
        signed __int16 v6 = 0;
        goto LABEL_15;
      }
LABEL_13:
      signed __int16 v6 = 4;
      goto LABEL_17;
    }
LABEL_11:
    signed __int16 v6 = 2;
    goto LABEL_17;
  }
  if ([@"YES" isEqualToString:v5])
  {
    signed __int16 v6 = 0;
    goto LABEL_17;
  }
  if (([@"HL" isEqualToString:v5] & 1) != 0
    || ([@"HF" isEqualToString:v5] & 1) != 0)
  {
    goto LABEL_11;
  }
  if ([@"HB" isEqualToString:v5]) {
    goto LABEL_13;
  }
  signed __int16 v6 = 1;
LABEL_15:
  if ([@"TR" isEqualToString:v5]) {
    signed __int16 v6 = 3;
  }
LABEL_17:

  return v6;
}

uint64_t __54__PLUtilities_dispatchSyncIfNotCallerQueue_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (double)secondsFromMachTime:(unint64_t)a3
{
  +[PLUtilities getMachbaseTimeRatio];
  return v4 * (double)a3 / 1000000000.0;
}

+ (double)getMachbaseTimeRatio
{
  if (getMachbaseTimeRatio_once != -1) {
    dispatch_once(&getMachbaseTimeRatio_once, &__block_literal_global_104);
  }
  return *(double *)&getMachbaseTimeRatio_ratio;
}

+ (BOOL)shouldLogForEntryKey:(id)a3
{
  id v3 = a3;
  if (+[PPSEntryKey PPSEnabled:v3]
    || +[PLDefaults fullMode])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = +[PLUtilities getAllowblocklist];
    signed __int16 v6 = v5;
    if (v5)
    {
      id v7 = [v5 objectForKeyedSubscript:v3];
      BOOL v4 = v7 != 0;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

+ (id)workQueueForKey:(id)a3
{
  id v3 = a3;
  if (workQueueForKey__sOnceTokenWorkQueue != -1) {
    dispatch_once(&workQueueForKey__sOnceTokenWorkQueue, &__block_literal_global_88);
  }
  id v4 = (id)workQueueForKey__workQueueDictionary;
  objc_sync_enter(v4);
  if (v3)
  {
    id v5 = [(id)workQueueForKey__workQueueDictionary objectForKeyedSubscript:v3];
    if (!v5)
    {
      signed __int16 v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v7 = dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)workQueueForKey__qos, 0);

      id v8 = [NSString stringWithFormat:@"com.apple.powerlog.workqueue.%@", v3];
      id v5 = dispatch_queue_create((const char *)[v8 UTF8String], v7);

      [(id)workQueueForKey__workQueueDictionary setObject:v5 forKeyedSubscript:v3];
    }
  }
  else
  {
    id v5 = [(id)workQueueForKey__workQueueDictionary objectForKeyedSubscript:@"__GeneralWorkQueue__"];
  }
  objc_sync_exit(v4);

  return v5;
}

+ (void)dispatchSyncIfNotCallerQueue:(id)a3 withBlock:(id)a4
{
  id v5 = (void (**)(void))a4;
  label = dispatch_queue_get_label(0);
  id v7 = dispatch_queue_get_label((dispatch_queue_t)a3);
  if (!strcmp(label, v7))
  {
    v5[2](v5);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PLUtilities_dispatchSyncIfNotCallerQueue_withBlock___block_invoke;
    block[3] = &unk_1E6254508;
    v9 = v5;
    dispatch_sync((dispatch_queue_t)a3, block);
  }
}

+ (BOOL)isPowerlogHelperd
{
  if (isPowerlogHelperd_onceToken != -1) {
    dispatch_once(&isPowerlogHelperd_onceToken, &__block_literal_global_412);
  }
  return isPowerlogHelperd_isPowerlogHelperd;
}

+ (void)getCurrentMonotonicAndMachAbsTime:(id *)a3 machAbsTime:(unint64_t *)a4 machContTime:(unint64_t *)a5
{
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  id v8 = (unsigned int *)[a1 getMachTimebase];
  if (mach_get_times())
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PLUtilities_getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime___block_invoke_136;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v9;
      if (getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__defaultOnce_134 != -1) {
        dispatch_once(&getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__defaultOnce_134, block);
      }
      if (getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__classDebugEnabled_135)
      {
        v10 = [NSString stringWithFormat:@"mach_get_times() call failed."];
        v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
        v12 = [v11 lastPathComponent];
        v13 = [NSString stringWithUTF8String:"+[PLUtilities getCurrentMonotonicAndMachAbsTime:machAbsTime:machContTime:]"];
        +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:899];

        v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    *a3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if (a4) {
      *a4 = mach_absolute_time() * *v8 / v8[1];
    }
    if (a5) {
      *a5 = mach_continuous_time() * *v8 / v8[1];
    }
  }
  else
  {
    v15 = +[PLUtilities dateFromTimeval:](PLUtilities, "dateFromTimeval:", v29, ((int)v30 / 1000));
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __74__PLUtilities_getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime___block_invoke;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v16;
      if (getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__defaultOnce != -1) {
        dispatch_once(&getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__defaultOnce, v26);
      }
      if (getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__classDebugEnabled)
      {
        v17 = NSString;
        v18 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        v19 = [v17 stringWithFormat:@"Converted monotonic time: %@, reference monotonic time: %@.", v15, v18];

        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
        v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"+[PLUtilities getCurrentMonotonicAndMachAbsTime:machAbsTime:machContTime:]"];
        +[PLCoreStorage logMessage:v19 fromFile:v21 fromFunction:v22 fromLineNumber:888];

        v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    id v24 = v15;
    *a3 = v24;
    if (a4) {
      *a4 = v28 * (unint64_t)*v8 / v8[1];
    }
    if (a5) {
      *a5 = v27 * (unint64_t)*v8 / v8[1];
    }
  }
}

+ (mach_timebase_info)getMachTimebase
{
  if (getMachTimebase_onceToken != -1) {
    dispatch_once(&getMachTimebase_onceToken, &__block_literal_global_141);
  }
  return (mach_timebase_info *)&getMachTimebase_machTimeInfo;
}

+ (id)dateFromTimeval:(timeval)a3
{
  id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)a3.tv_usec / 1000000.0 + (double)a3.tv_sec];
  id v4 = [v3 convertFromSystemToMonotonic];

  return v4;
}

+ (id)getIdentifierFromEntry:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"BundleId"];
  if ([v4 isEqualToString:&stru_1F15208F0])
  {
    id v5 = [v3 objectForKeyedSubscript:@"LaunchdName"];
    signed __int16 v6 = +[PLUtilities launchdNameToProcessName:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else if ((unint64_t)[v5 length] > 9)
    {
      id v8 = [v5 substringFromIndex:10];
    }
    else
    {
      id v8 = v5;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

+ (id)launchdNameToProcessName:(id)a3
{
  uint64_t v3 = launchdNameToProcessName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&launchdNameToProcessName__onceToken, &__block_literal_global_368);
  }
  id v5 = [(id)launchdNameToProcessName__launchdNameToProcessNameDict objectForKeyedSubscript:v4];

  return v5;
}

+ (id)workQueueForClass:(Class)a3
{
  uint64_t v3 = NSStringFromClass(a3);
  id v4 = +[PLUtilities workQueueForKey:v3];

  return v4;
}

void __52__PLUtilities_postNotificationName_object_userInfo___block_invoke_2(void *a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:a1[6]];
}

+ (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (postNotificationName_object_userInfo__onceToken != -1) {
    dispatch_once(&postNotificationName_object_userInfo__onceToken, &__block_literal_global_98);
  }
  v10 = postNotificationName_object_userInfo__notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PLUtilities_postNotificationName_object_userInfo___block_invoke_2;
  block[3] = &unk_1E62544E0;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

+ (BOOL)gasGaugeEnabled
{
  if (+[PLDefaults isDevBoard]) {
    return 0;
  }
  else {
    return !+[PLPlatform isiPod];
  }
}

void __32__PLUtilities_MavRevStringQuery__block_invoke()
{
  unsigned int v0 = +[PLPlatform kPLBasebandClassOfDevice] - 1003001;
  if (v0 > 0x10) {
    v1 = 0;
  }
  else {
    v1 = off_1E6254D10[v0];
  }
  id v2 = (void *)MavRevStringQuery_plMavRevString;
  MavRevStringQuery_plMavRevString = (uint64_t)v1;
}

+ (id)containerPath
{
  if (containerPath_onceToken != -1) {
    dispatch_once(&containerPath_onceToken, &__block_literal_global_24);
  }
  id v2 = (void *)containerPath_containerPath;
  return v2;
}

+ (id)sanitizeCAPayload:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
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
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "rangeOfString:", @"-", (void)v14) != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v11 = [v5 objectForKeyedSubscript:v10];
          id v12 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
          [v4 setObject:v11 forKey:v12];

          [v4 removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)OverrideAllowlistEnabled
{
  if (OverrideAllowlistEnabled_onceToken != -1) {
    dispatch_once(&OverrideAllowlistEnabled_onceToken, &__block_literal_global_436);
  }
  return OverrideAllowlistEnabled_overrideAllowlistEnabled;
}

+ (BOOL)isAppAnalyticsEnabled
{
  if (isAppAnalyticsEnabled_onceToken != -1) {
    dispatch_once(&isAppAnalyticsEnabled_onceToken, &__block_literal_global_475);
  }
  return isAppAnalyticsEnabled_appAnalyticsEnabled;
}

+ (BOOL)shouldLogForEntryKey:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  int v5 = +[PLUtilities logModeForEntryKey:a3 withKey:a4 andValue:a5];
  return !v5 || v5 == 3;
}

+ (id)transactionWorkQueue
{
  return +[PLUtilities workQueueForKey:@"transaction-release"];
}

+ (id)powerModelForOperatorName:(id)a3
{
  id v3 = a3;
  if (+[PLPlatform isHomePod])
  {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    int v5 = getPowermodels();
    id v4 = [v5 objectForKeyedSubscript:v3];
  }
  return v4;
}

+ (BOOL)isPingPongChargingWith:(BOOL)a3 andBatteryLevelPercent:(double)a4
{
  return a4 > 95.0 && a3;
}

+ (id)bundleIDFromURL:(id)a3
{
  if (a3)
  {
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    id v4 = Unique;
    if (Unique)
    {
      int v5 = CFBundleGetIdentifier(Unique);
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

+ (id)MavRevStringQuery
{
  if (MavRevStringQuery_onceToken != -1) {
    dispatch_once(&MavRevStringQuery_onceToken, &__block_literal_global_692);
  }
  id v2 = (void *)MavRevStringQuery_plMavRevString;
  return v2;
}

+ (double)roundToSigFigDouble:(double)a3 withSigFig:(int)a4
{
  double result = 0.0;
  if (a3 != 0.0)
  {
    double v7 = -a3;
    if (a3 >= 0.0) {
      double v7 = a3;
    }
    double v8 = log10(v7);
    double v9 = __exp10((double)(int)(a4 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)round(v9 * a3) / v9;
  }
  return result;
}

+ (BOOL)isFullModeDaemon
{
  if (isFullModeDaemon_onceToken != -1) {
    dispatch_once(&isFullModeDaemon_onceToken, &__block_literal_global_410);
  }
  return isFullModeDaemon_isFullModeDaemon;
}

void __28__PLUtilities_containerPath__block_invoke()
{
  unsigned int v0 = (void *)MEMORY[0x1C1869120]();
  uint64_t v1 = container_system_group_path_for_identifier();
  if (v1)
  {
    id v2 = (void *)v1;
    uint64_t v3 = [NSString stringWithUTF8String:v1];
    id v4 = (void *)containerPath_containerPath;
    containerPath_containerPath = v3;

    free(v2);
  }
  else
  {
    NSLog(&cfstr_ErrorFetchingG.isa, 1);
    +[PLUtilities exitSafe:1];
  }
}

+ (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 withName:(id)a5 error:(id *)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    v18 = @"override-fileName";
    v19[0] = v10;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  int v14 = PLOSAMoveFileForSubmissions();

  if (v14)
  {
    long long v15 = [v8 lastPathComponent];
    long long v16 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingPathComponent:v15];
    +[PLUtilities markFileAsPurgeable:v16 withUrgency:512];
  }
  return v14;
}

+ (BOOL)PLCopyItemsFromPath:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v24 = 0;
  id v8 = [v7 contentsOfDirectoryAtPath:v5 error:&v24];
  id v9 = v24;
  if (v9)
  {
    id v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities PLCopyItemsFromPath:toPath:]();
    }

    int v11 = *((unsigned __int8 *)v26 + 24);
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
    id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __42__PLUtilities_PLCopyItemsFromPath_toPath___block_invoke;
    v17[3] = &unk_1E6254AC0;
    id v14 = v12;
    id v18 = v14;
    id v15 = v13;
    id v19 = v15;
    v23 = &v25;
    id v20 = v7;
    id v21 = v5;
    id v22 = v6;
    [v8 enumerateObjectsUsingBlock:v17];
    int v11 = *((unsigned __int8 *)v26 + 24);
  }
  _Block_object_dispose(&v25, 8);

  return v11 != 0;
}

void __42__PLUtilities_PLCopyItemsFromPath_toPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 URLByAppendingPathComponent:v7];
  id v9 = [*(id *)(a1 + 40) URLByAppendingPathComponent:v7];

  id v10 = *(void **)(a1 + 48);
  id v15 = 0;
  char v11 = [v10 copyItemAtURL:v8 toURL:v9 error:&v15];
  id v12 = v15;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v11;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v13 = [v9 absoluteString];
    +[PLUtilities markFileAsPurgeable:v13 withUrgency:512];
  }
  else
  {
    id v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __42__PLUtilities_PLCopyItemsFromPath_toPath___block_invoke_cold_1(a1, (uint64_t)v12, v14);
    }

    *a4 = 1;
  }
}

+ (BOOL)createAndChownDirectory:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v6 = v13;

  if (v5)
  {
    +[PLUtilities setMobileOwnerForFile:v3];
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"error=%@", v6];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = [NSString stringWithUTF8String:"+[PLUtilities createAndChownDirectory:]"];
    +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:208];

    char v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  return v5;
}

+ (BOOL)createAndChownDirectoryIfDirectoryDoesNotExist:(id)a3
{
  id v3 = a3;
  char v8 = 0;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3 isDirectory:&v8];

  BOOL v6 = 0;
  if ((v5 & 1) == 0) {
    BOOL v6 = +[PLUtilities createAndChownDirectory:v3];
  }

  return v6;
}

+ (void)setMobileOwnerForFile:(id)a3
{
  id v3 = a3;
  id v4 = getpwnam("mobile");
  id v5 = v3;
  BOOL v6 = (const char *)[v5 fileSystemRepresentation];

  uid_t pw_uid = v4->pw_uid;
  gid_t pw_gid = v4->pw_gid;
  chown(v6, pw_uid, pw_gid);
}

+ (void)setPermissionsForFile:(id)a3 toValue:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v17 = *MEMORY[0x1E4F28330];
  id v7 = [NSNumber numberWithUnsignedShort:v4];
  v18[0] = v7;
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v9 = NSString;
  id v10 = v5;
  char v11 = objc_msgSend(v9, "stringWithUTF8String:", objc_msgSend(v10, "UTF8String"));
  id v16 = 0;
  char v12 = [v6 setAttributes:v8 ofItemAtPath:v11 error:&v16];
  id v13 = v16;

  id v14 = PLLogCommon();
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[PLUtilities setPermissionsForFile:toValue:]();
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    +[PLUtilities setPermissionsForFile:toValue:]();
  }
}

+ (BOOL)compressWithSource:(id)a3 withDestination:(id)a4 withLevel:(int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = PLLogZlib();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "compressWithSource: source file = %@, destination file = %@", (uint8_t *)&v22, 0x16u);
  }

  id v9 = v6;
  id v10 = fopen((const char *)[v9 UTF8String], "r");
  if (!v10)
  {
    id v18 = PLLogZlib();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities compressWithSource:withDestination:withLevel:]();
    }

    goto LABEL_18;
  }
  char v11 = v10;
  id v12 = v7;
  id v13 = fopen((const char *)[v12 UTF8String], "w");
  id v14 = PLLogZlib();
  id v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities compressWithSource:withDestination:withLevel:]();
    }

    uint64_t v17 = v11;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[PLUtilities compressWithSource:withDestination:withLevel:].cold.4();
  }

  if (+[PLUtilities compressWithSourceStream:v11 withDestination:v13 withLevel:4])
  {
    id v16 = PLLogZlib();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities compressWithSource:withDestination:withLevel:]();
    }

    fclose(v11);
    uint64_t v17 = v13;
LABEL_17:
    fclose(v17);
LABEL_18:
    BOOL v19 = 0;
    goto LABEL_19;
  }
  fclose(v11);
  fclose(v13);
  id v21 = PLLogZlib();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl(&dword_1BBD2F000, v21, OS_LOG_TYPE_DEFAULT, "compressWithSource: successfully decompressed %@ to %@", (uint8_t *)&v22, 0x16u);
  }

  BOOL v19 = 1;
LABEL_19:

  return v19;
}

+ (int)compressWithSourceStream:(__sFILE *)a3 withDestination:(__sFILE *)a4 withLevel:(int)a5
{
  v18[1024] = *MEMORY[0x1E4F143B8];
  memset(&v16, 0, sizeof(v16));
  uint64_t v8 = deflateInit2_(&v16, a5, 8, 31, 8, 0, "1.2.12", 112);
  if (v8)
  {
    int v9 = v8;
    [a1 reportZlibResultToCA:v8 forEvent:@"com.apple.powerlog.zlib.compress"];
  }
  else
  {
LABEL_3:
    size_t v10 = fread(v18, 1uLL, 0x2000uLL, a3);
    if (v10 >= 0xFFFFFFFF) {
      +[PLUtilities compressWithSourceStream:withDestination:withLevel:]();
    }
    v16.avail_in = v10;
    if (!ferror(a3))
    {
      int v11 = feof(a3);
      v16.next_in = (Bytef *)v18;
      while (1)
      {
        v16.avail_out = 0x2000;
        v16.next_out = __ptr;
        int v12 = deflate(&v16, 4 * (v11 != 0));
        if (v12 == -2) {
          +[PLUtilities compressWithSourceStream:withDestination:withLevel:]();
        }
        int v13 = v12;
        size_t v14 = 0x2000 - v16.avail_out;
        if (fwrite(__ptr, 1uLL, v14, a4) != v14 || ferror(a4)) {
          break;
        }
        if (v16.avail_out)
        {
          if (v16.avail_in) {
            +[PLUtilities compressWithSourceStream:withDestination:withLevel:].cold.4();
          }
          if (v11)
          {
            if (v13 != 1) {
              +[PLUtilities compressWithSourceStream:withDestination:withLevel:]();
            }
            deflateEnd(&v16);
            return 0;
          }
          goto LABEL_3;
        }
      }
    }
    int v9 = -1;
    objc_msgSend(a1, "reportZlibResultToCA:forEvent:", 0xFFFFFFFFLL, @"com.apple.powerlog.zlib.compress", v16.next_in);
    deflateEnd(&v16);
  }
  return v9;
}

+ (BOOL)decompressWithSource:(id)a3 withDestination:(id)a4 withRemoveSrc:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = NSString;
  size_t v10 = [v7 pathExtension];
  int v11 = [v9 stringWithFormat:@".%@", v10];

  char v12 = [v11 isEqualToString:@".gz"];
  int v13 = PLLogZlib();
  size_t v14 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.6();
    }

    goto LABEL_24;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v7;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEFAULT, "decompressWithSource: source file = %@, destination file = %@", buf, 0x16u);
  }

  id v15 = v7;
  z_stream v16 = fopen((const char *)[v15 UTF8String], "r");
  if (!v16)
  {
    __int16 v24 = PLLogZlib();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:]();
    }
    goto LABEL_20;
  }
  uint64_t v17 = v16;
  id v18 = v8;
  BOOL v19 = fopen((const char *)[v18 UTF8String], "w");
  id v20 = PLLogZlib();
  id v21 = v20;
  if (!v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:]();
    }

    fclose(v17);
    goto LABEL_24;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.5();
  }

  if (+[PLUtilities decompressWithSourceStream:v17 withDestinationStream:v19])
  {
    int v22 = PLLogZlib();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.4();
    }

    fclose(v17);
    fclose(v19);
    id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v30 = 0;
    [v23 removeItemAtPath:v18 error:&v30];
    __int16 v24 = v30;

    if (v24)
    {
      id v25 = PLLogZlib();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:]();
      }
    }
LABEL_20:

LABEL_24:
    BOOL v26 = 0;
    goto LABEL_25;
  }
  fclose(v17);
  fclose(v19);
  char v28 = PLLogZlib();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v18;
    _os_log_impl(&dword_1BBD2F000, v28, OS_LOG_TYPE_DEFAULT, "decompressWithSource: successfully decompressed %@ to %@", buf, 0x16u);
  }

  if (v5)
  {
    uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v29 removeItemAtPath:v15 error:0];
  }
  BOOL v26 = 1;
LABEL_25:

  return v26;
}

+ (int)decompressWithSourceStream:(__sFILE *)a3 withDestinationStream:(__sFILE *)a4
{
  v17[1024] = *MEMORY[0x1E4F143B8];
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = 0;
  strm.next_in = 0;
  uint64_t v7 = inflateInit2_(&strm, 31, "1.2.12", 112);
  if (v7)
  {
    [a1 reportZlibResultToCA:v7 forEvent:@"com.apple.powerlog.zlib.decompress"];
  }
  else
  {
    while (2)
    {
      uInt v8 = fread(v17, 1uLL, 0x2000uLL, a3);
      strm.avail_in = v8;
      if (ferror(a3))
      {
LABEL_18:
        LODWORD(v7) = -1;
        id v12 = a1;
        uint64_t v13 = 0xFFFFFFFFLL;
LABEL_16:
        [v12 reportZlibResultToCA:v13 forEvent:@"com.apple.powerlog.zlib.decompress"];
        inflateEnd(&strm);
      }
      else
      {
        if (v8)
        {
          strm.next_in = (Bytef *)v17;
          do
          {
            strm.avail_out = 0x2000;
            strm.next_out = __ptr;
            uint64_t v9 = inflate(&strm, 0);
            uint64_t v7 = v9;
            if ((v9 + 4) < 2) {
              goto LABEL_15;
            }
            if (v9 == 2)
            {
              uint64_t v7 = 4294967293;
LABEL_15:
              id v12 = a1;
              uint64_t v13 = v7;
              goto LABEL_16;
            }
            if (v9 == -2) {
              +[PLUtilities decompressWithSourceStream:withDestinationStream:]();
            }
            size_t v10 = 0x2000 - strm.avail_out;
            if (fwrite(__ptr, 1uLL, v10, a4) != v10 || ferror(a4)) {
              goto LABEL_18;
            }
          }
          while (!strm.avail_out);
          if (v7 != 1) {
            continue;
          }
          int v11 = 0;
        }
        else
        {
          int v11 = v7 != 1;
          if (v7 >= 2)
          {
            [a1 reportZlibResultToCA:v7 forEvent:@"com.apple.powerlog.zlib.decompress"];
            int v11 = 1;
          }
        }
        inflateEnd(&strm);
        LODWORD(v7) = v11 << 31 >> 31;
      }
      break;
    }
  }
  return v7;
}

+ (void)reportZlibResultToCA:(int)a3 forEvent:(id)a4
{
  id v4 = a4;
  BOOL v5 = PLLogZlib();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[PLUtilities reportZlibResultToCA:forEvent:]();
  }

  AnalyticsSendEventLazy();
}

id __45__PLUtilities_reportZlibResultToCA_forEvent___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"errorID";
  uint64_t v1 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)extractDateStringAndUUIDStringFromFilePath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"."];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v3 substringToIndex:v4];
    uint64_t v7 = [v6 componentsSeparatedByString:@"_"];
    if ((unint64_t)[v7 count] >= 2)
    {
      BOOL v5 = objc_msgSend(v7, "subarrayWithRange:", objc_msgSend(v7, "count") - 2, 2);
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

+ (unint64_t)directorySize:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v5 = [v4 subpathsOfDirectoryAtPath:v3 error:0];
  id v6 = [v5 objectEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    uInt v8 = (void *)v7;
    unint64_t v9 = 0;
    do
    {
      size_t v10 = [v3 stringByAppendingPathComponent:v8];
      int v11 = [v4 attributesOfItemAtPath:v10 error:0];

      v9 += [v11 fileSize];
      uint64_t v12 = [v6 nextObject];

      uInt v8 = (void *)v12;
    }
    while (v12);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (int)numFilesAtPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  BOOL v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities numFilesAtPath:]();
    }
    int v8 = -1;
  }
  else
  {
    int v8 = [v5 count];
    uint64_t v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 1024;
      int v14 = v8;
      _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_DEFAULT, "Num files at %@ = %d", buf, 0x12u);
    }
  }

  return v8;
}

+ (int64_t)compareFilesByKey:(id)a3 file1:(id)a4 file2:(id)a5 sortAscending:(BOOL)a6
{
  BOOL v6 = a6;
  id v17 = 0;
  id v9 = a5;
  id v10 = a3;
  [a4 getResourceValue:&v17 forKey:v10 error:0];
  id v11 = v17;
  z_stream v16 = 0;
  [v9 getResourceValue:&v16 forKey:v10 error:0];

  id v12 = v16;
  if (v6)
  {
    __int16 v13 = v11;
  }
  else
  {
    __int16 v13 = v16;
    id v12 = v11;
  }
  int64_t v14 = [v13 compare:v12];

  return v14;
}

+ (int)remove:(int)a3 oldestFilesFromDirectory:(id)a4 containingFileNameSubstring:(id)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  int v9 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 0;
  if (a3 >= 1 && v7)
  {
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__10;
    v33[4] = __Block_byref_object_dispose__10;
    id v34 = 0;
    id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    v42[0] = *MEMORY[0x1E4F1C540];
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    id v32 = 0;
    __int16 v13 = [v10 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:v12 options:4 error:&v32];
    id v14 = v32;

    if (v14)
    {
      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[PLUtilities remove:oldestFilesFromDirectory:containingFileNameSubstring:]();
      }

      int v9 = *((_DWORD *)v36 + 6);
    }
    else
    {
      z_stream v16 = [MEMORY[0x1E4F1CA48] array];
      if (v8)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke;
        v29[3] = &unk_1E6254B08;
        id v17 = v8;
        id v30 = v17;
        id v18 = v16;
        id v31 = v18;
        [v13 enumerateObjectsUsingBlock:v29];
        BOOL v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          +[PLUtilities remove:oldestFilesFromDirectory:containingFileNameSubstring:]((uint64_t)v17, v41, [v18 count], v19);
        }

        id v20 = v30;
      }
      else
      {
        id v18 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];

        id v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          +[PLUtilities remove:oldestFilesFromDirectory:containingFileNameSubstring:]();
        }
      }

      id v21 = [v18 sortedArrayUsingComparator:&__block_literal_global_85];
      int v22 = objc_msgSend(v21, "subarrayWithRange:", 0, a3);
      id v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v22;
        _os_log_impl(&dword_1BBD2F000, v23, OS_LOG_TYPE_INFO, "Removing files: %@", buf, 0xCu);
      }

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_86;
      v25[3] = &unk_1E6254B30;
      uint64_t v27 = v33;
      id v26 = v10;
      char v28 = &v35;
      [v22 enumerateObjectsUsingBlock:v25];
      int v9 = *((_DWORD *)v36 + 6);
    }
    _Block_object_dispose(v33, 8);
  }
  _Block_object_dispose(&v35, 8);

  return v9;
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 lastPathComponent];
  int v4 = [v3 containsString:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

uint64_t __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v19 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C540];
  id v18 = 0;
  [v4 getResourceValue:&v19 forKey:v6 error:&v18];
  id v7 = v19;
  unint64_t v8 = (unint64_t)v18;
  id v16 = 0;
  id v17 = 0;
  [v5 getResourceValue:&v17 forKey:v6 error:&v16];
  id v9 = v17;
  unint64_t v10 = (unint64_t)v16;
  if (v8 | v10)
  {
    if (v8)
    {
      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_82_cold_2();
      }
    }
    if (v10)
    {
      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_82_cold_2();
      }
    }
    __int16 v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_82_cold_1();
    }

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [v7 compare:v9];
  }

  return v14;
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_86(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v7 + 40);
  [v6 removeItemAtURL:v3 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    unint64_t v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_86_cold_1();
    }
  }
  else
  {
    ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  }
}

+ (BOOL)markFilesInDirectoryAsPurgeable:(id)a3 ofType:(id)a4 withUrgency:(unint64_t)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v36 = 0;
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v7 isDirectory:&v36];
  int v11 = v36;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    id v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities markFilesInDirectoryAsPurgeable:ofType:withUrgency:]();
    }
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v35 = 0;
    uint64_t v15 = [v14 contentsOfDirectoryAtPath:v7 error:&v35];
    id v16 = v35;

    if (v16)
    {
      id v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[PLUtilities markFilesInDirectoryAsPurgeable:ofType:withUrgency:]();
      }
      BOOL v13 = 0;
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v29 = v15;
        id v30 = v7;
        uint64_t v20 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v17);
            }
            int v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            id v23 = NSString;
            __int16 v24 = [v22 pathExtension];
            id v25 = [v23 stringWithFormat:@".%@", v24];

            if (v8 && ([v8 containsObject:v25] & 1) == 0)
            {
              id v26 = PLLogCommon();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v27 = [v22 pathExtension];
                *(_DWORD *)buf = 138412546;
                int v38 = v22;
                __int16 v39 = 2112;
                v40 = v27;
                _os_log_debug_impl(&dword_1BBD2F000, v26, OS_LOG_TYPE_DEBUG, "Skipping %@ for marking as purgeable -- file is of type '%@' & doesn't not match given extension filter.", buf, 0x16u);
              }
            }
            else if (!+[PLUtilities markFileAsPurgeable:v22 withUrgency:a5])
            {

              BOOL v13 = 0;
              goto LABEL_27;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v41 count:16];
          BOOL v13 = 1;
        }
        while (v19);
LABEL_27:
        id v16 = 0;
        id v7 = v30;
        uint64_t v15 = v29;
      }
      else
      {
        BOOL v13 = 1;
      }
    }
  }
  return v13;
}

+ (BOOL)markFilesAsPurgeable:(id)a3 withUrgency:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!+[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", *(void *)(*((void *)&v12 + 1) + 8 * i), a4, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

+ (BOOL)markFileAsPurgeable:(id)a3 withUrgency:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v16 = a4 | 0x10005;
  id v5 = a3;
  int v6 = open((const char *)[v5 UTF8String], 0);
  if (v6 < 0)
  {
    BOOL v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities markFileAsPurgeable:withUrgency:]((uint64_t)v5, v10);
    }
    goto LABEL_7;
  }
  int v7 = v6;
  int v8 = ffsctl(v6, 0xC0084A44uLL, &v16, 0);
  close(v7);
  id v9 = PLLogCommon();
  BOOL v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v11 = v16;
      long long v12 = __error();
      long long v13 = strerror(*v12);
      *(_DWORD *)buf = 138413058;
      id v18 = v5;
      __int16 v19 = 2048;
      unint64_t v20 = v11;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 2080;
      __int16 v24 = v13;
      _os_log_error_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_ERROR, "Failed to mark %@ purgeable - flags 0x%llx returned %d (%s)", buf, 0x26u);
    }
LABEL_7:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "Marked %@ purgeable with urgency: %llu", buf, 0x16u);
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

void __31__PLUtilities_workQueueForKey___block_invoke()
{
  if (+[PLUtilities isPowerlogHelperd]) {
    int v0 = 25;
  }
  else {
    int v0 = 9;
  }
  workQueueForKey__qos = v0;
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)workQueueForKey__workQueueDictionary;
  workQueueForKey__workQueueDictionary = v1;

  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)workQueueForKey__qos, 0);

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.powerlog.workqueue.general", attr);
  [(id)workQueueForKey__workQueueDictionary setObject:v4 forKeyedSubscript:@"__GeneralWorkQueue__"];
}

+ (id)workQueue
{
  return +[PLUtilities workQueueForKey:@"__GeneralWorkQueue__"];
}

+ (unint64_t)dispatchTimeInSeconds:(double)a3
{
  return dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
}

uint64_t __52__PLUtilities_postNotificationName_object_userInfo___block_invoke()
{
  postNotificationName_object_userInfo__notificationQueue = +[PLUtilities workQueueForKey:@"PostNotificationQueue"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __35__PLUtilities_getMachbaseTimeRatio__block_invoke()
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  if (result)
  {
    uint64_t result = _os_assumes_log();
    double v3 = 1.0;
  }
  else
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    double v3 = (double)v1 / (double)v2;
  }
  getMachbaseTimeRatio_ratio = *(void *)&v3;
  return result;
}

+ (id)dateFromTimevalSystemTime:(timeval)a3
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)a3.tv_usec / 1000000.0 + (double)a3.tv_sec];
}

+ (id)deviceBootTime
{
  if (deviceBootTime_onceToken != -1) {
    dispatch_once(&deviceBootTime_onceToken, &__block_literal_global_107);
  }
  unint64_t v2 = (void *)deviceBootTime_bootTime;
  return (id)[v2 convertFromSystemToMonotonic];
}

void __29__PLUtilities_deviceBootTime__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  *(void *)id v5 = 0x1500000001;
  size_t v4 = 16;
  if (sysctl(v5, 2u, &v2, &v4, 0, 0) != -1)
  {
    uint64_t v0 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(int)v3 / 1000000.0 + (double)v2];
    unint64_t v1 = (void *)deviceBootTime_bootTime;
    deviceBootTime_bootTime = v0;
  }
}

+ (id)deviceBootUUID
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  memset(v24, 0, sizeof(v24));
  size_t v23 = 37;
  int v2 = sysctlbyname("kern.bootsessionuuid", v24, &v23, 0, 0);
  if (v2)
  {
    if (v2 == -1) {
      +[PLUtilities deviceBootUUID]();
    }
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__PLUtilities_deviceBootUUID__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v3;
      if (deviceBootUUID_defaultOnce != -1) {
        dispatch_once(&deviceBootUUID_defaultOnce, block);
      }
      if (deviceBootUUID_classDebugEnabled)
      {
        size_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"failed to get system boot session uuid %d", *__error());
        id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
        uint64_t v6 = [v5 lastPathComponent];
        int v7 = [NSString stringWithUTF8String:"+[PLUtilities deviceBootUUID]"];
        +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:821];

        int v8 = PLLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        id v9 = 0;
LABEL_17:

        goto LABEL_19;
      }
    }
    id v9 = 0;
  }
  else
  {
    v24[36] = 0;
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    unint64_t v11 = [NSString stringWithUTF8String:v24];
    id v9 = (void *)[v10 initWithUUIDString:v11];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      __int16 v19 = __29__PLUtilities_deviceBootUUID__block_invoke_117;
      unint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v21 = v12;
      if (deviceBootUUID_defaultOnce_115 != -1) {
        dispatch_once(&deviceBootUUID_defaultOnce_115, &v17);
      }
      if (deviceBootUUID_classDebugEnabled_116)
      {
        size_t v4 = [NSString stringWithFormat:@"system boot session uuid: %@", v9, v17, v18, v19, v20, v21];
        long long v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
        BOOL v14 = [v13 lastPathComponent];
        long long v15 = [NSString stringWithUTF8String:"+[PLUtilities deviceBootUUID]"];
        +[PLCoreStorage logMessage:v4 fromFile:v14 fromFunction:v15 fromLineNumber:826];

        int v8 = PLLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_17;
      }
    }
  }
LABEL_19:
  return v9;
}

BOOL __29__PLUtilities_deviceBootUUID__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  deviceBootUUID_classDebugEnabled = result;
  return result;
}

BOOL __29__PLUtilities_deviceBootUUID__block_invoke_117(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  deviceBootUUID_classDebugEnabled_116 = result;
  return result;
}

+ (BOOL)deviceRebooted
{
  if (deviceRebooted_onceToken != -1) {
    dispatch_once(&deviceRebooted_onceToken, &__block_literal_global_122);
  }
  return deviceRebooted___deviceRebooted;
}

void __29__PLUtilities_deviceRebooted__block_invoke()
{
  id v3 = +[PLUtilities deviceBootUUID];
  if (!v3)
  {
    deviceRebooted___deviceRebooted = 0;
    goto LABEL_9;
  }
  uint64_t v0 = +[PLDefaults objectForKey:@"BootSessionUUID"];
  if (v0)
  {
    unint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v0];
    deviceRebooted___deviceRebooted = [v1 isEqual:v3] ^ 1;

    if (!deviceRebooted___deviceRebooted) {
      goto LABEL_8;
    }
  }
  else
  {
    deviceRebooted___deviceRebooted = 1;
  }
  int v2 = [v3 UUIDString];
  +[PLDefaults setObject:v2 forKey:@"BootSessionUUID" saveToDisk:1];

LABEL_8:
LABEL_9:
}

+ (double)getLastSystemTimeOffset
{
  int v2 = +[PLOperator entryKeyForType:@"EventForward" andName:@"TimeOffset"];
  id v3 = +[PowerlogCore sharedCore];
  size_t v4 = [v3 storage];
  id v5 = [v4 lastEntryForKey:v2];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"system"];
  [v6 doubleValue];
  double v8 = v7;

  id v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[PLUtilities getLastSystemTimeOffset];
  }

  return v8;
}

+ (id)getFirstBatteryTimestamp
{
  int v2 = +[PowerlogCore sharedCore];
  id v3 = [v2 storage];
  size_t v4 = [v3 firstEntryForKey:@"PLBatteryAgent_EventBackward_Battery"];

  id v5 = [v4 entryDate];

  return v5;
}

+ (id)getLastBatteryTimestamp
{
  int v2 = +[PowerlogCore sharedCore];
  id v3 = [v2 storage];
  size_t v4 = [v3 lastEntryForKey:@"PLBatteryAgent_EventBackward_Battery"];

  id v5 = [v4 entryDate];

  return v5;
}

BOOL __74__PLUtilities_getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__classDebugEnabled = result;
  return result;
}

BOOL __74__PLUtilities_getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime___block_invoke_136(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__classDebugEnabled_135 = result;
  return result;
}

double __30__PLUtilities_getMachTimebase__block_invoke()
{
  if (mach_timebase_info((mach_timebase_info_t)&getMachTimebase_machTimeInfo))
  {
    _os_assumes_log();
  }
  else if (dword_1EBA00304)
  {
    return result;
  }
  *(void *)&double result = 0x100000001;
  getMachTimebase_machTimeInfo = 0x100000001;
  return result;
}

+ (unint64_t)getCurrMachAbsTimeInSecs
{
  uint64_t v3 = mach_absolute_time();
  size_t v4 = (unsigned int *)[a1 getMachTimebase];
  return v3 * *v4 / v4[1] / 0x3B9ACA00;
}

+ (signed)connectionToQuarantine:(id)a3
{
  id v3 = a3;
  size_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 filePath];
    char v6 = [v5 hasSuffix:@".PLSQL"];

    if (v6)
    {
      signed __int16 v7 = 1;
    }
    else
    {
      double v8 = [v4 filePath];
      char v9 = [v8 hasSuffix:@".EPSQL"];

      if (v9)
      {
        signed __int16 v7 = 2;
      }
      else
      {
        uint64_t v10 = [v4 filePath];
        char v11 = [v10 hasSuffix:@".CESQL"];

        if (v11)
        {
          signed __int16 v7 = 3;
        }
        else
        {
          uint64_t v12 = [v4 filePath];
          char v13 = [v12 hasSuffix:@".XCSQL"];

          if (v13)
          {
            signed __int16 v7 = 4;
          }
          else
          {
            uint64_t v14 = [v4 filePath];
            int v15 = [v14 hasSuffix:@".BGSQL"];

            if (v15) {
              signed __int16 v7 = 5;
            }
            else {
              signed __int16 v7 = 0;
            }
          }
        }
      }
    }
  }
  else
  {
    signed __int16 v7 = 0;
  }

  return v7;
}

+ (void)exitWithReason:(signed __int16)a3
{
}

+ (void)exitWithReason:(signed __int16)a3 connection:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v5 = +[PLUtilities connectionToQuarantine:a4];
  +[PLUtilities exitWithReason:v4 action:v5];
}

+ (void)exitWithReason:(signed __int16)a3 action:(signed __int16)a4
{
  char v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PLUtilities_exitWithReason_action___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  signed __int16 v8 = a3;
  signed __int16 v9 = a4;
  dispatch_async(v6, block);
}

void __37__PLUtilities_exitWithReason_action___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (+[PLDefaults debugEnabled])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"exitReason=%i", *(__int16 *)(a1 + 32));
    int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t v5 = [NSString stringWithUTF8String:"+[PLUtilities exitWithReason:action:]_block_invoke"];
    +[PLCoreStorage logMessage:v2 fromFile:v4 fromFunction:v5 fromLineNumber:979];

    char v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v2;
      _os_log_debug_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  __int16 v7 = *(_WORD *)(a1 + 34);
  if (+[PLUtilities PreUnlockTelemetryEnabled])
  {
    char v8 = 0;
  }
  else
  {
    signed __int16 v9 = +[PowerlogCore sharedCore];
    uint64_t v10 = [v9 storage];
    char v8 = [v10 storageLocked];
  }
  int v11 = *(__int16 *)(a1 + 32);
  if (v11 > 99 || (v8 & 1) != 0)
  {
    if (v11 >= 1001)
    {
      int v15 = +[PLUtilities containerPath];
      uint64_t v16 = [v15 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
      +[PLUtilities createAndChownDirectory:v16];

      uint64_t v17 = +[PLUtilities containerPath];
      uint64_t v18 = [v17 stringByAppendingString:@"/Library/PerfPowerTelemetry/Quarantine/"];
      +[PLUtilities createAndChownDirectory:v18];

      __int16 v19 = @"%@CorruptPowerlog_%f%@";
      unint64_t v20 = @"PLExitReasonCorrupt";
      switch(*(_WORD *)(a1 + 32))
      {
        case 0x3E9:
          goto LABEL_24;
        case 0x3EA:
          __int16 v7 = 0;
          __int16 v19 = @"%@SubmissionTimeoutPowerlog_%f%@";
          unint64_t v20 = @"PLExitReasonSubmissionTimeout";
          goto LABEL_24;
        case 0x3EB:
          __int16 v19 = @"%@ArchiveTimeoutPowerlog_%f%@";
          unint64_t v20 = @"PLExitReasonArchiveTimeout";
          goto LABEL_24;
        case 0x3EC:
          __int16 v19 = @"%@ArchiveMaxAttemptsPowerlog_%f%@";
          unint64_t v20 = @"PLExitReasonArchiveMaxAttempts";
          goto LABEL_24;
        case 0x3ED:
          __int16 v19 = @"%@TooLargePowerlog_%f%@";
          unint64_t v20 = @"PLExitReasonTooLarge";
          goto LABEL_24;
        case 0x3EE:
          __int16 v19 = @"%@MonotonicTimePowerlog_%f%@";
          __int16 v7 = 6;
          unint64_t v20 = @"PLExitReasonMonotonicTime";
          goto LABEL_24;
        case 0x3EF:
          __int16 v19 = @"%@SQLVersionMismatchPowerlog_%f%@";
          unint64_t v20 = @"PLExitReasonSQLVersionMismatch";
          goto LABEL_24;
        case 0x3F0:
          __int16 v19 = @"%@NewFileRequiredPowerlog_%f%@";
          unint64_t v20 = @"PLExitReasonNewFileRequired";
          goto LABEL_24;
        case 0x3F1:
          __int16 v19 = @"%@KernelTimePowerlog_%f%@";
          __int16 v7 = 6;
          unint64_t v20 = @"kPLExitReasonDescKernelTime";
LABEL_24:
          PLADClientAddValueForScalarKey();
          AnalyticsSendEventLazy();
          break;
        default:
          unint64_t v20 = 0;
          __int16 v19 = 0;
          break;
      }
      if (+[PLUtilities isPowerlogHelperd]) {
        __int16 v7 = 0;
      }
      +[PLUtilities quarantineToPath:v19 action:v7];
      +[PLDefaults setObject:0 forKey:@"PLUUID" saveToDisk:1];
LABEL_28:
      if (!+[PLUtilities isPowerlogHelperd])
      {
        uint64_t v21 = [NSNumber numberWithShort:*(__int16 *)(a1 + 32)];
        +[PLDefaults setObject:v21 forKey:@"PLExitReasonKey" saveToDisk:1];
      }
      int v22 = *(__int16 *)(a1 + 32);
      if (v22 >= 1001)
      {
        size_t v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v25 = v20;
          __int16 v26 = 1024;
          int v27 = v7;
          _os_log_fault_impl(&dword_1BBD2F000, v23, OS_LOG_TYPE_FAULT, "Exiting due to %{public}@ action=%d", buf, 0x12u);
        }

        LOWORD(v22) = *(_WORD *)(a1 + 32);
      }
      exit((__int16)v22 > 99);
    }
  }
  else if (!+[PLUtilities isPowerlogHelperd])
  {
    uint64_t v12 = +[PowerlogCore sharedCore];
    char v13 = [v12 storage];
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"ExitReason=%i", *(__int16 *)(a1 + 32));
    [v13 blockingFlushCachesWithReason:v14];
  }
  unint64_t v20 = 0;
  goto LABEL_28;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_178()
{
  return &unk_1F1586FF8;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_2()
{
  return &unk_1F1587020;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_3()
{
  return &unk_1F1587048;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_4()
{
  return &unk_1F1587070;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_5()
{
  return &unk_1F1587098;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_6()
{
  return &unk_1F15870C0;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_7()
{
  return &unk_1F15870E8;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_8()
{
  return &unk_1F1587110;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_9()
{
  return &unk_1F1587138;
}

+ (void)exitWithReasonSync:(signed __int16)a3
{
  uint64_t v3 = a3;
  dsema = dispatch_semaphore_create(0);
  [a1 exitWithReason:v3];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)exitSafe:(int)a3
{
}

+ (void)quarantineToPath:(id)a3 action:(signed __int16)a4
{
  int v4 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  uint64_t v8 = v7;

  signed __int16 v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v55 = v4;
    _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "quarantine action: %hd", buf, 8u);
  }

  if (v4 == 6 || v4 == 1)
  {
    int v11 = NSString;
    uint64_t v12 = +[PLUtilities containerPath];
    char v13 = [v12 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
    uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", v5, v13, v8, @".PLSQL");

    int v15 = +[PPSCoreStorage sharedSQLStorage];
    uint64_t v16 = [v15 PLSQLConnection];
    [v9 setObject:v16 forKeyedSubscript:v14];
  }
  else
  {
    uint64_t v14 = 0;
  }
  if ((v4 | 4) == 6)
  {
    uint64_t v17 = NSString;
    uint64_t v18 = +[PLUtilities containerPath];
    __int16 v19 = [v18 stringByAppendingString:@"/Library/PerfPowerTelemetry/Quarantine/"];
    uint64_t v20 = objc_msgSend(v17, "stringWithFormat:", v5, v19, v8, @".EPSQL");

    uint64_t v21 = +[PPSCoreStorage sharedSQLStorage];
    int v22 = [v21 EPSQLConnection];
    [v9 setObject:v22 forKeyedSubscript:v20];

    uint64_t v14 = (void *)v20;
  }
  if (v4 == 6 || v4 == 3)
  {
    size_t v23 = NSString;
    __int16 v24 = +[PLUtilities containerPath];
    uint64_t v25 = [v24 stringByAppendingString:@"/Library/PerfPowerTelemetry/Quarantine/"];
    uint64_t v26 = objc_msgSend(v23, "stringWithFormat:", v5, v25, v8, @".CESQL");

    int v27 = +[PPSCoreStorage sharedSQLStorage];
    uint64_t v28 = [v27 CESQLConnection];
    [v9 setObject:v28 forKeyedSubscript:v26];

    uint64_t v14 = (void *)v26;
  }
  if ((v4 | 2) == 6)
  {
    uint64_t v29 = NSString;
    id v30 = +[PLUtilities containerPath];
    long long v31 = [v30 stringByAppendingString:@"/Library/PerfPowerTelemetry/Quarantine/"];
    uint64_t v32 = objc_msgSend(v29, "stringWithFormat:", v5, v31, v8, @".XCSQL");

    long long v33 = +[PPSCoreStorage sharedSQLStorage];
    long long v34 = [v33 XCSQLConnection];
    [v9 setObject:v34 forKeyedSubscript:v32];

    uint64_t v14 = (void *)v32;
  }
  if ((unsigned __int16)(v4 - 5) <= 1u)
  {
    id v35 = NSString;
    unsigned __int8 v36 = +[PLUtilities containerPath];
    uint64_t v37 = [v36 stringByAppendingString:@"/Library/PerfPowerTelemetry/Quarantine/"];
    uint64_t v38 = objc_msgSend(v35, "stringWithFormat:", v5, v37, v8, @".BGSQL");

    __int16 v39 = +[PPSCoreStorage sharedSQLStorage];
    v40 = [v39 BGSQLConnection];
    [v9 setObject:v40 forKeyedSubscript:v38];

    uint64_t v14 = (void *)v38;
  }
  BOOL v41 = +[PLUtilities shouldCreateQuarantine];
  uint64_t v42 = PLLogCommon();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v55 = v41;
    _os_log_impl(&dword_1BBD2F000, v42, OS_LOG_TYPE_DEFAULT, "should quarantine: %d", buf, 8u);
  }

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __39__PLUtilities_quarantineToPath_action___block_invoke;
  v51[3] = &unk_1E6254B58;
  id v43 = v9;
  id v52 = v43;
  BOOL v53 = v41;
  [v43 enumerateKeysAndObjectsUsingBlock:v51];
  if (+[PLDefaults fullMode] && (v4 == 6 || v4 == 1))
  {
    v44 = NSString;
    v45 = +[PLUtilities containerPath];
    v46 = [v45 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
    v47 = objc_msgSend(v44, "stringWithFormat:", v5, v46, v8, @".PLSQL");

    v48 = [v47 lastPathComponent];
    v49 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingString:v48];

    v50 = [v47 lastPathComponent];
    +[PLUtilities moveItemAtPath:v47 toPath:v49 withName:v50 error:0];

    +[PLUtilities markFileAsPurgeable:v49 withUrgency:512];
    uint64_t v14 = v47;
  }
}

void __39__PLUtilities_quarantineToPath_action___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __39__PLUtilities_quarantineToPath_action___block_invoke_cold_2(v4, v5);
  }

  char v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __39__PLUtilities_quarantineToPath_action___block_invoke_cold_1();
  }

  if (*(unsigned char *)(a1 + 40))
  {
    [v4 moveDatabaseToPath:v3];
    [(id)objc_opt_class() removeAdditionalFiles:v3];
    +[PLUtilities markFileAsPurgeable:v3 withUrgency:512];
  }
  else
  {
    [v4 truncateDB];
  }
}

+ (BOOL)shouldCreateQuarantine
{
  int v2 = +[PLUtilities containerPath];
  id v3 = [v2 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
  unsigned int v4 = +[PLUtilities numFilesAtPath:v3];

  if (v4 > 9) {
    return 0;
  }
  char v6 = +[PLUtilities containerPath];
  uint64_t v7 = [v6 stringByAppendingString:@"/Library/PerfPowerTelemetry/Quarantine/"];
  unsigned int v8 = +[PLUtilities numFilesAtPath:v7];

  return v8 < 0xA;
}

+ (BOOL)allowQueryFromPeer:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (_xpc_connection_s *)a3;
  xpc_connection_get_audit_token();
  memset(token, 0, 32);
  unsigned int v4 = SecTaskCreateWithAuditToken(0, (audit_token_t *)token);
  if (!v4)
  {
    uint64_t v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities allowQueryFromPeer:]();
    }
    goto LABEL_20;
  }
  id v5 = v4;
  uint32_t CodeSignStatus = SecTaskGetCodeSignStatus(v4);
  uint64_t v7 = SecTaskCopyValueForEntitlement(v5, @"com.apple.private.perfpowerservices.query.internal", 0);
  CFRelease(v5);
  unsigned int v8 = PLLogCommon();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    uint64_t pid = xpc_connection_get_pid(v3);
    int v11 = +[PLUtilities processNameForPid:pid];
    uint64_t v12 = +[PLUtilities bundleIDFromPid:pid];
    char v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)token = 67109890;
      *(_DWORD *)&token[4] = pid;
      *(_WORD *)&token[8] = 2112;
      *(void *)&token[10] = v11;
      *(_WORD *)&token[18] = 2112;
      *(void *)&token[20] = v12;
      *(_WORD *)&token[28] = 1024;
      *(_DWORD *)&token[30] = CodeSignStatus;
      _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_INFO, "query from pid:%d procName:%@ bundleID:%@ csStatus:%d", token, 0x22u);
    }
  }
  if ((CodeSignStatus & 0xC000001) == 0x4000001)
  {
    uint64_t v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)token = 67109120;
      *(_DWORD *)&token[4] = CodeSignStatus;
      int v15 = "allowing query %d";
      uint64_t v16 = v14;
      uint32_t v17 = 8;
LABEL_15:
      _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_INFO, v15, token, v17);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v7 || !+[PLPlatform internalBuild])
  {
    __int16 v19 = PLLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)token = 67109120;
      *(_DWORD *)&token[4] = CodeSignStatus;
      _os_log_impl(&dword_1BBD2F000, v19, OS_LOG_TYPE_INFO, "query denied %d", token, 8u);
    }

LABEL_20:
    BOOL v18 = 0;
    goto LABEL_21;
  }
  uint64_t v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)token = 0;
    int v15 = "alloiwng query becaues internal build and has proper entitlements";
    uint64_t v16 = v14;
    uint32_t v17 = 2;
    goto LABEL_15;
  }
LABEL_16:

  BOOL v18 = 1;
LABEL_21:

  return v18;
}

+ (id)getPerfStatsForProcess:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 monotonicDate];
  char v6 = [v5 dateByAddingTimeInterval:-86400.0];
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[PLUtilities getPerfStatsForProcess:]();
  }

  unsigned int v8 = NSString;
  [v6 timeIntervalSince1970];
  uint64_t v10 = v9;
  [v5 timeIntervalSince1970];
  uint64_t v12 = [v8 stringWithFormat:@"SELECT LaunchdName AS BundleID, SUM(cpu_time) AS cpu_seconds, SUM(cpu_instructions) AS cpu_instructions, SUM(cpu_cycles) AS cpu_cycles FROM %@ where LaunchdName = '%@' AND timestamp >= %f and timestamp < %f", @"PLCoalitionAgent_EventInterval_CoalitionInterval", v4, v10, v11];

  char v13 = PLLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v12;
    _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_DEFAULT, "[Perf Stats Query] %@", buf, 0xCu);
  }

  uint64_t v14 = +[PLSQLiteConnection sharedSQLiteConnection];
  int v15 = [v14 performQuery:v12];

  if ([v15 count]
    && ([v15 firstObject],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        [v16 objectForKeyedSubscript:@"BundleID"],
        uint32_t v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 isNil],
        v17,
        v16,
        !v18))
  {
    uint64_t v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v15 firstObject];
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v22;
      _os_log_impl(&dword_1BBD2F000, v21, OS_LOG_TYPE_DEFAULT, "Report perf stats to CA for %@", buf, 0xCu);
    }
    uint64_t v20 = [v15 firstObject];
  }
  else
  {
    __int16 v19 = PLLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities getPerfStatsForProcess:]();
    }

    uint64_t v20 = 0;
  }

  return v20;
}

void __40__PLUtilities_launchdNameToProcessName___block_invoke()
{
  uint64_t v0 = (void *)launchdNameToProcessName__launchdNameToProcessNameDict;
  launchdNameToProcessName__launchdNameToProcessNameDict = (uint64_t)&unk_1F1587160;
}

+ (id)binaryPathForPid:(int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", buffer, proc_pidpath(a3, buffer, 0x1000u), 4);
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];

  return v4;
}

+ (id)bundleIDFromProcessName:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 length])
  {
    if (bundleIDFromProcessName__onceToken != -1) {
      dispatch_once(&bundleIDFromProcessName__onceToken, &__block_literal_global_380);
    }
    id v4 = [(id)bundleIDFromProcessName__processNameToBundleID objectForKeyedSubscript:v3];

    if (v4)
    {
      id v5 = [(id)bundleIDFromProcessName__processNameToBundleID objectForKeyedSubscript:v3];
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __39__PLUtilities_bundleIDFromProcessName___block_invoke_2;
      v14[3] = &unk_1E6254B80;
      id v7 = v3;
      id v15 = v7;
      unsigned int v8 = (void (**)(void, void, void))MEMORY[0x1C1869370](v14);
      uint64_t v9 = ((void (**)(void, __CFString *, __CFString *))v8)[2](v8, @"PLProcessMonitorAgent_EventForward_ProcessID", @"ProcessName");
      uint64_t v10 = v9;
      if (v9
        && ([v9 objectForKeyedSubscript:@"BundleID"],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v11))
      {
        uint64_t v12 = [v10 objectForKeyedSubscript:@"BundleID"];
      }
      else
      {
        char v13 = ((void (**)(void, __CFString *, __CFString *))v8)[2](v8, @"PLApplicationAgent_EventNone_AllApps", @"AppExecutable");

        uint64_t v12 = [v13 objectForKeyedSubscript:@"AppBundleId"];
        uint64_t v10 = v13;
      }
      [(id)bundleIDFromProcessName__processNameToBundleID setObject:v12 forKeyedSubscript:v7];

      id v5 = [(id)bundleIDFromProcessName__processNameToBundleID objectForKeyedSubscript:v7];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __39__PLUtilities_bundleIDFromProcessName___block_invoke()
{
  bundleIDFromProcessName__processNameToBundleID = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

id __39__PLUtilities_bundleIDFromProcessName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = [[PLValueComparison alloc] initWithKey:v5 withValue:*(void *)(a1 + 32) withComparisonOperation:0];

  unsigned int v8 = +[PowerlogCore sharedCore];
  uint64_t v9 = [v8 storage];
  v13[0] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v11 = [v9 lastEntryForKey:v6 withComparisons:v10 isSingleton:1];

  return v11;
}

+ (id)bundleIDFromPid:(int)a3
{
  id v4 = [a1 binaryPathForPid:*(void *)&a3];
  if (v4)
  {
    id v5 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    id v6 = [a1 bundleIDFromURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)bundleVersionFromURL:(id)a3
{
  if (a3)
  {
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    id v4 = Unique;
    if (Unique)
    {
      id v5 = CFBundleGetValueForInfoDictionaryKey(Unique, (CFStringRef)*MEMORY[0x1E4F1CC70]);
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (int)pidForProcessName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unsigned int v4 = proc_listpids(1u, 0, 0, 0);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities pidForProcessName:](v12);
    }
    goto LABEL_13;
  }
  int v5 = v4;
  size_t v6 = v4;
  id v7 = malloc_type_malloc(v4, 0xF82C5CDuLL);
  if (!v7)
  {
    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[PLUtilities pidForProcessName:]();
    }
LABEL_13:
    LODWORD(v11) = -1;
    goto LABEL_14;
  }
  unsigned int v8 = v7;
  memset(v7, 255, v6);
  int v9 = proc_listpids(1u, 0, v8, v5);
  uint64_t v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[PLUtilities pidForProcessName:].cold.4();
  }

  if (v9 >= 4)
  {
    if ((unint64_t)v9 >> 2 <= 1) {
      unint64_t v14 = 1;
    }
    else {
      unint64_t v14 = (unint64_t)v9 >> 2;
    }
    id v15 = (int *)v8;
    while (1)
    {
      int v16 = *v15++;
      uint64_t v11 = v16;
      if (v16 >= 1)
      {
        uint32_t v17 = +[PLUtilities fullProcessNameForPid:v11];
        int v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v21 = v17;
          __int16 v22 = 1024;
          int v23 = v11;
          _os_log_debug_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEBUG, "checking %@ (%d)", buf, 0x12u);
        }

        char v19 = [v17 isEqualToString:v3];
        if (v19) {
          break;
        }
      }
      if (!--v14) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    LODWORD(v11) = -1;
  }
  free(v8);
  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[PLUtilities pidForProcessName:]();
  }
LABEL_14:

  return v11;
}

+ (id)processNameForPid:(int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 512);
  size_t v5 = 648;
  *(void *)size_t v6 = 0xE00000001;
  int v7 = 1;
  int v8 = a3;
  if (sysctl(v6, 4u, v9, &v5, 0, 0) < 0)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [NSString stringWithUTF8String:(char *)&v9[15] + 3];
  }
  return v3;
}

+ (id)fullProcessNameForPid:(int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 < 1 || (bzero(buffer, 0x1000uLL), proc_pidpath(a3, buffer, 0x1000u) < 1))
  {
    unsigned int v4 = 0;
  }
  else
  {
    buffer[4095] = 0;
    unsigned int v4 = [NSString stringWithUTF8String:basename(buffer)];
  }
  return v4;
}

+ (unint64_t)maxProcessCount
{
  size_t v4 = 8;
  unint64_t v5 = 0;
  if (!sysctlbyname("kern.maxproc", &v5, &v4, 0, 0)) {
    return v5;
  }
  int v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    +[PLUtilities maxProcessCount](v2);
  }

  return 0;
}

+ (BOOL)isDaemonOrAppleXPCService:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  size_t v4 = (void *)MEMORY[0x1E4F963E8];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:");
  id v13 = 0;
  size_t v6 = [v4 handleForIdentifier:v5 error:&v13];
  id v7 = v13;
  int v8 = [v6 identity];

  if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[PLUtilities isDaemonOrAppleXPCService:v9];
  }
  if ([v8 isDaemon])
  {
    char v10 = 1;
  }
  else if ([v8 isXPCService])
  {
    uint64_t v11 = [v8 xpcServiceIdentifier];
    char v10 = [v11 hasPrefix:@"com.apple"];
  }
  else
  {
    char v10 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[PLUtilities isDaemonOrAppleXPCService:](v10, v3);
  }

  return v10;
}

+ (unint64_t)coalitionIDForPid:(int)a3
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  int v3 = proc_pidinfo(a3, 20, 1uLL, v5, 40);
  if (v3 == 40) {
    return *(void *)&v5[0];
  }
  else {
    return -v3;
  }
}

+ (id)liteModeDaemonName
{
  return @"PerfPowerServices";
}

+ (BOOL)isLiteModeDaemon
{
  if (isLiteModeDaemon_onceToken != -1) {
    dispatch_once(&isLiteModeDaemon_onceToken, &__block_literal_global_404);
  }
  return isLiteModeDaemon_isLiteModeDaemon;
}

void __31__PLUtilities_isLiteModeDaemon__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v0 = [v2 processName];
  unint64_t v1 = +[PLUtilities liteModeDaemonName];
  isLiteModeDaemon_isLiteModeDaemon = [v0 isEqualToString:v1];
}

+ (id)fullModeDaemonName
{
  return @"PerfPowerServicesExtended";
}

void __31__PLUtilities_isFullModeDaemon__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v0 = [v2 processName];
  unint64_t v1 = +[PLUtilities fullModeDaemonName];
  isFullModeDaemon_isFullModeDaemon = [v0 isEqualToString:v1];
}

void __32__PLUtilities_isPowerlogHelperd__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v0 = [v1 processName];
  isPowerlogHelperd_isPowerlogHelperd = [v0 isEqualToString:@"powerlogHelperd"];
}

+ (BOOL)runningAsMobileUser
{
  if (runningAsMobileUser_onceToken != -1) {
    dispatch_once(&runningAsMobileUser_onceToken, &__block_literal_global_417);
  }
  return runningAsMobileUser_runningAsMobileUser;
}

void __34__PLUtilities_runningAsMobileUser__block_invoke()
{
  id v0 = +[PLUtilities runningAsUser];
  runningAsMobileUser_runningAsMobileUser = [v0 caseInsensitiveCompare:@"mobile"] == 0;
}

+ (id)runningAsUser
{
  if (runningAsUser_onceToken != -1) {
    dispatch_once(&runningAsUser_onceToken, &__block_literal_global_422);
  }
  return NSUserName();
}

uint64_t __28__PLUtilities_runningAsUser__block_invoke()
{
  runningAsUser_userName = NSUserName();
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)shouldLogPreUnlockTelemetry
{
  if (shouldLogPreUnlockTelemetry_onceToken != -1) {
    dispatch_once(&shouldLogPreUnlockTelemetry_onceToken, &__block_literal_global_424);
  }
  return shouldLogPreUnlockTelemetry___shouldLogPreUnlockTelemetry;
}

void __42__PLUtilities_shouldLogPreUnlockTelemetry__block_invoke()
{
  if (+[PLUtilities PreUnlockTelemetryEnabled])
  {
    id v0 = +[PowerlogCore sharedCore];
    id v1 = [v0 storage];
    int v2 = [v1 storageLocked];

    if (v2) {
      shouldLogPreUnlockTelemetry___shouldLogPreUnlockTelemetry = 1;
    }
  }
}

+ (BOOL)AppDeletionEnabled
{
  if (AppDeletionEnabled_onceToken != -1) {
    dispatch_once(&AppDeletionEnabled_onceToken, &__block_literal_global_426);
  }
  return AppDeletionEnabled_appDeletionEnabled;
}

uint64_t __33__PLUtilities_AppDeletionEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  AppDeletionEnabled_appDeletionEnabled = result;
  return result;
}

+ (BOOL)SwitchToIncrementalVacuumEnabled
{
  if (SwitchToIncrementalVacuumEnabled_onceToken != -1) {
    dispatch_once(&SwitchToIncrementalVacuumEnabled_onceToken, &__block_literal_global_430);
  }
  return SwitchToIncrementalVacuumEnabled_incrementalVacuumEnabled;
}

uint64_t __47__PLUtilities_SwitchToIncrementalVacuumEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  SwitchToIncrementalVacuumEnabled_incrementalVacuumEnabled = result;
  return result;
}

+ (BOOL)PreUnlockTelemetryEnabled
{
  if (PreUnlockTelemetryEnabled_onceToken != -1) {
    dispatch_once(&PreUnlockTelemetryEnabled_onceToken, &__block_literal_global_433);
  }
  return PreUnlockTelemetryEnabled_preUnlockTelemetryEnabled;
}

uint64_t __40__PLUtilities_PreUnlockTelemetryEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  PreUnlockTelemetryEnabled_preUnlockTelemetryEnabled = result;
  return result;
}

uint64_t __39__PLUtilities_OverrideAllowlistEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  OverrideAllowlistEnabled_overrideAllowlistEnabled = result;
  return result;
}

+ (BOOL)hasGasGauge
{
  if (hasGasGauge_onceToken != -1) {
    dispatch_once(&hasGasGauge_onceToken, &__block_literal_global_439);
  }
  return hasGasGauge___hasGasGauge;
}

uint64_t __26__PLUtilities_hasGasGauge__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasGasGauge___hasGasGauge = result;
  return result;
}

+ (BOOL)hasBattery
{
  if (hasBattery_onceToken != -1) {
    dispatch_once(&hasBattery_onceToken, &__block_literal_global_444);
  }
  return hasBattery___hasBattery;
}

void __25__PLUtilities_hasBattery__block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  hasBattery___hasBattery = MGGetBoolAnswer();
  id v0 = PLLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = hasBattery___hasBattery;
    _os_log_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEFAULT, "Battery detected: %d", (uint8_t *)v1, 8u);
  }
}

+ (BOOL)inBUIDemoMode
{
  if (inBUIDemoMode_defaultOnce != -1) {
    dispatch_once(&inBUIDemoMode_defaultOnce, &__block_literal_global_449);
  }
  return inBUIDemoMode_demoMode;
}

void __28__PLUtilities_inBUIDemoMode__block_invoke()
{
  id v0 = +[PLDefaults objectForKey:@"BUI_DEMO_MODE" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  inBUIDemoMode_demoMode = [v0 BOOLValue];
}

+ (double)defaultBatteryEnergyCapacity
{
  +[PLModelingUtilities defaultBatteryEnergyCapacity];
  return result;
}

+ (BOOL)isHeySiriEnabled
{
  if (isHeySiriEnabled_onceToken != -1) {
    dispatch_once(&isHeySiriEnabled_onceToken, &__block_literal_global_458);
  }
  return isHeySiriEnabled_retValue;
}

void __31__PLUtilities_isHeySiriEnabled__block_invoke()
{
  id v0 = (void *)CFPreferencesCopyValue(@"VoiceTrigger Enabled", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v0)
  {
    id v1 = v0;
    isHeySiriEnabled_retValue = [v0 BOOLValue];
    id v0 = v1;
  }
}

+ (BOOL)isSiriEnabled
{
  if (isSiriEnabled_onceToken != -1) {
    dispatch_once(&isSiriEnabled_onceToken, &__block_literal_global_466);
  }
  return isSiriEnabled_retValue;
}

void __28__PLUtilities_isSiriEnabled__block_invoke()
{
  id v0 = (void *)CFPreferencesCopyValue(@"Assistant Enabled", @"com.apple.assistant.support", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v0)
  {
    id v1 = v0;
    isSiriEnabled_retValue = [v0 BOOLValue];
    id v0 = v1;
  }
}

+ (BOOL)isHealthDataSubmissionAllowed
{
  uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isHealthDataSubmissionAllowed];

  return v3;
}

+ (BOOL)isSafetyDataSubmissionAllowed
{
  uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isSafetyDataSubmissionAllowed];

  return v3;
}

+ (BOOL)isImproveFitnessPlusEnabled
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    +[PLUtilities isImproveFitnessPlusEnabled]();
  }

  return 0;
}

uint64_t __36__PLUtilities_isAppAnalyticsEnabled__block_invoke()
{
  uint64_t result = AppAnalyticsEnabled();
  isAppAnalyticsEnabled_appAnalyticsEnabled = result;
  return result;
}

+ (BOOL)isEduMode
{
  uint64_t v2 = (void *)MKBUserTypeDeviceMode();
  char v3 = v2;
  if (v2)
  {
    size_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F78100]];
    unint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F78150]];
    if ([v4 isEqualToString:*MEMORY[0x1E4F78108]]) {
      char v6 = [v5 isEqualToString:*MEMORY[0x1E4F78148]];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isALSCurveHigherThanDefault
{
  return +[PLModelingUtilities alsCurveHigherThanDefault];
}

+ (id)hashString:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__PLUtilities_hashString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  uint64_t v4 = hashString__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&hashString__onceToken, block);
  }
  char v6 = [a1 generateHashValue:v5 withSalt:hashString__salt];

  return v6;
}

uint64_t __26__PLUtilities_hashString___block_invoke(uint64_t a1)
{
  if (+[PLDefaults objectExistsForKey:@"PLSalt"]) {
    +[PLDefaults objectForKey:@"PLSalt" synchronize:1];
  }
  else {
  hashString__salt = [*(id *)(a1 + 32) generateAndUpdateSaltValue:@"PLSalt"];
  }
  return MEMORY[0x1F41817F8]();
}

+ (id)hashBundleID:(id)a3
{
  id v4 = a3;
  if (!saltBundleID)
  {
    if (+[PLDefaults objectExistsForKey:@"PLSaltBundleID"]) {
      +[PLDefaults objectForKey:@"PLSaltBundleID" synchronize:1];
    }
    else {
    uint64_t v5 = [a1 generateAndUpdateSaltValue:@"PLSaltBundleID"];
    }
    char v6 = (void *)saltBundleID;
    saltBundleID = v5;
  }
  id v7 = [a1 generateHashValue:v4 withSalt:saltBundleID];

  return v7;
}

+ (id)generateAndUpdateSaltValue:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F29128];
  id v4 = a3;
  uint64_t v5 = [v3 UUID];
  char v6 = [v5 UUIDString];

  +[PLDefaults setObject:v6 forKey:v4 saveToDisk:1];
  LODWORD(v5) = [v4 isEqualToString:@"PLSaltBundleID"];

  if (v5) {
    objc_storeStrong((id *)&saltBundleID, v6);
  }
  return v6;
}

+ (id)generateHashValue:(id)a3 withSalt:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"%@%@", a3, a4];
  uint64_t v5 = (const char *)[v4 UTF8String];

  *(void *)md = 0;
  uint64_t v10 = 0;
  CC_LONG v6 = strlen(v5);
  CC_MD5(v5, v6, md);
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v10, BYTE1(v10), BYTE2(v10), BYTE3(v10), BYTE4(v10), BYTE5(v10), BYTE6(v10), HIBYTE(v10));
  return v7;
}

+ (id)buildVersion
{
  uint64_t v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)supplementalBuildVersion
{
  uint64_t v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)automatedDeviceGroup
{
  return +[PLUtilities mobileUserADG];
}

+ (id)crashReporterKey
{
  if (crashReporterKey_onceToken != -1) {
    dispatch_once(&crashReporterKey_onceToken, &__block_literal_global_515);
  }
  uint64_t v2 = (void *)crashReporterKey_crkey;
  return v2;
}

uint64_t __31__PLUtilities_crashReporterKey__block_invoke()
{
  crashReporterKey_crkey = MGCopyAnswer();
  return MEMORY[0x1F41817F8]();
}

+ (id)mobileUserADG
{
  uint64_t v2 = (void *)CFPreferencesCopyValue(@"AutomatedDeviceGroup", @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

+ (id)deviceBootArgs
{
  if (deviceBootArgs_onceToken != -1) {
    dispatch_once(&deviceBootArgs_onceToken, &__block_literal_global_526_0);
  }
  uint64_t v2 = (void *)deviceBootArgs_bootArgs;
  return v2;
}

void __29__PLUtilities_deviceBootArgs__block_invoke()
{
  size_t size = 0;
  if (sysctlbyname("kern.bootargs", 0, &size, 0, 0))
  {
    id v0 = PLLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __29__PLUtilities_deviceBootArgs__block_invoke_cold_2();
    }
  }
  id v1 = malloc_type_malloc(size, 0x100004077774924uLL);
  if (sysctlbyname("kern.bootargs", v1, &size, 0, 0))
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __29__PLUtilities_deviceBootArgs__block_invoke_cold_1();
    }

    free(v1);
  }
  id v3 = [NSString stringWithUTF8String:v1];
  uint64_t v4 = [v3 strip];

  free(v1);
  uint64_t v5 = (void *)deviceBootArgs_bootArgs;
  deviceBootArgs_bootArgs = v4;
}

+ (id)allSubClassesForClass:(Class)a3
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = [NSString stringWithFormat:@"**allSubclassesFire!**"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
    CC_LONG v6 = [v5 lastPathComponent];
    id v7 = [NSString stringWithUTF8String:"+[PLUtilities allSubClassesForClass:]"];
    +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:2004];

    int v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  unsigned int outCount = 0;
  uint64_t v10 = objc_copyClassList(&outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Superclass = v10[i];
      do
        Superclass = class_getSuperclass(Superclass);
      while (Superclass && Superclass != a3);
      if (Superclass) {
        [v9 addObject:v10[i]];
      }
    }
  }
  free(v10);
  return v9;
}

+ (int64_t)roundToSigFig:(int)a3 withSigFig:(int)a4
{
  [a1 roundToSigFigDouble:*(void *)&a4 withSigFig:(double)a3];
  return (uint64_t)v4;
}

+ (id)shortUUIDString
{
  uint64_t v2 = [MEMORY[0x1E4F29128] UUID];
  id v3 = [v2 UUIDString];

  if ((unint64_t)[v3 length] >= 8)
  {
    double v4 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 8);
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

+ (id)JSONSanitizeDictionary:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x1E4F28D90] isValidJSONObject:v3] & 1) == 0)
  {
    if (+[PLDefaults debugEnabled])
    {
      double v4 = [NSString stringWithFormat:@"Non JSON-able object:%@", v3];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
      CC_LONG v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"+[PLUtilities JSONSanitizeDictionary:]"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:2055];

      int v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    uint64_t v9 = objc_opt_new();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __38__PLUtilities_JSONSanitizeDictionary___block_invoke;
    v13[3] = &unk_1E62540E8;
    id v10 = v9;
    id v14 = v10;
    [v3 enumerateKeysAndObjectsUsingBlock:v13];
    id v11 = v10;

    id v3 = v11;
  }
  return v3;
}

void __38__PLUtilities_JSONSanitizeDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isNil] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = NSNumber;
      [v6 timeIntervalSince1970];
      int v8 = objc_msgSend(v7, "numberWithDouble:");
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
    }
    else if ([MEMORY[0x1E4F28D90] isValidJSONObject:v6])
    {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
    }
    else if (+[PLDefaults debugEnabled])
    {
      uint64_t v9 = [NSString stringWithFormat:@"JSON: unable to serialize key=%@ value=%@", v5, v6];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"+[PLUtilities JSONSanitizeDictionary:]_block_invoke"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:2066];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

+ (BOOL)isValidString:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v4 = [v3 isEqualToString:&stru_1F15208F0] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (id)getKVPairsForCASubmissionFromEntry:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  id v6 = [v4 dictionary];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PLUtilities_getKVPairsForCASubmissionFromEntry___block_invoke;
  v9[3] = &unk_1E62540E8;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __50__PLUtilities_getKVPairsForCASubmissionFromEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
    }
  }
}

+ (jetsam_priority_info)getJetamPriority:(int)a3
{
  if (memorystatus_control() == 24)
  {
    unsigned int v3 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PLUtilities getJetamPriority:]();
    }
    unsigned int v3 = -1;
  }
  return (jetsam_priority_info)(v3 | 0x100000000);
}

+ (process_memory_limit_info)getProcessMemoryLimit:(int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if (memorystatus_control() != 24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[PLUtilities getJetamPriority:]();
  }
  if (memorystatus_control())
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v4) {
      +[PLUtilities getProcessMemoryLimit:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    unsigned int v14 = -1;
  }
  else
  {
    unsigned int v14 = v16;
    unint64_t v12 = (unint64_t)(v18 != 0) << 48;
    unint64_t v13 = (unint64_t)(BYTE4(v16) & 1) << 32;
  }
  if (v14 != v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v23 = a3;
    __int16 v24 = 1024;
    unsigned int v25 = v14;
    __int16 v26 = 1024;
    int v27 = v21;
    _os_log_impl(&dword_1BBD2F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "memory limits do not match for pid %i (get_prio_list=%i, get_memlimit_props=%i)", buf, 0x14u);
  }
  return (process_memory_limit_info)(v12 | 0x10000000000 | v13 | v14);
}

+ (id)cleanLaunchdApplicationMacOS:(id)a3
{
  unsigned int v3 = [a3 componentsSeparatedByString:@"."];
  if (([v3 count] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v4 = &stru_1F15208F0;
  }
  else
  {
    uint64_t v5 = &stru_1F15208F0;
    unint64_t v6 = 1;
    do
    {
      uint64_t v7 = [v3 objectAtIndexedSubscript:v6];
      BOOL v4 = [(__CFString *)v5 stringByAppendingString:v7];

      if ([v3 count] - 2 > ++v6)
      {
        uint64_t v8 = [(__CFString *)v4 stringByAppendingString:@"."];

        BOOL v4 = (__CFString *)v8;
      }
      uint64_t v5 = v4;
    }
    while ([v3 count] - 2 > v6);
  }

  return v4;
}

+ (id)cleanLaunchdName:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3)
  {
    id v16 = 0;
    goto LABEL_44;
  }
  int v5 = [v3 hasPrefix:@"system/"];
  int v6 = [v4 hasPrefix:@"user/"];
  int v7 = [v4 hasPrefix:@"gui/"];
  int v8 = [v4 hasPrefix:@"pid/"];
  id v9 = v4;
  if ((unint64_t)[v9 length] <= 0x23)
  {
    uint64_t v11 = 0;
LABEL_22:

    id v15 = v9;
    goto LABEL_23;
  }
  objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v9, "length") - 36);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (!v10
    || [v10 length] != 36
    || [v11 characterAtIndex:8] != 45
    || [v11 characterAtIndex:13] != 45
    || [v11 characterAtIndex:18] != 45
    || [v11 characterAtIndex:23] != 45)
  {
    goto LABEL_22;
  }
  if (stringIsUUID_onceToken != -1) {
    dispatch_once(&stringIsUUID_onceToken, &__block_literal_global_930);
  }
  [v11 componentsSeparatedByString:@"-"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        unint64_t v13 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        int v14 = [(id)stringIsUUID_hexChars isSupersetOfSet:v13];

        if (!v14)
        {

          goto LABEL_22;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  id v15 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 37);

LABEL_23:
  if (v5)
  {
    uint64_t v17 = [v15 substringFromIndex:objc_msgSend(@"system/", "length")];
    if (!v17) {
      goto LABEL_40;
    }
  }
  else
  {
    if ((v6 | v8 | v7) != 1) {
      goto LABEL_40;
    }
    uint64_t v18 = [v15 componentsSeparatedByString:@"/"];
    if ([v18 count] == 3)
    {
      uint64_t v19 = [v18 objectAtIndexedSubscript:2];
      uint64_t v20 = v19;
      if (v6 && [v19 hasPrefix:@"UIKitApplication:"])
      {
        id v21 = [v20 substringWithRange:objc_msgSend(@"UIKitApplication:", "length"), objc_msgSend(v20, "length") - objc_msgSend(@"UIKitApplication:", "length") - 17];
      }
      else if (v7 && [v20 hasPrefix:@"application."])
      {
        id v21 = +[PLUtilities cleanLaunchdApplicationMacOS:v20];
      }
      else
      {
        id v21 = v20;
      }
      uint64_t v17 = v21;
    }
    else
    {
      uint64_t v17 = 0;
    }

    if (!v17)
    {
LABEL_40:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        +[PLUtilities cleanLaunchdName:]();
      }
      uint64_t v17 = 0;
      goto LABEL_43;
    }
  }
  if ([v17 containsString:@"/"])
  {

    goto LABEL_40;
  }
LABEL_43:
  id v16 = v17;

LABEL_44:
  return v16;
}

+ (id)intervalPeakCADictionaryForLaunchdName:(id)a3 intervalMaxKB:(unint64_t)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  int v5 = (void *)MEMORY[0x1E4F1CA60];
  if (a3) {
    int v6 = (__CFString *)a3;
  }
  else {
    int v6 = @"UNKNOWN";
  }
  v13[0] = @"launchd_name";
  v13[1] = @"interval_peak_footprint_kb";
  v14[0] = v6;
  int v7 = NSNumber;
  id v8 = a3;
  id v9 = [v7 numberWithUnsignedLongLong:a4];
  v14[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v11 = [v5 dictionaryWithDictionary:v10];

  return v11;
}

+ (void)refreshBUI
{
  if (!+[PLPlatform isHomePod])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.powerlogd.refreshBUI", 0, 0, 4u);
  }
}

+ (unint64_t)convertToBase10:(id)a3 fromBaseN:(int)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    double v10 = (double)a4;
    uint64_t v11 = -1;
    do
    {
      int v12 = [v5 characterAtIndex:v8];
      if ((v12 - 65) >= 0x1A) {
        unint64_t v13 = v12 - 48;
      }
      else {
        unint64_t v13 = (v12 - 55);
      }
      unint64_t v9 = (unint64_t)((double)v9 + (double)v13 * pow(v10, (double)(unint64_t)(v7 + v11)));
      ++v8;
      --v11;
    }
    while (v7 != v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)powerlogDefaultForKey:(id)a3
{
  return +[PLDefaults objectForKey:a3 forApplicationID:@"com.apple.powerlogd" synchronize:1];
}

+ (id)removeFirstPartyBundleIDPrefix:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"com.apple." withString:&stru_1F15208F0];
}

+ (double)scaledPowerBasedOnPoint:(double)a3 withPowerModel:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = 0.0;
  if (!+[PLPlatform isHomePod] && a3 > 0.0 && v5 != 0)
  {
    uint64_t v8 = [v5 allKeys];
    unint64_t v9 = [v8 sortedArrayUsingSelector:sel_compareFloat_];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v34;
LABEL_8:
      uint64_t v15 = 0;
      id v16 = v13;
      while (1)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
        objc_msgSend(v17, "doubleValue", (void)v33);
        double v19 = v18;
        id v13 = v17;
        if (v19 > a3) {
          break;
        }

        ++v15;
        id v16 = v13;
        if (v12 == v15)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v12) {
            goto LABEL_8;
          }
          goto LABEL_18;
        }
      }

      if (!v13) {
        goto LABEL_19;
      }
      uint64_t v20 = [v5 objectForKeyedSubscript:v16];
      [v20 doubleValue];
      double v22 = v21;

      int v23 = [v5 objectForKeyedSubscript:v13];
      [v23 doubleValue];
      double v25 = v24;

      [v16 doubleValue];
      double v27 = a3 - v26;
      [v13 doubleValue];
      double v29 = v28;
      [v16 doubleValue];
      double v6 = v22 + v27 / (v29 - v30) * (v25 - v22);
    }
    else
    {
      id v13 = 0;
LABEL_18:

      id v16 = v13;
LABEL_19:
      objc_msgSend(v5, "objectForKeyedSubscript:", v16, (void)v33);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      [v13 doubleValue];
      double v6 = v31;
    }
  }
  return v6;
}

+ (id)torchTypeString
{
  if (!+[PLPlatform isHomePod] && torchTypeString_onceToken != -1) {
    dispatch_once(&torchTypeString_onceToken, &__block_literal_global_630);
  }
  uint64_t v2 = (void *)torchTypeString__torchTypeString;
  return v2;
}

void __30__PLUtilities_torchTypeString__block_invoke()
{
  unsigned int v0 = +[PLPlatform kPLTorchClassOfDevice] - 1007002;
  if (v0 > 2) {
    id v1 = @"N41";
  }
  else {
    id v1 = off_1E6254CF8[v0];
  }
  uint64_t v2 = (void *)torchTypeString__torchTypeString;
  torchTypeString__torchTypeString = (uint64_t)v1;
}

+ (id)hardwareModel
{
  if (hardwareModel_onceToken != -1) {
    dispatch_once(&hardwareModel_onceToken, &__block_literal_global_694);
  }
  uint64_t v2 = (void *)hardwareModel__hardwareModel;
  return v2;
}

void __28__PLUtilities_hardwareModel__block_invoke()
{
  unsigned int v0 = (void *)MGCopyAnswer();
  id v1 = PLLogCommon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __28__PLUtilities_hardwareModel__block_invoke_cold_2();
  }

  uint64_t v2 = +[PLUtilities hardwareModelSMC:v0];

  uint64_t v3 = [v2 length];
  if ([v2 hasSuffix:@"AP"])
  {
    uint64_t v4 = -2;
  }
  else
  {
    if (![v2 hasSuffix:@"DEV"]) {
      goto LABEL_8;
    }
    uint64_t v4 = -3;
  }
  uint64_t v3 = [v2 length] + v4;
LABEL_8:
  uint64_t v5 = objc_msgSend(v2, "substringWithRange:", 0, v3);
  double v6 = (void *)hardwareModel__hardwareModel;
  hardwareModel__hardwareModel = v5;

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __28__PLUtilities_hardwareModel__block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

+ (id)hardwareModelSMC:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (BOOL)devBoardDevice
{
  if (devBoardDevice_onceToken != -1) {
    dispatch_once(&devBoardDevice_onceToken, &__block_literal_global_705);
  }
  return devBoardDevice__devBoard;
}

void __29__PLUtilities_devBoardDevice__block_invoke()
{
  unsigned int v0 = (void *)MGCopyAnswer();
  id v1 = +[PLUtilities hardwareModelSMC:v0];

  if ([v1 hasSuffix:@"DEV"]) {
    devBoardDevice__devBoard = 1;
  }
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __29__PLUtilities_devBoardDevice__block_invoke_cold_1(v2);
  }
}

+ (id)productType
{
  if (productType_onceToken != -1) {
    dispatch_once(&productType_onceToken, &__block_literal_global_707);
  }
  uint64_t v2 = (void *)productType__productType;
  return v2;
}

void __26__PLUtilities_productType__block_invoke()
{
  if (!productType__productType)
  {
    productType__productType = MGCopyAnswer();
    MEMORY[0x1F41817F8]();
  }
}

+ (id)getDeviceSoC
{
  if (getDeviceSoC_onceToken != -1) {
    dispatch_once(&getDeviceSoC_onceToken, &__block_literal_global_712);
  }
  uint64_t v2 = (void *)getDeviceSoC__soc;
  return v2;
}

uint64_t __27__PLUtilities_getDeviceSoC__block_invoke()
{
  getDeviceSoC__soc = MGCopyAnswer();
  return MEMORY[0x1F41817F8]();
}

+ (unsigned)getHardwarePerfLevels
{
  if (getHardwarePerfLevels_levels_once != -1) {
    dispatch_once(&getHardwarePerfLevels_levels_once, &__block_literal_global_717);
  }
  return getHardwarePerfLevels_perf_levels;
}

void __36__PLUtilities_getHardwarePerfLevels__block_invoke()
{
  size_t v3 = 4;
  int v0 = sysctlbyname("hw.nperflevels", &getHardwarePerfLevels_perf_levels, &v3, 0, 0);
  if (v0)
  {
    int v1 = v0;
    getHardwarePerfLevels_perf_levels = 0;
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __36__PLUtilities_getHardwarePerfLevels__block_invoke_cold_1(v1, v2);
    }
  }
}

+ (void)PLCopyItemsFromPath:toPath:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Could not retrieve source files from %@ with error %@");
}

void __42__PLUtilities_PLCopyItemsFromPath_toPath___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Error copying files from source path %@ to destination path %@ with error: %@", (uint8_t *)&v5, 0x20u);
}

+ (void)setPermissionsForFile:toValue:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Successfully set permissions for file %@", v2, v3, v4, v5, v6);
}

+ (void)setPermissionsForFile:toValue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Cannot set permissions for file %@, error = %@");
}

+ (void)compressWithSource:withDestination:withLevel:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "compressWithSource: Cannot read %@ for compression\n", v2, v3, v4, v5, v6);
}

+ (void)compressWithSource:withDestination:withLevel:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "compressWithSource: Cannot write to %@ for compression\n", v2, v3, v4, v5, v6);
}

+ (void)compressWithSource:withDestination:withLevel:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "compressWithSource: Cannot compress file at %@ to %@\n");
}

+ (void)compressWithSource:withDestination:withLevel:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "compressWithSource: attempting to compress source stream to destination stream...", v2, v3, v4, v5, v6);
}

+ (void)compressWithSourceStream:withDestination:withLevel:.cold.1()
{
  __assert_rtn("+[PLUtilities compressWithSourceStream:withDestination:withLevel:]", "PLUtilities.m", 307, "sizeof(strm.avail_in) == sizeof && length < UINT_MAX");
}

+ (void)compressWithSourceStream:withDestination:withLevel:.cold.2()
{
  __assert_rtn("+[PLUtilities compressWithSourceStream:withDestination:withLevel:]", "PLUtilities.m", 322, "ret != Z_STREAM_ERROR");
}

+ (void)compressWithSourceStream:withDestination:withLevel:.cold.3()
{
  __assert_rtn("+[PLUtilities compressWithSourceStream:withDestination:withLevel:]", "PLUtilities.m", 334, "ret == Z_STREAM_END");
}

+ (void)compressWithSourceStream:withDestination:withLevel:.cold.4()
{
  __assert_rtn("+[PLUtilities compressWithSourceStream:withDestination:withLevel:]", "PLUtilities.m", 330, "strm.avail_in == 0");
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "decompressWithSource: Cannot read %@ for decompression\n", v2, v3, v4, v5, v6);
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "decompressWithSource: Cannot write to %@ for decompression\n", v2, v3, v4, v5, v6);
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "decompressWithSource: error when removing failed output file '%@'", v2, v3, v4, v5, v6);
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "decompressWithSource: Cannot decompress from %@ to %@\n");
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "decompressWithSource: attempting to decompress source stream to destination stream...", v2, v3, v4, v5, v6);
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "decompressWithSource: invalid source file, %@ with extension %@");
}

+ (void)decompressWithSourceStream:withDestinationStream:.cold.1()
{
  __assert_rtn("+[PLUtilities decompressWithSourceStream:withDestinationStream:]", "PLUtilities.m", 444, "result != Z_STREAM_ERROR");
}

+ (void)reportZlibResultToCA:forEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1BBD2F000, v0, (uint64_t)v0, "%@ ERROR = %d", v1);
}

+ (void)numFilesAtPath:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to get num files at path: %@ error: %@");
}

+ (void)remove:oldestFilesFromDirectory:containingFileNameSubstring:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "No file name substring provided, assuming all files in directory are candidate files", v2, v3, v4, v5, v6);
}

+ (void)remove:(uint64_t)a3 oldestFilesFromDirectory:(os_log_t)log containingFileNameSubstring:.cold.2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Found %lu files with %@ in the name", buf, 0x16u);
}

+ (void)remove:oldestFilesFromDirectory:containingFileNameSubstring:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to get contents of directory %@ with error: %@");
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_82_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Assuming %@ and %@ have the same creation date");
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_82_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to get creation date of file %@ with error: %@");
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to remove %@ with error: %@");
}

+ (void)markFilesInDirectoryAsPurgeable:ofType:withUrgency:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to mark files in directory %@ purgeable -- error when retrieving contents of directory: '%@'");
}

+ (void)markFilesInDirectoryAsPurgeable:ofType:withUrgency:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Failed to mark files in directory %@ purgeable -- path is not directory", v2, v3, v4, v5, v6);
}

+ (void)markFileAsPurgeable:(uint64_t)a1 withUrgency:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  __int16 v9 = v5;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Failed to mark %@ purgeable - can't open error: %s", (uint8_t *)&v6, 0x16u);
}

+ (uint64_t)deviceBootUUID
{
  return _os_assumes_log();
}

+ (void)getLastSystemTimeOffset
{
}

void __39__PLUtilities_quarantineToPath_action___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Quarantine dst: %@", v2, v3, v4, v5, v6);
}

void __39__PLUtilities_quarantineToPath_action___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 filePath];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "Quarantine src: %@", v4, 0xCu);
}

+ (void)allowQueryFromPeer:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "failure creating sec task from token", v2, v3, v4, v5, v6);
}

+ (void)getPerfStatsForProcess:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "[Perf Stats Query] Coalitions does not have aggregated data", v2, v3, v4, v5, v6);
}

+ (void)getPerfStatsForProcess:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "[Perf Stats Query] QueryStartDate=%@, QueryEndDate=%@");
}

+ (void)pidForProcessName:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1BBD2F000, a1, OS_LOG_TYPE_ERROR, "failed to read pids %d", (uint8_t *)v3, 8u);
}

+ (void)pidForProcessName:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "failed to allocat buffer", v2, v3, v4, v5, v6);
}

+ (void)pidForProcessName:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEBUG, "found %@ (%d)", v1, 0x12u);
}

+ (void)pidForProcessName:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "searching for procName %@", v2, v3, v4, v5, v6);
}

+ (void)maxProcessCount
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  int v4 = 136315394;
  uint64_t v5 = "kern.maxproc";
  __int16 v6 = 1024;
  int v7 = v2;
  OUTLINED_FUNCTION_8(&dword_1BBD2F000, a1, v3, "failed to query %s: %d", (uint8_t *)&v4);
}

+ (void)isDaemonOrAppleXPCService:(char)a1 .cold.1(char a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v3 = a1 & 1;
  int v4 = +[PLUtilities bundleIDFromPid:a2];
  uint64_t v5 = +[PLUtilities processNameForPid:a2];
  v6[0] = 67109890;
  v6[1] = a2;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  _os_log_debug_impl(&dword_1BBD2F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Pid:%i isDaemonAppleXPCService:%{BOOL}i\t\tBundle:%@\t\t\tBinary:%@", (uint8_t *)v6, 0x22u);
}

+ (void)isDaemonOrAppleXPCService:(uint64_t)a3 .cold.2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  OUTLINED_FUNCTION_8(&dword_1BBD2F000, MEMORY[0x1E4F14500], a3, "Error to identify (pid%i) isDaemonOrAppleXPCService %@", (uint8_t *)v3);
}

+ (void)isImproveFitnessPlusEnabled
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Fitness plus libraries not found", v2, v3, v4, v5, v6);
}

void __29__PLUtilities_deviceBootArgs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "unable to retrieve sysctl", v2, v3, v4, v5, v6);
}

void __29__PLUtilities_deviceBootArgs__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "unable to retrieve the size of sysctl", v2, v3, v4, v5, v6);
}

+ (void)getJetamPriority:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8(&dword_1BBD2F000, MEMORY[0x1E4F14500], v0, "Error with MEMORYSTATUS_CMD_GET_PRIORITY_LIST. Size %d and sizeof(entry) %lu", v1);
}

+ (void)getProcessMemoryLimit:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)cleanLaunchdName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, MEMORY[0x1E4F14500], v0, "cleanLaunchdName: Unknown launchd service name: %@", v1, v2, v3, v4, v5);
}

void __28__PLUtilities_hardwareModel__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, a1, a3, "hardwareModel: returning %@", a5, a6, a7, a8, 2u);
}

void __28__PLUtilities_hardwareModel__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "hardwareModel: HWModelStr = %@", v2, v3, v4, v5, v6);
}

void __29__PLUtilities_devBoardDevice__block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = devBoardDevice__devBoard;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "devBoardDevice: returning %d", (uint8_t *)v1, 8u);
}

void __36__PLUtilities_getHardwarePerfLevels__block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "getHardwarePerfLevels failed, sysctlbyname retval = %d", (uint8_t *)v2, 8u);
}

@end