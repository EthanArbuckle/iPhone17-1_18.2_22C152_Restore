@interface SBBatteryLogger
+ (void)saveLowBatteryLogWithCapacity:(int)a3 voltage:(int)a4 completion:(id)a5;
@end

@implementation SBBatteryLogger

+ (void)saveLowBatteryLogWithCapacity:(int)a3 voltage:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Begin saving battery level log...", buf, 2u);
  }

  v9 = [MEMORY[0x1E4F1C9C8] date];
  if (v7) {
    BSPthreadCurrentEffectiveQualityOfService();
  }
  v10 = objc_alloc_init(_SBBatteryLogContext);
  [(_SBBatteryLogContext *)v10 setCapacity:v6];
  [(_SBBatteryLogContext *)v10 setVoltage:v5];
  v14 = v7;
  id v11 = v7;
  id v12 = v9;
  v13 = v10;
  BSDispatchMain();
}

void __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setUsageTimeInSeconds:_SBWorkspaceGetBatteryUsageTimeInSeconds()];
  [*(id *)(a1 + 32) setStandbyTimeInSeconds:_SBWorkspaceGetBatteryStandbyTimeInSeconds()];
  [*(id *)(a1 + 32) setHasChargedPartially:_SBWorkspaceHaveChargedPartially()];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v9 = [v8 sceneIfExists];
        v10 = [v9 settings];
        int v11 = [v10 isForeground];

        if (v11)
        {
          id v12 = [v8 application];
          v13 = [v12 bundleIdentifier];
          [v2 addObject:v13];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) setForegroundApplications:v2];
  v14 = dispatch_get_global_queue(*(unsigned int *)(a1 + 56), 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2;
  block[3] = &unk_1E6AF5FC8;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  dispatch_async(v14, block);
}

uint64_t __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v73 = *(id *)(a1 + 32);
  id v1 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = ___backgroundQueue_collectAndLogFromContext_block_invoke;
  v80[3] = &unk_1E6AFC0B0;
  id v70 = v1;
  id v81 = v70;
  *(void *)&AssertionsByPID[0] = 0;
  IOReturn v2 = IOPMCopyAssertionsByProcess((CFDictionaryRef *)AssertionsByPID);
  v3 = *(const void **)&AssertionsByPID[0];
  if (!v2 && *(void *)&AssertionsByPID[0])
  {
    uint64_t v4 = objc_alloc_init(_SBPowerAssertionContext);
    [(_SBPowerAssertionContext *)v4 setCollectionBlock:v80];
    CFDictionaryApplyFunction(*(CFDictionaryRef *)&AssertionsByPID[0], (CFDictionaryApplierFunction)_arrayCallback_collectOneTask, v4);

    v3 = *(const void **)&AssertionsByPID[0];
  }
  if (v3) {
    CFRelease(v3);
  }
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  CFStringRef v6 = CFUUIDCreateString(alloc, v5);
  CFRelease(v5);
  id v7 = (void *)MGCopyAnswer();
  cf = v7;
  if (v7)
  {
    CFTypeID v8 = CFGetTypeID(v7);
    if (v8 == CFStringGetTypeID()) {
      goto LABEL_10;
    }
    CFRelease(cf);
  }
  cf = 0;
LABEL_10:
  v68 = [MEMORY[0x1E4F1C9C8] date];
  if (_backgroundQueue_systemVersionDescription___once != -1) {
    dispatch_once(&_backgroundQueue_systemVersionDescription___once, &__block_literal_global_80);
  }
  id v71 = (id)_backgroundQueue_systemVersionDescription___description;
  v9 = (void *)MEMORY[0x1E4F28E78];
  v10 = [MEMORY[0x1E4F4F708] sharedInstance];
  int v11 = [v10 formatDateAsLongYMDHMSZPosixLocaleWithDate:v68];
  id v12 = [v9 stringWithFormat:@"Incident Identifier: %@\nCrashReporter Key:   %@\nDate:                %@\nOS Version:          %@\n\n", v6, cf, v11, v71];

  CFRelease(v6);
  if ([v70 length])
  {
    [v12 appendString:v70];
    [v12 appendString:@"\n"];
  }
  v69 = [v73 foregroundApplications];
  if ([v69 count])
  {
    [v12 appendString:@"Foreground Applications: "];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v13 = v69;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v92 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v77 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = [NSString stringWithFormat:@"%@ ", *(void *)(*((void *)&v76 + 1) + 8 * i)];
          [v12 appendString:v17];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v92 count:16];
      }
      while (v14);
    }

    [v12 appendString:@"\n"];
  }
  BKSDisplayBrightnessGetCurrent();
  long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"Screen Brightness: %f\n", v18);
  [v12 appendString:v19];

  long long v20 = _SBWorkspaceCopyRecentSleepsAndWakes();
  if (!v20) {
    goto LABEL_35;
  }
  v74 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"Recent Sleeps and Wakes\n"];
  uint64_t v21 = [v20 count];
  if (v21)
  {
    for (uint64_t j = 0; j != v21; ++j)
    {
      v23 = [v20 objectAtIndex:j];
      uint64_t v24 = [v23 objectForKey:@"type"];
      v25 = [v23 objectForKey:@"time"];
      v26 = [v23 objectForKey:@"reason"];
      if (v24) {
        [v74 appendString:v24];
      }
      [v74 appendString:@" "];
      if (v25) {
        [v74 appendString:v25];
      }
      [v74 appendString:@"\n"];
      if (v26)
      {
        [v74 appendString:v26];
        [v74 appendString:@"\n"];
      }
    }
  }

  if (v74)
  {
    objc_msgSend(v12, "appendString:");
    [v12 appendString:@"\n"];
  }
  else
  {
LABEL_35:
    v74 = 0;
  }
  memset(AssertionsByPID, 0, sizeof(AssertionsByPID));
  size_t v75 = 256;
  sysctlbyname("hw.model", AssertionsByPID, &v75, 0, 0);
  v27 = NSString;
  [v73 usageTimeInSeconds];
  v28 = BSFormattedTimeFromSeconds();
  [v73 usageTimeInSeconds];
  double v30 = v29;
  [v73 standbyTimeInSeconds];
  v31 = BSFormattedTimeFromSeconds();
  [v73 standbyTimeInSeconds];
  double v33 = v32;
  v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v73, "hasChargedPartially"));
  v35 = [v34 stringValue];
  v36 = [v27 stringWithFormat:@"Hardware Model: %s\nAwake Time: %@ (%d)\nStandby Time: %@ (%d)\nPartial Charge: %@\nCapacity: %d\nVoltage: %d mV\n", AssertionsByPID, v28, (int)v30, v31, (int)v33, v35, objc_msgSend(v73, "capacity"), objc_msgSend(v73, "voltage")];
  [v12 appendString:v36];

  uint64_t v85 = 0;
  uint64_t v86 = (uint64_t)&v85;
  uint64_t v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__23;
  v89 = __Block_byref_object_dispose__23;
  id v90 = (id)objc_opt_new();
  CFTypeRef v83 = 0;
  CFTypeRef v84 = 0;
  v37 = (const void *)IOReportCopyChannelsInCategories();
  if (v37)
  {
    uint64_t Subscription = IOReportCreateSubscription();
    v39 = (const void *)Subscription;
    if (Subscription && v83)
    {
      Samples = (const void *)IOReportCreateSamples();
      v82[0] = (id)MEMORY[0x1E4F143A8];
      v82[1] = (id)3221225472;
      v82[2] = ___backgroundQueue_getSOCStats_block_invoke;
      v82[3] = &unk_1E6AFC100;
      v82[4] = &v85;
      IOReportIterate();
      if (Samples) {
        CFRelease(Samples);
      }
    }
    else if (!Subscription)
    {
      goto LABEL_46;
    }
    CFRelease(v39);
  }
  else
  {
    v41 = SBLogCommon();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2_cold_2((uint64_t *)&v84, v41);
    }
  }
LABEL_46:
  if (v84) {
    CFRelease(v84);
  }
  if (v83) {
    CFRelease(v83);
  }
  if (v37) {
    CFRelease(v37);
  }
  id v42 = *(id *)(v86 + 40);
  _Block_object_dispose(&v85, 8);

  if ([v42 count])
  {
    v43 = [v42 objectForKey:@"SOCHOT0_ACT"];
    v44 = [v42 objectForKey:@"SOCHOT0_Transitions"];
    v45 = [NSString stringWithFormat:@"Voltage Droop Time: %@\n", v43];
    [v12 appendString:v45];

    v46 = [NSString stringWithFormat:@"Voltage Droop Transitions: %@\n", v44];
    [v12 appendString:v46];
  }
  if ([MEMORY[0x1E4F56678] isCPMSSupported])
  {
    v47 = (void *)[MEMORY[0x1E4F56690] copyCPMSControlStateSnapshots];
    v48 = [NSString stringWithFormat:@"CPMS has keys:\n %@ \n", v47];
    [v12 appendString:v48];
  }
  else
  {
    CFDictionaryRef v49 = IOServiceMatching("ApplePPM");
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v49);
    io_object_t v51 = MatchingService;
    if (MatchingService)
    {
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"PPMDebug", alloc, 0);
      v53 = CFProperty;
      if (CFProperty)
      {
        CFTypeID v54 = CFGetTypeID(CFProperty);
        if (v54 == CFArrayGetTypeID())
        {
          v55 = [NSString stringWithFormat:@"PPMDebug has keys:\n %@ \n", v53];
          [v12 appendString:v55];
        }
        CFRelease(v53);
      }
    }
    IOObjectRelease(v51);
  }
  v56 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v71, @"os_version", @"120", @"bug_type", 0);
  v82[0] = 0;
  v57 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v56 options:0 error:v82];
  id v58 = v82[0];
  v59 = (void *)[v57 mutableCopy];

  [v59 appendBytes:"\n" length:1];
  v60 = [v12 dataUsingEncoding:4 allowLossyConversion:1];
  [v59 appendData:v60];

  uint64_t v85 = MEMORY[0x1E4F143A8];
  uint64_t v86 = 3221225472;
  uint64_t v87 = (uint64_t)___backgroundQueue_collectAndLogFromContext_block_invoke_2;
  v88 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6AFC0D8;
  v89 = (void (*)(uint64_t))v59;
  id v61 = v59;
  LODWORD(v59) = OSAWriteLogForSubmission();

  v62 = SBLogCommon();
  v63 = v62;
  if (v59)
  {
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      LODWORD(AssertionsByPID[0]) = 134217984;
      *(double *)((char *)AssertionsByPID + 4) = -v64;
      _os_log_impl(&dword_1D85BA000, v63, OS_LOG_TYPE_DEFAULT, "Finished saving battery log after %.2fs", (uint8_t *)AssertionsByPID, 0xCu);
    }
  }
  else if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2_cold_1(a1, v63);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  int v4 = 134217984;
  double v5 = -v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to save battery log after %.2fs", (uint8_t *)&v4, 0xCu);
}

void __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error when trying to get voltage droop stats: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end