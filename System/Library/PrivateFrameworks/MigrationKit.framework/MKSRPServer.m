@interface MKSRPServer
+ (id)generateRandomPassword;
- (MKSRPServer)init;
- (MKSRPServer)initWithPassword:(id)a3;
- (MKSRPServer)initWithUsername:(id)a3 password:(id)a4;
- (NSData)proofOfMatch;
- (NSData)pubkey;
- (NSData)salt;
- (NSData)sharedKey;
- (NSString)password;
- (NSString)username;
- (id)_generateSharedKey:(id)a3 proofOfMatch:(id)a4;
- (id)generateSharedKey:(id)a3 proofOfMatch:(id)a4;
- (void)_generateSalt:(id *)a3 pubkey:(id *)a4;
- (void)cleanup;
- (void)cleanupSRP;
- (void)dealloc;
- (void)generateSalt:(id *)a3 pubkey:(id *)a4;
- (void)setPassword:(id)a3;
- (void)setProofOfMatch:(id)a3;
- (void)setPubkey:(id)a3;
- (void)setSalt:(id)a3;
- (void)setSharedKey:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation MKSRPServer

- (MKSRPServer)init
{
  v3 = +[MKSRPServer generateRandomPassword];
  v4 = [(MKSRPServer *)self initWithUsername:0x26DF6D250 password:v3];

  return v4;
}

- (MKSRPServer)initWithPassword:(id)a3
{
  return [(MKSRPServer *)self initWithUsername:0x26DF6D250 password:a3];
}

- (MKSRPServer)initWithUsername:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MKSRPServer;
  v8 = [(MKSRPServer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MKSRPServer *)v8 setUsername:v6];
    [(MKSRPServer *)v9 setPassword:v7];
  }

  return v9;
}

+ (id)generateRandomPassword
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%06u", arc4random_uniform(0xF423Fu));
}

- (void)dealloc
{
  [(MKSRPServer *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MKSRPServer;
  [(MKSRPServer *)&v3 dealloc];
}

- (void)cleanup
{
  [(MKSRPServer *)self cleanupSRP];
  [(MKSRPServer *)self setUsername:0];
  [(MKSRPServer *)self setPassword:0];
}

- (void)cleanupSRP
{
  if (self->_session) {
    SRP_free();
  }
  self->_session = 0;
  [(MKSRPServer *)self setSalt:0];
  [(MKSRPServer *)self setPubkey:0];
  [(MKSRPServer *)self setProofOfMatch:0];
}

- (NSData)sharedKey
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (void *)[(NSData *)v2->_sharedKey copy];
  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (void)generateSalt:(id *)a3 pubkey:(id *)a4
{
  obj = self;
  objc_sync_enter(obj);
  [(MKSRPServer *)obj _generateSalt:a3 pubkey:a4];
  objc_sync_exit(obj);
}

- (void)_generateSalt:(id *)a3 pubkey:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(MKSRPServer *)self cleanupSRP];
  [(MKSRPServer *)self setSharedKey:0];
  if (![(NSString *)self->_username length] || ![(NSString *)self->_password length])
  {
    v8 = [MKError alloc];
    v9 = @"could not continue to genegate salt because username or password was not configured.";
    uint64_t v10 = 0;
LABEL_16:
    v13 = -[MKError initWithDomain:code:message:](v8, "initWithDomain:code:message:", 0x26DF6D230, v10, v9, v17);
    v14 = +[MKLog log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MKSRPServer _generateSalt:pubkey:]((uint64_t)self, v13);
    }

    [(MKSRPServer *)self cleanupSRP];
    goto LABEL_19;
  }
  SRP6a_server_method();
  id v7 = (srp_st *)SRP_new();
  self->_session = v7;
  if (!v7)
  {
    v8 = [MKError alloc];
    v9 = @"could not initialize SRP because there was an underlying issue occurred unexpectedly.";
    goto LABEL_8;
  }
  [(NSString *)self->_username UTF8String];
  if (SRP_set_username())
  {
    v8 = [MKError alloc];
    v9 = @"could not set username because there was an underlying issue occurred unexpectedly.";
LABEL_8:
    uint64_t v10 = 1;
    goto LABEL_16;
  }
  if (CCRandomGenerateBytes(bytes, 0x10uLL))
  {
    objc_super v11 = @"could not generate a salt because there was an underlying issue occurred unexpectedly.";
LABEL_15:
    v8 = [MKError alloc];
    uint64_t v10 = 1;
    v9 = v11;
    goto LABEL_16;
  }
  v12 = [MEMORY[0x263EFF8F8] dataWithBytes:bytes length:16];
  [(MKSRPServer *)self setSalt:v12];

  if (SRP_set_params())
  {
    objc_super v11 = @"could not set parameters because there was an underlying issue occurred unexpectedly.";
    goto LABEL_15;
  }
  [(NSString *)self->_password UTF8String];
  if (SRP_set_auth_password())
  {
    objc_super v11 = @"could not set password because there was an underlying issue occurred unexpectedly.";
    goto LABEL_15;
  }
  uint64_t v17 = 0;
  if (SRP_gen_pub())
  {
    v8 = [MKError alloc];
    v9 = @"could not generate a public key because there was an underlying issue occurred unexpectedly.";
    goto LABEL_8;
  }
  v15 = [MEMORY[0x263EFF8F8] dataWithBytes:MEMORY[0] length:MEMORY[8]];
  [(MKSRPServer *)self setPubkey:v15];

  cstr_free();
  v16 = objc_alloc_init(MKHex);
  v13 = (MKError *)v16;
  if (a3)
  {
    *a3 = [(MKHex *)v16 dataToHex:self->_salt];
  }
  if (a4)
  {
    *a4 = [(MKError *)v13 dataToHex:self->_pubkey];
  }
LABEL_19:
}

- (id)generateSharedKey:(id)a3 proofOfMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [(MKSRPServer *)v8 _generateSharedKey:v6 proofOfMatch:v7];
  objc_sync_exit(v8);

  return v9;
}

- (id)_generateSharedKey:(id)a3 proofOfMatch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(MKHex);
  id v9 = [(MKHex *)v8 hexToData:v7];

  id v10 = [(MKHex *)v8 hexToData:v6];

  if (!self->_session)
  {
    objc_super v11 = [MKError alloc];
    v12 = @"could not generate a public key because there was an underlying issue occurred unexpectedly.";
    uint64_t v13 = 2;
    goto LABEL_5;
  }
  id v9 = v9;
  [v9 bytes];
  [v9 length];
  if (SRP_compute_key() || !MEMORY[8])
  {
    objc_super v11 = [MKError alloc];
    v12 = @"could not compute a shared key because there was an underlying issue occurred unexpectedly.";
    uint64_t v13 = 1;
LABEL_5:
    v14 = [(MKError *)v11 initWithDomain:0x26DF6D230 code:v13 message:v12];
    goto LABEL_6;
  }
  v18 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", MEMORY[0]);
  cstr_free();
  id v10 = v10;
  [v10 bytes];
  [v10 length];
  if (SRP_verify())
  {
    uint64_t v19 = [MKError alloc];
    v20 = @"could not generate proof of match because there was an underlying issue occurred unexpectedly or the client might send an invalid parameter.";
  }
  else
  {
    uint64_t v22 = 0;
    if (!SRP_respond())
    {
      v21 = [MEMORY[0x263EFF8F8] dataWithBytes:MEMORY[0] length:MEMORY[8]];
      [(MKSRPServer *)self setProofOfMatch:v21];

      cstr_free();
      [(MKSRPServer *)self setSharedKey:v18];

      v16 = [(MKHex *)v8 dataToHex:self->_sharedKey];
      goto LABEL_9;
    }
    uint64_t v19 = [MKError alloc];
    v20 = @"could not verify proof of match because there was an underlying issue occurred unexpectedly or the client might send an invalid parameter";
  }
  v14 = -[MKError initWithDomain:code:message:](v19, "initWithDomain:code:message:", 0x26DF6D230, 0, v20, v22);

LABEL_6:
  [(MKSRPServer *)self setSharedKey:0];
  v15 = +[MKLog log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MKSRPServer _generateSalt:pubkey:]((uint64_t)self, v14);
  }

  v16 = 0;
LABEL_9:
  [(MKSRPServer *)self cleanupSRP];

  return v16;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
}

- (NSData)pubkey
{
  return self->_pubkey;
}

- (void)setPubkey:(id)a3
{
}

- (void)setSharedKey:(id)a3
{
}

- (NSData)proofOfMatch
{
  return self->_proofOfMatch;
}

- (void)setProofOfMatch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proofOfMatch, 0);
  objc_storeStrong((id *)&self->_sharedKey, 0);
  objc_storeStrong((id *)&self->_pubkey, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)_generateSalt:(uint64_t)a1 pubkey:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 message];
  v4 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22BFAC000, v5, v6, "%@ %@ domain=%@, code=%ld", v7, v8, v9, v10, v11);
}

@end