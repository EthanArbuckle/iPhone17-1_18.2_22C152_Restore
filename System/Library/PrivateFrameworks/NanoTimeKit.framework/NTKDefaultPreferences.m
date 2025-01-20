@interface NTKDefaultPreferences
+ (BOOL)aegirShowAllOptions;
+ (BOOL)monitorColorBundleFolder;
@end

@implementation NTKDefaultPreferences

+ (BOOL)monitorColorBundleFolder
{
  NSStringFromSelector(a2);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CFPreferencesCopyAppValue(v2, @"com.apple.NanoTimeKit");
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)aegirShowAllOptions
{
  NSStringFromSelector(a2);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CFPreferencesCopyAppValue(v2, @"com.apple.NanoTimeKit");
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

@end