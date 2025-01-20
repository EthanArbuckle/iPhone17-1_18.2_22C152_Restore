@interface MXSourceUtilities
+ (BOOL)anyClientsAvailable;
+ (BOOL)isAppAnalyticsEnabled;
+ (BOOL)isMetricKitClient:(id)a3;
+ (BOOL)isMetricKitClient:(id)a3 forUser:(unsigned int)a4;
+ (id)getSignpostDataforPid:(int)a3 forClient:(id)a4 andEventTimestamp:(id)a5;
+ (id)regionFormat;
@end

@implementation MXSourceUtilities

+ (id)regionFormat
{
  if (regionFormat_onceToken != -1) {
    dispatch_once(&regionFormat_onceToken, &__block_literal_global);
  }
  v2 = (void *)regionFormat_regionFormat;

  return v2;
}

void __33__MXSourceUtilities_regionFormat__block_invoke()
{
  v0 = [MEMORY[0x263EFF960] currentLocale];
  if (v0)
  {
    id v2 = v0;
    v1 = [v0 objectForKey:*MEMORY[0x263EFF4D0]];
    if (v1) {
      objc_storeStrong((id *)&regionFormat_regionFormat, v1);
    }

    v0 = v2;
  }
}

+ (BOOL)isMetricKitClient:(id)a3
{
  id v3 = a3;
  id v14 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v3 error:&v14];
  id v5 = v14;
  if (v5)
  {
    v6 = _MXSourceUtilitiesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MXSourceUtilities isMetricKitClient:]();
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_9;
    }
    v7 = _MXSourceUtilitiesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[MXSourceUtilities isMetricKitClient:]();
    }

    v6 = [v4 containingBundleRecord];
    uint64_t v8 = [v6 bundleIdentifier];

    id v3 = (id)v8;
  }

LABEL_9:
  v9 = (void *)CFPreferencesCopyValue(@"MXClientDataRetrieved", @"com.apple.metrickitd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  v10 = v9;
  if (v9)
  {
    v11 = [v9 objectForKeyedSubscript:v3];
    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)isMetricKitClient:(id)a3 forUser:(unsigned int)a4
{
  id v4 = a3;
  id v15 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v4 error:&v15];
  id v6 = v15;
  if (v6)
  {
    v7 = _MXSourceUtilitiesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MXSourceUtilities isMetricKitClient:]();
    }
    uint64_t v8 = v4;
  }
  else
  {
    uint64_t v8 = v4;
    if (!v5) {
      goto LABEL_10;
    }
    v9 = _MXSourceUtilitiesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[MXSourceUtilities isMetricKitClient:]();
    }

    v7 = [v5 containingBundleRecord];
    uint64_t v8 = [v7 bundleIdentifier];
  }
LABEL_10:
  v10 = (void *)CFPreferencesCopyValue(@"MXClientDataRetrieved", @"com.apple.metrickitd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  v11 = v10;
  if (v10)
  {
    BOOL v12 = [v10 objectForKeyedSubscript:v8];
    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)isAppAnalyticsEnabled
{
  if (isAppAnalyticsEnabled_onceToken != -1) {
    dispatch_once(&isAppAnalyticsEnabled_onceToken, &__block_literal_global_13);
  }
  return isAppAnalyticsEnabled_appAnalyticsEnabled;
}

uint64_t __42__MXSourceUtilities_isAppAnalyticsEnabled__block_invoke()
{
  uint64_t result = AppAnalyticsEnabled();
  isAppAnalyticsEnabled_appAnalyticsEnabled = result;
  return result;
}

+ (BOOL)anyClientsAvailable
{
  id v2 = (void *)CFPreferencesCopyValue(@"MXClientsAvailable", @"com.apple.metrickitd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

+ (id)getSignpostDataforPid:(int)a3 forClient:(id)a4 andEventTimestamp:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v44 = a4;
  id v7 = a5;
  if (v6)
  {
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy_;
    v56 = __Block_byref_object_dispose_;
    id v57 = [MEMORY[0x263EFF980] array];
    id v8 = objc_alloc_init(MEMORY[0x263F6C5B8]);
    id v9 = objc_alloc_init(MEMORY[0x263F6C5B0]);
    v10 = [NSNumber numberWithInt:v6];
    [v9 addPIDNumber:v10];

    [v8 addSubsystem:@"com.apple.metrickit.log" category:0];
    id v11 = objc_alloc_init(MEMORY[0x263F6C5A8]);
    [v11 setSubsystemCategoryFilter:v8];
    [v11 setPidFilter:v9];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke;
    v49[3] = &unk_2645F3770;
    id v12 = v44;
    id v50 = v12;
    v51 = &v52;
    [v11 setEmitEventProcessingBlock:v49];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_37;
    v46[3] = &unk_2645F3798;
    id v47 = v12;
    v48 = &v52;
    [v11 setIntervalCompletionProcessingBlock:v46];
    id v13 = v7;
    id v14 = [v13 dateByAddingTimeInterval:-5.0];
    id v15 = objc_alloc_init(MEMORY[0x263F08790]);
    v16 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v15 setLocale:v16];
    [v15 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    v17 = &_os_log_internal;
    id v18 = &_os_log_internal;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [v15 stringFromDate:v14];
      v20 = [v15 stringFromDate:v13];
      +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:].cold.5(v19, v20, (uint64_t)v59);
    }

    id v45 = 0;
    char v21 = [v11 processLogArchiveWithPath:0 startDate:v14 endDate:v13 errorOut:&v45];
    id v22 = v45;
    if (v21)
    {
      BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v23) {
        +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:](v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    else
    {
      v33 = _MXSourceUtilitiesLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = [v22 description];
        +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:].cold.4(v34, buf, v33);
      }
    }
    if (objc_msgSend((id)v53[5], "count", v44))
    {
      id v32 = (id)v53[5];
    }
    else
    {
      BOOL v35 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v35) {
        +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:](v35, v36, v37, v38, v39, v40, v41, v42);
      }
      id v32 = 0;
    }

    _Block_object_dispose(&v52, 8);
  }
  else
  {
    v31 = _MXSourceUtilitiesLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:](v31);
    }

    id v32 = 0;
  }

  return v32;
}

uint64_t __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 processImagePath];
  id v5 = [v4 stringByDeletingLastPathComponent];

  uint64_t v6 = [MEMORY[0x263F086E0] bundleWithPath:v5];
  id v7 = [v6 bundleIdentifier];
  if (([v7 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_2();
    }
    id v24 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();
  }
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count] < 0x64)
  {
    id v16 = objc_alloc(MEMORY[0x263F13558]);
    v17 = [v3 subsystem];
    id v18 = [v3 category];
    id v19 = [v3 name];
    v20 = [v3 beginDate];
    LOBYTE(v23) = 0;
    char v21 = (void *)[v16 initWithSubSystem:v17 category:v18 name:v19 beginTimeStamp:v20 endTimeStamp:0 duration:0 isInterval:v23];

    if (v21) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v21];
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v8) {
      __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return 1;
}

id __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_29(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"clientOfInterest";
  v5[0] = v1;
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

uint64_t __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 endEvent];
  id v5 = [v4 processImagePath];
  uint64_t v6 = [v5 stringByDeletingLastPathComponent];

  id v7 = [MEMORY[0x263F086E0] bundleWithPath:v6];
  BOOL v8 = [v7 bundleIdentifier];
  if (([v8 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_37_cold_2();
    }
    id v34 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();
  }
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count] < 0x64)
  {
    v31 = v8;
    id v32 = v7;
    v33 = v6;
    id v17 = objc_alloc(MEMORY[0x263F13558]);
    id v18 = [v3 subsystem];
    id v19 = [v3 category];
    v20 = [v3 name];
    char v21 = [v3 beginDate];
    id v22 = [v3 endDate];
    id v23 = objc_alloc(MEMORY[0x263F08980]);
    [v3 durationMs];
    double v25 = v24;
    uint64_t v26 = [MEMORY[0x263F08C98] milliseconds];
    uint64_t v27 = (void *)[v23 initWithDoubleValue:v26 unit:v25];
    LOBYTE(v30) = 1;
    uint64_t v28 = (void *)[v17 initWithSubSystem:v18 category:v19 name:v20 beginTimeStamp:v21 endTimeStamp:v22 duration:v27 isInterval:v30];

    if (v28) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v28];
    }

    id v7 = v32;
    uint64_t v6 = v33;
    BOOL v8 = v31;
  }
  else
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v9) {
      __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return 1;
}

id __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_38(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"clientOfInterest";
  v5[0] = v1;
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)isMetricKitClient:.cold.1()
{
  OUTLINED_FUNCTION_5();
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(v1, v2), "containingBundleRecord");
  id v4 = [v3 bundleIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_221DB6000, v0, v5, "The client %@ is an app Extension checking metrickit subscription for main app's bundleID %@", v6);
}

+ (void)isMetricKitClient:.cold.2()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(v0, v1), "description");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_221DB6000, v3, v4, "Failed to create bundle record for bundleID %@ and error %@", v5, v6, v7, v8, v9);
}

+ (void)getSignpostDataforPid:(os_log_t)log forClient:andEventTimestamp:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_221DB6000, log, OS_LOG_TYPE_ERROR, "pid passed for reading MXsignpost was nill", v1, 2u);
}

+ (void)getSignpostDataforPid:(uint64_t)a3 forClient:(uint64_t)a4 andEventTimestamp:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getSignpostDataforPid:(uint64_t)a3 forClient:(uint64_t)a4 andEventTimestamp:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getSignpostDataforPid:(void *)a1 forClient:(uint8_t *)buf andEventTimestamp:(os_log_t)log .cold.4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_221DB6000, log, OS_LOG_TYPE_ERROR, "MXSignpost Readback failed to start with error %@", buf, 0xCu);
}

+ (void)getSignpostDataforPid:(void *)a1 forClient:(void *)a2 andEventTimestamp:(uint64_t)a3 .cold.5(void *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_0(&dword_221DB6000, &_os_log_internal, a3, "Reading signposts with Start Timestamp : %@ and End Timestamp %@", (uint8_t *)a3);
}

void __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_221DB6000, &_os_log_internal, v0, "The bundleID of the process which emitted this signpost event :%@ client of interest : %@ Mismatch detected ignoring this interval", v1);
}

void __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_37_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_221DB6000, &_os_log_internal, v0, "The bundleID of the process which emitted this signpost interval :%@ client of interest : %@ Mismatch detected ignoring this interval", v1);
}

@end