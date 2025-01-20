@interface SAUIStartGenAIEnablementFlow
- (BOOL)explicitRequest;
- (BOOL)requiresResponse;
- (NSString)source;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExplicitRequest:(BOOL)a3;
- (void)setSource:(id)a3;
@end

@implementation SAUIStartGenAIEnablementFlow

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"StartGenAIEnablementFlow";
}

- (BOOL)explicitRequest
{
  return AceObjectBoolForProperty(self, @"explicitRequest");
}

- (void)setExplicitRequest:(BOOL)a3
{
}

- (NSString)source
{
  return (NSString *)[(AceObject *)self propertyForKey:@"source"];
}

- (void)setSource:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end