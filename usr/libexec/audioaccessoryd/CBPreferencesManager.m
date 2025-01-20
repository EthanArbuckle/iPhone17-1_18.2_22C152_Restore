@interface CBPreferencesManager
+ (BOOL)isDeviceClass:(id)a3;
+ (BOOL)isRunningInRecovery;
+ (id)deviceName;
+ (id)readUserPreference:(id)a3;
+ (void)removeuserPreference:(id)a3 sync:(BOOL)a4;
+ (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5;
@end

@implementation CBPreferencesManager

+ (id)readUserPreference:(id)a3
{
  v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  return v3;
}

+ (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5
{
  BOOL v5 = a5;
  v7 = (__CFString *)a3;
  id v8 = a4;
  v9 = qword_10026AAD8;
  if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] prefName %@\n", (uint8_t *)&v11, 0xCu);
  }
  CFPreferencesSetValue(v7, v8, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5 && !CFPreferencesSynchronize(@"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v10 = qword_10026AAD8;
    if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", (uint8_t *)&v11, 2u);
    }
  }
}

+ (void)removeuserPreference:(id)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (__CFString *)a3;
  v6 = qword_10026AAD8;
  if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[removeuserPreference] prefName %@\n", (uint8_t *)&v8, 0xCu);
  }
  CFPreferencesSetValue(v5, 0, @"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v4 && !CFPreferencesSynchronize(@"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v7 = qword_10026AAD8;
    if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[removeuserPreference] psyncs returns false\n", (uint8_t *)&v8, 2u);
    }
  }
}

+ (id)deviceName
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

+ (BOOL)isRunningInRecovery
{
  return 0;
}

+ (BOOL)isDeviceClass:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)MGGetStringAnswer();
  if (v4)
  {
    BOOL v5 = v4;
    unsigned __int8 v6 = [v4 isEqualToString:v3];
    CFRelease(v5);
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end