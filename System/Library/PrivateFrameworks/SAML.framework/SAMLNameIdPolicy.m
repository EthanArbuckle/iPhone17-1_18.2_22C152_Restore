@interface SAMLNameIdPolicy
+ (id)createElement:(id *)a3;
- (NSString)allowCreation;
- (NSString)format;
@end

@implementation SAMLNameIdPolicy

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLNameIdPolicy alloc] initWithTagName:@"NameIdPolicy" error:a3];
  v4 = v3;
  if (v3)
  {
    [(XMLWrapperElement *)v3 setAttributeWithName:@"Format" value:@"urn:oasis:names:tc:SAML:2.0:nameid-format:transient"];
    [(XMLWrapperElement *)v4 setAttributeWithName:@"AllowCreate" value:@"false"];
    v5 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v4 setNamespace:v5];
  }
  return v4;
}

- (NSString)format
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Format"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)allowCreation
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"AllowCreate"];
  v3 = [v2 value];

  return (NSString *)v3;
}

@end