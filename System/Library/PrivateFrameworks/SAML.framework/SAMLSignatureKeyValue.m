@interface SAMLSignatureKeyValue
+ (id)createElement:(id *)a3;
- (SAMLDSAKeyValue)dsaKeyValue;
- (SAMLRSAKeyValue)rsaKeyValue;
@end

@implementation SAMLSignatureKeyValue

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLSignatureKeyValue alloc] initWithTagName:@"KeyValue" error:a3];
  return v3;
}

- (SAMLDSAKeyValue)dsaKeyValue
{
  return (SAMLDSAKeyValue *)[(XMLWrapperElement *)self firstElementByTagName:@"DSAKeyValue"];
}

- (SAMLRSAKeyValue)rsaKeyValue
{
  return (SAMLRSAKeyValue *)[(XMLWrapperElement *)self firstElementByTagName:@"RSAKeyValue"];
}

@end