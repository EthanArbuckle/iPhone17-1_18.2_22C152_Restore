@interface SAFmfSnippet
- (NSData)modelData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setModelData:(id)a3;
@end

@implementation SAFmfSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"Snippet";
}

- (NSData)modelData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"modelData"];
}

- (void)setModelData:(id)a3
{
}

@end