@interface SASettingSetVoiceTriggerEnabledState
+ (id)setVoiceTriggerEnabledState;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingSetVoiceTriggerEnabledState

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetVoiceTriggerEnabledState";
}

+ (id)setVoiceTriggerEnabledState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end