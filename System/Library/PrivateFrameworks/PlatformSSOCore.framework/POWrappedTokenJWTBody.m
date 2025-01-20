@interface POWrappedTokenJWTBody
- (NSString)cipherText;
- (NSString)encapsulatedKey;
- (id)mutableCopy;
@end

@implementation POWrappedTokenJWTBody

- (id)mutableCopy
{
  v3 = objc_alloc_init(POMutableWrappedTokenJWTBody);
  v4 = [(_POJWTBodyBase *)self data];
  v5 = (void *)[v4 mutableCopy];
  [(_POJWTBodyBase *)v3 setData:v5];

  return v3;
}

- (NSString)encapsulatedKey
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__POWrappedTokenJWTBody_encapsulatedKey__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __40__POWrappedTokenJWTBody_encapsulatedKey__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __40__POWrappedTokenJWTBody_encapsulatedKey__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"encapsulatedKey"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    v6 = [v5 objectForKeyedSubscript:@"encapsulatedKey"];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)cipherText
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__POWrappedTokenJWTBody_cipherText__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __35__POWrappedTokenJWTBody_cipherText__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __35__POWrappedTokenJWTBody_cipherText__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"cipherText"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    v6 = [v5 objectForKeyedSubscript:@"cipherText"];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end