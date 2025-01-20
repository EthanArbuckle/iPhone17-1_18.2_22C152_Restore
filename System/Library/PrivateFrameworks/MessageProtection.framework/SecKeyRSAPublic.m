@interface SecKeyRSAPublic
- (SecKeyRSAPublic)initWithData:(id)a3 error:(id *)a4;
- (SecKeyRSAPublic)initWithSecKeyRef:(id)a3;
- (id)dataRepresentation;
- (id)encryptData:(id)a3 error:(id *)a4;
- (id)secKeyRef;
- (void)setSecKeyRef:(id)a3;
@end

@implementation SecKeyRSAPublic

- (SecKeyRSAPublic)initWithSecKeyRef:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SecKeyRSAPublic;
  v5 = [(SecKeyRSAPublic *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SecKeyRSAPublic *)v5 setSecKeyRef:v4];
  }

  return v6;
}

- (SecKeyRSAPublic)initWithData:(id)a3 error:(id *)a4
{
  v20[3] = *MEMORY[0x263EF8340];
  CFDataRef v6 = (const __CFData *)a3;
  v17.receiver = self;
  v17.super_class = (Class)SecKeyRSAPublic;
  CFErrorRef error = 0;
  v7 = [(SecKeyRSAPublic *)&v17 init];
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x263F16FE0];
    uint64_t v9 = *MEMORY[0x263F16F68];
    v19[0] = *MEMORY[0x263F16FA8];
    v19[1] = v9;
    uint64_t v10 = *MEMORY[0x263F16F80];
    v20[0] = v8;
    v20[1] = v10;
    v19[2] = *MEMORY[0x263F16F98];
    v20[2] = &unk_26C70CD10;
    SecKeyRef v11 = SecKeyCreateWithData(v6, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3], &error);
    id secKeyRef = v7->_secKeyRef;
    v7->_id secKeyRef = v11;
  }
  v13 = [(SecKeyRSAPublic *)v7 secKeyRef];

  if (v13)
  {
    v14 = v7;
  }
  else
  {
    v15 = MessageProtectionLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SecKeyRSAPublic initWithData:error:]((CFTypeRef *)&error);
    }

    v14 = 0;
    if (a4) {
      *a4 = error;
    }
  }

  return v14;
}

- (id)encryptData:(id)a3 error:(id *)a4
{
  CFErrorRef error = 0;
  CFDataRef v6 = (const __CFData *)a3;
  v7 = [(SecKeyRSAPublic *)self secKeyRef];
  CFDataRef v8 = SecKeyCreateEncryptedData(v7, (SecKeyAlgorithm)*MEMORY[0x263F17340], v6, &error);

  if (v8)
  {
    CFDataRef v9 = v8;
  }
  else
  {
    uint64_t v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SecKeyRSAPublic encryptData:error:]((CFTypeRef *)&error);
    }

    if (a4) {
      *a4 = error;
    }
  }

  return v8;
}

- (id)dataRepresentation
{
  v2 = [(SecKeyRSAPublic *)self secKeyRef];
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

- (void)initWithData:(CFTypeRef *)a1 error:.cold.1(CFTypeRef *a1)
{
  v1 = (__CFString *)CFCopyDescription(*a1);
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failed to initialize an RSA Key with error: %@.", v4, v5, v6, v7, 2u);
}

- (void)encryptData:(CFTypeRef *)a1 error:.cold.1(CFTypeRef *a1)
{
  v1 = (__CFString *)CFCopyDescription(*a1);
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failed to encrypt with RSA: %@.", v4, v5, v6, v7, 2u);
}

@end