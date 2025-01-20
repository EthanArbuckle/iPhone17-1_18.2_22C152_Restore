@interface POIDTokenJWTBody
- (NSArray)audArray;
- (NSArray)groups;
- (NSDate)exp;
- (NSDate)iat;
- (NSDate)nbf;
- (NSString)aud;
- (NSString)azp;
- (NSString)iss;
- (NSString)name;
- (NSString)nonce;
- (NSString)preferred_username;
- (NSString)sub;
- (id)mutableCopy;
@end

@implementation POIDTokenJWTBody

- (id)mutableCopy
{
  v3 = objc_alloc_init(POMutableIDTokenJWTBody);
  v4 = [(_POJWTBodyBase *)self data];
  v5 = (void *)[v4 mutableCopy];
  [(_POJWTBodyBase *)v3 setData:v5];

  return v3;
}

- (NSString)aud
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__POIDTokenJWTBody_aud__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __23__POIDTokenJWTBody_aud__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __23__POIDTokenJWTBody_aud__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"aud"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    v6 = [v5 objectForKeyedSubscript:@"aud"];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSArray)audArray
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__POIDTokenJWTBody_audArray__block_invoke;
  v4[3] = &unk_2654639A0;
  v4[4] = self;
  v2 = __28__POIDTokenJWTBody_audArray__block_invoke((uint64_t)v4);
  return (NSArray *)v2;
}

id __28__POIDTokenJWTBody_audArray__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"aud"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    v6 = [v5 objectForKeyedSubscript:@"aud"];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)azp
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__POIDTokenJWTBody_azp__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __23__POIDTokenJWTBody_azp__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __23__POIDTokenJWTBody_azp__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"azp"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    v6 = [v5 objectForKeyedSubscript:@"azp"];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)iss
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__POIDTokenJWTBody_iss__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __23__POIDTokenJWTBody_iss__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __23__POIDTokenJWTBody_iss__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"iss"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    v6 = [v5 objectForKeyedSubscript:@"iss"];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)sub
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__POIDTokenJWTBody_sub__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __23__POIDTokenJWTBody_sub__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __23__POIDTokenJWTBody_sub__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"sub"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    v6 = [v5 objectForKeyedSubscript:@"sub"];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDate)iat
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __23__POIDTokenJWTBody_iat__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  v3 = __23__POIDTokenJWTBody_iat__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __23__POIDTokenJWTBody_iat__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __23__POIDTokenJWTBody_iat__block_invoke_2((uint64_t)v9);
  v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __23__POIDTokenJWTBody_iat__block_invoke(uint64_t a1)
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

id __23__POIDTokenJWTBody_iat__block_invoke_2(uint64_t a1)
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
  v10[2] = __23__POIDTokenJWTBody_exp__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  v3 = __23__POIDTokenJWTBody_exp__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __23__POIDTokenJWTBody_exp__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __23__POIDTokenJWTBody_exp__block_invoke_2((uint64_t)v9);
  v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __23__POIDTokenJWTBody_exp__block_invoke(uint64_t a1)
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

id __23__POIDTokenJWTBody_exp__block_invoke_2(uint64_t a1)
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

- (NSDate)nbf
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __23__POIDTokenJWTBody_nbf__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  v3 = __23__POIDTokenJWTBody_nbf__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __23__POIDTokenJWTBody_nbf__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __23__POIDTokenJWTBody_nbf__block_invoke_2((uint64_t)v9);
  v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __23__POIDTokenJWTBody_nbf__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"nbf"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"nbf"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

id __23__POIDTokenJWTBody_nbf__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"nbf"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"nbf"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)nonce
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__POIDTokenJWTBody_nonce__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __25__POIDTokenJWTBody_nonce__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __25__POIDTokenJWTBody_nonce__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"nonce"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"nonce"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)name
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __24__POIDTokenJWTBody_name__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __24__POIDTokenJWTBody_name__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __24__POIDTokenJWTBody_name__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"name"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)preferred_username
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__POIDTokenJWTBody_preferred_username__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __38__POIDTokenJWTBody_preferred_username__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __38__POIDTokenJWTBody_preferred_username__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"preferred_username"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"preferred_username"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSArray)groups
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__POIDTokenJWTBody_groups__block_invoke;
  v4[3] = &unk_2654639A0;
  v4[4] = self;
  v2 = __26__POIDTokenJWTBody_groups__block_invoke((uint64_t)v4);
  return (NSArray *)v2;
}

id __26__POIDTokenJWTBody_groups__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"groups"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"groups"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

@end