@interface CoreCryptoP256Private
+ (id)generate;
+ (void)generate;
- (CoreCryptoP256Private)initWithData:(id)a3 error:(id *)a4;
- (CoreCryptoP256Private)initWithKey:(ccec_full_ctx *)a3;
- (ccec_full_ctx)full_key;
- (id)keyAgreement:(id)a3 error:(id *)a4;
- (id)keychainData;
- (id)publicKey;
- (id)signData:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)keychainData;
- (void)setFull_key:(ccec_full_ctx *)a3;
@end

@implementation CoreCryptoP256Private

- (CoreCryptoP256Private)initWithKey:(ccec_full_ctx *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreCryptoP256Private;
  result = [(CoreCryptoP256Private *)&v5 init];
  if (result) {
    result->_full_key = a3;
  }
  return result;
}

+ (id)generate
{
  v3 = (void *)MEMORY[0x2166CD500](a1, a2);
  v4 = malloc_type_malloc((32 * *v3) | 0x10, 0x1B4A19E0uLL);
  ccrng();
  int key = ccec_compact_generate_key();
  if (key)
  {
    int v7 = key;
    v8 = MessageProtectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CoreCryptoP256Private generate];
    }

    free(v4);
    v6 = 0;
  }
  else
  {
    v6 = (void *)[objc_alloc((Class)a1) initWithKey:v4];
  }
  return v6;
}

- (id)keyAgreement:(id)a3 error:(id *)a4
{
  objc_super v5 = [a3 dataRepresentation];
  if (!v5)
  {
    MPLogAndAssignError(7, a4, @"Failed to obtain data for the public key.");
    id v6 = 0;
    goto LABEL_12;
  }
  MEMORY[0x2166CD500]();
  MEMORY[0x270FA5388]();
  [v5 length];
  [v5 bytes];
  if (ccec_compact_import_pub())
  {
    MPLogAndAssignError(7, a4, @"Failed to initialize compact corecrypto public key.");
    id v6 = 0;
    goto LABEL_12;
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:32];
  if (!ccrng())
  {
    v9 = @"Failed to initialize masking rng for corecrypto key agreement.";
    uint64_t v10 = 7;
LABEL_10:
    MPLogAndAssignError(v10, a4, v9);
    id v6 = 0;
    goto LABEL_11;
  }
  id v8 = v7;
  [v8 mutableBytes];
  if (ccecdh_compute_shared_secret())
  {
    v9 = @"Failure to compute a shared secret with corecrypto.";
    uint64_t v10 = 405;
    goto LABEL_10;
  }
  id v6 = v8;
LABEL_11:

LABEL_12:
  return v6;
}

- (id)publicKey
{
  id v2 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:(unint64_t)(cczp_bitlen() + 7) >> 3];
  [v2 mutableBytes];
  ccec_compact_export_pub();
  uint64_t v5 = 0;
  v3 = [[SecKeyP256Public alloc] initWithData:v2 error:&v5];

  return v3;
}

- (void)dealloc
{
  full_int key = self->_full_key;
  if (full_key) {
    free(full_key);
  }
  v4.receiver = self;
  v4.super_class = (Class)CoreCryptoP256Private;
  [(CoreCryptoP256Private *)&v4 dealloc];
}

- (id)keychainData
{
  id v2 = MessageProtectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    [(CoreCryptoP256Private *)v2 keychainData];
  }

  id v10 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  return v10;
}

- (id)signData:(id)a3 error:(id *)a4
{
  uint64_t v4 = MessageProtectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[CoreCryptoP256Private signData:error:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return 0;
}

- (CoreCryptoP256Private)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v5 = MessageProtectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[CoreCryptoP256Private initWithData:error:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  return 0;
}

- (ccec_full_ctx)full_key
{
  return self->_full_key;
}

- (void)setFull_key:(ccec_full_ctx *)a3
{
  self->_full_int key = a3;
}

+ (void)generate
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2163F2000, a2, OS_LOG_TYPE_ERROR, "Failed to generate an ephemeral ECDH key error code: %i", (uint8_t *)v2, 8u);
}

- (void)keychainData
{
}

- (void)signData:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithData:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end