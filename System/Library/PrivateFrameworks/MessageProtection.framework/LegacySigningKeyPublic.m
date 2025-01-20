@interface LegacySigningKeyPublic
- (BOOL)verifySignature:(id)a3 ofData:(id)a4;
- (LegacySigningKeyPublic)initWithData:(id)a3 error:(id *)a4;
- (id)dataRepresentation;
- (id)secKeyRef;
- (void)setSecKeyRef:(id)a3;
@end

@implementation LegacySigningKeyPublic

- (LegacySigningKeyPublic)initWithData:(id)a3 error:(id *)a4
{
  v21[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F16FB8];
  uint64_t v7 = *MEMORY[0x263F16F68];
  v20[0] = *MEMORY[0x263F16FA8];
  v20[1] = v7;
  uint64_t v8 = *MEMORY[0x263F16F80];
  v21[0] = v6;
  v21[1] = v8;
  uint64_t v9 = *MEMORY[0x263F16F50];
  v20[2] = *MEMORY[0x263F16F98];
  v20[3] = v9;
  v21[2] = &unk_26C70CD58;
  v21[3] = MEMORY[0x263EFFA80];
  v10 = NSDictionary;
  CFDataRef v11 = (const __CFData *)a3;
  CFDictionaryRef v12 = [v10 dictionaryWithObjects:v21 forKeys:v20 count:4];
  id v19 = 0;
  SecKeyRef v13 = SecKeyCreateWithData(v11, v12, (CFErrorRef *)&v19);

  if (v13)
  {
    v14 = [(LegacySigningKeyPublic *)self init];
    id secKeyRef = v14->_secKeyRef;
    v14->_id secKeyRef = v13;

    self = v14;
    v16 = self;
  }
  else
  {
    v17 = MessageProtectionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[LegacySigningKeyPublic initWithData:error:]((CFTypeRef *)&v19, v17);
    }

    v16 = 0;
    if (a4) {
      *a4 = v19;
    }
  }

  return v16;
}

- (id)dataRepresentation
{
  CFDataRef v2 = SecKeyCopyExternalRepresentation((SecKeyRef)self->_secKeyRef, 0);
  return v2;
}

- (BOOL)verifySignature:(id)a3 ofData:(id)a4
{
  return SecKeyVerifySignature((SecKeyRef)self->_secKeyRef, (SecKeyAlgorithm)*MEMORY[0x263F172D8], (CFDataRef)a4, (CFDataRef)a3, 0) == 1;
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

- (void)initWithData:(CFTypeRef *)a1 error:(NSObject *)a2 .cold.1(CFTypeRef *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)CFCopyDescription(*a1);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2163F2000, a2, OS_LOG_TYPE_ERROR, "Failed to initialize a legacy ECDSA key with error: %@.", (uint8_t *)&v4, 0xCu);
}

@end