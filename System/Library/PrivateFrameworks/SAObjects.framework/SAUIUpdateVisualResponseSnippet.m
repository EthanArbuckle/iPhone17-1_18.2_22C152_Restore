@interface SAUIUpdateVisualResponseSnippet
- (BOOL)requiresResponse;
- (NSData)stateData;
- (NSString)viewId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStateData:(id)a3;
- (void)setViewId:(id)a3;
@end

@implementation SAUIUpdateVisualResponseSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"UpdateVisualResponseSnippet";
}

- (NSData)stateData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"stateData"];
}

- (void)setStateData:(id)a3
{
}

- (NSString)viewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"viewId"];
}

- (void)setViewId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end