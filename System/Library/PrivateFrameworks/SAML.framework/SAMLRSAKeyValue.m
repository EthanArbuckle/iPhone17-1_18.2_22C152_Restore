@interface SAMLRSAKeyValue
+ (id)createElement:(id *)a3;
- (NSData)exponent;
- (NSData)modulus;
@end

@implementation SAMLRSAKeyValue

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLRSAKeyValue alloc] initWithTagName:@"RSAKeyValue" error:a3];
  return v3;
}

- (NSData)modulus
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"Modulus"];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
    v4 = [v2 textContent];
    v5 = (void *)[v3 initWithBase64EncodedString:v4 options:1];
  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (NSData)exponent
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"Exponent"];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
    v4 = [v2 textContent];
    v5 = (void *)[v3 initWithBase64EncodedString:v4 options:1];
  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

@end