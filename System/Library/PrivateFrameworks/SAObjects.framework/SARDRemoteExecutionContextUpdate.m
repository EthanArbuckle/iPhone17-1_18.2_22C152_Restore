@interface SARDRemoteExecutionContextUpdate
- (BOOL)requiresResponse;
- (NSData)executionContextUpdate;
- (NSString)remoteDeviceAssistantId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExecutionContextUpdate:(id)a3;
- (void)setRemoteDeviceAssistantId:(id)a3;
@end

@implementation SARDRemoteExecutionContextUpdate

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"RemoteExecutionContextUpdate";
}

- (NSData)executionContextUpdate
{
  return (NSData *)[(AceObject *)self propertyForKey:@"executionContextUpdate"];
}

- (void)setExecutionContextUpdate:(id)a3
{
}

- (NSString)remoteDeviceAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"remoteDeviceAssistantId"];
}

- (void)setRemoteDeviceAssistantId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end