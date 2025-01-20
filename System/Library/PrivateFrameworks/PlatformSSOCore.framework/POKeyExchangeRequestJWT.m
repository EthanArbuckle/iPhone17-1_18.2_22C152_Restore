@interface POKeyExchangeRequestJWT
- (POKeyExchangeRequestJWT)initWithString:(id)a3;
- (POKeyExchangeRequestJWTBody)decodedBody;
- (id)description;
- (id)mutableCopy;
- (void)setDecodedBody:(id)a3;
- (void)updateDecodedBody;
@end

@implementation POKeyExchangeRequestJWT

- (POKeyExchangeRequestJWT)initWithString:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POKeyExchangeRequestJWT;
  v3 = [(POJWT *)&v9 initWithString:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
    v5 = [(POJWT *)v3 rawBody];
    v6 = objc_msgSend(v4, "psso_initWithBase64URLEncodedString:", v5);

    if (v6)
    {
      v7 = [(_POJWTBodyBase *)[POKeyExchangeRequestJWTBody alloc] initWithJWTData:v6];
      [(POKeyExchangeRequestJWT *)v3 setDecodedBody:v7];
    }
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(POJWT *)self decodedHeader];
  v5 = [(POKeyExchangeRequestJWT *)self decodedBody];
  v6 = [(POJWT *)self stringRepresentation];
  v7 = [v3 stringWithFormat:@"%@.%@\n%@", v4, v5, v6];

  return v7;
}

- (void)updateDecodedBody
{
  uint64_t v3 = [(POJWT *)self rawBody];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(POJWT *)self decodedHeader];
    v6 = [v5 cty];

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
        v11 = [(_POJWTBodyBase *)[POKeyExchangeRequestJWTBody alloc] initWithJWTData:v12];
        [(POKeyExchangeRequestJWT *)self setDecodedBody:v11];
      }
      CFAllocatorSetDefault(Default);
    }
  }
}

- (id)mutableCopy
{
  uint64_t v3 = objc_alloc_init(POMutableKeyExchangeRequestJWT);
  id v4 = [(POKeyExchangeRequestJWT *)self decodedBody];
  v5 = (void *)[v4 mutableCopy];
  [(POMutableKeyExchangeRequestJWT *)v3 setBody:v5];

  v6 = [(POJWT *)self decodedHeader];
  v7 = (void *)[v6 mutableCopy];
  [(POMutableJWT *)v3 setHeader:v7];

  return v3;
}

- (POKeyExchangeRequestJWTBody)decodedBody
{
  return (POKeyExchangeRequestJWTBody *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDecodedBody:(id)a3
{
}

- (void).cxx_destruct
{
}

@end