@interface ICQPreferences
+ (BOOL)shouldEnableUnifiedMessaging;
+ (void)setShouldEnableUnifiedMessaging:(BOOL)a3;
@end

@implementation ICQPreferences

+ (BOOL)shouldEnableUnifiedMessaging
{
  return CFPreferencesGetAppBooleanValue(@"ICQEnableUnifiedMessaging", @"com.apple.cloud.quota", 0) != 0;
}

+ (void)setShouldEnableUnifiedMessaging:(BOOL)a3
{
  v3 = (const void *)[NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"ICQEnableUnifiedMessaging", v3, @"com.apple.cloud.quota");
}

@end