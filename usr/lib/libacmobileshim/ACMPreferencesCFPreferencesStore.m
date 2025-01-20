@interface ACMPreferencesCFPreferencesStore
+ (id)preferencesStoreWithCFPreferences;
- (__CFString)preferenceID;
- (id)allValues;
- (id)multiplePreferencesValuesForKeys:(id)a3;
- (id)preferencesValueForKey:(id)a3;
- (void)removeAllValues;
- (void)replaceAllValues:(id)a3 withOptions:(int64_t)a4;
- (void)setMultiplePreferencesValues:(id)a3;
- (void)setPreferencesValue:(id)a3 forKey:(id)a4;
@end

@implementation ACMPreferencesCFPreferencesStore

+ (id)preferencesStoreWithCFPreferences
{
  v2 = objc_opt_new();

  return v2;
}

- (__CFString)preferenceID
{
  return @"com.apple.ist.ds.appleconnect.mobile.external";
}

- (id)preferencesValueForKey:(id)a3
{
  v5 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSynchronize(v5, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPropertyListRef v8 = (id)CFPreferencesCopyValue((CFStringRef)a3, [(ACMPreferencesCFPreferencesStore *)self preferenceID], v6, v7);
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMPreferencesCFPreferencesStore preferencesValueForKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMPreferencesCFPreferencesStore.m", 33, 0, "Preferences key: %@ is set to %@", a3, v8);
  }
  return (id)v8;
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMPreferencesCFPreferencesStore setPreferencesValue:forKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMPreferencesCFPreferencesStore.m", 39, 0, "Updating preferences key: %@ with value %@", a4, a3);
  }
  CFStringRef v7 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue((CFStringRef)a4, a3, v7, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  v10 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];

  CFPreferencesSynchronize(v10, v8, v9);
}

- (id)multiplePreferencesValuesForKeys:(id)a3
{
  v5 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSynchronize(v5, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFDictionaryRef v8 = CFPreferencesCopyMultiple((CFArrayRef)a3, [(ACMPreferencesCFPreferencesStore *)self preferenceID], v6, v7);

  return v8;
}

- (void)setMultiplePreferencesValues:(id)a3
{
  CFArrayRef v5 = (const __CFArray *)[a3 allKeys];
  CFStringRef v6 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetMultiple(0, v5, v6, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSetMultiple((CFDictionaryRef)a3, 0, [(ACMPreferencesCFPreferencesStore *)self preferenceID], v7, v8);
  CFStringRef v9 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];

  CFPreferencesSynchronize(v9, v7, v8);
}

- (id)allValues
{
  v3 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSynchronize(v3, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFDictionaryRef v6 = CFPreferencesCopyMultiple(0, [(ACMPreferencesCFPreferencesStore *)self preferenceID], v4, v5);

  return v6;
}

- (void)removeAllValues
{
  CFArrayRef v3 = (const __CFArray *)[[-[ACMPreferencesCFPreferencesStore allValues](self, "allValues") allKeys];
  CFStringRef v4 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetMultiple(0, v3, v4, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFStringRef v7 = [(ACMPreferencesCFPreferencesStore *)self preferenceID];

  CFPreferencesSynchronize(v7, v5, v6);
}

- (void)replaceAllValues:(id)a3 withOptions:(int64_t)a4
{
  if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLogNS(7, (uint64_t)"-[ACMPreferencesCFPreferencesStore replaceAllValues:withOptions:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMPreferencesCFPreferencesStore.m", 105, 0, @"Replacing preferences: %@", v6, v7, (uint64_t)a3);
  }
  if (a3)
  {
    [(ACMPreferencesCFPreferencesStore *)self removeAllValues];
    [(ACMPreferencesCFPreferencesStore *)self setMultiplePreferencesValues:a3];
  }
}

@end