@interface POLoginResponseJWTBody
- (NSDate)expires_on;
- (NSDate)iat;
- (NSNumber)expires_in;
- (NSNumber)refresh_token_expires_in;
- (NSString)aud;
- (NSString)id_token;
- (NSString)iss;
- (NSString)refresh_token;
- (NSString)token_type;
- (id)mutableCopy;
@end

@implementation POLoginResponseJWTBody

- (id)mutableCopy
{
  v3 = objc_alloc_init(POMutableLoginResponseJWTBody);
  v4 = [(_POJWTBodyBase *)self data];
  v5 = (void *)[v4 mutableCopy];
  [(_POJWTBodyBase *)v3 setData:v5];

  return v3;
}

- (NSString)aud
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__POLoginResponseJWTBody_aud__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __29__POLoginResponseJWTBody_aud__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __29__POLoginResponseJWTBody_aud__block_invoke(uint64_t a1)
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

- (NSString)iss
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__POLoginResponseJWTBody_iss__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __29__POLoginResponseJWTBody_iss__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __29__POLoginResponseJWTBody_iss__block_invoke(uint64_t a1)
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

- (NSDate)iat
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __29__POLoginResponseJWTBody_iat__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  v3 = __29__POLoginResponseJWTBody_iat__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__POLoginResponseJWTBody_iat__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __29__POLoginResponseJWTBody_iat__block_invoke_2((uint64_t)v9);
  v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __29__POLoginResponseJWTBody_iat__block_invoke(uint64_t a1)
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

id __29__POLoginResponseJWTBody_iat__block_invoke_2(uint64_t a1)
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

- (NSString)token_type
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__POLoginResponseJWTBody_token_type__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __36__POLoginResponseJWTBody_token_type__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __36__POLoginResponseJWTBody_token_type__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"token_type"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"token_type"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSNumber)expires_in
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__POLoginResponseJWTBody_expires_in__block_invoke;
  v4[3] = &unk_265463918;
  v4[4] = self;
  v2 = __36__POLoginResponseJWTBody_expires_in__block_invoke((uint64_t)v4);
  return (NSNumber *)v2;
}

id __36__POLoginResponseJWTBody_expires_in__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"expires_in"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"expires_in"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSNumber)refresh_token_expires_in
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__POLoginResponseJWTBody_refresh_token_expires_in__block_invoke;
  v4[3] = &unk_265463918;
  v4[4] = self;
  v2 = __50__POLoginResponseJWTBody_refresh_token_expires_in__block_invoke((uint64_t)v4);
  return (NSNumber *)v2;
}

id __50__POLoginResponseJWTBody_refresh_token_expires_in__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"refresh_token_expires_in"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"refresh_token_expires_in"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSDate)expires_on
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__POLoginResponseJWTBody_expires_on__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  v3 = __36__POLoginResponseJWTBody_expires_on__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__POLoginResponseJWTBody_expires_on__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __36__POLoginResponseJWTBody_expires_on__block_invoke_2((uint64_t)v9);
  v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __36__POLoginResponseJWTBody_expires_on__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"expires_on"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"expires_on"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

id __36__POLoginResponseJWTBody_expires_on__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"expires_on"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"expires_on"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)refresh_token
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__POLoginResponseJWTBody_refresh_token__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __39__POLoginResponseJWTBody_refresh_token__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __39__POLoginResponseJWTBody_refresh_token__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"refresh_token"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"refresh_token"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)id_token
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__POLoginResponseJWTBody_id_token__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __34__POLoginResponseJWTBody_id_token__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __34__POLoginResponseJWTBody_id_token__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  v3 = [v2 objectForKeyedSubscript:@"id_token"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"id_token"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

@end