@interface SAUISnippetDisplayConfigurationRequest
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUISnippetDisplayConfigurationRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SnippetDisplayConfigurationRequest";
}

- (BOOL)requiresResponse
{
  return 1;
}

@end