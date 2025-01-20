@interface SAUIVisualResponseShowNextSnippet
- (BOOL)requiresResponse;
- (SAUIVisualResponseSnippet)visualResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVisualResponse:(id)a3;
@end

@implementation SAUIVisualResponseShowNextSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"VisualResponseShowNextSnippet";
}

- (SAUIVisualResponseSnippet)visualResponse
{
  return (SAUIVisualResponseSnippet *)AceObjectAceObjectForProperty(self, @"visualResponse");
}

- (void)setVisualResponse:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end