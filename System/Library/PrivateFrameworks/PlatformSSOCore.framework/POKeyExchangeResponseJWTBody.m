@interface POKeyExchangeResponseJWTBody
- (NSDate)exp;
- (NSDate)iat;
- (NSString)key;
- (NSString)key_context;
- (id)mutableCopy;
@end

@implementation POKeyExchangeResponseJWTBody

- (id)mutableCopy
{
  v3 = objc_alloc_init(POMutableKeyExchangeResponseJWTBody);
  v4 = [(_POJWTBodyBase *)self data];
  v5 = (void *)[v4 mutableCopy];
  [(_POJWTBodyBase *)v3 setData:v5];

  return v3;
}

- (NSDate)iat
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__POKeyExchangeResponseJWTBody_iat__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  v3 = __35__POKeyExchangeResponseJWTBody_iat__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__POKeyExchangeResponseJWTBody_iat__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __35__POKeyExchangeResponseJWTBody_iat__block_invoke_2((uint64_t)v9);
  v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __35__POKeyExchangeResponseJWTBody_iat__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"iat"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"iat"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

id __35__POKeyExchangeResponseJWTBody_iat__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"iat"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"iat"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSDate)exp
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__POKeyExchangeResponseJWTBody_exp__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  v3 = __35__POKeyExchangeResponseJWTBody_exp__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__POKeyExchangeResponseJWTBody_exp__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __35__POKeyExchangeResponseJWTBody_exp__block_invoke_2((uint64_t)v9);
  v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __35__POKeyExchangeResponseJWTBody_exp__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"exp"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"exp"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

id __35__POKeyExchangeResponseJWTBody_exp__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"exp"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"exp"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)key
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__POKeyExchangeResponseJWTBody_key__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __35__POKeyExchangeResponseJWTBody_key__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __35__POKeyExchangeResponseJWTBody_key__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"key"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"key"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)key_context
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__POKeyExchangeResponseJWTBody_key_context__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __43__POKeyExchangeResponseJWTBody_key_context__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __43__POKeyExchangeResponseJWTBody_key_context__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"key_context"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"key_context"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

@end