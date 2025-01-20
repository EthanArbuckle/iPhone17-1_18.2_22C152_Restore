@interface SAPhonePlayVoiceMail
+ (id)playVoiceMail;
- (BOOL)requiresResponse;
- (NSURL)voiceMailId;
- (SARemoteDevice)targetDevice;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTargetDevice:(id)a3;
- (void)setVoiceMailId:(id)a3;
@end

@implementation SAPhonePlayVoiceMail

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"PlayVoiceMail";
}

+ (id)playVoiceMail
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SARemoteDevice)targetDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, @"targetDevice");
}

- (void)setTargetDevice:(id)a3
{
}

- (NSURL)voiceMailId
{
  return (NSURL *)AceObjectURLForProperty(self, @"voiceMailId");
}

- (void)setVoiceMailId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end