@interface MFCRAM_MD5Authenticator
- (id)responseForServerData:(id)a3;
@end

@implementation MFCRAM_MD5Authenticator

- (id)responseForServerData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v5 = objc_msgSend((id)objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "username"), "dataUsingEncoding:", 4);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "password"), "dataUsingEncoding:", 4);
  id result = 0;
  if (v5 && v6)
  {
    memset(c, 0, 220);
    UInt8 bytes = 32;
    Mutable = CFDataCreateMutable(0, [v5 length] + 33);
    CFDataAppendBytes(Mutable, (const UInt8 *)[v5 bytes], objc_msgSend(v5, "length"));
    CFDataAppendBytes(Mutable, &bytes, 1);
    MF_MD5HMAC_Init();
    CC_MD5_Update((CC_MD5_CTX *)c, (const void *)[a3 bytes], objc_msgSend(a3, "length"));
    MF_MD5HMAC_Output();
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = v9 + 1;
      snprintf(__str, 3uLL, "%02x", *((unsigned __int8 *)&c[116] + v9));
      [(__CFData *)Mutable appendBytes:__str length:2];
      uint64_t v9 = v10;
    }
    while (v10 != 16);
    return Mutable;
  }
  return result;
}

@end