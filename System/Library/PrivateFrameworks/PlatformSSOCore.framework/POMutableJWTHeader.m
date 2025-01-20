@interface POMutableJWTHeader
- (void)addCustomClaims:(id)a3;
- (void)addEphemeralPublicKey:(__SecKey *)a3;
- (void)setAlg:(id)a3;
- (void)setApu:(id)a3;
- (void)setApv:(id)a3;
- (void)setCty:(id)a3;
- (void)setEnc:(id)a3;
- (void)setEpk:(id)a3;
- (void)setKid:(id)a3;
- (void)setP2c:(id)a3;
- (void)setP2s:(id)a3;
- (void)setTyp:(id)a3;
- (void)setX5c:(id)a3;
- (void)setX5t:(id)a3;
@end

@implementation POMutableJWTHeader

- (void)setTyp:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"typ"];
}

- (void)setCty:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"cty"];
}

- (void)setAlg:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"alg"];
}

- (void)setX5c:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"x5c"];
}

- (void)setX5t:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"x5t"];
}

- (void)setKid:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"kid"];
}

- (void)setEnc:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"enc"];
}

- (void)setP2s:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"p2s"];
}

- (void)setP2c:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"p2c"];
}

- (void)setEpk:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"epk"];
}

- (void)setApu:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"apu"];
}

- (void)setApv:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"apv"];
}

- (void)addCustomClaims:(id)a3
{
  id v4 = a3;
  id v5 = [(POJWTHeader *)self data];
  [v5 addEntriesFromDictionary:v4];
}

- (void)addEphemeralPublicKey:(__SecKey *)a3
{
  CFDictionaryRef v5 = SecKeyCopyAttributes(a3);
  v6 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x263F16F68]];
  v7 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x263F16FA8]];
  if ([v6 isEqualToString:*MEMORY[0x263F16F80]]
    && (([v7 isEqualToString:*MEMORY[0x263F16FB0]] & 1) != 0
     || ([v7 isEqualToString:*MEMORY[0x263F16FB8]] & 1) != 0))
  {
    CFErrorRef error = 0;
    CFDataRef v8 = SecKeyCopyExternalRepresentation(a3, &error);
    CFDataRef v9 = v8;
    if (error)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_100;
      v18[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v18[4] = error;
      id v10 = __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_100((uint64_t)v18);
    }
    else if ([(__CFData *)v8 length] == 65)
    {
      v12 = -[__CFData subdataWithRange:](v9, "subdataWithRange:", 1, 32);
      v13 = -[__CFData subdataWithRange:](v9, "subdataWithRange:", 33, 32);
      v14 = objc_opt_new();
      [v14 setObject:@"EC" forKeyedSubscript:@"kty"];
      [v14 setObject:@"P-256" forKeyedSubscript:@"crv"];
      v15 = objc_msgSend(v12, "psso_base64URLEncodedString");
      [v14 setObject:v15 forKeyedSubscript:@"x"];

      v16 = objc_msgSend(v13, "psso_base64URLEncodedString");
      [v14 setObject:v16 forKeyedSubscript:@"y"];

      [(POMutableJWTHeader *)self setEpk:v14];
    }
    else
    {
      id v17 = __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_105();
    }
  }
  else
  {
    id v11 = __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke();
  }
}

id __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Invalid epk type."];
  v1 = PO_LOG_POJWTHeader();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_100(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error with epk external representation"];

  v3 = PO_LOG_POJWTHeader();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_105()
{
  v0 = +[POError errorWithCode:-1008 description:@"Error with dataRepresentation length for epk."];
  v1 = PO_LOG_POJWTHeader();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

@end