@interface VKAssert
+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8;
+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 format:(id)a7;
@end

@implementation VKAssert

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  v14 = (objc_class *)NSString;
  id v15 = a8;
  v16 = (void *)[[v14 alloc] initWithFormat:v15 arguments:&v35];

  v17 = os_log_create("com.apple.VisionKit", "Assert");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v29 = a3;
    __int16 v30 = 2080;
    v31 = a4;
    __int16 v32 = 2112;
    v33 = v16;
    _os_log_error_impl(&dword_1DB266000, v17, OS_LOG_TYPE_ERROR, "Failed assertion (%s) in %s: %@", buf, 0x20u);
  }

  if (v10)
  {
    v18 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:]((uint64_t)v16, v18);
    }
  }
  if (v9)
  {
    BOOL isInternalBuild = vk_isInternalBuild();
    v20 = [MEMORY[0x1E4F28F80] processInfo];
    v21 = [v20 environment];
    v22 = [v21 objectForKeyedSubscript:@"SuppressAssertionAlerts"];
    char v23 = [v22 BOOLValue];

    if (isInternalBuild && (v23 & 1) == 0)
    {
      v24 = [NSString stringWithFormat:@"Notes TTR: %@", v16];
      v25 = [NSString stringWithFormat:@"Failed assertion (%s) in %s:\n%@", a3, a4, v16];
      v26 = [NSString stringWithFormat:@"I got this alert right after I...\n\n%@", v25];
      if (!v10)
      {
        v27 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:]((uint64_t)v16, v27);
        }
      }
      +[VKRadarUtilities promptUserToFileBugWithAlertMessage:v13 bugTitle:v24 bugDescription:v26];
    }
  }
  NSLog(&cfstr_FailedAssertIn.isa, a4, v16);
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
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DB266000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

@end