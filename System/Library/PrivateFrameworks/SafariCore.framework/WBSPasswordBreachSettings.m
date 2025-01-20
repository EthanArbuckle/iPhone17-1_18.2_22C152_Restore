@interface WBSPasswordBreachSettings
+ (BOOL)isPasswordBreachDetectionEnabled;
+ (void)setPasswordBreachDetectionEnabled:(BOOL)a3;
@end

@implementation WBSPasswordBreachSettings

+ (BOOL)isPasswordBreachDetectionEnabled
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", @"PasswordBreachDetectionOn", 1);

  return v3;
}

+ (void)setPasswordBreachDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v4 setBool:v3 forKey:@"PasswordBreachDetectionOn"];

  if (!v3)
  {
    v5 = objc_alloc_init(WBSPasswordBreachHelperProxy);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__WBSPasswordBreachSettings_setPasswordBreachDetectionEnabled___block_invoke;
    v7[3] = &unk_1E615C208;
    v8 = v5;
    v6 = v5;
    [(WBSPasswordBreachHelperProxy *)v6 clearAllRecordsWithCompletionHandler:v7];
  }
}

uint64_t __63__WBSPasswordBreachSettings_setPasswordBreachDetectionEnabled___block_invoke(uint64_t a1, int a2)
{
  v4 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_INFO, "Password Monitoring turned off. Cleared all Password Monitoring records.", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __63__WBSPasswordBreachSettings_setPasswordBreachDetectionEnabled___block_invoke_cold_1(v5);
  }
  return [*(id *)(a1 + 32) invalidate];
}

void __63__WBSPasswordBreachSettings_setPasswordBreachDetectionEnabled___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to clear all Password Monitoring records.", v1, 2u);
}

@end