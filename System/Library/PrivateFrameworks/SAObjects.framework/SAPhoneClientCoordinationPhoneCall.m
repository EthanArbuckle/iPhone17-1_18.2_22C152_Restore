@interface SAPhoneClientCoordinationPhoneCall
+ (id)clientCoordinationPhoneCall;
- (BOOL)emergencyCall;
- (BOOL)requiresResponse;
- (SAPersonAttribute)callRecipient;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCallRecipient:(id)a3;
- (void)setEmergencyCall:(BOOL)a3;
@end

@implementation SAPhoneClientCoordinationPhoneCall

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"ClientCoordinationPhoneCall";
}

+ (id)clientCoordinationPhoneCall
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

- (BOOL)emergencyCall
{
  return AceObjectBoolForProperty(self, @"emergencyCall");
}

- (void)setEmergencyCall:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end