@interface SASettingSetValueResponse
+ (id)setValueResponse;
- (BOOL)requiresResponse;
- (SASettingEntity)setting;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSetting:(id)a3;
@end

@implementation SASettingSetValueResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetValueResponse";
}

+ (id)setValueResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASettingEntity)setting
{
  return (SASettingEntity *)AceObjectAceObjectForProperty(self, @"setting");
}

- (void)setSetting:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end