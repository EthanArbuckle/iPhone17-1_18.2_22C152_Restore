@interface NSUserDefaults(TCSTinCanUserDefaults)
- (uint64_t)_tcsEnsureProtectionClass;
- (uint64_t)_tcsHandleDeviceFirstUnlock;
- (uint64_t)_tcsSetPrefsDaemonCacheEnabled:()TCSTinCanUserDefaults;
- (void)_tcsSetPrefsObject:()TCSTinCanUserDefaults forKey:;
@end

@implementation NSUserDefaults(TCSTinCanUserDefaults)

- (uint64_t)_tcsHandleDeviceFirstUnlock
{
  _TCSInitializeLogging();
  v2 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21E834000, v2, OS_LOG_TYPE_DEFAULT, "TCSTinCanUserDefaults notified of device first-unlock.", v4, 2u);
  }
  return [a1 _tcsEnsureProtectionClass];
}

- (uint64_t)_tcsSetPrefsDaemonCacheEnabled:()TCSTinCanUserDefaults
{
  return MEMORY[0x270EE56A0](@"com.apple.tincan", *MEMORY[0x263EFFE70], *MEMORY[0x263EFFE68], 0, a3);
}

- (void)_tcsSetPrefsObject:()TCSTinCanUserDefaults forKey:
{
}

- (uint64_t)_tcsEnsureProtectionClass
{
  _TCSInitializeLogging();
  v2 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21E834000, v2, OS_LOG_TYPE_DEFAULT, "TCSTinCanUserDefaults ensuring domain is protection class C.", v4, 2u);
  }
  _CFPreferencesSetFileProtectionClass();
  [a1 _tcsSetPrefsDaemonCacheEnabled:0];
  [a1 _tcsSetPrefsObject:MEMORY[0x263EFFA88] forKey:@"SetFileProtectionClass"];
  [a1 _tcsSetPrefsObject:0 forKey:@"SetFileProtectionClass"];
  return [a1 _tcsSetPrefsDaemonCacheEnabled:1];
}

@end