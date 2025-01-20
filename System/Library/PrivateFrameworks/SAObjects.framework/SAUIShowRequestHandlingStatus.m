@interface SAUIShowRequestHandlingStatus
- (BOOL)requiresResponse;
- (NSString)asrStatus;
- (NSString)executionInputSystem;
- (NSString)requestHandlingStatus;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAsrStatus:(id)a3;
- (void)setExecutionInputSystem:(id)a3;
- (void)setRequestHandlingStatus:(id)a3;
@end

@implementation SAUIShowRequestHandlingStatus

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ShowRequestHandlingStatus";
}

- (NSString)asrStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"asrStatus"];
}

- (void)setAsrStatus:(id)a3
{
}

- (NSString)executionInputSystem
{
  return (NSString *)[(AceObject *)self propertyForKey:@"executionInputSystem"];
}

- (void)setExecutionInputSystem:(id)a3
{
}

- (NSString)requestHandlingStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestHandlingStatus"];
}

- (void)setRequestHandlingStatus:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end