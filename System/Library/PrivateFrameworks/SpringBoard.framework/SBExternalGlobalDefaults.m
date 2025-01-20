@interface SBExternalGlobalDefaults
+ (BOOL)__useDynamicMethodResolution;
- (NSArray)keyboards;
- (NSArray)languages;
- (NSString)locale;
- (SBExternalGlobalDefaults)init;
- (void)flushExternalCaches;
- (void)removeFormattedPhoneNumberFromGlobalPreferences;
- (void)setKeyboards:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation SBExternalGlobalDefaults

- (SBExternalGlobalDefaults)init
{
  return (SBExternalGlobalDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple"];
}

+ (BOOL)__useDynamicMethodResolution
{
  return 0;
}

- (NSString)locale
{
  v2 = (void *)CFPreferencesCopyValue(@"AppleLocale", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return (NSString *)v2;
}

- (void)setLocale:(id)a3
{
}

- (NSArray)languages
{
  v2 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return (NSArray *)v2;
}

- (void)setLanguages:(id)a3
{
}

- (NSArray)keyboards
{
  v2 = (void *)CFPreferencesCopyValue(@"AppleKeyboards", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return (NSArray *)v2;
}

- (void)setKeyboards:(id)a3
{
}

- (void)removeFormattedPhoneNumberFromGlobalPreferences
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"SBFormattedPhoneNumber", 0, (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFPreferencesSynchronize(v2, v3, v4);
}

- (void)flushExternalCaches
{
}

@end