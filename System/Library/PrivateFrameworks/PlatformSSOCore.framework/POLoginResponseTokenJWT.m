@interface POLoginResponseTokenJWT
- (POLoginResponseJWTBody)decodedBody;
- (POLoginResponseTokenJWT)initWithString:(id)a3;
- (id)description;
- (id)mutableCopy;
- (void)setDecodedBody:(id)a3;
- (void)updateDecodedBody;
@end

@implementation POLoginResponseTokenJWT

- (POLoginResponseTokenJWT)initWithString:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)POLoginResponseTokenJWT;
  v3 = [(POJWT *)&v11 initWithString:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(POJWT *)v3 rawBody];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x263EFF8F8]);
      v7 = [(POJWT *)v4 rawBody];
      v8 = objc_msgSend(v6, "psso_initWithBase64URLEncodedString:", v7);

      if (v8)
      {
        v9 = [(_POJWTBodyBase *)[POLoginResponseJWTBody alloc] initWithJWTData:v8];
        [(POLoginResponseTokenJWT *)v4 setDecodedBody:v9];
      }
    }
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(POJWT *)self decodedHeader];
  v5 = [(POLoginResponseTokenJWT *)self decodedBody];
  id v6 = [(POJWT *)self stringRepresentation];
  v7 = [v3 stringWithFormat:@"%@.%@\n%@", v4, v5, v6];

  return v7;
}

- (void)updateDecodedBody
{
  uint64_t v3 = [(POJWT *)self rawBody];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(POJWT *)self decodedHeader];
    id v6 = [v5 cty];

    if (!v6)
    {
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFAllocatorRef v8 = (const __CFAllocator *)SecCFAllocatorZeroize();
      CFAllocatorSetDefault(v8);
      id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
      v10 = [(POJWT *)self rawBody];
      objc_msgSend(v9, "psso_initWithBase64URLEncodedString:", v10);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_super v11 = [(_POJWTBodyBase *)[POLoginResponseJWTBody alloc] initWithJWTData:v12];
        [(POLoginResponseTokenJWT *)self setDecodedBody:v11];
      }
      CFAllocatorSetDefault(Default);
    }
  }
}

- (id)mutableCopy
{
  uint64_t v3 = objc_alloc_init(POMutableLoginResponseTokenJWT);
  v4 = [(POLoginResponseTokenJWT *)self decodedBody];
  v5 = (void *)[v4 mutableCopy];
  [(POMutableLoginResponseTokenJWT *)v3 setBody:v5];

  id v6 = [(POJWT *)self decodedHeader];
  v7 = (void *)[v6 mutableCopy];
  [(POMutableJWT *)v3 setHeader:v7];

  return v3;
}

- (POLoginResponseJWTBody)decodedBody
{
  return (POLoginResponseJWTBody *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDecodedBody:(id)a3
{
}

- (void).cxx_destruct
{
}

@end