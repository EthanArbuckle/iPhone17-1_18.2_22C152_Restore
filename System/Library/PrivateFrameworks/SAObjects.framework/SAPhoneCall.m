@interface SAPhoneCall
+ (id)call;
- (BOOL)faceTime;
- (BOOL)faceTimeAudio;
- (BOOL)handsFreeCall;
- (BOOL)requiresResponse;
- (BOOL)speakerphoneCall;
- (NSNumber)emergencyCall;
- (SAPersonAttribute)callRecipient;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCallRecipient:(id)a3;
- (void)setEmergencyCall:(id)a3;
- (void)setFaceTime:(BOOL)a3;
- (void)setFaceTimeAudio:(BOOL)a3;
- (void)setHandsFreeCall:(BOOL)a3;
- (void)setSpeakerphoneCall:(BOOL)a3;
@end

@implementation SAPhoneCall

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"Call";
}

+ (id)call
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAPersonAttribute)callRecipient
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, @"callRecipient");
}

- (void)setCallRecipient:(id)a3
{
}

- (NSNumber)emergencyCall
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"emergencyCall"];
}

- (void)setEmergencyCall:(id)a3
{
}

- (BOOL)faceTime
{
  return AceObjectBoolForProperty(self, @"faceTime");
}

- (void)setFaceTime:(BOOL)a3
{
}

- (BOOL)faceTimeAudio
{
  return AceObjectBoolForProperty(self, @"faceTimeAudio");
}

- (void)setFaceTimeAudio:(BOOL)a3
{
}

- (BOOL)handsFreeCall
{
  return AceObjectBoolForProperty(self, @"handsFreeCall");
}

- (void)setHandsFreeCall:(BOOL)a3
{
}

- (BOOL)speakerphoneCall
{
  return AceObjectBoolForProperty(self, @"speakerphoneCall");
}

- (void)setSpeakerphoneCall:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end