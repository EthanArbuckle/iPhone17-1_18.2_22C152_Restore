@interface STYSpecialAppLaunchSignpostMonitorHelper
- (BOOL)enforceAppLaunchThreshold;
- (BOOL)forceAppLaunchDiagnostics;
- (STYSpecialAppLaunchSignpostMonitorHelper)init;
- (id)allowList;
- (id)name;
- (void)handleInterval:(id)a3;
- (void)processAppLaunch:(id)a3 tailspinFilenamePrefix:(id)a4 duration:(id)a5 andPID:(id)a6 reason:(id)a7;
- (void)setEnforceAppLaunchThreshold:(BOOL)a3;
- (void)setForceAppLaunchDiagnostics:(BOOL)a3;
@end

@implementation STYSpecialAppLaunchSignpostMonitorHelper

- (id)name
{
  return @"Special App Launch Signpost";
}

- (STYSpecialAppLaunchSignpostMonitorHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)STYSpecialAppLaunchSignpostMonitorHelper;
  v2 = [(STYSignpostsMonitorHelper *)&v8 init];
  if (v2)
  {
    v3 = (SignpostSupportSubsystemCategoryAllowlist *)objc_alloc_init(MEMORY[0x1E4F9F7C0]);
    allowList = v2->_allowList;
    v2->_allowList = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Sentry.Framework"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v5;

    [(SignpostSupportSubsystemCategoryAllowlist *)v2->_allowList addSubsystem:@"com.apple.app_launch_measurement" category:@"ApplicationLaunch"];
  }
  return v2;
}

- (id)allowList
{
  return self->_allowList;
}

- (void)handleInterval:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (+[STYDeviceInfo isAppleInternal]) {
    v6 = @"ApplicationLaunchExtendedResponsive";
  }
  else {
    v6 = @"ApplicationFirstFramePresentation";
  }
  v7 = [v5 number1Name];
  int v8 = [v7 isEqualToString:@"IsForeground"];
  if (v8)
  {
    v3 = [v5 number1Value];
    if (([v3 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0)
    {

      goto LABEL_57;
    }
  }
  v9 = [v5 name];
  int v10 = [v9 isEqualToString:v6];

  if (v8)
  {

    if ((v10 & 1) == 0) {
      goto LABEL_57;
    }
  }
  else
  {

    if (!v10) {
      goto LABEL_57;
    }
  }
  v11 = [v5 endEvent];
  float v12 = eventEndToNow(v11);

  v13 = +[STYFrameworkHelper sharedHelper];
  v14 = [v13 logHandle];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:]4();
  }

  if (v12 <= 5000.0)
  {
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__0;
    v68 = __Block_byref_object_dispose__0;
    id v17 = v5;
    id v69 = v17;
    id v63 = 0;
    v18 = +[STYScenarioReport reportFromSignpostInterval:v17 error:&v63];
    id v19 = v63;
    v20 = v19;
    if (!v18)
    {
      if (v19)
      {
        if ([v19 code] == -2007 || objc_msgSend(v20, "code") == -2002)
        {
          v31 = +[STYFrameworkHelper sharedHelper];
          v22 = [v31 logHandle];

          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            [v20 description];
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:]();
          }
        }
        else if ([v20 code] == -2000)
        {
          v54 = +[STYFrameworkHelper sharedHelper];
          v22 = [v54 logHandle];

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            +[STYUserScenarioCache sharedCache];
            [(id)objc_claimAutoreleasedReturnValue() scenarioIdForSignpostInterval:v17];
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.4();
          }
        }
        else
        {
          v55 = +[STYFrameworkHelper sharedHelper];
          v22 = [v55 logHandle];

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            [v20 description];
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.5();
          }
        }
      }
      else
      {
        v52 = +[STYFrameworkHelper sharedHelper];
        v22 = [v52 logHandle];

        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[STYGeneralSignpostMonitorHelper handleInterval:]();
        }
      }
      goto LABEL_56;
    }
    v21 = (void *)MEMORY[0x1E4F28ED0];
    [v17 durationMs];
    v22 = objc_msgSend(v21, "numberWithDouble:");
    v23 = (void *)MEMORY[0x1E4F28ED0];
    v24 = [v17 endEvent];
    v56 = objc_msgSend(v23, "numberWithUnsignedInt:", objc_msgSend(v24, "processID"));

    v25 = +[STYFrameworkHelper sharedHelper];
    v26 = [v25 logHandle];

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:]3(-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", kSTYDefaultsEnforceAppLaunchThreshold, v56), buf, v26);
    }

    if (+[STYDeviceInfo isAppleInternal]
      && ![(NSUserDefaults *)self->_defaults BOOLForKey:kSTYDefaultsEnforceAppLaunchThreshold])
    {
      BOOL v30 = 0;
    }
    else
    {
      v27 = +[STYFrameworkHelper sharedHelper];
      v28 = [v27 logHandle];

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:]2();
      }

      [v17 durationMs];
      BOOL v30 = v29 > 1000.0;
    }
    uint32_t v32 = arc4random_uniform(0x7FFFFFFFu);
    if (!+[STYDeviceInfo isAppleInternal]) {
      goto LABEL_38;
    }
    v33 = +[STYFrameworkHelper sharedHelper];
    v34 = [v33 logHandle];

    double v35 = (double)v32 * 100.0 / 2147483650.0;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      [(STYSpecialAppLaunchSignpostMonitorHelper *)v35 < 10.0 handleInterval:v35];
    }

    if (v35 < 10.0)
    {
      v36 = +[STYFrameworkHelper sharedHelper];
      v37 = [v36 logHandle];

      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.7();
      }
      int v38 = 1;
    }
    else
    {
LABEL_38:
      if (v30)
      {
        v39 = +[STYFrameworkHelper sharedHelper];
        v37 = [v39 logHandle];

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.8();
        }
      }
      else
      {
        if (![(STYSpecialAppLaunchSignpostMonitorHelper *)self forceAppLaunchDiagnostics])
        {
          v53 = +[STYFrameworkHelper sharedHelper];
          v46 = [v53 logHandle];

          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:]0();
          }
          goto LABEL_55;
        }
        v40 = +[STYFrameworkHelper sharedHelper];
        v37 = [v40 logHandle];

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.9();
        }
      }
      int v38 = 0;
    }

    if (dateOfLastTailspinRequest)
    {
      v41 = [MEMORY[0x1E4F1C9C8] date];
      [v41 timeIntervalSinceDate:dateOfLastTailspinRequest];
      if (v42 >= 60.0)
      {
      }
      else
      {
        BOOL v43 = [(STYSpecialAppLaunchSignpostMonitorHelper *)self forceAppLaunchDiagnostics];

        if (!v43)
        {
          v44 = +[STYFrameworkHelper sharedHelper];
          v45 = [v44 logHandle];

          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            +[STYUserScenarioCache sharedCache];
            [(id)objc_claimAutoreleasedReturnValue() scenarioIdForSignpostInterval:v65[5]];
            objc_claimAutoreleasedReturnValue();
            -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.6();
          }

          v46 = v65[5];
          v65[5] = 0;
LABEL_55:

LABEL_56:
          _Block_object_dispose(&v64, 8);

          goto LABEL_57;
        }
      }
    }
    v47 = &kSTYAppLaunchReasonRandom;
    if (!v38) {
      v47 = &kSTYAppLaunchReasonSlow;
    }
    v48 = *v47;
    v49 = mkHangtracerInteractionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__STYSpecialAppLaunchSignpostMonitorHelper_handleInterval___block_invoke;
    block[3] = &unk_1E6971AB0;
    v62 = &v64;
    block[4] = self;
    id v58 = v18;
    v59 = v22;
    id v60 = v56;
    v46 = v48;
    v61 = v46;
    dispatch_async(v49, block);
    uint64_t v50 = [MEMORY[0x1E4F1C9C8] date];
    v51 = (void *)dateOfLastTailspinRequest;
    dateOfLastTailspinRequest = v50;

    goto LABEL_55;
  }
  v15 = +[STYFrameworkHelper sharedHelper];
  v16 = [v15 logHandle];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:]();
  }

LABEL_57:
}

void __59__STYSpecialAppLaunchSignpostMonitorHelper_handleInterval___block_invoke(uint64_t a1)
{
  TailspinFilenamePrefixForInterval(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(*(void *)(a1 + 72) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  [*(id *)(a1 + 32) processAppLaunch:*(void *)(a1 + 40) tailspinFilenamePrefix:v4 duration:*(void *)(a1 + 48) andPID:*(void *)(a1 + 56) reason:*(void *)(a1 + 64)];
}

- (void)processAppLaunch:(id)a3 tailspinFilenamePrefix:(id)a4 duration:(id)a5 andPID:(id)a6 reason:(id)a7
{
  v38[10] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v11, "hash"));
  id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v14 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  id v15 = v12;
  v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "scenarioStartTime"));
  id v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "scenarioEndTime"));
  v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:1000.0];
  id v19 = +[STYFrameworkHelper sharedHelper];
  v20 = [v19 logHandle];

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[STYGeneralSignpostMonitorHelper perfProblemDetected:tailspinFilenamePrefix:](v11);
  }

  v37[0] = kSTYScenarioReportRefKey;
  v37[1] = kSTYTailspinFilenameKey;
  v38[0] = v13;
  v38[1] = v15;
  v37[2] = kSTYScenarioStartTimeKey;
  v37[3] = kSTYScenarioEndTimeKey;
  v38[2] = v16;
  v38[3] = v17;
  v37[4] = kSTYScenarioReportKey;
  v37[5] = kSTYReportTypeKey;
  v38[4] = v11;
  v38[5] = kSTYAppLaunchReportType;
  v37[6] = kSTYDurationKey;
  v37[7] = kSTYThresholdKey;
  v38[6] = v33;
  v38[7] = v18;
  v37[8] = kSTYPIDKey;
  v37[9] = kSTYReasonKey;
  v38[8] = v32;
  v38[9] = v31;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:10];
  v22 = +[STYFrameworkHelper sharedHelper];
  v23 = [v22 logHandle];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[STYSpecialAppLaunchSignpostMonitorHelper processAppLaunch:tailspinFilenamePrefix:duration:andPID:reason:](v21);
  }

  [(id)outstandingTailspinSaveRequests setObject:v11 forKey:v13];
  v24 = (void *)perfIssueDetectionTimeLogs;
  v25 = [MEMORY[0x1E4F1C9C8] date];
  [v24 setObject:v25 forKey:v13];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kSTYPerfProblemDetectedNotification, 0, (CFDictionaryRef)v21, 1u);
  dispatch_time_t v27 = dispatch_time(0, 900000000000);
  v28 = htInteractionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__STYSpecialAppLaunchSignpostMonitorHelper_processAppLaunch_tailspinFilenamePrefix_duration_andPID_reason___block_invoke;
  block[3] = &unk_1E69717D8;
  id v35 = v13;
  id v36 = v11;
  id v29 = v11;
  id v30 = v13;
  dispatch_after(v27, v28, block);
}

void __107__STYSpecialAppLaunchSignpostMonitorHelper_processAppLaunch_tailspinFilenamePrefix_duration_andPID_reason___block_invoke(uint64_t a1)
{
  v1 = (void *)(a1 + 32);
  uint64_t v2 = [(id)outstandingTailspinSaveRequests objectForKey:*(void *)(a1 + 32)];

  if (v2)
  {
    v3 = +[STYFrameworkHelper sharedHelper];
    id v4 = [v3 logHandle];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke_cold_1();
    }

    [(id)outstandingTailspinSaveRequests removeObjectForKey:*v1];
  }
}

- (BOOL)forceAppLaunchDiagnostics
{
  return self->_forceAppLaunchDiagnostics;
}

- (void)setForceAppLaunchDiagnostics:(BOOL)a3
{
  self->_forceAppLaunchDiagnostics = a3;
}

- (BOOL)enforceAppLaunchThreshold
{
  return self->_enforceAppLaunchThreshold;
}

- (void)setEnforceAppLaunchThreshold:(BOOL)a3
{
  self->_enforceAppLaunchThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
}

- (void)handleInterval:.cold.1()
{
  +[STYUserScenarioCache sharedCache];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  uint64_t v2 = objc_msgSend(v1, "scenarioIdForSignpostInterval:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D3037000, v3, v4, "[Signpost: %@] Signpost notification recieved more than 5 seconds after it was emitted. This interval will not be processed further.", v5, v6, v7, v8, v9);
}

- (void)handleInterval:.cold.6()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(v2, v3, 5.778e-34);
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = 60;
  _os_log_error_impl(&dword_1D3037000, v5, OS_LOG_TYPE_ERROR, "[Signpost: %@] Last request for a tailspin was less than %i seconds ago. Not requesting tailspin", v6, 0x12u);
}

- (void)handleInterval:.cold.7()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1D3037000, v0, v1, "Accepting launch as a random sample", v2, v3, v4, v5, v6);
}

- (void)handleInterval:.cold.8()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1D3037000, v0, v1, "Accepting launch as an exception for a slow launch", v2, v3, v4, v5, v6);
}

- (void)handleInterval:.cold.9()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1D3037000, v0, v1, "Force accepting app launch as requested.", v2, v3, v4, v5, v6);
}

- (void)handleInterval:.cold.10()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1D3037000, v0, v1, "Ignoring launch because it is neither a random sample nor a long launch.", v2, v3, v4, v5, v6);
}

- (void)handleInterval:(double)a3 .cold.11(char a1, NSObject *a2, double a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 134218496;
  double v4 = a3;
  __int16 v5 = 1024;
  int v6 = 10;
  __int16 v7 = 1024;
  int v8 = a1 & 1;
  _os_log_debug_impl(&dword_1D3037000, a2, OS_LOG_TYPE_DEBUG, "Should randomly capture launch (%f < %u): %u", (uint8_t *)&v3, 0x18u);
}

- (void)handleInterval:.cold.12()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1D3037000, v0, v1, "App launch threshold enforced", v2, v3, v4, v5, v6);
}

- (void)handleInterval:(os_log_t)log .cold.13(char a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1 & 1;
  _os_log_debug_impl(&dword_1D3037000, log, OS_LOG_TYPE_DEBUG, "The value of enforceAppLaunchThreshold default is %d", buf, 8u);
}

- (void)handleInterval:.cold.14()
{
  +[STYUserScenarioCache sharedCache];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  uint64_t v2 = objc_msgSend(v1, "scenarioIdForSignpostInterval:");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D3037000, v3, v4, "[Signpost: %@] Signpost Interval notification detected %.2f ms after interval ended", v5, v6, v7, v8, v9);
}

- (void)processAppLaunch:(void *)a1 tailspinFilenamePrefix:duration:andPID:reason:.cold.1(void *a1)
{
  id v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v2, v3, "[Signpost: %@] Request details area as follows ", v4, v5, v6, v7, v8);
}

@end