@interface SAMLNameId
+ (id)createElement:(id *)a3;
- (NSString)format;
- (NSString)nameQualifier;
- (NSString)spNameQualifier;
- (NSString)spProvidedId;
@end

@implementation SAMLNameId

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLNameId alloc] initWithTagName:@"NameId" error:a3];
  if (v3)
  {
    v4 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (NSString)nameQualifier
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"NameQualifier"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)spNameQualifier
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"SPNameQualifier"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)format
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Format"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)spProvidedId
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"SPProvidedID"];
  v3 = [v2 value];

  return (NSString *)v3;
}

@end