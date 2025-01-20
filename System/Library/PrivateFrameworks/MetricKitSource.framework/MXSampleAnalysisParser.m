@interface MXSampleAnalysisParser
+ (id)constructPayloadWithReport:(id)a3 withType:(int64_t)a4;
+ (id)getCallStackForReport:(id)a3 withType:(int64_t)a4;
+ (id)parseCallTree:(id)a3 isAttributedThread:(BOOL)a4;
+ (id)parseCallTreeFrame:(id)a3 withDepth:(unint64_t)a4;
+ (void)sendDiagnosticReport:(id)a3 forType:(int64_t)a4 forSourceID:(int64_t)a5;
@end

@implementation MXSampleAnalysisParser

+ (void)sendDiagnosticReport:(id)a3 forType:(int64_t)a4 forSourceID:(int64_t)a5
{
  id v7 = a3;
  v8 = v7;
  if (v7
    && ([v7 sampleStore], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v10 = (void *)v9,
        [v8 options],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = +[MXSampleAnalysisParser constructPayloadWithReport:v8 withType:a4];
    if (v12)
    {
      v13 = [MEMORY[0x263EFF910] date];
      v14 = +[MXSourceManager sharedManager];
      [v14 sendDiagnostic:v12 forDate:v13 andSourceID:a5];
    }
  }
  else
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      +[MXSampleAnalysisParser sendDiagnosticReport:forType:forSourceID:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

+ (id)constructPayloadWithReport:(id)a3 withType:(int64_t)a4
{
  v99[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 sampleStore];
  id v7 = [v6 targetProcess];
  v8 = [v7 bundleIdentifier];

  if (v8)
  {
    uint64_t v9 = [v6 targetProcess];
    BOOL v10 = +[MXSourceUtilities isMetricKitClient:forUser:](MXSourceUtilities, "isMetricKitClient:forUser:", v8, [v9 uid]);

    if (v10)
    {
      uint64_t v11 = +[MXSampleAnalysisParser getCallStackForReport:v5 withType:a4];
      id v12 = objc_alloc(MEMORY[0x263F13530]);
      v13 = [v6 targetProcessBundleVersion];
      v14 = [v6 targetProcess];
      BOOL v15 = [v14 bundleIdentifier];
      uint64_t v95 = [v12 initWithRegionFormat:&stru_26D45EB20 osVersion:&stru_26D45EB20 deviceType:&stru_26D45EB20 appBuildVersion:v13 platformArchitecture:&stru_26D45EB20 bundleID:v15];

      id v93 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        +[MXSampleAnalysisParser constructPayloadWithReport:withType:]2();
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        +[MXSampleAnalysisParser constructPayloadWithReport:withType:]1();
      }
      uint64_t v16 = [v6 eventTimeRange];
      uint64_t v17 = [v16 startTime];
      [v17 wallTime];
      double v19 = v18;

      if (v19 != 0.0)
      {
        uint64_t v20 = (void *)MEMORY[0x263EFF910];
        uint64_t v21 = [v6 eventTimeRange];
        uint64_t v22 = v21;
LABEL_9:
        v23 = [v21 startTime];
        [v23 wallTime];
        v97 = objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");

        goto LABEL_20;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        +[MXSampleAnalysisParser constructPayloadWithReport:withType:]0();
      }
      v25 = [v6 eventTimeRange];
      uint64_t v22 = [v25 startTime];

      uint64_t v26 = [v6 indexOfFirstSampleOnOrAfterTimestamp:v22];
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = v26;
        v28 = [v6 sampleTimestamps];
        v29 = [v28 objectAtIndexedSubscript:v27];
        [v22 guessMissingTimesBasedOnTimestamp:v29];
      }
      [v22 wallTime];
      if (v30 == 0.0)
      {
        v72 = [v6 startTime];
        [v72 wallTime];
        double v74 = v73;

        BOOL v75 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v74 != 0.0)
        {
          if (v75) {
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.8(v75, v76, v77, v78, v79, v80, v81, v82);
          }
          uint64_t v20 = (void *)MEMORY[0x263EFF910];
          uint64_t v21 = v6;
          goto LABEL_9;
        }
        if (v75) {
          +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.9(v75, v76, v77, v78, v79, v80, v81, v82);
        }
        uint64_t v32 = [MEMORY[0x263EFF910] now];
      }
      else
      {
        v31 = (void *)MEMORY[0x263EFF910];
        [v22 wallTime];
        uint64_t v32 = objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
      }
      v97 = (void *)v32;
LABEL_20:
      v33 = (void *)v11;

      id v34 = objc_alloc_init(MEMORY[0x263F08790]);
      v94 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
      objc_msgSend(v34, "setLocale:");
      [v34 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.7(v34, (uint64_t)v97);
      }
      id v92 = v34;
      v35 = [v6 targetProcess];
      uint64_t v36 = [v35 pid];
      v37 = [v6 targetProcess];
      v38 = [v37 bundleIdentifier];
      v96 = +[MXSourceUtilities getSignpostDataforPid:v36 forClient:v38 andEventTimestamp:v97];

      if (a4 == 1)
      {
        id v56 = objc_alloc(MEMORY[0x263F08980]);
        double v57 = (double)(unint64_t)[v6 bytesWritten];
        v58 = [MEMORY[0x263F08CE0] bytes];
        v44 = (void *)[v56 initWithDoubleValue:v58 unit:v57];

        v59 = [MEMORY[0x263F08CE0] megabytes];
        v49 = [v44 measurementByConvertingToUnit:v59];

        id v60 = objc_alloc(MEMORY[0x263F134F0]);
        v61 = [v6 targetProcessBundleShortVersion];
        v39 = v33;
        v53 = objc_msgSend(v60, "initWithMetaData:applicationVersion:signpostData:pid:totalWritesCaused:stackTrace:", v95, v61, v96, objc_msgSend(v6, "targetProcessId"), v49, v33);

        if (v53)
        {
          v54 = v93;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.6(v53);
          }
          [v93 setObject:v53 forKey:@"diskWriteExceptionDiagnostics"];
          id v55 = [[MXSpinTracerData alloc] initPayloadDataWithDiagnostics:v93];
          v52 = (void *)v95;
          goto LABEL_49;
        }
        id v55 = 0;
        v52 = (void *)v95;
        goto LABEL_48;
      }
      v39 = v33;
      if (!a4)
      {
        id v40 = objc_alloc(MEMORY[0x263F08980]);
        [v6 cpuUsed];
        double v42 = v41;
        v43 = [MEMORY[0x263F08C98] seconds];
        v44 = (void *)[v40 initWithDoubleValue:v43 unit:v42];

        id v45 = objc_alloc(MEMORY[0x263F08980]);
        [v6 cpuDuration];
        double v47 = v46;
        v48 = [MEMORY[0x263F08C98] seconds];
        v49 = (void *)[v45 initWithDoubleValue:v48 unit:v47];

        id v50 = objc_alloc(MEMORY[0x263F134A8]);
        v51 = [v6 targetProcessBundleShortVersion];
        v52 = (void *)v95;
        v53 = objc_msgSend(v50, "initWithMetaData:applicationVersion:signpostData:pid:callStack:totalCpuTime:totalSampledTime:", v95, v51, v96, objc_msgSend(v6, "targetProcessId"), v39, v44, v49);

        if (v53)
        {
          v54 = v93;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.5(v53);
          }
          [v93 setObject:v53 forKey:@"cpuExceptionDiagnostics"];
          id v55 = [[MXSpinTracerData alloc] initPayloadDataWithDiagnostics:v93];
          goto LABEL_49;
        }
        id v55 = 0;
LABEL_48:
        v54 = v93;
LABEL_49:

        v71 = v92;
LABEL_50:

LABEL_51:
        if (v55)
        {
          v98 = v8;
          v99[0] = v55;
          v24 = [NSDictionary dictionaryWithObjects:v99 forKeys:&v98 count:1];
        }
        else
        {
          v24 = 0;
        }

        goto LABEL_55;
      }
      v52 = (void *)v95;
      if (a4 != 4)
      {
        if (a4 == 3)
        {
          id v84 = objc_alloc(MEMORY[0x263F08980]);
          v85 = [v6 eventTimeRange];
          [v85 deltaMachAbsTimeSeconds];
          double v87 = v86;
          v88 = [MEMORY[0x263F08C98] seconds];
          v44 = (void *)[v84 initWithDoubleValue:v88 unit:v87];

          id v89 = objc_alloc(MEMORY[0x263F13478]);
          v90 = [v6 targetProcessBundleShortVersion];
          v49 = objc_msgSend(v89, "initWithMetaData:applicationVersion:signpostData:pid:callStack:launchDuration:", v95, v90, v96, objc_msgSend(v6, "targetProcessId"), v39, v44);

          if (v49)
          {
            v71 = v92;
            v54 = v93;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
              +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.4(v49);
            }
            v91 = @"appLaunchDiagnostic";
            goto LABEL_70;
          }
LABEL_62:
          id v55 = 0;
          v71 = v92;
          v54 = v93;
          goto LABEL_50;
        }
        if (a4 != 2)
        {
          id v55 = 0;
          v71 = v34;
          v54 = v93;
          goto LABEL_51;
        }
      }
      if (a4 == 2) {
        uint64_t v62 = 1;
      }
      else {
        uint64_t v62 = 2;
      }
      id v63 = objc_alloc(MEMORY[0x263F08980]);
      v64 = [v6 eventTimeRange];
      [v64 deltaMachAbsTimeSeconds];
      double v66 = v65;
      v67 = [MEMORY[0x263F08C98] seconds];
      v44 = (void *)[v63 initWithDoubleValue:v67 unit:v66];

      id v68 = objc_alloc(MEMORY[0x263F13510]);
      v69 = [v6 targetProcessBundleShortVersion];
      v49 = objc_msgSend(v68, "initWithMetaData:applicationVersion:signpostData:pid:callStack:hangDuration:hangType:", v95, v69, v96, objc_msgSend(v6, "targetProcessId"), v39, v44, v62);

      if (v49)
      {
        BOOL v70 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        v54 = v93;
        if (a4 == 2)
        {
          v71 = v92;
          if (v70) {
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:](v49);
          }
        }
        else
        {
          v71 = v92;
          if (v70) {
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:](v49);
          }
        }
        v91 = @"hangDiagnostic";
LABEL_70:
        [v54 setObject:v49 forKey:v91];
        id v55 = [[MXHangTracerData alloc] initPayloadDataWithDiagnostics:v54];
        goto LABEL_50;
      }
      goto LABEL_62;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    +[MXSampleAnalysisParser constructPayloadWithReport:withType:]();
  }
  v24 = 0;
LABEL_55:

  return v24;
}

+ (id)getCallStackForReport:(id)a3 withType:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = [v5 sampleStore];
  v8 = [v5 options];
  int v9 = [v8 aggregateStacksByProcess];

  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      +[MXSampleAnalysisParser getCallStackForReport:withType:](v7);
    }
    id v10 = [v7 targetProcess];

    if (v10)
    {
      uint64_t v11 = [v7 targetProcess];
      id v10 = [v5 callTreeForTask:v11];

      id v12 = +[MXSampleAnalysisParser parseCallTree:v10 isAttributedThread:0];
      if (v12) {
        [v6 addObject:v12];
      }
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v13 = [v5 options];
  char v14 = [v13 printTargetThreadOnly];
  if (a4 & 0xFFFFFFFFFFFFFFFELL) == 2 || (v14)
  {

LABEL_15:
    uint64_t v17 = [v7 targetProcess];
    double v18 = [v17 threads];
    double v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "targetThreadId"));
    uint64_t v20 = [v18 objectForKeyedSubscript:v19];
    uint64_t v21 = v20;
    if (v20)
    {
      id v10 = v20;
    }
    else
    {
      uint64_t v22 = [v7 targetProcess];
      id v10 = [v22 mainThread];
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      +[MXSampleAnalysisParser getCallStackForReport:withType:]();
      if (!v10) {
        goto LABEL_24;
      }
    }
    else if (!v10)
    {
      goto LABEL_24;
    }
    v23 = [v7 targetProcess];
    id v12 = [v5 callTreeForThread:v10 inTask:v23];

    v24 = +[MXSampleAnalysisParser parseCallTree:v12 isAttributedThread:1];
    if (v24) {
      [v6 addObject:v24];
    }

    goto LABEL_23;
  }

  if (a4 == 4) {
    goto LABEL_15;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    +[MXSampleAnalysisParser getCallStackForReport:withType:](v7);
  }
  id v10 = [v7 targetProcess];

  if (v10)
  {
    BOOL v15 = [v7 targetProcess];
    id v10 = [v5 callTreesForThreadsInTask:v15];

    uint64_t v16 = [v10 threadCallTrees];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __57__MXSampleAnalysisParser_getCallStackForReport_withType___block_invoke;
    v28[3] = &unk_2645F36B0;
    id v29 = v7;
    id v30 = v6;
    [v16 enumerateObjectsUsingBlock:v28];

    id v12 = v29;
LABEL_23:

    id v25 = objc_alloc(MEMORY[0x263F134C8]);
    uint64_t v26 = [v5 options];
    id v10 = (id)objc_msgSend(v25, "initWithThreadArray:aggregatedByProcess:", v6, objc_msgSend(v26, "aggregateStacksByProcess"));
  }
LABEL_24:

  return v10;
}

void __57__MXSampleAnalysisParser_getCallStackForReport_withType___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 targetThreadId];
  id v6 = [v4 thread];
  BOOL v7 = v5 == [v6 threadId];

  id v9 = +[MXSampleAnalysisParser parseCallTree:v4 isAttributedThread:v7];

  v8 = v9;
  if (v9)
  {
    [*(id *)(a1 + 40) addObject:v9];
    v8 = v9;
  }
}

+ (id)parseCallTree:(id)a3 isAttributedThread:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = [v6 rootFrames];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__MXSampleAnalysisParser_parseCallTree_isAttributedThread___block_invoke;
  v12[3] = &unk_2645F36D8;
  id v13 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v12];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F134C0]) initWithTopCallStackFrames:v9 isAttributedThread:v4];

  return v10;
}

uint64_t __59__MXSampleAnalysisParser_parseCallTree_isAttributedThread___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[MXSampleAnalysisParser parseCallTreeFrame:a2 withDepth:0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

+ (id)parseCallTreeFrame:(id)a3 withDepth:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && ([v5 frame], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    id v9 = [v6 childFrames];

    id v10 = 0;
    if (a4 <= 0x81 && v9)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v12 = [v6 childFrames];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __55__MXSampleAnalysisParser_parseCallTreeFrame_withDepth___block_invoke;
      v26[3] = &unk_2645F3700;
      id v27 = v11;
      unint64_t v28 = a4;
      id v25 = v11;
      [v12 enumerateObjectsUsingBlock:v26];

      id v13 = [v6 frame];
      char v14 = [v13 instruction];

      v24 = [v14 binary];
      id v23 = objc_alloc(MEMORY[0x263F134B8]);
      BOOL v15 = [v24 name];
      uint64_t v16 = [v24 uuid];
      uint64_t v17 = NSNumber;
      double v18 = [v6 frame];
      double v19 = objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v18, "address"));
      uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "offsetIntoTextSegment"));
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "sampleCount"));
      id v10 = (void *)[v23 initWithBinaryName:v15 binaryUUID:v16 address:v19 binaryOffset:v20 sampleCount:v21 withDepth:a4 subFrameArray:v25];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __55__MXSampleAnalysisParser_parseCallTreeFrame_withDepth___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[MXSampleAnalysisParser parseCallTreeFrame:a2 withDepth:*(void *)(a1 + 40) + 1];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

+ (void)sendDiagnosticReport:(uint64_t)a3 forType:(uint64_t)a4 forSourceID:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)constructPayloadWithReport:withType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_221DB6000, &_os_log_internal, v0, "Not a metrickit client: %@", v1, v2, v3, v4, v5);
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.2(void *a1)
{
  uint64_t v1 = [a1 hangDuration];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_221DB6000, &_os_log_internal, v2, "Hang Diagnostic: %@ with hang duration: %@", v3, v4, v5, v6, v7);
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.3(void *a1)
{
  uint64_t v1 = [a1 hangDuration];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_221DB6000, &_os_log_internal, v2, "Compositor Client Hang Diagnostic: %@ with hang duration: %@", v3, v4, v5, v6, v7);
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.4(void *a1)
{
  uint64_t v1 = [a1 launchDuration];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_221DB6000, &_os_log_internal, v2, "App Launch Diagnostic: %@ with launch duration: %@", v3, v4, v5, v6, v7);
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.5(void *a1)
{
  uint64_t v1 = [a1 totalCPUTime];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_221DB6000, &_os_log_internal, v2, "CPU Exception Diagnostic: %@ with cpu time: %@", v3, v4, v5, v6, v7);
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.6(void *a1)
{
  uint64_t v1 = [a1 totalWritesCaused];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_221DB6000, &_os_log_internal, v2, "Disk Write Exception Diagnostic: %@ with writes caused: %@", v3, v4, v5, v6, v7);
}

+ (void)constructPayloadWithReport:(void *)a1 withType:(uint64_t)a2 .cold.7(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 stringFromDate:a2];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_221DB6000, &_os_log_internal, v3, "The timestamp for the detected event is %@", v4, v5, v6, v7, v8);
}

+ (void)constructPayloadWithReport:(uint64_t)a3 withType:(uint64_t)a4 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)constructPayloadWithReport:(uint64_t)a3 withType:(uint64_t)a4 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)constructPayloadWithReport:withType:.cold.10()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_221DB6000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "sampleStore does not have event timestamp - calculating closest timestamp", v0, 2u);
}

+ (void)constructPayloadWithReport:withType:.cold.11()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_221DB6000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Starting to readback MXSignposts", v0, 2u);
}

+ (void)constructPayloadWithReport:withType:.cold.12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_221DB6000, &_os_log_internal, v0, "Report Type: %ld", v1, v2, v3, v4, v5);
}

+ (void)getCallStackForReport:(void *)a1 withType:.cold.1(void *a1)
{
  uint64_t v1 = [a1 targetProcess];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_221DB6000, &_os_log_internal, v2, "Call Stack by Process %@", v3, v4, v5, v6, v7);
}

+ (void)getCallStackForReport:withType:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_221DB6000, &_os_log_internal, v0, "Call Stack for Target Thread %@", v1, v2, v3, v4, v5);
}

+ (void)getCallStackForReport:(void *)a1 withType:.cold.3(void *a1)
{
  uint64_t v1 = [a1 targetProcess];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_221DB6000, &_os_log_internal, v2, "Call Stack by All Threads in Task %@", v3, v4, v5, v6, v7);
}

@end