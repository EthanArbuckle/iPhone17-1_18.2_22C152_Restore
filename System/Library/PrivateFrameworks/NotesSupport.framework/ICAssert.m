@interface ICAssert
+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8;
+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 format:(id)a7;
@end

@implementation ICAssert

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v13 = a7;
  v14 = (objc_class *)NSString;
  id v15 = a8;
  v16 = (void *)[[v14 alloc] initWithFormat:v15 arguments:&v43];

  v17 = os_log_create("com.apple.notes", "Assert");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v37 = a3;
    __int16 v38 = 2080;
    v39 = a4;
    __int16 v40 = 2112;
    v41 = v16;
    _os_log_error_impl(&dword_20C263000, v17, OS_LOG_TYPE_ERROR, "Failed assertion (%s) in %s: %@", buf, 0x20u);
  }

  if (v10)
  {
    v18 = os_log_create("com.apple.notes", "SimulatedCrash");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:]((uint64_t)v16, v18);
    }
  }
  if (v9)
  {
    BOOL v35 = v10;
    id v19 = v13;
    v20 = a4;
    v21 = a3;
    BOOL v22 = +[ICUtilities isInternalInstall];
    v23 = [MEMORY[0x263F086E0] mainBundle];
    v24 = [v23 bundleIdentifier];
    v25 = ICNotesAppBundleIdentifier();
    int v26 = [v24 isEqualToString:v25];

    v27 = [MEMORY[0x263F08AB0] processInfo];
    v28 = [v27 environment];
    v29 = [v28 objectForKeyedSubscript:@"SuppressAssertionAlerts"];
    BOOL v30 = ([v29 BOOLValue] & 1) != 0
       || +[ICDeviceSupport isRunningUnitTests];

    id v13 = v19;
    if ((v22 & v26) == 1 && !v30)
    {
      v31 = [NSString stringWithFormat:@"Notes TTR: %@", v16];
      v32 = [NSString stringWithFormat:@"Failed assertion (%s) in %s:\n%@", v21, v20, v16];
      v33 = [NSString stringWithFormat:@"I got this alert right after I...\n\n%@", v32];
      if (!v35)
      {
        v34 = os_log_create("com.apple.notes", "SimulatedCrash");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:]((uint64_t)v16, v34);
        }
      }
      +[ICRadarUtilities promptUserToFileBugWithAlertMessage:v13 bugTitle:v31 bugDescription:v33];
    }
  }
}

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 format:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  v12 = (objc_class *)NSString;
  id v13 = a7;
  v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&v15];

  [a1 handleFailedAssertWithCondition:a3, a4, v8, v7, @"You encountered a serious bug in Notes. Will you please file a Radar?", @"%@", v14 functionName simulateCrash showAlert alertMessage format];
}

+ (void)handleFailedAssertWithCondition:(uint64_t)a1 functionName:(NSObject *)a2 simulateCrash:showAlert:alertMessage:format:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_20C263000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

@end