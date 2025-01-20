@interface SASettingShowAndPerformSettingsAction
+ (id)showAndPerformSettingsAction;
- (BOOL)requiresResponse;
- (SASettingSettingsAction)settingsAction;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSettingsAction:(id)a3;
@end

@implementation SASettingShowAndPerformSettingsAction

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"ShowAndPerformSettingsAction";
}

+ (id)showAndPerformSettingsAction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASettingSettingsAction)settingsAction
{
  return (SASettingSettingsAction *)AceObjectAceObjectForProperty(self, @"settingsAction");
}

- (void)setSettingsAction:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end