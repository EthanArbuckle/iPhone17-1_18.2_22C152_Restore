@interface SecKeyRSAPrivate
- (SecKeyRSAPrivate)init;
- (SecKeyRSAPrivate)initWithData:(id)a3 error:(id *)a4;
- (id)dataRepresentation;
- (id)decryptData:(id)a3 error:(id *)a4;
- (id)publicKey;
- (id)secKeyRef;
- (void)init;
- (void)setSecKeyRef:(id)a3;
@end

@implementation SecKeyRSAPrivate

- (SecKeyRSAPrivate)init
{
  v20[4] = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  uint64_t v3 = *MEMORY[0x263F16FE0];
  uint64_t v4 = *MEMORY[0x263F16F98];
  v19[0] = *MEMORY[0x263F16FA8];
  v19[1] = v4;
  v20[0] = v3;
  v20[1] = &unk_26C70CDB8;
  uint64_t v5 = *MEMORY[0x263F16F50];
  v20[2] = MEMORY[0x263EFFA80];
  uint64_t v6 = *MEMORY[0x263F174B8];
  v19[2] = v5;
  v19[3] = v6;
  uint64_t v17 = v5;
  uint64_t v18 = MEMORY[0x263EFFA80];
  v7 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20[3] = v7;
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  SecKeyRef v9 = SecKeyCreateRandomKey(v8, &error);
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)SecKeyRSAPrivate;
    v10 = [(SecKeyRSAPrivate *)&v15 init];
    v11 = v10;
    if (v10) {
      objc_storeStrong(&v10->_secKeyRef, v9);
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v13 = MessageProtectionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SecKeyRSAPrivate init]((CFTypeRef *)&error);
    }

    v12 = 0;
  }

  return v12;
}

- (SecKeyRSAPrivate)initWithData:(id)a3 error:(id *)a4
{
  v17[3] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)SecKeyRSAPrivate;
  CFErrorRef error = 0;
  CFDataRef v4 = (const __CFData *)a3;
  uint64_t v5 = [(SecKeyRSAPrivate *)&v14 init];
  uint64_t v6 = *MEMORY[0x263F16FE0];
  uint64_t v7 = *MEMORY[0x263F16F68];
  v16[0] = *MEMORY[0x263F16FA8];
  v16[1] = v7;
  uint64_t v8 = *MEMORY[0x263F16F70];
  v17[0] = v6;
  v17[1] = v8;
  v16[2] = *MEMORY[0x263F16F98];
  v17[2] = &unk_26C70CDB8;
  SecKeyRef v9 = SecKeyCreateWithData(v4, (CFDictionaryRef)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3, v14.receiver, v14.super_class, error), &error);

  [(SecKeyRSAPrivate *)v5 setSecKeyRef:v9];
  v10 = [(SecKeyRSAPrivate *)v5 secKeyRef];

  if (v10)
  {
    v11 = v5;
  }
  else
  {
    v12 = MessageProtectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SecKeyRSAPublic initWithData:error:]((CFTypeRef *)&error);
    }

    v11 = 0;
  }

  return v11;
}

- (id)publicKey
{
  uint64_t v3 = [SecKeyRSAPublic alloc];
  CFDataRef v4 = [(SecKeyRSAPrivate *)self secKeyRef];
  SecKeyRef v5 = SecKeyCopyPublicKey(v4);
  uint64_t v6 = [(SecKeyRSAPublic *)v3 initWithSecKeyRef:v5];

  return v6;
}

- (id)decryptData:(id)a3 error:(id *)a4
{
  CFErrorRef error = 0;
  CFDataRef v6 = (const __CFData *)a3;
  uint64_t v7 = [(SecKeyRSAPrivate *)self secKeyRef];
  CFDataRef v8 = SecKeyCreateDecryptedData(v7, (SecKeyAlgorithm)*MEMORY[0x263F17340], v6, &error);

  if (v8)
  {
    CFDataRef v9 = v8;
  }
  else
  {
    v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SecKeyRSAPrivate decryptData:error:]((CFTypeRef *)&error);
    }

    if (a4) {
      *a4 = error;
    }
  }

  return v8;
}

- (id)dataRepresentation
{
  v2 = [(SecKeyRSAPrivate *)self secKeyRef];
  CFDataRef v3 = SecKeyCopyExternalRepresentation(v2, 0);

  return v3;
}

- (id)secKeyRef
{
  return self->_secKeyRef;
}

- (void)setSecKeyRef:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  v1 = (__CFString *)CFCopyDescription(*a1);
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failed to generate an RSA Key with error: %@.", v4, v5, v6, v7, 2u);
}

- (void)decryptData:(CFTypeRef *)a1 error:.cold.1(CFTypeRef *a1)
{
  v1 = (__CFString *)CFCopyDescription(*a1);
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failed to decrypt with RSA: %@.", v4, v5, v6, v7, 2u);
}

@end