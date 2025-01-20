@interface SecKeyP256Public
- (BOOL)verifySignature:(id)a3 data:(id)a4;
- (NSData)serializedKey;
- (SecKeyP256Public)initWithData:(id)a3 error:(id *)a4;
- (SecKeyP256Public)initWithSecKeyRef:(__SecKey *)a3;
- (__SecKey)publicKeyRef;
- (id)dataRepresentation;
- (void)dataRepresentation;
- (void)dealloc;
- (void)setPublicKeyRef:(__SecKey *)a3;
- (void)setSerializedKey:(id)a3;
@end

@implementation SecKeyP256Public

- (SecKeyP256Public)initWithSecKeyRef:(__SecKey *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SecKeyP256Public;
  v4 = [(SecKeyP256Public *)&v7 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  if (a3)
  {
    v4->_publicKeyRef = a3;
LABEL_4:
    a3 = v4;
  }

  return (SecKeyP256Public *)a3;
}

- (id)dataRepresentation
{
  error[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  serializedKey = self->_serializedKey;
  if (serializedKey)
  {
    v3 = serializedKey;
  }
  else
  {
    error[0] = 0;
    CFDataRef v5 = SecKeyCopyExternalRepresentation([(SecKeyP256Public *)self publicKeyRef], error);
    if (v5)
    {
      uint64_t v6 = MEMORY[0x2166CD500]();
      MEMORY[0x270FA5388](v6);
      [(__CFData *)v5 length];
      [(__CFData *)v5 bytes];
      int v7 = ccec_x963_import_pub();
      if (v7)
      {
        int v8 = v7;
        v9 = MessageProtectionLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(SecKeyP256Public *)v8 dataRepresentation];
        }
        v3 = 0;
      }
      else
      {
        v12 = (NSData *) (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:(unint64_t)(cczp_bitlen() + 7) >> 3];
        [(NSData *)v12 bytes];
        ccec_compact_export_pub();
        v13 = self->_serializedKey;
        self->_serializedKey = v12;
        v9 = v12;

        v3 = self->_serializedKey;
      }
    }
    else
    {
      v10 = MessageProtectionLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(SecKeyP256Public *)(CFTypeRef *)error dataRepresentation];
      }

      if (error[0]) {
        CFRelease(error[0]);
      }
      v3 = 0;
    }
  }
  return v3;
}

- (SecKeyP256Public)initWithData:(id)a3 error:(id *)a4
{
  v22[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = MEMORY[0x2166CD500]();
  MEMORY[0x270FA5388](v7);
  [v6 length];
  id v8 = v6;
  [v8 bytes];
  if (ccec_compact_import_pub())
  {
    v9 = NSString;
    id v10 = [v8 description];
    uint64_t v11 = [v9 stringWithFormat:@"Incorrect data for public key: %@", v10];
    MPLogAndAssignError(7, a4, v11);
  }
  else
  {
    id v10 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:((unint64_t)(cczp_bitlen() + 7) >> 2) | 1];
    [v10 bytes];
    ccec_export_pub();
    uint64_t v12 = *MEMORY[0x263F16FB8];
    uint64_t v13 = *MEMORY[0x263F16F68];
    v21[0] = *MEMORY[0x263F16FA8];
    v21[1] = v13;
    uint64_t v14 = *MEMORY[0x263F16F80];
    v22[0] = v12;
    v22[1] = v14;
    uint64_t v15 = *MEMORY[0x263F16F50];
    v21[2] = *MEMORY[0x263F16F98];
    v21[3] = v15;
    v22[2] = &unk_26C70CDA0;
    v22[3] = MEMORY[0x263EFFA80];
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    CFErrorRef error = 0;
    SecKeyRef v16 = SecKeyCreateWithData((CFDataRef)v10, (CFDictionaryRef)v11, &error);
    v17 = [(SecKeyP256Public *)self init];
    self = v17;
    if (v16)
    {
      v17->_publicKeyRef = v16;
      a4 = v17;
      goto LABEL_6;
    }
    if (!a4) {
      goto LABEL_6;
    }
    *a4 = error;
    v19 = MessageProtectionLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SecKeyP256Public initWithData:error:]((uint64_t *)a4, (uint64_t)v8, v19);
    }
  }
  a4 = 0;
LABEL_6:

  return (SecKeyP256Public *)a4;
}

- (BOOL)verifySignature:(id)a3 data:(id)a4
{
  CFErrorRef error = 0;
  id v6 = (void *)MEMORY[0x263EFF990];
  id v7 = a4;
  CFDataRef v8 = (const __CFData *)a3;
  v9 = [v6 dataWithLength:32];
  id v10 = v7;
  uint64_t v11 = (const void *)[v10 bytes];
  CC_LONG v12 = [v10 length];

  id v13 = v9;
  CC_SHA256(v11, v12, (unsigned __int8 *)[v13 bytes]);
  uint64_t v14 = [(SecKeyP256Public *)self publicKeyRef];
  int v15 = SecKeyVerifySignature(v14, (SecKeyAlgorithm)*MEMORY[0x263F17300], (CFDataRef)v13, v8, &error);

  if (error)
  {
    SecKeyRef v16 = (__CFString *)CFErrorCopyDescription(error);
    v17 = MessageProtectionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SecKeyP256Public verifySignature:data:]((uint64_t)v16, v17, v18);
    }

    CFRelease(error);
    BOOL v19 = 0;
  }
  else
  {
    BOOL v19 = v15 != 0;
  }

  return v19;
}

- (void)dealloc
{
  publicKeyRef = self->_publicKeyRef;
  if (publicKeyRef) {
    CFRelease(publicKeyRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)SecKeyP256Public;
  [(SecKeyP256Public *)&v4 dealloc];
}

- (__SecKey)publicKeyRef
{
  return self->_publicKeyRef;
}

- (void)setPublicKeyRef:(__SecKey *)a3
{
  self->_publicKeyRef = a3;
}

- (NSData)serializedKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSerializedKey:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)dataRepresentation
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2163F2000, a2, OS_LOG_TYPE_ERROR, "Failed to import key from SecKeyCopyExternalRepresentation into ccec: %i", (uint8_t *)v2, 8u);
}

- (void)initWithData:(os_log_t)log error:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "Failed to initialize public key from data with error: %@ for data: %@.", (uint8_t *)&v4, 0x16u);
}

- (void)verifySignature:(uint64_t)a3 data:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_2163F2000, a2, a3, "Failed verifying P-256 signature: %@", (uint8_t *)&v3);
}

@end