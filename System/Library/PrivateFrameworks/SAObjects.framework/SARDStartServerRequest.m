@interface SARDStartServerRequest
- (BOOL)requiresResponse;
- (BOOL)textRequest;
- (NSArray)bargeInModes;
- (NSDictionary)voiceTriggerEventInfo;
- (NSNumber)durationSincePreviousTTSFinish;
- (NSNumber)durationSincePreviousTTSStart;
- (NSString)audioDestination;
- (NSString)audioSource;
- (NSString)deviceModel;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioDestination:(id)a3;
- (void)setAudioSource:(id)a3;
- (void)setBargeInModes:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDurationSincePreviousTTSFinish:(id)a3;
- (void)setDurationSincePreviousTTSStart:(id)a3;
- (void)setTextRequest:(BOOL)a3;
- (void)setVoiceTriggerEventInfo:(id)a3;
@end

@implementation SARDStartServerRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"StartServerRequest";
}

- (NSString)audioDestination
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioDestination"];
}

- (void)setAudioDestination:(id)a3
{
}

- (NSString)audioSource
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioSource"];
}

- (void)setAudioSource:(id)a3
{
}

- (NSArray)bargeInModes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"bargeInModes"];
}

- (void)setBargeInModes:(id)a3
{
}

- (NSString)deviceModel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceModel"];
}

- (void)setDeviceModel:(id)a3
{
}

- (NSNumber)durationSincePreviousTTSFinish
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"durationSincePreviousTTSFinish"];
}

- (void)setDurationSincePreviousTTSFinish:(id)a3
{
}

- (NSNumber)durationSincePreviousTTSStart
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"durationSincePreviousTTSStart"];
}

- (void)setDurationSincePreviousTTSStart:(id)a3
{
}

- (BOOL)textRequest
{
  return AceObjectBoolForProperty(self, @"textRequest");
}

- (void)setTextRequest:(BOOL)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"voiceTriggerEventInfo"];
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end