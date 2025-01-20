@interface SPAKE2Common
- (BOOL)generateStateWithError:(id *)a3;
- (BOOL)processMsg1:(id)a3 error:(id *)a4;
- (BOOL)processMsg2:(id)a3 error:(id *)a4;
- (BOOL)setupProver:(id *)a3;
- (BOOL)setupVerifier:(id *)a3;
- (BOOL)verified;
- (NSData)salt;
- (NSData)w0;
- (NSData)w1;
- (NSString)code;
- (SPAKE2Common)initWithSalt:(id)a3 code:(id)a4;
- (_SFAESKey)session_key;
- (ccrng_state)rng;
- (ccspake_cp)cp;
- (ccspake_ctx)spake_ctx;
- (ccspake_mac)mac;
- (id)decryptMessage:(id)a3 error:(id *)a4;
- (id)encryptMessage:(id)a3 error:(id *)a4;
- (id)getMsg1WithError:(id *)a3;
- (id)getMsg2WithError:(id *)a3;
- (unint64_t)point_size;
- (unint64_t)w_size;
- (void)dealloc;
- (void)setCode:(id)a3;
- (void)setCp:(ccspake_cp *)a3;
- (void)setMac:(ccspake_mac *)a3;
- (void)setPoint_size:(unint64_t)a3;
- (void)setRng:(ccrng_state *)a3;
- (void)setSalt:(id)a3;
- (void)setSession_key:(id)a3;
- (void)setSpake_ctx:(ccspake_ctx *)a3;
- (void)setVerified:(BOOL)a3;
- (void)setW0:(id)a3;
- (void)setW1:(id)a3;
- (void)setW_size:(unint64_t)a3;
@end

@implementation SPAKE2Common

- (SPAKE2Common)initWithSalt:(id)a3 code:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPAKE2Common;
  v8 = [(SPAKE2Common *)&v11 init];
  if (v8)
  {
    [(SPAKE2Common *)v8 setRng:ccrng()];
    [(SPAKE2Common *)v8 setCp:ccspake_cp_256()];
    [(SPAKE2Common *)v8 setMac:ccspake_mac_hkdf_hmac_sha256()];
    [(SPAKE2Common *)v8 cp];
    size_t v9 = ccspake_sizeof_ctx();
    [(SPAKE2Common *)v8 setSpake_ctx:malloc_type_malloc(v9, 0x131C905FuLL)];
    [(SPAKE2Common *)v8 setSalt:v6];
    [(SPAKE2Common *)v8 setCode:v7];
    [(SPAKE2Common *)v8 cp];
    [(SPAKE2Common *)v8 setW_size:ccspake_sizeof_w()];
    [(SPAKE2Common *)v8 cp];
    [(SPAKE2Common *)v8 setPoint_size:ccspake_sizeof_point()];
  }

  return v8;
}

- (BOOL)generateStateWithError:(id *)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(SPAKE2Common *)self code];
  id v6 = (const char *)[v5 UTF8String];

  id v7 = (char *)&v21 - ((2 * [(SPAKE2Common *)self w_size] + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v8 = ccscrypt_storage_size();
  if ((v8 & 0x8000000000000000) != 0)
  {
    if (a3)
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25[0] = @"sscrypt_storage_size params failed";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      [v18 errorWithDomain:@"SFCoreCryptoErrorDomain" code:-1 userInfo:v15];
      BOOL v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    size_t v9 = malloc_type_malloc(v8, 0xC03096DAuLL);
    strlen(v6);
    v10 = [(SPAKE2Common *)self salt];
    [v10 length];
    id v11 = [(SPAKE2Common *)self salt];
    [v11 bytes];
    uint64_t v12 = ccscrypt();

    free(v9);
    if (!v12)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v7, -[SPAKE2Common w_size](self, "w_size"));
      [(SPAKE2Common *)self setW0:v19];

      v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v7[-[SPAKE2Common w_size](self, "w_size")], -[SPAKE2Common w_size](self, "w_size"));
      [(SPAKE2Common *)self setW1:v15];
      BOOL v17 = 1;
      goto LABEL_9;
    }
    if (a3)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = (int)v12;
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"ccscrypt failed: %d", v12);
      v23 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      *a3 = [v13 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v14 userInfo:v16];

      BOOL v17 = 0;
LABEL_9:

      return v17;
    }
  }
  return 0;
}

- (BOOL)setupProver:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  [(SPAKE2Common *)self spake_ctx];
  [(SPAKE2Common *)self cp];
  [(SPAKE2Common *)self mac];
  [(SPAKE2Common *)self rng];
  [(SPAKE2Common *)self w_size];
  id v5 = [(SPAKE2Common *)self w0];
  [v5 bytes];
  id v6 = [(SPAKE2Common *)self w1];
  [v6 bytes];
  uint64_t v7 = ccspake_prover_init();

  if (a3 && v7)
  {
    size_t v8 = (void *)MEMORY[0x1E4F28C58];
    size_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"ccspake_prover_init failed: %d", v7, *MEMORY[0x1E4F28568]);
    v13[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v8 errorWithDomain:@"SFCoreCryptoErrorDomain" code:(int)v7 userInfo:v10];
  }
  return v7 == 0;
}

- (BOOL)setupVerifier:(id *)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  [(SPAKE2Common *)self point_size];
  [(SPAKE2Common *)self cp];
  [(SPAKE2Common *)self w_size];
  id v5 = [(SPAKE2Common *)self w1];
  [v5 bytes];
  [(SPAKE2Common *)self point_size];
  [(SPAKE2Common *)self rng];
  uint64_t L = ccspake_generate_L();

  if (L)
  {
    if (a3)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      size_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"ccspake_generate_L failed: %d", L);
      v20[0] = v8;
      size_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      v10 = v7;
      uint64_t v11 = (int)L;
LABEL_7:
      *a3 = [v10 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v11 userInfo:v9];
    }
  }
  else
  {
    [(SPAKE2Common *)self spake_ctx];
    [(SPAKE2Common *)self cp];
    [(SPAKE2Common *)self mac];
    [(SPAKE2Common *)self rng];
    [(SPAKE2Common *)self w_size];
    id v12 = [(SPAKE2Common *)self w0];
    [v12 bytes];
    [(SPAKE2Common *)self point_size];
    uint64_t v13 = ccspake_verifier_init();

    if (!v13) {
      return 1;
    }
    if (a3)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = (int)v13;
      uint64_t v17 = *MEMORY[0x1E4F28568];
      size_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"ccspake_verifier_init failed: %d", v13);
      v18 = v8;
      size_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v10 = v14;
      uint64_t v11 = v15;
      goto LABEL_7;
    }
  }
  return 0;
}

- (void)dealloc
{
  free([(SPAKE2Common *)self spake_ctx]);
  v3.receiver = self;
  v3.super_class = (Class)SPAKE2Common;
  [(SPAKE2Common *)&v3 dealloc];
}

- (id)getMsg1WithError:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = (char *)&v13 - (([(SPAKE2Common *)self point_size] + 15) & 0xFFFFFFFFFFFFFFF0);
  [(SPAKE2Common *)self spake_ctx];
  [(SPAKE2Common *)self point_size];
  uint64_t v6 = ccspake_kex_generate();
  if (v6)
  {
    if (a3)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = (int)v6;
      uint64_t v14 = *MEMORY[0x1E4F28568];
      size_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"ccspake_kex_generate failed: %d", v6);
      v15[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      *a3 = [v7 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v8 userInfo:v10];
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v5, -[SPAKE2Common point_size](self, "point_size"));
  }
  return v11;
}

- (BOOL)processMsg1:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SPAKE2Common *)self spake_ctx];
  [v6 length];
  id v7 = v6;
  [v7 bytes];

  uint64_t v8 = ccspake_kex_process();
  int v9 = v8;
  if (a4 && v8)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"ccspake_kex_process failed: %d", v8, *MEMORY[0x1E4F28568]);
    v15[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = [v10 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v9 userInfo:v12];
  }
  return v9 == 0;
}

- (id)getMsg2WithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SPAKE2Common *)self spake_ctx];
  uint64_t v4 = ccspake_mac_compute();
  if (v4)
  {
    if (a3)
    {
      id v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = (int)v4;
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"ccspake_mac_generate failed: %d", v4, *MEMORY[0x1E4F28568]);
      id v12 = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      *a3 = [v5 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v6 userInfo:v8];
    }
    int v9 = 0;
  }
  else
  {
    int v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:32];
  }
  return v9;
}

- (BOOL)processMsg2:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SPAKE2Common *)self spake_ctx];
  [v6 length];
  id v7 = v6;
  [v7 bytes];

  uint64_t session_key = ccspake_mac_verify_and_get_session_key();
  if (!session_key)
  {
    uint64_t v11 = [[_SFAESKeySpecifier alloc] initWithBitSize:0];
    uint64_t v13 = [_SFAESKey alloc];
    uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v19 length:16];
    a4 = [(_SFSymmetricKey *)v13 initWithData:v14 specifier:v11 error:a4];
    [(SPAKE2Common *)self setSession_key:a4];

    uint64_t v15 = [(SPAKE2Common *)self session_key];
    LOBYTE(a4) = v15 != 0;

    if (v15)
    {
      LOBYTE(a4) = 1;
      [(SPAKE2Common *)self setVerified:1];
    }
    goto LABEL_6;
  }
  if (a4)
  {
    int v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = (int)session_key;
    objc_msgSend(NSString, "stringWithFormat:", @"ccspake_mac_verify_and_get_session_key failed: %d", session_key, *MEMORY[0x1E4F28568]);
    uint64_t v11 = (_SFAESKeySpecifier *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    *a4 = [v9 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v10 userInfo:v12];

    LOBYTE(a4) = 0;
LABEL_6:
  }
  return (char)a4;
}

- (id)encryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[_SFAESKeySpecifier alloc] initWithBitSize:2];
  uint64_t v8 = [[_SFAuthenticatedEncryptionOperation alloc] initWithKeySpecifier:v7];
  int v9 = [(SPAKE2Common *)self getKey];
  uint64_t v10 = [(SPAKE2Common *)self salt];
  uint64_t v11 = [(_SFAuthenticatedEncryptionOperation *)v8 encrypt:v6 withKey:v9 additionalAuthenticatedData:v10 error:a4];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:a4];
    uint64_t v13 = v12;
    if (v12)
    {
      if (a4) {
        *a4 = 0;
      }
      id v14 = v12;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)decryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[_SFAESKeySpecifier alloc] initWithBitSize:2];
  uint64_t v8 = [[_SFAuthenticatedEncryptionOperation alloc] initWithKeySpecifier:v7];
  int v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  if (v9)
  {
    uint64_t v10 = [(SPAKE2Common *)self getKey];
    uint64_t v11 = [(SPAKE2Common *)self salt];
    id v12 = [(_SFAuthenticatedEncryptionOperation *)v8 decrypt:v9 withKey:v10 additionalAuthenticatedData:v11 error:a4];

    if (v12)
    {
      if (a4) {
        *a4 = 0;
      }
      id v13 = v12;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (ccrng_state)rng
{
  return self->_rng;
}

- (void)setRng:(ccrng_state *)a3
{
  self->_rng = a3;
}

- (ccspake_ctx)spake_ctx
{
  return self->_spake_ctx;
}

- (void)setSpake_ctx:(ccspake_ctx *)a3
{
  self->_spake_ctx = a3;
}

- (NSString)code
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCode:(id)a3
{
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSalt:(id)a3
{
}

- (ccspake_cp)cp
{
  return self->_cp;
}

- (void)setCp:(ccspake_cp *)a3
{
  self->_cp = a3;
}

- (ccspake_mac)mac
{
  return self->_mac;
}

- (void)setMac:(ccspake_mac *)a3
{
  self->_mac = a3;
}

- (NSData)w0
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setW0:(id)a3
{
}

- (NSData)w1
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setW1:(id)a3
{
}

- (unint64_t)w_size
{
  return self->_w_size;
}

- (void)setW_size:(unint64_t)a3
{
  self->_w_size = a3;
}

- (unint64_t)point_size
{
  return self->_point_size;
}

- (void)setPoint_size:(unint64_t)a3
{
  self->_point_size = a3;
}

- (_SFAESKey)session_key
{
  return (_SFAESKey *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSession_key:(id)a3
{
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session_key, 0);
  objc_storeStrong((id *)&self->_w1, 0);
  objc_storeStrong((id *)&self->_w0, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end