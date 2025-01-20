@interface MKSRPClient
- (MKSRPClient)initWithPassword:(id)a3;
- (NSString)password;
- (NSString)username;
- (void)computeSharedKey:(id *)a3 clientPublicKey:(id *)a4 proofOfMatch:(id *)a5 FromSalt:(id)a6 serverPublicKey:(id)a7;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation MKSRPClient

- (MKSRPClient)initWithPassword:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKSRPClient;
  v5 = [(MKSRPClient *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MKSRPClient *)v5 setUsername:0x26DF6D250];
    [(MKSRPClient *)v6 setPassword:v4];
  }

  return v6;
}

- (void)computeSharedKey:(id *)a3 clientPublicKey:(id *)a4 proofOfMatch:(id *)a5 FromSalt:(id)a6 serverPublicKey:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  if (![(NSString *)self->_username length])
  {
    v19 = [MKError alloc];
    v20 = @"could not initialize SRP because username was invalid.";
LABEL_14:
    v21 = [(MKError *)v19 initWithDomain:0x26DF6D230 code:0 message:v20];
    v22 = 0;
    v14 = 0;
LABEL_15:
    v23 = 0;
    v24 = 0;
    goto LABEL_16;
  }
  if (![(NSString *)self->_password length])
  {
    v19 = [MKError alloc];
    v20 = @"could not initialize SRP because password was invalid.";
    goto LABEL_14;
  }
  if (![v12 length])
  {
    v19 = [MKError alloc];
    v20 = @"could not initialize SRP because salt was invalid.";
    goto LABEL_14;
  }
  if (![v13 length])
  {
    v19 = [MKError alloc];
    v20 = @"could not initialize SRP because server pubkey was invalid.";
    goto LABEL_14;
  }
  v14 = objc_alloc_init(MKHex);
  v15 = [(MKHex *)v14 hexToData:v12];
  if (![v15 length])
  {
    v21 = [[MKError alloc] initWithDomain:0x26DF6D230 code:0 message:@"could not initialize SRP because salt was invalid."];
LABEL_24:

    v22 = 0;
    goto LABEL_15;
  }
  v16 = [(MKHex *)v14 hexToData:v13];
  if (![v16 length])
  {
    v26 = [MKError alloc];
    v27 = @"could not initialize SRP because server pubkey was invalid.";
    uint64_t v28 = 0;
LABEL_23:
    v21 = [(MKError *)v26 initWithDomain:0x26DF6D230 code:v28 message:v27];

    goto LABEL_24;
  }
  SRP6a_client_method();
  if (!SRP_new())
  {
    v26 = [MKError alloc];
    v27 = @"could not initialize SRP because there was an underlying issue occurred unexpectedly.";
    uint64_t v28 = 1;
    goto LABEL_23;
  }
  id v34 = v16;
  [(NSString *)self->_username UTF8String];
  v31 = a5;
  v33 = v15;
  if (SRP_set_username())
  {
    v17 = [MKError alloc];
    v18 = @"could not set username because there was an underlying issue occurred unexpectedly.";
LABEL_31:
    v21 = -[MKError initWithDomain:code:message:](v17, "initWithDomain:code:message:", 0x26DF6D230, 1, v18, a5);
    v22 = 0;
    v23 = 0;
    v24 = 0;
LABEL_32:
    int v32 = 0;
    goto LABEL_33;
  }
  id v29 = v15;
  [v29 bytes];
  [v29 length];
  if (SRP_set_params())
  {
    v17 = [MKError alloc];
    v18 = @"could not set params because there was an underlying issue occurred unexpectedly.";
    goto LABEL_31;
  }
  [(NSString *)self->_password UTF8String];
  if (SRP_set_auth_password())
  {
    v17 = [MKError alloc];
    v18 = @"could not set password because there was an underlying issue occurred unexpectedly.";
    goto LABEL_31;
  }
  if (SRP_gen_pub() || !MEMORY[8])
  {
    v17 = [MKError alloc];
    v18 = @"could not generate client pubkey there was an underlying issue occurred unexpectedly.";
    goto LABEL_31;
  }
  v24 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", MEMORY[0]);
  cstr_free();
  id v30 = v34;
  [v30 bytes];
  [v30 length];
  if (SRP_compute_key() || !MEMORY[8])
  {
    v21 = [[MKError alloc] initWithDomain:0x26DF6D230 code:1 message:@"could not compute shared key there was an underlying issue occurred unexpectedly."];
    v22 = 0;
    v23 = 0;
    goto LABEL_32;
  }
  v23 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", MEMORY[0]);
  cstr_free();
  if (SRP_respond() || !MEMORY[8])
  {
    v21 = [[MKError alloc] initWithDomain:0x26DF6D230 code:1 message:@"could not compute proof of match there was an underlying issue occurred unexpectedly."];
    v22 = 0;
    goto LABEL_32;
  }
  v22 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", MEMORY[0]);
  cstr_free();
  v21 = 0;
  int v32 = 1;
LABEL_33:

  SRP_free();
  if (v32)
  {
    if (a3)
    {
      *a3 = [(MKHex *)v14 dataToHex:v23];
    }
    if (a4)
    {
      *a4 = [(MKHex *)v14 dataToHex:v24];
    }
    if (v31)
    {
      id *v31 = [(MKHex *)v14 dataToHex:v22];
    }
    goto LABEL_19;
  }
LABEL_16:
  v25 = +[MKLog log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[MKSRPClient computeSharedKey:clientPublicKey:proofOfMatch:FromSalt:serverPublicKey:]((uint64_t)self, v21, v25);
  }

LABEL_19:
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)computeSharedKey:(NSObject *)a3 clientPublicKey:proofOfMatch:FromSalt:serverPublicKey:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v6 = [a2 message];
  v7 = [a2 domain];
  int v8 = 138413058;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  __int16 v14 = 2048;
  uint64_t v15 = [a2 code];
  _os_log_error_impl(&dword_22BFAC000, a3, OS_LOG_TYPE_ERROR, "%@ %@ domain=%@, code=%ld", (uint8_t *)&v8, 0x2Au);
}

@end