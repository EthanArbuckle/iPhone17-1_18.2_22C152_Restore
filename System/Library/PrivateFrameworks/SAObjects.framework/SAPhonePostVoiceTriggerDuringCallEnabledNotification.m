@interface SAPhonePostVoiceTriggerDuringCallEnabledNotification
- (BOOL)enableVoiceTriggerDuringPhoneCall;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEnableVoiceTriggerDuringPhoneCall:(BOOL)a3;
@end

@implementation SAPhonePostVoiceTriggerDuringCallEnabledNotification

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"PostVoiceTriggerDuringCallEnabledNotification";
}

- (BOOL)enableVoiceTriggerDuringPhoneCall
{
  return AceObjectBoolForProperty(self, @"enableVoiceTriggerDuringPhoneCall");
}

- (void)setEnableVoiceTriggerDuringPhoneCall:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end