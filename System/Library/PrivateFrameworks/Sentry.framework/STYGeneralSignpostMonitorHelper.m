@interface STYGeneralSignpostMonitorHelper
- (BOOL)avoidGeneratingTailspinsForAppLaunches;
- (BOOL)seedUserMode;
- (BOOL)wantsAnimationFrameRate;
- (STYAbcHelper)abcHelper;
- (STYGeneralSignpostMonitorHelper)init;
- (id)allowList;
- (id)name;
- (void)handleEmit:(id)a3;
- (void)handleInterval:(id)a3;
- (void)perfProblemDetected:(id)a3 tailspinFilenamePrefix:(id)a4;
- (void)perfProblemDetectedOnMac:(id)a3;
- (void)setAbcHelper:(id)a3;
- (void)setAvoidGeneratingTailspinsForAppLaunches:(BOOL)a3;
- (void)setSeedUserMode:(BOOL)a3;
@end

@implementation STYGeneralSignpostMonitorHelper

- (id)name
{
  return @"General Signpost";
}

- (STYGeneralSignpostMonitorHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)STYGeneralSignpostMonitorHelper;
  v2 = [(STYSignpostsMonitorHelper *)&v10 init];
  if (v2)
  {
    v3 = (SignpostSupportSubsystemCategoryAllowlist *)objc_alloc_init(MEMORY[0x1E4F9F7C0]);
    allowList = v2->_allowList;
    v2->_allowList = v3;

    [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.SpringBoard" category:@"TailspinSignposts"];
    [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.camera.signposts" category:@"TelemetrySignposts"];
    [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.SpringBoard" category:@"TelemetrySignposts"];
    [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.UIKit" category:@"ShareSheet"];
    [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.signpost_emitter" category:@"emitter_category"];
    [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.mobileactivationd" category:@"analytics"];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Sentry.Framework"];
    if ([v5 BOOLForKey:@"shouldDisableEPLAppLaunchMonitoring"])
    {
      v6 = +[STYFrameworkHelper sharedHelper];
      v7 = [v6 logHandle];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D3037000, v7, OS_LOG_TYPE_DEFAULT, "App launch monitoring and watchdog termination monitoring via EPL is disabled", v9, 2u);
      }
    }
    else
    {
      [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.app_launch_measurement" category:@"ApplicationLaunch"];
      [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.FrontBoard" category:@"Watchdog"];
    }
  }
  return v2;
}

- (BOOL)wantsAnimationFrameRate
{
  return 1;
}

- (id)allowList
{
  return self->_allowList;
}

- (void)perfProblemDetectedOnMac:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[STYFrameworkHelper sharedHelper];
  v5 = [v4 logHandle];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STYGeneralSignpostMonitorHelper perfProblemDetectedOnMac:](v3);
  }

  v6 = [v3 issueCategory];
  v7 = [v3 scenario];
  uint64_t v8 = [v7 kpi];

  if (v8 == -1000)
  {
    v26[0] = @"observedLatency_in_ms";
    v9 = (void *)MEMORY[0x1E4F28ED0];
    [v3 observedLatencyInMs];
    objc_super v10 = objc_msgSend(v9, "numberWithFloat:");
    v27[0] = v10;
    v26[1] = @"threshold_in_ms";
    v11 = (void *)MEMORY[0x1E4F28ED0];
    [v3 targetLatencyInMs];
    v12 = objc_msgSend(v11, "numberWithFloat:");
    v27[1] = v12;
    v26[2] = @"scenarioID";
    v13 = [v3 scenario];
    v14 = [v13 scenarioID];
    v27[2] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  }
  else
  {
    v24[0] = @"observedFramerate_fps";
    v16 = (void *)MEMORY[0x1E4F28ED0];
    [v3 observedFps];
    objc_super v10 = objc_msgSend(v16, "numberWithFloat:");
    v25[0] = v10;
    v24[1] = @"threshold_fps";
    v17 = (void *)MEMORY[0x1E4F28ED0];
    [v3 targetFps];
    v12 = objc_msgSend(v17, "numberWithFloat:");
    v25[1] = v12;
    v24[2] = @"scenarioID";
    v13 = [v3 scenario];
    v14 = [v13 scenarioID];
    v25[2] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  }

  id v23 = 0;
  int v18 = DRTailspinRequest();
  id v19 = v23;
  v20 = +[STYFrameworkHelper sharedHelper];
  v21 = [v20 logHandle];

  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v22) {
      -[STYGeneralSignpostMonitorHelper perfProblemDetectedOnMac:](v3);
    }
  }
  else if (v22)
  {
    -[STYGeneralSignpostMonitorHelper perfProblemDetectedOnMac:]();
  }
}

- (void)perfProblemDetected:(id)a3 tailspinFilenamePrefix:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v5, "hash"));
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v9 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  id v10 = v6;
  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "scenarioStartTime"));
  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "scenarioEndTime"));
  v13 = +[STYFrameworkHelper sharedHelper];
  v14 = [v13 logHandle];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[STYGeneralSignpostMonitorHelper perfProblemDetected:tailspinFilenamePrefix:](v5);
  }

  v15 = +[STYFrameworkHelper sharedHelper];
  v16 = [v15 logHandle];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v24 = [v5 scenario];
    id v23 = [v24 scenarioID];
    *(_DWORD *)buf = 138413570;
    v31 = v23;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = [v11 unsignedLongLongValue];
    __int16 v36 = 2048;
    uint64_t v37 = [v12 unsignedLongLongValue];
    __int16 v38 = 1024;
    int v39 = [v7 intValue];
    __int16 v40 = 2112;
    uint64_t v41 = kSTYEplReportType;
    _os_log_debug_impl(&dword_1D3037000, v16, OS_LOG_TYPE_DEBUG, "[Signpost: %@] Request details area as follows:\n\t Filename prefix : %@\n\t interval begin timestamp : %llu\n\t interval end timestamp : %llu\n\t Request identifier %d\n\t Report Type : %@", buf, 0x3Au);
  }
  v28[0] = kSTYScenarioReportRefKey;
  v28[1] = kSTYTailspinFilenameKey;
  v29[0] = v7;
  v29[1] = v10;
  v28[2] = kSTYScenarioStartTimeKey;
  v28[3] = kSTYScenarioEndTimeKey;
  v29[2] = v11;
  v29[3] = v12;
  v28[4] = kSTYScenarioReportKey;
  v28[5] = kSTYReportTypeKey;
  v29[4] = v5;
  v29[5] = kSTYEplReportType;
  v28[6] = kSTYReasonKey;
  v29[6] = @"EPL Request";
  CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:7];
  [(id)outstandingTailspinSaveRequests setObject:v5 forKey:v7];
  [(id)perfIssueDetectionTimeLogs setObject:v8 forKey:v7];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kSTYPerfProblemDetectedNotification, 0, v17, 1u);
  dispatch_time_t v19 = dispatch_time(0, 900000000000);
  v20 = htInteractionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke;
  block[3] = &unk_1E69717D8;
  id v26 = v7;
  id v27 = v5;
  id v21 = v5;
  id v22 = v7;
  dispatch_after(v19, v20, block);
}

void __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke(uint64_t a1)
{
  v1 = (void *)(a1 + 32);
  v2 = [(id)outstandingTailspinSaveRequests objectForKey:*(void *)(a1 + 32)];

  if (v2)
  {
    id v3 = +[STYFrameworkHelper sharedHelper];
    v4 = [v3 logHandle];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke_cold_1();
    }

    [(id)outstandingTailspinSaveRequests removeObjectForKey:*v1];
  }
}

- (void)handleInterval:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 endEvent];
  float v6 = eventEndToNow(v5);

  v7 = +[STYFrameworkHelper sharedHelper];
  uint64_t v8 = [v7 logHandle];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[STYGeneralSignpostMonitorHelper handleInterval:].cold.6();
  }

  if (v6 <= 5000.0)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__0;
    v29[4] = __Block_byref_object_dispose__0;
    id v11 = v4;
    id v30 = v11;
    id v28 = 0;
    v12 = +[STYScenarioReport reportFromSignpostInterval:v11 error:&v28];
    id v13 = v28;
    v14 = v13;
    if (v12)
    {
      v15 = [v11 subsystem];
      int v16 = [v15 isEqualToString:@"com.apple.app_launch_measurement"];

      if (v16
        && ([(STYGeneralSignpostMonitorHelper *)self seedUserMode]
         || +[STYDeviceInfo isAppleInternal]))
      {
        signed int v17 = arc4random_uniform(0x64u);
        LODWORD(v18) = 2139095039;
        if (v17 < 10) {
          *(float *)&double v18 = 0.0;
        }
        [v12 setTargetLatencyInMs:v18];
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke;
      void v26[3] = &unk_1E6971A88;
      char v27 = v16;
      v26[4] = self;
      v26[5] = v29;
      dispatch_time_t v19 = (void *)MEMORY[0x1D942F890](v26);
      v20 = +[STYPerformanceChecker sharedPerfChecker];
      [v20 checkPerformanceOfScenarioReport:v12 completionHandler:v19];
    }
    else
    {
      if (v13)
      {
        if ([v13 code] == -2007 || objc_msgSend(v14, "code") == -2002)
        {
          id v21 = +[STYFrameworkHelper sharedHelper];
          id v22 = [v21 logHandle];

          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            [v14 description];
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:]();
          }
        }
        else if ([v14 code] == -2000)
        {
          v24 = +[STYFrameworkHelper sharedHelper];
          id v22 = [v24 logHandle];

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            +[STYUserScenarioCache sharedCache];
            [(id)objc_claimAutoreleasedReturnValue() scenarioIdForSignpostInterval:v11];
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.4();
          }
        }
        else
        {
          v25 = +[STYFrameworkHelper sharedHelper];
          id v22 = [v25 logHandle];

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            [v14 description];
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.5();
          }
        }
      }
      else
      {
        id v23 = +[STYFrameworkHelper sharedHelper];
        id v22 = [v23 logHandle];

        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[STYGeneralSignpostMonitorHelper handleInterval:]();
        }
      }
    }
    _Block_object_dispose(v29, 8);
  }
  else
  {
    id v9 = +[STYFrameworkHelper sharedHelper];
    id v10 = [v9 logHandle];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[STYGeneralSignpostMonitorHelper handleInterval:]();
    }
  }
}

void __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a2)
  {
    id v10 = +[STYFrameworkHelper sharedHelper];
    id v11 = [v10 logHandle];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v9 scenario];
      id v13 = [v12 scenarioID];
      [v9 observedLatencyInMs];
      double v15 = v14;
      [v9 targetLatencyInMs];
      *(_DWORD *)buf = 138412802;
      v63 = v13;
      __int16 v64 = 2048;
      double v65 = v15;
      __int16 v66 = 2048;
      double v67 = v16;
      _os_log_impl(&dword_1D3037000, v11, OS_LOG_TYPE_DEFAULT, "[Signpost: %@] Observed latency of %.0f ms was below threshold of %.0f ms", buf, 0x20u);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    signed int v17 = +[STYFrameworkHelper sharedHelper];
    id v11 = [v17 logHandle];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = [v7 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v63 = v18;
      _os_log_impl(&dword_1D3037000, v11, OS_LOG_TYPE_DEFAULT, "Perf check failed. Description: %@ ", buf, 0xCu);
    }
    goto LABEL_7;
  }
  dispatch_time_t v19 = [v8 scenario];
  uint64_t v20 = [v19 kpi];

  id v21 = +[STYFrameworkHelper sharedHelper];
  id v22 = [v21 logHandle];

  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20 == -1000)
  {
    if (!v23) {
      goto LABEL_15;
    }
    v24 = [v9 scenario];
    v25 = [v24 scenarioID];
    [v9 observedLatencyInMs];
    double v27 = v26;
    [v9 targetLatencyInMs];
    *(_DWORD *)buf = 138412802;
    v63 = v25;
    __int16 v64 = 2048;
    double v65 = v27;
    __int16 v66 = 2048;
    double v67 = v28;
    v29 = "[Signpost: %@]  observed latency of %.0f ms was above threshold of %.0f ms";
    id v30 = v22;
    uint32_t v31 = 32;
  }
  else
  {
    if (!v23) {
      goto LABEL_15;
    }
    v24 = [v9 scenario];
    v25 = [v24 scenarioID];
    [v9 observedFps];
    *(_DWORD *)buf = 138412546;
    v63 = v25;
    __int16 v64 = 2048;
    double v65 = v32;
    v29 = " %@'s observed framerate of %.0f was below threshold. Initiating diagnostic collection";
    id v30 = v22;
    uint32_t v31 = 22;
  }
  _os_log_impl(&dword_1D3037000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);

LABEL_15:
  uint64_t v33 = dateOfLastTailspinRequest;
  __int16 v34 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v35 = v34;
  __int16 v36 = (void *)dateOfLastTailspinRequest;
  if (!v33)
  {
    dateOfLastTailspinRequest = (uint64_t)v34;

    v44 = htInteractionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_318;
    block[3] = &unk_1E6971A60;
    char v61 = *(unsigned char *)(a1 + 48);
    uint64_t v45 = *(void *)(a1 + 32);
    uint64_t v60 = *(void *)(a1 + 40);
    void block[4] = v45;
    id v59 = v9;
    dispatch_async(v44, block);
    v43 = v59;
    goto LABEL_19;
  }
  [v34 timeIntervalSinceDate:dateOfLastTailspinRequest];
  double v38 = v37;

  if (v38 > 60.0)
  {
    int v39 = htInteractionQueue;
    uint64_t v50 = MEMORY[0x1E4F143A8];
    uint64_t v51 = 3221225472;
    v52 = __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_319;
    v53 = &unk_1E6971A60;
    char v57 = *(unsigned char *)(a1 + 48);
    uint64_t v40 = *(void *)(a1 + 32);
    uint64_t v56 = *(void *)(a1 + 40);
    uint64_t v54 = v40;
    id v55 = v9;
    dispatch_async(v39, &v50);
    uint64_t v41 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v50, v51, v52, v53, v54);
    uint64_t v42 = (void *)dateOfLastTailspinRequest;
    dateOfLastTailspinRequest = v41;

    v43 = v55;
LABEL_19:

    goto LABEL_8;
  }
  v46 = +[STYFrameworkHelper sharedHelper];
  v47 = [v46 logHandle];

  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_cold_1(a1);
  }

  uint64_t v48 = *(void *)(*(void *)(a1 + 40) + 8);
  v49 = *(void **)(v48 + 40);
  *(void *)(v48 + 40) = 0;

LABEL_8:
}

void __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_318(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = TailspinFilenamePrefixForInterval(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  if (*(unsigned char *)(a1 + 56) && [*(id *)(a1 + 32) avoidGeneratingTailspinsForAppLaunches])
  {
    id v5 = +[STYFrameworkHelper sharedHelper];
    float v6 = [v5 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 40) scenario];
      id v8 = [v7 scenarioID];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1D3037000, v6, OS_LOG_TYPE_DEFAULT, "[Signpost: %@] Deferring app launch tailspin to special app launch monitoring ", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) perfProblemDetected:*(void *)(a1 + 40) tailspinFilenamePrefix:v2];
  }
}

void __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_319(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = TailspinFilenamePrefixForInterval(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  if (*(unsigned char *)(a1 + 56) && [*(id *)(a1 + 32) avoidGeneratingTailspinsForAppLaunches])
  {
    id v5 = +[STYFrameworkHelper sharedHelper];
    float v6 = [v5 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 40) scenario];
      id v8 = [v7 scenarioID];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1D3037000, v6, OS_LOG_TYPE_DEFAULT, "[Signpost: %@] Deferring app launch tailspin to special app launch monitoring ", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) perfProblemDetected:*(void *)(a1 + 40) tailspinFilenamePrefix:v2];
  }
}

- (void)handleEmit:(id)a3
{
  id v19 = 0;
  id v4 = +[STYScenarioReport reportFromSignpostEvent:a3 error:&v19];
  id v5 = v19;
  if (v4)
  {
    if (dateOfLastTailspinRequest
      && ([MEMORY[0x1E4F1C9C8] date],
          float v6 = objc_claimAutoreleasedReturnValue(),
          [v6 timeIntervalSinceDate:dateOfLastTailspinRequest],
          double v8 = v7,
          v6,
          v8 <= 60.0))
    {
      signed int v17 = +[STYFrameworkHelper sharedHelper];
      double v15 = [v17 logHandle];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[STYGeneralSignpostMonitorHelper handleEmit:](v4);
      }
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      id v10 = (void *)dateOfLastTailspinRequest;
      dateOfLastTailspinRequest = v9;

      uint64_t v11 = [v4 scenario];
      v12 = [v11 appName];

      if (v12)
      {
        id v13 = [v4 scenario];
        float v14 = [v13 appName];
        double v15 = [@"Sentry_LaunchWatchdog_" stringByAppendingString:v14];
      }
      else
      {
        double v15 = @"Sentry_LaunchWatchdog_";
      }
      [(STYGeneralSignpostMonitorHelper *)self perfProblemDetected:v4 tailspinFilenamePrefix:v15];
    }
  }
  else
  {
    float v16 = +[STYFrameworkHelper sharedHelper];
    double v15 = [v16 logHandle];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v18 = 0;
      _os_log_impl(&dword_1D3037000, v15, OS_LOG_TYPE_DEFAULT, "Signpost Event is not whitelisted", v18, 2u);
    }
  }
}

- (BOOL)seedUserMode
{
  return self->_seedUserMode;
}

- (void)setSeedUserMode:(BOOL)a3
{
  self->_seedUserMode = a3;
}

- (BOOL)avoidGeneratingTailspinsForAppLaunches
{
  return self->_avoidGeneratingTailspinsForAppLaunches;
}

- (void)setAvoidGeneratingTailspinsForAppLaunches:(BOOL)a3
{
  self->_avoidGeneratingTailspinsForAppLaunches = a3;
}

- (STYAbcHelper)abcHelper
{
  return (STYAbcHelper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAbcHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abcHelper, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
}

- (void)perfProblemDetectedOnMac:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 scenario];
  v2 = [v1 scenarioID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v3, v4, "[Signpost: %@] Diagnostics request was succesfull", v5, v6, v7, v8, v9);
}

- (void)perfProblemDetectedOnMac:.cold.2()
{
  OUTLINED_FUNCTION_13();
  v1 = [v0 scenario];
  v2 = [v1 scenarioID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1D3037000, v3, v4, "[Signpost: %@] Diagnostics request failed with the error : %@", v5, v6, v7, v8, v9);
}

- (void)perfProblemDetectedOnMac:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 scenario];
  v2 = [v1 scenarioID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v3, v4, "[Signpost: %@] Issue detected on mac", v5, v6, v7, v8, v9);
}

- (void)perfProblemDetected:(void *)a1 tailspinFilenamePrefix:.cold.1(void *a1)
{
  v1 = [a1 scenario];
  v2 = [v1 scenarioID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v3, v4, "[Signpost: %@] Requesting tailspin save via Hangtracer", v5, v6, v7, v8, v9);
}

void __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13();
  v2 = [*(id *)(v1 + 40) scenario];
  uint64_t v3 = [v2 scenarioID];
  [*v0 intValue];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_1D3037000, v4, v5, "[Signpost: %@] The response from hangtracerd for report with Request identifier : %d timed out", v6, v7, v8, v9, v10);
}

- (void)handleInterval:.cold.1()
{
  +[STYUserScenarioCache sharedCache];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  v2 = objc_msgSend(v1, "scenarioIdForSignpostInterval:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D3037000, v3, v4, "[Signpost: %@] Signpost notification recieved more than 5 seconds after it was emitted. This interval will not be processed further.", v5, v6, v7, v8, v9);
}

- (void)handleInterval:.cold.2()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1D3037000, v0, OS_LOG_TYPE_ERROR, "Silent failure while processing interval", v1, 2u);
}

- (void)handleInterval:.cold.3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(v1, v2, 5.7779e-34);
  _os_log_error_impl(&dword_1D3037000, v3, OS_LOG_TYPE_ERROR, "%@", v4, 0xCu);
}

- (void)handleInterval:.cold.4()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_3(&dword_1D3037000, v4, (uint64_t)v4, "[Signpost: %@] Signpost interval is not whitelisted", v5);
}

- (void)handleInterval:.cold.5()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3(&dword_1D3037000, v3, (uint64_t)v3, "%@", v4);
}

- (void)handleInterval:.cold.6()
{
  +[STYUserScenarioCache sharedCache];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  uint64_t v2 = objc_msgSend(v1, "scenarioIdForSignpostInterval:");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D3037000, v3, v4, "[Signpost: %@] Signpost Interval notification detected %.2f ms after interval ended", v5, v6, v7, v8, v9);
}

void __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = +[STYUserScenarioCache sharedCache];
  uint64_t v3 = [v2 scenarioIdForSignpostInterval:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D3037000, v4, v5, "[Signpost: %@] Last request for a tailspin was less than a minute ago. Not requesting tailspin", v6, v7, v8, v9, v10);
}

- (void)handleEmit:(void *)a1 .cold.1(void *a1)
{
  id v1 = [a1 scenario];
  uint64_t v2 = [v1 scenarioID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D3037000, v3, v4, "[Signpost: %@] Last request for a tailspin was less than a minute ago. Not requesting tailspin", v5, v6, v7, v8, v9);
}

@end