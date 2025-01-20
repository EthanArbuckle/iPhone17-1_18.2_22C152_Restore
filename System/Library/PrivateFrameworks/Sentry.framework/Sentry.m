id STYFrameworkDefaults()
{
  id v0;
  void block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;
  uint64_t vars8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __STYFrameworkDefaults_block_invoke;
  block[3] = &unk_1E6971700;
  block[4] = &v3;
  if (STYFrameworkDefaults_onceToken != -1) {
    dispatch_once(&STYFrameworkDefaults_onceToken, block);
  }
  v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __STYFrameworkDefaults_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Sentry.Framework"];
  return MEMORY[0x1F41817F8]();
}

id getReporter()
{
  if (getReporter_onceToken != -1) {
    dispatch_once(&getReporter_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)sharedSymptomsReporter;
  return v0;
}

void __getReporter_block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
  v1 = (void *)sharedSymptomsReporter;
  sharedSymptomsReporter = (uint64_t)v0;

  v7[0] = *MEMORY[0x1E4FA8B30];
  v2 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
  v8[0] = v2;
  v7[1] = *MEMORY[0x1E4FA8B28];
  v3 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E4FA8B18];
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  v6 = (void *)symptomsActions;
  symptomsActions = v5;
}

id descriptionForSymptomsErrorCode(uint64_t a1)
{
  int v1 = a1;
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"Error Description for error : %d not available ", a1);
  if (*MEMORY[0x1E4FA8BA0] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorServiceNotReady: The service is not yet ready.";
  }
  else if (*MEMORY[0x1E4FA8B80] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorNotSupported: The requested API is not yet implemented.";
  }
  else if (*MEMORY[0x1E4FA8BA8] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorServiceUnavailable: The remote service did not respond.";
  }
  else if (*MEMORY[0x1E4FA8B98] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorServiceInterrupted: The connection with the remote service was interrupted.";
  }
  else if (*MEMORY[0x1E4FA8B78] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorInvalidParameters: The API was called with invalid or unsupported parameters.";
  }
  else if (*MEMORY[0x1E4FA8B70] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorHourlyLimitExceeded: The session was rate limited based on the hourly quota.";
  }
  else if (*MEMORY[0x1E4FA8B60] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorDailyLimitExceeded: The session was rate limited based on the daily quota.";
  }
  else if (*MEMORY[0x1E4FA8B88] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorRandomizedSuppression: The session was rate limited based on randomized suppression.";
  }
  else if (*MEMORY[0x1E4FA8BB0] == v1)
  {
    v3 = @"kSymptomDiagnosticErrorSessionNotFound: The session requested was not found.";
  }
  else
  {
    if (*MEMORY[0x1E4FA8B90] != v1) {
      goto LABEL_22;
    }
    v3 = @"kSymptomDiagnosticErrorRequestThrottled : The API request is temporarily throttled due to execssive calls (41)";
  }

  v2 = v3;
LABEL_22:
  return v2;
}

id symptomsSignatureForEvent(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:@"UIPerformance" forKeyedSubscript:*MEMORY[0x1E4FA8C90]];
  [v2 setObject:@"Responsiveness" forKeyedSubscript:*MEMORY[0x1E4FA8CC8]];
  v3 = NSString;
  v4 = [v1 subsystem];
  uint64_t v5 = [v1 category];
  v6 = [v1 name];
  v7 = [v3 stringWithFormat:@"%@.%@.%@", v4, v5, v6];
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FA8CB0]];

  uint64_t v8 = *MEMORY[0x1E4FA8C88];
  [v2 setObject:@"Process Name Unavailable" forKeyedSubscript:*MEMORY[0x1E4FA8C88]];
  v9 = [v1 processName];

  if (v9)
  {
    v10 = [v1 processName];
    [v2 setObject:v10 forKeyedSubscript:v8];
  }
  v11 = [v1 processImagePath];

  if (v11)
  {
    v12 = [v1 processImagePath];
    [v2 setObject:v12 forKeyedSubscript:@"processImagePath"];

    v13 = [v1 processName];

    if (!v13)
    {
      v14 = [v1 processImagePath];
      v15 = [v14 lastPathComponent];
      [v2 setObject:v15 forKeyedSubscript:v8];
    }
  }
  v16 = [v1 subsystem];
  int v17 = [v16 isEqualToString:@"com.apple.FrontBoard"];

  if (v17)
  {
    v18 = [v1 category];
    int v19 = [v18 isEqualToString:@"Watchdog"];

    if (v19)
    {
      v20 = [v1 category];
      int v21 = [v20 isEqualToString:@"Watchdogkill"];

      if (v21)
      {
        v22 = [v1 attributes];
        v23 = [v22 valueForKey:@"BundleIdOverride"];

        if (v23) {
          [v2 setObject:v23 forKeyedSubscript:v8];
        }
        v24 = [v1 attributes];
        v25 = [v24 valueForKey:@"ExecutableURLKey"];

        if (v25)
        {
          v26 = (void *)[v25 copy];
          if ([v25 hasPrefix:@"file://"])
          {
            uint64_t v27 = [v25 substringFromIndex:objc_msgSend(@"file://", "length")];

            [v2 setObject:v27 forKeyedSubscript:@"processImagePath"];
            v26 = (void *)v27;
          }
        }
      }
    }
  }

  return v2;
}

id symptomsSignatureForInterval(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 endEvent];
  v3 = symptomsSignatureForEvent((void *)v2);

  objc_opt_class();
  LOBYTE(v2) = objc_opt_isKindOfClass();

  if (v2) {
    [v3 setObject:@"Responsiveness - Low FrameRates" forKeyedSubscript:*MEMORY[0x1E4FA8CC8]];
  }
  return v3;
}

void _reportToAbc(void *a1, void *a2)
{
  id v12 = a1;
  id v3 = a2;
  v4 = getReporter();
  uint64_t v5 = [v12 objectForKeyedSubscript:@"processImagePath"];

  if (v5)
  {
    v6 = [v12 objectForKeyedSubscript:@"processImagePath"];
    v7 = appDisplayName((uint64_t)v6);

    if (v7)
    {
      [v12 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FA8C88]];
    }
    else
    {
      uint64_t v8 = [v12 objectForKeyedSubscript:@"processImagePath"];
      v9 = bundleIdFromProcessImagePath((uint64_t)v8);

      if (v9)
      {
        [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FA8C88]];
      }
      else
      {
        v10 = [v12 objectForKeyedSubscript:@"processImagePath"];
        v11 = [v10 lastPathComponent];
        [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FA8C88]];
      }
    }
    [v12 removeObjectForKey:@"processImagePath"];
  }
  [v4 snapshotWithSignature:v12 duration:0 events:v3 payload:symptomsActions actions:&__block_literal_global_102 reply:0.0];
}

void ___reportToAbc_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 objectForKey:*MEMORY[0x1E4FA8C70]];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = +[STYFrameworkHelper sharedHelper];
    v6 = [v5 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      ___reportToAbc_block_invoke_cold_1(v6);
    }
  }
  else
  {
    v7 = [v2 objectForKey:*MEMORY[0x1E4FA8C58]];
    uint64_t v8 = [v7 intValue];

    v9 = +[STYFrameworkHelper sharedHelper];
    v6 = [v9 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = descriptionForSymptomsErrorCode(v8);
      v11[0] = 67109378;
      v11[1] = v8;
      __int16 v12 = 2112;
      v13 = v10;
      _os_log_impl(&dword_1D3037000, v6, OS_LOG_TYPE_DEFAULT, "ABC did not accept case for signpost event. \n                                                    Error Code : %d \n                                                    Error Description : %@", (uint8_t *)v11, 0x12u);
    }
  }
}

void reportToAbc(void *a1, char a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v7 = +[STYFrameworkHelper sharedHelper];
  uint64_t v8 = [v7 sharedSerialQueueAtUtility];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __reportToAbc_block_invoke;
  block[3] = &unk_1E69717B0;
  char v14 = a2;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __reportToAbc_block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v11[0] = *MEMORY[0x1E4FBA990];
    id v2 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    v11[1] = *MEMORY[0x1E4FBA998];
    v12[0] = v2;
    v12[1] = *(void *)(a1 + 32);
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

    uint64_t v4 = *MEMORY[0x1E4FA8C28];
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7 = @"com.apple.DiagnosticExtensions.tailspin";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    id v10 = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  _reportToAbc(*(void **)(a1 + 40), v6);
}

float machCtsTimeToMs(unint64_t a1)
{
  if (machCtsTimeToMs_predicate != -1) {
    dispatch_once(&machCtsTimeToMs_predicate, &__block_literal_global_2);
  }
  return *(double *)&machCtsTimeToMs_timestamp_scale * (double)a1 * 1000.0;
}

double __machCtsTimeToMs_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 * 0.000000001 / (double)v1;
  machCtsTimeToMs_timestamp_scale = *(void *)&result;
  return result;
}

float eventEndToNow(void *a1)
{
  id v1 = a1;
  uint64_t v2 = mach_continuous_time();
  unint64_t v3 = [v1 timeRecordedMachContinuousTime];

  if (v2 <= v3) {
    return -1.0;
  }
  return machCtsTimeToMs(v2 - v3);
}

id dictionaryToString(uint64_t a1)
{
  uint64_t v4 = 0;
  id v1 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a1 options:0 error:&v4];
  uint64_t v2 = (void *)[[NSString alloc] initWithData:v1 encoding:4];

  return v2;
}

id valueForInfoPlistKeyInImagePath(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x1E4F28FE8] scannerWithString:a2];
  id v14 = 0;
  [v4 scanUpToString:@".app/" intoString:&v14];
  id v5 = v14;
  if (v5)
  {
    id v6 = v5;
    v7 = [v5 stringByAppendingString:@".app"];

    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithPath:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 infoDictionary];
      v11 = v10;
      if (v10)
      {
        id v12 = [v10 valueForKey:v3];
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    v7 = 0;
    id v12 = 0;
  }

  return v12;
}

id appDisplayName(uint64_t a1)
{
  return valueForInfoPlistKeyInImagePath(@"CFBundleDisplayName", a1);
}

id bundleIdFromProcessImagePath(uint64_t a1)
{
  return valueForInfoPlistKeyInImagePath(@"CFBundleIdentifier", a1);
}

void postThermalNotification(void *a1)
{
  id v6 = a1;
  id v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:lastPublishedTimeForThermals];
  if (v2 > 20.0)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:v6 object:0 userInfo:0];

    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = (void *)lastPublishedTimeForThermals;
    lastPublishedTimeForThermals = v4;
  }
}

void postMemoryNotification(void *a1)
{
  id v6 = a1;
  id v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:lastPublishedTimeForMemory];
  if (v2 > 20.0)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:v6 object:0 userInfo:0];

    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = (void *)lastPublishedTimeForMemory;
    lastPublishedTimeForMemory = v4;
  }
}

void monitorThermalPressure()
{
  if (monitorThermalPressure_onceToken != -1) {
    dispatch_once(&monitorThermalPressure_onceToken, &__block_literal_global_5);
  }
  uint64_t state64 = 0;
  notify_get_state(thermalPressureToken, &state64);
  if ((uint64_t)state64 <= 29)
  {
    unint64_t v0 = &kSTYNoThermalPressureNotification;
    if (!state64 || state64 == 20) {
      goto LABEL_10;
    }
  }
  else if (state64 == 50 || state64 == 40 || state64 == 30)
  {
    unint64_t v0 = &kSTYHeavyThermalPressureNotification;
LABEL_10:
    postThermalNotification(*v0);
  }
}

uint64_t __monitorThermalPressure_block_invoke()
{
  return notify_register_check((const char *)*MEMORY[0x1E4F14918], &thermalPressureToken);
}

void monitorMemoryPressure()
{
  int v2 = 1;
  size_t v1 = 4;
  if (!sysctlbyname("kern.memorystatus_vm_pressure_level", &v2, &v1, 0, 0))
  {
    if ((v2 - 1) >= 2)
    {
      if (v2 != 4) {
        return;
      }
      unint64_t v0 = &kSTYHeavyMemoryPressureNotification;
    }
    else
    {
      unint64_t v0 = &kSTYNoMemoryPressureNotification;
    }
    postMemoryNotification(*v0);
  }
}

void currentLevels()
{
  id v1 = +[STYFrameworkHelper sharedHelper];
  unint64_t v0 = [v1 sharedConcurrentQueueAtUtility];
  dispatch_async(v0, &__block_literal_global_15_0);
}

void __currentLevels_block_invoke()
{
  monitorMemoryPressure();
  monitorThermalPressure();
}

void startMonitoringSystemConditions()
{
}

void __startMonitoringSystemConditions_block_invoke()
{
  if (startMonitoringSystemConditions_onceToken != -1) {
    dispatch_once(&startMonitoringSystemConditions_onceToken, &__block_literal_global_19);
  }
}

uint64_t __startMonitoringSystemConditions_block_invoke_2()
{
  pollTimer = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:&__block_literal_global_23_0 block:30.0];
  return MEMORY[0x1F41817F8]();
}

uint64_t stopMonitoringSystemConditions()
{
  if (pollTimer) {
    [(id)pollTimer invalidate];
  }
  uint64_t result = thermalPressureToken;
  if (thermalPressureToken)
  {
    return notify_cancel(result);
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void processResponse(void *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = [v1 objectForKey:kSTYTailspinSaveOperationFailedErrorKey];
  uint64_t v3 = [v1 objectForKey:kSTYScenarioReportRefKey];
  uint64_t v4 = (void *)v3;
  if (!v2)
  {
    uint64_t v9 = [(id)outstandingTailspinSaveRequests objectForKey:v3];

    if (v9)
    {
      id v6 = [(id)outstandingTailspinSaveRequests objectForKey:v4];
      uint64_t v10 = [v1 objectForKey:kSTYFilepathToSavedTailspinKey];
      v11 = [MEMORY[0x1E4F1C9C8] date];
      id v12 = +[STYFrameworkHelper sharedHelper];
      id v13 = [v12 logHandle];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        processResponse_cold_3(v6);
      }

      id v14 = +[STYFrameworkHelper sharedHelper];
      v15 = [v14 logHandle];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v31 = [v6 scenario];
        uint64_t v27 = [v31 scenarioID];
        v28 = [(id)perfIssueDetectionTimeLogs objectForKey:v4];
        [v11 timeIntervalSinceDate:v28];
        *(_DWORD *)buf = 138413058;
        v33 = v27;
        __int16 v34 = 2048;
        *(void *)v35 = v29;
        *(_WORD *)&v35[8] = 1024;
        *(_DWORD *)&v35[10] = [v4 intValue];
        __int16 v36 = 2112;
        v37 = v10;
        _os_log_debug_impl(&dword_1D3037000, v15, OS_LOG_TYPE_DEBUG, "[Signpost: %@] Response details is as follows:\n\t  Total time to process tailspin save request by HangTracer: %f\n\t Request Identifier: %d\n\t Path to saved tailspin: %@ ", buf, 0x26u);
      }
      [(id)outstandingTailspinSaveRequests removeObjectForKey:v4];
      [(id)perfIssueDetectionTimeLogs removeObjectForKey:v4];

      goto LABEL_24;
    }
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    int v19 = +[STYFrameworkHelper sharedHelper];
    v20 = [v19 logHandle];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      processResponse_cold_2(v4);
    }

    int v21 = +[STYFrameworkHelper sharedHelper];
    v22 = [v21 logHandle];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      processResponse_cold_1();
    }

    goto LABEL_23;
  }
  if (!v3)
  {
    v16 = +[STYFrameworkHelper sharedHelper];
    id v6 = [v16 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      processResponse_cold_4(v2);
    }
    goto LABEL_24;
  }
  id v5 = [(id)outstandingTailspinSaveRequests objectForKey:v3];

  if (v5)
  {
    id v6 = [(id)outstandingTailspinSaveRequests objectForKey:v4];
    v7 = +[STYFrameworkHelper sharedHelper];
    uint64_t v8 = [v7 logHandle];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v30 = [v6 scenario];
      v23 = [v30 scenarioID];
      int v24 = [v4 intValue];
      v25 = [(id)outstandingTailspinSaveRequests objectForKey:v4];
      v26 = [v2 localizedDescription];
      *(_DWORD *)buf = 138413058;
      v33 = v23;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = v24;
      *(_WORD *)&v35[4] = 2112;
      *(void *)&v35[6] = v25;
      __int16 v36 = 2112;
      v37 = v26;
      _os_log_error_impl(&dword_1D3037000, v8, OS_LOG_TYPE_ERROR, "[Signpost: %@] The response from hangtracerd for report with Request identifier : %d and scenarioID %@ errored out with error message %@", buf, 0x26u);
    }
    [(id)outstandingTailspinSaveRequests removeObjectForKey:v4];
LABEL_23:
    [(id)perfIssueDetectionTimeLogs removeObjectForKey:v4];
LABEL_24:

    goto LABEL_25;
  }
  int v17 = +[STYFrameworkHelper sharedHelper];
  v18 = [v17 logHandle];

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    processResponse_cold_5();
  }

  [(id)perfIssueDetectionTimeLogs removeObjectForKey:v4];
LABEL_25:
}

void responseRecieved(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = a5;
  id v6 = htInteractionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __responseRecieved_block_invoke;
  block[3] = &unk_1E6971868;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __responseRecieved_block_invoke(uint64_t a1)
{
}

void refreshPreferences()
{
  unint64_t v0 = (void *)CFPreferencesCopyValue(@"monitorDelayedSignpostIntervals", @"com.apple.sentry.Signpostmonitor", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  monitorDelayedSignpostIntervals = [v0 intValue] != 0;
  id v1 = +[STYFrameworkHelper sharedHelper];
  int v2 = [v1 logHandle];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    refreshPreferences_cold_1(v2);
  }
}

void refreshHTPreferences()
{
  unint64_t v0 = (void *)CFPreferencesCopyValue(@"HangTracerCollectOSSignposts", @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  HangTracerCollectOSSignposts = [v0 intValue] != 0;
  id v1 = +[STYFrameworkHelper sharedHelper];
  int v2 = [v1 logHandle];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    refreshHTPreferences_cold_1(v2);
  }
}

void sub_1D303F728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D304000C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D3042748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id TailspinFilenamePrefixForInterval(void *a1)
{
  uint64_t v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v2 name];
  uint64_t v4 = [v2 endEvent];
  id v5 = [v4 processName];
  [v2 durationSeconds];
  float v7 = v6;

  uint64_t v8 = [v1 stringWithFormat:@"Sentry_%@_%@_%.1fs", v3, v5, v7];

  if ((unint64_t)[v8 length] < 0x3D)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v8 substringToIndex:59];
  }
  uint64_t v10 = v9;

  return v10;
}

void sub_1D3043C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D30445D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3044AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void ___reportToAbc_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D3037000, log, OS_LOG_TYPE_DEBUG, "ABC successfully accepted case for signpost event", v1, 2u);
}

void processResponse_cold_1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v2;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = [v2 intValue];
  uint64_t v5 = [(id)perfIssueDetectionTimeLogs objectForKey:v3];
  [v1 timeIntervalSinceDate:v5];
  v7[0] = 67109376;
  v7[1] = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v6;
  _os_log_debug_impl(&dword_1D3037000, v0, OS_LOG_TYPE_DEBUG, "Total time to process tailspin save request by HangTracer for Request identifier : %d was %f Seconds", (uint8_t *)v7, 0x12u);
}

void processResponse_cold_2(void *a1)
{
  [a1 intValue];
  OUTLINED_FUNCTION_15(&dword_1D3037000, v1, v2, "The response from hangtracerd for report with Request identifier: %d was receieved late", v3, v4, v5, v6, 0);
}

void processResponse_cold_3(void *a1)
{
  uint64_t v1 = [a1 scenario];
  uint64_t v2 = [v1 scenarioID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v3, v4, "[Signpost: %@] Received asynchronous response from HangTracer.", v5, v6, v7, v8, v9);
}

void processResponse_cold_4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D3037000, v2, v3, "The Request identifier  is missing in the response the error message is %@", v4, v5, v6, v7, v8);
}

void processResponse_cold_5()
{
  OUTLINED_FUNCTION_13();
  [v1 intValue];
  uint8_t v8 = [v0 localizedDescription];
  OUTLINED_FUNCTION_8(&dword_1D3037000, v2, v3, "The response from hangtracerd for report with Request identifier: %d errored out with error message %@", v4, v5, v6, v7, 2u);
}

void refreshPreferences_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = monitorDelayedSignpostIntervals;
  _os_log_debug_impl(&dword_1D3037000, log, OS_LOG_TYPE_DEBUG, "The preferences changed the new value of monitorDelayedSignpostIntervals is : %d", (uint8_t *)v1, 8u);
}

void refreshHTPreferences_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = HangTracerCollectOSSignposts;
  _os_log_debug_impl(&dword_1D3037000, log, OS_LOG_TYPE_DEBUG, "The HT preferences changed the new value of HangTracerCollectOSSignposts is : %d", (uint8_t *)v1, 8u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D18]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

uint64_t DRTailspinRequest()
{
  return MEMORY[0x1F4117570]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1F40D8D08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t tailspin_dump_output()
{
  return MEMORY[0x1F41824B0]();
}