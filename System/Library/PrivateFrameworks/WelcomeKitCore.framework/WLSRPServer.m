@interface WLSRPServer
- (BOOL)didReceiveClientPublicKey_A:(id)a3 proofOfMatch_M:(id)a4;
- (BOOL)isHmacData:(id)a3 validForData:(id)a4;
- (NSData)hashOfProofOfMatch_HAMK;
- (NSData)salt_s;
- (NSData)serverPublicKey_B;
- (NSData)sharedKey_K;
- (WLSRPServer)initWithUsername:(id)a3 password:(id)a4;
- (id)hmacDataForData:(id)a3;
- (void)dealloc;
@end

@implementation WLSRPServer

- (WLSRPServer)initWithUsername:(id)a3 password:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WLSRPServer;
  v8 = [(WLSRPServer *)&v15 init];
  if (v8)
  {
    SRP6a_server_method();
    uint64_t v9 = SRP_new();
    v8->_session = (srp_st *)v9;
    if (v9)
    {
      [v6 UTF8String];
      if (!SRP_set_username() && !CCRandomGenerateBytes(bytes, 0x10uLL))
      {
        uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:bytes length:16];
        salt_s = v8->_salt_s;
        v8->_salt_s = (NSData *)v10;

        if (!SRP_set_params())
        {
          [v7 UTF8String];
          if (!SRP_set_auth_password() && !SRP_gen_pub())
          {
            uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:MEMORY[0] length:MEMORY[8]];
            serverPublicKey_B = v8->_serverPublicKey_B;
            v8->_serverPublicKey_B = (NSData *)v13;

            cstr_free();
            goto LABEL_10;
          }
        }
      }
      SRP_free();
      v8->_session = 0;
    }

    v8 = 0;
  }
LABEL_10:

  return v8;
}

- (void)dealloc
{
  SRP_free();
  self->_session = 0;
  v3.receiver = self;
  v3.super_class = (Class)WLSRPServer;
  [(WLSRPServer *)&v3 dealloc];
}

- (BOOL)didReceiveClientPublicKey_A:(id)a3 proofOfMatch_M:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 bytes];
  [v7 length];

  if (SRP_compute_key()) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = MEMORY[8] != 0;
  }
  v18 = [NSNumber numberWithBool:v8];
  _WLLog();

  if (!v8) {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", MEMORY[0], MEMORY[8], v18);
  uint64_t v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  sharedKey_K = self->_sharedKey_K;
  self->_sharedKey_K = v9;

  v19 = [(NSData *)self->_sharedKey_K wl_hexEncodedString];
  _WLLog();

  cstr_free();
  id v11 = v6;
  objc_msgSend(v11, "bytes", v19);
  [v11 length];
  int v12 = SRP_verify();
  v20 = [NSNumber numberWithBool:v12 == 0];
  _WLLog();

  if (!v12)
  {
    int v15 = SRP_respond();
    BOOL v13 = v15 == 0;
    v21 = objc_msgSend(NSNumber, "numberWithBool:", v13, v20);
    _WLLog();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", MEMORY[0], MEMORY[8], v21);
      v16 = (NSData *)objc_claimAutoreleasedReturnValue();
      hashOfProofOfMatch_HAMK = self->_hashOfProofOfMatch_HAMK;
      self->_hashOfProofOfMatch_HAMK = v16;

      cstr_free();
    }
  }
  else
  {
LABEL_6:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)hmacDataForData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF8F8], "wl_hmacSHA256DataForData:key:", a3, self->_sharedKey_K);
}

- (BOOL)isHmacData:(id)a3 validForData:(id)a4
{
  id v6 = a3;
  id v7 = [(WLSRPServer *)self hmacDataForData:a4];
  uint64_t v10 = objc_msgSend(v6, "wl_hexEncodedString");
  _WLLog();

  id v11 = objc_msgSend(v7, "wl_hexEncodedString", v10);
  _WLLog();

  char v8 = objc_msgSend(v7, "isEqualToData:", v6, v11);
  return v8;
}

- (NSData)salt_s
{
  return self->_salt_s;
}

- (NSData)serverPublicKey_B
{
  return self->_serverPublicKey_B;
}

- (NSData)sharedKey_K
{
  return self->_sharedKey_K;
}

- (NSData)hashOfProofOfMatch_HAMK
{
  return self->_hashOfProofOfMatch_HAMK;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashOfProofOfMatch_HAMK, 0);
  objc_storeStrong((id *)&self->_sharedKey_K, 0);
  objc_storeStrong((id *)&self->_serverPublicKey_B, 0);
  objc_storeStrong((id *)&self->_salt_s, 0);
}

@end