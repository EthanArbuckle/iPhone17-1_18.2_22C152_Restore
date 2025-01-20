@interface MFCRAM_MD5Authenticator
- (id)responseForServerData:(id)a3;
@end

@implementation MFCRAM_MD5Authenticator

- (id)responseForServerData:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(ECSASLAuthenticator *)self account];
    v6 = [v5 username];
    v7 = [v6 dataUsingEncoding:4];

    v8 = [(ECSASLAuthenticator *)self account];
    v9 = [v8 password];
    v10 = [v9 dataUsingEncoding:4];

    v11 = 0;
    if (v7 && v10)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)((char *)v22 + 12) = v12;
      c[11] = v12;
      v22[0] = v12;
      c[9] = v12;
      c[10] = v12;
      c[8] = v12;
      c[6] = v12;
      c[7] = v12;
      c[4] = v12;
      c[5] = v12;
      c[2] = v12;
      c[3] = v12;
      c[0] = v12;
      c[1] = v12;
      UInt8 bytes = 32;
      Mutable = CFDataCreateMutable(0, [v7 length] + 33);
      id v14 = v7;
      CFDataAppendBytes(Mutable, (const UInt8 *)[v14 bytes], objc_msgSend(v14, "length"));
      CFDataAppendBytes(Mutable, &bytes, 1);
      MF_MD5HMAC_Init();
      id v15 = v4;
      CC_MD5_Update((CC_MD5_CTX *)c, (const void *)[v15 bytes], objc_msgSend(v15, "length"));

      v16 = Mutable;
      v23[0] = 0xAAAAAAAAAAAAAAAALL;
      v23[1] = 0xAAAAAAAAAAAAAAAALL;
      MF_MD5HMAC_Output();
      v11 = v16;
      for (uint64_t i = 0; i != 16; ++i)
      {
        memset(v20, 170, sizeof(v20));
        __snprintf_chk(v20, 3uLL, 0, 3uLL, "%02x", *((unsigned __int8 *)v23 + i));
        [(__CFData *)v11 appendBytes:v20 length:2];
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end