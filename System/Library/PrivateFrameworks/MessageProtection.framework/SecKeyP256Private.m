@interface SecKeyP256Private
+ (id)compactPrivateKeyWithAccessControl:(id)a3;
+ (id)defaultProtectionClassForPlatform;
+ (id)generate;
+ (id)generateWithAccessControl:(id)a3;
- (NSData)privateKeyBlob;
- (SecKeyP256Private)initWithData:(id)a3 error:(id *)a4;
- (SecKeyP256Public)publicKey;
- (id)getPrivateKeyRefWithError:(id *)a3;
- (id)keyAgreement:(id)a3 error:(id *)a4;
- (id)keyAgreement:(id)a3 error:(id *)a4 isRetry:(BOOL)a5;
- (id)privateKey;
- (id)signData:(id)a3 error:(id *)a4;
- (void)setPublicKey:(id)a3;
@end

@implementation SecKeyP256Private

+ (id)defaultProtectionClassForPlatform
{
  return (id)*MEMORY[0x263F16EA0];
}

+ (id)generate
{
  v3 = [a1 defaultProtectionClassForPlatform];
  v4 = [a1 generateWithAccessControl:v3];

  return v4;
}

+ (id)compactPrivateKeyWithAccessControl:(id)a3
{
  v33[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFErrorRef error = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v30 = v3;
  SecAccessControlRef v5 = SecAccessControlCreateWithFlags(v4, v3, 0x40000000uLL, 0);
  uint64_t v6 = *MEMORY[0x263F16FB8];
  uint64_t v7 = *MEMORY[0x263F16F98];
  v32[0] = *MEMORY[0x263F16FA8];
  v32[1] = v7;
  v33[0] = v6;
  v33[1] = &unk_26C70CDA0;
  uint64_t v8 = *MEMORY[0x263F16E70];
  v32[2] = *MEMORY[0x263F16F50];
  v32[3] = v8;
  v33[2] = MEMORY[0x263EFFA80];
  v33[3] = v5;
  SecAccessControlRef v29 = v5;
  v32[4] = *MEMORY[0x263F170D0];
  v33[4] = *MEMORY[0x263F170D8];
  CFDictionaryRef v9 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
  int v10 = 1000;
  while (1)
  {
    v11 = SecKeyCreateRandomKey(v9, &error);
    if (!v11) {
      break;
    }
    v12 = v11;
    v13 = SecKeyCopyPublicKey(v11);
    if (!v13)
    {
      CFRelease(v12);
      v19 = MessageProtectionLog();
      BOOL v26 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      v23 = v30;
      if (v26) {
        +[SecKeyP256Private compactPrivateKeyWithAccessControl:](v19);
      }
      goto LABEL_19;
    }
    v14 = v13;
    CFDataRef v15 = SecKeyCopyExternalRepresentation(v13, &error);
    CFRelease(v14);
    if (v15)
    {
      uint64_t v16 = MEMORY[0x2166CD500]();
      MEMORY[0x270FA5388](v16);
      v18 = (SecAccessControlRef *)((char *)&v29 - v17);
      [(__CFData *)v15 length];
      v19 = v15;
      [v19 bytes];
      int v20 = ccec_x963_import_pub();
      if (ccec_validate_pub()) {
        BOOL v21 = v20 == 0;
      }
      else {
        BOOL v21 = 0;
      }
      if (v21)
      {
        MEMORY[0x270FA5388](*v18);
        cczp_prime();
        ccn_sub();
        if ((ccn_cmp() & 0x80000000) == 0)
        {
          CFDictionaryRef v27 = SecKeyCopyAttributes(v12);
          v22 = [(__CFDictionary *)v27 objectForKeyedSubscript:*MEMORY[0x263F170F8]];

          CFRelease(v12);
          goto LABEL_21;
        }
      }
      CFRelease(v12);
    }
    else
    {
      CFRelease(v12);
    }
    if (!--v10)
    {
      v22 = 0;
      SecAccessControlRef v24 = v29;
      v23 = v30;
      goto LABEL_23;
    }
  }
  v19 = MessageProtectionLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v23 = v30;
    +[SecKeyP256Private compactPrivateKeyWithAccessControl:v25];
LABEL_19:
    v22 = 0;
    goto LABEL_22;
  }
  v22 = 0;
LABEL_21:
  v23 = v30;
LABEL_22:
  SecAccessControlRef v24 = v29;

LABEL_23:
  return v22;
}

+ (id)generateWithAccessControl:(id)a3
{
  id v3 = [a1 compactPrivateKeyWithAccessControl:a3];
  CFAllocatorRef v4 = [[SecKeyP256Private alloc] initWithData:v3 error:0];

  return v4;
}

- (id)getPrivateKeyRefWithError:(id *)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F170D0];
  v16[0] = *MEMORY[0x263F170D8];
  uint64_t v6 = *MEMORY[0x263F170F8];
  v15[0] = v5;
  v15[1] = v6;
  uint64_t v7 = [(SecKeyP256Private *)self privateKeyBlob];
  v16[1] = v7;
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  CFErrorRef error = 0;
  CFDataRef v9 = [(SecKeyP256Private *)self privateKeyBlob];
  SecKeyRef v10 = SecKeyCreateWithData(v9, v8, &error);

  if (error)
  {
    v11 = (__CFString *)CFErrorCopyDescription(error);
    v12 = [NSString stringWithFormat:@"Deserialization of SecKey failed with description: %@", v11];
    MPLogAndAssignError(3, a3, v12);

    CFRelease(error);
  }

  return v10;
}

- (id)keyAgreement:(id)a3 error:(id *)a4
{
  return [(SecKeyP256Private *)self keyAgreement:a3 error:a4 isRetry:0];
}

- (id)keyAgreement:(id)a3 error:(id *)a4 isRetry:(BOOL)a5
{
  id v7 = a3;
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263F17278];
  if (SecKeyIsAlgorithmSupported((SecKeyRef)self->_privateKey, kSecKeyOperationTypeKeyExchange, (SecKeyAlgorithm)*MEMORY[0x263F17278]))
  {
    CFErrorRef error = 0;
    CFDataRef v9 = [v7 dataRepresentation];
    if (v9)
    {
      SecKeyRef v10 = [[SecKeyP256Public alloc] initWithData:v9 error:a4];
      v11 = v10;
      if (v10)
      {
        privateKey = (__SecKey *)self->_privateKey;
        v13 = [(SecKeyP256Public *)v10 publicKeyRef];
        CFDataRef v14 = SecKeyCopyKeyExchangeResult(privateKey, v8, v13, MEMORY[0x263EFFA78], &error);
        CFDataRef v15 = v14;
        if (v14)
        {
          CFDataRef v15 = v14;
          uint64_t v16 = v15;
        }
        else
        {
          if (a4) {
            *a4 = error;
          }
          else {
            CFRelease(error);
          }
          uint64_t v16 = 0;
        }
      }
      else
      {
        CFDataRef v15 = MessageProtectionLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[SecKeyP256Private keyAgreement:error:isRetry:](a4, v15, v17);
        }
        uint64_t v16 = 0;
      }
    }
    else
    {
      MPLogAndAssignError(7, a4, @"Failed to obtain data for the public key.");
      uint64_t v16 = 0;
    }
  }
  else
  {
    MPLogAndAssignError(3, a4, @"This key is not allowed to do a DH key agreement.");
    uint64_t v16 = 0;
  }

  return v16;
}

- (SecKeyP256Public)publicKey
{
  publicKey = self->_publicKey;
  if (publicKey) {
    goto LABEL_4;
  }
  SecKeyRef v4 = SecKeyCopyPublicKey((SecKeyRef)self->_privateKey);
  if (v4)
  {
    uint64_t v5 = [[SecKeyP256Public alloc] initWithSecKeyRef:v4];
    uint64_t v6 = self->_publicKey;
    self->_publicKey = v5;

    publicKey = self->_publicKey;
LABEL_4:
    id v7 = publicKey;
    goto LABEL_5;
  }
  CFDataRef v9 = MessageProtectionLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[SecKeyP256Private compactPrivateKeyWithAccessControl:](v9);
  }

  id v7 = 0;
LABEL_5:
  return v7;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263F17300];
  if (SecKeyIsAlgorithmSupported((SecKeyRef)self->_privateKey, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x263F17300]))
  {
    CFErrorRef error = 0;
    CFStringRef v8 = [MEMORY[0x263EFF990] dataWithLength:32];
    id v9 = v6;
    SecKeyRef v10 = (const void *)[v9 bytes];
    LODWORD(v9) = [v9 length];
    id v11 = v8;
    CC_SHA256(v10, (CC_LONG)v9, (unsigned __int8 *)[v11 bytes]);
    CFDataRef v12 = SecKeyCreateSignature((SecKeyRef)self->_privateKey, v7, (CFDataRef)v11, &error);
    CFDataRef v13 = v12;
    if (v12)
    {
      CFDataRef v14 = v12;
    }
    else if (a4)
    {
      *a4 = error;
    }
  }
  else
  {
    MPLogAndAssignError(2, a4, @"Attempting to sign with a key that doesn't support that operation.");
    CFDataRef v13 = 0;
  }

  return v13;
}

- (SecKeyP256Private)initWithData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SecKeyP256Private;
  CFStringRef v8 = [(SecKeyP256Private *)&v19 init];
  id v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if (!v7)
  {
    MPLogAndAssignError(1, a4, @"Attempting to initialize a key with missing OID data.");
LABEL_15:
    uint64_t v16 = 0;
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v8->_privateKeyBlob, a3);
  uint64_t v10 = [(SecKeyP256Private *)v9 getPrivateKeyRefWithError:a4];
  id privateKey = v9->_privateKey;
  v9->_id privateKey = (id)v10;

  if (!v9->_privateKey)
  {
    CFDataRef v12 = MessageProtectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SecKeyP256Private initWithData:error:](a4, v12);
    }
    goto LABEL_14;
  }
  CFDataRef v12 = [@"Key Validation String" dataUsingEncoding:4];
  CFDataRef v13 = [(SecKeyP256Private *)v9 signData:v12 error:a4];
  if (!v13)
  {
    uint64_t v17 = @"Failed to test sign with SecKeyP256 during initialization.";
LABEL_13:
    MPLogAndAssignError(407, a4, v17);

LABEL_14:
    goto LABEL_15;
  }
  CFDataRef v14 = [(SecKeyP256Private *)v9 publicKey];
  int v15 = [v14 verifySignature:v13 data:v12];

  if (!v15)
  {
    uint64_t v17 = @"Failed to verify signature with SecKeyP256 during initialization.";
    goto LABEL_13;
  }

LABEL_7:
  uint64_t v16 = v9;
LABEL_16:

  return v16;
}

- (id)privateKey
{
  return self->_privateKey;
}

- (NSData)privateKeyBlob
{
  return self->_privateKeyBlob;
}

- (void)setPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_privateKeyBlob, 0);
  objc_storeStrong(&self->_privateKey, 0);
}

+ (void)compactPrivateKeyWithAccessControl:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_2163F2000, a2, a3, "Failed to generate a P-256 Key with access control %@.", (uint8_t *)&v3);
}

+ (void)compactPrivateKeyWithAccessControl:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "Failed to establish public DH Key.", v1, 2u);
}

- (void)keyAgreement:(id *)a1 error:(NSObject *)a2 isRetry:(uint64_t)a3 .cold.1(id *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v5 = [*a1 description];
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v6 = 138412290;
  id v7 = v5;
  OUTLINED_FUNCTION_0_3(&dword_2163F2000, a2, a3, "Failed to initialize the public key with error: %@", (uint8_t *)&v6);
  if (a1) {
}
  }

- (void)initWithData:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = [*a1 description];
  int v5 = 138412290;
  int v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_2163F2000, a2, v4, "Failed to get a Private Key Ref with error while initializing SecKeyP256: %@", (uint8_t *)&v5);
}

@end