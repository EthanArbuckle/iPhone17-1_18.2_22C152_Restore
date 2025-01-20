@interface SAUIVisualResponseSnippet
- (NSData)modelData;
- (NSString)viewIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setModelData:(id)a3;
- (void)setViewIdentifier:(id)a3;
@end

@implementation SAUIVisualResponseSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"VisualResponseSnippet";
}

- (NSData)modelData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"modelData"];
}

- (void)setModelData:(id)a3
{
}

- (NSString)viewIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"viewIdentifier"];
}

- (void)setViewIdentifier:(id)a3
{
}

@end