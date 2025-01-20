@interface SAMLStatusCode
+ (id)createElement:(id *)a3;
- (NSString)value;
- (SAMLStatusCode)statusCode;
@end

@implementation SAMLStatusCode

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLStatusCode alloc] initWithTagName:@"StatusCode" error:a3];
  if (v3)
  {
    v4 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (NSString)value
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Value"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (SAMLStatusCode)statusCode
{
  return (SAMLStatusCode *)[(XMLWrapperElement *)self firstElementByTagName:@"StatusCode"];
}

@end