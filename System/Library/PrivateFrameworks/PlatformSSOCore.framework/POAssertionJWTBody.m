@interface POAssertionJWTBody
- (NSDate)exp;
- (NSDate)iat;
- (NSMutableData)password;
- (NSMutableData)passwordData;
- (NSString)aud;
- (NSString)iss;
- (NSString)nonce;
- (NSString)request_nonce;
- (NSString)scope;
- (NSString)sub;
- (POAssertionJWTBody)initWithJWTData:(id)a3;
- (id)dataRepresentation;
- (id)description;
- (id)mutableCopy;
- (void)dealloc;
- (void)setPasswordData:(id)a3;
- (void)zeroPassword;
@end

@implementation POAssertionJWTBody

- (POAssertionJWTBody)initWithJWTData:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)POAssertionJWTBody;
  v3 = [(_POJWTBodyBase *)&v15 initWithJWTData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(_POJWTBodyBase *)v3 data];
    v6 = [v5 objectForKeyedSubscript:@"password"];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x263EFF990]);
      v8 = [(_POJWTBodyBase *)v4 data];
      v9 = [v8 objectForKeyedSubscript:@"password"];
      v10 = [v9 dataUsingEncoding:4];
      uint64_t v11 = [v7 initWithData:v10];
      passwordData = v4->_passwordData;
      v4->_passwordData = (NSMutableData *)v11;

      v13 = [(_POJWTBodyBase *)v4 data];
      [v13 removeObjectForKey:@"password"];
    }
  }
  return v4;
}

- (void)dealloc
{
  [(POAssertionJWTBody *)self zeroPassword];
  v3.receiver = self;
  v3.super_class = (Class)POAssertionJWTBody;
  [(POAssertionJWTBody *)&v3 dealloc];
}

- (void)zeroPassword
{
  passwordData = self->_passwordData;
  if (passwordData)
  {
    memset_s([(NSMutableData *)passwordData mutableBytes], [(NSMutableData *)self->_passwordData length], 0, [(NSMutableData *)self->_passwordData length]);
    passwordData = self->_passwordData;
  }
  self->_passwordData = 0;
}

- (id)mutableCopy
{
  objc_super v3 = objc_alloc_init(POMutableAssertionJWTBody);
  v4 = [(_POJWTBodyBase *)self data];
  v5 = (void *)[v4 mutableCopy];
  [(_POJWTBodyBase *)v3 setData:v5];

  v6 = (void *)[(NSMutableData *)self->_passwordData mutableCopy];
  [(POAssertionJWTBody *)v3 setPasswordData:v6];

  return v3;
}

- (id)dataRepresentation
{
  objc_super v3 = [(_POJWTBodyBase *)self data];
  v4 = (void *)[v3 mutableCopy];

  if (self->_passwordData)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)SecCFAllocatorZeroize();
    v6 = (__CFString *)CFStringCreateWithBytes(v5, (const UInt8 *)[(NSMutableData *)self->_passwordData mutableBytes], [(NSMutableData *)self->_passwordData length], 0x8000100u, 0);
    [v4 setObject:v6 forKeyedSubscript:@"password"];
  }
  uint64_t v9 = 0;
  id v7 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:9 error:&v9];

  return v7;
}

- (NSString)aud
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__POAssertionJWTBody_aud__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __25__POAssertionJWTBody_aud__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __25__POAssertionJWTBody_aud__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"aud"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
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
  v4[2] = __25__POAssertionJWTBody_iss__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __25__POAssertionJWTBody_iss__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __25__POAssertionJWTBody_iss__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"iss"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
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
  v4[2] = __25__POAssertionJWTBody_sub__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __25__POAssertionJWTBody_sub__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __25__POAssertionJWTBody_sub__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"sub"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
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
  v10[2] = __25__POAssertionJWTBody_iat__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  objc_super v3 = __25__POAssertionJWTBody_iat__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __25__POAssertionJWTBody_iat__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __25__POAssertionJWTBody_iat__block_invoke_2((uint64_t)v9);
  CFAllocatorRef v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  id v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __25__POAssertionJWTBody_iat__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"iat"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"iat"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

id __25__POAssertionJWTBody_iat__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"iat"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
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
  v10[2] = __25__POAssertionJWTBody_exp__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  objc_super v3 = __25__POAssertionJWTBody_exp__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __25__POAssertionJWTBody_exp__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __25__POAssertionJWTBody_exp__block_invoke_2((uint64_t)v9);
  CFAllocatorRef v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  id v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __25__POAssertionJWTBody_exp__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"exp"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"exp"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

id __25__POAssertionJWTBody_exp__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"exp"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"exp"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)scope
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__POAssertionJWTBody_scope__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __27__POAssertionJWTBody_scope__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __27__POAssertionJWTBody_scope__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"scope"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"scope"];
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
  v4[2] = __27__POAssertionJWTBody_nonce__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __27__POAssertionJWTBody_nonce__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __27__POAssertionJWTBody_nonce__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"nonce"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"nonce"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)request_nonce
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__POAssertionJWTBody_request_nonce__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __35__POAssertionJWTBody_request_nonce__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __35__POAssertionJWTBody_request_nonce__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"request_nonce"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"request_nonce"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSMutableData)password
{
  return self->_passwordData;
}

- (id)description
{
  objc_super v3 = [(_POJWTBodyBase *)self data];
  v4 = (void *)[v3 mutableCopy];

  if (self->_passwordData) {
    [v4 setObject:@"password redacted" forKeyedSubscript:@"password"];
  }
  CFAllocatorRef v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:9 error:0];
  int v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];

  return v6;
}

- (NSMutableData)passwordData
{
  return (NSMutableData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPasswordData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end