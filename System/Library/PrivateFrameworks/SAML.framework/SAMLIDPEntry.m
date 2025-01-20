@interface SAMLIDPEntry
+ (id)createElement:(id *)a3;
- (NSString)loc;
- (NSString)name;
- (NSString)providerId;
@end

@implementation SAMLIDPEntry

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLIDPEntry alloc] initWithTagName:@"IDPEntry" error:a3];
  if (v3)
  {
    v4 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (NSString)providerId
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ProviderID"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Name"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)loc
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Loc"];
  v3 = [v2 value];

  return (NSString *)v3;
}

@end