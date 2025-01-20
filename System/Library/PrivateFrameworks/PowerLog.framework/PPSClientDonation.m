@interface PPSClientDonation
+ (BOOL)isRegisteredSubsystem:(const char *)a3 category:(const char *)a4;
+ (PPSTelemetryIdentifier)createIdentifierForSubsystem:(const char *)a3 category:(const char *)a4;
+ (void)sendEventWithIdentifier:(const PPSTelemetryIdentifier *)a3 payload:(__CFDictionary *)a4;
@end

@implementation PPSClientDonation

+ (void)sendEventWithIdentifier:(const PPSTelemetryIdentifier *)a3 payload:(__CFDictionary *)a4
{
  if (a3 && a4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s::%s", a3, a3->var1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    PLLogRegisteredEvent(110, v6, a4);
  }
  else
  {
    v5 = logHandle_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSClientDonation sendEventWithIdentifier:payload:]((uint64_t)a4, v5);
    }
  }
}

+ (PPSTelemetryIdentifier)createIdentifierForSubsystem:(const char *)a3 category:(const char *)a4
{
  if (!+[PPSClientDonation isRegisteredSubsystem:category:](PPSClientDonation, "isRegisteredSubsystem:category:"))return 0; {
  v4 = (PPSTelemetryIdentifier *)malloc_type_malloc(0x400uLL, 0x1000040D7EB2065uLL);
  }
  if (!v4)
  {
    id v6 = logHandle_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PPSClientDonation createIdentifierForSubsystem:category:](v6);
    }

    return 0;
  }
  v5 = v4;
  __strlcpy_chk();
  __strlcpy_chk();
  return v5;
}

+ (BOOL)isRegisteredSubsystem:(const char *)a3 category:(const char *)a4
{
  if (a3 && a4 && *a3 && *a4)
  {
    id v6 = objc_opt_new();
    v7 = [NSString stringWithUTF8String:a3];
    v8 = [NSString stringWithUTF8String:a4];
    char v9 = [v6 permissionsForSubsystem:v7 category:v8];

    if ((v9 & 1) == 0)
    {
      v10 = logHandle_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[PPSClientDonation isRegisteredSubsystem:category:]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PPSClientDonation isRegisteredSubsystem:category:]();
    }
    return 0;
  }
  return v9;
}

+ (void)sendEventWithIdentifier:(uint64_t)a1 payload:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "+[PPSClientDonation sendEventWithIdentifier:payload:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A11A5000, a2, OS_LOG_TYPE_ERROR, "(%s) Invalid inputs: payload=%@", (uint8_t *)&v2, 0x16u);
}

+ (void)isRegisteredSubsystem:category:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A11A5000, v0, OS_LOG_TYPE_ERROR, "(%s) Permission denied: %s / %s", (uint8_t *)v1, 0x20u);
}

+ (void)createIdentifierForSubsystem:(os_log_t)log category:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "+[PPSClientDonation createIdentifierForSubsystem:category:]";
  _os_log_error_impl(&dword_1A11A5000, log, OS_LOG_TYPE_ERROR, "(%s) Failed to malloc identifier", (uint8_t *)&v1, 0xCu);
}

+ (void)isRegisteredSubsystem:category:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "(%s) Invalid inputs: %s / %s", (uint8_t *)v0, 0x20u);
}

@end