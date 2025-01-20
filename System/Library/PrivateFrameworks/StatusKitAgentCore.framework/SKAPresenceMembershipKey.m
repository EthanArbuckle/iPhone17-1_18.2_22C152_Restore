@interface SKAPresenceMembershipKey
+ (id)logger;
- (BOOL)_generateKey;
- (BOOL)_generateKeyFromKeyData:(id)a3;
- (NSData)privateKeyMaterial;
- (NSData)publicKeyMaterial;
- (SKAPresenceMembershipKey)initWithNewKeyMaterial;
- (SKAPresenceMembershipKey)initWithPrivateKeyMaterial:(id)a3;
- (__SecKey)privateKey;
- (id)signPayload:(id)a3;
- (void)_generateKey;
- (void)dealloc;
- (void)privateKeyMaterial;
- (void)publicKeyMaterial;
- (void)setPrivateKey:(__SecKey *)a3;
@end

@implementation SKAPresenceMembershipKey

- (SKAPresenceMembershipKey)initWithNewKeyMaterial
{
  v6.receiver = self;
  v6.super_class = (Class)SKAPresenceMembershipKey;
  v2 = [(SKAPresenceMembershipKey *)&v6 init];
  v3 = v2;
  if (v2 && ![(SKAPresenceMembershipKey *)v2 _generateKey]) {
    v4 = 0;
  }
  else {
    v4 = v3;
  }

  return v4;
}

- (SKAPresenceMembershipKey)initWithPrivateKeyMaterial:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKAPresenceMembershipKey;
  v5 = [(SKAPresenceMembershipKey *)&v9 init];
  if (!v5) {
    goto LABEL_5;
  }
  if (![v4 length] || objc_msgSend(v4, "length") != 97)
  {
    v7 = +[SKAPresenceMembershipKey logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceMembershipKey initWithPrivateKeyMaterial:](v7);
    }

    goto LABEL_9;
  }
  if (![(SKAPresenceMembershipKey *)v5 _generateKeyFromKeyData:v4])
  {
LABEL_9:
    objc_super v6 = 0;
    goto LABEL_10;
  }
LABEL_5:
  objc_super v6 = v5;
LABEL_10:

  return v6;
}

- (void)dealloc
{
  if ([(SKAPresenceMembershipKey *)self privateKey]) {
    CFRelease([(SKAPresenceMembershipKey *)self privateKey]);
  }
  v3.receiver = self;
  v3.super_class = (Class)SKAPresenceMembershipKey;
  [(SKAPresenceMembershipKey *)&v3 dealloc];
}

- (id)signPayload:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  if ([(SKAPresenceMembershipKey *)self privateKey])
  {
    CFErrorRef error = 0;
    v5 = [(SKAPresenceMembershipKey *)self privateKey];
    CFDataRef v6 = SecKeyCreateSignature(v5, (SecKeyAlgorithm)*MEMORY[0x263F172E8], v4, &error);
    if (v6)
    {
      __int16 v10 = 769;
      v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&v10 length:2];
      [v7 appendData:v6];
    }
    else
    {
      v8 = +[SKAPresenceMembershipKey logger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceMembershipKey signPayload:]();
      }

      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSData)publicKeyMaterial
{
  if ([(SKAPresenceMembershipKey *)self privateKey])
  {
    objc_super v3 = SecKeyCopyPublicKey([(SKAPresenceMembershipKey *)self privateKey]);
    CFErrorRef error = 0;
    CFDataRef v4 = SecKeyCopyExternalRepresentation(v3, &error);
    if (v3) {
      CFRelease(v3);
    }
    if (v4)
    {
      CFDataRef v5 = v4;
    }
    else
    {
      CFDataRef v6 = +[SKAPresenceMembershipKey logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceMembershipKey publicKeyMaterial]();
      }
    }
  }
  else
  {
    CFDataRef v4 = 0;
  }
  return (NSData *)v4;
}

- (NSData)privateKeyMaterial
{
  if ([(SKAPresenceMembershipKey *)self privateKey])
  {
    CFErrorRef error = 0;
    CFDataRef v3 = SecKeyCopyExternalRepresentation([(SKAPresenceMembershipKey *)self privateKey], &error);
    CFDataRef v4 = v3;
    if (v3)
    {
      CFDataRef v5 = v3;
    }
    else
    {
      CFDataRef v6 = +[SKAPresenceMembershipKey logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceMembershipKey privateKeyMaterial]();
      }
    }
  }
  else
  {
    CFDataRef v4 = 0;
  }
  return (NSData *)v4;
}

- (BOOL)_generateKey
{
  v10[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F16F98];
  v9[0] = *MEMORY[0x263F16FA8];
  v9[1] = v3;
  v10[0] = *MEMORY[0x263F16FB8];
  v10[1] = &unk_26D7BA118;
  v9[2] = *MEMORY[0x263F17580];
  v10[2] = MEMORY[0x263EFFA88];
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  CFErrorRef v8 = 0;
  SecKeyRef v5 = SecKeyCreateRandomKey(v4, &v8);
  if (v5)
  {
    if ([(SKAPresenceMembershipKey *)self privateKey]) {
      CFRelease([(SKAPresenceMembershipKey *)self privateKey]);
    }
    [(SKAPresenceMembershipKey *)self setPrivateKey:v5];
  }
  else
  {
    CFDataRef v6 = +[SKAPresenceMembershipKey logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceMembershipKey _generateKey]();
    }
  }
  return v5 != 0;
}

- (BOOL)_generateKeyFromKeyData:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F16FB8];
  uint64_t v5 = *MEMORY[0x263F16F98];
  v15[0] = *MEMORY[0x263F16FA8];
  v15[1] = v5;
  v16[0] = v4;
  v16[1] = &unk_26D7BA118;
  uint64_t v6 = *MEMORY[0x263F16F70];
  uint64_t v7 = *MEMORY[0x263F16F50];
  v15[2] = *MEMORY[0x263F16F68];
  v15[3] = v7;
  v16[2] = v6;
  v16[3] = MEMORY[0x263EFFA88];
  CFErrorRef v8 = NSDictionary;
  CFDataRef v9 = (const __CFData *)a3;
  CFDictionaryRef v10 = [v8 dictionaryWithObjects:v16 forKeys:v15 count:4];
  CFErrorRef v14 = 0;
  SecKeyRef v11 = SecKeyCreateWithData(v9, v10, &v14);

  if (v11)
  {
    if ([(SKAPresenceMembershipKey *)self privateKey]) {
      CFRelease([(SKAPresenceMembershipKey *)self privateKey]);
    }
    [(SKAPresenceMembershipKey *)self setPrivateKey:v11];
  }
  else
  {
    v12 = +[SKAPresenceMembershipKey logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceMembershipKey _generateKeyFromKeyData:]();
    }
  }
  return v11 != 0;
}

+ (id)logger
{
  if (logger_onceToken_7 != -1) {
    dispatch_once(&logger_onceToken_7, &__block_literal_global_7);
  }
  v2 = (void *)logger__logger_7;
  return v2;
}

uint64_t __34__SKAPresenceMembershipKey_logger__block_invoke()
{
  logger__logger_7 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAPresenceMembershipKey");
  return MEMORY[0x270F9A758]();
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (void)initWithPrivateKeyMaterial:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22480C000, log, OS_LOG_TYPE_ERROR, "Private key material nil or incorrect length", v1, 2u);
}

- (void)signPayload:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Signing completed with error: %@", v2, v3, v4, v5, v6);
}

- (void)publicKeyMaterial
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Public key externalization completed with error: %@", v2, v3, v4, v5, v6);
}

- (void)privateKeyMaterial
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Private key externalization completed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_generateKey
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Membership key generation completed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_generateKeyFromKeyData:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Membership key generation from data completed with error: %@", v2, v3, v4, v5, v6);
}

@end