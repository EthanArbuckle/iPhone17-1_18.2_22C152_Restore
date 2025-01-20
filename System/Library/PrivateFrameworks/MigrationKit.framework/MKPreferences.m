@interface MKPreferences
+ (char)BOOLForKey:(id)a3;
+ (id)stringForKey:(id)a3;
+ (void)removeForKey:(id)a3;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setString:(id)a3 forKey:(id)a4;
@end

@implementation MKPreferences

+ (char)BOOLForKey:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  char v3 = CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.MigrationKit", &keyExistsAndHasValidFormat) == 1;
  if (keyExistsAndHasValidFormat) {
    return v3;
  }
  else {
    return -1;
  }
}

+ (id)stringForKey:(id)a3
{
  char v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.MigrationKit", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  return v3;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  v4 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    v4 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetValue((CFStringRef)a4, *v4, @"com.apple.MigrationKit", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

+ (void)setString:(id)a3 forKey:(id)a4
{
}

+ (void)removeForKey:(id)a3
{
}

@end