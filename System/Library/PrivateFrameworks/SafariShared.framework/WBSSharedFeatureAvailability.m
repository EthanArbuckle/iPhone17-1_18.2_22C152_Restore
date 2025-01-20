@interface WBSSharedFeatureAvailability
+ (BOOL)areLocalSiriSuggestionsEnabled;
+ (BOOL)areSiriSearchSuggestionsEnabled;
+ (NSString)safariApplicationPlatformBundleIdentifier;
+ (void)setLocalSiriSuggestionsEnabled:(BOOL)a3;
@end

@implementation WBSSharedFeatureAvailability

+ (BOOL)areSiriSearchSuggestionsEnabled
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v3 BOOLForKey:*MEMORY[0x1E4F981F0]]) {
    char v4 = [a1 areLocalSiriSuggestionsEnabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)areLocalSiriSuggestionsEnabled
{
  v2 = [a1 safariApplicationPlatformBundleIdentifier];
  v3 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  char v4 = [v3 containsObject:v2] ^ 1;

  return v4;
}

+ (NSString)safariApplicationPlatformBundleIdentifier
{
  return (NSString *)@"com.apple.mobilesafari";
}

+ (void)setLocalSiriSuggestionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [a1 safariApplicationPlatformBundleIdentifier];
  char v4 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  v5 = v4;
  if (v4) {
    v6 = (void *)[v4 mutableCopy];
  }
  else {
    v6 = objc_opt_new();
  }
  v7 = v6;
  if (v3)
  {
    [v6 removeObject:v9];
  }
  else if (([v6 containsObject:v9] & 1) == 0)
  {
    [v7 addObject:v9];
  }
  CFPreferencesSetAppValue(@"AppCanShowSiriSuggestionsBlacklist", v7, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

@end