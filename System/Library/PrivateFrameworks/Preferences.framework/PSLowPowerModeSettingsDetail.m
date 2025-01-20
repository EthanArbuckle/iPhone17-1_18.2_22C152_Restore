@interface PSLowPowerModeSettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSLowPowerModeSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=BATTERY_USAGE"];
}

+ (id)iconImage
{
  return 0;
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = _PSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "+[PSLowPowerModeSettingsDetail setEnabled:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "######## %s - enabled: %d", (uint8_t *)&v8, 0x12u);
  }

  v5 = [MEMORY[0x1E4F73140] sharedInstance];
  char v6 = [v5 setPowerMode:v3 fromSource:*MEMORY[0x1E4F73148]];

  if ((v6 & 1) == 0)
  {
    v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PSLowPowerModeSettingsDetail setEnabled:](v3, v7);
    }
  }
}

+ (BOOL)isEnabled
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  char v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

+ (void)setEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "Failed to report change to Low Power Mode: %@ via LowPowerMode", (uint8_t *)&v4, 0xCu);
}

@end