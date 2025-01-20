@interface PPSEntitlementChecker
+ (BOOL)checkForEntitlement:(id)a3;
@end

@implementation PPSEntitlementChecker

+ (BOOL)checkForEntitlement:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    v5 = v4;
    CFErrorRef error = 0;
    CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (v6)
    {
      CFBooleanRef v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
      CFRelease(v7);
    }
    else
    {
      BOOL v9 = 0;
    }
    if (error)
    {
      v10 = PPSReaderLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        +[PPSEntitlementChecker checkForEntitlement:]((id *)&error, v10);
      }

      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (void)checkForEntitlement:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [*a1 localizedDescription];
  int v4 = 136315394;
  v5 = "+[PPSEntitlementChecker checkForEntitlement:]";
  __int16 v6 = 2112;
  CFBooleanRef v7 = v3;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "(%s) Error while checking entitlement: %@", (uint8_t *)&v4, 0x16u);
}

@end