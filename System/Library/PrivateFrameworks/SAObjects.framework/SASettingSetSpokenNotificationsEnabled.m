@interface SASettingSetSpokenNotificationsEnabled
+ (id)setSpokenNotificationsEnabled;
- (BOOL)requiresResponse;
- (NSDate)timeToReEnable;
- (NSString)appBundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setTimeToReEnable:(id)a3;
@end

@implementation SASettingSetSpokenNotificationsEnabled

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetSpokenNotificationsEnabled";
}

+ (id)setSpokenNotificationsEnabled
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appBundleId"];
}

- (void)setAppBundleId:(id)a3
{
}

- (NSDate)timeToReEnable
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"timeToReEnable"];
}

- (void)setTimeToReEnable:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end