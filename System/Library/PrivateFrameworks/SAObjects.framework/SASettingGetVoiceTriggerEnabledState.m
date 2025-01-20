@interface SASettingGetVoiceTriggerEnabledState
+ (id)getVoiceTriggerEnabledState;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingGetVoiceTriggerEnabledState

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"GetVoiceTriggerEnabledState";
}

+ (id)getVoiceTriggerEnabledState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end