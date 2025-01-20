@interface SASettingGetSpokenNotificationsEnabled
+ (id)getSpokenNotificationsEnabled;
- (BOOL)requiresResponse;
- (NSString)appBundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
@end

@implementation SASettingGetSpokenNotificationsEnabled

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"GetSpokenNotificationsEnabled";
}

+ (id)getSpokenNotificationsEnabled
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

- (BOOL)requiresResponse
{
  return 1;
}

@end