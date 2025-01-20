@interface SARestartRequest
+ (id)restartRequest;
- (BOOL)requiresResponse;
- (NSString)lastResponseId;
- (NSString)requestId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLastResponseId:(id)a3;
- (void)setRequestId:(id)a3;
@end

@implementation SARestartRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RestartRequest";
}

+ (id)restartRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)lastResponseId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastResponseId"];
}

- (void)setLastResponseId:(id)a3
{
}

- (NSString)requestId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestId"];
}

- (void)setRequestId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end