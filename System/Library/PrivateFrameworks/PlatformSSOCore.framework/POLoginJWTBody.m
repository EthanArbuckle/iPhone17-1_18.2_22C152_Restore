@interface POLoginJWTBody
- (NSArray)amr;
- (NSDate)exp;
- (NSDate)iat;
- (NSMutableData)password;
- (NSMutableData)passwordData;
- (NSString)assertion;
- (NSString)aud;
- (NSString)client_id;
- (NSString)grant_type;
- (NSString)iss;
- (NSString)nonce;
- (NSString)refresh_token;
- (NSString)request_nonce;
- (NSString)scope;
- (NSString)sub;
- (NSString)username;
- (POLoginJWTBody)initWithJWTData:(id)a3;
- (id)dataRepresentation;
- (id)description;
- (id)mutableCopy;
- (void)dealloc;
- (void)setPasswordData:(id)a3;
- (void)zeroPassword;
@end

@implementation POLoginJWTBody

- (POLoginJWTBody)initWithJWTData:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)POLoginJWTBody;
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
  [(POLoginJWTBody *)self zeroPassword];
  v3.receiver = self;
  v3.super_class = (Class)POLoginJWTBody;
  [(POLoginJWTBody *)&v3 dealloc];
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
  objc_super v3 = objc_alloc_init(POMutableLoginJWTBody);
  v4 = [(_POJWTBodyBase *)self data];
  v5 = (void *)[v4 mutableCopy];
  [(_POJWTBodyBase *)v3 setData:v5];

  v6 = (void *)[(NSMutableData *)self->_passwordData mutableCopy];
  [(POLoginJWTBody *)v3 setPasswordData:v6];

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
  v4[2] = __21__POLoginJWTBody_aud__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __21__POLoginJWTBody_aud__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __21__POLoginJWTBody_aud__block_invoke(uint64_t a1)
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
  v4[2] = __21__POLoginJWTBody_iss__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __21__POLoginJWTBody_iss__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __21__POLoginJWTBody_iss__block_invoke(uint64_t a1)
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
  v4[2] = __21__POLoginJWTBody_sub__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __21__POLoginJWTBody_sub__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __21__POLoginJWTBody_sub__block_invoke(uint64_t a1)
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
  v10[2] = __21__POLoginJWTBody_iat__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  objc_super v3 = __21__POLoginJWTBody_iat__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __21__POLoginJWTBody_iat__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __21__POLoginJWTBody_iat__block_invoke_2((uint64_t)v9);
  CFAllocatorRef v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  id v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __21__POLoginJWTBody_iat__block_invoke(uint64_t a1)
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

id __21__POLoginJWTBody_iat__block_invoke_2(uint64_t a1)
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
  v10[2] = __21__POLoginJWTBody_exp__block_invoke;
  v10[3] = &unk_265463918;
  v10[4] = self;
  objc_super v3 = __21__POLoginJWTBody_exp__block_invoke((uint64_t)v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __21__POLoginJWTBody_exp__block_invoke_2;
  v9[3] = &unk_265463940;
  v9[4] = self;
  v4 = __21__POLoginJWTBody_exp__block_invoke_2((uint64_t)v9);
  CFAllocatorRef v5 = (void *)MEMORY[0x263EFF910];
  int v6 = [v3 intValue];
  if (!v6) {
    int v6 = [v4 intValue];
  }
  id v7 = [v5 dateWithTimeIntervalSince1970:(double)v6];

  return (NSDate *)v7;
}

id __21__POLoginJWTBody_exp__block_invoke(uint64_t a1)
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

id __21__POLoginJWTBody_exp__block_invoke_2(uint64_t a1)
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

- (NSString)assertion
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__POLoginJWTBody_assertion__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __27__POLoginJWTBody_assertion__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __27__POLoginJWTBody_assertion__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"assertion"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"assertion"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)client_id
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__POLoginJWTBody_client_id__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __27__POLoginJWTBody_client_id__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __27__POLoginJWTBody_client_id__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"client_id"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"client_id"];
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
  v4[2] = __23__POLoginJWTBody_scope__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __23__POLoginJWTBody_scope__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __23__POLoginJWTBody_scope__block_invoke(uint64_t a1)
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
  v4[2] = __23__POLoginJWTBody_nonce__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __23__POLoginJWTBody_nonce__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __23__POLoginJWTBody_nonce__block_invoke(uint64_t a1)
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
  v4[2] = __31__POLoginJWTBody_request_nonce__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __31__POLoginJWTBody_request_nonce__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __31__POLoginJWTBody_request_nonce__block_invoke(uint64_t a1)
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

- (NSString)grant_type
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__POLoginJWTBody_grant_type__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __28__POLoginJWTBody_grant_type__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __28__POLoginJWTBody_grant_type__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"grant_type"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"grant_type"];
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
  v4[2] = __31__POLoginJWTBody_refresh_token__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __31__POLoginJWTBody_refresh_token__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __31__POLoginJWTBody_refresh_token__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"refresh_token"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"refresh_token"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (NSString)username
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__POLoginJWTBody_username__block_invoke;
  v4[3] = &unk_265463940;
  v4[4] = self;
  v2 = __26__POLoginJWTBody_username__block_invoke((uint64_t)v4);
  return (NSString *)v2;
}

id __26__POLoginJWTBody_username__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"username"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"username"];
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

- (NSArray)amr
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __21__POLoginJWTBody_amr__block_invoke;
  v4[3] = &unk_2654639A0;
  v4[4] = self;
  v2 = __21__POLoginJWTBody_amr__block_invoke((uint64_t)v4);
  return (NSArray *)v2;
}

id __21__POLoginJWTBody_amr__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_super v3 = [v2 objectForKeyedSubscript:@"amr"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CFAllocatorRef v5 = [*(id *)(a1 + 32) data];
    int v6 = [v5 objectForKeyedSubscript:@"amr"];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
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