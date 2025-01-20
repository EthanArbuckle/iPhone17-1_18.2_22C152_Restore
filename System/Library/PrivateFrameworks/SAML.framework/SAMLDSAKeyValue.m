@interface SAMLDSAKeyValue
+ (id)createElement:(id *)a3;
- (NSData)g;
- (NSData)j;
- (NSData)p;
- (NSData)pgenCounter;
- (NSData)q;
- (NSData)seed;
- (NSData)y;
@end

@implementation SAMLDSAKeyValue

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLDSAKeyValue alloc] initWithTagName:@"DSAKeyValue" error:a3];
  return v3;
}

- (NSData)p
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"P"];
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

- (NSData)q
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"Q"];
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

- (NSData)g
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"G"];
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

- (NSData)y
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"Y"];
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

- (NSData)j
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"J"];
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

- (NSData)seed
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"Seed"];
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

- (NSData)pgenCounter
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"PgenCounter"];
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