@interface SAIntentGroupSiriKitRemoteExecution
- (NSData)speechPackageData;
- (NSString)executionDeviceAssistantId;
- (NSString)invocationDeviceAssistantId;
- (NSString)personalDomainAuthenticationMode;
- (NSString)runLocation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExecutionDeviceAssistantId:(id)a3;
- (void)setInvocationDeviceAssistantId:(id)a3;
- (void)setPersonalDomainAuthenticationMode:(id)a3;
- (void)setRunLocation:(id)a3;
- (void)setSpeechPackageData:(id)a3;
@end

@implementation SAIntentGroupSiriKitRemoteExecution

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SiriKitRemoteExecution";
}

- (NSString)executionDeviceAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"executionDeviceAssistantId"];
}

- (void)setExecutionDeviceAssistantId:(id)a3
{
}

- (NSString)invocationDeviceAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"invocationDeviceAssistantId"];
}

- (void)setInvocationDeviceAssistantId:(id)a3
{
}

- (NSString)personalDomainAuthenticationMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"personalDomainAuthenticationMode"];
}

- (void)setPersonalDomainAuthenticationMode:(id)a3
{
}

- (NSString)runLocation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"runLocation"];
}

- (void)setRunLocation:(id)a3
{
}

- (NSData)speechPackageData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"speechPackageData"];
}

- (void)setSpeechPackageData:(id)a3
{
}

@end