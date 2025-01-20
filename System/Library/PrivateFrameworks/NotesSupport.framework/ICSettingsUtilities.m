@interface ICSettingsUtilities
+ (BOOL)BOOLForKey:(id)a3;
+ (id)objectForKey:(id)a3;
+ (void)registerDefaults:(id)a3;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation ICSettingsUtilities

+ (void)setObject:(id)a3 forKey:(id)a4
{
  v5 = (__CFString *)a4;
  id v6 = a3;
  if (ICIsSandboxModeEnabled()) {
    CFStringRef v7 = @"com.apple.mobilenotesdebug";
  }
  else {
    CFStringRef v7 = @"com.apple.mobilenotes";
  }
  CFPreferencesSetAppValue(v5, v6, v7);

  if (ICIsSandboxModeEnabled()) {
    CFStringRef v8 = @"com.apple.mobilenotesdebug";
  }
  else {
    CFStringRef v8 = @"com.apple.mobilenotes";
  }
  CFPreferencesAppSynchronize(v8);
}

+ (BOOL)BOOLForKey:(id)a3
{
  v3 = [a1 objectForKey:a3];
  uint64_t v4 = objc_opt_class();
  v5 = ICCheckedDynamicCast(v4, (uint64_t)v3);
  char v6 = [v5 BOOLValue];

  return v6;
}

+ (id)objectForKey:(id)a3
{
  v3 = (__CFString *)a3;
  if (ICIsSandboxModeEnabled()) {
    CFStringRef v4 = @"com.apple.mobilenotesdebug";
  }
  else {
    CFStringRef v4 = @"com.apple.mobilenotes";
  }
  v5 = (void *)CFPreferencesCopyAppValue(v3, v4);

  return v5;
}

+ (void)registerDefaults:(id)a3
{
  id v6 = a3;
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  if (ICIsSandboxModeEnabled()) {
    CFStringRef v4 = @"com.apple.mobilenotesdebug";
  }
  else {
    CFStringRef v4 = @"com.apple.mobilenotes";
  }
  v5 = (void *)[v3 initWithSuiteName:v4];
  if (!v5)
  {
    v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  }
  [v5 registerDefaults:v6];
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [a1 setObject:v8 forKey:v7];
}

@end