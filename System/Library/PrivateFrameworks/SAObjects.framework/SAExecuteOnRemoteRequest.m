@interface SAExecuteOnRemoteRequest
+ (id)executeOnRemoteRequest;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)requiresResponseFromRemote;
- (BOOL)shouldFallbackOnAWDL;
- (BOOL)suppressResponse;
- (BOOL)useGuaranteedDelivery;
- (NSData)serializedCommand;
- (NSString)personaId;
- (SARemoteDevice)remoteDevice;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPersonaId:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setRequiresResponseFromRemote:(BOOL)a3;
- (void)setSerializedCommand:(id)a3;
- (void)setShouldFallbackOnAWDL:(BOOL)a3;
- (void)setSuppressResponse:(BOOL)a3;
- (void)setUseGuaranteedDelivery:(BOOL)a3;
@end

@implementation SAExecuteOnRemoteRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ExecuteOnRemoteRequest";
}

+ (id)executeOnRemoteRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)personaId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"personaId"];
}

- (void)setPersonaId:(id)a3
{
}

- (SARemoteDevice)remoteDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, @"remoteDevice");
}

- (void)setRemoteDevice:(id)a3
{
}

- (BOOL)requiresResponseFromRemote
{
  return AceObjectBoolForProperty(self, @"requiresResponseFromRemote");
}

- (void)setRequiresResponseFromRemote:(BOOL)a3
{
}

- (NSData)serializedCommand
{
  return (NSData *)[(AceObject *)self propertyForKey:@"serializedCommand"];
}

- (void)setSerializedCommand:(id)a3
{
}

- (BOOL)shouldFallbackOnAWDL
{
  return AceObjectBoolForProperty(self, @"shouldFallbackOnAWDL");
}

- (void)setShouldFallbackOnAWDL:(BOOL)a3
{
}

- (BOOL)suppressResponse
{
  return AceObjectBoolForProperty(self, @"suppressResponse");
}

- (void)setSuppressResponse:(BOOL)a3
{
}

- (BOOL)useGuaranteedDelivery
{
  return AceObjectBoolForProperty(self, @"useGuaranteedDelivery");
}

- (void)setUseGuaranteedDelivery:(BOOL)a3
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