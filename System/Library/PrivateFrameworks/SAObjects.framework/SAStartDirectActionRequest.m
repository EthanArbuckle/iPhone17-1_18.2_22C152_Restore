@interface SAStartDirectActionRequest
+ (id)startDirectActionRequest;
- (BOOL)requiresResponse;
- (NSDictionary)requestExecutionParameters;
- (NSString)directAction;
- (NSString)utteranceFromRequestParameters;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDirectAction:(id)a3;
- (void)setRequestExecutionParameters:(id)a3;
- (void)setUtteranceFromRequestParameters:(id)a3;
@end

@implementation SAStartDirectActionRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StartDirectActionRequest";
}

+ (id)startDirectActionRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)directAction
{
  return (NSString *)[(AceObject *)self propertyForKey:@"directAction"];
}

- (void)setDirectAction:(id)a3
{
}

- (NSDictionary)requestExecutionParameters
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"requestExecutionParameters"];
}

- (void)setRequestExecutionParameters:(id)a3
{
}

- (NSString)utteranceFromRequestParameters
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utteranceFromRequestParameters"];
}

- (void)setUtteranceFromRequestParameters:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end