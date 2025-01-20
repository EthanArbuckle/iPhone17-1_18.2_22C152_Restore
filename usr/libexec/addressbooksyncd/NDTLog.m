@interface NDTLog
+ (BOOL)isInternalDevice;
+ (BOOL)obfuscate;
+ (id)facilityWithSubsystem:(id)a3 category:(id)a4;
+ (void)setObfuscate:(BOOL)a3;
@end

@implementation NDTLog

+ (void)setObfuscate:(BOOL)a3
{
  byte_100069D48 = a3;
}

+ (BOOL)obfuscate
{
  return byte_100069D48;
}

+ (BOOL)isInternalDevice
{
  return os_variant_has_internal_diagnostics();
}

+ (id)facilityWithSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(NDTLogFacility);
  id v8 = v5;
  v9 = (const char *)[v8 UTF8String];
  id v10 = v6;
  v11 = (const char *)[v10 UTF8String];

  os_log_t v12 = os_log_create(v9, v11);
  os_log_facility = v7->os_log_facility;
  v7->os_log_facility = (OS_os_log *)v12;

  v14 = (__CFString *)v8;
  if (os_variant_has_internal_diagnostics())
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"obfuscate", v14, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v16 = AppBooleanValue == 0;
    }
    else {
      BOOL v16 = 0;
    }
    uint64_t v17 = !v16;
  }
  else
  {
    uint64_t v17 = 1;
  }
  +[NDTLog setObfuscate:v17];

  return v7;
}

@end