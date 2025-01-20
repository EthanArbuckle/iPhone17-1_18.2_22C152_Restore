@interface SASettingGetBooleanPreference
+ (id)getBooleanPreference;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)settingKey;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSettingKey:(id)a3;
@end

@implementation SASettingGetBooleanPreference

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"GetBooleanPreference";
}

+ (id)getBooleanPreference
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)settingKey
{
  return (NSString *)[(AceObject *)self propertyForKey:@"settingKey"];
}

- (void)setSettingKey:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end